rules = {}

-- Can be changed to modify the appearance order of the prompts
rules.form_order = {
	"languageselect",
	"welcome",
	"visit",
	"rules",
	"quiz"
}

--The first prompt--.
rules.s1_header = {
	en = "Welcome to BlockySurvival!",
	fr = "Bienvenue sur BlockySurvival!"
}
--Each line needs to be less than 70 characters, or they will override the formspec
rules.s1_l2 = {
	en = "Do you like to grief other people's buildings?",
	fr = "Aime-tu griefer les autres joueurs?"
}
rules.s1_l3 = {en="",fr=""}
--Each buttons can have a maximum of 15 characters
rules.s1_b1 = {
	en = "No, I don't.",
	fr = "Non."
}
rules.s1_b2 = {
	en = "Yes, I do!",
	fr = "Oui!"
}

--The message sent if someone who selected s1_b1 is kicked.
rules.msg_grief = {
	en = "Then just go to the singleplayer mode, we don't want griefers here.",
	fr = "Vas donc en solo, on veut pas de griefers ici!"
}

--Set this value to true if you want the player to banned. False for a kick.
rules.grief_ban = false

--Second prompt
rules.s2_l1 = {
	en = "Do you want to play here?",
	fr = "Veux-tu jouer ici?"
}
rules.s2_l2 = {
	en = "On the server?",
	fr = "Sur ce serveur?"
}
-- These buttons can have 26 characters maximum
rules.s2_b1 = {
	en = "Yes, I want to play!",
	fr = "Oui, je veux jouer!"
}
rules.s2_b2 = {
	en = "I just want to look around.",
	fr = "Je veux juste me balader."
}

--The message sent to the player if s2_b2 is selected
rules.visit_msg = {
	en = "Have a nice time looking around! If you wish to see the rules again, go to the rules building!",
	fr = "Bon jeu! Si tu veux revoir les règles, va au batiment des règles!"
}

--Third prompt, header can have up to 60 characters
rules.s3_header = {
	en = "Read the rules here:",
	fr = "Lis les règles:"
}

--buttons
rules.s3_b1 = {
	en = "I agree",
	fr = "J'accepte"
}
rules.s3_b2 = {
	en = "I disagree",
	fr = "Refuser"
}

--The message sent when s3_b2 is selected and the player is kicked
rules.disagree_msg = {
	en = "Goodbye! You must agree to the rules to play!",
	fr = "Au revoir! Tu dois accepter les règles pour jouer!"
}

--Set this value to true if you want the player to banned. False for a kick.
rules.disagree_ban = true

--Fourth prompt
rules.s4_to_rules_button = true
--back to rules buttons can have a maximum of 13 characters
rules.s4_to_rules = {
	en = "<-- Rules",
	fr = "<-- Règles"
}

--fourth prompt header. Maximum of 60 characters
rules.s4_header = {
	en = "Time for a quiz about the rules!",
	fr = "Questions sur les règles!"
}

--Since the questions are intrinsically connected with the rules, they have to be in rules.lua
--True answers can have 26 characters. False has a maximum of 36
rules.s4_question1_true = {en="Yes.",fr="Oui."}
rules.s4_question1_false = {en="No.",fr="Non."}
rules.s4_question2_true = {en="Yes.",fr="Oui."}
rules.s4_question2_false = {en="No.",fr="Non."}
rules.s4_question3_true = {en="Yes.",fr="Oui."}
rules.s4_question3_false = {en="No.",fr="Non."}
rules.s4_question4_true = {en="Yes.",fr="Oui."}
rules.s4_question4_false = {en="No.",fr="Non."}

rules.s4_submit = {
	en = "Submit!",
	fr = "Envoyer!"
}

--Action on wrong answers
--params are "kick" "ban", "" (nothing)
rules.on_wrong_quiz = ""
--message sent to the player if reshow is the on_wrong_quiz option.
rules.quiz_try_again_msg = {
	en = "Have another try.",
	fr = "Réessayez."
}
--The message sent to the player if rules is the on_wrong_quiz option.
rules.quiz_rules_msg = {
	en = "Take another look at the rules:",
	fr = "Revoir les règles:"
}
--The kick reason if kick is the on_wrong_quiz option.
rules.wrong_quiz_kick_msg = {
	en = "Pay more attention next time!",
	fr = "Lisez mieux la prochaine fois!"
}
--The message sent to the player if nothing is the on_wrong_quiz option.
rules.quiz_fail_msg = {
	en = "You got that wrong.",
	fr = "Vous avez raté le quiz."
}

--The messages sent to the player after rules is granted.
rules.rules_msg1 = {
	en = "Thanks for accepting the rules. You can now play normally.",
	fr = "Merci d'avoir accepté les règles, tu peux maintenant jouer!"
}
rules.rules_msg2 = {
	en = "Have fun!",
	fr = "Amuses-toi bien!"
}
