import { LightningElement,api } from 'lwc';

export default class LwcCompB extends LightningElement {
    @api greeting;

    @api enjoyDay(){
        console.log('Enjoy the day & work smart');
    }
}
