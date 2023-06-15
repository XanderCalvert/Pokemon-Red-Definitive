SFX_Pokeflute_Ch3:
	vibrato 16, 1, 4
    ; Set a vibrato effect on the channel. The arguments are delay, depth, and speed respectively. 
    ; This means the vibrato effect will start after 16 frames, with depth 1 and speed 4.

	note_type 12, 1, 0
    ; Set the note type. The arguments are length, volume, and volume sweep respectively. 
    ; This will create notes of 12 frames in length, with a starting volume of 1 and no volume sweep.

	octave 5
    ; Set the octave to 5. This will affect the pitch of the notes that are played next.

	note E_, 2
	note F_, 2
	note G_, 4
	note A_, 2
	note G_, 2
    ; Play the notes E, F, G, A, and G in octave 5. The numbers after the notes are the note lengths in frames.

	octave 6
    ; Change the octave to 6.

	note C_, 4
	note C_, 2
	note D_, 2
	note C_, 2
    ; Play the notes C, C, D, and C in octave 6 with the respective lengths.

	octave 5
    ; Change the octave back to 5.

	note G_, 2
	note A_, 2
	note F_, 2
	note G_, 8
    ; Play the notes G, A, F, and G in octave 5 with the respective lengths.

	rest 12
    ; A rest or pause of 12 frames. No sound is played during a rest.

	sound_ret
    ; Return from this sound routine. This ends the Pokeflute sound effect.
