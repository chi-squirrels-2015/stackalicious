matt = User.create(name: "Matthew Gray", email: "m@m.com", password: "password")
kara = User.create(name: "Kara Carrell", email: "k@k.com", password: "password")

q1 = Question.create(question: "What is the color of the sky?", creator: matt)
q2 = Question.create(question: "Why are the El trains always so fucked up?", creator: kara)

q1.votes.create(voter: kara)
q1.answers.create(answer: "Uhhhh, blue?! Are you for real?", creator: kara)
q1.answers.first.votes.create(voter: matt)

q2.votes.create(voter: matt)
q2.answers.create(answer: "Rahm Emmanuel. 'Nuff said.", creator: matt)
q2.answers.first.votes.create(voter: kara)
