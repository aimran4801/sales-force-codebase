public with sharing class contactSearchForLwc {

    @AuraEnabled(Cacheable=true)
    public static List<Contact> returnContacts(String searchTerm){
        String wildCards ='%' + searchTerm + '%';

        List<Contact> conList =[Select Id, FirstName, LastName, Email from Contact WHERE FirstName LIKE :'wildCards'];
        return conList;
    }
}