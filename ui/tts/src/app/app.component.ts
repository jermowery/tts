import { ChangeDetectionStrategy, ChangeDetectorRef, Component, ElementRef, HostListener, OnInit, QueryList, ViewChild, ViewChildren } from '@angular/core';
import { FormArray, FormControl, FormGroup } from '@angular/forms';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { MatCard } from '@angular/material/card';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class AppComponent implements OnInit {
  formGroup = new FormGroup({
    'parts': new FormArray([]),
    'voiceCustomizations': new FormArray([]),
  });

  readonly voices: ReadonlyArray<string> = [
    "en-GB-Wavenet-A",
    "en-GB-Wavenet-B",
    "en-GB-Wavenet-C",
    "en-GB-Wavenet-D",
    "en-GB-Wavenet-F",
    "en-US-Wavenet-A",
    "en-US-Wavenet-B",
    "en-US-Wavenet-C",
    "en-US-Wavenet-D",
    "en-US-Wavenet-E",
    "en-US-Wavenet-F",
    "en-US-Wavenet-G",
    "en-US-Wavenet-H",
    "en-US-Wavenet-I",
    "en-US-Wavenet-J",
  ];
  loading = false;

  @ViewChildren(MatCard, { read: ElementRef }) cards!: QueryList<ElementRef<HTMLElement>>;
  @ViewChild("uploadFileInput", { read: ElementRef }) uploadFileInput!: ElementRef<HTMLInputElement>;

  constructor(private readonly http: HttpClient,
    private readonly changeDetectorRef: ChangeDetectorRef,) { }

  @HostListener('window:beforeunload', ['$event'])
  maybeConfirmUnload(e: BeforeUnloadEvent) {
    if (this.formGroup.dirty) {
      e.preventDefault();
      e.returnValue = '';
    }
  }

  ngOnInit() {
    this.addCardAt(0);
  }

  addCardAt(index: number) {
    this.getPartsControl().insert(index, new FormGroup(
      {
        'text': new FormControl(),
        'voice': new FormControl('en-US-Wavenet-A'),
      }));
    setTimeout(() => {
      this.cards.toArray()[index].nativeElement.scrollIntoView({ behavior: "smooth", block: "center" });
    });
  }

  deleteCardAt(index: number) {
    this.getPartsControl().removeAt(index);
  }

  getPartsControl(): FormArray {
    return this.formGroup.get('parts') as FormArray;
  }

  getVoiceCustomizationsControl(): FormArray {
    return this.formGroup.get('voiceCustomizations') as FormArray;
  }

  convertToAudio() {
    this.loading = true;
    this.formGroup.disable();
    this.http.post("http://172.17.44.167:8001/api", this.formGroup.value, {
      headers: new HttpHeaders({
        'Content-Type': 'application/json',
      }),
      responseType: 'blob',
    }).subscribe(
      response => {
        this.loading = false;
        this.formGroup.enable();
        let url = window.URL.createObjectURL(response);
        let a = document.createElement('a');
        document.body.appendChild(a);
        a.setAttribute('style', 'display: none');
        a.href = url;
        a.download = `converted-${new Date().toISOString()}.mp3`;
        a.click();
        window.URL.revokeObjectURL(url);
        a.remove();
      },
      e => {
        console.log(e);
        this.loading = false;
        this.formGroup.enable();
      });
  }

  download() {
    var a = document.createElement("a");
    var file = new Blob([JSON.stringify(this.formGroup.value)], { type: "application/json" });
    a.href = URL.createObjectURL(file);
    a.download = `saved-parts-${new Date().toISOString()}.json`;
    a.click();
  }

  loadPartsFromFile() {
    const files = this.uploadFileInput.nativeElement.files;
    if (!files || files.length <= 0) {
      return;
    }

    const fr = new FileReader();
    fr.addEventListener("load", () => {
      const formData: FormData = JSON.parse(fr.result as string);
      const parts = new FormArray([]);
      for (const part of formData.parts) {
        parts.push(new FormGroup({
          'text': new FormControl(part.text),
          'voice': new FormControl(part.voice),
        }))
      }
      const voiceCustomizations = new FormArray([]);
      for (const voiceCustomization of formData.voiceCustomizations) {
        voiceCustomizations.push(new FormGroup({
          'voiceId': new FormControl(voiceCustomization.voiceId),
          'customization': new FormControl(voiceCustomization.customization),
        }))
      }
      const newFormGroup = new FormGroup({
        'parts': parts,
        'voiceCustomizations': voiceCustomizations,
      });
      this.formGroup = newFormGroup;
      this.changeDetectorRef.markForCheck();
    });
    fr.readAsText(files.item(0)!);
  }

  addAVoice() {
    this.getVoiceCustomizationsControl().push(new FormGroup({
      'voiceId': new FormControl('en-US-Wavenet-A'),
      'customization': new FormControl(),
    }));
  }

  getVoiceDisplayName(voiceId: string) {
    const maybeCustomizedVoiceId = this.getVoiceCustomizationsControl().controls.find(
      control => control.get("voiceId")?.value === voiceId);
    if (maybeCustomizedVoiceId && maybeCustomizedVoiceId.get("customization")?.value) {
      return maybeCustomizedVoiceId.get("customization")?.value;
    }
    return voiceId;
  }

  removeVoiceCustomization(index: number) {
    this.getVoiceCustomizationsControl().removeAt(index);
  }
}

interface FormData {
  parts: Part[];
  voiceCustomizations: VoiceCustomization[];
}

interface Part {
  text: string;
  voice: string;
}

interface VoiceCustomization {
  voiceId: string;
  customization: string;
}