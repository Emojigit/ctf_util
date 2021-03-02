local function ddf()
        core.display_chat_message("You died.")
        local formspec = "size[11,5.5]bgcolor[#320000b4;true]" ..
                "label[4.85,1.35;" .. fgettext("You died") ..
                "]button_exit[4,3;3,0.5;btn_respawn;".. fgettext("Respawn") .."]"
        core.show_formspec("bultin:death", formspec)
end
if minetest.get_server_info().address == "ctf.rubenwardy.com" then
	table.remove(core.registered_on_death,1)
	core.register_on_death(function()
		core.display_chat_message("You died. Requesting respawn.")
		core.send_respawn()
	end)
  minetest.register_on_sending_chat_message(function(message)
    if message == "pos" or message == "POS" then
      pos = minetest.localplayer:get_pos()
      minetest.display_chat_message("POS: x"..tostring(pos.x).." y"..tostring(pos.y).." z"..tostring(pos.z))
      return true
    elseif message == "hp" or message == "HP" then
      hp = minetest.localplayer:get_hp()
      minetest.display_chat_message("HP: "..tostring(hp))
      return true
    end
  end)
end
