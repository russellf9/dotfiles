#!/usr/bin/env python3

"""
Find missing translations in frontend code.

This looks at HTML pages, not JS. Errors in the latter must be detected via other means. The HTML pages can be in UTF-8
or Latin-1. The following issues are found:

* Missing translate attribute in elements with non-empty text nodes.
* Angular templates not filtering with `translate`.
* Angular templates not filtering with `oIi18n`.

Usage: `python3 ./find_missing_translate_attributes.py /Users/russellwenban/www.qudini.com/qudiniapp/public/shared/q-customer-progress-bar/q-customer-progress-bar.html`

"""

import os
import os.path
import re
from collections import deque
from html.parser import HTMLParser
from sys import argv

#
# Constants to configure the search.
#

TAGS_TO_CHECK = frozenset((
    'span',
    'div',
    'button',
    'h1',
    'h2',
    'h3',
    'h4',
    'h5',
    'p',
    'th',
    'td',
    'legend',
    'input',
    'label'))

ATTRIBUTES_TO_CHECK = frozenset((
    'placeholder',))

PATH_REGEXP_MATCHES_TO_SKIP = frozenset((
    '.*?node_modules.*?',
    '.*?bower_components.*?'))

FILE_REGEXP_MATCHES_TO_CHECK = frozenset((
    re.compile('.*\.html?\Z', re.DOTALL),))

ALLOWED_ENCODINGS = frozenset((
    'utf-8',
    'latin-1'))

INTERPOLATION_REGEXP_MATCHES_TO_SKIP = frozenset((
    re.compile('.*?\{\{.*?\}\}.*', re.DOTALL),
    re.compile('.*?[$#&]\{.*?\}.*', re.DOTALL)))


#
# The actual program; a user of the program should not need to modify anything
# underneath.
#


class MissingTranslationsFinder(HTMLParser):
    def __init__(self, file_path):
        super().__init__()
        self._file_path = file_path
        self.current = None
        self.matches = deque()

    def feed_from_initial_file(self):
        for encoding in ALLOWED_ENCODINGS:
            with open(self._file_path, encoding=encoding) as file_handle:
                try:
                    super().feed(file_handle.read())
                    break
                except UnicodeDecodeError:
                    pass
        else:
            raise Exception(
                "The file '{}' could not be decoded as either"
                "UTF-8 or latin-1.".format(self._file_path))

    @property
    def is_tag_to_check(self):
        if not self.current:
            return False
        return self.current['tag'] in TAGS_TO_CHECK

    @property
    def has_no_translate(self):
        return not any(
            True
            for key, value in self.current['attributes']
            if key == 'translate')

    @property
    def has_untranslated_attribute(self):
        if not self.current:
            return False

        def is_translated(attribute_value):
            match = re.match('.*?\{\{(.*?)}\}.*?', attribute_value)
            if not match:
                return False
            return (
                ('translate' in match.group(1)) or
                ('oIi18n' in match.group(1)))

        return any(
            not is_translated(value)
            for key, value in self.current['attributes']
            if (value is not None) and (key in ATTRIBUTES_TO_CHECK))

    def handle_starttag(self, tag: str, attributes):
        line, column = self.getpos()
        self.current = {
            'tag': tag,
            'attributes': attributes,
            'line': line,
            'column': column,
            'content': self.get_starttag_text()}

    def handle_data(self, data):
        textual = not re.match('^\s*\Z', data)

        not_interpolated = not any(
            re.match(regexp, data)
            for regexp in INTERPOLATION_REGEXP_MATCHES_TO_SKIP)

        if (
                    self.has_untranslated_attribute or (
                                    self.is_tag_to_check and
                                    textual and
                                not_interpolated and
                            self.has_no_translate)):
            self.current['text'] = data
            self.matches.append(self.current)

    def report(self):
        if self.matches:
            print("\nFile '{}'".format(self._file_path))
            for match in self.matches:
                print()
                print(
                    '    Line {}, Column {}'.format(
                        match['line'],
                        match['column']))
                print('        Tag      : {}'.format(match['tag']))
                print('        Text     : "{}"'.format(match['text']))
                print('        Contents : "{}"'.format(match['content']))


def report_file(file_path):
    parser = MissingTranslationsFinder(file_path)
    parser.feed_from_initial_file()
    parser.report()
    return len(parser.matches)


def main():
    paths = argv[1:]
    file_count = 0
    match_count = 0
    for path in paths:
        if os.path.isdir(path):
            for root, _, files in os.walk(path):

                path_to_skip_matches = (
                    re.match(regexp, root)
                    for regexp in PATH_REGEXP_MATCHES_TO_SKIP)

                if not any(path_to_skip_matches):
                    for name in files:

                        file_name_matches = (
                            re.match(regexp, name)
                            for regexp in FILE_REGEXP_MATCHES_TO_CHECK)

                        if any(file_name_matches):
                            file_path = os.path.join(root, name)
                            file_match_count = report_file(file_path)
                            match_count += file_match_count
                            if 0 < file_match_count:
                                file_count += 1
        else:
            report_file(path)
    print(
        "\n"
        "Non-translated files found: {}\n"
        "Non-translated tags found: {}\n".format(
            file_count,
            match_count))


if __name__ == '__main__':
    main()
