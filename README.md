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

![TimeLine](https://user-images.githubusercontent.com/43663301/82162117-ac6b7b80-9867-11ea-8797-94f349276f31.PNG)

![Table6](https://user-images.githubusercontent.com/43663301/82162189-33b8ef00-9868-11ea-89d8-eb8f57fe837d.PNG)

![Route](https://user-images.githubusercontent.com/43663301/82162192-3a476680-9868-11ea-9343-0630106e3519.PNG)

![Table2](https://user-images.githubusercontent.com/43663301/82162406-c3ab6880-9869-11ea-9274-777c139a2ac6.PNG)

![InfoFlow](https://user-images.githubusercontent.com/43663301/82162423-e63d8180-9869-11ea-9861-344728a9eaab.png)

![Table1](https://user-images.githubusercontent.com/43663301/82162581-3ff27b80-986b-11ea-8ed6-83c2ec744be6.PNG)

![Table2](https://user-images.githubusercontent.com/43663301/82162587-43860280-986b-11ea-8a36-e661ae16686a.PNG)

![Table3](https://user-images.githubusercontent.com/43663301/82162588-45e85c80-986b-11ea-89db-551d1a32952b.PNG)

![Table4](https://user-images.githubusercontent.com/43663301/82162590-4aad1080-986b-11ea-8abd-61b37e6285ce.PNG)

![Table5](https://user-images.githubusercontent.com/43663301/82162591-4c76d400-986b-11ea-873f-a253df12812f.PNG)
