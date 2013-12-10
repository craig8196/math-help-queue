# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#populate courses
courses = [{:title => "All", :discipline => "Admin", :number => 0},
           {:title => "Calculus 1", :discipline => "Math", :number => 112}, 
           {:title => "Calculus 2", :discipline => "Math", :number => 113}, 
           {:title => "Fundamentals of Mathematics", :discipline => "Math", :number => 290}, 
           {:title => "Linear Algebra", :discipline => "Math", :number => 313}, 
           {:title => "Multivariable Calculus", :discipline => "Math", :number => 314}, 
           {:title => "Differential Equations", :discipline => "Math", :number => 334}, 
           {:title => "Introduction to Programming", :discipline => "C S", :number => 142}, 
           {:title => "Data Structures", :discipline => "C S", :number => 235}, 
           {:title => "Discrete Structure", :discipline => "C S", :number => 236}, 
           {:title => "Advanced Programming Concepts", :discipline => "C S", :number => 240}, 
           {:title => "Internet Programming", :discipline => "C S", :number => 360}]
courses.each do |course|
  Course.create(course)
end

#populate privileges
privileges = [{:privilege_type => "admin", :section => 0}, 
              {:privilege_type => "ta", :section => 1},
              {:privilege_type => "student", :section => 2}]
privilege_courses = [{:discipline => "Admin", :number => 0},
                     {:discipline => "Math", :number => 112},
                     {:discipline => "Math", :number => 112}]
                     
[privilege_courses, privileges].transpose.each do |privilege_course, privilege|
  pc = Course.find_by(privilege_course)
  Privilege.create(privilege.merge({:course_id => pc.id}))
end

#populate users
users = [{:username => "Craig"}, 
         {:username => "Ryan"}, 
         {:username => "Adam"}, 
         {:username => "Jeremy"},
         {:username => "TA"},
         {:username => "Stoodent"}]

privilege_types = ["admin",
                   "admin",
                   "admin",
                   "admin",
                   "ta",
                   "student"]

[users, privilege_types].transpose.each do |user_info, privilege_type|
  user = User.create(user_info)
  privilege = Privilege.find_by_privilege_type(privilege_type)
  user.privileges << privilege
end



