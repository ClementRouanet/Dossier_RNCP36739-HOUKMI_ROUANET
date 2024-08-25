db.createCollection("surveys", 
	{
		validator: {
			$jsonSchema: {
				bsonType: "object",
				required: ["eventId", "questions"],
				properties: {
					_id: {
						bsonType: "objectId"
					},
					eventId: {
						bsonType: "objectId",
						description: "ID de l'événement associé au sondage"
					},
					questions: {
						bsonType: "array",
						items: {
							bsonType: "object",
							required: ["questionText", "options"],
							properties: {
								questionText: {
									bsonType: "string",
									description: "Texte de la question"
								},
								options: {
									bsonType: "array",
									items: {
										bsonType: "object",
										required: ["optionText"],
										properties: {
											optionText: {
												bsonType: "string",
												description: "Texte de l'option"
											},
											respondents: {
												bsonType: "array",
												items: {
													bsonType: "objectId",
													additionalProperties: false
												}
											}
										},
										additionalProperties: false
									},
									uniqueItems: true,
									description: "Liste des options de réponse pour la question"
								}
							},
							additionalProperties: false
						},
						uniqueItems: true,
						description: "Liste des questions du sondage"
					}
				},
				additionalProperties: false
			}
		},
		validationAction: "error",
		validationLevel: "strict"
	}
)
