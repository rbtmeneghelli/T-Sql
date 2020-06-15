// import { AuthService } from './auth.service';
import { Component, OnInit, HostListener } from '@angular/core';
import { Usuario } from '../../app_entities/model/usuario.model';
import { AuthService } from 'src/app/guards/auth2.guard.service';
import { Router } from '@angular/router';
import { take } from 'rxjs/operators';
import { CredenciaisDTO } from '../../app_entities/dto/credencial.dto';
@Component({
  selector: 'app-login-sistema',
  templateUrl: './login-sistema.component.html',
  styleUrls: ['./login-sistema.component.css']
})
export class LoginSistemaComponent implements OnInit {

  private credencial: CredenciaisDTO = new CredenciaisDTO();
  public innerWidth: any;

  constructor(private authService: AuthService, private router: Router) {
    this.innerWidth = window.innerWidth;
  }

  @HostListener('window:resize', ['$event'])
  onResize(event) {
    this.innerWidth = window.innerWidth;
  }

  ngOnInit() {
    if (this.authService.isAuthenticated()) {
      this.router.navigate(['/template1']);
    }
  }

  async Login() {

    // this.credencial.login = this.formlogin.controls['usuario'].value;
    // this.credencial.senha = this.formlogin.controls['senha'].value;

    this.authService.doLogin(this.credencial).pipe(take(1)).subscribe(response => {
      this.authService.keepUser(response);
    });
  }

}
