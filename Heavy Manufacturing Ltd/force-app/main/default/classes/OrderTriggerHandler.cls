public class OrderTriggerHandler {

    public static void cloneOrderProductAndSetUnitPrice(List<Order> newList){
        Set<Id> orderIdSet = new Set<Id>();
        Set<Id> originalOrderIdSet = new Set<Id>();
        List<OrderItem> listClonedFromOriginal = new List<OrderItem>();
        List<OrderItem> listOrderItem = new List<OrderItem>();
        for(Order o: newList){
            if(o.Status == 'Draft' && (o.Type == 'Warranty Repair' || o.Type == 'Charged Repair')){
                orderIdSet.add(o.id);
                if(o.Original_Order__c != null){
                    originalOrderIdSet.add(o.Original_Order__c);
                }
            }
        }
        if(originalOrderIdSet != null){
            listOrderItem = [SELECT Id, OrderId, UnitPrice, Quantity, AvailableQuantity, OriginalOrderItemId, ListPrice,
                TotalPrice, ServiceDate, EndDate, Description, PricebookEntryId FROM OrderItem WHERE OrderId IN: originalOrderIdSet];
        }
        //Pricebook2 pb2 = [select Id, Name, IsActive from PriceBook2 where IsStandard=True LIMIT 1];
        if(listOrderItem != null){
            for(Id oId: orderIdSet){
                for(OrderItem listOI: listOrderItem){
                    OrderItem oi = new OrderItem();
                    oi.OrderId = oId;
                    oi.UnitPrice = 0;
                    oi.Quantity = listOI.Quantity;
                    //oi.AvailableQuantity = listOI.AvailableQuantity;
                    oi.ListPrice = listOI.ListPrice;
                    //oi.TotalPrice = listOI.TotalPrice;
                    oi.ServiceDate = listOI.ServiceDate;
                    oi.EndDate = listOI.EndDate;
                    oi.Description = listOI.Description;
                    oi.PricebookEntryId = listOI.PricebookEntryId;
                    listClonedFromOriginal.add(oi);   
                }
            }
        }
        insert listClonedFromOriginal;
    }   
    
    
    public static void copyOrderItems(List<Order> newList){
        Set<Id> originalOrderIdSet = new Set<Id>();
        Set<Id> currentOrderIdSet = new Set<Id>();
        List<OrderItem> originalOrderItemList = new List<OrderItem>();
        List<OrderItem> insertRepairOrderItems = new List<OrderItem>();
        for(Order ord: newList){
            currentOrderIdSet.add(ord.Id);
            if(ord.Original_Order__c != null){
                originalOrderIdSet.add(ord.Original_Order__c);
            }
        }
        
        if(originalOrderIdSet.size() > 0){
            for(OrderItem oi: [SELECT Id,AvailableQuantity,PricebookEntryId,EndDate,OrderId,Quantity,UnitPrice FROM OrderItem WHERE OrderId IN:originalOrderIdSet]){
                originalOrderItemList.add(oi);
            }
		}
        
        Pricebook2 pb2 = [select Id, Name, IsActive from PriceBook2 where IsStandard=True LIMIT 1];
        
        if(originalOrderItemList.size() > 0){
            for(Id setId: currentOrderIdSet){
                for(OrderItem oi: originalOrderItemList){
                    OrderItem oiNew = new OrderItem();
                    oiNew.OrderId = setId;
                    oiNew.UnitPrice = 0;
                    oiNew.Quantity = oi.Quantity;
                    oiNew.PricebookEntryId = oi.PricebookEntryId;
                    insertRepairOrderItems.add(oiNew);
                }
            }
        }
        
        insert insertRepairOrderItems;
    }
}