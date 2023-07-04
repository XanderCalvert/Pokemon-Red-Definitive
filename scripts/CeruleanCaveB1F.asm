CeruleanCaveB1F_Script:
	call EnableAutoTextBoxDrawing   ; This function call will enable the automatic drawing of text boxes on the screen.
	ld hl, CeruleanCaveB1FTrainerHeaders    ; Load the address of CeruleanCaveB1FTrainerHeaders into the hl register. This is where trainer information for Cerulean Cave is stored.
	ld de, CeruleanCaveB1F_ScriptPointers   ; Load the address of CeruleanCaveB1F_ScriptPointers into the de register. This is where pointers to different script routines are stored.
	ld a, [wCeruleanCaveB1FCurScript]   ; Load the value at the memory address wCeruleanCaveB1FCurScript into the a register. This value is used to determine which script to run.
	call ExecuteCurMapScriptInTable     ; Call the function ExecuteCurMapScriptInTable, which runs the script indicated by the value in register a.
	ld [wCeruleanCaveB1FCurScript], a   ; Store the value in the a register at the memory address wCeruleanCaveB1FCurScript, updating the current script to the one that was just run.
	ret     ; Return from the current routine.

CeruleanCaveB1F_ScriptPointers:
	dw CheckFightingMapTrainers     ; This is a pointer to the CheckFightingMapTrainers function.
	dw DisplayEnemyTrainerTextAndStartBattle    ; This is a pointer to the DisplayEnemyTrainerTextAndStartBattle function.
	dw EndTrainerBattle     ; This is a pointer to the EndTrainerBattle function.

CeruleanCaveB1F_TextPointers:
	dw MewtwoText   ; This is a pointer to the MewtwoText function.
	dw PickUpItemText   ; This is a pointer to the PickUpItemText function.
	dw PickUpItemText   ; This is another pointer to the PickUpItemText function.

CeruleanCaveB1FTrainerHeaders:
	def_trainers    ; This defines the trainers present in Cerulean Cave.

MewtwoTrainerHeader:
    trainer EVENT_BEAT_MEWTWO, 0, MewtwoBattleText, MewtwoBattleText, MewtwoBattleText      ; This defines a trainer header for Mewtwo, setting the associated event flag to EVENT_BEAT_MEWTWO.     ; The three occurrences of MewtwoBattleText are pointers to text scripts, respectively executed before, during, and after the battle.
    db -1   ; This is an end marker, indicating the end of the trainer data.

MewtwoText:
    text_asm    ; This keyword indicates that following code will be assembly.
    ld hl, MewtwoTrainerHeader  ; Load the address of MewtwoTrainerHeader into the hl register.
    call TalkToTrainer  ; Call the TalkToTrainer function, which starts the interaction with the trainer.
    jp TextScriptEnd    ; Jump to the TextScriptEnd label, ending the script.

MewtwoBattleText:
    call PlayCry    ; Play Mewtwo's cry.
    call WaitForSoundToFinish   ; Wait until the cry has finished playing before continuing.
    text_far _MewtwoBattleText      ; This indicates that the text for the Mewtwo battle is located elsewhere in memory and should be loaded from there.
    text_asm    ; This keyword indicates that following code will be assembly.
    ld a, MEWTWO    ; Load the identifier for Mewtwo's cry into the a register.
    call PlayCry    ; Play Mewtwo's cry.
    call WaitForSoundToFinish   ; Wait until the cry has finished playing before continuing.
    jp TextScriptEnd    ; Jump to the TextScriptEnd label, ending the script.
