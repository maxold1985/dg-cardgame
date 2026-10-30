--ST1-07 Greymon
local s,id=GetID()
function s.initial_effect(c)
	aux.AddLevel(c,4)
	aux.AddForm(c,FORM_CHAMPION)
	aux.AddAttribute(c,ATTRIBUTE_VACCINE)
	aux.AddRace(c,RACE_DINOSAUR)
	--digimon
	aux.EnableDigimonAttribute(c)
	--digivolution condition
	aux.AddDigivolutionCondition(c,2)
	--security attack
	local e1=aux.EnableInheritedEffectCustom(c,EFFECT_UPDATE_CHECK)
	e1:SetValue(1)
	--add description
	aux.RegisterDescription(c,aux.Stringid(id,0))
end
