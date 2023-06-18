function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'fuck' then
                setPropertyFromGroup('unspawnNotes', i, 'texture', 'glitchNOTE_assets');
                setPropertyFromGroup('unspawnNotes', i, 'blockHit', true);
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
				setPropertyFromGroup('unspawnNotes', i, 'lowPriority', true);
		end
	end
end

function onSpawnNote(membersIndex, noteData, noteType, isSustainNote)
    for i = 0, getProperty('notes.length') do
        if getPropertyFromGroup('notes', i, 'noteType') == 'fuck' then
            if getSongPosition() >= getPropertyFromGroup('notes', i, 'strumTime') - 600 and getSongPosition() < getPropertyFromGroup('notes', i, 'strumTime') + 600 then
                setPropertyFromGroup('notes', i, 'noteData', getRandomInt(0,4) - 1);
            end
        end
    end
end