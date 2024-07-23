import { LightningElement,wire } from 'lwc';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import ratingPicklist from '@salesforce/schema/Account.Rating';
import CreateAccount from '@salesforce/apex/DataControllerLWC.createAccount';

export default class CreateAccountComp extends LightningElement {
    accName;
    accPhone;
    ratingValue;

    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT})
    objectInfo;
    
    @wire(getPicklistValues, {recordTypeId: '$objectInfo.data.defaultRecordTypeId', fieldApiName: ratingPicklist})
    options;

    handleChange(event){
        if(event.target.name =='accName'){
            this.accName = event.target.value;
        }
        if(event.target.name =='accPhone'){
            this.accPhone = event.target.value;
        }
        if(event.target.name =='Rating'){
            this.ratingValue = event.target.value;
        }   
    }
     
    handleClick(event){
        if(this.accName !=null || this.accName != undefined){
            CreateAccount({nameApex: this.accName, phoneApex: this.accPhone, ratingApex: this.ratingValue})
            
            .then((result) => {
                console.log('Success');
            })
            .catch((error) => {
                console.log('Error' + JSON.stringify(error));
            });
            
        }
    }


}