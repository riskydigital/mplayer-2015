#!/usr/bin/lua

dev = arg[1]
local sys = require "luci.sys"
local utl = require "luci.util"
local iw = luci.sys.wifi.getiwinfo(dev)
local file = io.open("/tmp/autoap.scan", "w");

    function scanlist(times)
        local i, k, v
        local l = { }
        local s = { }

        for i = 1, times do
            for k, v in ipairs(iw.scanlist or { }) do
                if not s[v.bssid] then
                    l[#l+1] = v
                    s[v.bssid] = true
                end
            end
        end

        return l
    end

assert(file);

for i, net in ipairs(scanlist(3)) do
    net.encryption = net.encryption or { }
    print("channel:",net.channel);
    print("ssid:",net.ssid);
    file:write(net.ssid or "NULL");
    file:write("\n");
    print("bssid:",net.bssid);
    print("Mode:",net.mode);
    wep=net.encryption.wep and 1 or 0
    
    print("");
end
file:close();