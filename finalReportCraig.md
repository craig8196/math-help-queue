Final Report
============

Description
-----------

The purpose of the site is to allow students to sign up for help in the math lab using a mobile device.  Additionally, the site would allow administrators to add or remove classes, and export data the Math Department could use.

Currently a user can have administrative, teaching assistant, or student privileges.  Administrators can add and remove classes, teaching assistants can remove students from the help queue, and students can add classes and submit requests for help.  Every user is granted a minimum of student privileges and can login using their BYU net ID and password.

Database Schema
---------------

The database design can be seen [here](databaseDesign.pdf).  The database has five tables including: users, courses, requests, privileges, and privileges_users.  Every table automatically has a row id and two timestamps, last updated and created.  The users table contains the username, and currently nothing else since the user is authenticated through BYU's LDAP server.  The courses table tracks the title, discipline, and course number, where discipline is "Math" or "C S".  The privileges table tracks what users have access to; each record contains the privilege type, section number and course id. The requests table contains the user id for who created the request, the course id, the chapter and problem number being worked on, and a boolean flag that represents the active/inactive state of the request.  The privileges_users table is a join table since many users will share similar privileges, thus there is a many to many relationship between users and privileges.

Contributions
-------------

The contributions for each member is as follows:

1.  Craig's Contributions:
    *  Created the initial repository and rails framework.
    *  Continued the wireframework design started by Ryan.
    *  Designed the database.
    *  Generated the Rails Migrations and Models that would allow us to use the database.
    *  Added restrictions and relations to the Models, such as which items are unique and how a user is related to privileges.
    *  Added some helper methods to the Models, such as a way to ensure that a validated user has a record in the database.  Also, a convenience method that finds the highest privilege level of a user.
    *  Created the login screen.
    *  Added minor security measures to prevent basic tampering, such as session timeouts and fixed session prevention.  SSL is easily added, but is excluded for development purposes.  Also, authentication with BYU's LDAP server uses Simple TLS; there are also checks to prevent guest account access, which would occur if the user were to leave the password field blank upon login.
    *  Added the ability to use BYU's system for user authentication.
    *  Answered questions and attempted to explain Rails to group members to the best of my ability.
    *  Restructured the view since some buttons were duplicated, scattered, misplaced, or non-uniform.

2. Adam's Contributions:
	*  See [adam's report](adamsReport.pdf)
	*  Note that some of my work was modified by others and may not appear as it originally did.
	   (an example is the change perspective button being renamed as "admin view," "student view," etc.

Future Work
-----------

Future improvements would be as follows:

1.  Get the project deployed on a server.
2.  Rework the view of the site since it doesn't display or scale very well on laptops or mobile devices.
3.  Polish off the functionality.  For example there are no divisions for the TAs, so each TA can view all of the help queue.  The administrator should be able to grant TA access to specific classes or even to groups of classes.  The TA should be able to see the course a student is in on the help queue.
4.  Allow the administrator to export data.
5.  TAs in the math lab may not have a mobile device.  Thus another method to allow them to login would be needed.  The same goes for students.
6.  The current database design may not be the best design for the desired functionality.  I would suggest a rigorous redesign in that area.
    
    