import { LightningElement, wire } from 'lwc';
import READCONTACT from '@salesforce/apex/DataControllerLWC.returnContactData';

export default class ReadContactData extends LightningElement {
    contactList;
   
    @wire(READCONTACT)
    contactList;
}