import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LoginSistemaComponent } from './login-sistema.component';

describe('LoginSistemaComponent', () => {
  let component: LoginSistemaComponent;
  let fixture: ComponentFixture<LoginSistemaComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LoginSistemaComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LoginSistemaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
