import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-template-login1',
  templateUrl: './template-login1.component.html',
  styleUrls: ['./template-login1.component.scss']
})
export class TemplateLogin1Component implements OnInit {
  hide: boolean;
  loading: boolean;
  constructor() { }

  ngOnInit() {
    this.hide = false;
  }

}
