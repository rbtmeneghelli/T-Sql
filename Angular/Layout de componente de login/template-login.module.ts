import { TemplateLogin3Component } from './../login/template-login3/template-login3.component';
import { TemplateLogin2Component } from './../login/template-login2/template-login2.component';
import { TemplateLogin1Component } from './../login/template-login1/template-login1.component';
import { TemplateLoginComponent } from './../login/template-login/template-login.component';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AngularmaterialModule } from '../app_entities/library/angularmaterial.module';
import { NgxMaskModule, IConfig } from 'ngx-mask';
import { SharedModule } from '../app_entities/library/shared.module';
import { TemplateLoginRoutingModule } from '../login/template-login.route';
export let options: Partial<IConfig> | (() => Partial<IConfig>);
@NgModule({
  declarations: [
    TemplateLoginComponent,
    TemplateLogin1Component,
    TemplateLogin2Component,
    TemplateLogin3Component,
  ],
  imports: [
    CommonModule,
    AngularmaterialModule,
    SharedModule,
    TemplateLoginRoutingModule,
    NgxMaskModule.forRoot(options)
  ],
  entryComponents: [
  ],
  providers: []
})
export class TemplateLoginModule {}

