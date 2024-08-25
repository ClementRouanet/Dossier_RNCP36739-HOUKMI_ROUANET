db.createCollection( "users",
	{
		validator : { 
			$jsonSchema: {
				bsonType: "object",
				required: ["firstname", "lastname", "email", "age"],
				properties: {
					_id: {
						bsonType: "objectId"
					},
					firstname: {
						bsonType: "string",
						description: "Prénom de l'utilisateur"
					},
					lastname: {
						bsonType: "string",
						description: "Nom de l'utilisateur"
					},
					email: {
						bsonType: "string",
						pattern: ".+@.+\..+",
						description: "Email de l'utilisateur"
					},
					age: {
						bsonType: "int",
						minimum: 16,
						description: "Age de l'utilisateur"
					},
					phonenumber: {
						bsonType: "string",
						pattern: "^[0-9]{10}$",
						description: "Numéro de téléphone de l'utilisateur",
					},
					address :{
						bsonType: "object",
						properties: {
							number: { bsonType: "string" },
							street: { bsonType: "string" },
							zipcode: { bsonType: "string" },
							city: { bsonType: "string" },
							country: { bsonType: "string" }
						},						
						description: "Adresse de l'utilisateur",
					}
				},
				additionalProperties: false
			}
		},
		validationAction: "error",
		validationLevel: "strict"		
	}
)


db.users.createIndex({ email: 1 }, { unique: true })
