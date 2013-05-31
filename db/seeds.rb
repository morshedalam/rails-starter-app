# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Loading default roles...'

YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({:name => role}, :without_protection => true)
  puts '...' << role
end

puts 'End loading default roles'

puts 'Loading admin...'
user = User.find_or_create_by_email :first_name => ENV['ADMIN_FIRST_NAME'].dup,
                                    :last_name => ENV['ADMIN_LAST_NAME'].dup,
                                    :email => ENV['ADMIN_EMAIL'].dup,
                                    :password => ENV['ADMIN_PASSWORD'].dup,
                                    :password_confirmation => ENV['ADMIN_PASSWORD'].dup

user.add_role :admin

puts 'End creating admin ' << user.name

puts 'Loading user...'
user = User.find_or_create_by_email :first_name => ENV['USER_FIRST_NAME'].dup,
                                    :email => ENV['USER_EMAIL'].dup,
                                    :password => ENV['USER_PASSWORD'].dup,
                                    :password_confirmation => ENV['USER_PASSWORD'].dup

user.add_role :user

puts 'End creating user' << user.name
