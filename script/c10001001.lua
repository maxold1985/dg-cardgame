--ST1-01 Koromon
local s,id=GetID()
function s.initial_effect(c)
	aux.AddLevel(c,2)
	aux.AddForm(c,FORM_INTRAINING)
	aux.AddAttribute(c,ATTRIBUTE_NONE)
	aux.AddRace(c,RACE_LESSER)
	--digi-egg
	aux.EnableDigiEggAttribute(c)
	--gain digimon power
	local e1=aux.AddInheritedUpdatePower(c,LOCATION_MZONE,1000)
	e1:SetCondition(s.con1)
	--add description
	aux.RegisterDescription(c,aux.Stringid(id,0))
end
--gain digimon power
function s.con1(e)
	return Duel.GetTurnPlayer()==e:GetHandlerPlayer() and e:GetHandler():IsDigivolutionCountAbove(4)
end
