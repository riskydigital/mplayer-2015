--[[

Luci diag - Diagnostics controller module
(c) 2009 Daniel Dickinson

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

]]--

module("luci.controller.autoAP", package.seeall)

function index()
	
	if not nixio.fs.access("/etc/config/autoAP") then
		return
	end

   local page

	page = entry({"admin", "network", "autoAP"}, cbi("autoAP/autoAP"), _("Auto AP"), 210)
	page.i18n = "autoAP"
	page.dependent = true


end
