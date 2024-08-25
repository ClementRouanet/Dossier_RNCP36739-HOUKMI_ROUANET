db.surveys.updateOne(
  { _id: ObjectId("") },
  { 
	$set: { 
		"questions.?.questionText": "",
		"questions.?.options.?.optionText": ""
	} 
  } 
)