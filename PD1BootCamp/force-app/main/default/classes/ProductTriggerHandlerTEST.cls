@isTest
public class ProductTriggerHandlerTEST {
	
    @isTest
    public static void changingProductFamilyTEST(){
        List<Product2> newInactiveList = new List<Product2>();
        Product2 pro = new Product2();
        pro.Name = 'Iphone 15';
        pro.IsActive = false;
        newInactiveList.add(pro);
        insert newInactiveList;
        
        ProductTriggerHandler.changingProductFamily(newInactiveList);
        //System.assertEquals('Deactivated Product', newInactiveList[0].Family);
        
        newInactiveList[0].IsActive = true;
        
        update newInactiveList;
        //System.assertEquals('Activated Product', newInactiveList[0].Family);
        
        //Create test data
        /*Product2 pro2 = new Product2();
        pro2.Name = 'Iphone 15';
        pro2.IsActive = true;
        insert pro2;*/
       	
        //System.assertEquals('Activated Product', pro2.Family);
    }
    
}