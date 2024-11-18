# TwoWeekWait
Humorous app for people trying to conceive. Focuses on good vibes and relaxation, with the understanding that not everyone is going to get pregnant right away. (Which is apparently a problem for other pregnancy tracking apps.)

View-ViewModel setup with simple single-screen navigation. Views are passed a State variable that tracks what screen the app is currently showing. App does not track any information so there is no need for a complex Model layer, just a single, statically set library at compile time.

ToDo:
* More content for all screens
* Navigate back to home screen when calming text message finishes. (Maybe include a button.)
* Add in Pregnancy Test Positive and Negative screens. (Feature-wise these are exactly the same as Just Waiting, but they pull up different libraries. I can probably just reuse the same classes with little modification.)

Stretch goals:
* Personalize by asking the user for information, like: What is your favorite drink? What do you like to do to relax? Etc.
* Add an intro screen for first time launch.
* Make the UI looking professional. (Go bug a designer friend maybe.)
* Track time between app opens, and whether the user reported a positive or negative test result. (Maybe have a setting asking whether the user is comfortable with that first.)
* Setting screen to erase/change ^^^
* Color scheme picker
