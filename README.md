# CS336_Project_Spring_2021
CS 336 - Principles of Information and Data Management Final Project

# For Submission
- Five users will pre-created, do not create a user with the same username
  -   |Username|Password|
    ---|---|
    |user1|user1|
    |user2|user2|
    |user3|user3|
    |user4|user4|
    |user5|user5|
- Two customer representative login credentials will be created
  - |Username|Password|
    ---|---|
    |admin|admin|
    |rep1|rep1|
    
# How to work git and github
- Setup Database connection
  - `Java Resources -> src ->com.cs336pkg -> ApplicationDB.java
  - `line 15` and `line 16` update with your username and password
- ALWAYS DO THESE WHENEVER YOU START WORKING
  - open a terminal (ex: right-click `CS336_Group_55`and click `Show in Local Terminal`)
  - `git checkout main`
  - `git pull`
  - `git checkout <your branch>` (ex: `git checkout Tyler`)
  - `git merge main`
- Saving work
  - `git add .`
  - `git commit -m "<appropriate message> (ex: finished userStart.jsp)"
  - `git push`


## Setup
### Install
- Apache Tomcat 7
- Eclipse
- JRE

### SQL Setup
- Clone the repository
- Open MySQL Workbench
  - `File -> Open SQLScript` Find `createDatabase.sql`
  - Click the lightning bolt to run the script and create the database if not already created

### Eclipse Setup
- In Eclipse, `File -> Import -> General -> Existing Projects into Workspace`
  - Select `CS336_Group_55`
  - Repeat Process for `Servers`
 - In the `Project Explorer` locate `CS336_Group_55 -> Java Resources -> src -> com.cs336.pkg -> ApplicationDB.java'
  - Change `line 16` to appropriate URL and Port
  - Change `line 34` to appropriate username and password
- May have to re-add Tomcat Server `Window -> Preferences -> Server -> Runtime Enviroment -> Add...`
- Right Click `CS336_Group_55` `Run As -> Run On Server -> Finish`



  
