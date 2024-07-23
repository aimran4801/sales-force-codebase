import { LightningElement } from 'lwc';
import SEARCH from '@salesforce/apex/contactSearchForLwc.returnContacts';

export default class ApexWireMethod extends LightningElement {
    searchTerm;
    contactList;

    handleChange(event){
        this.searchTerm = event.target.value;
    }

    handleClick(event){
        SEARCH({searchTerm: this.searchTerm})
        
        .then((result)=>{
            this.contactList = result;
        })
        .catch((error)=> {
            console.log('Error:' + JSON.stringify(error));
        });

        console.log('Data in list: '+ JSON.stringify(this.contactList));
    }
}