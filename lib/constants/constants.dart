var appName = "News Feed";
var bookmarks = "Bookmarks";
var settings = "Settings";
var visit = "Visit";
var share = "Share";

const String apiKey = "af3ce09176fb4fd3be6fcfd1e000776c";

/*News Feed REST APIs*/
const apiNews =
    "https://newsapi.org/v2/everything?q=tesla&sortBy=publishedAt&apiKey=$apiKey";
const apiHeadlines =
    "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey";

/*Response parsing keys*/
var keyArticles = "articles";
var keyAuthor = "author";
var keyTitle = "title";
var keyUrl = "url";
var keyUrlToImage = "urlToImage";
var keyPublishedAt = "publishedAt";
