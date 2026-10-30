--ST2-13 Hammer Spark
local s,id=GetID()
function s.initial_effect(c)
	--gain memory
	aux.AddMainEffect(c,aux.DuelOperation(Duel.AddMemory,PLAYER_SELF,1))
	--gain memory
	aux.AddSecurityEffect(c,aux.DuelOperation(Duel.AddMemory,PLAYER_SELF,2))
end
