db.ticketings.updateOne(
  { _id: ObjectId("") },
  { 
	$set: { 
		"tickets.?.ticketType": "",
		"tickets.?.quantity": 
	} 
  } 
)