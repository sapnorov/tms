package my.tms;

import java.util.ArrayList;
import java.util.List;

import com.sap.cloud.sdk.service.prov.api.*;
import com.sap.cloud.sdk.service.prov.api.annotations.*;
import com.sap.cloud.sdk.service.prov.api.exits.*;
import com.sap.cloud.sdk.service.prov.api.request.*;
import com.sap.cloud.sdk.service.prov.api.response.*;
import org.slf4j.*;

// FOR UUID and OrderNumber generation //SAPNOROV
import java.util.UUID;
import java.util.Date;
import javax.naming.InitialContext;
import javax.naming.NamingException;
//import javax.persistence.EntityManager;
//import jpa.my.tms.Transports;
//import my.tms.jpa.my.tms.OrdersNew;
import org.apache.olingo.odata2.api.exception.ODataApplicationException;

public class OrdersNewService {
/*  
  private static final Logger LOG = LoggerFactory.getLogger (OrdersService.class.getName());

  @BeforeRead (entity="Orders", serviceName="CatalogService")
  public BeforeReadResponse beforeReadOrders (ReadRequest req, ExtensionHelper h){
    LOG.error ("##### Orders - beforeReadOrders ########");
    return BeforeReadResponse.setSuccess().response();
  }

  @AfterRead (entity = "Orders", serviceName="CatalogService")
  public ReadResponse afterReadOrders (ReadRequest req, ReadResponseAccessor res, ExtensionHelper h) {
    EntityData ed = res.getEntityData();
    EntityData ex = EntityData.getBuilder(ed).addElement("amount", 1000).buildEntityData("Orders");
    return ReadResponse.setSuccess().setData(ex).response();
  }
  
  @AfterQuery (entity = "Orders", serviceName="CatalogService")
  public QueryResponse afterQueryOrders (QueryRequest req, QueryResponseAccessor res, ExtensionHelper h) {
    List<EntityData> dataList = res.getEntityDataList(); //original list
    List<EntityData> modifiedList = new ArrayList<EntityData>(dataList.size()); //modified list
    for(EntityData ed : dataList){ 
		  EntityData ex = EntityData.getBuilder(ed).addElement("amount", 1000).buildEntityData("Orders");
		  modifiedList.add(ex);
	  }
    return QueryResponse.setSuccess().setData(modifiedList).response();
  }
*/  
}