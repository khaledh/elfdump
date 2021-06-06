import strformat

import elfconsts
import elfparse

let elf_file = read_file("elfdump")
let elf_parsed = to_elf(elf_file)

echo "ELF Header"
echo fmt"  Class:                 {ElfClass(elf_parsed.eh.ident.class)}"
echo fmt"  Endianness:            {ElfData(elf_parsed.eh.ident.data)}"
echo fmt"  Version:               {elf_parsed.eh.ident.version}"
echo fmt"  OS/ABI:                {ElfOsAbi(elf_parsed.eh.ident.os_abi)}"
echo fmt"  ABI Version:           {elf_parsed.eh.ident.abi_version}"
echo fmt"  Type:                  {ElfFileType(elf_parsed.eh.typ)}"
echo fmt"  Machine:               {ElfMachine(elf_parsed.eh.machine)}"
echo fmt"  Entry Point:           0x{elf_parsed.eh.entry_point:X}"
echo fmt"  Flags:                 0x{elf_parsed.eh.flags:X}"
echo fmt"  Header Size:           {elf_parsed.eh.eh_size} (bytes)"
echo ""
echo fmt"  Program Headers"
echo fmt"    Offset:              {elf_parsed.eh.ph_offset} (bytes)"
echo fmt"    Count:               {elf_parsed.eh.ph_count}"
echo fmt"    Entry Size:          {elf_parsed.eh.ph_entry_size} (bytes)"
echo ""
echo fmt"  Section Headers"
echo fmt"    Offset:              {elf_parsed.eh.sh_offset} (bytes)"
echo fmt"    Count:               {elf_parsed.eh.sh_count}"
echo fmt"    Entry Size:          {elf_parsed.eh.sh_entry_size} (bytes)"
echo fmt"    String Table Index:  {elf_parsed.eh.sh_strtab_idx}"
echo ""
echo "Program Segment Headers"
echo fmt"       Type            Offset     Virt Addr          Phys Addr          File Size  Mem Size   Align      Flags"
for i, ph in elf_parsed.ph_table:
  echo fmt"  {i:>2} | ",
       fmt"{SegmentType(ph.typ):<13} | ",
       fmt"{ph.offset:>8} | ",
       fmt"{ph.v_addr:>16X} | ",
       fmt"{ph.p_addr:>16X} | ",
       fmt"{ph.file_size:>8} | ",
       fmt"{ph.memory_size:>8} | ",
       fmt"{ph.align:>8} | ",
       fmt"{cast[SegmentFlags](ph.flags)}"
echo ""
echo "Section Headers"
echo fmt"       Name                 Type            Offset     Virt Addr           Size       Align     Entry  Link   Info   Flags"
echo fmt"                                                                                                Size"
for i, sh in elf_parsed.sh_table:
  echo fmt"  {i:>2} | ",
    fmt"{$cast[cstring](addr elf_parsed.str_table[sh.name_offset]):<18} | ",
    fmt"{SectionType(sh.typ):<13} | ",
    fmt"{sh.offset:>8} | ",
    fmt"{sh.v_addr:>16X} | ",
    fmt"{sh.size:>8} | ",
    fmt"{sh.align:>8} | ",
    fmt"{sh.entry_size:>4} | ",
    fmt"{sh.link:>4} | ",
    fmt"{sh.info:>4} | ",
    fmt"{cast[SectionFlags](sh.flags)}"
