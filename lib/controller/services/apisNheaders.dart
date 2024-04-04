String apiKey = '6f3b1d295d924e1d8fd05c76315bd160';
String country = 'us';

String newsAPI =
    'https://newsapi.org/v2/top-headlines?country=$country&apiKey=$apiKey';
var header = {"content-type": "application/json", "Accept": "application/json"};
