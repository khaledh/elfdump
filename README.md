# elfdump
This is a quick and and dirty utility to dump ELF file information written in Nim (similar to `readelf` and `objdump`). I wrote it to learn Nim, so don't expect much.

I leverage a couple of amazing libraries:
- [`binarylang`](https://github.com/sealmove/binarylang) to write the parser declaratively
- [`docopt`](https://github.com/docopt/docopt.nim) to parse the command line args

## Installation

- Install Nim: https://nim-lang.org/install.html
- `git clone https://github.com/khaledh/elfdump`
- `cd elfdump`
- `nimble install`

## Usage

```
./elfdump
ELF Dump

  elfdump <filename>
  elfdump (-h | --help)
  elfdump (-v | --version)

Options:
  -h --help     Show this screen.
  -v --version  Show version.
```

Example:

```
$ ./elfdump /bin/ls
ELF Header
  Class:                 64-bit
  Endianness:            Little-endian
  Version:               1
  OS/ABI:                UNIX System V
  ABI Version:           0
  Type:                  DYN - Shared Object
  Machine:               AMD x86-64
  Entry Point:           0x6810
  Flags:                 0x0
  Header Size:           64 (bytes)

  Program Headers
    Offset:              64 (bytes)
    Count:               13
    Entry Size:          56 (bytes)

  Section Headers
    Offset:              144408 (bytes)
    Count:               31
    Entry Size:          64 (bytes)
    String Table Index:  30

Program Segment Headers
       Type            Offset     Virt Addr          Phys Addr          File Size  Mem Size   Align      Flags
   0 | PHDR          |       64 |               40 |               40 |      728 |      728 |        8 | {READ}
   1 | INTERP        |      792 |              318 |              318 |       28 |       28 |        1 | {READ}
   2 | LOAD          |        0 |                0 |                0 |    13776 |    13776 |     4096 | {READ}
   3 | LOAD          |    16384 |             4000 |             4000 |    84945 |    84945 |     4096 | {EXEC, READ}
   4 | LOAD          |   102400 |            19000 |            19000 |    36664 |    36664 |     4096 | {READ}
   5 | LOAD          |   139216 |            22FD0 |            22FD0 |     4760 |     9608 |     4096 | {WRITE, READ}
   6 | DYNAMIC       |   141912 |            23A58 |            23A58 |      512 |      512 |        8 | {WRITE, READ}
   7 | NOTE          |      824 |              338 |              338 |       32 |       32 |        8 | {READ}
   8 | NOTE          |      856 |              358 |              358 |       68 |       68 |        4 | {READ}
   9 | GNU_PROPERTY  |      824 |              338 |              338 |       32 |       32 |        8 | {READ}
  10 | GNU_EH_FRAME  |   123684 |            1E324 |            1E324 |     2380 |     2380 |        4 | {READ}
  11 | GNU_STACK     |        0 |                0 |                0 |        0 |        0 |       16 | {WRITE, READ}
  12 | GNU_REL_RO    |   139216 |            22FD0 |            22FD0 |     4144 |     4144 |        1 | {READ}

Section Headers
       Name                 Type            Offset     Virt Addr           Size       Align     Entry  Link   Info   Flags
                                                                                                Size
   0 |                    | NULL          |        0 |                0 |        0 |        0 |    0 |    0 |    0 | {}
   1 | .interp            | PROG_BITS     |      792 |              318 |       28 |        1 |    0 |    0 |    0 | {ALLOC}
   2 | .note.gnu.property | NOTE          |      824 |              338 |       32 |        8 |    0 |    0 |    0 | {ALLOC}
   3 | .note.gnu.build-id | NOTE          |      856 |              358 |       36 |        4 |    0 |    0 |    0 | {ALLOC}
   4 | .note.ABI-tag      | NOTE          |      892 |              37C |       32 |        4 |    0 |    0 |    0 | {ALLOC}
   5 | .gnu.hash          | GNU_HASH      |      928 |              3A0 |      172 |        8 |    0 |    6 |    0 | {ALLOC}
   6 | .dynsym            | DYN_SYM       |     1104 |              450 |     3072 |        8 |   24 |    7 |    1 | {ALLOC}
   7 | .dynstr            | STR_TAB       |     4176 |             1050 |     1477 |        1 |    0 |    0 |    0 | {ALLOC}
   8 | .gnu.version       | GNU_VER_SYM   |     5654 |             1616 |      256 |        2 |    2 |    6 |    0 | {ALLOC}
   9 | .gnu.version_r     | GNU_VER_NEED  |     5912 |             1718 |      160 |        8 |    0 |    7 |    2 | {ALLOC}
  10 | .rela.dyn          | REL_A         |     6072 |             17B8 |     5184 |        8 |   24 |    6 |    0 | {ALLOC}
  11 | .rela.plt          | REL_A         |    11256 |             2BF8 |     2520 |        8 |   24 |    6 |   25 | {ALLOC, INFO_LINK}
  12 | .init              | PROG_BITS     |    16384 |             4000 |       27 |        4 |    0 |    0 |    0 | {ALLOC, EXEC}
  13 | .plt               | PROG_BITS     |    16416 |             4020 |     1696 |       16 |   16 |    0 |    0 | {ALLOC, EXEC}
  14 | .plt.got           | PROG_BITS     |    18112 |             46C0 |       48 |       16 |   16 |    0 |    0 | {ALLOC, EXEC}
  15 | .plt.sec           | PROG_BITS     |    18160 |             46F0 |     1680 |       16 |   16 |    0 |    0 | {ALLOC, EXEC}
  16 | .text              | PROG_BITS     |    19840 |             4D80 |    81474 |       16 |    0 |    0 |    0 | {ALLOC, EXEC}
  17 | .fini              | PROG_BITS     |   101316 |            18BC4 |       13 |        4 |    0 |    0 |    0 | {ALLOC, EXEC}
  18 | .rodata            | PROG_BITS     |   102400 |            19000 |    21281 |       32 |    0 |    0 |    0 | {ALLOC}
  19 | .eh_frame_hdr      | PROG_BITS     |   123684 |            1E324 |     2380 |        4 |    0 |    0 |    0 | {ALLOC}
  20 | .eh_frame          | PROG_BITS     |   126064 |            1EC70 |    13000 |        8 |    0 |    0 |    0 | {ALLOC}
  21 | .init_array        | INIT_ARRAY    |   139216 |            22FD0 |        8 |        8 |    8 |    0 |    0 | {WRITE, ALLOC}
  22 | .fini_array        | FINI_ARRAY    |   139224 |            22FD8 |        8 |        8 |    8 |    0 |    0 | {WRITE, ALLOC}
  23 | .data.rel.ro       | PROG_BITS     |   139232 |            22FE0 |     2680 |       32 |    0 |    0 |    0 | {WRITE, ALLOC}
  24 | .dynamic           | DYNAMIC       |   141912 |            23A58 |      512 |        8 |   16 |    7 |    0 | {WRITE, ALLOC}
  25 | .got               | PROG_BITS     |   142424 |            23C58 |      920 |        8 |    8 |    0 |    0 | {WRITE, ALLOC}
  26 | .data              | PROG_BITS     |   143360 |            24000 |      616 |       32 |    0 |    0 |    0 | {WRITE, ALLOC}
  27 | .bss               | NO_BITS       |   143976 |            24280 |     4824 |       32 |    0 |    0 |    0 | {WRITE, ALLOC}
  28 | .gnu_debugaltlink  | PROG_BITS     |   143976 |                0 |       73 |        1 |    0 |    0 |    0 | {}
  29 | .gnu_debuglink     | PROG_BITS     |   144052 |                0 |       52 |        4 |    0 |    0 |    0 | {}
  30 | .shstrtab          | STR_TAB       |   144104 |                0 |      303 |        1 |    0 |    0 |    0 | {}
```
