type
  ElfClass* = enum
    c32Bit          = (1, "32-bit")
    c64Bit          = (2, "64-bit")

  ElfData* = enum
    dUnknown        = (0, "Unknown")
    dLittleEndian   = (1, "Little-endian")
    dBigEndian      = (2, "Big-endian")

  ElfOsAbi* = enum
    abiSysV         = (0, "UNIX System V")
    abiHPUX         = (1, "HP-UX")
    abiNetBSD       = (2, "NetBSD")
    abiLinux        = (3, "Linux")
    abiSolaris      = (6, "Solaris")
    abiAIX          = (7, "AIX")
    abiIRIX         = (8, "IRIX")
    abiFreeBSD      = (9, "FreeBSD")
    abiTru64        = (10, "Tru64 UNIX")
    abiModesto      = (11, "Novell Modesto")
    abiOpenBSD      = (12, "OpenBSD")
    abiArmEabi      = (64, "ARM EABI")
    abiArm          = (97, "ARM")
    abiStandalone   = (255, "Standalone")
  
  ElfFileType* = enum
    tNone           = (0, "NONE - Uknown file type")
    tRel            = (1, "REL - Relocatable")
    tExec           = (2, "EXEC - Executable")
    tDyn            = (3, "DYN - Shared Object")
    tCore           = (4, "CORE - Core")

  ElfMachine* = enum
    mNone           = (0x00, "Uknown machine")
    m386            = (0x03, "Intel 386")
    mArm            = (0x28, "ARM")
    mAMDx86_64      = (0x3e, "AMD x86-64")
    mAArch64        = (0xb7, "ARM AArch64")

  SegmentType* = enum
    sgtNull         = (0, "NULL")
    sgtLoad         = (1, "LOAD")
    sgtDynamic      = (2, "DYNAMIC")
    sgtInterp       = (3, "INTERP")
    sgtNote         = (4, "NOTE")
    sgtShLib        = (5, "SHLIB")
    sgtPHdr         = (6, "PHDR")
    sgtGnuEhFrame   = (0x6474e550, "GNU_EH_FRAME")
    sgtGnuStack     = (0x6474e551, "GNU_STACK")
    sgtGnuRelRO     = (0x6474e552, "GNU_REL_RO")
    sgtGnuProperty  = (0x6474e553, "GNU_PROPERTY")
  
  SegmentFlag* = enum
    sgfExecute      = (0, "EXEC")
    sgfWrite        = (1, "WRITE")
    sgfRead         = (2, "READ")
  SegmentFlags* = set[SegmentFlag]

  SectionType* = enum
    sctNull         = (0, "NULL")
    sctProgBits     = (1, "PROG_BITS")
    sctSymTab       = (2, "SYM_TAB")
    sctStrTab       = (3, "STR_TAB")
    sctRelA         = (4, "REL_A")
    sctHash         = (5, "HASH")
    sctDynamic      = (6, "DYNAMIC")
    sctNote         = (7, "NOTE")
    sctNoBits       = (8, "NO_BITS")
    sctRel          = (9, "REL")
    sctShLib        = (10, "SH_LIB")
    sctDynSym       = (11, "DYN_SYM")
    sctInitArray    = (14, "INIT_ARRAY")
    sctFiniArray    = (15, "FINI_ARRAY")
    sctPreInitArray = (16, "PREINIT_ARRAY")
    sctGroup        = (17, "GROUP")
    sctSymTabIndex  = (18, "SYM_TAB_SHNDX")
    sctGnuAttrs     = (0x6ffffff5, "GNU_ATTRS")
    sctGnuHash      = (0x6ffffff6, "GNU_HASH")
    sctGnuLibList   = (0x6ffffff7, "GNU_LIB_LIST")
    sctChecksum     = (0x6ffffff8, "CHECKSUM")
    sctGnuVerDef    = (0x6ffffffd, "GNU_VER_DEF")
    sctGnuVerNeed   = (0x6ffffffe, "GNU_VER_NEED")
    sctGnuVerSym    = (0x6fffffff, "GNU_VER_SYM")

  SectionFlag* = enum
    scfWrite       = (0, "WRITE")
    scfAlloc       = (1, "ALLOC")
    scfExec        = (2, "EXEC")
    scfMerge       = (4, "MERGE")
    scfStrings     = (5, "STRINGS")
    scfInfoLink    = (6, "INFO_LINK")
    scfLinkOrder   = (7, "LINK_ORDER")
    scfNonConf     = (8, "OS_NON_CONFORMING")
    scfGroup       = (9, "GROUP")
    scfTls         = (10, "TLS")
    scfCompressed  = (11, "COMPRESSED")
  SectionFlags* = set[SectionFlag]
 