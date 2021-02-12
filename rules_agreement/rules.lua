rules.languages = {
	en = "English",
	fr = "Français"
}
--The actual rules.
rules.rules = {
	en = [[1) Whatever an admin says is final
	2) No hacking
	3) No griefing
	4) No stalking/threatening other players
	5) No dating or similar roleplaying
	6) Staff may improve builds near spawn
	7) PvP: only when consensual
	8) No full-caps or spamming
	9) No swearing or cursing
	10) Treat others as you wish they'd treat you
	11) Don't ask admins for privs or builders for items
	12) No NSFW roleplay
	13) Don't advertise other servers. You can say their name, but don't make advertising and don't incite to join them]],
	fr = [[1) La décision des admins/modos est finale
	2) Pas de hacking
	3) Pas de grief
	4) Pas de stalking ou de menaces envers les autres joueurs
	5) Pas de drague ou de RP similaire
	6) Le staff peut améliorer les builds près du spawn
	7) PvP: seulement quand l'autre est consentant
	8) Pas de full majuscules ou de spam
	9) Pas d'insultes
	10) Traite les autres comme tu aimerais qu'ils te traitent
	11) Pas de demande de privilèges où d'items
	12) Pas de RP -18
	13) Ne fais pas de pub pour les autres serveur.]]
}

--The questions about the rules, if the quiz is used.
--The checkboxes for the first 4 questions are in config.lua
rules.s4_question1 = {
	en = "Am I allowed to damage the server, either the material or the software?",
	fr = "Puis-je endommager le serveur?"
}
rules.s4_question2 = {
	en = "Can I ask for privileges?",
	fr = "Puis-je demander des privilèges?"
}
rules.s4_question3 = {
	en = "Is spamming forbidden?",
	fr = "Le spam est-il interdit?"
}
rules.s4_question4 = {
	en = "Can I use approved by staff CSMs?",
	fr = "Puis-je utiliser un CSMs approuvé par le staff?"
}
rules.s4_multi_question = {
	en = "Which of these is a rule?",
	fr = "Laquelle des affirmations est une règle ?"
}

--The answers to the multiple choice questions. Only one of these should be true.
rules.s4_multi1 = {
	en = "Cheating is allowed",
	fr = "Triche est autorisée"
}
rules.s4_multi2 = {
	en = "PvP authorized when non-consensual",
	fr = "PvP autorisé quand non-consentant"
}
rules.s4_multi3 = {
	en = "Swearing/threatening is forbidden",
	fr = "Insulte/menaces sont interdits"
}

--Which answer is needed for the quiz questions. rules.quiz1-4 takes true or false.
--True is left, false is right.
--Please, please spell true and false right!!! If you spell it wrong it won't work!
--rules.quiz can be 1, 2 or 3.
--1 is the top one by the question, 2 is the bottom left one, 3 is the bottom right one.
--Make sure these agree with your answers!
rules.quiz1 = false
rules.quiz2 = false
rules.quiz3 = true
rules.quiz4 = true
rules.quiz_multi = 3
