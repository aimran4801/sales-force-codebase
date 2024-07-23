import { LightningElement,api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { CloseActionScreenEvent } from 'lightning/actions';
import CaseData from '@salesforce/schema/Case.AccountId';
import ordertype from '@salesforce/schema/Case.Reason';

export default class Createsalesorder extends LightningElement 
{
    @api objectApiName;
    @api recordId;
    accName=CaseData;
    ordertype=ordertype;
    handleClick(event)
    {
        this.dispatchEvent(new CloseActionScreenEvent());
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: 'Record updated successfully !',
                variant: 'success'
            })
        );
    }
    @api invoke() 
    {
        console.log("Hi, I'm an action.");

    }
}