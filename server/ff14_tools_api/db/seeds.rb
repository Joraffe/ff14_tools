# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create available Permissions
# 'WoL' = "Warrior of Light", meaning a "normal" user of the website
# 'Admin' = super user that will create the non-normal-user specific data
admin_permission = Permission.find_by(name: 'Admin')
Permission.where({ name: 'WoL'}).first_or_create
Permission.where({ name: 'Admin'}).first_or_create
admin_permission = Permission.find_by(name: 'Admin')


# Create the jobine User if it doesn't exist
jobine_user = User.find_by(email: ENV.fetch('JOBINE_SLUG_USER_EMAIL'))
if jobine_user == nil
  User.create!({
    email: ENV.fetch('JOBINE_SLUG_USER_EMAIL'),
    permission_id: admin_permission.id,
    password: ENV.fetch('JOBINE_SLUG_USER_PASSWORD'),
    password_confirmation: ENV.fetch('JOBINE_SLUG_USER_PASSWORD'),
  })
  jobine_user = User.find_by(email: ENV.fetch('JOBINE_SLUG_USER_EMAIL'))
end


# Create the Slugs of Light Static
Static.create!({ name: 'Slugs of Light', user_id: jobine_user.id })
slug_static = Static.find_by(name: 'Slugs of Light')
