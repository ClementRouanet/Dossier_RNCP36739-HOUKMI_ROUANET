db.events.insertOne({
	name: "BeerPong",
	description: "Tournoi de bière-pong",
	startdate: new Date("2023-11-22T18:00"),
	enddate: new Date("2023-11-22T22:30"),
	place: "Efrei Paris",
	organizers: [ObjectId("655e7973b09c637100ad482e")],
	participants: [ObjectId("655e7973b09c637100ad482e"), ObjectId("655e7571b09c637100ad482b")]
})


db.events.find({ _id: ObjectId("655e8048b09c637100ad4834") })


db.events.deleteOne({ _id: ObjectId("655e8048b09c637100ad4834") })


db.events.updateOne(
  { _id: ObjectId("655e80beb09c637100ad4835") },
  { 
	$set: { 
		place: "Kfet Efrei Paris",
		description: "Tournoi de bière-pong organisé par EFREI RUGBY"
	} 
  } 
)