%w[user publisher moderator admin].each { |name| Role.create(name: name) }

user = User.create(email: "test@test.com", password: "testest")
user.pseudonyms.create(name: "testtest")
UserRole.create(role: Role.admin, user: user)
