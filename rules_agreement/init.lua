dofile(minetest.get_modpath("rules_agreement") .. "/config.lua")
dofile(minetest.get_modpath("rules_agreement") .. "/rules.lua") --rules are in their own file

local rule1 = 0
local rule2 = 0
local rule3 = 0
local rule4 = 0
local multi = 0

function table.length(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end

rules.player_languages = {}
function rules.get_player_language(plr)
	if type(plr) == "string" then
		return rules.player_languages[plr]
	end
	return rules.player_languages[plr:get_player_name()]
end

rules.forms = {
	languageselect = function(player)
		local fs_width = 10
		local fs_button_margin = 1
		local fs = { "size["..tostring(fs_width)..",4]" }
		table.insert(fs, "background[0,0;10,4;background.jpg]")
		local i = 0
		local fs_button_width = (fs_width-fs_button_margin*2)/table.length(rules.languages)
		for lang, lname in pairs(rules.languages) do
			table.insert(fs, "button["..tostring(fs_button_margin+i*fs_button_width)..",2;"..tostring(fs_button_width)..",0.5;"..lang..";"..lname.."]")
			i = i+1
		end
		return table.concat(fs)
	end,

	welcome = function(player)
		local lang = rules.get_player_language(player)
		local size = { "size[10,4]" }
		table.insert(size, "background[0,0;10,4;background.jpg]")
		table.insert(size, "label[0.5,0.5;" ..rules.s1_header[lang].. "]")
		table.insert(size, "label[0.5,1.5;" ..rules.s1_l2[lang].. "]")
		table.insert(size, "label[0.5,2;" ..rules.s1_l3[lang].. "]")
		table.insert(size, "button_exit[5.5,3.4;2,0.5;no;" ..rules.s1_b1[lang].. "]")
		table.insert(size, "button[7.5,3.4;2,0.5;yes;" ..rules.s1_b2[lang].. "]")
		return table.concat(size)
	end,

	visit = function(player)
		local lang = rules.get_player_language(player)
		local size = { "size[10,4]" }
		table.insert(size, "background[0,0;10,4;background.jpg]")
		table.insert(size, "label[0.5,0.5;" ..rules.s2_l1[lang].. "]")
		table.insert(size, "label[0.5,1;" ..rules.s2_l2[lang].. "]")
		table.insert(size, "button_exit[2.5,3.4;3.5,0.5;rules;" ..rules.s2_b1[lang].. "]")
		table.insert(size, "button_exit[6.4,3.4;3.6,0.5;visit;" ..rules.s2_b2[lang].. "]")
		return table.concat(size)
	end,

	rules = function(player)
		local lang = rules.get_player_language(player)
		local size = { "size[10,8]" }
		table.insert(size, "background[0,0;10,8;background.jpg]")
		table.insert(size, "textarea[0.5,0.5;9.5,7.5;TOS;" ..rules.s3_header[lang].. ";" ..rules.rules[lang].. "]")
		table.insert(size, "button[5.5,7.4;2,0.5;decline;" ..rules.s3_b2[lang].. "]")
		table.insert(size, "button_exit[7.5,7.4;2,0.5;accept;" ..rules.s3_b1[lang].. "]")
		return table.concat(size)
	end,

	quiz = function(player)
		local lang = rules.get_player_language(player)
		local size = { "size[10,9]" }
		if rules.s4_to_rules_button == true then
			table.insert(size, "button_exit[7.75,0.25;2.1,0.1;rules;" ..rules.s4_to_rules[lang].. "]")
		end
		table.insert(size, "label[0.25,0;" ..rules.s4_header[lang].."]")
		table.insert(size, "label[0.5,0.5;" ..rules.s4_question1[lang].."]")
		table.insert(size, "checkbox[0.25,1;rule1_true;" ..rules.s4_question1_true[lang].."]")
		table.insert(size, "checkbox[4,1;rule1_false;" ..rules.s4_question1_false[lang].. "]")
		table.insert(size, "label[0.5,2;" ..rules.s4_question2[lang].. "]")
		table.insert(size, "checkbox[0.25,2.5;rule2_true;" ..rules.s4_question2_true[lang].. "]")
		table.insert(size, "checkbox[4,2.5;rule2_false;" ..rules.s4_question2_false[lang].. "]")
		table.insert(size, "label[0.5,3.5;" ..rules.s4_question3[lang].. "]")
		table.insert(size, "checkbox[0.25,4;rule3_true;" ..rules.s4_question3_true[lang].. "]")
		table.insert(size, "checkbox[4,4;rule3_false;" ..rules.s4_question3_false[lang].. "]")
		table.insert(size, "label[0.5,5;" ..rules.s4_question4[lang].. "]")
		table.insert(size, "checkbox[0.25,5.5;rule4_true;" ..rules.s4_question4_true[lang].. "]")
		table.insert(size, "checkbox[4,5.5;rule4_false;" ..rules.s4_question4_false[lang].."]")
		table.insert(size, "label[0.5,6.5;" ..rules.s4_multi_question[lang].. "]")
		table.insert(size, "checkbox[4.75,6.25;multi_choice1;" ..rules.s4_multi1[lang].. "]")
		table.insert(size, "checkbox[0.25,7;multi_choice2;" ..rules.s4_multi2[lang].. "]")
		table.insert(size, "checkbox[4.75,7;multi_choice3;" ..rules.s4_multi3[lang].."]")
		table.insert(size, "background[0,0;10,9;background.jpg]")
		table.insert(size, "button_exit[3,8.4;3.5,0.5;submit;" ..rules.s4_submit[lang].."]")
		return table.concat(size)
	end
}

function rules.show_form(player, form, delay)
	if delay == nil then delay = 1 end
	minetest.after(delay, function()
		minetest.show_formspec(player:get_player_name(), form, rules.forms[form](player))
	end)
end

function rules.show_next_form(player, current)
	local is_next = false
	for i, formspec in ipairs(rules.form_order) do
		if is_next then
			return rules.show_form(player, formspec, 0)
		end
		if formspec == current then
			is_next = true
		end
	end
	-- If everything is correct, give rules
	rules.grant_rules(player)
end
--logs the granting
function rules.grant_rules(player)
	local lang = rules.get_player_language(player)
	local name = player:get_player_name()
	if minetest.check_player_privs(name, rules.priv) then
		minetest.chat_send_player(name, rules.rules_msg1[lang])
		minetest.chat_send_player(name, rules.rules_msg2[lang])
		local privs = minetest.get_player_privs(name)
		privs.rules = true
		minetest.set_player_privs(name, privs)
		minetest.log("action", "Granted " ..name.. " rules.")
	end
end

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "languageselect" then return end
	local plrlang = "en"
	for lang, _ in pairs(rules.languages) do
		if fields[lang] then
			plrlang = lang
		end
	end
	rules.player_languages[player:get_player_name()] = plrlang

	rules.show_next_form(player, formname)
end)

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "welcome" then return end
	local name = player:get_player_name()
	if fields.no then
		rules.show_next_form(player, formname)
		return
	elseif fields.yes then
		if rules.grief_ban ~= true then
			local lang = rules.get_player_language(player)
			minetest.kick_player(name, rules.msg_grief[lang])
		else
			minetest.ban_player(name)
		end
	return
	end
end)
--log if the player answered they're just visiting. Can be useful to know that.
minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "visit" then return end
	local name = player:get_player_name()
	if fields.rules then
		rules.show_next_form(player, formname)
		return
	elseif fields.visit then
		local lang = rules.get_player_language(player)
		minetest.chat_send_player(name, rules.visit_msg[lang])
		minetest.log("action", name.. " is just visiting.")
	return
	end
end)


minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "rules" then return end
	local name = player:get_player_name()
	if fields.accept then
		rules.show_next_form(player, formname)
		return
	elseif fields.decline then
		if rules.disagree_ban ~= true then
			local lang = rules.get_player_language(player)
			minetest.kick_player(name, rules.disagree_msg[lang])
		else
			minetest.ban_player(name)
		end
	return
	end
end)

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "quiz" then return end
	local name = player:get_player_name()
	if fields.rules then
		rules.show_form(player, "rules", 0)
		return
	end
	if fields.rule1_true then rule1 = true
	elseif fields.rule1_false then rule1 = false
	elseif fields.rule2_true then rule2 = true
	elseif fields.rule2_false then rule2 = false
	elseif fields.rule3_true then rule3 = true
	elseif fields.rule3_false then rule3 = false
	elseif fields.rule4_true then rule4 = true
	elseif fields.rule4_false then rule4 = false
	elseif fields.multi_choice1 then multi = 1
	elseif fields.multi_choice2 then multi = 2
	elseif fields.multi_choice3 then multi = 3 end
	if fields.submit and rule1 == rules.quiz1 and rule2 == rules.quiz2 and
	rule3 == rules.quiz3 and rule4 == rules.quiz4 and multi == rules.quiz_multi then
		rule1 = 0
		rule2 = 0
		rule3 = 0
		rule4 = 0
		multi = 0
		rules.show_next_form(player, formname)
	elseif fields.submit then
		rule1 = 0
		rule2 = 0
		rule3 = 0
		rule4 = 0
		multi = 0
		local lang = rules.get_player_language(player)
		if rules.on_wrong_quiz == "kick" then
			minetest.kick_player(name, rules.wrong_quiz_kick_msg[lang])
		elseif rules.on_wrong_quiz == "ban" then
			minetest.ban_player(name)
		elseif rules.on_wrong_quiz == "" then
			minetest.chat_send_player(name, rules.quiz_fail_msg[lang])
		else
			if rules.on_wrong_quiz == formname then
				minetest.chat_send_player(name, rules.quiz_try_again_msg[lang])
			end
			if rules.on_wrong_quiz == "rules" then
				minetest.chat_send_player(name, rules.quiz_rules_msg[lang])
			end
			rules.show_form(rules.on_wrong_quiz)
		end
	end
end)

function start_formspecs(player)
	local name = player:get_player_name()
	if not minetest.get_player_privs(name).rules then
		rules.show_form(player, rules.form_order[1])
	end
end

minetest.register_on_joinplayer(start_formspecs)
