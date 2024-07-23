public class AccountHandler {
   /* public static void insertAccount (integer numberOfNewAccounts) {
        list<Account> addAccounts =new list<Account>();
        integer i=0;
        while(i<= numberOfNewAccounts){
            Account a= new Account();
            a.Name ='Acme Inc'+i;
            a.AccountNumber ='A000n'+i;
            addAccounts.add(a);
            i++;   
        }
        insert addAccounts;
        
    } */
    public static Account insertNewAccount(String AccountName ){
       try {
          account acc =new Account(Name= AccountName);
           insert acc;
           return acc;
        } catch (DmlException e) {
            System.debug('A DML exception has occurred: ' +
                        e.getMessage());
            return null;
        }
        
    }
    
    
    
}