import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-template3',
  templateUrl: './template3.component.html',
  styleUrls: ['./template3.component.css']
})
export class Template3Component implements OnInit {
  panelOpenState = false;

  constructor() { }

  ngOnInit() {
  }

  numericOnly(event): boolean {
    const patt = /^[0-9]*\,?[0-9]*$/g;
    const result = patt.test(event.key);
    return result;
  }

}
