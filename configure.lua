print("CONFIGURE> SCANNING FOR CONFIGURATOR...")

for _, app in ipairs({ "gate-plc", "supervisor", "coordinator" }) do
    if fs.exists(app .. "/configure.lua") then
        local _, _, launch = require(app .. ".configure").configure()
        if launch then shell.execute("/startup") end
        return
    end
end

print("CONFIGURE> NO CONFIGURATOR FOUND")
print("CONFIGURE> EXIT")
