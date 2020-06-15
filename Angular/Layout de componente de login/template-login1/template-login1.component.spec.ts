import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TemplateLogin1Component } from './template-login1.component';

describe('TemplateLogin1Component', () => {
  let component: TemplateLogin1Component;
  let fixture: ComponentFixture<TemplateLogin1Component>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TemplateLogin1Component ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TemplateLogin1Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
