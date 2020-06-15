import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { AuthService } from '../../guards/auth2.guard.service';
import { CredenciaisDTO } from '../../app_entities/dto/credencial.dto';
import { take } from 'rxjs/operators';
import { Router } from '@angular/router';

@Component({
  selector: 'app-template-login2',
  templateUrl: './template-login2.component.html',
  styleUrls: ['./template-login2.component.css']
})
export class TemplateLogin2Component implements OnInit {

  formulario: FormGroup;
  hideSenha: boolean;
  loading: boolean;
  labelSistema: string;

  constructor(
    private formBuilder: FormBuilder,
    private authService: AuthService,
    private router: Router) {
    this.formulario = this.formBuilder.group({
      usuario: ['', [Validators.required, Validators.minLength(3), Validators.maxLength(40)]],
      senha: ['', [Validators.required, Validators.minLength(3), Validators.maxLength(10)]],
    });
  }

  ngOnInit() {
    if (this.authService.isAuthenticated()) {
      this.router.navigate(['/dashboard']);
    }
    this.hideSenha = true;
    this.loading = false;
    this.labelSistema = '';
  }

  doLogin() {
    const credencial: CredenciaisDTO = new CredenciaisDTO();
    credencial.login = this.formulario.controls.usuario.value;
    credencial.senha = this.formulario.controls.senha.value;
    this.authService.doLogin(credencial).pipe(take(1)).subscribe(response => {
      this.authService.keepUserData(response);
      this.router.navigate(['/dashboard']);
    });
  }
}
