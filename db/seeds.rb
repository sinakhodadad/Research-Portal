# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


admin = User.create({id: 1, first_name: 'ali', last_name: 'hosseini', email: 'ali@ali.com', password: '12345678'})
teacher = User.create({id: 2, first_name: 'fatemeh', last_name: 'ghasemi', email: 'fatemeh@ghasemi.com', password: '12345678'})
student = User.create({id: 3, first_name: 'nooshin', last_name: 'zamiri', email: 'nooshin@zamiri.com', password: '12345678'})
guest = User.create({id: 4, first_name: 'gholi', last_name: 'ghanbar', email: 'gholi@ghanbar.com', password: '12345678'})


roles = Role.create([{id: 1, name: 'admin', priority: 4 , show_in_ui:false},
                     {id:4 , name:'guest' , priority:5, show_in_ui:false},
                     {id: 2, name: 'teacher', priority: 1, show_in_ui:true},
                     {id: 3, name: 'student', priority: 2, show_in_ui:true}])
admin.add_role 'admin'
teacher.add_role 'teacher'
student.add_role 'student'
guest.add_role 'guest'

web_site = Context.create({id: 1, name: 'web site', value_type: 'single_value', location: 'side' , role_id:2})
skill = Context.create({id:2 , name: 'skill' , value_type:'multi_value' , location:'main' , role_id:3})

UserContext.create({user_id:teacher.id , value:'http://google.com' , context_id:web_site.id })
UserContext.create({user_id:student.id , value:'c++' , context_id:skill.id })
UserContext.create({user_id:student.id , value:'c#' , context_id:skill.id })


