public class PropertyUtility {
    public static void newListedProperties(){
        list<Property__c> newPropList =[Select Name,Broker__r.Email__c,Days_On_Market__c from Property__c where Days_On_Market__c<=30];
        for(Property__c p1:newPropList){
            string propEmail = p1.Name + ': ' + p1.Broker__r.Email__c;
            System.debug(propEmail);
        }
        
    }

}