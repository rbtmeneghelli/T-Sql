import { TemplateTabelaComponent } from '../tabela/template-tabela/template-tabela.component';
import { TemplateRelatorioComponent } from '../tabela/template-relatorio/template-relatorio.component';
import { TemplateTabelaResponsivaComponent } from '../tabela/template-tabela-responsiva/template-tabela-responsiva.component';

import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

const routes: Routes = [
  { path: '', component: TemplateTabelaComponent },
  { path: 'relatorio', component: TemplateRelatorioComponent },
  { path: 'responsiva', component: TemplateTabelaResponsivaComponent },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})

export class TemplateTabelaRoutingModule { }

