import { Component, OnInit } from '@angular/core';
import { Service } from '../../app_entities/generic/service';
import { Arquivo } from '../../app_entities/model/arquivo.model';
import { Funcionario } from '../../app_entities/model/funcionario.model';
import { Empresa } from '../../app_entities/model/empresa.model';

@Component({
  selector: 'app-template-model',
  templateUrl: './template-model.component.html',
  styleUrls: ['./template-model.component.css']
})
export class TemplateModelComponent implements OnInit {

  service = new Service();
  arquivo: Array<Arquivo> = new Array<Arquivo>();
  funcionario: Array<Funcionario> = new Array<Funcionario>();
  empresa: Array<Empresa> = new Array<Empresa>();

  constructor() { }

  ngOnInit() {
    this.modelEmpresa();
  }

  modelArquivo() {
    // tslint:disable-next-line: max-line-length
    this.arquivo.push({ id: 1, nomeArquivo: 'Arquivo A', tamanhoArquivo: '10KB', dataCriacao: new Date(), dataAtualizacao: new Date(), acoes: '#' });
    // tslint:disable-next-line: max-line-length
    this.arquivo.push({ id: 2, nomeArquivo: 'Arquivo B', tamanhoArquivo: '100KB', dataCriacao: new Date(), dataAtualizacao: new Date(), acoes: '#' });
    this.service.Lista = this.arquivo;
    this.service.UrlEdit = 'WEBAPIEDIT';
    this.service.UrlDelete = 'WEBAPIDELETE';
    this.service.UrlView = 'WEBAPIVIEW';
    this.service.UrlFile = 'WEBAPIFILE';
    this.service.UrlDeleteFile = 'WEBAPIDELETEFILE';
    this.service.Modelo = 'Arquivo';
  }

  modelFuncionario() {
    // tslint:disable-next-line: max-line-length
    this.funcionario.push({ id: 1, nome: 'Arquivo A', cargo: 'Analista', salario: '10.00', dataCriacao: new Date(), dataAtualizacao: new Date(), acoes: '#' });
    this.service = new Service();
    this.service.Lista = this.funcionario;
    this.service.UrlEdit = 'WEBAPIEDIT';
    this.service.UrlDelete = 'WEBAPIDELETE';
    this.service.UrlView = 'WEBAPIVIEW';
    this.service.UrlFile = 'WEBAPIFILE';
    this.service.UrlDeleteFile = 'WEBAPIDELETEFILE';
    this.service.Modelo = 'Crud'; //  Crud,Arquivo ou ETC...
  }

  modelEmpresa() {
    // tslint:disable-next-line: max-line-length
    this.empresa.push({ id: 1, cnpj: '40488087000100', nomeFantasia: 'Empresa Angular', status: true, dataCriacao: new Date(), dataAtualizacao: new Date(), acoes: '#' });
    // tslint:disable-next-line: max-line-length
    this.empresa.push({ id: 2, cnpj: '40488087000101', nomeFantasia: 'Empresa C#', status: true, dataCriacao: new Date(), dataAtualizacao: new Date(), acoes: '#' });
    // tslint:disable-next-line: max-line-length
    this.empresa.push({ id: 3, cnpj: '40488087000102', nomeFantasia: 'Empresa Java', status: true, dataCriacao: new Date(), dataAtualizacao: new Date(), acoes: '#' });
    this.service = new Service();
    this.service.Lista = this.empresa;
    this.service.UrlEdit = 'WEBAPIEDIT';
    this.service.UrlDelete = 'WEBAPIDELETE';
    this.service.UrlView = 'WEBAPIVIEW';
    this.service.UrlFile = 'WEBAPIFILE';
    this.service.UrlDeleteFile = 'WEBAPIDELETEFILE';
    this.service.Modelo = 'Exportacao'; //  Crud,Arquivo ou ETC...
  }
}
