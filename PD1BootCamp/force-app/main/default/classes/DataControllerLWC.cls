public with sharing class DataControllerLWC{

    @AuraEnabled(cacheable=true)
    public static List<Contact> returnContactData(){
        try {
            List<Contact> conList =[Select Id,LastName ,Email ,Phone from Contact];
            return conList;

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> returnAccountData(){
        try {
            List<Account> accList = [select Id, Name, Phone from Account Limit 10];
            return accList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static void createAccount(String nameApex, string phoneApex, string ratingApex){
        
        Account acc =new Account();
        acc.Name = nameApex;
        acc.Phone = phoneApex;
        acc.Rating = ratingApex;

       /* try {
            Account acc =new Account();
            acc.Name = nameApex;
            acc.Phone = phoneApex;
            acc.Rating = ratingApex;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }*/
        insert acc;
    }
}