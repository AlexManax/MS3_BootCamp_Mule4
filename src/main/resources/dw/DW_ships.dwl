%dw 2.0
output application/json
---
using (ships = payload."0".payload map ( ship , indexOfPayload01 ) -> {
	idShip: ship.idship,
	nameShip: ship.nameship default "",
	crewSize: ship.crewsize default 0,
	speed: ship.speed default 0,
	members:	 payload."1".payload filter ($.idship == ship.idship)
		 map ((member , indexOfPayload02) -> {
			idMember: member.idmember,
			nameMember: member.namemember,
			rank: member.rankmember,
			idShip: member.idship
	})
})
ships