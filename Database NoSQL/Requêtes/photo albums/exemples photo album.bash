db.photoAlbums.insertOne({
	event: ObjectId("655e80beb09c637100ad4835"),
	photos: [
		{
			author: ObjectId("655e7571b09c637100ad482b"),
			imageUrl: "https://www.google.com/search?sca_esv=584815692&rlz=1C1CHBF_frFR1067FR1067&sxsrf=AM9HkKkWh2mczzqWbg9CuWXqx3mMqAehEw:1700732389946&q=image+couche+de+soleil&tbm=isch&source=lnms&sa=X&ved=2ahUKEwjEvdfv6dmCAxWkaqQEHXk1DXAQ0pQJegQIDBAB&biw=1536&bih=707&dpr=1.25#imgrc=Un1jyR4eF-05RM",
			comments: [
				{
					author: ObjectId("655e7973b09c637100ad482e"),
					content: "Trop beau ce couché de soleil! :)"
				}
			]
		}
	]
})



db.photoAlbums.find({ _id: ObjectId("655f1ecb748905a9ad5ada71") })



db.photoAlbums.deleteOne({ _id: ObjectId("655f1ecb748905a9ad5ada71") })


db.photoAlbums.updateOne(
  { _id: ObjectId("655f1f0f748905a9ad5ada72") },
  { 
	$set: { 
		"photos.0.imageUrl": "soleil",
		"photos.0.comments.0.content": "trop moche"
	} 
  } 
)