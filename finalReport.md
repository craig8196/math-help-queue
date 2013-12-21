Final Report
============

Description
-----------

The purpose of the site is to allow students to sign up for help in the math lab using a mobile device and allow TAs to respond to those requests for help.  Additionally, the site would allow administrators to add or remove classes, and export data the Math Department could use.

Currently a user can have administrative, teaching assistant, or student privileges.  Administrators can add and remove classes, teaching assistants can remove students from the help queue, and students can add classes and submit requests for help.  Every user is granted a minimum of student level privileges and can login using their BYU net ID and password (no signing up is necessary).

Database Schema
---------------

The database design can be seen [here](databaseDesign.pdf).  The database has five tables including: users, courses, requests, and users_courses.  Every table automatically has a row id and two timestamps, last updated and date created.  The users table contains the username, and privilege level.  The courses table tracks the title, discipline, and course number, where discipline is "Math" or "C S".  The users_courses table tracks what classes a user has added. Finally, the requests table contains the user id for who created the request, the course id, the chapter and problem number being worked on, and a boolean flag that represents the active/inactive state of the request.

Contributions
-------------

The contributions for each member is as follows:

1.  Craig's Contributions:
    *  Created the initial repository and rails framework to allow everyone to get started.
    *  Continued the wireframework design started by Ryan.
    *  Designed the relational database schema.  Later we found that the original design had some flaws and we switched to a different setup.  The older schema can be see [here](oldDatabaseDesign.pdf).
    *  Generated the Rails Migrations and Models that would allow us to use the database.  Figuring out how to configure the migrations to setup the database correctly took some time, but the system is very robust.
    *  Added restrictions and relations to the Models, such as which items are unique and how a user is related to courses.  Various articles online recommend doing the validatin, and relations through the model classes, thus the database just stores data.
    *  Added some helper methods to the Models, such as a way to ensure that a validated user has a record in the database.  Also, a convenience method that returns the highest privilege level of a user.
    *  Created the login screen/process.
    *  Added the ability to use BYU's system for user authentication.
    *  Added minor security measures to prevent basic tampering, such as session timeouts and fixed session attack prevention.  SSL was also added for security between the user and our website.  Authentication with BYU's LDAP server uses Simple TLS; checks to prevent guest account access were added, which would occur if the user were to leave the password field blank upon login.
    *  Answered questions and attempted to explain Rails to group members to the best of my ability.  I spent lots of time reading up on the features of the Rails framework and was able to get started sooner than others, so I tried to bring them up-to-speed as much as I could.
    *  Restructured the view since some buttons were duplicated, scattered, misplaced, or non-uniform.  Other group members later updated the view to be even better than what I did.  My updates made the buttons too small and it turns out that mobile devices wouldn't display things to the proportions I intended.
    *  Updated some of the code to reflect changes in the database design.  By switching over we had some code using an old, unused table so I made appropriate adjustments to make sure we were on the same page.
    *  Uploaded the project to a hostig site and made appropriate modifications so it is compatible.  This took a lot longer than I expected.  I had to read through many pages of documentation and even after following the directions I found that the site could be a little buggy and slow to respond (which made me start looking at Heroku, which also has its quirks.)
    *  Updated the database design document to reflect changes that have been made.
    
    Other Comments:
    
    The greatest difficulties that our group faced were mostly in learning Ruby and the ins and outs of the Rails framework.  The steep learning curve did make getting started very difficult.  In particular, I found that our initial choice of using the MySQL database for development was poor.  I know that all of the group members struggled with getting it installed on their machines.  We eventually switched to sqlite3 for development, which was a good choice and allowed us to move on.

2. Adam's Contributions:
	*  See [adam's report](adamsReport.pdf)
	*  Note that some of my work was modified by others and may not appear as it originally did.
	   (an example is the change perspective button being renamed as "admin view," "student view," etc.

3. Jeremy's Contributions
    * See [jeremy's report](jeremysReport.md)
	
4. Ryan's Contributions
	* See [ryan's report] (ryansReport.md)

Future Work
-----------

Future improvements would be as follows:

1.  Polish off the functionality.  For example there are no divisions for the TAs, so each TA can view all of the help queue.  Also, a TA should be able to see the course a student is in on the help queue.  Modifying the database design would be needed to achieve this.
2.  Allow the administrator to export data.
3.  TAs in the math lab may not have a mobile device.  Thus another method to allow them to login would be needed, such as having a communal device that everyone could use with a special interface.  The same goes for students.
    
    
