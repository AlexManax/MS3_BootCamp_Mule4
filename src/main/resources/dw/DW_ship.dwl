%dw 2.0
output application/json
---
{
	idShip: payload."0".payload[0].idship,
	nameShip: payload."0".payload[0].nameship default "",
	crewSize: payload."0".payload[0].crewsize default 0,
	speed: payload."0".payload[0].speed default 0,
	members: payload."1".payload map ( payload01 , indexOfPayload01 ) -> {
		idMember: payload01.idMember,
		nameMember: payload01.nameMember,
		rank: payload01.rankMember,
		idShip: payload01.idShip
	}
}