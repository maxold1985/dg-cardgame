--ST2-09 Zudomon
local s,id=GetID()
function s.initial_effect(c)
	aux.AddLevel(c,5)
	aux.AddForm(c,FORM_ULTIMATE)
	aux.AddAttribute(c,ATTRIBUTE_VACCINE)
	aux.AddRace(c,RACE_SEA_BEAST)
	--digimon
	aux.EnableDigimonAttribute(c)
	--digivolution condition
	aux.AddDigivolutionCondition(c,3)
	--trash
	local e1=aux.AddSingleTriggerEffect(c,0,EVENT_PLAY_SUCCESS,s.op1)
	e1:SetCondition(aux.DigivolvingCondition)
end
--trash
function s.tgfilter(c)
	return c:IsFaceup() and c:GetDigivolutionGroup():IsExists(Card.IsAbleToTrash,1,nil)
end
function s.op1(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_DIGIMON)
	local g=Duel.SelectMatchingCard(tp,aux.BattleAreaFilter(s.tgfilter),tp,0,LOCATION_MZONE,1,1,nil)
	if g:GetCount()==0 then return end
	Duel.HintSelection(g)
	Duel.TrashDigivolutionCard(tp,g,aux.TRUE,2,2,REASON_EFFECT)
end
