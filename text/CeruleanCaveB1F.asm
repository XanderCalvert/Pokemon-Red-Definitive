_MewtwoBattleText::
	text "Mew!@"
	text_end

; Mewtwo: I wasn't born a Pokémon, I was created; and my creators have used and betrayed me! So, I stand alone!

; I see now that the circumstances of one's birth are irrelevant; it is what you do with the gift of life that determines who you are.

; Humans may have created me... ...but they will never enslave me. This cannot be my destiny!

; l was not born a Pokémon! l was created. 

; My creators have used and betrayed me.

; So l stand alone.

; Who am l?

; What is my true reason for being?

; l will find my own purpose.

; And purge this planet of all who oppose me.

; Human and Pokémon alike.

; The world will heed my warning.

; The reign of Mewtwo will soon begin.

; BrunosRoomTrainerHeader0:
; 	trainer EVENT_BEAT_BRUNOS_ROOM_TRAINER_0, 0, BrunoBeforeBattleText, BrunoEndBattleText, BrunoAfterBattleText
; 	db -1 ; end

; BrunoEndBattleText

; _BrunoEndBattleText::
; 	text "Why?"
; 	line "How could I lose?"
; 	prompt

; _BrunoAfterBattleText::
; 	text "My job is done!"
; 	line "Go face your next"
; 	cont "challenge!"
; 	done

_MewtwoBattleText::
	para "I wasn't born a"
	line "#MON, I was"
	cont "created  can"
	cont "become stronger!"