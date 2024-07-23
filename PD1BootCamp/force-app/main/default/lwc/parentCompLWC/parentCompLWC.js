import { LightningElement } from 'lwc';

export default class ParentCompLWC extends LightningElement {
    data;

    handlePassData(event){
        this.data = event.detail;
        console.log('Data is:' +JSON.stringify(event.detail));
    }
}