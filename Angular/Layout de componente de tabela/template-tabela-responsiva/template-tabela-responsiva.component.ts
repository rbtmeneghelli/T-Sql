import { Component, ViewChild, OnInit } from '@angular/core';
import { MatTableDataSource, MatPaginator, MatSort } from '@angular/material';
import { animate, state, style, transition, trigger } from '@angular/animations';

// MODELS & ENUMS
import { Aios } from '../../app_entities/model/aio.model';
import { EnumStatus } from '../../app_entities/enum/EnumStatus';

@Component({
  selector: 'app-template-tabela-responsiva',
  templateUrl: './template-tabela-responsiva.component.html',
  styleUrls: ['./template-tabela-responsiva.component.css'],
  animations: [
    trigger('detailExpand', [
      state('collapsed', style({ height: '0px', minHeight: '0' })),
      state('expanded', style({ height: '*' })),
      transition('expanded <=> collapsed', animate('225ms cubic-bezier(0.4, 0.0, 0.2, 1)'))
    ])
  ]
})
export class TemplateTabelaResponsivaComponent implements OnInit {

  displayedColumns: string[] = ['Protocolo', 'Inicio', 'Termino', 'Permissionaria', 'TipoObra', 'Status'];
  dataSource = new MatTableDataSource();
  expandedElement: Aios | null;

  @ViewChild(MatPaginator, { static: true }) paginator: MatPaginator;
  @ViewChild(MatSort, { static: true }) sort: MatSort;

  constructor() { }

  ngOnInit() {
    const user = new Array<Aios>();
    let objeto: Aios = new Aios();
    for (let i = 0; i <= 10; i++) {
      if (i % 2 === 1) {
        objeto.id = i;
        objeto.Protocolo = 'testeImpar';
        objeto.Permissionaria = 'COMGAS';
        objeto.Status = EnumStatus[EnumStatus.Inativo];
        objeto.TipoObra = 'Rodoviaria';
        objeto.Inicio = new Date();
        objeto.Termino = new Date();
        user.push(objeto);
        objeto = new Aios();
      } else {
        objeto.id = i;
        objeto.Protocolo = 'testePar';
        objeto.Permissionaria = 'SABESP';
        objeto.Status = EnumStatus[EnumStatus.Ativo];
        objeto.TipoObra = 'Hidraulico';
        objeto.Inicio = new Date();
        objeto.Termino = new Date();
        user.push(objeto);
        objeto = new Aios();
      }
    }
    this.dataSource = new MatTableDataSource(user);
    this.ConfigurarDataTable();
  }

  applyFilter(filterValue: string) {
    this.dataSource.filter = filterValue.trim().toLowerCase();
    if (this.dataSource.paginator) {
      this.dataSource.paginator.firstPage();
    }
  }

  ConfigurarDataTable() {
    this.paginator._intl.itemsPerPageLabel = 'Itens por página';
    this.paginator._intl.firstPageLabel = 'Primeira página';
    this.paginator._intl.previousPageLabel = 'Página anterior';
    this.paginator._intl.nextPageLabel = 'Próxima página';
    this.paginator._intl.lastPageLabel = 'Última página';
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;
  }

}

