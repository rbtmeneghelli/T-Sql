import { Component, OnInit, Input } from '@angular/core';
import { Router } from '@angular/router';

@Component({
    selector: 'app-card-termo',
    templateUrl: './card-termo.component.html'
})

export class CardTermoComponent implements OnInit {

    public editorConfig = {
        editable: true,
        spellcheck: true,
        height: '200px',
        minHeight: 0,
        width: 'auto',
        minWidth: 0,
        translate: 'yes',
        enableToolbar: true,
        showToolbar: true,
        placeholder: 'Enter text here...',
        imageEndPoint: '',
        toolbar: [
            ['bold', 'italic', 'underline', 'strikeThrough', 'superscript', 'subscript'],
            ['fontName', 'fontSize', 'color'],
            ['justifyLeft', 'justifyCenter', 'justifyRight', 'justifyFull', 'indent', 'outdent'],
            ['cut', 'copy', 'delete', 'removeFormat', 'undo', 'redo'],
            ['paragraph', 'blockquote', 'removeBlockquote', 'horizontalLine', 'orderedList', 'unorderedList'],
            ['link', 'unlink', 'image', 'video']
        ]
    };

    ngOnInit(): void {
        
    }
}
