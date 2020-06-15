import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TemplateLogin2Component } from './template-login2.component';

describe('TemplateLogin2Component', () => {
  let component: TemplateLogin2Component;
  let fixture: ComponentFixture<TemplateLogin2Component>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TemplateLogin2Component ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TemplateLogin2Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
