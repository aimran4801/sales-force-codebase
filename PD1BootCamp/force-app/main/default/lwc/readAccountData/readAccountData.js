import { LightningElement, wire } from 'lwc';
import AccountRead from '@salesforce/apex/DataControllerLWC.returnAccountData';

export default class ReadAccountData extends LightningElement {
    AccountList;
    
    @wire(AccountRead)
    AccountList;
}