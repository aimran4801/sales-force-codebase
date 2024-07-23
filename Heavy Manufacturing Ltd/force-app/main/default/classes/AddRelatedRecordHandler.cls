public class AddRelatedRecordHandler {
    
    public static void relatedContact(List<Account> newList){
        List<Contact> conList = new List<Contact>();
        
        for(Account acc:newList){
            Contact obj = new Contact();
            obj.FirstName = acc.Name;
            obj.LastName = 'Test';
            obj.AccountId = acc.Id;
            conList.add(obj);
        }
        if(conList.size() > 0){
            insert conList;
        }
    }
    
    public static void sendData(List<Account> newList){
        //List<Account> accList = [Select id ,Name, Phone, BillingAddress, ShippingAddress from Account];
        List<Account_Verification__e> publishData = new List<Account_Verification__e>();
        for(Account acc:newList){
            Account_Verification__e event = new Account_Verification__e();
            event.Account_Name__c = acc.Name;
            //event.Billing_Address__c =acc.BillingAddress;
            //event.Shipping_Address__c =acc.ShippingAddress;
            event.Phone__c =acc.Phone;
            event.Account_Site__c =acc.Site;
            publishData.add(event);
        }
        
        Eventbus.publish(publishData);
        /* if(accList.size() >0){
				update accList;
			} */
    }
    
    public static void updateRecordType(List<Account> updateAccType){
        List<Account> accList =[Select id, name, Status__c, BillingAddress, ShippingAddress, RecordTypeId from Account];
        
        Id accRecordTypeIdPA = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Prospect_Account').getRecordTypeId();
        Id accRecordTypeIdCA = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Customer_Account').getRecordTypeId();
        
        for(Account acc:updateAccType){
            if(acc.Status__c == 'Verification Completed' && acc.Status__c !=null ){
                if(acc.RecordTypeId == accRecordTypeIdPA ){
                    acc.RecordTypeId = accRecordTypeIdCA;
                }
                accList.add(acc);
            }
        }
        if(accList.size() >0){
            Database.update(accList);
        }
    }
    
    
}