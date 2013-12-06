# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

courses = [{:title => "Calculus 1", :discipline => "Math", :number => 112}, 
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


users = [{:username => "Craig"}, 
         {:username => "Ryan"}, 
         {:username => "Adam"}, 
         {:username => "Jeremy"}]
users.each do |user|
  User.create(user)
end
