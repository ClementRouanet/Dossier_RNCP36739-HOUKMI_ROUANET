db.discussionThreads.insertOne({
	linked: {
		id: ObjectId("655e8661b09c637100ad4838"), 
		connected: "group"
	},
	
	messages: [
		{
			author: ObjectId("655e7973b09c637100ad482e"),
			content: "Pour quand est le devoir de NoSQL ?",
			comments: [
				{
					author: ObjectId("655e7571b09c637100ad482b"),
					content: "Jeudi prochain"
				}
			]
		}
	]
})



db.discussionThreads.find({ _id: ObjectId("655e9436b09c637100ad4839") })



db.discussionThreads.deleteOne({ _id: ObjectId("655e9436b09c637100ad4839") })



db.discussionThreads.updateOne(
  { 
	_id: ObjectId("655e9a8cb09c637100ad4840")
  },
  { 
	$set: { 
		"messages.0.content": "Pour quand est le projet de NoSQL ?",
		"messages.0.comments.0.content": "Jeudi prochain à minuit"
	} 
  } 
)