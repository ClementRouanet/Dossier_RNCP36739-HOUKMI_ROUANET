db.groups.insertOne({
	name: "M2 Data Engineering",
	description: "Groupe de classe",
	type: "private",
	admins: [ObjectId("655e7973b09c637100ad482e")],
	members: [ObjectId("655e7973b09c637100ad482e"), ObjectId("655e7571b09c637100ad482b")]
})


db.groups.find({ _id: ObjectId("655e85c6b09c637100ad4837") })


db.groups.deleteOne({ _id: ObjectId("655e85c6b09c637100ad4837") })


db.groups.updateOne(
  { _id: ObjectId("655e85c6b09c637100ad4837") },
  { 
	$set: { 
		description: "Groupe de classe du M2 Data Engineering",
		type: "secret"
	} 
  } 
)