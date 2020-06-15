import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TemplateModelComponent } from './template-model.component';

describe('TemplateModelComponent', () => {
  let component: TemplateModelComponent;
  let fixture: ComponentFixture<TemplateModelComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TemplateModelComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TemplateModelComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
