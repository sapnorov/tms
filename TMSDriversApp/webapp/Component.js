jQuery.sap.declare("my.tms.tmsdriversapp.Component");
sap.ui.getCore().loadLibrary("sap.ui.generic.app");
jQuery.sap.require("sap.ui.generic.app.AppComponent");

sap.ui.generic.app.AppComponent.extend("my.tms.tmsdriversapp.Component", {
	metadata: {
		"manifest": "json"
	}
});