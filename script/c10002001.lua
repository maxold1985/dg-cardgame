--ST2-01 Tsunomon
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
	local tp=e:GetHandlerPlayer()
	local tc=e:GetHandler():GetBattleTarget()
	return Duel.GetTurnPlayer()==tp and tc and tc:IsDigivolutionCount(0) and tc:IsControler(1-tp)
end
