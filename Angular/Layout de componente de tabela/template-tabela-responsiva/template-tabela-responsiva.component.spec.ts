import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TemplateTabelaResponsivaComponent } from './template-tabela-responsiva.component';

describe('TemplateTabelaResponsivaComponent', () => {
  let component: TemplateTabelaResponsivaComponent;
  let fixture: ComponentFixture<TemplateTabelaResponsivaComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TemplateTabelaResponsivaComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TemplateTabelaResponsivaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
