var appName = "News Feed";
var bookmarksTitle = "Bookmarks";
var settings = "Settings";
var visit = "Visit";
var share = "Share";

const String apiKey = "af3ce09176fb4fd3be6fcfd1e000776c";

/*News Feed REST APIs*/
const apiSearchNews =
    "https://newsapi.org/v2/everything?q=%s&sortBy=publishedAt&apiKey=$apiKey";
const apiHeadlines =
    "https://newsapi.org/v2/top-headlines?country=%s&apiKey=$apiKey";
const urlDefaultImage =
    "https://dummyimage.com/640x360/000/fff.png&text=+News+Feed";
const apiUserCountryCode = "http://ip-api.com/json";

/*Response parsing keys*/
var keyArticles = "articles";
var keyAuthor = "author";
var keyTitle = "title";
var keyUrl = "url";
var keyUrlToImage = "urlToImage";
var keyPublishedAt = "publishedAt";
