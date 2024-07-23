import { LightningElement, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

const F1 = ['Account.Name', 'Account.Phone', 'Account.Industry', 'Account.Owner.Name'];

export default class LdsUiRecordApiExample extends LightningElement {
    AccountName;
    Phone;
    Industry;
    OwnerName;

    @api recordId;

    @wire(getRecord, { recordId: '$recordId', fields: F1})
    wireData({data, error}){
        if(error){
            console.log('Error:' + JSON.stringify(error));
        }else if(data){
            this.AccountName = data.fields.Name.value;
            this.Phone = data.fields.Phone.value;
            this.Industry = data.fields.Industry.value;
            this.OwnerName = data.fields.Owner.value.fields.Name.value;
            
        }
    }
}