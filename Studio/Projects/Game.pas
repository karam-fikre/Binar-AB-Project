unit Game;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask;

type
  TForm3 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      GuessingCount:integer;
  end;

var
  Form3: TForm3;
  Number:integer;
  UserNumber:integer;

implementation

uses OpenPortForm;
{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
if StrToInt(Edit1.Text)>Number then begin

   GuessingCount:=GuessingCount+1;
   Form4.comPortTVaComm.WriteText('-sc0 -t"'+GuessingCount.ToString+'" -sc1 -cf3 -t"Mindre" <CR>'+#10+#13);
end
else if StrToInt(Edit1.Text)<Number then begin

     GuessingCount:=GuessingCount+1;
     Form4.comPortTVaComm.WriteText('-sc0 -t"'+GuessingCount.ToString+'" -sc1 -cf1 -t"H�gre" <CR>'+#10+#13);
end
else if StrToInt(Edit1.Text)=Number then begin

 Form4.comPortTVaComm.WriteText('-sc3 -sg0,0,64,18 -f2 -sva2 -cf2 -nss16 -t"Grattis! Du vann efter '+ GuessingCount.ToString +' gissningar" <CR>'+#10+#13);
 Button1.Enabled:=False;
 Edit1.Text:='';
end;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
Form4.comPortTVaComm.WriteText('-dac -i100 -sc0 -sg0,0,10,16 -cb3 -f2 -sha2 -sva2 -cf0 -t"0" -sc1 -sg11,0,64,16 -sha2 -sva2 -f2 -cf2 -t"Gissa" <CR>'+#10+#13);
Number:=1 + Random(100);
GuessingCount:=0;
Edit1.Text:='';
Button1.Enabled:=True;
end;

procedure TForm3.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 // #8 is Backspace
 Label2.Caption:='';
  if not (Key in [#8, '0'..'9']) then begin
    Label2.Caption:='endast siffror';
    // Discard the key
    Key := #0;
  end;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
Number:=1 + Random(100);
GuessingCount:=0;
end;


end.
