using my.tms from '../db/data-model';
service CatalogService {
  entity Transports as projection on tms.Transports; //@readonly 
  entity Drivers as projection on tms.Drivers; //@readonly 
  entity Orders as projection on tms.Orders;  //@insertonly 
  entity OrdersNew as projection on tms.OrdersNew;   
  //entity Events as projection on tms.Events;  //@insertonly  
 
 
  entity Locations as projection on tms.Locations; //@readonly  
  entity Routes as projection on tms.Routes; //@readonly  
  entity ETypes as projection on tms.ETypes; //@readonly  
  
//
// Entities for Value Lists
//  
  entity CarBodies as projection on tms.CarBodies; //@readonly 
  entity TStatus as projection on tms.TStatus; //@readonly 
  entity OStatus as projection on tms.OStatus; //@readonly  
  entity Engines as projection on tms.Engines; //@readonly  
}


