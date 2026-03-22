import { LightningElement } from 'lwc';
import submitComplaint from '@salesforce/apex/ComplaintController.submitComplaint';

export default class ComplaintForm extends LightningElement {
    type;
    desc;

    handleType(event) {
        this.type = event.target.value;
    }

    handleDesc(event) {
        this.desc = event.target.value;
    }

    submit() {
        submitComplaint({ type: this.type, desc: this.desc });
    }
}