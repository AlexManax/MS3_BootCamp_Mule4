%dw 2.0
output application/json
---
payload map ( payload01 , indexOfPayload01 ) -> {
	idMember: payload01.idmember,
	nameMember: payload01.namemember default "",
	rankMember: payload01.rankmember default 0,
	idShip: payload01.idship default 0
}