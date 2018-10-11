# README

We would like you to build a Question and Answer application meant for internal use. The application doesn’t need styling, but it should be functional according to the following specifications:

-	Users can submit questions
-	Users can submit answers to questions
-	Questions can be searched by title, and body (you can ignore answers)

We would also like for you to submit a short write up of the project and include unit tests. Please make sure you have the usual business logic so you check for blank fields etc and handle 404's etc in a graceful manner i.e. a simple standard error page saying we are looking into the problem is fine.

You can use SQLite or another database if your choice.


## First iteration 
generate a base application and add the files to repo in github

- Focus on adding the three objects neccessary to the app and defining validations and relationships between them (Users, Questions, Answers)

1. Create base app with rails new *app_name*
2. Generate User scaffold
3. Generate Question scaffold
4. Generate Answer scaffold
5. Edit user model to require a name and email; define rel to question/answers (has_many)
6. Edit question model to require user, title and text; define rel to users/answers (belongs_to/has_many)
7. Edit answer model to require user, question and text; define rel to users/questions (belongs_to)

## Second iteration
add production setup to deploy base application to heroku using postgresql instead of sqlite(not supported by heroku)

1. Edit Gemfile
2. Create heroku app from command line
3. Run bundle and push changes to heroku
4. migrate in production

## Third iteration
add the required test to ensure objects behave and interact as they should, then add the search functionality to app

- Testing controller behaviour mainly
- Only adding feature specs for two important elements sign in and search

1. Test that the model validations work as expected
2. Test controller actions work as expected
3. Write failing feature test for search functionality
4. Create search feature that satisfies the tests
5. Write feature test for sign in flow
6. Create custom error pages in /public folder

## Next steps (out of scope)
1. Users should only be allowed to edit/delete their own questions and answers (add policies)
2. Add factories for specs to avoid creating objects in tests
3. Add upvoting functionality to show the most popular answer to a question



