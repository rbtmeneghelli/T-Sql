import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AngularmaterialModule } from '../app_entities/library/angularmaterial.module';
import { NgxMaskModule, IConfig } from 'ngx-mask';
import { SharedModule } from '../app_entities/library/shared.module';
import { Template1Component } from './template1/template1.component';
import { Template2Component } from './template2/template2.component';
import { Template3Component } from './template3/template3.component';
import { Template4Component } from './template4/template4.component';
import { TemplateCrudRoutingModule } from './template-crud.route';
export let options: Partial<IConfig> | (() => Partial<IConfig>);
@NgModule({
  declarations: [
    Template1Component,
    Template2Component,
    Template3Component,
    Template4Component,
  ],
  imports: [
    CommonModule,
    AngularmaterialModule,
    SharedModule,
    TemplateCrudRoutingModule,
    NgxMaskModule.forRoot(options)
  ],
  entryComponents: [
  ],
  providers: []
})
export class TemplateCrudModule {}

