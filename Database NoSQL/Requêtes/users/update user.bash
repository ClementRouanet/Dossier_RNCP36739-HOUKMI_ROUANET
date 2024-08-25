Mettre à jour un user avec son email :

db.users.updateOne(
  { email: "" },
  { 
	$set: { 
		age: ,
		phonenumber: ""
	} 
  } 
)



Mettre à jour un user avec son id mongodb :

db.users.updateOne(
  { _id: ObjectId("") },
  { 
	$set: { 
		age: ,
		phonenumber: ""
	} 
  } 
)