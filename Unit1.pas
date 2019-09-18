unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
//    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  //pos: array [1..100, 1..100] of integer;
  actions, fulled: boolean;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var x, y: integer;
    //pos: TPoint;
begin
  actions:= true;
  while actions do begin
    x:= 200;
    y:= 300;
    SetCursorPos(x, y);
    Application.ProcessMessages;
    {mouse_event(MOUSEEVENTF_LEFTDOWN, x, y, 0, 0);
    mouse_event(MOUSEEVENTF_LEFTUP, x, y, 0, 0);}
    sleep(10000);
    Application.ProcessMessages;
    x:= 500;
    y:= 10;
    SetCursorPos(x, y);
    Application.ProcessMessages;
    sleep(10000);
    Application.ProcessMessages;
    x:= 1000;
    y:= 250;
    SetCursorPos(x, y);
    sleep(10000);
    Application.ProcessMessages;
  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  actions:= false;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if fulled = false then begin
    form1.height:=screen.height;
    form1.width:=screen.width;
    form1.AlphaBlend:=true;
    form1.AlphaBlendValue:= 150;
    form1.formstyle:=fsstayontop;
    fulled:= true;
  end
  else begin
    form1.Height:= 185;
    form1.Width:= 350;
    form1.AlphaBlend:=false;
    fulled:= false;
  end;
end;

{procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
var k: integer;
    mpos: TPoint;
begin
  k:= 0;
  if key=#13 then begin
    inc(k);
    mpos:= Mouse.CursorPos;
    //pos[k,k]:= mpos.X, mpos.Y;
  end;
end;  }

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var pos: TPoint;
begin
  GetCursorPos(pos);
  Label3.Caption:=IntToStr(pos.X);
  Label4.Caption:=IntToStr(pos.Y);
end;

begin
  fulled:= false;
end.
