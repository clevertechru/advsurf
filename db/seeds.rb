# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
#puts 'ROLES'
#YAML.load(ENV['ROLES']).each do |role|
#  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
#  puts 'role: ' << role
#end
#puts 'DEFAULT USERS'
#user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
#puts 'user: ' << user.name
#user.add_role :admin

# encoding: utf-8

# Create the basic reference roles for the application. These are based off the
# roles defined in the reference role.
Reference::Role::TYPES.each do |role|
  actions = case role
    when :admin
      {
          "manage-user" => :all,
          "view-user" => :all
      }
    when :subscriber
      {
          "view-user" => :all
      }
    when :visitor
      {
          "view-user" => :all
      }
  end
  Reference::Role.create!(name: role.to_s, actions: actions)
end