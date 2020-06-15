import { Template1Component } from '../crud/template1/template1.component';
import { Template2Component } from '../crud/template2/template2.component';
import { Template3Component } from '../crud/template3/template3.component';
import { Template4Component } from '../crud/template4/template4.component';

import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AuthGuard } from '../guards/auth.guard';
import { RoleGuard } from '../guards/role.guard';

const routes: Routes = [
  { path: 'template1', component: Template1Component, canActivate: [AuthGuard, RoleGuard], data: { role: 'ROLE_AAA' } },
  { path: 'template2', component: Template2Component },
  { path: 'template3', component: Template3Component },
  { path: 'template4', component: Template4Component },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})

export class TemplateCrudRoutingModule { }
