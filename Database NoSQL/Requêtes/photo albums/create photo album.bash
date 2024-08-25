db.createCollection("photoAlbums",
	{
		validator: {
			$jsonSchema: {
				bsonType: "object",
				required: ["event", "photos"],
				properties: {
					_id: {
						bsonType: "objectId"
					},
					event: {
						bsonType: "objectId",
						description: "Événement lié à l'album photo"
					},
					photos: {
						bsonType: "array",
						items: {
							bsonType: "object",
							properties: {
							  author: { bsonType: "objectId" },
							  imageUrl: { bsonType: "string" },
							  comments: {
									bsonType: "array",
									items: {
										bsonType: "object",
										properties: {
											author: { bsonType: "objectId" },
											content: { bsonType: "string" }
										},
										additionalProperties: false
									}
								}
							},
							additionalProperties: false
						},
						description: "Liste des photos de l'album"
					}
				},
				additionalProperties: false
			}
		},
		validationAction: "error",
		validationLevel: "strict"
	}
)

