Ryan's Contributions
--------------------

* Created the initial wireframe with changes and improvements later made by Craig
* Spent many hours trying to download mysql2, without success, helping to lead to the change of developing with sqlite3 instead
* Created a new account creation page, only to realize it was not necessary because of the use of BYU net IDs and passwords to log in
* Created most of the CSS that we used for the final product, as found in sessions.css.scss. Made many changes and improvements along the way
* Designed the layout of almost all of our view pages and implemented the CSS within them
* Created the students "get_help" view, adding the functionality in the controller to add requests in the database when a student requests help
* Added the functionality of viewing the current help queue to the TA home page by accessing all requests in the database, which was later changed by group members to accessing active requests
* Added the drop-down selector to the add_course page
* Added the ability to select a course on student create_request page, the same page where the student gives a chapter and problem number, but this is not implemented because it was deleted in git conflict resolution
* Changed the database to add a users_courses join table, but it was deleted through confusion about git conflict resolutions, and later implemented again, I believe, by Jeremy
* Made it so the log_out button appears on each page by the "Math Help Q" header
* Changed the get_help page so that it can be refreshed to update the current position in the queue, and added the ability for the student to cancel the request
* Added the ability for a user to see different views depending on their privileges. This had been implemented before by Adam, but in a different way
* Added methods to the User model to check to see if the user was a TA or an administrator
* Added the ability to see which class, chapter number, and problem number each student was requesting help for (on the TA home page) but this was not implemented because it was deleted in GitHub conflict resolution
* Changed the routing so that, for example, an administrator, when using student or ta functionality, would have links to the respective home pages instead of to the administrator home page for better coherence
* Helped answer some of the questions about Rails that other group members had

Comments: 

I really enjoyed helping to build and design this web application, and I wish that we had been able to collaborate with the math lab more to see if they might actually use our application. I wish that I had understood using "git" and GitHub better from the beginning, though Craig helped me a lot to know how to use it. I enjoyed working with my group, and I think that everyone contributed nicely to the application.   