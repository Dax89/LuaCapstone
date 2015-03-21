local capstone = require("capstone") 

local X86Code32 = "\x8d\x4c\x32\x08\x01\xd8\x81\xc6\x34\x12\x00\x00\x05\x23\x01\x00\x00\x36\x8b\x84\x91\x23\x01\x00\x00\x41\x8d\x84\x39\x89\x67\x00\x00\x8d\x87\x89\x67\x00\x00\xb4\xc6"
local err, handle = capstone.open(capstone.CS_ARCH_X86, capstone.CS_MODE_32)

if err == capstone.CS_ERR_OK then
  print("Capstone Loaded")
else
  error("Failed to load Capstone")
end

capstone.option(handle, capstone.CS_OPT_DETAIL, capstone.CS_OPT_ON)
local it = capstone.createiterator(handle, X86Code32, #X86Code32, 0x00400000)

while capstone.disasmiter(handle, it) do
  print(string.format("%08X %s %s", it.insn.address, string.upper(it.insn.mnemonic), it.insn.op_str))
end

capstone.freeiterator(it)
capstone.close(handle)
print("Capstone Unloaded") 
