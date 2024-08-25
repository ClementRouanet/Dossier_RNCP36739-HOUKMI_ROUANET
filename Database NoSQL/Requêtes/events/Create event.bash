db.createCollection("events", 
	{
		validator: {
			$jsonSchema: {
				bsonType: "object",
				required: ["name", "description", "startdate", "enddate", "place", "organizers"],
				properties: {
					_id: {
						bsonType: "objectId"
					},
					name: {
						bsonType: "string",
						description: "Nom de l'événement"
					},
					description: {
						bsonType: "string",
						description: "Description de l'événement"
					},
					startdate: {
						bsonType: "date",
						description: "Date de début de l'événement"
					},
					enddate: {
						bsonType: "date",
						description: "Date de fin de l'événement"
					},
					place: {
						bsonType: "string",
						description: "Lieu de l'événement"
					},
					organizers: {
						bsonType: "array",
						items: {
							bsonType: "objectId"
						},
						description: "Liste des organisateurs"
					},
					participants: {
						bsonType: "array",
						items: {
							bsonType: "objectId"
						},
						description: "Liste des participants"
					}
				},
				additionalProperties: false
			}
		},
		validationAction: "error",
		validationLevel: "strict"
	}
)
