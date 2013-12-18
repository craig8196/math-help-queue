Math Lab Help Queue
===================


Links to Content
----------------

* [Proposal](Proposal.md)
* [Wireframe Mock-up](http://share.axure.com/LO8O6N/) Keep in mind that the application is going to be designed primarily for mobile devices and to be embedded in websites like Learning Suite.
* [Database Design] (databaseDesign.pdf)
* [Style Guide](StyleGuide.md)
* [Ryan's Milestone] (firstMilestoneRyan.md)
* Craig's [First Milestone] (firstMilestoneCraig.md), [Second Milestone] (secondMilestoneCraig.md), and [Final Report] (finalReportCraig.md).
* Adam's [First Milestone] (firstMilestoneAdam.md) and [Second Milestone] (secondMilestoneAdam.md) and [Final Report] (adamsReport.pdf).


Getting Started
---------------

### Linux:

1. Clone this repository.

2. Install required Ruby Gems as found in the [Gemfile](Gemfile).  Uncomment the `gem 'mysql2'` line to use mysql in the production version.

3. Sqlite3 is used for development and testing.  For production enter your mysql username, password, and host into the respective fields of the [DB Configuration File](config/database.yml).

4. Create the database by executing the following at the command line:

        rake db:setup

5. Run the server:

        rails server
