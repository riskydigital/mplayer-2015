--[[
RA-MOD
]]--

module("luci.controller.vsftpd", package.seeall)

function index()
	
	if not nixio.fs.access("/etc/vsftpd.conf") then
		return
	end

	local page = entry({"admin", "services", "vsftpd"}, cbi("vsftpd"), _("vsftpd"))
	page.dependent = true

end

