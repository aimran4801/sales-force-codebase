import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { CloseActionScreenEvent } from 'lightning/actions';

export default class HelloQuickActionWithScreen extends LightningElement {
    @api objectApiName;
    @api recordId;

    handleSuccess(event){
        this.dispatchEvent(new CloseActionScreenEvent());
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: 'Record updated successfully !',
                variant: 'success'
            })
        );
    }
}