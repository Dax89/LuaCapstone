local capstone = require("capstone") 

local MipsCode = "\x0C\x10\x00\x97\x00\x00\x00\x00\x24\x02\x00\x0c\x8f\xa2\x00\x00\x34\x21\x34\x56"
local err, handle = capstone.open(capstone.CS_ARCH_MIPS, capstone.CS_MODE_32)

if err == capstone.CS_ERR_OK then
  print("Capstone Loaded")
else
  error("Failed to load Capstone")
end

capstone.option(handle, capstone.CS_OPT_DETAIL, capstone.CS_OPT_ON)
local count, insn = capstone.disasm(handle, MipsCode, #MipsCode, 0x00400000)
print("Disassembled " .. count .. " instructions")

for i = 1, count do
  print(string.format("%08X %s %s", insn[i].address, string.upper(insn[i].mnemonic), insn[i].op_str))
end

capstone.free(insn, count)
capstone.close(handle)
print("Capstone Unloaded")