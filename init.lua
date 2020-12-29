if minetest.get_server_info().address == "ctf.rubenwardy.com" then
	minetest.register_on_death(function()
		minetest.show_formspec("ctf_util:blank", "formspec_version[1]size[11,5.5]bgcolor[#320000b4;true]"..
                "label[4.85,1.35;You died]"..
                "button_exit[4,3;3,0.5;fake_btn_respawn;Toggled The Timer]")
		minetest.send_respawn()
	end)
end
