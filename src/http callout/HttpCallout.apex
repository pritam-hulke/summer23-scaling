public class HttpCallout {
    public static void makeCallout() {
        HttpRequest httpRequest = new HttpRequest();
        httpRequest.setEndpoint('https://postman-echo.com/get?foo1=bar1&foo2=bar2');
        httpRequest.setMethod('GET');
        
        Http http = new Http();
        HttpResponse httpResponse = http.send(httpRequest);
        
        System.debug(httpResponse.getBody());
    }
}
