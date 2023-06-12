CeladonMansion3F_Script:
	jp EnableAutoTextBoxDrawing

CeladonMansion3F_TextPointers:
	dw ProgrammerText
	dw GraphicArtistText
	dw WriterText
	dw DirectorText
	dw GameFreakPCText1
	dw GameFreakPCText2
	dw GameFreakPCText3
	dw GameFreakSignText

ProgrammerText:
	text_far _ProgrammerText
	text_end

GraphicArtistText:
	text_far _GraphicArtistText
	text_end

WriterText:
	text_far _WriterText
	text_end

DirectorText:
	; loading the number of Pokemon owned in the Pokedex into hl
	text_asm
	ld hl, wPokedexOwned

	; calculating the range of the Pokedex owned
	ld b, wPokedexOwnedEnd - wPokedexOwned

	; counting the number of set bits (owned Pokemon)
	call CountSetBits

	; loading the number of owned Pokemon into a
	ld a, [wNumSetBits]

	; subtracting one for Mew, who isn't counted
	cp NUM_POKEMON - 1

	; if we have all other Pokemon, go to .completed_dex
	jr nc, .completed_dex

	; if we don't have all Pokemon, load the Game Designer's text into hl
	ld hl, .GameDesignerText
	jr .done

.completed_dex
	; if we have all other Pokemon, load the Completed Dex text into hl
	ld hl, .CompletedDexText

.done
	; print the text pointed to by hl
	call PrintText

	; end the text script and return to the main game loop
	jp TextScriptEnd

.GameDesignerText:
	text_far _GameDesignerText
	text_end

.CompletedDexText:
	text_far _CompletedDexText
	text_promptbutton

	; after the text prompt, display the diploma for completing the Pokedex
	text_asm
	callfar DisplayDiploma

	; set the flag to not wait for button press after displaying text
	ld a, TRUE
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	
	; end the text script and return to the main game loop
	jp TextScriptEnd


GameFreakPCText1:
	text_far _CeladonMansion3Text5
	text_end

GameFreakPCText2:
	text_far _CeladonMansion3Text6
	text_end

GameFreakPCText3:
	text_far _CeladonMansion3Text7
	text_end

GameFreakSignText:
	text_far _CeladonMansion3Text8
	text_end
