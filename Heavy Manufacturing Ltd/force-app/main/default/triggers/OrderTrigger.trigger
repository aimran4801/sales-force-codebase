trigger OrderTrigger on Order (before insert, after update) {
    
    //User Story - 217
    if(trigger.isAfter && trigger.isUpdate){
        for(Order ord: Trigger.new){
            Order oldOrder = Trigger.oldMap.get(ord.Id);

            if(ord.Original_Order__c != oldOrder.Original_Order__c) {
                OrderTriggerHandler.cloneOrderProductAndSetUnitPrice(Trigger.new);
                //OrderTriggerHandler.copyOrderItems(Trigger.new);
            }
        }
    }
}