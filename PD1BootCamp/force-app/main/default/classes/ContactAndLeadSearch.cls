public class ContactAndLeadSearch {
    public static List<List< sObject>> searchContactsAndLeads(string LastName){
       List<List< sObject>> sList =[Find :LastName IN ALL FIELDS
                                   RETURNING Contact(Name),
                                   Lead(Name)];
       return sList; 
    }

}