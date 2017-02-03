_, _, major_version, minor_version = string.find(awesome.version, "%a-(%d)%.(%d)%.-%d-")
version = tonumber(major_version .. "." .. minor_version)

if version == 3.5 then
    print("Loading awesome 3.5 configuration")
    dofile("/home/cochrane/.config/awesome/rc.lua.3.5")
else version == 3.4 then
    print("Loading awesome 3.4 configuration")
    dofile("/home/cochrane/.config/awesome/rc.lua.3.4")
end
