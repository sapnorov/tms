using my.tms from '../db/data-model';
using CatalogService from './CatalogService';
using CatalogService.CarBodies from './CatalogService';
using CatalogService.OrdersNew from './CatalogService';

annotate CatalogService.Transports with {

  ID 
    @Common.Label : 'Ид.';
  carBrand 
    @Common.Label : 'Марка';
  carModel 
    @Common.Label : 'Модель';   
  carBodyId 
    @Common.Label : 'Ид. кузова'  // к полю есть ValueList 
    @Common.FieldControl:#Mandatory // @ValueList: {type: #standard, entity: 'CarBodies' };   
    @sap.value.list: 'fixed-values'
    @Common:{ TextArrangement:#TextFirst }   //@Common:{ Text:carBodyId.carBodyName, TextArrangement:#TextFirst }    
    @Common.ValueList: {type: #fixed, entity: 'CarBodies' } ;

    /*
    @Common.ValueList: { 
      CollectionPath: 'CarBodies',
      Label: 'Кузова',
      SearchSupported: 'true',
      Parameters: [
        { $Type: 'Common.ValueListParameterInOut', ValueListProperty: 'ID', LocalDataProperty: 'carBodyId' },
		{ $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'carBodyName'},        
        //{ $Type: 'Common.ValueListParameterOut', ValueListProperty: 'carBodyName' },
      ]
    };
    */

  carStatusId 
    @Common.Label : 'Ид. статуса'  // к полю есть ValueList 
    @sap.value.list: 'fixed-values'
    @Common.ValueList: {type: #fixed, entity: 'TStatus' }; 
    //@Consumption.valueHelp:'carStatusVL' ;  
    
  carRegNumber 
    @Common.Label : 'Гос. Номер';  

/*    
  carStatusVL 
    @Common.Text: "carStatus/statusName"   
    @Common.Label : 'Статус'
    @sap.value.list: 'fixed-values'    
    @Common.ValueList: { 
      CollectionPath: 'TStatus',
      Label: 'Статус транспорта',
      SearchSupported: 'true',
      Parameters: [
        { $Type: 'Common.ValueListParameterOut', LocalDataProperty: 'carStatusId', ValueListProperty: 'ID'},
        { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'statusName'},
      ]
    }; 
*/    
  carEngineType
    @Common.Text: "carEngineType/engineName"   
    @Common.Label : 'Тип двигателя'
    @sap.value.list: 'fixed-values'    
    @Common.ValueList: { 
      CollectionPath: 'Engines',
      Label: 'Тип двигателя',
      SearchSupported: 'true',
      Parameters: [
        { $Type: 'Common.ValueListParameterOut', LocalDataProperty: 'carEngineType_ID', ValueListProperty: 'ID'},
        { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'engineName'},
      ]
    };    
  carLiftCapacity 
    @Common.Label : 'Грузоподъемность';   
  carDriver
    @Common.Text: "carDriver/driverSurname"   
    @Common.Label : 'Водитель'
    @sap.value.list: 'fixed-values'    
    @Common.ValueList: { 
      CollectionPath: 'Drivers',
      Label: 'Информация о водителе',
      SearchSupported: 'true',
      Parameters: [
        { $Type: 'Common.ValueListParameterOut', LocalDataProperty: 'carDriver_ID', ValueListProperty: 'ID'},
        { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'driverSurname'},
		{ $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'driverName'},        
      ]
    }; 
  carOriginalLocation 
    @Common.Text: "carDriver/driverSurname"   
    @Common.Label : 'Исходное местоположение'
    @sap.value.list: 'fixed-values'    
    @Common.ValueList: { 
      CollectionPath: 'Locations',
      Label: 'Информация по локациям',
      SearchSupported: 'true',
      Parameters: [
        { $Type: 'Common.ValueListParameterOut', LocalDataProperty: 'carOriginalLocation_ID', ValueListProperty: 'ID'},
        { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'locationLatitude'},
		{ $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'locationLongitude'},        
      ]
    };   

// ValueList
	/*
  carBodyVL
    @Common.Text: "carBody/carBodyName"  
    @Common.Label : 'Кузов'
    //@sap.value.list: 'fixed-values'
    @Common.FieldControl: #Mandatory    
	@Common.ValueList:{ type:#fixed, entity:'CarBodies' };   

    @Common.ValueList: { 
      CollectionPath: 'CarBodies',
      Label: 'Кузова',
      SearchSupported: 'true',
      Parameters: [
        { $Type: 'Common.ValueListParameterInOut', ValueListProperty: 'ID', LocalDataProperty: 'carBody_ID' },
        { $Type: 'Common.ValueListParameterOut', ValueListProperty: 'carBodyName', LocalDataProperty: 'carBody' },
      ]
    }; 
    */    

  carStatusVL
    @Common.Text: "carBody/carBodyName"  
    @Common.Label : 'Статус'
    //@sap.value.list: 'fixed-values'
    @Common.FieldControl: #Mandatory    
	//@Common.ValueList:{ type:#fixed, entity:'TStatus' };   

    @Common.ValueList: { 
      CollectionPath: 'TStatus',
      Label: 'Статус',
      SearchSupported: 'true',
      Parameters: [
        { $Type: 'Common.ValueListParameterInOut', ValueListProperty: 'ID', LocalDataProperty: 'carStatusID' },
        { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'statusName' },
      ]
    }; 
   
};


annotate CatalogService.Transports with @(
    Common: { SemanticKey: [carBrand] },
      
    Capabilities: {
        Insertable:true, Updatable:true, Deletable:true,
        FilterRestrictions: {
            NonFilterableProperties: [
                //to_carBodyId    
                carEngineType,
                carDriver,
                carOriginalLocation
            ]
        },
        SortRestrictions: {
			NonSortableProperties: [
                carRegNumber //,
			]
		},
		SearchRestrictions: {
			Searchable: true
		}
    },
    
  UI.LineItem: [ 
    {$Type: 'UI.DataField', Value: ID},
    {$Type: 'UI.DataField', Value: carBrand},
    {$Type: 'UI.DataField', Value: carModel},
    {$Type: 'UI.DataField', Value: carBodyId, TextArrangement:#TextFirst}, //"carBody/carBodyName"
    {$Type: 'UI.DataField', Value: carStatusId}, //"carStatus/statusName"    
    {$Type: 'UI.DataField', Value: carRegNumber},    
    {$Type: 'UI.DataField', Value: "carEngineType/engineName"},    
    {$Type: 'UI.DataField', Value: carLiftCapacity}, 
    {$Type: 'UI.DataField', Value: "carDriver/driverSurname"},    
    {$Type: 'UI.DataField', Value: "carOriginalLocation/locationLatitude"},    
  ],
  
  UI.HeaderInfo: {
    TypeName:'Транспорт', 
    TypeNamePlural:'Транспорт',  
    Title:       { Label: 'Марка',  Value: carBrand },
	Description: { Label: 'Модель', Value: carModel}
  },
  
/*
	UI.HeaderFacets: [
	{ Type:'UI.ReferenceFacet', Target: '@UI.FieldGroup#carBrand' },
	{ Type:'UI.ReferenceFacet', Target: '@UI.DataPoint#carStatusId' },
	],
*/

  UI.Identification:
  [
//    {$Type: 'UI.DataField', Value: ID},
  ], 
  

  UI.SelectionFields: 
  [
    carBrand,
    carModel,
    carBodyId,
    carStatusId,    
    carRegNumber,
    carLiftCapacity,
  ],


  UI.FieldGroup#Main: {
	Label: 'Main Information',
	Data: [
    		{$Type: 'UI.DataField', Value: ID},
    		{$Type: 'UI.DataField', Value: carBrand},
    		{$Type: 'UI.DataField', Value: carModel},
		    {$Type: 'UI.DataField', Value: carBodyId},
		    //{$Type: 'UI.DataField', Value: carBodyVL},		    
    		{$Type: 'UI.DataField', Value: carStatusId},     
    		{$Type: 'UI.DataField', Value: carRegNumber},  
		]
	},
	
  UI.FieldGroup#Detail: {
	Label: 'Detail Information',
	Data: [
		    //{$Type: 'UI.DataField', Value: carBodyVL},		    
    		{$Type: 'UI.DataField', Value: "carEngineType/engineName"},    
    		{$Type: 'UI.DataField', Value: carLiftCapacity}, 
    		{$Type: 'UI.DataField', Value: "carDriver/driverSurname"}, 
    		{$Type: 'UI.DataField', Value: "carOriginalLocation/locationLatitude"},     		
		]
	},	
	

  UI.Facets:
  [
    {
      $Type:'UI.CollectionFacet', 
      ID: 'FTransports',
      Label:'Транспорт',

      Facets: [ 
               { $Type:'UI.ReferenceFacet',  ID: 'FTransportsMain',   Label: 'Основные данные', Target: '@UI.FieldGroup#Main' },
               { $Type:'UI.ReferenceFacet',  ID: 'FTransportsDetail', Label: 'Доп. данные',     Target: '@UI.FieldGroup#Detail' }
              ],
		
    },

    {
      $Type:'UI.ReferenceFacet', 
      ID: 'FDrivers', 
      Label: 'Водители', Target: 'Drivers/@UI.LineItem'
    },
  ]	
 
);



annotate CatalogService.Drivers with {
  ID 
    @Common.Label : 'Ид.';
    //@Common.FieldControl: #ReadOnly;    
  driverQualification 
    @Common.Label : 'Квалификация';
    //@Common.FieldControl: #ReadOnly;    
  driverSurname 
    @Common.Label : 'Фамилия';
    //@Common.FieldControl: #ReadOnly;    
  driverName 
    @Common.Label : 'Имя';
    //@Common.FieldControl: #ReadOnly;    
  driverMiddleName 
    @Common.Label : 'Отчество';
    //@Common.FieldControl: #ReadOnly;    
  driverPhone 
    @Common.Label : 'Телефон';
    //@Common.FieldControl: #ReadOnly;    
  driverStatus 
    @Common.Label : 'Статус доступности';
    //@Common.FieldControl: #ReadOnly;    
};


annotate CatalogService.Drivers with @(
  UI.LineItem: [ 
    {$Type: 'UI.DataField', Value: ID},
    {$Type: 'UI.DataField', Value: driverQualification},
    {$Type: 'UI.DataField', Value: driverSurname},
    {$Type: 'UI.DataField', Value: driverName},
    {$Type: 'UI.DataField', Value: driverMiddleName},
    {$Type: 'UI.DataField', Value: driverPhone},   
    {$Type: 'UI.DataField', Value: driverStatus}     
  ],

  UI.HeaderInfo: {
    TypeName:'Водитель', 
    TypeNamePlural:'Водители',  
    Title:       { Label: 'Фамилия', Value: driverSurname },
	Description: { Label: 'Имя',     Value: driverName}    
  },

/*
  UI.Identification:
  [
      {$Type: 'UI.DataField', Value: ID},
      {$Type: 'UI.DataField', Value: driverQualification},
      {$Type: 'UI.DataField', Value: driverSurname},
      {$Type: 'UI.DataField', Value: driverName},
      {$Type: 'UI.DataField', Value: driverMiddleName},
      {$Type: 'UI.DataField', Value: driverPhone}, 
  ],
*/

  UI.SelectionFields: 
  [
    ID,
    driverQualification,
    driverSurname,
    driverName,    
    driverMiddleName,
    driverPhone,
  ],


  UI.FieldGroup#Main: {
	Label: 'Main Information',
	Data: [
      {$Type: 'UI.DataField', Value: ID},
      {$Type: 'UI.DataField', Value: driverQualification},
      {$Type: 'UI.DataField', Value: driverSurname},
      {$Type: 'UI.DataField', Value: driverName},
      {$Type: 'UI.DataField', Value: driverMiddleName},
      {$Type: 'UI.DataField', Value: driverPhone}, 
		]
	},  

/*  
  UI.Facets:
  [
    {
      ID: 'F_Orders',          
      Label:'Водители',    
      $Type:'UI.CollectionFacet', 
      Facets: [
            { $Type:'UI.ReferenceFacet', Label: 'Общие данные', Target: '@UI.Identification' }
          ],
    }
  ]	
*/

  UI.Facets:
  [
    {
      ID: 'FDrivers',          
      Label:'Водители',     
      $Type:'UI.CollectionFacet', 
      Facets: [ 
               { $Type:'UI.ReferenceFacet',  ID: 'FDriversMain',   Label: 'Основные данные', Target: '@UI.FieldGroup#Main' },
               { $Type:'UI.ReferenceFacet',  ID: 'FDriversDetail', Label: 'Доп. данные',     Target: '@UI.FieldGroup#Detail' }
              ],
		
    },
  ],	
  
);

/*
annotate CatalogService.CarBodies with {
  ID
    @Common.Label : 'Ид. кузова';  
  carBodyName 
    @Common.Label : 'Наименование типа кузова';
};
annotate CatalogService.TStatus with {
  ID
    @Common.Label : 'Ид. статуса';  
  statusName 
    @Common.Label : 'Наименование статуса';
};
*/

// 08.07.2018
annotate CatalogService.OrdersNew with {
  UUID 
    @Common.Label : 'Ид.';
    //@Common.FieldControl: #ReadOnly;   
  orderNumber 
    @Common.Label : 'Номер';    
  orderStatusId 
    @Common.Label : 'Статус заказа';
    //@Common.FieldControl: #ReadOnly;    
  orderWeight 
    @Common.Label : 'Вес, кг';
    //@Common.FieldControl: #ReadOnly;    
  orderLoadingLocationId 
    @Common.Label : 'Местоположение погрузки';
    //@Common.FieldControl: #ReadOnly;    
  orderDischargeLocationId 
    @Common.Label : 'Местоположение разгрузки';
    //@Common.FieldControl: #ReadOnly;    
  orderDistance 
    @Common.Label : 'Расстояние, км';
    //@Common.FieldControl: #ReadOnly;    
  orderTransportInfoId 
    @Common.Label : 'Информация о перевозчике';
    //@Common.FieldControl: #ReadOnly; 
  orderPlanDepartureDT 
    @Common.Label : 'Плановая дата и время отправления';
    //@Common.FieldControl: #ReadOnly; 
  orderActualDepartureDT 
    @Common.Label : 'Фактическая дата и время отправления';
    //@Common.FieldControl: #ReadOnly;   
  orderPlanArrivalDT 
    @Common.Label : 'Плановая дата и время прибытия';
    //@Common.FieldControl: #ReadOnly;  
  orderActualArrivalDT 
    @Common.Label : 'Фактическая дата и время прибытия';
    //@Common.FieldControl: #ReadOnly;     
};


annotate CatalogService.OrdersNew with @(
    Common: { SemanticKey: [orderNumber] },
      
    Capabilities: {
        Insertable:true, Updatable:true, Deletable:true,
        FilterRestrictions: {
            NonFilterableProperties: [
                //carEngineType,
            ]
        },
        SortRestrictions: {
			NonSortableProperties: [
                //carRegNumber
			]
		},
		SearchRestrictions: {
			Searchable: true
		}
    },

  UI.SelectionFields: 
  [
    ID,
    orderNumber,    
    orderStatusId,
    orderWeight,
    orderDistance,    
    orderPlanDepartureDT,
    orderPlanArrivalDT,
  ],
  
  UI.HeaderInfo: {
    TypeName:'Заказ', 
    TypeNamePlural:'Заказы',
    Title: { Value: orderNumber },
	Description: { Label: 'Статус', Value: orderStatusId},
	//Description: { Label: 'Расстояние, км', Value: orderDistance},
	
  },

  UI.Identification:
  [
      //{$Type: 'UI.DataField', Value: ID},
  ],
  
  UI.LineItem: [ 
    {$Type: 'UI.DataField', Value: ID},
    {$Type: 'UI.DataField', Value: orderNumber},    
    {$Type: 'UI.DataField', Value: orderStatusId},
    {$Type: 'UI.DataField', Value: orderWeight},
    {$Type: 'UI.DataField', Value: orderLoadingLocationId},
    {$Type: 'UI.DataField', Value: orderDischargeLocationId},
    {$Type: 'UI.DataField', Value: orderDistance}, 
    {$Type: 'UI.DataField', Value: orderTransportInfoId}, 
    {$Type: 'UI.DataField', Value: orderPlanDepartureDT}, 
    {$Type: 'UI.DataField', Value: orderActualDepartureDT},  
    {$Type: 'UI.DataField', Value: orderPlanArrivalDT}, 
    {$Type: 'UI.DataField', Value: orderActualArrivalDT},    
  ],

    UI.FieldGroup#Main: {
	Label: 'Main Information',
	Data: [
            {$Type: 'UI.DataField', Value: ID},	
    		{$Type: 'UI.DataField', Value: orderNumber},            
    		{$Type: 'UI.DataField', Value: orderStatusId},
    		{$Type: 'UI.DataField', Value: orderWeight},
    		{$Type: 'UI.DataField', Value: orderLoadingLocationId},
    		{$Type: 'UI.DataField', Value: orderDischargeLocationId}
		  ]
	},
	
  UI.FieldGroup#Detail: {
	Label: 'Detail Information',
	Data: [
    		{$Type: 'UI.DataField', Value: orderDistance},    
    		{$Type: 'UI.DataField', Value: orderTransportInfoId}, 
    		{$Type: 'UI.DataField', Value: orderPlanDepartureDT}, 
    		{$Type: 'UI.DataField', Value: orderActualDepartureDT},    
    		{$Type: 'UI.DataField', Value: orderPlanArrivalDT},
    		{$Type: 'UI.DataField', Value: orderActualArrivalDT},    		
		]
	},	
	
  UI.Facets:
  [
    {
      $Type:'UI.CollectionFacet', 
      ID: 'FOrders',
      Label:'Заказы',  
      
      Facets: [ 
               { $Type:'UI.ReferenceFacet',  ID: 'FOrdersMain',   Label: 'Основные данные', Target: '@UI.FieldGroup#Main' },
               { $Type:'UI.ReferenceFacet',  ID: 'FOrdersDetail', Label: 'Доп. данные',     Target: '@UI.FieldGroup#Detail' }
              ],          
    }
  ]	
);
