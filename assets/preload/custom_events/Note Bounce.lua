local cameraOffset = 0
iLoveTrampolining = ''

function onSongStart()
	if songName == 'Bedbreaker' then
		cameraOffset = 0
	else
		cameraOffset = -120
	end
end

function onEvent(name,value1,value2)
	if name == 'Note Bounce' then
		iLoveTrampolining = value1
		if value2 == '' then
			bounceMult = 1
		else
			bounceMult = tonumber(value2)
		end
	end
end

function onUpdate()
	if iLoveTrampolining == '' then
		function onStepHit() end
	else
		function onStepHit()
			if curStep % 4 == 0 then
				doTweenY('ri', 'camHUD', -10 * bounceMult + cameraOffset, stepCrochet*0.002, 'circOut')                
			end
			if curStep % 4 == 2 then
				doTweenY('rir', 'camHUD', 0 + cameraOffset, stepCrochet*0.002, 'sineIn')
			end
		end
	end
end