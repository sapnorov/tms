namespace my.tms;
entity Transports {
  key ID : Integer;
  carBrand  : String;
  carModel  : String;  
  carBodyId : Integer;
  carStatusId : Integer;  
  carRegNumber  : String;

  carEngineType  : Association to Engines; 
  carLiftCapacity  : Integer;
  carDriver  : Association to Drivers;
  carOriginalLocation  : Association to Locations;
}

entity Drivers {
  key ID : Integer;
  driverQualification   : String;
  driverSurname   : String; 
  driverName   : String;  
  driverMiddleName   : String;   
  driverPhone   : Integer;     
  driverStatus   : Boolean;  
}

entity Orders {
  key ID : Integer;
  orderStatusId : Integer; //  orderStatus   : Association to OStatus; 
  orderWeight   : Decimal(10,2); 
  orderLoadingLocationId : Integer; //  orderLoadingLocation   : Association to Locations; 
  orderDischargeLocationId : Integer; //  orderDischargeLocation   : Association to Locations;   
  orderDistance   : Decimal(10,2);
  orderTransportInfoId : Integer; //  orderTransportInfo   : Association to Transports;
  orderPlanDepartureDT   : DateTime;
  orderActualDepartureDT   : DateTime; 
  orderPlanArrivalDT   : DateTime;  
  orderActualArrivalDT   : DateTime;  
}

entity OrdersNew {
  key ID : Integer;
  orderStatusId : Integer; //  orderStatus   : Association to OStatus; 
  orderWeight   : Decimal(10,2); 
  orderLoadingLocationId : Integer; //  orderLoadingLocation   : Association to Locations; 
  orderDischargeLocationId : Integer; //  orderDischargeLocation   : Association to Locations;   
  orderDistance   : Decimal(10,2);
  orderTransportInfoId : Integer; //  orderTransportInfo   : Association to Transports;
  orderPlanDepartureDT   : DateTime;
  orderActualDepartureDT   : DateTime; 
  orderPlanArrivalDT   : DateTime;  
  orderActualArrivalDT   : DateTime;  
}

entity Events {
  key ID : Integer;
  eventDT   : DateTime;
  eventEventDescr   : String;  
  eventLocation   : Association to Locations;   
  eventType   : Association to ETypes;     
}

entity CarBodies {
  key ID : Integer @title:'Ид. кузова' @Common:{ Text:carBodyName, TextArrangement:#TextLast };
  carBodyName   : String @title:'Наименование типа кузова';
}

entity TStatus {
  key ID : Integer @title:'Ид. статуса' @Common:{ Text:statusName, TextArrangement:#TextFirst };
  statusName   : String @title:'Наименование статуса';
}

entity OStatus {
  key ID : Integer;
  statusName   : String;
}

entity Engines {
  key ID : Integer;
  engineName   : String;
}

entity Locations {
  key ID : Integer;
  locationLatitude   : Double;
  locationLongitude   : Double;  
}

entity Routes {
  key ID : Integer;
  routeSerialNumber   : Integer;
  routeLocation   : Association to Locations;
}
entity ETypes {
  key ID : Integer;
  eventTypeName   : String;
}
