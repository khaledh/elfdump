# elfdump
This is a quick and and dirty utility to dump ELF file information written in Nim (similar to `readelf` and `objdump`). I wrote it to learn Nim, so don't expect much.

I leverage a couple of amazing libraries:
- [`binarylang`](https://github.com/sealmove/binarylang) to write the parser declaratively
- [`docopt`](https://github.com/docopt/docopt.nim) to parse the command line args

Example:

```
$ elfdump foo
ELF Header
  Class:                 64-bit
  Endianness:            Little-endian
  Version:               1
  OS/ABI:                UNIX System V
  ABI Version:           0
  Type:                  DYN - Shared Object
  Machine:               AMD x86-64
  Entry Point:           0x1000
  Flags:                 0x0
  Header Size:           64 (bytes)

  Program Headers
    Offset:              64 (bytes)
    Count:               13
    Entry Size:          56 (bytes)

  Section Headers
    Offset:              12784 (bytes)
    Count:               15
    Entry Size:          64 (bytes)
    String Table Index:  14

Program Segment Headers
       Type            Offset     Virt Addr          Phys Addr          File Size  Mem Size   Align      Flags
   0 | PHDR          |       64 |               40 |               40 |      728 |      728 |        8 | {READ}
   1 | INTERP        |      792 |              318 |              318 |       28 |       28 |        1 | {READ}
   2 | LOAD          |        0 |                0 |                0 |      953 |      953 |     4096 | {READ}
   3 | LOAD          |     4096 |             1000 |             1000 |       11 |       11 |     4096 | {EXEC, READ}
   4 | LOAD          |     8192 |             2000 |             2000 |       80 |       80 |     4096 | {READ}
   5 | LOAD          |    12064 |             3F20 |             3F20 |      224 |      224 |     4096 | {WRITE, READ}
   6 | DYNAMIC       |    12064 |             3F20 |             3F20 |      224 |      224 |        8 | {WRITE, READ}
   7 | NOTE          |      824 |              338 |              338 |       32 |       32 |        8 | {READ}
   8 | NOTE          |      856 |              358 |              358 |       36 |       36 |        4 | {READ}
   9 | GNU_PROPERTY  |      824 |              338 |              338 |       32 |       32 |        8 | {READ}
  10 | GNU_EH_FRAME  |     8192 |             2000 |             2000 |       20 |       20 |        4 | {READ}
  11 | GNU_STACK     |        0 |                0 |                0 |        0 |        0 |       16 | {WRITE, READ}
  12 | GNU_REL_RO    |    12064 |             3F20 |             3F20 |      224 |      224 |        1 | {READ}

Section Headers
       Name                 Type            Offset     Virt Addr           Size       Align     Entry  Link   Info   Flags
                                                                                                Size
   0 |                    | NULL          |        0 |                0 |        0 |        0 |    0 |    0 |    0 | {}
   1 | .interp            | PROG_BITS     |      792 |              318 |       28 |        1 |    0 |    0 |    0 | {ALLOC}
   2 | .note.gnu.property | NOTE          |      824 |              338 |       32 |        8 |    0 |    0 |    0 | {ALLOC}
   3 | .note.gnu.build-id | NOTE          |      856 |              358 |       36 |        4 |    0 |    0 |    0 | {ALLOC}
   4 | .gnu.hash          | GNU_HASH      |      896 |              380 |       28 |        8 |    0 |    5 |    0 | {ALLOC}
   5 | .dynsym            | DYN_SYM       |      928 |              3A0 |       24 |        8 |   24 |    6 |    1 | {ALLOC}
   6 | .dynstr            | STR_TAB       |      952 |              3B8 |        1 |        1 |    0 |    0 |    0 | {ALLOC}
   7 | .text              | PROG_BITS     |     4096 |             1000 |       11 |        1 |    0 |    0 |    0 | {ALLOC, EXEC}
   8 | .eh_frame_hdr      | PROG_BITS     |     8192 |             2000 |       20 |        4 |    0 |    0 |    0 | {ALLOC}
   9 | .eh_frame          | PROG_BITS     |     8216 |             2018 |       56 |        8 |    0 |    0 |    0 | {ALLOC}
  10 | .dynamic           | DYNAMIC       |    12064 |             3F20 |      224 |        8 |   16 |    6 |    0 | {WRITE, ALLOC}
  11 | .comment           | PROG_BITS     |    12288 |                0 |       37 |        1 |    1 |    0 |    0 | {MERGE, STRINGS}
  12 | .symtab            | SYM_TAB       |    12328 |                0 |      240 |        8 |   24 |   13 |    5 | {}
  13 | .strtab            | STR_TAB       |    12568 |                0 |       63 |        1 |    0 |    0 |    0 | {}
  14 | .shstrtab          | STR_TAB       |    12631 |                0 |      147 |        1 |    0 |    0 |    0 | {}
```
