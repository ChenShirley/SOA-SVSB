# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

the_admin = [
  {:email => 'admin@gmail.com', :password => '11111111', :password_confirmation => '11111111'}
]

Admin.send(:attr_accessible, :email, :password, :password_confirmation)
the_admin.each do |admin|
  Admin.create!(admin)
end
