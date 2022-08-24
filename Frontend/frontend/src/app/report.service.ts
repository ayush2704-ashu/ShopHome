import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Report } from './report';

@Injectable({
  providedIn: 'root'
})
export class ReportService {

  constructor(public http:HttpClient) { }

  loadAllProductIndfo(): Observable<Report[]>{
    return this.http.get<Report[]>("http://localhost:8082/api/report/orders");
  }
}
