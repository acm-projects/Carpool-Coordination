# Carpool-Coordination
Are you a parent that drives your child and their friends to school every day? Part of a carpool group that struggles to remember whose turn it is to drive? This carpooling app will help keep track of who’s driving and send notification reminders for a pick-up.

# MVP

- Login Screen 
  - Users can create accounts ([Firebase Authentication](https://firebase.google.com/docs/auth))
    - Specific Tutprials: [one](https://blog.codemagic.io/firebase-authentication-google-sign-in-using-flutter/) and [two](https://codewithandrea.com/articles/simple-authentication-flow-with-flutter/)
  - User Profile: name and kid/parent designation 
- Home/Calendar Screen 
  - Can see across weeks as well as a daily view (who is picking up morning/afternoon)
  - [Google Calendar API](https://developers.google.com/calendar/api) -> [GoogleCal/Flutter Add Event Tutorial](https://medium.com/flutter-community/flutter-use-google-calendar-api-adding-the-events-to-calendar-3d8fcb008493)
  - Or [Flutter Event Calendar](https://pub.dev/packages/syncfusion_flutter_calendar)
- Notification/Reminder System
  - Create new reminder screen (for parents)
    - Can set recurring reminders/dates for pickup 
  - Nudge for pickup screen (for kids)
    - If parent is running late, kids can send a reminder directly to driver 
  - Notification Tutorials: [Flutter](https://youtu.be/_Z2S63O-1HE) and [ReactNative](https://youtu.be/RgN1TEnULVQ)
- Trade Day System
  - Create trade day notification: sends notifications to all parents 

# Stretch Goals

1. In-app group messaging 
2. Auto-scheduler to auto generate a schedule that fits parents availabilities and flag conflicts 
3. Allow users to add own google calendars

# Tech Stack

- **Wireframes**: [Figma](https://www.figma.com/) (free trial)
- **IDE**: Android Studio 
- **Frontend**: Flutter or React Native 
  -	Flutter
    -	Has a bunch of premade widgets, compatible with both ios and android, can customize UI easily 
    -	Dart is not a very popular language (made by google) but the documentation is pretty good   
    -	Video explaining what [flutter](https://www.youtube.com/watch?v=I9ceqw5Ny-4)
    -	[General documentation](https://docs.flutter.dev/)
  -	React Native
    -	uses JavaScript, a lot of resources and information available (more popular, developed dev community) 
    - [General documentation](https://reactnative.dev/docs/getting-started)
- **Backend**: Dart (if flutter is chosen) and JavaScript (if ReactNative is chosen)
  - Firebase or MongoDB for database --> [comparison](https://echoinnovateit.com/mongodb-vs-firebase/![image](https://user-images.githubusercontent.com/66386540/151115988-84a006b2-c567-465f-bb12-93e210977459.png)
) (leaning towards Firebase)  

# Software to Install

- [AndriodStudio](https://developer.android.com/studio)
- [Flutter](https://docs.flutter.dev/get-started/install) or [React_Native](https://reactnative.dev/docs/environment-setup)
- [Firebase](https://firebase.google.com/docs/cli) or [MongoDB](https://docs.mongodb.com/manual/installation/)
- [Git](https://git-scm.com/downloads)


# IN PROGRESS -----------------------------------------------

# Tutorials

- [React Native](https://www.youtube.com/watch?v=Hf4MJH0jDb4) 51 minutes
- [React JS](https://www.youtube.com/watch?v=w7ejDZ8SWv8) 1hr 48 minutes
- [Official Firebase/React Native tutorial](https://firebase.googleblog.com/2016/01/the-beginners-guide-to-react-native-and_84.html) : blog / how to article
- [FreeCodeCamp Firebase Article](https://www.freecodecamp.org/news/react-native-firebase-tutorial/)

# Resources

- [How to be successful in ACM Projects](https://docs.google.com/document/d/18Zi3DrKG5e6g5Bojr8iqxIu6VIGl86YBSFlsnJnlM88/edit?usp=sharing)
- [Choosing between React Native and Flutter](https://hackr.io/blog/react-native-vs-flutter)
- [Git Cheat Sheet](https://education.github.com/git-cheat-sheet-education.pdf)
- [Getting started with React](https://facebook.github.io/react-native/docs/getting-started)
- [Getting started with Flutter](https://flutter.dev/docs/get-started/install)
- [Overview of making API calls](https://snipcart.com/blog/apis-integration-usage-benefits)


For icons:

- https://material.io/resources/icons/?style=baseline
- https://materialdesignicons.com/
- https://www.flaticon.com/
- https://www.pexels.com/
- https://commons.wikimedia.org/wiki/Category:Images
- https://unsplash.com/images/stock




# Estimated Timeline

| Week         | Task(s)                                       | Deliverables                                                                   |
| ------------ | --------------------------------------------- | ------------------------------------------------------------------------------ |
| 1            | On boarding tasks                             | Meet the team, set meeting dates, schedule design day.                         |
| 2            | Research tech stack and create wireframes     | Practice apps with chosen tech stack + wireframes                              |
| 3            | Code app screens, code alarm logic and sounds | 50% or more progress on all pages. Completed call logic.                       |
| 4            | Code app screens, code call logic             | 80% or more progress on all screens. Completed database functionality.         |
| 5            | Code app screens and integrate backend        | functioning MVP                                                                |
| 6            | Front end touch ups and backend stretch goals | Polished MVP                                                                   |
| 7            | Stretch Goals                                 | N/A                                                                            |
| 8            | Create Presentation                           | Hammer out the order of presenters, plan/gimmick, and complete slideshow/video |
| 9            | Practice Presentation                         | N/A                                                                            |
| Presentation | Wow the judges like I know you will :)        | The growth you made while in Projects! ＼(^-^)／                               |


