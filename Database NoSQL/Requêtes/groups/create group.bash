db.createCollection("groups",
	{
		validator: {
			$jsonSchema: {
				bsonType: "object",
				required: ["name", "description", "type", "admins"],
				properties: {
					_id: {
						bsonType: "objectId"
					},
					name: {
						bsonType: "string",
						description: "Nom du groupe"
					},
					description: {
						bsonType: "string",
						description: "Description du groupe"
					},
					type: {
						bsonType: "string",
						enum: ["private", "public", "secret"],
						description: "Type de groupe (public, privé, secret)"
					},
					admins: {
						bsonType: "array",
						items: {
							bsonType: "objectId"
						},
						description: "Liste des administrateurs"
					},
					members: {
						bsonType: "array",
						items: {
							bsonType: "objectId"
						},
						description: "Liste des membres"
					}
				},
				additionalProperties: false
			}
		},
	validationAction: "error",
	validationLevel: "strict"
	}
)
