import { LightningElement, api} from 'lwc';
import Name_Field from '@salesforce/schema/Account.Name';
import Revenue_field from '@salesforce/schema/Account.AnnualRevenue';
import Industry_field from '@salesforce/schema/Account.Industry';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class LdsExampleRecordForm extends LightningElement {
    @api objectApiName = 'Account';
    @api recordId;
    fields = [Name_Field, Revenue_field, Industry_field];

    handleSuccess(event){
        const c1 = new ShowToastEvent({
            title:"Account Created",
            message:"Record ID: "+ event.detail.id,
            variant:"success"
        });
        this.dispatchEvent(c1);
    }

    // handleSuccess(event){
    //     this.dispatchEvent(new ShowToastEvent({
    //               title:"Account Created",
    //               message:"Record ID: "+ event.detail.id,
    //               variant:"success"
    //          })
    //     );
    // }
}