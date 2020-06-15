import { TemplateTabelaComponent } from '../tabela/template-tabela/template-tabela.component';
import { TemplateRelatorioComponent } from '../tabela/template-relatorio/template-relatorio.component';
import { TemplateTabelaResponsivaComponent } from '../tabela/template-tabela-responsiva/template-tabela-responsiva.component';
import { DetalhesTabelaComponent } from '../tabela/detalhes-tabela/detalhes-tabela.component';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AngularmaterialModule } from '../app_entities/library/angularmaterial.module';
import { NgxMaskModule, IConfig } from 'ngx-mask';
import { SharedModule } from '../app_entities/library/shared.module';
import { TemplateTabelaRoutingModule } from '../tabela/template-tabela.route';
export let options: Partial<IConfig> | (() => Partial<IConfig>);
@NgModule({
  declarations: [
    TemplateTabelaComponent,
    TemplateRelatorioComponent,
    TemplateTabelaResponsivaComponent,
    DetalhesTabelaComponent
  ],
  imports: [
    CommonModule,
    AngularmaterialModule,
    SharedModule,
    TemplateTabelaRoutingModule,
    NgxMaskModule.forRoot(options)
  ],
  exports: [
    DetalhesTabelaComponent
  ],
  entryComponents: [
  ],
  providers: []
})
export class TemplateTabelaModule {}

