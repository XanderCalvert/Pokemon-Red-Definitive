; Main entry point for the Celadon Mansion 3F script.
CeladonMansion3F_Script:
    jp EnableAutoTextBoxDrawing ; Jump to subroutine that enables automatic drawing of text boxes

; Pointers to different dialogues.
CeladonMansion3F_TextPointers:
    dw ProgrammerText    ; Dialogue with the programmer.
    dw GraphicArtistText ; Dialogue with the graphic artist.
    dw WriterText        ; Dialogue with the writer.
    dw DirectorText      ; Dialogue with the director.
    dw GameFreakPCText1  ; Dialogue for GameFreak PC option 1.
    dw GameFreakPCText2  ; Dialogue for GameFreak PC option 2.
    dw GameFreakPCText3  ; Dialogue for GameFreak PC option 3.
    dw GameFreakSignText ; Dialogue for the GameFreak sign.

; Below are different dialogues that can be triggered in Celadon Mansion 3F.

; Dialogue with the programmer.
ProgrammerText:
    text_far _ProgrammerText ; Load the text from the programmer.
    text_end                 ; Mark the end of the text.

; Dialogue with the graphic artist.
GraphicArtistText:
    text_far _GraphicArtistText ; Load the text from the graphic artist.
    text_end                    ; Mark the end of the text.

; Dialogue with the writer.
WriterText:
    text_far _WriterText ; Load the text from the writer.
    text_end             ; Mark the end of the text.

; Dialogue with the director.
DirectorText:
    text_asm                     ; Start of custom assembly code.
    ld hl, wPokedexOwned         ; Load the address of the first Pokédex entry.
    ld b, wPokedexOwnedEnd - wPokedexOwned ; Get the total number of Pokédex entries.
    call CountSetBits             ; Count the number of owned Pokémon.
    ld a, [wNumSetBits]          ; Load the count into register a.
    cp NUM_POKEMON - 1           ; Compare with total number of Pokémon (excluding Mew).
    jr nc, .completed_dex         ; If the number of owned Pokémon is not less, jump to completed dex dialogue.
    ld hl, .GameDesignerText     ; Else, load address of game designer text.
    jr .done                     ; Jump to .done.
.completed_dex
    ld hl, .CompletedDexText      ; Load address of completed dex text.
.done
    call PrintText                ; Print the loaded text.
    jp TextScriptEnd              ; Jump to the end of the text script.

; Dialogue for game designer.
.GameDesignerText:
    text_far _GameDesignerText ; Load the text from the game designer.
    text_end                   ; Mark the end of the text.

; Dialogue for completed Pokédex.
.CompletedDexText:
    text_far _CompletedDexText ; Load the text for completed dex.
    text_promptbutton          ; Wait for button press before proceeding.
    text_asm                   ; Start of custom assembly code.
    callfar DisplayDiploma     ; Call subroutine to display the diploma for completing the Pokédex.
    ld a, TRUE                 ; Load TRUE into register a.
    ld [wDoNotWaitForButtonPressAfterDisplayingText], a ; Do not wait for a button press after displaying the text.
    jp TextScriptEnd           ; Jump to the end of the text script.

; Dialogue for GameFreak PC option 1.
GameFreakPCText1:
    text_far _CeladonMansion3Text5 ; Load the text for GameFreak PC option 1.
    text_end                       ; Mark the end of the text.

; Dialogue for GameFreak PC option 2.
GameFreakPCText2:
    text_far _CeladonMansion3Text6 ; Load the text for GameFreak PC option 2.
    text_end                       ; Mark the end of the text.

; Dialogue for GameFreak PC option 3.
GameFreakPCText3:
    text_far _CeladonMansion3Text7 ; Load the text for GameFreak PC option 3.
    text_end                       ; Mark the end of the text.

; Dialogue for the GameFreak sign.
GameFreakSignText:
    text_far _CeladonMansion3Text8 ; Load the text for the GameFreak sign.
    text_end                       ; Mark the end of the text.
