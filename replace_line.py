#!/usr/bin/env python

from os.path import abspath, dirname
from tzutil.dirreplace import dirreplace

FROM_STRING = """
com.example.tv_6du
com.example.tv6du
tv6du
"""

TO_STRING = """
tv.6du
tv.6du
6du
"""

dirreplace(
    dirname(abspath(__file__)),
    FROM_STRING,
    TO_STRING,
)
