import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Mail } from './mail';

@Injectable({
  providedIn: 'root'
})
export class MailService {

  constructor(public http:HttpClient) { }

  sendEmail(email:Mail) :Observable<string>{ 
    return this.http.post("http://localhost:8086/email/data",email,{responseType:'text'}) 
  }
}
