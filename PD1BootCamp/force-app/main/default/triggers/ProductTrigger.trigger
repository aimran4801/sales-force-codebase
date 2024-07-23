trigger ProductTrigger on Product2 (before insert) {
    if(Trigger.isExecuting){
        if(Trigger.isBefore){
            if(Trigger.isInsert){
                ProductTriggerHandler.changingProductFamily(Trigger.new);
            }
            if(Trigger.isUpdate){
                ProductTriggerHandler.changingProductFamily(Trigger.new);
            }
        }
    }

}