--[[
 * @des    : 重启设置
 * @author: dongguoyang
 * @since:2016�?�?2�? * @version: 1.0
]]--

module("luci.controller.admin.autoreboot", package.seeall)
require("luci.sys")
local uci = require("luci.model.uci").cursor()
local nw   = require "luci.model.network"
local fw   = require "luci.model.firewall"

function index()
    local uci = require("luci.model.uci").cursor()                                 
    entry({"admin", "network","myreboot"}, template("myreboot"), _("自动重启"))
    entry({"admin", "autoreboot"}, alias("admin", "autoreboot", "cfg_test"))       
    entry({"admin", 'autoreboot',"cfg_test"}, call("cfg_test"),nil).leaf = true
end


function cfg_test()
	local rv = {}                                                                  
    	rv['res'] = 1
		
	local proto = uci:get('autoreboot','main','type')
	local proto_new = luci.http.formvalue("type")
	
	local ret_status = false
	if proto_new == "1" then
		ret_status = set_main_days(proto)
	end
	if proto_new == "2" then                                                
        	ret_status = set_main_weeks(proto)                                  
	end
	if proto_new == "3" then 
		ret_status = set_main_mons(proto)
	end
	if proto_new == "none" then 
		ret_status = set_none()
	end
                                                                    
    if not ret_status then
        rv['res'] = 4                   
    else                                                        
        rv['res'] = 2
	io.popen("/etc/init.d/cron restart")
    end      
                                                   
    luci.http.prepare_content("application/json")               
    luci.http.write_json(rv)                                    
    return ;

end

function sleep(n)

   os.execute("sleep " .. n)

end

function crontabs_write()
	
	io.popen("sed '/reboot/d' /etc/crontabs/root > /etc/crontabs/root-bak");

	sleep(0.5)
	
	local file = io.open("/etc/crontabs/root-bak","r+")
	local date = file:read("*a")
	file:close()
	return date;
end


--关闭自动重启
function set_none()
	uci:set('autoreboot','main','enable','0')
	uci:set('autoreboot','main','type','0')
	local data = crontabs_write()
	local f = io.open("/etc/crontabs/root","w+")
	f:write(data)
	f:close()
	uci:commit('autoreboot') 
	return true
end

--设置为days启动的config
function set_main_days(proto)
	local dayHour = luci.http.formvalue("dayHour")
	local dayMinute = luci.http.formvalue("dayMinute")
	
	uci:set('autoreboot','main','enable',1)
	uci:set('autoreboot','main','type',1)
	uci:set('autoreboot','main','dayhour',dayHour)
	uci:set('autoreboot','main','dayminute',dayMinute)

	local data = crontabs_write()
	local f = io.open("/etc/crontabs/root","w+")
	f:write(data)
	f:close()
	

	local file = io.open("/etc/crontabs/root","a+")
	file:write(dayMinute)
	file:write(" ")
	file:write(dayHour)
	file:write(" * * * reboot & \n")
	file:close()
	uci:commit('autoreboot')
	
	return true
	
end

--设置weeks启动的config
function set_main_weeks(proto)
	local weekSelect = luci.http.formvalue("weekSelect")
	local weekHour = luci.http.formvalue("weekHour")
	local weekMinute = luci.http.formvalue("weekMinute")
	
	uci:set('autoreboot','main','enable',1)
	uci:set('autoreboot','main','type',2)
	uci:set('autoreboot','main','weekSelect',weekSelect)
	uci:set('autoreboot','main','weekhour',weekHour)
	uci:set('autoreboot','main','weekminute',weekMinute)

	local data = crontabs_write()
	local f = io.open("/etc/crontabs/root","w+")
	f:write(data)
	f:close()

	local file = io.open("/etc/crontabs/root","a+")
	file:write(weekMinute)
	file:write(" ")
	file:write(weekHour)
	file:write(" * * ")
	file:write(weekSelect)
	file:write(" reboot & \n")
	file:close()
	uci:commit('autoreboot')
	return true
end

--设置mons启动的config
function set_main_mons(proto)
	local monSelect = luci.http.formvalue("monSelect")
	local monHour = luci.http.formvalue("monHour")
	local monMinute = luci.http.formvalue("monMinute")

	uci:set('autoreboot','main','enable',1)
	uci:set('autoreboot','main','type',3)
	uci:set('autoreboot','main','monSelect',monSelect)
	uci:set('autoreboot','main','monhour',monHour)
	uci:set('autoreboot','main','monminute',monMinute)

	local data = crontabs_write()
	local f = io.open("/etc/crontabs/root","w+")
	f:write(data)
	f:close()


	local file = io.open("/etc/crontabs/root","a+")
	file:write(monMinute)
	file:write(" ")
	file:write(monHour)
	file:write(" ")
	file:write(monSelect)
	file:write(" * * reboot & \n")
	file:close()
	uci:commit('autoreboot')
	return true
end


