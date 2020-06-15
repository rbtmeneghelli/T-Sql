import { Injectable } from '@angular/core';
import { Usuario } from '../../app_entities/model/usuario.model';
import { Router } from '@angular/router';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  private usuarioAutenticado: boolean;
  private loggedIn = new BehaviorSubject<boolean>(false); // {1}

  get isLoggedIn() {
    return this.loggedIn.asObservable(); // {2}
  }

  constructor(private router: Router) { }

  fazerLogin(usuario: Usuario) {
    if (usuario.email === 'admin' && usuario.senha === 'admin') {
      this.usuarioAutenticado = true;
      this.loggedIn.next(true);
      this.router.navigate(['/template2']);
    } else {
      this.loggedIn.next(false);
      this.usuarioAutenticado = false;
    }
  }

  usuarioEstaAutenticado() {
    return this.usuarioAutenticado;
  }

  logout() {                            // {4}
    this.loggedIn.next(false);
    this.router.navigate(['/login']);
  }
}
