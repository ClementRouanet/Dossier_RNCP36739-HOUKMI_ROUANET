db.photoAlbums.updateOne(
  { _id: ObjectId("") },
  { 
	$set: { 
		"photos.?.imageUrl": "",
		"photos.?.comments.?.content": ""
	} 
  } 
)