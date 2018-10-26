unit AxSerial_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 52393 $
// File generated on 10/17/2018 8:44:26 AM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Program Files (x86)\Common Files\ActiveXperts\AxSerial32.dll (1)
// LIBID: {B24D8715-8901-4293-9938-AC3FBFBC9E8A}
// LCID: 0
// Helpfile: 
// HelpString: ActiveXperts Serial Port Component 3.2 Type Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// SYS_KIND: SYS_WIN32
// Errors:
//   Hint: Parameter 'String' of IComPort.WriteString changed to 'String_'
//   Hint: Parameter 'String' of IComPort.ReadString changed to 'String_'
//   Hint: Parameter 'Raise' of IComPort.RaiseRTS changed to 'Raise_'
//   Hint: Parameter 'Raise' of IComPort.RaiseDTR changed to 'Raise_'
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, Winapi.ActiveX;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  AxSerialMajorVersion = 1;
  AxSerialMinorVersion = 0;

  LIBID_AxSerial: TGUID = '{B24D8715-8901-4293-9938-AC3FBFBC9E8A}';

  IID_IComPort: TGUID = '{F9E033A4-283E-4AFD-B176-F2FACD7719AC}';
  CLASS_ComPort: TGUID = '{9366AAD2-50F4-4CFE-9613-6AC3406ED46B}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IComPort = interface;
  IComPortDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  ComPort = IComPort;


// *********************************************************************//
// Interface: IComPort
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {F9E033A4-283E-4AFD-B176-F2FACD7719AC}
// *********************************************************************//
  IComPort = interface(IDispatch)
    ['{F9E033A4-283E-4AFD-B176-F2FACD7719AC}']
    function Get_Version: WideString; safecall;
    function Get_Build: WideString; safecall;
    function Get_Module: WideString; safecall;
    function Get_LicenseStatus: WideString; safecall;
    function Get_LicenseKey: WideString; safecall;
    procedure Set_LicenseKey(const LicenseKey: WideString); safecall;
    procedure SaveLicenseKey; safecall;
    function Get_LogFile: WideString; safecall;
    procedure Set_LogFile(const LogFile: WideString); safecall;
    procedure Sleep(Ms: Integer); safecall;
    procedure Clear; safecall;
    function Get_LastError: Integer; safecall;
    function GetErrorDescription(ErrorCode: Integer): WideString; safecall;
    function Get_BaudRate: Integer; safecall;
    procedure Set_BaudRate(BaudRate: Integer); safecall;
    function Get_Parity: Integer; safecall;
    procedure Set_Parity(Parity: Integer); safecall;
    function Get_DataBits: Integer; safecall;
    procedure Set_DataBits(DataBits: Integer); safecall;
    function Get_StopBits: Integer; safecall;
    procedure Set_StopBits(StopBits: Integer); safecall;
    function Get_HardwareFlowControl: Integer; safecall;
    procedure Set_HardwareFlowControl(HardwareFlowControl: Integer); safecall;
    function Get_SoftwareFlowControl: Integer; safecall;
    procedure Set_SoftwareFlowControl(SoftwareFlowControl: Integer); safecall;
    function Get_ComTimeout: Integer; safecall;
    procedure Set_ComTimeout(Millisecs: Integer); safecall;
    function Get_IsOpened: WordBool; safecall;
    function Get_Device: WideString; safecall;
    procedure Set_Device(const Device: WideString); safecall;
    function Get_NewLine: WideString; safecall;
    procedure Set_NewLine(const NewLine: WideString); safecall;
    function Get_PreCommandDelay: Integer; safecall;
    procedure Set_PreCommandDelay(DelayMs: Integer); safecall;
    function Get_InterCharDelay: Integer; safecall;
    procedure Set_InterCharDelay(DelayMs: Integer); safecall;
    function Get_RTSFlowControl: Integer; safecall;
    procedure Set_RTSFlowControl(RTSl: Integer); safecall;
    function Get_DTRFlowControl: Integer; safecall;
    procedure Set_DTRFlowControl(DTR: Integer); safecall;
    function Get_CTSFlowControl: Integer; safecall;
    procedure Set_CTSFlowControl(CTS: Integer); safecall;
    function Get_DSRFlowControl: Integer; safecall;
    procedure Set_DSRFlowControl(DSR: Integer); safecall;
    procedure Open; safecall;
    procedure Close; safecall;
    procedure UpdateCom; safecall;
    function GetDeviceCount: Integer; safecall;
    function GetDeviceName(Device: Integer): WideString; safecall;
    function GetPortCount: Integer; safecall;
    function GetPortName(Port: Integer): WideString; safecall;
    procedure WriteString(const String_: WideString); safecall;
    procedure WriteByte(Byte: Integer); safecall;
    procedure WriteBytes(const Bytes: WideString); safecall;
    function ReadString: WideString; safecall;
    function ReadByte: Integer; safecall;
    function ReadBytes: WideString; safecall;
    procedure ClearTX; safecall;
    procedure ClearRX; safecall;
    procedure RaiseRTS(Raise_: WordBool); safecall;
    procedure RaiseDTR(Raise_: WordBool); safecall;
    function QueryCTS: WordBool; safecall;
    function QueryDSR: WordBool; safecall;
    function QueryDCD: WordBool; safecall;
    function QueryRI: WordBool; safecall;
    function Get_asFLOWCONTROL_DEFAULT: Integer; safecall;
    function Get_asFLOWCONTROL_DISABLE: Integer; safecall;
    function Get_asFLOWCONTROL_ENABLE: Integer; safecall;
    function Get_asDATABITS_DEFAULT: Integer; safecall;
    function Get_asDATABITS_7: Integer; safecall;
    function Get_asDATABITS_8: Integer; safecall;
    function Get_asPARITY_DEFAULT: Integer; safecall;
    function Get_asPARITY_NONE: Integer; safecall;
    function Get_asPARITY_ODD: Integer; safecall;
    function Get_asPARITY_EVEN: Integer; safecall;
    function Get_asPARITY_MARK: Integer; safecall;
    function Get_asPARITY_SPACE: Integer; safecall;
    function Get_asSTOPBITS_DEFAULT: Integer; safecall;
    function Get_asSTOPBITS_1: Integer; safecall;
    function Get_asSTOPBITS_2: Integer; safecall;
    function Get_asSTOPBITS_15: Integer; safecall;
    property Version: WideString read Get_Version;
    property Build: WideString read Get_Build;
    property Module: WideString read Get_Module;
    property LicenseStatus: WideString read Get_LicenseStatus;
    property LicenseKey: WideString read Get_LicenseKey write Set_LicenseKey;
    property LogFile: WideString read Get_LogFile write Set_LogFile;
    property LastError: Integer read Get_LastError;
    property BaudRate: Integer read Get_BaudRate write Set_BaudRate;
    property Parity: Integer read Get_Parity write Set_Parity;
    property DataBits: Integer read Get_DataBits write Set_DataBits;
    property StopBits: Integer read Get_StopBits write Set_StopBits;
    property HardwareFlowControl: Integer read Get_HardwareFlowControl write Set_HardwareFlowControl;
    property SoftwareFlowControl: Integer read Get_SoftwareFlowControl write Set_SoftwareFlowControl;
    property ComTimeout: Integer read Get_ComTimeout write Set_ComTimeout;
    property IsOpened: WordBool read Get_IsOpened;
    property Device: WideString read Get_Device write Set_Device;
    property NewLine: WideString read Get_NewLine write Set_NewLine;
    property PreCommandDelay: Integer read Get_PreCommandDelay write Set_PreCommandDelay;
    property InterCharDelay: Integer read Get_InterCharDelay write Set_InterCharDelay;
    property RTSFlowControl: Integer read Get_RTSFlowControl write Set_RTSFlowControl;
    property DTRFlowControl: Integer read Get_DTRFlowControl write Set_DTRFlowControl;
    property CTSFlowControl: Integer read Get_CTSFlowControl write Set_CTSFlowControl;
    property DSRFlowControl: Integer read Get_DSRFlowControl write Set_DSRFlowControl;
    property asFLOWCONTROL_DEFAULT: Integer read Get_asFLOWCONTROL_DEFAULT;
    property asFLOWCONTROL_DISABLE: Integer read Get_asFLOWCONTROL_DISABLE;
    property asFLOWCONTROL_ENABLE: Integer read Get_asFLOWCONTROL_ENABLE;
    property asDATABITS_DEFAULT: Integer read Get_asDATABITS_DEFAULT;
    property asDATABITS_7: Integer read Get_asDATABITS_7;
    property asDATABITS_8: Integer read Get_asDATABITS_8;
    property asPARITY_DEFAULT: Integer read Get_asPARITY_DEFAULT;
    property asPARITY_NONE: Integer read Get_asPARITY_NONE;
    property asPARITY_ODD: Integer read Get_asPARITY_ODD;
    property asPARITY_EVEN: Integer read Get_asPARITY_EVEN;
    property asPARITY_MARK: Integer read Get_asPARITY_MARK;
    property asPARITY_SPACE: Integer read Get_asPARITY_SPACE;
    property asSTOPBITS_DEFAULT: Integer read Get_asSTOPBITS_DEFAULT;
    property asSTOPBITS_1: Integer read Get_asSTOPBITS_1;
    property asSTOPBITS_2: Integer read Get_asSTOPBITS_2;
    property asSTOPBITS_15: Integer read Get_asSTOPBITS_15;
  end;

// *********************************************************************//
// DispIntf:  IComPortDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {F9E033A4-283E-4AFD-B176-F2FACD7719AC}
// *********************************************************************//
  IComPortDisp = dispinterface
    ['{F9E033A4-283E-4AFD-B176-F2FACD7719AC}']
    property Version: WideString readonly dispid 1;
    property Build: WideString readonly dispid 2;
    property Module: WideString readonly dispid 3;
    property LicenseStatus: WideString readonly dispid 100;
    property LicenseKey: WideString dispid 101;
    procedure SaveLicenseKey; dispid 102;
    property LogFile: WideString dispid 201;
    procedure Sleep(Ms: Integer); dispid 300;
    procedure Clear; dispid 301;
    property LastError: Integer readonly dispid 400;
    function GetErrorDescription(ErrorCode: Integer): WideString; dispid 401;
    property BaudRate: Integer dispid 500;
    property Parity: Integer dispid 501;
    property DataBits: Integer dispid 502;
    property StopBits: Integer dispid 503;
    property HardwareFlowControl: Integer dispid 504;
    property SoftwareFlowControl: Integer dispid 505;
    property ComTimeout: Integer dispid 506;
    property IsOpened: WordBool readonly dispid 507;
    property Device: WideString dispid 508;
    property NewLine: WideString dispid 509;
    property PreCommandDelay: Integer dispid 510;
    property InterCharDelay: Integer dispid 511;
    property RTSFlowControl: Integer dispid 604;
    property DTRFlowControl: Integer dispid 605;
    property CTSFlowControl: Integer dispid 606;
    property DSRFlowControl: Integer dispid 607;
    procedure Open; dispid 1000;
    procedure Close; dispid 1001;
    procedure UpdateCom; dispid 1002;
    function GetDeviceCount: Integer; dispid 1100;
    function GetDeviceName(Device: Integer): WideString; dispid 1101;
    function GetPortCount: Integer; dispid 1102;
    function GetPortName(Port: Integer): WideString; dispid 1103;
    procedure WriteString(const String_: WideString); dispid 1201;
    procedure WriteByte(Byte: Integer); dispid 1202;
    procedure WriteBytes(const Bytes: WideString); dispid 1203;
    function ReadString: WideString; dispid 1220;
    function ReadByte: Integer; dispid 1221;
    function ReadBytes: WideString; dispid 1222;
    procedure ClearTX; dispid 1230;
    procedure ClearRX; dispid 1231;
    procedure RaiseRTS(Raise_: WordBool); dispid 1240;
    procedure RaiseDTR(Raise_: WordBool); dispid 1241;
    function QueryCTS: WordBool; dispid 1242;
    function QueryDSR: WordBool; dispid 1243;
    function QueryDCD: WordBool; dispid 1244;
    function QueryRI: WordBool; dispid 1245;
    property asFLOWCONTROL_DEFAULT: Integer readonly dispid 2301;
    property asFLOWCONTROL_DISABLE: Integer readonly dispid 2302;
    property asFLOWCONTROL_ENABLE: Integer readonly dispid 2303;
    property asDATABITS_DEFAULT: Integer readonly dispid 2311;
    property asDATABITS_7: Integer readonly dispid 2312;
    property asDATABITS_8: Integer readonly dispid 2313;
    property asPARITY_DEFAULT: Integer readonly dispid 2321;
    property asPARITY_NONE: Integer readonly dispid 2322;
    property asPARITY_ODD: Integer readonly dispid 2323;
    property asPARITY_EVEN: Integer readonly dispid 2324;
    property asPARITY_MARK: Integer readonly dispid 2325;
    property asPARITY_SPACE: Integer readonly dispid 2326;
    property asSTOPBITS_DEFAULT: Integer readonly dispid 2331;
    property asSTOPBITS_1: Integer readonly dispid 2332;
    property asSTOPBITS_2: Integer readonly dispid 2333;
    property asSTOPBITS_15: Integer readonly dispid 2334;
  end;

// *********************************************************************//
// The Class CoComPort provides a Create and CreateRemote method to          
// create instances of the default interface IComPort exposed by              
// the CoClass ComPort. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoComPort = class
    class function Create: IComPort;
    class function CreateRemote(const MachineName: string): IComPort;
  end;

implementation

uses System.Win.ComObj;

class function CoComPort.Create: IComPort;
begin
  Result := CreateComObject(CLASS_ComPort) as IComPort;
end;

class function CoComPort.CreateRemote(const MachineName: string): IComPort;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ComPort) as IComPort;
end;

end.
