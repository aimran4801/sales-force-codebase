import { LightningElement, wire } from 'lwc';
import LeadDataTable from '@salesforce/apex/LeadController.leadListData';

export default class ReadLeadDataTable extends LightningElement {
    data;
    columns = [
        {
            label:'Lead Id',
            fieldName: 'Id'
        },
        {
            label:'Lead Name',
            fieldName: 'Name'
        },
        {
            label:'Lead Status',
            fieldName: 'Status'
        },
        {
            label:'Company',
            fieldName: 'Company'
        }
    ];
    
    @wire(LeadDataTable)
    wireLeadData({data,error}){
        if(data){
            this.data = data;
        }else{
            console.log('Error is: ' + JSON.stringify(error));
        }
    }

}
