import { Component, OnInit } from '@angular/core';
import { EnumStatus } from '../../app_entities/enum/EnumStatus';

@Component({
  selector: 'app-template1',
  templateUrl: './template1.component.html',
  styleUrls: ['./template1.component.css']
})

export class Template1Component implements OnInit {
  keys: any[];
  statusList = EnumStatus;

  constructor() { }

  ngOnInit() {
    this.keys = Object.keys(EnumStatus).filter(Number);
  }

  filtrarLista() {
    const listaStatus: string[] = [];
    // Pega o valor do campo Status
    // for (const item of filtro.Status) {
    //  listaStatus.push(EnumStatus[item]);
    // }
    // lista = lista.filter(x => listaStatus.includes(x.Status));
  }
}
