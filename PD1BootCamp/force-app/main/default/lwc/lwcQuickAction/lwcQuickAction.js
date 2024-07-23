import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { CloseActionScreenEvent } from 'lightning/actions';

export default class LwcQuickAction extends LightningElement {
    @api objectApiName;
    @api recordId;

    handleSuccess(event){
        this.dispatchEvent(new CloseActionScreenEvent());
        this.dispatchEvent(new ShowToastEvent(
            {
                title:'success',
                message:'Record Saved Successfully',
                variant:'success'
            })
        );
    }
}