import { Component, OnInit } from '@angular/core';
import { FormArray, FormControl, FormGroup } from '@angular/forms';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  readonly formGroup = new FormGroup({ 'cards': new FormArray([]) });

  ngOnInit() {
    this.addNewCard();
  }

  addNewCard() {
    this.getCardsControl().push(new FormGroup(
      {
        'ssml': new FormControl(),
        'voice': new FormControl(),
      }));
  }

  getCardsControl(): FormArray {
    return this.formGroup.get('cards') as FormArray;
  }

  convertToAudio() {

  }
}
