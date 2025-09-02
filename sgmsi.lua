local BOOTLOADER_VERSION = "0.1-ALPHA"

print("STARGATE SCADE V" ..BOOTLOADER_VERSION)
print("STARTING INSTALL")

os.sleep(0.5)

local exit_code

if fs.exists("gate-plc/startup.lua") then
    print("BOOT> EXEC GATE PLC STARTUP")
    exit_code = shell.execute("reactor-plc/startup")
    os.sleep(0.5)
elseif fs.exists("supervisor/startup.lua") then
    print("BOOT> EXEC SUPERVISOR STARTUP")
    exit_code = shell.execute("supervisor/startup")
    os.sleep(0.5)
elseif fs.exists("coordinator/startup.lua") then
    print("BOOT> EXEC COORDINATOR STARTUP")
    exit_code = shell.execute("coordinator/startup")
    os.sleep(0.5)
else
    print("BOOT> NO SCADA STARTUP FOUND")
    print("BOOT> EXIT")
    os.sleep(0.5)
    return false
end

if not exit_code then print("BOOT> APPLICATION CRASHED") end

return exit_code
