db.ticketings.insertOne({
	event: ObjectId("655e80beb09c637100ad4835"),
	tickets: [
		{
			ticketType: "Classique",
			amount: 59.99,
			quantity: 100
		},
		{
			ticketType: "VIP",
			amount: 199.99,
			quantity: 20
		}
	],
	ticketsSold: [
		{
			ticketType: "VIP",
			participant: ObjectId("655e7571b09c637100ad482b"),
			purchaseDate: new Date("2023-11-22T18:00")
		},
		{
			ticketType: "Classique",
			participant: ObjectId("655e7973b09c637100ad482e"),
			purchaseDate: new Date("2023-11-20T14:30")
		}
	]
})



db.ticketings.find({ _id: ObjectId("656081c0233c5f9cf40da189") })



db.ticketings.deleteOne({ _id: ObjectId("656081c0233c5f9cf40da189") })



db.ticketings.updateOne(
  { _id: ObjectId("656081fc233c5f9cf40da18a") },
  { 
	$set: { 
		"tickets.1.ticketType": "Carré or",
		"tickets.0.quantity": 150
	} 
  } 
)
