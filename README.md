Math Lab Help Queue
===================


Links to Content
----------------

* [Proposal](Proposal.md)
* [Wireframe Mock-up](http://share.axure.com/LO8O6N/) Keep in mind that the application is going to be designed primarily for mobile devices and to be embedded in websites like Learning Suite.
* [Style Guide](StyleGuide.md)
* [Ryan's Milestone] (firstMilestoneRyan.md)
* [Craig's First Milestone] (firstMilestoneCraig.md)
* [Adam's First Milestone] (firstMilestoneAdam.md)


Getting Started
---------------

### Linux:

1. Clone this repository.

2. Install required Ruby Gems as found in the [Gemfile](Gemfile).

3. Enter your mysql username, password, and host into the respective fields of the [DB Configuration File](config/database.yml).  This is for production use only.  Sqlite3 is used for development and testing.

4. Create the database by executing the following at the command line:

        rake db:setup

5. Run the server:

        rails server
