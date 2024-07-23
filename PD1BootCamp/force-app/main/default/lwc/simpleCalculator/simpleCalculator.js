import { LightningElement, track } from 'lwc';

export default class SimpleCalculator extends LightningElement {
    @track fNumber;
    @track sNumber;
    resValue;

    handleChange1(event){
        this.fNumber = parseInt(event.target.value); 
    }
    handleChange2(event){
        this.sNumber = parseInt(event.target.value);
    }
    add(){
        this.resValue = this.fNumber + this.sNumber;
    }
    sub(){
        this.resValue = this.fNumber - this.sNumber;
    }
    multip(){
        this.resValue = this.fNumber * this.sNumber;
    }
    division(){
        this.resValue = this.fNumber / this.sNumber;
    }
}