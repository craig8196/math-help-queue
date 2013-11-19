Idea: Automated/Online Help Queue For BYU MathLab
=================================================

Problem
    The BYU MathLab currently has physical signup sheets that students and TA’s have to walk to and fill out.  At the end of the day, secretaries have to copy dozens of sheets into an excel program for the Head TA’s and Math Department to use and analyze the information.  The secretaries are currently about 90 sheets behind.  The only information they get is signup time, student name, math class, chapter, problem number, time helped, and TA name.

Solution
    The web app would have a saved profile for students with their current course and professor’s name etc.  They would only have to input which section and which problem number they need help on, and get on the help queue.  They would have a message telling them which number they are in line.  TAs could have a similar system allowing them to pop students off the queue and go help them.  The app would keep track of the same metrics that the signup sheets do, that way Head TAs and the Math Department could easily access that information and query it for things they are interested in (ie. which TA helped the most students, which problem was the most difficult for students etc).

Team
    Craig Jacobson
    Jeremy Oborn
    Adam Nelson
    Ryan Palmer

Other
PROTOTYPE FOR TA HELP QUEUE: http://students.cs.byu.edu/~drbones/tamobileapp/views/
(It’s made for mobile, so shrink down your screen to a phone size, this was done for CS 256)

    
Features

Minimal Features
Create user profile
Each math lab student could create their own user profile, which could be personalized according to the classes they are currently taking.
Create TA profile
Each TA could create a profile, which would display their strengths, math level (lower division, upper division), and schedules.
Sign into profile
Students and TAs could sign in with their net ID and a password.
Edit profile
Students and TAs can edit and customize their profile.
Request help
Perhaps the most important feature of this application, once signed in, students could simply press a button to request help after indicating which class they want help with, and the server would log the time and date that they requested help. The server could send all of the data that the Math Department wants about each request to a database.
Get next student in line
TAs could dequeue the next student that needs help, with the server logging the time that the TAs helped the student. Ideally, the application would inform the TA of the location of the student in the room.
Get hint for problem
Students can see any hints that TAs may have added to the database for a specific problem or a specific type of problem.
TA can submit hint
Any TA would be able to submit a hint which all students could see whom it might be relevant to. For example, if a TA was seeing that many students were having a problem with the same concept, he or she could post a hint to try to clarify it.
Check TA availablity/work schedule
Students would be able to see TA availability and schedules.
Students give a review of TA performance/problems
These reviews be accessible by whoever hires or is in charge of the TAs.
Export data
Administrators would be able to download data in a simple .csv format, which could then be used in excel or other applications.  This data should be at a minimum the exact same data that is currently obtained from the physical sign-up sheets.

Extra Features
Submit response/homework
Student homework would be accessed and completed through the application directly.
Check answer
Students could check their answers to specific homework problems.
TA can access answer/step-by-step solution
For every problem there would be a step-by-step solution that TAs could access in the database to better help students.
Broadcast group help session in progress
TAs would be able to send out a notification that they were about to go over a problem or concept on the board for a group.
Email professor directly from app
Both students and TAs could email a professor directly from the app with any concerns they might have.
Export/download analysis
The math department would be able to access data, charts, and graphs about the activity with regards to the help queue in the math lab (as opposed to just data).
Tutorial
Video tutorials for students and TAs on how to effectively use the application.
Request specific TA
Allow the student to request a specific TA, however, the request may not be granted depending lab busyness.  This may also aid in finding TAs that are really good, or even find TAs that give out answers or do the student’s work for them.


Application Architecture

Ruby on Rails, MySQL, and Ember.
