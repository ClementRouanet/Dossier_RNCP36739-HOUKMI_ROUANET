db.discussionThreads.updateOne(
  { _id: ObjectId("") },
  { 
	$set: { 
		"messages.?.content": "",
		"messages.?.comments.?.content": ""
	} 
  } 
)