_, _, major_version, minor_version = string.find(awesome.version, "(%d)%.(%d)%.%d")
minor_version = tonumber(minor_version)

if minor_version == 5 then
    print("loading awesome 3.5 configuration")
    dofile("/home/cochrane/.config/awesome/rc.lua.3.5")
else
    print("loading awesome 3.4 configuration")
    dofile("/home/cochrane/.config/awesome/rc.lua.3.4")
end
