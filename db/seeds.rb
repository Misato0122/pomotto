User.create!(
  name: "sample",
  email: "test_1@test.com",
  password: "password",
  password_confirmation: "password",
  role: "guest"
)

User.create!(
  name: "admin",
  email: "admin@test.com",
  password: "password",
  password_confirmation: "password",
  role: "admin"
)