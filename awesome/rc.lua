_, _, major_version, minor_version = string.find(awesome.version, "%a-(%d)%.(%d)%.-%d-")
version = tonumber(major_version .. "." .. minor_version)

if version == 3.5 then
    print("Loading awesome 3.5 configuration")
    dofile("/home/cochrane/.config/awesome/rc-3.5.lua")
elseif version == 3.4 then
    print("Loading awesome 3.4 configuration")
    dofile("/home/cochrane/.config/awesome/rc-3.4.lua")
elseif version == 4.0 then
    print("Loading awesome 4.0 configuration")
    dofile("/home/cochrane/.config/awesome/rc-4.0.lua")
elseif version == 4.2 then
    print("Loading awesome 4.2 configuration")
    dofile("/home/cochrane/.config/awesome/rc-4.2.lua")
elseif version == 4.3 then
    print("Loading awesome 4.3 configuration")
    dofile("/home/cochrane/.config/awesome/rc-4.3.lua")
else
    print("Unknown awesome version (" .. tostring(version) .. "); loading default Debian config")
    dofile("/etc/xdg/awesome/rc.lua")
end
