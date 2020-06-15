import { TemplateLoginComponent } from '../login/template-login/template-login.component';
import { TemplateLogin1Component } from '../login/template-login1/template-login1.component';
import { TemplateLogin2Component } from '../login/template-login2/template-login2.component';
import { TemplateLogin3Component } from '../login/template-login3/template-login3.component';

import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

const routes: Routes = [
  { path: '', component: TemplateLoginComponent },
  { path: 'templatelogin1', component: TemplateLogin1Component },
  { path: 'templatelogin2', component: TemplateLogin2Component },
  { path: 'templatelogin3', component: TemplateLogin3Component },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})

export class TemplateLoginRoutingModule { }
