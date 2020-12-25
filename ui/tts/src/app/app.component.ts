import { Component, OnInit } from '@angular/core';
import { FormArray, FormControl, FormGroup } from '@angular/forms';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  private readonly httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json',
    }),
  };

  readonly formGroup = new FormGroup({ 'parts': new FormArray([]) });

  constructor(private readonly http: HttpClient) { }

  ngOnInit() {
    this.addNewCard();
  }

  addNewCard() {
    this.getPartsControl().push(new FormGroup(
      {
        'text': new FormControl(),
        'voice': new FormControl(),
      }));
  }

  getPartsControl(): FormArray {
    return this.formGroup.get('parts') as FormArray;
  }

  convertToAudio() {
    this.http.post("http://localhost:8001/api", this.formGroup.value, {
      headers: new HttpHeaders({
        'Content-Type': 'application/json',
      }),
      responseType: 'blob',
    }).subscribe(
      response => {
        let url = window.URL.createObjectURL(response);
        let a = document.createElement('a');
        document.body.appendChild(a);
        a.setAttribute('style', 'display: none');
        a.href = url;
        a.download = "converted.mp3";
        a.click();
        window.URL.revokeObjectURL(url);
        a.remove();
      },
      e => console.error(e));
  }
}
