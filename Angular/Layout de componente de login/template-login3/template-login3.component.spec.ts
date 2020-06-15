import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TemplateLogin3Component } from './template-login3.component';

describe('TemplateLogin3Component', () => {
  let component: TemplateLogin3Component;
  let fixture: ComponentFixture<TemplateLogin3Component>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TemplateLogin3Component ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TemplateLogin3Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
