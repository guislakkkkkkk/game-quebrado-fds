function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Double Note' then
			-- setPropertyFromGroup('unspawnNotes', i, 'texture', 'HURTNOTE_assets'); --Change texture
			-- setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '-500'); --Default value is: 0.023, health gained on hit
			-- setPropertyFromGroup('unspawnNotes', i, 'missHealth', '500'); --Default value is: 0.0475, health lost on miss
			-- setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', true);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'pressNote', true); --Miss has no penalties
			end
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == "Double Note" then
			if noteData == 0 then
				triggerEvent('Play Animation','singLEFT','gf');
				triggerEvent('Play Animation','singLEFT','bf');
			end
			
			if noteData == 1 then
				triggerEvent('Play Animation','singDOWN','gf');
				triggerEvent('Play Animation','singDOWN','bf');
			end
			
			if noteData == 2 then
				triggerEvent('Play Animation','singUP','gf');
				triggerEvent('Play Animation','singUP','bf');
			end
			
			if noteData == 3 then
				triggerEvent('Play Animation','singRIGHT','gf');
				triggerEvent('Play Animation','singRIGHT','bf');
			end
		end
	end

-- Called after the note miss calculations
-- Player missed a note by letting it go offscreen
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == "Double Note" then
		if noteData == 0 then
			triggerEvent('Play Animation','singLEFTmiss','gf');
			triggerEvent('Play Animation','singLEFTmiss','bf');
		end
		
		if noteData == 1 then
			triggerEvent('Play Animation','singDOWNmiss','gf');
			triggerEvent('Play Animation','singDOWNmiss','bf');
		end
		
		if noteData == 2 then
			triggerEvent('Play Animation','singUPmiss','gf');
			triggerEvent('Play Animation','singUPmiss','bf');
		end
		
		if noteData == 3 then
			triggerEvent('Play Animation','singRIGHTmiss','gf');
			triggerEvent('Play Animation','singRIGHTmiss','bf');
		end
	end
end