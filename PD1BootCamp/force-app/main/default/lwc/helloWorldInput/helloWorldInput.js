import { LightningElement } from 'lwc';

export default class HelloWorldInput extends LightningElement {
    getInput;

    handleChange(event){
        this.getInput = event.target.value;
    }

}