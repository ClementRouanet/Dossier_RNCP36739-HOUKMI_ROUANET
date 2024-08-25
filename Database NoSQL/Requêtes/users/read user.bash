Requêter tous les users :

db.users.find({})



Requêter un user grâce à son mail :

db.users.find({ email: "" })



Requêter un user grâce à son id mongodb :

db.users.find({ _id: ObjectId("") })