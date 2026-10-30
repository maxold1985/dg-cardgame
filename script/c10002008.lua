--ST2-08 WereGarurumon
local s,id=GetID()
function s.initial_effect(c)
	aux.AddLevel(c,5)
	aux.AddForm(c,FORM_ULTIMATE)
	aux.AddAttribute(c,ATTRIBUTE_VACCINE)
	aux.AddRace(c,RACE_BEASTKIN)
	--digimon
	aux.EnableDigimonAttribute(c)
	--digivolution condition
	aux.AddDigivolutionCondition(c,3)
	--security attack
	local e1=aux.EnableInheritedEffectCustom(c,EFFECT_UPDATE_CHECK,s.con1)
	e1:SetValue(1)
	--add description
	aux.RegisterDescription(c,aux.Stringid(id,0))
end
--security attack
function s.cfilter(c)
	return c:IsFaceup() and c:IsDigivolutionCount(0)
end
function s.con1(e)
	local tp=e:GetHandlerPlayer()
	return Duel.GetTurnPlayer()==tp and Duel.IsExistingMatchingCard(aux.BattleAreaFilter(s.cfilter),tp,0,LOCATION_MZONE,1,nil)
end
