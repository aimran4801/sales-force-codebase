import { LightningElement, api } from 'lwc';

export default class TargetConfig extends LightningElement {
    @api Name;
    @api Mobile;
    @api Senior;
}