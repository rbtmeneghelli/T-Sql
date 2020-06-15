import { Component, OnInit } from '@angular/core';
import { BaseFormComponent } from '../../shared/base-form/base-form.component';

@Component({
  selector: 'app-template2',
  templateUrl: './template2.component.html',
  styleUrls: ['./template2.component.css']
})
// Formulario generico com herança
export class Template2Component extends BaseFormComponent implements OnInit {

  constructor() {
    super();
  }

  ngOnInit() {
  }

  submit() {
  }
}
