import { LightningElement, wire } from 'lwc';
import sendGreetings from '@salesforce/messageChannel/sendGreetings__c';
import { subscribe, MessageContext } from 'lightning/messageService';

export default class LwcSubscribeComp extends LightningElement {
    publisherData = '' ;
    subscription = null;

    @wire(MessageContext)
    messageContext;

    connectedCallback(){
        this.handleSubscribe();
    }

    handleSubscribe(){
        if(this.subscription){
            return;
        }
        this.subscription = subscribe(this.messageContext, sendGreetings, 
            (message) =>{
                console.log(message.greet);
                this.publisherData = message.greet;
            }
        );
    }
}