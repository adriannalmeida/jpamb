#!/usr/bin/env python3
"""A very stupid syntactic analysis, that only checks for assertion errors."""

import logging
import re
import sys
from pathlib import Path

import jpamb


def main():
    absmethodid = jpamb.getmethodid(
        "syntaxer",
        "1.0",
        "sim",
        ["syntactic", "python"],
        for_science=True,
    )

    log = logging
    log.basicConfig(level=logging.DEBUG)
    log.debug(Path.cwd())

    suite, _ = jpamb.setup()

    srcfile = suite.sourcefile(absmethodid.classname).relative_to(Path.cwd())

    with open(srcfile, "r") as f:
        log.debug("parse sourcefile %s", srcfile)
        content = f.read()

    res = re.search(rf".* {absmethodid.methodid.name}\(.*\)", content)

    if not res:
        log.error("Could not find method")
        sys.exit(1)

    log.debug(f"found {res}")
    rest = content[res.end(0) : -1]

    assert_or_end = re.search(r"assert|(^\s*})", rest, re.MULTILINE)
    #divide = re.search(r"\/*0", rest, re.MULTILINE)


    if not assert_or_end:
        log.error("Could not end of method or assert")
        log.error(rest)
        sys.exit(1)
    
    #divide_found = divide is not None

    log.debug(f"found {assert_or_end}")
    assert_found = assert_or_end.group(0) == "assert"

    if assert_found:
        log.debug("Found assertion")
        print("assertion error;found")
    #elif divide_found:
    #    log.debug("Found divide by zero")
    #    print("divide by zero;found")
    
    else:
        log.debug("No assertion")
        print("assertion error;not-found")
        #print("divide by zero;not-found")



    divide_or_end = re.search(r"/|(^\s*})", rest, re.MULTILINE)

    if not divide_or_end:
        log.error("Could not find end of method or divide")
        log.error(rest)
        sys.exit(1)

    log.debug(f"found divide {divide_or_end}")
    divide_found = divide_or_end.group(0) == "/"

    if divide_found:
        log.debug("Found divide by zero")
        print("divide by zero;found-div")
    else:
        log.debug("No divide by zero")
        print("divide by zero;not-found-div")




    out_of_bounds = re.search(r"arr|(^\s*})", rest, re.MULTILINE)
    
    if not out_of_bounds:
        log.error("Could not find out of bounds")
        log.error(rest)
        sys.exit(1)
    
    log.debug(f"found out of bounds {out_of_bounds}")
    out_found = out_of_bounds.group(0) == "a"
    #out_found = out_of_bounds.group(0) == "a" or out_of_bounds.group(1) == "array" or out_of_bounds.group(2) == "["
    
    if out_found:
        log.debug("Found out of bounds")
        print("out of bounds;found")
    else:
        log.debug("No out of bounds")
        print("out of bounds;not-found")





    null_pointer = re.search(r"null|(^\s*})", rest, re.MULTILINE)
    if not null_pointer:
        log.error("Could not find null pointer")
        log.error(rest)
        sys.exit(1)
    log.debug(f"found null pointer {null_pointer}")
    null_found = null_pointer.group(0) == "null"

     
    if null_found:
        log.debug("Found null pointer")
        print("null pointer;found-null")
    else:
        log.debug("No null pointer")
        print("null pointer;not-found-null")

    for q in jpamb.QUERIES:
            if q != "assertion error" and q != "divide by zero" and q != "out of bounds" and q!= "null pointer":
                print(f"{q};skip")