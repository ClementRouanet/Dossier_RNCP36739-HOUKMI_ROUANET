db.users.insertOne({
	firstname: "Clément",
	lastname: "Rouanet",
	email: "clement.rouanet@orange.fr",
	age: 24,
	phonenumber: "0637974175",
	address: {number: "129", street: "boulevard Davout", zipcode: "75020", city: "Paris", country: "France"}
})


db.users.find({ email: "clement.rouanet@orange.fr" })


db.users.find({_id: ObjectId("655e7571b09c637100ad482b")})


db.users.deleteOne({ email: "clement.rouanet@orange.fr" })


db.users.deleteOne({ _id: ObjectId("655e7571b09c637100ad482b") })


db.users.updateOne(
  { email: "clement.rouanet@orange.fr" },
  { 
	$set: { 
		age: 24,
		phonenumber: "0637974175"
	} 
  } 
)