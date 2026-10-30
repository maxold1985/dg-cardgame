--ST1-08 Garudamon
local s,id=GetID()
function s.initial_effect(c)
	aux.AddLevel(c,5)
	aux.AddForm(c,FORM_ULTIMATE)
	aux.AddAttribute(c,ATTRIBUTE_VACCINE)
	aux.AddRace(c,RACE_BIRDKIN)
	--digimon
	aux.EnableDigimonAttribute(c)
	--digivolution condition
	aux.AddDigivolutionCondition(c,3)
	--gain effect (gain digimon power)
	local e1=aux.AddSingleTriggerEffect(c,0,EVENT_PLAY_SUCCESS,s.op1)
	e1:SetCondition(aux.DigivolvingCondition)
end
--gain effect (gain digimon power)
s.op1=aux.UpdatePowerOperation(PLAYER_SELF,Card.IsFaceup,LOCATION_MZONE,0,1,1,3000,RESET_PHASE+PHASE_END)
