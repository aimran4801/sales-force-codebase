public with sharing class RESTConsumeCurrencyDetails {
   
    public static void getDataFromAPI(){
        //string apiKey = '49e65410c16a1705b6fba8f0600249d9';
        HTTP http = new HTTP();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('http://api.exchangeratesapi.io/v1/latest?access_key='+system.label.API_Name);
        request.setMethod('GET');
        // GET : Read/Query
        // POST : Insert
        // PATCH / PUT : Update/Upsert
        // DELETE : Delete

        // Response code: 200(Success), 300(Password mismatch), 400(Unavaibility), 500(Server issues)
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200){
            System.debug('Response is: '+ JSON.deserializeUntyped(response.getBody()));
        }
    }

}
