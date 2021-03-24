# CS336_Project_Spring_2021
CS 336 - Principles of Information and Data Management Final Project

# Install
- Apache Tomcat 7
- Eclipse
- JRE

# SQL Setup
- Clone the repository
- Open MySQL Workbench
  - `File -> Open SQLScript` Find `createDatabase.sql`
  - Click the lightning bolt to run the script and create the database if not already created

# Eclipse Setup
- In Eclipse, `File -> Import -> General -> Existing Projects into Workspace`
  - Select `CS336_Group_55`
  - Repeat Process for `Servers`
 - In the `Project Explorer` locate `CS336_Group_55 -> Java Resources -> src -> com.cs336.pkg -> ApplicationDB.java'
  - Change `line 16` to appropriate URL and Port
  - Change `line 34` to appropriate username and password
- May have to re-add Tomcat Server `Window -> Preferences -> Server -> Runtime Enviroment -> Add...`
- Right Click `CS336_Group_55` `Run As -> Run On Server -> Finish`

# Notes
- No login credentials will be created for normal users
- Two customer representative login credentials will be created
  - |Username|Password|
    ---|---|
    |admin|admin|
    |rep1|rep1|

  
