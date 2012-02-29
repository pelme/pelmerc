#!/usr/bin/env python

import os
import sys


def get_file_renames(filenames, start_number):
    """
    Yields two tuples of (old name, new name)
    """

    for filename in filenames:
        number, name = filename.split('_', 1)
        number = int(number)

        if number >= start_number:
            yield (filename, '%04d_%s' % (number + 1, name))


def main():
    try:
        start_number = int(sys.argv[1])
    except (ValueError, TypeError, IndexError):
        print 'The first argument must be the starting number to rename!'
        return

    if len(sys.argv) >= 3:
        path = sys.argv[2]
    else:
        path = '.'

    full_path = os.path.abspath(path)
    filenames = (f
                 for f in os.listdir(full_path)
                 if (f.endswith('.py') and
                     not f.startswith('.') and
                     not f.startswith('__init__')))

    for old_name, new_name in get_file_renames(filenames, start_number):
        old_name = os.path.join(full_path, old_name)
        new_name = os.path.join(full_path, new_name)
        os.rename(old_name, new_name)

main()
