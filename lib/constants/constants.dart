var appName = "News Demo";
var bookmarks = "Bookmarks";
var settings = "Settings";

const String apiKey = "af3ce09176fb4fd3be6fcfd1e000776c";
//News Feed REST APIs
const apiNews =
    "https://newsapi.org/v2/everything?q=tesla&sortBy=publishedAt&apiKey=$apiKey";
const apiHeadlines =
    "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey";

//TODO: Added test API and need to remove later
const apiTest =
    "https://reactnativetestapp-fd209-default-rtdb.firebaseio.com/test.json";
