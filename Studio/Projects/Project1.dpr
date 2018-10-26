program Project1;

uses
  Vcl.Forms,
  Main in 'Main.pas' {Form1},
  OpenPortForm in 'OpenPortForm.pas' {Form4},
  RunTime in 'RunTime.pas' {Form2},
  Game in 'Game.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
