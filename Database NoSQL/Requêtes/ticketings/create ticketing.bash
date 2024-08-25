db.createCollection("ticketings", 
	{
		validator: {
			$jsonSchema: {
				bsonType: "object",
				required: ["event", "tickets"],
				properties: {
					_id: {
						bsonType: "objectId"
					},
					event: {
						bsonType: "objectId",
						description: "Billetterie liée à la l'événement"
					},
					tickets: {
						bsonType: "array",
						items: {
							bsonType: "object",
							properties: {
								ticketType: { bsonType: "string" },
								amount: { bsonType: "double" },
								quantity: { bsonType: "int" }
							},
							additionalProperties: false			
						},
						description: "Liste des types de billets disponibles"
					},
					ticketsSold: {
						bsonType: "array",
						items: {
							bsonType: "object",
							properties: {
								ticketType: { bsonType: "string" },
								participant: { bsonType: "objectId" },
								purchaseDate: { bsonType: "date" }
							},
							additionalProperties: false			
						},
						description: "Liste des billets vendus"
					}
				},
				additionalProperties: false
			}
		},
		validationAction: "error",
		validationLevel: "strict"
	}
)
