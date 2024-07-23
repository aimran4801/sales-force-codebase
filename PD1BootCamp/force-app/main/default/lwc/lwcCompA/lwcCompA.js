import { LightningElement } from 'lwc';

export default class LwcCompA extends LightningElement {
    message;

    handleChange(event){
        this.message = event.target.value;
        this.template.querySelector("c-lwc-comp-b").enjoyDay();
    }
}