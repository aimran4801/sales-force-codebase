import { LightningElement } from 'lwc';

export default class ConditionalRendering extends LightningElement {
    checkCondition = false;

    handleChange(event){
        if(event.target.checked){
            this.checkCondition = true;
        }else{
            this.checkCondition = false;
        }
    }
}