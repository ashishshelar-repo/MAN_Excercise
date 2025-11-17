/****************

Class name:  SalesManExercise
Test clas name : SalesManExercise_test
Description: This class is called from Flow which makes API callout to external system to fetch asset details ( warranty, telematics, servicing etc. )
Created by: Ashish 
Last modified by:  Ashish
*****************/

public class SalesManExercise {
  
  /***************
  Method Description: to make callout to external system
  ****/  
  @InvocableMethod(label='Fetch Asset Details' description='Get asset related data frm external system')
   public static void makeApiCall(list<id> recordids ) {

        system.debug('## record ids'+ recordids);         

		HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:MAN_Cred');
        req.setMethod('GET');
       
        Http http = new Http();
        HTTPResponse res;
        try {
                    res = http.send(req);
                    System.debug('Response Status: ' + res.getStatus());
                    System.debug('Response Body: ' + res.getBody());
                
                    AssetDetailCls assetWrapper = (AssetDetailCls) JSON.deserialize(res.getBody(), AssetDetailCls.class);
                    list<AssetDetailCls.warranty> warrantyList= new list<AssetDetailCls.warranty>();
					AssetDetailCls.vehicleAggregate telematicsDetails=new AssetDetailCls.vehicleAggregate();

					warrantyList=assetWrapper.warranty;
            		telematicsDetails= assetWrapper.vehicleAggregate;
					
					system.debug('vin'+assetWrapper.vin );
                    Asset assetRec=[SELECT id from asset where id in :recordids  ];  // in :recordids
                    system.debug('### asset rec'+assetRec );
            		system.debug('### assetwrapper'+assetWrapper );		
			
                    if(assetRec <> null && assetWrapper <> null) {
                        
                            system.debug('###inside IF '+assetWrapper.vin + assetWrapper.vehicleType+assetWrapper.vehicleNum+ assetWrapper.truckAxle );
							system.debug('### telematicsDetails.motor.vin'+ telematicsDetails.motor.vin);
                         //   system.debug('### telematicsDetails.motor.vin'+ assetWrapper.telematicsDetails.motor.vin);

							// Get Vehicle Details 
                            assetRec.vin__c= assetWrapper.vin ;
                            assetRec.vehicleType__c= assetWrapper.vehicleType ;
                            assetRec.vehicleNum__c	= assetWrapper.vehicleNum ;
                            assetRec.truckAxle__c= assetWrapper.truckAxle ;
                            assetRec.suspension__c= assetWrapper.suspension ;
                            assetRec.customerName__c= assetWrapper.customerName ;
        					
							// Get Telematics Data 
					String motorDetails='vin :'+ telematicsDetails.motor.vin + '; '+
                        				'typeDescription :'+ telematicsDetails.motor.typeDescription + '; '+
										'manufSerialNo :'+ telematicsDetails.motor.manufSerialNo + '; '+
                        				'enginePower :'+ telematicsDetails.motor.enginePower + '; '+
										'cubicCapacity :'+ telematicsDetails.motor.cubicCapacity + '; '+
                        				'cubicCapacityUnit :'+ telematicsDetails.motor.cubicCapacityUnit + '; '+
										'installationDate :'+ telematicsDetails.motor.installationDate + '; '+
										'enginePowerUnit1 :'+ telematicsDetails.motor.enginePowerUnit1 + '; '+
                        				'emissionClass :'+ telematicsDetails.motor.emissionClass + '; ';
                    
					String gearboxDetails='vin :'+ telematicsDetails.gearbox.vin + '; '+
                        				'aggUnitDesc :'+ telematicsDetails.gearbox.aggUnitDesc + '; '+
										'aggUnitkey :'+ telematicsDetails.gearbox.aggUnitkey + '; '+
                        				'typeDescription :'+ telematicsDetails.gearbox.typeDescription + '; '+
										'manufSerialNo :'+ telematicsDetails.gearbox.manufSerialNo + '; '+
                        				'installationDate :'+ telematicsDetails.gearbox.installationDate + '; '+
										'noGears :'+ telematicsDetails.gearbox.noGears + '; ' ;

					String cabDetails=  'vin :'+ telematicsDetails.cab.vin + '; '+
                        				'aggUnitDesc :'+ telematicsDetails.cab.aggUnitDesc + '; '+
										'aggUnitkey :'+ telematicsDetails.cab.aggUnitkey + '; '+
                        				'typeDescription :'+ telematicsDetails.cab.typeDescription + '; '+
										'manufacturer :'+ telematicsDetails.cab.manufacturer + '; '+
                        				'installationDate :'+ telematicsDetails.cab.installationDate + '; '+
										'colour :'+ telematicsDetails.cab.colour + '; ' ;
	
					String steeringDetails=  'vin :'+ telematicsDetails.steering.vin + '; '+
                        				'aggUnitDesc :'+ telematicsDetails.steering.aggUnitDesc + '; '+
										'aggUnitkey :'+ telematicsDetails.steering.aggUnitkey + '; '+
                        				'typeDescription :'+ telematicsDetails.steering.typeDescription + '; '+
                        			    'installationDate :'+ telematicsDetails.steering.installationDate + '; '+
										'steerControl :'+ telematicsDetails.steering.steerControl + '; ';

					String tachometerDetails=  'vin :'+ telematicsDetails.tachometer.vin + '; '+
                        				'aggUnitDesc :'+ telematicsDetails.tachometer.aggUnitDesc + '; '+
										'aggUnitkey :'+ telematicsDetails.tachometer.aggUnitkey + '; '+
                        				'typeDescription :'+ telematicsDetails.tachometer.typeDescription + '; '+
                        			    'installationDate :'+ telematicsDetails.tachometer.installationDate + '; '+
                        				'manufacturer :'+ telematicsDetails.tachometer.manufacturer + '; '+
										'manufSerialNo :'+ telematicsDetails.tachometer.manufSerialNo + '; ';

			        String tankBodyDetails=  'vin :'+ telematicsDetails.tankBody.vin + '; '+
                        				'aggUnitDesc :'+ telematicsDetails.tankBody.aggUnitDesc + '; '+
										'aggUnitkey :'+ telematicsDetails.tankBody.aggUnitkey + '; '+
                        				'typeDescription :'+ telematicsDetails.tankBody.typeDescription + '; '+
                        			    'installationDate :'+ telematicsDetails.tankBody.installationDate + '; '+
                        				'manufacturer :'+ telematicsDetails.tankBody.manufacturer + '; ';

							assetRec.Motor_Details__c =motorDetails ;
                            assetRec.Gearbox_Details__c =gearboxDetails ;
                        	assetRec.Cab__c =cabDetails ;
                        	assetRec.Steering__c =steeringDetails ;
                        	assetRec.Tankbody_Details__c =tankBodyDetails ;
							assetRec.Techometer_Details__c=tachometerDetails ;  

                            UPDATE assetRec;
		 			}
                    
 					/* Get Warranty Details for Vehicle */
                    for(AssetDetailCls.warranty warrantyVar:warrantyList){
            	                 	Warranty__c warrantyRec=new Warranty__c();	
                                    warrantyRec.typeText__c= warrantyVar.typeText;
                                    warrantyRec.internalNumber__c= warrantyVar.reasonText;
									warrantyRec.reasonText__c= warrantyVar.internalNumber;
									warrantyRec.conditionStartDate__c= warrantyVar.conditionStartDate;
									warrantyRec.conditionEndDate__c= warrantyVar.conditionEndDate;	
									warrantyRec.status__C= warrantyVar.text2 ;
									warrantyRec.totalMilageFrom__c= warrantyVar.totalMilageFrom;	
									warrantyRec.wholeMilage__c= warrantyVar.wholeMilage;
                                    warrantyRec.asset__c=recordids[0];
                        
                        INSERT warrantyRec; 
                    } 

		 } catch (Exception e) {
            System.debug('Error: ' + e.getMessage());
          //  Log exception in custom Log Error object 
        }
    }
}