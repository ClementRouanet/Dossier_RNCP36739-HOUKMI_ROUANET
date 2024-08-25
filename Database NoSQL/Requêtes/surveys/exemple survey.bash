db.surveys.insertOne({
	eventId: ObjectId("655e80beb09c637100ad4835"),
	questions : [
		{
			questionText: "Ou voulez-vous manger ?",
			options: [
				{
					optionText: "Au mc Do", 
					respondents: [ObjectId("655e7571b09c637100ad482b")]
				},
				{
					optionText: "Au BK", 
					respondents: []
				}
			]
		},
		{
			questionText: "Ou voulez-vous partir en vacances ?",
			options: [
				{
					optionText: "En Italie", 
					respondents: [ObjectId("655e7571b09c637100ad482b")]
				},
				{
					optionText: "En espagne", 
					respondents: [ObjectId("655e7973b09c637100ad482e")]
				}
			]
		}
	]
})



db.surveys.find({ _id: ObjectId("655f2ed2748905a9ad5ada74") })



db.surveys.deleteOne({ _id: ObjectId("655f2ed2748905a9ad5ada74") })



db.surveys.updateOne(
  { _id: ObjectId("655f2f35748905a9ad5ada75") },
  { 
	$set: { 
		"questions.0.questionText": "Ou voulez-vous manger ce soir ?",
		"questions.1.options.1.optionText": "Au Canada"
	} 
  } 
)