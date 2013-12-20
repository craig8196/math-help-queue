# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#populate courses
courses = [{:title => "Calculus 1", :discipline => "Math", :number => 112}, 
           {:title => "Calculus 2", :discipline => "Math", :number => 113}, 
           {:title => "Fundamentals of Mathematics", :discipline => "Math", :number => 290}, 
           {:title => "Linear Algebra", :discipline => "Math", :number => 313}, 
           {:title => "Multivariable Calculus", :discipline => "Math", :number => 314}, 
           {:title => "Differential Equations", :discipline => "Math", :number => 334}]
=begin
           {:title => "Introduction to Programming", :discipline => "C S", :number => 142}, 
           {:title => "Data Structures", :discipline => "C S", :number => 235}, 
           {:title => "Discrete Structure", :discipline => "C S", :number => 236}, 
           {:title => "Advanced Programming Concepts", :discipline => "C S", :number => 240}, 
           {:title => "Internet Programming", :discipline => "C S", :number => 360}]
=end

courses.each do |course|
  Course.create(course)
end

#populate users
users = [{:username => "dz33", :privilege_type => "admin"},
         {:username => "cj264", :privilege_type => "admin"}, 
         {:username => "ryan", :privilege_type => "admin"}, 
         {:username => "adam", :privilege_type => "admin"}, 
         {:username => "jeremy", :privilege_type => "admin"},
         {:username => "ta", :privilege_type => "ta"},
         {:username => "student", :privilege_type => "student"}]

users.each do |user_info|
  user = User.create(user_info)
end



