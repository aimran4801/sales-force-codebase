public class ContactSearch {
    public static list<Contact> searchForContacts(string LastName, string MailingPostalCode){
        list<Contact> conList =[Select ID,Name from Contact where 
                                LastName=:LastName AND
                               MailingPostalCode=:MailingPostalCode];
        return conlist;
        
    }

}