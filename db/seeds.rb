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
Registrar.create(first_name: 'Talal', last_name: 'Shoeb', phone: '77155015', email: 'talal@cmu.edu', university_id: 1, admin: true, password: 'hello', password_confirmation: 'hello')
Deadline.create(semester: 'Fall 2013', start_of_registration: Date.parse("2013/04/21"), start_of_classes: Date.parse("2013/09/01"))
Registrar.create(first_name: 'Bianca', last_name: 'Van Zundert', phone: '44548433', email: 'biancaz@qatar.cmu.edu', university_id: 1, admin: false, password: 'hello', password_confirmation: 'hello')
Registrar.create(first_name: 'Tracy', last_name: 'Van Welde', phone: '44230588', email: 'tracy.van_welde@qatar.tamu.edu', university_id: 2, admin: false, password: 'hello', password_confirmation: 'hello')
Student.create(first_name: 'Talal', last_name: 'Shoeb', mobile: '12345678', email: 'tshoeb@qatar.cmu.edu', student_number: 12345678, major: "Information Systems", university_id: 1, active: true, password: 'hello', password_confirmation: 'hello', year_of_graduation: Date.years_since(1))
Student.create(first_name: 'Nawal', last_name: 'Behih', mobile: '12345678', email: 'nbehih@qatar.cmu.edu', student_number: 12345678, major: "Information Systems", university_id: 1, active: true, password: 'hello', password_confirmation: 'hello', year_of_graduation: Date.years_since(1))
Student.create(first_name: 'Zuhair', last_name: 'Ghalib', mobile: '12345678', email: 'zzg@qatar.cmu.edu', student_number: 12345678, major: "Chemical Engineering", university_id: 2, active: true, password: 'hello', password_confirmation: 'hello', year_of_graduation: Date.years_since(1))
Student.create(first_name: 'Hawra', last_name: 'Abdulla', mobile: '12345678', email: 'hmabdull@qatar.cmu.edu', student_number: 12345678, major: "Electrical and Computer Engineering", university_id: 2, active: true, password: 'hello', password_confirmation: 'hello', year_of_graduation: Date.years_since(1))