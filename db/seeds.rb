# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
University.create(name: 'Carnegie Mellon University Qatar')
University.create(name: 'Texas A & M University Qatar')
University.create(name: 'Georgetown University Qatar')
University.create(name: 'Weil Cornell University Qatar')
University.create(name: 'Northwestern University Qatar')
University.create(name: 'Virginia Commonwealth University Qatar')
Registrar.create(first_name: 'Admin', last_name: 'Across EC', email: 'talal@cmu.edu', phone: '0097477155015', admin: true, university_id: 1, password: "admin", password_confirmation: "admin")