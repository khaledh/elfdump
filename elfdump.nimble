# Package

version       = "0.1.0"
author        = "Khaled Hammouda"
description   = "ELF Dump Utility"
license       = "MIT"
srcDir        = "."
bin           = @["elfdump"]


# Dependencies

requires "nim >= 1.4.8"
requires "binarylang >= 0.5.1"
requires "docopt >= 0.6.8"