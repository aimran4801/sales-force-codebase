import { LightningElement,api } from 'lwc';
import Account_Name from '@salesforce/schema/Account.Name';
import Phone from '@salesforce/schema/Account.Phone';
import BillingAddress from '@salesforce/schema/Account.BillingAddress';
import ShippingAddress from '@salesforce/schema/Account.ShippingAddress';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class CreateAccountTab extends LightningElement {
    @api objectApiName = 'Account';
    @api recordId;
    fields =[Account_Name, Phone, BillingAddress, ShippingAddress];

    handleSuccess(event){
        this.dispatchEvent(new ShowToastEvent(
            {
                title:"Account Created",
                message:"Record ID: "+ event.detail.id,
                variant:"success"
            }
        ));
    }
}