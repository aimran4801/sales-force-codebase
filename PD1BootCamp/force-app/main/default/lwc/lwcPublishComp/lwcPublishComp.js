import { LightningElement, wire } from 'lwc';
import sendGreetings from '@salesforce/messageChannel/sendGreetings__c';
import { publish, MessageContext } from 'lightning/messageService';

export default class LwcPublishComp extends LightningElement {
    @wire(MessageContext)
    messageContext;

    greet;

    handleChange(event){
        this.greet = event.target.value;
    }
    handleClick(event){
        let message = {greet: this.greet};
        publish(this.messageContext, sendGreetings, message);
    }
}