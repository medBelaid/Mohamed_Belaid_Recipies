
#  Create an user

puts 'Create a user '
User.first_or_create( email: 'alex@example.com', password: 'password', name: 'Alex' )
