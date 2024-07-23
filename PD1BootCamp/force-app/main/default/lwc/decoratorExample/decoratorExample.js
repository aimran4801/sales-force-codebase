import { LightningElement, track, api} from 'lwc';

export default class DecoratorExample extends LightningElement {
    @track messageOnScreen ='Welcome to PD1 BootCamp';
    @api recordId;

    handleChange(event){
        this.messageOnScreen = event.target.value;
    }
}