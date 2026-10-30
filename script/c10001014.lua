--ST1-14 Starlight Explosion
local s,id=GetID()
function s.initial_effect(c)
	--gain effect
	aux.AddMainEffect(c,s.op1)
	--gain effect
	aux.AddSecurityEffect(c,s.op2)
end
--gain effect
function s.op1(e,tp,eg,ep,ev,re,r,rp)
	local reset_count=(Duel.GetTurnPlayer()~=tp and 2 or 1)
	s.gain_effect(e:GetHandler(),tp,RESET_PHASE+PHASE_END+RESET_OPPO_TURN,reset_count)
end
--gain effect
function s.op2(e,tp,eg,ep,ev,re,r,rp)
	s.gain_effect(e:GetHandler(),tp,RESET_PHASE+PHASE_END,1)
end
function s.gain_effect(c,tp,reset_flag,reset_count)
	--gain digimon power
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_UPDATE_POWER)
	e1:SetValue(7000)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_GRANT)
	e2:SetTargetRange(LOCATION_ALL,0)
	e2:SetTarget(aux.TargetBoolFunction(Card.IsType,TYPE_SECURITY))
	e2:SetLabelObject(e1)
	e2:SetReset(reset_flag,reset_count)
	Duel.RegisterEffect(e2,tp)
end
