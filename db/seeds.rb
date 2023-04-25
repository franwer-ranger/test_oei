Edition.where(start_date: "2021-01-01").first_or_create
Edition.where(start_date: "2022-01-01").first_or_create
Edition.where(start_date: "2023-01-01").first_or_create

School.where(name: "Educación").first_or_create
School.where(name: "Lenguas").first_or_create
School.where(name: "Ciencia y Cultura").first_or_create
School.where(name: "Cooperación").first_or_create

Topic.where(name: "Infantil", school_id: 1).first_or_create
Topic.where(name: "Competencias digitales", school_id: 1).first_or_create
Topic.where(name: "Gobernanza", school_id: 1).first_or_create
Topic.where(name: "Portugués", school_id: 2).first_or_create
Topic.where(name: "Educación artística", school_id: 3).first_or_create
Topic.where(name: "Divulgación científica", school_id: 3).first_or_create
Topic.where(name: "Cooperación", school_id: 4).first_or_create

Course.where(name: "Especialista en cooperación internacional", topic_id: 7).first_or_create
Course.where(name: "Divulgación y cooperación de la ciencia", topic_id: 6).first_or_create
Course.where(name: "Comprendiendo el portugués", topic_id: 4).first_or_create