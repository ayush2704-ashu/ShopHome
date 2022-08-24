import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MailService } from '../mail.service';

@Component({
  selector: 'app-mail',
  templateUrl: './mail.component.html',
  styleUrls: ['./mail.component.css']
})
export class MailComponent implements OnInit {

  constructor(public es:MailService) { }

  ngOnInit() {
  }

  storeMsg="";
  sendEmail(emailRef:NgForm): void { 
    let email = emailRef.value; console.log(email); 
    this.es.sendEmail(email).subscribe(result=> { this.storeMsg=result; },error=>console.log(error),()=>{
    });
    emailRef.reset; 
 }
}
