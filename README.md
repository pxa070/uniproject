# StudyHub Web Application Setup Guide
This guide details the steps required to successfully setup the StudyHub 
application on your local development network.

# 1. Setup Environment

Prior to the setup, ensure the following software is installed on your
machine: 

- Node.js (tested on v21.6.0)
- npm (tested on 10.2.4)
- PostgreSQL (default port 5432, postgres 16.2)

Also, you will need to:

- Setup PostgreSQL, and start the server. Note the database host, user, password and port (default is 5432). Create a database named uniproject.
- Clone the repository or download it as a ZIP and extract it into a folder.
- Locate the two  .env files: one at the root directory for the frontend/, and the other in the backend/ directory for the backend.

# 2. Setting Up the Backend 

1. Navigate to the backend folder:  From the room directory, change into the backend folder.
2. Edit the .env file in the backend. Update it with your database credentials (host, usually localhost or 127.0.0.1, port, username, password and database/db name 'uniproject'). 

Below the statement "DO NOT CHANGE", the variables should remain the same, e.g. openAI key will remain unchanged for functionality reasons.
Under the statement you will find the api keys for mailgun, google search api and open ai api. In addition, the mailgun domain used can be found alongside the mailgun domain. 

3. Create the database tables, run this command to import the database dump:
               
psql -U username -d uniproject -f  path_to_uniproject_dump.sql

Replace 'username' with your PostgreSQL username. 
Replace ' path_to_uniproject_dump.sql' with the actual path to 'output_file.sql'

4. Connect to the database and check if the tables and sequence are set up correctly, by running this command in the project directory: 

psql -U username -d uniproject

Then displaying tables by submitting '\dt' and '\d' followed by the table you would like to view.

5. Install the backend dependencies: Run npm install in the backend directoy.


# 3. Setting Up the Frontend

1. Configure the frontend .env file, which is simple: 

- REACT_APP_API_URL='http://localhost:3001'

2. Install frontend dependencies: Run npm install in the frontend. 

# 4. Running the server and Frontend

1. Ensure PostgreSQL server is running.
2. Open the backend terminal; execute the command 'npm run dev' to start the server
3. Run 'npm start' in the frontend directory terminal, to run the frontend.

Now your StudyHub web application should be accessible via http://localhost:3000 (or whichever port you configured)

# 5. Default User credentials: 

- Admin  Username: admin
- Admin User Password: admin
- Student 1 Username : gursimran
- Student 1 Password: simran
- Student 2 Username: joginder
- Student 2 Password: joginder