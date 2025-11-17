public class AssetDetailCls {

    public String vin;      //WMAL36ZZZ1Y076935
    public String vehicleNum;       //L361824
    public String regNumCountryKey;     //CH
    public String manufacturer;     //MAN
    public String prodCode;     //L
    public String modelRange;       //L20
    public String modelRangeAvis;       //L2000
    public String vehicleType;      //10.225 LLC
    public String typeVariant;      //LL
    public String modelType;        //L36
    public String deliveryExWorkDate;       //2001-01-03
    public String firstRegDate;     //2001-04-05
    public String wheelBase;        //4900
    public String suspension;       //BL
    public String unitMaxWeightAllowed;     //To
    public String truckAxle;        //03,700
    public String customerRegDate;      //2015-07-08
    public String customerNo;       //005002122
    public String customerName;     //Pferdesportstall Sigg AG
    public String vehicleOrderNum;      //804914360
    public measuringPoint measuringPoint;
    public List<warranty> warranty;
    public vehicleAggregate vehicleAggregate;
    public maintenance maintenance;
   
    public class measuringPoint {
        public String measPoint;        //KM-IST
        public String counterReading;       //108154
        public String mpUnit;       //KM
    }

    public class warranty {
        public String type;     //V
        public String typeText;     //Vereinbarungen allg.
        public String internalNumber;       //0000318
        public String reasonText;       //BASIS-GB. LKW IN/AUSLAND FZG  2.JAHR ANTRSTRG
        public String totalMilageUnit;      //KM
        public String totalMilageFrom;      //0000001
        public String wholeMilage;      //0200000
        public String diffMilage;       //0000000
        public String diffMilage1;      //0000000
        public String conditionStartDate;       //2002-04-05
        public String conditionEndDate;     //2003-04-05
        public String stateOfWarranty;      //A
        public String text2;        //Aktiv
        public String text3;        //SMH Startdatum MOD: 00000000  - Einlagerungstage MOD:
        public String text4;        //Start-KM MOD:
        public String fromValue;        //0000013
        public String toValue;      //0000024
    }

    public class vehicleAggregate {
        public List<standard> standard;
        public motor motor;
        public gearbox gearbox;
        public cab cab;
        public steering steering;
        public tachometer tachometer;
        public tankBody tankBody;
    }

    public class standard {
        public String vin;      //WMAL36ZZZ1Y076935
        public String aggUnitDesc;      //Vorderachse 1
        public String aggUnitkey;       //004
        public String typeDescription;      //V9-42L-12
        public String manufSerialNo;        //073081
        public String manufacturer;     //MAN
        public String installationDate;     //2001-01-03
    }

    public class motor {
        public String vin;      //WMAL36ZZZ1Y076935
        public String aggUnitDesc;      //Motor
        public String aggUnitkey;       //001
        public String typeDescription;      //D0836LFL02
        public String manufSerialNo;        //1559652521P2B1
        public String manufacturer;     //MAN
        public String enginePower;      //162
        public String cubicCapacity;        //06871
        public String cubicCapacityUnit;        //CCM
        public String installationDate;     //2001-01-03
        public String enginePower1;     //0220
        public String enginePowerUnit1;     //HP
        public String emissionClass;        //EURO3
    }

    public class gearbox {
        public String vin;      //WMAL36ZZZ1Y076935
        public String aggUnitDesc;      //WGetriebe
        public String aggUnitkey;       //003
        public String typeDescription;      //6S-850
        public String manufSerialNo;        //606314
        public String installationDate;     //2001-01-03
        public String noGears;      //6
    }

    public class cab {
        public String vin;      //WMAL36ZZZ1Y076935
        public String aggUnitDesc;      //Fahrerhaus
        public String aggUnitkey;       //008
        public String typeDescription;      //K
        public String manufacturer;     //MAN
        public String installationDate;     //2001-01-03
        public String colour;       //REINWEISS RAL 9010
    }

    public class steering {
        public String vin;      //WMAL36ZZZ1Y076935
        public String aggUnitDesc;      //Lenkung
        public String aggUnitkey;       //009
        public String typeDescription;      //Lenkung
        public String installationDate;     //2001-01-03
        public String steerControl;     //L
    }

    public class tachometer {
        public String vin;      //WMAL36ZZZ1Y076935
        public String aggUnitDesc;      //Tachometer
        public String aggUnitkey;       //015
        public String typeDescription;      //Tacho-1
        public String manufSerialNo;        //1
        public String manufacturer;     //MAN
        public String installationDate;     //2001-01-03
    }

    public class tankBody {
        public String vin;      //WMAL36ZZZ1Y076935
        public String aggUnitDesc;      //Tankaufbau
        public String aggUnitkey;       //307
        public String typeDescription;      //Tankaufbau
        public String manufacturer;     //MAN
        public String installationDate;     //2001-01-03
    }

    public class maintenance {
        public List<plan> plan;
    }

    public class plan {
        public String vin;      //WMAL36ZZZ1Y076935
        public String mpType;       //3
        public String salesOrg;     //DE0S
        public String serviceCode;      //57B/G24
        public String serviceCodeDesc;      //TCO
        public String lastMaintKM;      //0 
        public String nextMaintDate;        //2003-04-01
        public String nextMaintKM;      //0 
        public customerRequest customerRequest;
    }

    public class customerRequest {
        public String objectCode1;      //WA1
        public String objectCode2;      //B
        public String version;      //00
        public String location;     //00
    }
}