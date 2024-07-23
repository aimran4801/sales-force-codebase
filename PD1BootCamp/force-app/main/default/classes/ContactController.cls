public with sharing class ContactController {
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> returnContactData(){
        try {
            List<Contact> conList = [Select Id, LastName, Phone, Email, LeadSource from Contact LIMIT 10];
            return conList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}