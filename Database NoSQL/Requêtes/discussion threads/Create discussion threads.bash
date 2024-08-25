db.createCollection("discussionThreads", 
	{
		validator: {
			$jsonSchema: {
				bsonType: "object",
				required: ["linked", "messages"],
				properties: {
					_id: {
						bsonType: "objectId"
					},
					linked: {

						bsonType: "object",
						properties: {
							id: { bsonType: "objectId" },
							connected: { bsonType: "string", enum: ["event", "group"]}
						},
						additionalProperties: false,
						description: "Lien vers un événement ou groupe"						
					},
					messages: {
						bsonType: "array",
						items: {
							bsonType: "object",
							properties: {
								author: { bsonType: "objectId" },
								content: { bsonType: "string" },
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
							additionalProperties: false,
							description: "Liste des messages du fil de discussion"
						}
					}
				},
				additionalProperties: false
			}
		},
		validationAction: "error",
		validationLevel: "strict"
	}
)
