I. Overview
1. Project Title
Google Scholar Data Visualization System (Scholarview)

2. Project Summary
Our project is a data visualization platform that features information about CS professors at UIUC, including short biography, education, interests, classes taught, and a brief timeline, along with information pertaining to their publishings on Google Scholar, such as most commonly used words, the scholar’s top publishers, who they collaborated with ,etc. Upon landing on the home page, users can sign in or sign up, or just go ahead and search up scholars without signing in. Users can also rate a scholar’s courses on several metrics such as quality of lectures, difficulty of exams, etc. The user interfaces demonstrated by Figure 5, Figure 6, Figure 7, and Figure 8 in APPENDIX.

II. Frontend
Half of the styles and features (e.g. navigation bar, containers, cards, etc.) of our webpages are imported from Bootstrap, while the other half is Cascading Style Sheets (CSS). We use CSS as a complement to Bootstrap when Bootstrap does provide a needed feature (e.g. the 5-star rating feature), or when we want to adjust Bootstrap styles according to our preferences (e.g. Illini color theme). Besides, we use javascript to modify HTML content according to users’ actions. Looking into Scholar, it has two HTML templates, home.html and scholar.html. 

1. Home.html
home.html  is the home page which comes with sign up and login buttons. To further fulfil the basic requirements, we also added a delete and insert section for deleting a user account and changing the user’s password. Besides the user section, we also have a search bar on the home page. The search bar would allow users to search for specific scholars and view their information.

2. Scholar.html
When a user searches for a scholar, Scholarview returns a scholar’s page with the relevant information for the scholar. On the scholar page, we first present a short biography of the professor, followed by a table summarizing his education, research interest, and teachings. Then comes the timeline of the professor. It is built with amChart and would display dynamically about the experience of a professor, mainly the timeline of when they finished each stage of education and were awarded with academic prizes. Following that are several charts displaying information about the professor’s research, citations of their work, and so on. In the end, we have an evaluation section which allows the user to give ratings for a scholar on the courses he has taught. In addition to the main content, we have a navigation bar which is sticky to the top of the scholar’s page. The navigation bar provides a home link and a second search area.

III. Database and Backend
1. MySQL
Scholarview uses MySQL and MongoDB as the database providers. For MySQL, five tables (i.e., “Articles”, “Scholars”, “Writes”, “Users”, and “Rates”) are created in the database. The relationship between the five tables are demonstrated by Figure 1. “Articles” contain the publication information (e.g. year of publication, number of citations) of a scholar; the data is scraped using the “Publish or Perish” software at https://harzing.com/resources/publish-or-perish. A Scrapy web-crawler is developed to verify the correctness of the output of the software.  “Scholars” contain the basic information of scholars (e.g. short biography,research interest, teachings, etc.) are manually collected from either a scholar’s homepage or the website hosted by the scholar’s home department. “Writes”, which has two columns columns scId (Scholar ID) and aId (article ID), describes the many-to-many relationship between “Scholars” and “Articles”. For example, if a scholar with scId “10” writes an article with aId “217”, it will appear in “Writes” as a record “(10, 217)”. “Users” holds the account information, namely username and password, of Scholarview users. Once a person registers for an account at Scholarview, the entered username and password will be saved in the table for future login verifications. “Rates” is another many-to-many relation table which contains users’ ratings for the courses of scholars. If a user submits an evaluation form, his ratings will be saved in the “Rates” table. Please refer to Table 1, Table 2, Table 3, Table 4, and Table 5 in APPENDIX for the schema (attribute names and data types) and detailed attribute description of “Articles”, “Scholars”, “Writes”, “Users” and “Rates”, respectively.

![ER Design](https://user-images.githubusercontent.com/43663301/82161964-9c9f6780-9866-11ea-9a15-2a930ebd7d93.png)
Figure 1. ER Design of the database

2. MongoDB
The data from the timeline section for Scholarview is maintained in MongoDB, which is a document-based NoSQL database. A timeline is a sequence of major events in a scholar’s academic career. (An example of a timeline stored in MongoDB is illustrated by Figure 2.) Notice the fact that the number of major events varies from scholar to scholar. For example, a scholar who just became an assistant professor might only have graduations and earning awards during the Ph.D. period as his major events, while a distinguished tenured professor can have tens of honorable awards, fellowships, and research grants. Such variance of the timeline data disqualifies MySQL as a database solution. First, the use of MySQL database requires the maintenance of an extra Event ID column, which increases the difficulty of web development. However, MongoDB stores each scholar’s timeline in an individual document which automatically generates and removes Event ID upon insertion and deletion of a record. Second, the selected data from MySQL cannot be directly sent to the frontend for displaying purposes. It usually needs to be converted to JSON to feed most chart APIs (e.g. amCharts, Chart.js, etc.) In contrast, querying MongoDB directly yields results in the JSON format, thus eliminating the post-processing process. 

![TimeLine](https://user-images.githubusercontent.com/43663301/82162117-ac6b7b80-9867-11ea-8797-94f349276f31.PNG)
Figure 2. A Timeline of Prof. Abdussalam Alawini in MongoDB

3. Flask
The backend of Scholarview is implemented with Flask, a micro web framework written in Python. The “flask”, “mysql” and “pymongo” libraries are imported for backend development. The specific functions and the purposes for using them are summarized in Table 6. 
Table 6. Summary of Library Functions Used for Scholarview
![Table6](https://user-images.githubusercontent.com/43663301/82162189-33b8ef00-9868-11ea-89d8-eb8f57fe837d.PNG)
Five routes are defined, “/login”, “/logout”, “/signup”, “/home”, “/search”, “/process”, and “/submit”. A function with the same name is developed for each route. An example of a route and function (/login and login()) is shown in the following interactive window of Visual Studio Code. 

Five routes are defined, “/login”, “/logout”, “/signup”, “/home”, “/search”, “/process”, and “/submit”. A function with the same name is developed for each route. An example of a route and function (/login and login()) is shown in the following interactive window of Visual Studio Code. 
![Route](https://user-images.githubusercontent.com/43663301/82162192-3a476680-9868-11ea-9343-0630106e3519.PNG)

The above function processes the login requests from Scholarview users and redirects to the “/home” route with a parameter. logout() and signup() have similar duties. home() is responsible for properly rendering “home.html”, the template for the homepage, with the parameters received from login, logout and signup. search() receives users’ searching requests submitted from both the homepage and the scholar’s page; it then looks into the “Ratings” database for the user’s rating status (i.e. if a user has rated a scholar’s course); finally, it redirects to process() with a scholar’s name and his rating status. process() communicates with “Scholars”, “Writes” and “Articles” to collect the data necessary for displaying the visualization charts, and renders “scholar.html” with the parameters received from search(). submit() receives the ratings from a user once he submits an evaluation form on “scholar.html”, saves it to “Ratings”, and redirect to process() which rerenders the scholar’s page. 

IV. Functionality
1. Overview
Scholarview provides the following list of functionalities. The category of functions (basic function/advanced function) each functionality demonstrates is appended with parenthesis to the subtitles. 
1.	User System (Advanced Function)
a.	Signup (Basic Function & Advanced Function)
i.	Alerting upon duplicate usernames
ii.	Alerting upon successful signup
b.	Login (Basic Function & Advanced Function)
i.	Alerting upon user DNE (does not exist)
ii.	Alerting upon successful login
iii.	Alerting upon wrong password
c.	Signout (Basic Function & Advanced Function)
i.	Alerting upon signout
2.	Searching
a.	Searching from homepage
b.	Searching from scholar’s page
3.	Visualizing (Basic Function)
a.	Displaying biography, along with education, research interests, and teachings 
b.	Displaying the timeline including the major events in a scholar’s career
c.	Visualizing research work of a scholar with 6 charts (Basic Function)
i.	Keywords of the scholar
ii.	Favorite publishers
iii.	Citation percentage of top journals
iv.	# of papers by # of authors
v.	# of papers by yearly citations
vi.	Scholars who published with the scholar
4.	Rating (Advanced Function)
a.	Providing evaluation forms
i.	Displaying a thank-you message if already evaluated a course
ii.	Displaying a please-login message if user has not logged in
b.	Evaluating courses
i.	5-star ratings
ii.	Allowing evaluation for each course given by the scholar
iii.	Alerting upon submission of a evaluation form

2. Basic Functions
The basic functions of Scholarview are insert, delete, update and search which are implemented throughout the user account system and the visualization system. When a user registers for an account at Scholarview, the request will be sent to the backend, and a stored procedure “createUser”, as illustrated by Figure 3,  will be called. The procedure first checks if the username that the user has entered is already in the database. It will either return 0 if username already exists or return 1 after inserting the user account record into “Users” table if username does not exist.
![Table2](https://user-images.githubusercontent.com/43663301/82162406-c3ab6880-9869-11ea-9274-777c139a2ac6.PNG)

3. Advanced Function
The advanced function of Scholarview is demonstrated by the rating system and the user account system. They together allow a user to rate a scholar’s courses. The challenge of implementing a rating system comes from the complicated software logics and information flow, as illustrated by Figure 4. In this figure, the disks represent the databases; the rectangles represent the route and functions in the backend; the ellipses represent the HTML templates; blue lines describe information flows through HTTP requests, while black lines describe information flow between backend functions and databases.
![InfoFlow](https://user-images.githubusercontent.com/43663301/82162423-e63d8180-9869-11ea-9861-344728a9eaab.png)

Figure 4. Information Flow in the System
As an example, once a user enters the website, the home function will be activated so the user is directed to the home.html page, where he can logout, login, signup, or search by submitting forms. If he logs in or signs up, the corresponding functions will be called; the functions will communicate with the “Users” database, retrieve some information, process it, and rerender home.html with certain parameters. If the user searches for a scholar, the search function will first ask “Ratings” if the user has rated any of the scholar’s courses, the answer from ratings “rated” will be sent back to search(). Then, search() will call process(), passing the scholar’s name and “rated” parameters to it. Next, process() will communicate with MySQL and NoSQL databases to obtain the proper data. Finally, process() will send the processed data and “rated” to scholar.html for rendering. Depending on the value of “rated”, scholar.html will either show or hide an evaluation form. For example, if “rated” tells scholar.html that the user has already rated for the scholar on the course, the evaluation form for the course will be hidden and a thank-you message will be displayed.

While complicated software logic accounts for a challenge, the team struggled with the maintenance of user status (i.e. logged in, logged out), too. In the beginning, we tried to dynamically maintain the user status, meaning we initialize a user status upon website visit, and pass it from function to function during users’ interactions with our website. However, it causes some unresolvable problems. For example, when a user has already logged in from the home page, and for some reason he revisits the home page, his login status will be lost so he needs to go through the login process again. Aiming to have a robust user system, we have applied flask.session function to our backend program. The session function was able to maintain a global variable until the termination of a Flask server session. Thus, user status becomes unaffected by revisits, so a smooth user experience is promised. Therefore, we would suggest future teams which try to implement a user system that flask.session or a similar function should be used.

APPENDIX

Table 1: Schema and Description for the “Articles” MySQL Table
![Table1](https://user-images.githubusercontent.com/43663301/82162581-3ff27b80-986b-11ea-8ed6-83c2ec744be6.PNG)

Table 2: Schema and Description for the “Scholars” MySQL Table
![Table2](https://user-images.githubusercontent.com/43663301/82162587-43860280-986b-11ea-8a36-e661ae16686a.PNG)

Table 3: Schema and Description for the “Writes” MySQL Table
![Table3](https://user-images.githubusercontent.com/43663301/82162588-45e85c80-986b-11ea-89db-551d1a32952b.PNG)

Table 4: Schema and Description for the “Users” MySQL Table
![Table4](https://user-images.githubusercontent.com/43663301/82162590-4aad1080-986b-11ea-8abd-61b37e6285ce.PNG)

Table 5: Schema and Description for the “Rates” MySQL Table
![Table5](https://user-images.githubusercontent.com/43663301/82162591-4c76d400-986b-11ea-873f-a253df12812f.PNG)
