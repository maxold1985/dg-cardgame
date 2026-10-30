--ST2-12 Matt Ishida
local s,id=GetID()
function s.initial_effect(c)
	--tamer
	aux.EnableTamerAttribute(c)
	--gain memory
	local e1=aux.AddTriggerEffect(c,0,EVENT_UNSUSPEND_PHASE,aux.DuelOperation(Duel.AddMemory,PLAYER_SELF,1))
	e1:SetCountLimit(1)
	e1:SetCondition(s.con1)
	--play tamer
	aux.AddSecurityEffect(c,aux.TamerOperation)
end
--gain memory
function s.cfilter(c)
	return c:IsFaceup() and c:IsDigivolutionCount(0)
end
function s.con1(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetTurnPlayer()==tp and Duel.IsExistingMatchingCard(aux.BattleAreaFilter(s.cfilter),tp,0,LOCATION_MZONE,1,nil)
end
