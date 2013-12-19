Jeremy's Contributions to the Math Help Queue

I contributed mostly to the Student and TA views and controllers. Craig and Adam had already created the model and a bare bones structure of views and controllers, so I took what they had created and implemented most of the functionality.

I started off adding several views for students. They need to be able to add a course to their account, create a help request and have a 'waiting for help' page. 
	[d5d7bb2266](https://github.com/craig8196/math-help-queue/commit/d5d7bb2266ab1b5c9f6be30dff6078dcee3415b0)
	[769fc826c2](https://github.com/craig8196/math-help-queue/commit/769fc826c2b615cfb1e382dd415e3b7fbc5db3fe)

I created a timer in javascript so students can see how long they have been waiting for help and tas can see how long they have been helping a student.
	[46d94ff8b3](https://github.com/craig8196/math-help-queue/commit/46d94ff8b3cf1a43b134d5d20218a2216689cb42)

I added a "helping student" view for TAs where they go after they pop a student off the queue. This shows them the student's name and which chapter and problem they need help with
	[b4a05eaceb](https://github.com/craig8196/math-help-queue/commit/b4a05eaceb7c7df78373d26c1f5aca8e1d0213c6)

Most of these views weren't actually getting real data from the model. Probably the hardest part of this project was figuring out Rails' Active Record Query Interface so I could do that. After several hours of digging around online and experimenting, I was able to start figuring things out. I implemented the "Help Student" button in the TA view that actually pops the top student off the queue and displays the information about their help request to the TA.
	[96903d0967](https://github.com/craig8196/math-help-queue/commit/96903d096774fda05adfc058cf789b6bfa0c3c69)
	[6cc9244c11](https://github.com/craig8196/math-help-queue/commit/6cc9244c1124dcf5c61fb088570d0ac10f08d267)

As I got a grasp of how to communicate with the database, I realized that we needed to make some changes to the model. In order to fully implement all of the necessary features, we might need to completely redesign our model. However, in order to get most of the functionality I made a few relationship changes. I created a course-user join table and added some attributes to requests. This then allowed me to finish the add_course, create_request, and get_help functionality for students, and the help_student functionality for TAs.
	[1fd4cd8196](https://github.com/craig8196/math-help-queue/commit/1fd4cd81967dc3030b76f0fceddd4bafec587a97)
	[36640960a5](https://github.com/craig8196/math-help-queue/commit/36640960a5e3ab3e5c44f6eec43ade2e423788d4)
	[6cc9244c11](https://github.com/craig8196/math-help-queue/commit/6cc9244c1124dcf5c61fb088570d0ac10f08d267)