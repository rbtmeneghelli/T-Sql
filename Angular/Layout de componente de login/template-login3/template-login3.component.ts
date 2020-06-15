import { environment } from './../../../environments/environment';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { version } from '../../../../package.json';

@Component({
  selector: 'app-template-login3',
  templateUrl: './template-login3.component.html',
  styleUrls: ['./template-login3.component.scss']
})
export class TemplateLogin3Component implements OnInit {
  formulario: FormGroup;
  hide = true;
  versao: string;

  constructor(public formBuilder: FormBuilder, private router: Router) {
    this.formulario = this.formBuilder.group({
      email: ['', [Validators.required, Validators.email]],
      senha: ['', [Validators.required]]
    });
  }

  ngOnInit() {
    this.versao = version;
  }

  AcessarSistema() {
    const login = this.formulario.controls.email.value;
    const senha = this.formulario.controls.senha.value;
  }

  getEmail() {
    return this.formulario.get('email').hasError('required')
      ? 'O campo email é obrigatório' : this.formulario.get('email').hasError('pattern')
        ? 'O campo email está no formato invalido' : '';
  }

  getSenha() {
    return this.formulario.get('senha').hasError('required') ? 'O campo senha é obrigatório' : '';
  }
}

