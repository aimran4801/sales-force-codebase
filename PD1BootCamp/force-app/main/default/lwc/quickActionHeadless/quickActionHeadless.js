import { LightningElement,api } from 'lwc';

export default class QuickActionHeadless extends LightningElement {
    @api invoke(){
        console.log('Hello, I am in training !');
        alert('Welcome to bootCamp !');
    }
}