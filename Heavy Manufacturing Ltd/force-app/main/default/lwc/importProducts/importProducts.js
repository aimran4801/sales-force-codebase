import { LightningElement, api } from 'lwc';

export default class FileUploadExample extends LightningElement {
    @api
    myRecordId;

    get acceptedFormats() {
        return ['.pdf', '.csv', '.doc', '.docx'];
    }

    handleUploadFinished(event) {
        // Get the list of uploaded files
        const uploadedFiles = event.detail.files;
        alert('No. of files uploaded : ' + uploadedFiles.length);
    }
}