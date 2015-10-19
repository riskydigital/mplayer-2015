--[[
LuCI - Lua Configuration Interface

Copyright 2008 Steven Barth <steven@midlink.org>
Copyright 2008 Jo-Philipp Wich <xm@leipzig.freifunk.net>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

$Id: ddns.lua 9405 2012-10-29 13:00:52Z jow $
]]--

--[[
local m, s, o
]]--

local sys = require "luci.sys"
local utl = require "luci.util"
local nt = require "luci.sys".net
local uci = luci.model.uci.cursor()
local dev = uci:get("autoAP", "general", "staRadio")
local iwinfo = sys.wifi.getiwinfo(dev)

function format_wifi_encryption(info)
    if info.wep == true then
        return "WEP"
    elseif info.wpa > 0 then
        return translatef("%s - %s",
            (info.wpa == 3) and translate("mixed WPA/WPA2")
            or (info.wpa == 2 and "WPA2" or "WPA"),
            table.concat(info.auth_suites, ", ")
            --table.concat(info.pair_ciphers, ", ")
        )
    elseif info.enabled then
        return "%s" % translate("unknown")
    else
        return "%s" % translate("open")
    end
end
    
m = Map("autoAP", translate("Auto AP"),
	translate("AutoAP allows that your router automatic change with " ..
		"relay station that you cracked and fill below"))
		
-- *********** General section ***********
s = m:section(NamedSection, "general", "general", translate("General configure"))
s.addremove = false
s.anonymous = false

-- enabled
enabled = s:option(Flag, "enabled", translate("Enabled"), translate("Program will start normally if was selected, otherwise will not run"))
enabled.disabled = 0
enabled = s:option(DummyValue, "", translate("\n"))
--

-- Debug Level
dbg_level = s:option(ListValue, "dbg_level", translate("Log output level"), translate("For Debug Purpose, 'ERROR' will print ERROR Level, 'DEBUG' will print all message, 'FILE' will log in file '/tmp/autoAP.log'"))
dbg_level:value(1, translate("ERROR"))
dbg_level:value(2, translate("NOTICE"))
dbg_level:value(3, translate("DEBUG"))
dbg_level:value(4, translate("FILE"))
dbg_level = s:option(DummyValue, "", translate("\n"))
--

-- Next Station index
o = s:option( Value, "next", translate("Next Station"), translate("Program change to the 'value' station if '0' is not set. Exp: 2-Program will change the SECOND STATION you fill below when next network check happen"))
o.datatype = "max(128)"
o.rmempty = false
o = s:option(DummyValue, "", translate("\n"))
--

-- AP Radio device
apRadio = s:option(ListValue, "apRadio", translate("AP Radio device"), translate("The radio device which AP use"))
uci:foreach("wireless", "wifi-device",
			   function(s)
				  apRadio:value(s['.name'])
			   end)
apRadio = s:option(DummyValue, "", translate("\n"))
---

-- Station Radio device
staRadio = s:option(ListValue, "staRadio", translate("STATION Radio device"), translate("The radio device which STATION use"))
uci:foreach("wireless", "wifi-device",
			   function(s)
				  staRadio:value(s['.name'])
			   end)
staRadio = s:option(DummyValue, "", translate("\n"))
---

-- Interface use flag
inter = s:option(Flag, "inter_flag", translate("Specify Diagnosis NIC"), translate("Whether to specify the NIC"))
inter.disabled = 0
inter = s:option(DummyValue, "", translate("\n"))
--

-- ifname
ifname = s:option(ListValue, "ifname", translate("NIC"), translate("Program will diagnose with this NIC"))
for k, v in ipairs(luci.sys.net.devices()) do
     if v ~= "lo" then
        ifname:value(v)
    end
end
ifname:depends("inter_flag", 1)
ifname.rmempty = true
o = s:option(DummyValue, "", translate("\n"))
--

-- Hostname
o = s:option( Value, "hostname", translate("DHCP Hostname"), translate("DHCP Hostname Parameter"))
o.datatype = "maxlength(64)"
o.datatype = "minlength(1)"
o.default = "OpenWrt"
o.rmempty = false
o = s:option(DummyValue, "", translate("\n"))

-- Diagnosis Host
o=s:option( Value, "host1", translate("Diagnosis Host"), translate("Program will diagnose with this host"))
o.datatype="host"
o.rmempty = false
o = s:option(DummyValue, "", translate("\n"))
--

-- Diagnosis Host2
o=s:option( Value, "host2", translate("Diagnosis Host2"), translate("Program will diagnose with this host after HOST 1 check failed"))
o.datatype="host"
o.rmempty = false
o = s:option(DummyValue, "", translate("\n"))
--

-- Package send count --
o=s:option( Value, "count", translate("Package send count"), translate("Diagnosis will send count package"))
o.datatype = "uinteger"
o.datatype = "max(100)"
o.rmempty = false
o = s:option(DummyValue, "", translate("\n"))
--

-- Percent package loss --
o=s:option( Value, "loss", translate("MAX Loss package percent"), translate("Diagnosis loss package percent (unit:%) larger than this value will cause change to next STATION"))
o.datatype = "uinteger"
o.datatype = "max(100)"
o.rmempty = false
o = s:option(DummyValue, "", translate("\n"))
--

-- Average time out --
o=s:option( Value, "threshold", translate("MAX Average time out"), translate("Diagnosis average time out (unit: ms) larger than this value will cause change to next STATION"))
o.datatype = "uinteger"
o.rmempty = false
o = s:option(DummyValue, "", translate("\n"))
--

-- Some Timer --
o=s:option( Value, "strup", translate("Start up waiting time"), translate("First check waiting time(unit:s) after 'autoAP' launch, for system initialize"))
o.datatype = "uinteger"
o.rmempty = false
o = s:option(DummyValue, "", translate("\n"))

o=s:option( Value, "good", translate("Good check waiting time"),translate("Next check waiting time(unit:s) after previous is a good check"))
o.datatype = "uinteger"
o.rmempty = false
o = s:option(DummyValue, "", translate("\n"))

o = s:option( Value, "fail", translate("Change station waiting time"), translate("Next check waiting time(unit:s) after change to other station"))
o.datatype = "uinteger"
o.rmempty = false
o = s:option(DummyValue, "", translate("\n"))

o = s:option( Value, "again", translate("Again check waiting time"), translate("Next again check waiting time(unit:s) after station route reboot"))
o.datatype = "uinteger"
o.rmempty = false
o = s:option(DummyValue, "", translate("\n"))


-- *********** Run once configure ***********
once = m:section(NamedSection, "once", "once", translate("Initialize configure"), translate("This part will automatic configure only once AFTER 'autoAP' install, But it will run again if 'Run again' was selected"))
o = once:option(DummyValue, "", translate("\n"))

-- First time run
o = once:option(Flag, "need_run", translate("Run again"), translate("Program will run the part of below configure again if was selected"))
o.disabled = 0
o = once:option(DummyValue, "", translate("\n"))

-- LAN IP Address
o=once:option( Value, "ipsub", translate("LAN IP Address"), translate("LAN IP Address"))
o.datatype="ip4addr"
o.rmempty = false
o = once:option(DummyValue, "", translate("\n"))

-- AP settings
o = once:option(DummyValue, "", translate("AP Configure Setting"))
o = once:option( Value, "ssid", "AP SSID")
o.datatype = "minlength(1)"
o.datatype = "maxlength(32)"
o.rmempty = false

o = once:option(ListValue, "encryption", translate("encryption type"))
o.default = "psk2"
o:value("none", "none")
o:value("psk", "psk")
o:value("psk2", "psk2")
o:value("psk+psk2", "psk+psk2")
o:value("psk-mixed", "psk-mixed")

wpakey = once:option(Value, "key", translate("Key"))
wpakey.password = true
wpakey.rmempty = true
wpakey.datatype = "wpakey"
wpakey:depends("encryption", "psk")
wpakey:depends("encryption", "psk2")
wpakey:depends("encryption", "psk+psk2")
wpakey:depends("encryption", "psk-mixed")
wpakey = once:option(DummyValue, "", translate("\n"))
wpakey = once:option(DummyValue, "", translate("\n"))
wpakey = once:option(DummyValue, "", translate("\n"))

-- *********** SCAN ***********
local sl = iwinfo.scanlist or { }
--local sl = { "nil" }
scan = once:option(Button, translate("Scan"), translate("Scan"))
scan.inputstyle = "find"
t = m:section(Table, {}, translate("<abbr title=\"Wireless Local Area Network\">WLAN</abbr>-Scan"), translate("Wifi networks in your local environment"))
function scan.write()

	m.autoapply = false
	t.render = t._render
    sl = iwinfo.scanlist
    
	if iwinfo then
		local _, cell
		for _, cell in ipairs(sl) do
			t.data[#t.data+1] = {
				Quality = "%d/%d" %{ cell.quality, cell.quality_max },
				ESSID   = cell.ssid or "<hidden>",
				Address = cell.bssid,
				Mode    = cell.mode,
                Channel = "%d" %{ cell.channel },
				["Encryption key"] = format_wifi_encryption(cell.encryption),
				["Signal level"]   = "%d dBm" % cell.signal,
			}
		end
	end
end

t._render = t.render
t.render = function() end
t:option(DummyValue, "Quality", translate("Link"))
t:option(DummyValue, "Signal level", translate("Signal"))
essid = t:option(DummyValue, "ESSID", "ESSID")
t:option(DummyValue, "Address", "BSSID")
t:option(DummyValue, "Mode", translate("Mode"))
t:option(DummyValue, "Channel", translate("Channel"))
t:option(DummyValue, "Encryption key", translate("Encrypted"))
--------------- END SCAN --------------

-- *********** relay ***********
s = m:section(TypedSection, "relay", translate("relay stations"), translate("Now maximum support 128 stations"))
s.addremove = true
s.anonymous = false
o = s:option(DummyValue, "", translate("\n"))

-- enabled
enabled = s:option(Flag, "enabled", translate("Enabled"), translate("Enable this station"))
enabled.disabled = 0
enabled = s:option(DummyValue, "", translate("\n"))
---

-- ssid
o = s:option( DynamicList, "ssid", translate("STATION SSID"))
for k, v in pairs(sl) do
    o:value((v.ssid or "nil"))
end

--[[
o = s:option(ListValue, "ssid", translate("STATION SSID"))
for k, v in pairs(sl) do
    if not s[v.bssid] then
        o:value((v.ssid or "nil"))
    end
end
o.datatype = "maxlength(32)"
o.rmempty = false
--]]

--bssid
--o = s:option( Value, "bssid", translate("STATION BSSID"))
--o.datatype="macaddr"
--o.rmempty = false
---

--encryption
o = s:option(ListValue, "encryption", translate("encryption type"))
o.default = "psk2"
o:value("none", "none")
o:value("psk", "psk")
o:value("psk2", "psk2")
o:value("psk+psk2", "psk+psk2")
o:value("psk-mixed", "psk-mixed")
---

--key
wpakey = s:option(Value, "key", translate("Key"))
wpakey.password = true
wpakey.rmempty = true
wpakey.datatype = "wpakey"
wpakey:depends("encryption", "psk")
wpakey:depends("encryption", "psk2")
wpakey:depends("encryption", "psk+psk2")
wpakey:depends("encryption", "psk-mixed")
---

--ip proto
ip = s:option(ListValue, "ip_proto", translate("IP protocol"))
ip.default = 1
ip:value(0, "static")
ip:value(1, "dhcp")
---
--static 
ip = s:option(Value, "ipaddr", translate("Static IP Address"))
ip.rmempty = true
ip.datatype = "ip4addr"
ip:depends("ip_proto", 0)

netmask = s:option(ListValue, "netmask", translate("Net Mask"))
netmask.rmempty = true
netmask.datatype = "ip4addr"
netmask.default = "255.255.255.0"
netmask:depends("ip_proto", 0)
netmask:value("255.255.255.0")
netmask:value("255.255.0.0")
netmask:value("255.0.0.0")

gw = s:option(Value, "gateway", translate("Gateway"))
gw.rmempty = true
gw.datatype = "ip4addr"
gw:depends("ip_proto", 0)

dns = s:option(Value, "dns", translate("DNS"))
dns.rmempty = true
dns.datatype = "ip4addr"
dns:depends("ip_proto", 0)

local apply = luci.http.formvalue("cbi.apply")
if apply then
    io.popen("/etc/init.d/runAutoAP restart")
end

return m
