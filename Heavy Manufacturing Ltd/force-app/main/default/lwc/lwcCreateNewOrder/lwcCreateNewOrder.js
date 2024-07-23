import { LightningElement, api} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import createWROrderApex from '@salesforce/apex/createOrderController.getAndCreateWROrder';
import { NavigationMixin } from "lightning/navigation";

export default class LwcCreateNewOrder extends NavigationMixin(LightningElement) {
    @api recordId;
    
    handleClick(event) {
        createWROrderApex({caseId: this.recordId})
        .then((result) => {
            console.log('Success');
            
                if(result.Type == 'Replacement'){
                    this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Replacement Order Created Successfully',
                        variant: 'success'
                    })
                    );
                }
                if(result.Type == 'Refund'){
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Success',
                            message: 'Refund Order Created Successfully',
                            variant: 'success'
                        })
                        );
                }
           console.log('Debugging Result '+ JSON.stringify(result));
            this[NavigationMixin.Navigate]({
                type: "standard__recordPage",
                attributes: {
                  recordId: result.Id,
                  objectApiName: "Order", // objectApiName is optional
                  actionName: "view",
                }
              });
        })
        .catch((error) => {
            console.log('Error ' + JSON.stringify(error));
        });
    }   
}