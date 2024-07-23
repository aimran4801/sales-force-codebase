public class AccountUtility {
    public static void viewAnnualRevenue(){
        list<Account> accountsList =[Select Name,AnnualRevenue from Account];
        for(Account a1:accountsList){
          String acctRev =a1.Name +' : '+ a1.AnnualRevenue ;
            System.debug(acctRev);
        }
        
    }

}