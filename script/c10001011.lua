--ST1-11 WarGreymon
local s,id=GetID()
function s.initial_effect(c)
	aux.AddLevel(c,6)
	aux.AddForm(c,FORM_MEGA)
	aux.AddAttribute(c,ATTRIBUTE_VACCINE)
	aux.AddRace(c,RACE_DRAGONKIN)
	--digimon
	aux.EnableDigimonAttribute(c)
	--digivolution condition
	aux.AddDigivolutionCondition(c,4)
	--security attack
	local e1=aux.EnableEffectCustom(c,EFFECT_UPDATE_CHECK,aux.TurnPlayerCondition(PLAYER_SELF))
	e1:SetValue(s.val1)
end
--security attack
function s.val1(e,c)
	local ct=e:GetHandler():GetDigivolutionCount()
	return math.floor(ct/2)
end
