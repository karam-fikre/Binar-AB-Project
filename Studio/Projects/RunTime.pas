unit RunTime;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.CheckLst;

type
  TForm2 = class(TForm)
    ProductionLine1CheckBox: TCheckBox;
    ProductionLine2CheckBox: TCheckBox;
    ProductionLine3CheckBox: TCheckBox;
    ProductionLine4CheckBox: TCheckBox;
    ProductionLine1Edit: TEdit;
    Timer1: TTimer;
    CloseButton: TButton;
    ProductionLine1StatusComboBox: TComboBox;
    ProductionLine2Edit: TEdit;
    ProductionLine2StatusComboBox: TComboBox;
    ProductionLine3Edit: TEdit;
    ProductionLine3StatusComboBox: TComboBox;
    ProductionLine4Edit: TEdit;
    ProductionLine4StatusComboBox: TComboBox;
    ManuelCheckBox: TCheckBox;
    SendButton: TButton;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure ManuelCheckBoxClick(Sender: TObject);
    procedure SendButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    notifyText:Array[0..3] of string;
    function GetProductionLineStatus():string;
    function GetTheCurrentStatusForManuel():string;
    function SendDataWithFlipOrNot():string;
  end;

var
  Form2: TForm2;
  i:integer;
  checkErrorState:integer;
  productionLine:Array[0..4] of string;

implementation

{$R *.dfm}

uses OpenPortForm;



procedure TForm2.FormCreate(Sender: TObject);
var count:integer;
begin
i:=0;
      //Initialize the Production Lines Status Selection
      ProductionLine1StatusComboBox.Items.Add('Ok');
      ProductionLine1StatusComboBox.Items.Add('Warning');
      ProductionLine1StatusComboBox.Items.Add('Fail');
      ProductionLine1StatusComboBox.ItemIndex:=0;

      ProductionLine2StatusComboBox.Items.Add('Ok');
      ProductionLine2StatusComboBox.Items.Add('Warning');
      ProductionLine2StatusComboBox.Items.Add('Fail');
      ProductionLine2StatusComboBox.ItemIndex:=0;

      ProductionLine3StatusComboBox.Items.Add('Ok');
      ProductionLine3StatusComboBox.Items.Add('Warning');
      ProductionLine3StatusComboBox.Items.Add('Fail');
      ProductionLine3StatusComboBox.ItemIndex:=0;

      ProductionLine4StatusComboBox.Items.Add('Ok');
      ProductionLine4StatusComboBox.Items.Add('Warning');
      ProductionLine4StatusComboBox.Items.Add('Fail');
      ProductionLine4StatusComboBox.ItemIndex:=0;


      //Initialize the Notifying text
      for count := 0 to 3 do
      notifyText[count]:='';  // This is will be the Notifying text that will be shown in the bottom of the display.

end;



procedure TForm2.Timer1Timer(Sender: TObject);

begin

             i:=i+1;

            {
                These are som lines for testing
                and see how the data send and work through a timer;
            }


             if (i=2) then begin
               productionLine[0]:='1-Warning';
               GetProductionLineStatus();
             end 

             else if (i=4) then begin
               productionLine[0]:='1-Warning';
               productionLine[1]:='2-Fail';
               GetProductionLineStatus();
             end
             
             else if (i=6) then begin
               productionLine[0]:='1-Fail';
               productionLine[1]:='2-Fail';
               productionLine[2]:='3-Fail';
               productionLine[3]:='4-Fail';
               GetProductionLineStatus();   
              
             end
             else if (i=8)then begin
               productionLine[0]:='1-Ok';
               productionLine[1]:='2-Ok';
               productionLine[2]:='3-Ok';
               productionLine[3]:='4-Ok';
               GetProductionLineStatus();              
             end
             
             else if i=10 then begin
               productionLine[4]:='Fire';
               GetProductionLineStatus();                
             end

             else if i=12 then begin
               productionLine[0]:='1-Ok';
               productionLine[1]:='2-Ok';
               productionLine[2]:='3-Ok';
               productionLine[3]:='4-Ok';
               productionLine[4]:='';
               GetProductionLineStatus();
               Timer1.Enabled:=false;
             end
end;



{
  The Data will send in this form depending on the status:
  N. of production line + - + the status ---->  for example:
  1-Ok // OR 1-Warning // OR 1-Fail and so on for other production lines

  and there is a special data for Fire which will be sent in this form:
  4-FIRE

}
//In this function below I'll check all the Production lines if there is an error or not
//First I'll check the number of the production and then I'll check it's status
function TForm2.GetProductionLineStatus():string;
var count:integer; st:String;scrollOrNot:integer; fireAlarm:boolean;
begin
       fireAlarm:=False;
      scrollOrNot:=0; // This parameter is used for check if there is more than one Production line is in error state to scroll the notifying text.

    for count := 0 to length(productionLine)-1 do begin   //Loop for the number of Production lines
            st:=productionLine[count]; //Get the current production line to single string to check the status with it.

            if st<>'' then begin

             if st[1]='1' then begin   //Check the first character to get the first Production Line



                  //This nested if statements to check the Production status
                  if productionLine[count]='1-Ok' then  begin
                    Form4.comPortTVaComm.WriteText('-sc1 -sg1,1,14,8 -sha2 -f0 -cf0 -r0 -cb2 -t"1" <CR>'+#10+#13);
                    if ProductionLine1CheckBox.Checked then begin  //This if statement is to check if the user enter a notifying message to be shown on the bottom of the display.
                    if ProductionLine1Edit.Text <> '' then        //And also to handle a fixed notify text if the user didn't enter one.
                    notifyText[0]:='1-'+ ProductionLine1Edit.Text
                    end
                    else
                     notifyText[0]:= '';
                  end
                  else if productionLine[count]='1-Warning' then begin
                      scrollOrNot:=scrollOrNot +1;
                      Form4.comPortTVaComm.WriteText('-sc1 -cb3 -r1'+#10+#13);
                      if ProductionLine1CheckBox.Checked then begin  //This if statement is to check if the user enter a notifying message to be shown on the bottom of the display.
                      if ProductionLine1Edit.Text <> '' then        //And also to handle a fixed notify text if the user didn't enter one.
                      notifyText[0]:='1-'+ ProductionLine1Edit.Text
                      else
                      notifyText[0]:=  '1-Warning';
                      end
                      else
                      notifyText[0]:=  '1-Warning';
                  end
                  else if productionLine[count]='1-Fail' then begin
                      scrollOrNot:=scrollOrNot +1;
                      Form4.comPortTVaComm.WriteText('-sc1 -cb1 -r1'+#10+#13);
                      if ProductionLine1CheckBox.Checked then begin   //This if statement is to check if the user enter a notifying message to be shown on the bottom of the display.
                      if ProductionLine1Edit.Text <> '' then         //And also to handle a fixed notify text if the user didn't enter one.
                      notifyText[0]:='1-'+ ProductionLine1Edit.Text
                      else
                      notifyText[0]:=  '1-Fail';
                      end
                      else
                      notifyText[0]:=  '1-Fail';
                  end;
            end

            else if st[1]='2' then begin //Check the first character to get the second Production Line

                  //This nested if statements to check the Production status
                  if productionLine[count]='2-Ok' then begin
                       Form4.comPortTVaComm.WriteText('-sc2 -sg16,1,14,8 -sha2 -f0 -r0 -cf0 -cb2 -t"2" <CR>'+#10+#13);
                      if ProductionLine2CheckBox.Checked then begin   //This if statement is to check if the user enter a notifying message to be shown on the bottom of the display.
                       if ProductionLine2Edit.Text <> '' then        //And also to handle a fixed notify text if the user didn't enter one.
                       notifyText[1]:= '2-'+ProductionLine2Edit.Text
                      end
                      else
                       notifyText[1]:= '';
                  end
                  else if productionLine[count]='2-Warning' then begin
                       scrollOrNot:=scrollOrNot +1;
                       Form4.comPortTVaComm.WriteText('-sc2 -cb3 -r1'+#10+#13);
                       if ProductionLine2CheckBox.Checked then begin   //This if statement is to check if the user enter a notifying message to be shown on the bottom of the display.
                         if ProductionLine2Edit.Text <> '' then       //And also to handle a fixed notify text if the user didn't enter one.
                       notifyText[1]:= '2-'+ProductionLine2Edit.Text
                       else
                         notifyText[1]:=  '2-Warning';
                       end
                       else
                         notifyText[1]:=  '2-Warning';
                  end
                  else if productionLine[count]='2-Fail' then begin
                       scrollOrNot:=scrollOrNot +1;
                       Form4.comPortTVaComm.WriteText('-sc2 -cb1 -r1'+#10+#13);
                       if ProductionLine2CheckBox.Checked then begin     //This if statement is to check if the user enter a notifying message to be shown in the bottom of the display.
                         if ProductionLine2Edit.Text <> '' then         //And also to handle a fixed notify text if the user didn't enter one.
                       notifyText[1]:= '2-'+ProductionLine2Edit.Text
                       else
                         notifyText[1]:=  '2-Fail';
                       end
                       else
                         notifyText[1]:=  '2-Fail';
                  end;
            end

            else if st[1]='3' then begin //Check the first character to get the third Production Line



                  //This nested if statements to check the Production status and it's text.
                  if productionLine[count]='3-Ok' then begin
                     Form4.comPortTVaComm.WriteText('-sc3 -sg32,1,14,8 -sha2 -f0 -cf0 -r0 -cb2 -t"3" <CR>'+#10+#13);
                      if ProductionLine3CheckBox.Checked then begin    //This if statement is to check if the user enter a notifying message to be shown on the bottom of the display.
                      if ProductionLine3Edit.Text <> '' then          //And also to handle a fixed notify text if the user didn't enter one.
                        notifyText[2]:='3-'+ ProductionLine3Edit.Text
                        else
                        notifyText[2]:= '';
                      end
                      else
                        notifyText[2]:= '';
                  end
                  else if productionLine[count]='3-Warning' then begin
                       scrollOrNot:=scrollOrNot +1;
                       Form4.comPortTVaComm.WriteText('-sc3 -cb3 -r1'+#10+#13);
                       if ProductionLine3CheckBox.Checked then begin     //This if statement is to check if the user enter a notifying message to be shown on the bottom of the display.
                        if ProductionLine3Edit.Text <> '' then          //And also to handle a fixed notify text if the user didn't enter one.
                        notifyText[2]:='3-'+ ProductionLine3Edit.Text
                        else
                        notifyText[2]:=  '3-Warning';
                       end
                       else
                        notifyText[2]:=  '3-Warning';
                  end
                  else if productionLine[count]='3-Fail' then begin
                       scrollOrNot:=scrollOrNot +1;
                       Form4.comPortTVaComm.WriteText('-sc3 -cb1 -r1'+#10+#13);
                       if ProductionLine3CheckBox.Checked then begin   //This if statement is to check if the user enter a notifying message to be shown on the bottom of the display.
                         if ProductionLine3Edit.Text <> '' then       //And also to handle a fixed notify text if the user didn't enter one.
                        notifyText[2]:='3-'+ ProductionLine3Edit.Text
                        else
                        notifyText[2]:=  '3-Fail';
                       end
                       else
                         notifyText[2]:=  '3-Fail';
                  end;
            end

            else if st[1]='4' then begin   //Check the first character to get the fourth Production Line



                  //This nested if statements to check the Production status
                  if productionLine[count]='4-Ok' then begin
                       Form4.comPortTVaComm.WriteText('-sc4 -sg48,1,14,8 -sha2 -f0 -cf0 -r0 -cb2 -t"4" <CR>'+#10+#13);
                      if ProductionLine4CheckBox.Checked then begin      //This if statement is to check if the user enter a notifying message to be shown on the bottom of the display.
                      if ProductionLine4Edit.Text <> '' then            //And also to handle a fixed notify text if the user didn't enter one.
                       notifyText[3]:='4-'+ ProductionLine4Edit.Text
                       else
                       notifyText[3]:= '';
                      end
                      else
                       notifyText[3]:= '';
                  end
                  else if productionLine[count]='4-Warning' then begin
                       scrollOrNot:=scrollOrNot +1;
                       Form4.comPortTVaComm.WriteText('-sc4 -cb3 -r1'+#10+#13);
                       if ProductionLine4CheckBox.Checked then begin    //This if statement is to check if the user enter a notifying message to be shown on the bottom of the display.
                        if ProductionLine4Edit.Text <> '' then         //And also to handle a fixed notify text if the user didn't enter one.
                        notifyText[3]:='4-'+ ProductionLine4Edit.Text
                        else
                        notifyText[3]:=  '4-Warning';
                       end
                       else
                        notifyText[3]:=  '4-Warning';
                  end
                  else if productionLine[count]='4-Fail' then begin
                       scrollOrNot:=scrollOrNot +1;
                       Form4.comPortTVaComm.WriteText('-sc4 -cb1 -r1'+#10+#13);
                      if ProductionLine4CheckBox.Checked then begin    //This if statement is to check if the user enter a notifying message to be shown on the bottom of the display.
                       if ProductionLine4Edit.Text <> '' then         //And also to handle a fixed notify text if the user didn't enter one.
                       notifyText[3]:='4-'+ ProductionLine4Edit.Text
                       else
                       notifyText[3]:=  '4-Fail';
                      end
                      else
                       notifyText[3]:=  '4-Fail';
                  end;
            end
            
            else if st[1]='F' then begin  //The Message Here will be shown on the whole display.
               Form4.comPortTVaComm.WriteText('-dac -i100 -sc0 -sg0,0,64,16 -f1 -cf0 -cb1 -r1 -sha2 -sva2 -sls4 -t"FIRE" <CR>' +#10+#13) ;
               fireAlarm:=True;
               break;
            end;

            end;

    end;

      if NOT fireAlarm then begin


            //Here to check how's the data will be shown on the display.
            SendDataWithFlipOrNot();

      end;
end;



procedure TForm2.ManuelCheckBoxClick(Sender: TObject);
begin
if ManuelCheckBox.Checked then  begin
SendButton.Enabled:=True;
Form2.Timer1.Enabled:=False;
ManuelCheckBox.Checked:=True;
ProductionLine1CheckBox.Enabled:=True;
ProductionLine2CheckBox.Enabled:=True;
ProductionLine3CheckBox.Enabled:=True;
ProductionLine4CheckBox.Enabled:=True;
ProductionLine1StatusComboBox.Enabled:=True;
ProductionLine2StatusComboBox.Enabled:=True;
ProductionLine3StatusComboBox.Enabled:=True;
ProductionLine4StatusComboBox.Enabled:=True;
ProductionLine1Edit.Enabled:=True;
ProductionLine2Edit.Enabled:=True;
ProductionLine3Edit.Enabled:=True;
ProductionLine4Edit.Enabled:=True;
productionLine[4]:='';
GetTheCurrentStatusForManuel(); //We call this function to get the current status of the Production Lines and show it in the Manuel Setup.

end
else begin

SendButton.Enabled:=False;
ManuelCheckBox.Checked:=False;
ProductionLine1CheckBox.Enabled:=False;
ProductionLine2CheckBox.Enabled:=False;
ProductionLine3CheckBox.Enabled:=False;
ProductionLine4CheckBox.Enabled:=False;
ProductionLine1CheckBox.Checked:=False;
ProductionLine2CheckBox.Checked:=False;
ProductionLine3CheckBox.Checked:=False;
ProductionLine4CheckBox.Checked:=False;
ProductionLine1StatusComboBox.Enabled:=False;
ProductionLine2StatusComboBox.Enabled:=False;
ProductionLine3StatusComboBox.Enabled:=False;
ProductionLine4StatusComboBox.Enabled:=False;
ProductionLine1Edit.Enabled:=False;
ProductionLine2Edit.Enabled:=False;
ProductionLine3Edit.Enabled:=False;
ProductionLine4Edit.Enabled:=False;
Form2.Timer1.Enabled:=True;
productionLine[4]:='';
i:=0;
end;

end;


//Send the Status that selected from the user.
procedure TForm2.SendButtonClick(Sender: TObject);
var j:integer;
begin
    if ProductionLine1CheckBox.Checked then begin
      if ProductionLine1StatusComboBox.ItemIndex=0 then
       productionLine[0]:='1-Ok'
       else if ProductionLine1StatusComboBox.ItemIndex=1 then
       productionLine[0]:='1-Warning'
       else if ProductionLine1StatusComboBox.ItemIndex=2 then
       productionLine[0]:='1-Fail';
       notifyText[0]:=ProductionLine1Edit.Text;
    end;

    if ProductionLine2CheckBox.Checked then begin
      if ProductionLine2StatusComboBox.ItemIndex=0 then
       productionLine[1]:='2-Ok'
       else if ProductionLine2StatusComboBox.ItemIndex=1 then
       productionLine[1]:='2-Warning'
       else if ProductionLine2StatusComboBox.ItemIndex=2 then
       productionLine[1]:='2-Fail';
       notifyText[1]:=ProductionLine2Edit.Text;
    end;

    if ProductionLine3CheckBox.Checked then begin
      if ProductionLine3StatusComboBox.ItemIndex=0 then
       productionLine[2]:='3-Ok'
       else if ProductionLine3StatusComboBox.ItemIndex=1 then
       productionLine[2]:='3-Warning'
       else if ProductionLine3StatusComboBox.ItemIndex=2 then
       productionLine[2]:='3-Fail';
       notifyText[2]:=ProductionLine3Edit.Text;
    end;

    if ProductionLine4CheckBox.Checked then begin
      if ProductionLine4StatusComboBox.ItemIndex=0 then
       productionLine[3]:='4-Ok'
       else if ProductionLine4StatusComboBox.ItemIndex=1 then
       productionLine[3]:='4-Warning'
       else if ProductionLine4StatusComboBox.ItemIndex=2 then
       productionLine[3]:='4-Fail';
       notifyText[3]:=ProductionLine4Edit.Text;
    end;


    GetProductionLineStatus();

end;


procedure TForm2.CloseButtonClick(Sender: TObject);
begin
 Timer1.Enabled:=False;
 Form2.Hide();
end;


//Reterive the current Status for the production Lines to the Manuel Setup.
function Tform2.GetTheCurrentStatusForManuel():string;
var count:integer;st:string;
begin
 for count := 0 to length(productionLine) DO begin
       st:=productionLine[count];
       if st='' then
            break;
      if st[1]='1' then begin
       ProductionLine1Edit.Text:=NotifyText[0];
        if st[3]='O' then
             ProductionLine1StatusComboBox.ItemIndex:=0
        else if st[3]='W' then
             ProductionLine1StatusComboBox.ItemIndex:=1
        else if st[3]='F' then
             ProductionLine1StatusComboBox.ItemIndex:=2
      end
      else if st[1]='2' then begin
       ProductionLine2Edit.Text:=NotifyText[1];
        if st[3]='O' then
             ProductionLine2StatusComboBox.ItemIndex:=0
        else if st[3]='W' then
             ProductionLine2StatusComboBox.ItemIndex:=1
        else if st[3]='F' then
             ProductionLine2StatusComboBox.ItemIndex:=2
      end
      else if st[1]='3' then begin
       ProductionLine3Edit.Text:=NotifyText[2];
        if st[3]='O' then
             ProductionLine3StatusComboBox.ItemIndex:=0
        else if st[3]='W' then
             ProductionLine3StatusComboBox.ItemIndex:=1
        else if st[3]='F' then
             ProductionLine3StatusComboBox.ItemIndex:=2
      end
      else if st[1]='4' then begin
       ProductionLine4Edit.Text:=NotifyText[3];
        if st[3]='O' then
             ProductionLine4StatusComboBox.ItemIndex:=0
        else if st[3]='W' then
             ProductionLine4StatusComboBox.ItemIndex:=1
        else if st[3]='F' then
             ProductionLine4StatusComboBox.ItemIndex:=2
      end;
 end;
end;


//Check the data for each Production Line to set a Color for it's Text if the text exists.
//And make a flip-flop for the text area if there are more than one Production Line need a text.
function TForm2.SendDataWithFlipOrNot():string;
var count:integer;j:integer;  sentOrNot:boolean;
begin

  for count := 0 to length(ProductionLine)-1 do begin

     if ProductionLine[count]<>'' then begin

           //Check the Status of the Production Line to give it a specific Color.
             if ProductionLine[count]='1-Ok' then begin
             //Send the Data and Wipe every thing before it to prepare it to be scrolled Up
            Form4.comPortTVaComm.WriteText('-sc0 -dc -clr -sc8 -dc -clr -sc7 -dc -clr -sc6 -dc -clr -sc5 -sg0,16,64,8 -sha2 -cf2 -cb0 -sls1 -f0 -t"'+ notifyText[0]+'" -nss0' +#10+#13);

            Form4.comPortTVaComm.WaitChar(100); //Wait until the data is sent.
                                                //before sending the next command to prevent any Error or Load on the Buffer and the Port.

            //This for is for changing the Y-Position of the Data to be Scrolled Up.
            for j := 0 to 7 do   begin
             Form4.comPortTVaComm.WriteText('-sc5 -sg0,'+(16-j).ToString+',64,8'+#10+#13);

            end;

          end
          else if ProductionLine[count]='1-Warning' then begin
              Form4.comPortTVaComm.WriteText('-sc0 -dc -clr -sc8 -dc -clr -sc7 -dc -clr -sc6 -dc -clr -sc5 -sg0,16,64,8 -sha2 -cf3 -cb0 -sls1 -f0 -t"'+ notifyText[0]+'" -nss0' +#10+#13);
              Form4.comPortTVaComm.WaitChar(100);
           for j := 0 to 7 do   begin
              Form4.comPortTVaComm.WriteText('-sc5 -sg0,'+(16-j).ToString+',64,8'+#10+#13);
            
            end;
            
          end
    
          else  if ProductionLine[count]='1-Fail' then begin
              Form4.comPortTVaComm.WriteText('-sc0 -dc -clr -sc8 -dc -clr -sc7 -dc -clr -sc6 -dc -clr -sc5 -sg0,16,64,8 -sha2 -cf1 -cb0 -sls1 -f0 -t"'+ notifyText[0]+'" -nss0' +#10+#13);
              Form4.comPortTVaComm.WaitChar(100);
            for j := 0 to 7 do   begin
              Form4.comPortTVaComm.WriteText('-sc5 -sg0,'+(16-j).ToString+',64,8'+#10+#13);

            end;
            
          end;



            Form4.comPortTVaComm.WaitChar(100);
           if ProductionLine[count]='2-Ok' then begin
              Form4.comPortTVaComm.WriteText('-sc0 -dc -clr -sc7 -dc -clr -sc8 -dc -clr -sc5 -dc -clr -sc6 -sg0,16,64,8 -sha2 -cf2 -cb0 -sls1 -f0 -t"'+ notifyText[1]+'" -nss0' +#10+#13);
              Form4.comPortTVaComm.WaitChar(100);
            for j := 0 to 7 do   begin
              Form4.comPortTVaComm.WriteText('-sc6 -sg0,'+ (16-j).ToString+',64,8' +#10+#13);

            end;

          end
           else if ProductionLine[count]='2-Warning' then begin
              Form4.comPortTVaComm.WriteText('-sc0 -dc -clr -sc7 -dc -clr -sc8 -dc -clr -sc5 -dc -clr -sc6 -sg0,16,64,8 -sha2 -cf3 -cb0 -sls1 -f0 -t"'+ notifyText[1]+'" -nss0' +#10+#13);
              Form4.comPortTVaComm.WaitChar(100);
            for j := 0 to 7 do   begin
              Form4.comPortTVaComm.WriteText('-sc6 -sg0,'+ (16-j).ToString+',64,8' +#10+#13);

            end;

          end
          else  if ProductionLine[count]='2-Fail' then begin
             Form4.comPortTVaComm.WriteText('-sc0 -dc -clr -sc7 -dc -clr -sc8 -dc -clr -sc5 -dc -clr -sc6 -sg0,16,64,8 -sha2 -cf1 -cb0 -sls1 -f0 -t"'+ notifyText[1]+'" -nss0' +#10+#13);
             Form4.comPortTVaComm.WaitChar(100);
            for j := 0 to 7 do   begin
             Form4.comPortTVaComm.WriteText('-sc6 -sg0,'+ (16-j).ToString+',64,8' +#10+#13);
            end;

          end;

           Form4.comPortTVaComm.WaitChar(100);
            if ProductionLine[count]='3-Ok' then begin
               Form4.comPortTVaComm.WriteText('-sc0 -dc -clr -sc5 -dc -clr -sc6 -dc -clr -sc8 -dc -clr -sc7 -sg0,16,64,8 -sha2 -cf2 -cb0 -sls1 -f0 -t"'+ notifyText[2]+'" -nss0' +#10+#13);
               Form4.comPortTVaComm.WaitChar(100);
            for j := 0 to 7 do   begin
             Form4.comPortTVaComm.WriteText('-sc7 -sg0,'+ (16-j).ToString+',64,8' +#10+#13);

            end;

          end
            else if ProductionLine[count]='3-Warning' then begin
               Form4.comPortTVaComm.WriteText('-sc0 -dc -clr -sc5 -dc -clr -sc6 -dc -clr -sc8 -dc -clr -sc7 -sg0,16,64,8 -sha2 -cf3 -cb0 -sls1 -f0 -t"'+ notifyText[2]+'" -nss0' +#10+#13);
               Form4.comPortTVaComm.WaitChar(100);
            for j := 0 to 7 do   begin
               Form4.comPortTVaComm.WriteText('-sc7 -sg0,'+ (16-j).ToString+',64,8' +#10+#13);

            end;

          end
          else  if ProductionLine[count]='3-Fail' then begin
               Form4.comPortTVaComm.WriteText('-sc0 -dc -clr -sc5 -dc -clr-sc6 -dc -clr-sc8 -dc -clr -sc7 -sg0,16,64,8 -sha2 -cf1 -cb0 -sls1 -f0 -t"'+ notifyText[2]+'" -nss0' +#10+#13);
               Form4.comPortTVaComm.WaitChar(100);
            for j := 0 to 7 do   begin
             Form4.comPortTVaComm.WriteText('-sc7 -sg0,'+ (16-j).ToString+',64,8' +#10+#13);

            end;

          end;

          Form4.comPortTVaComm.WaitChar(100);
           if ProductionLine[count]='4-Ok' then begin
                Form4.comPortTVaComm.WriteText('-sc0 -dc -clr -sc5 -dc -clr -sc6 -dc -clr -sc7 -dc -clr -sc8 -sg0,16,64,8 -sha2 -cf2 -cb0 -sls1 -f0 -t"'+ notifyText[3]+'" -nss0' +#10+#13);
                Form4.comPortTVaComm.WaitChar(100);
            for j := 0 to 7 do   begin
                Form4.comPortTVaComm.WriteText('-sc8 -sg0,'+ (16-j).ToString+',64,8 ' +#10+#13);

            end;
          end
            else if ProductionLine[count]='4-Warning' then begin
                Form4.comPortTVaComm.WriteText('-sc0 -dc -clr -sc5 -dc -clr -sc6 -dc -clr -sc7 -dc -clr -sc8 -sg0,16,64,8 -sha2 -cf3 -cb0 -sls1 -f0 -t"'+ notifyText[3]+'" -nss0' +#10+#13);
                Form4.comPortTVaComm.WaitChar(100);
            for j := 0 to 7 do   begin
                Form4.comPortTVaComm.WriteText('-sc8 -sg0,'+ (16-j).ToString+',64,8 ' +#10+#13);

            end;
          end
          else  if ProductionLine[count]='4-Fail' then begin
               Form4.comPortTVaComm.WriteText('-sc0 -dc -clr -sc5 -dc -clr -sc6 -dc -clr -sc7 -dc -clr -sc8 -sg0,16,64,8 -sha2 -cf1 -cb0 -sls1 -f0 -t"'+ notifyText[3]+'" -nss0' +#10+#13);
               Form4.comPortTVaComm.WaitChar(100);
            for j := 0 to 7 do   begin
               Form4.comPortTVaComm.WriteText('-sc8 -sg0,'+ (16-j).ToString+',64,8 ' +#10+#13);
            end;

          end;

       Sleep(2000);
     end;

  end;




end;


end.
