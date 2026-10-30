--ST2-16 Cocytus Breath
local s,id=GetID()
function s.initial_effect(c)
	--return
	aux.AddMainEffect(c,aux.SendtoHandOperation(PLAYER_SELF,aux.BattleAreaFilter(Card.IsFaceup),0,LOCATION_MZONE,1))
	--activate effect
	aux.AddSecurityEffect(c,aux.SelfActivateMainOperation)
end
