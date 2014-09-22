AdminUser.create_with(password: 'password', password_confirmation: 'password').find_or_create_by(email: 'admin@example.com')


Department.create_with(description: "Technical support").find_or_create_by(name: "support")
Department.create_with(description: "production support").find_or_create_by(name: "production")

Priority.find_or_create_by(name: "low")
Priority.find_or_create_by(name: "medium")
Priority.find_or_create_by(name: "high")
Priority.find_or_create_by(name: "emergency")
Priority.find_or_create_by(name: "critical")

Role.find_or_create_by(name: "staff")
Role.find_or_create_by(name: "client")

Status.find_or_create_by(name: "pending")
Status.find_or_create_by(name: "awaiting for users reply")
Status.find_or_create_by(name: "closed")
