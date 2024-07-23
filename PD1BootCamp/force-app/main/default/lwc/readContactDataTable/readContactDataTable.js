import { LightningElement, wire } from 'lwc';
import ContactRead from '@salesforce/apex/ContactController.returnContactData';

export default class ReadContactDataTable extends LightningElement {
    data;

    columns =[
        {
            label:'Contact Id',
            fieldName: 'Id'
        },
        {
            label:'Contact Name',
            fieldName: 'LastName'
        },
        {
            label:'Phone Number',
            fieldName: 'Phone'
        },
        {
            label:'Contact Email',
            fieldName: 'Email'
        },
        {
            label:'LeadSource',
            fieldName: 'LeadSource'
        },
    ];
    @wire(ContactRead)
    wireContactData({data,error}){
        if(data){
            this.data = data;
        }else{
            console.log('Error is: '+JSON.stringify(error));
        }
    }

}