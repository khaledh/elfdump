import binarylang
import binarylang/plugins
import print

struct(e_ident, endian = l):
  s: _ = "\x7fELF"
  u8: class
  u8: data
  u8: version
  u8: os_abi
  u8: abi_version
  u8: _[7]

struct(program_header, endian = l):
  u32: typ
  u32: flags
  u64: offset
  u64: v_addr
  u64: p_addr
  u64: file_size
  u64: memory_size
  u64: align

struct(section_header, endian = l):
  u32: name_offset
  u32: typ
  u64: flags
  u64: v_addr
  u64: offset
  u64: size
  u32: link
  u32: info
  u64: align
  u64: entry_size

struct(string_table, endian = l):
  u8: _ = 0
  s: strings{s.at_end}

struct(elf, endian = l):
  *e_ident: ident
  u16: typ
  u16: machine
  u32: version
  u64: entry_point
  u64: ph_offset
  u64: sh_offset
  u32: flags
  u16: eh_size
  u16: ph_entry_size
  u16: ph_count
  u16: sh_entry_size
  u16: sh_count
  u16: sh_str_table_index
  *program_header {pos(ph_offset.int)}:
    ph_table[ph_count]
  *section_header {pos(sh_offset.int)}:
    sh_table[sh_count]
  *string_table {pos(sh_table[sh_str_table_index].offset.int)}:
    str_table(sh_table[sh_str_table_index].size)

let elf_file = read_file("foo")
let elf_parsed = to_elf(elf_file)

print elf_parsed
