--[[
RA-MOD
]]--

module("luci.controller.vsftpd", package.seeall)

function index()
	
	if not nixio.fs.access("/etc/vsftpd.conf") then
		return
	end

	local page
	page = node("admin", "long1983")
	page.target = firstchild()
	page.title = _("long1983")
	page.order  = 65

	page = entry({"admin", "long1983", "vsftpd"}, cbi("vsftpd"), _("vsftpd"), 50)
	page.i18n = "vsftpd"
	page.dependent = true
end
