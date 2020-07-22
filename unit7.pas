unit Unit7;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm7 }

  TForm7 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form7: TForm7;

implementation
uses Unit1, Unit6, Unit5;
{$R *.lfm}

{ TForm7 }

procedure TForm7.FormCreate(Sender: TObject);
begin
  Label2.Caption:=Unit6.z;
  Label3.Caption:=Unit6.t;
  Label5.Caption:=FloatToStr(Unit5.z);
  Label7.Caption:=Unit5.x;

end;

procedure TForm7.Button2Click(Sender: TObject);
begin
    Form7.close;
  Form1.show;
end;

procedure TForm7.Button1Click(Sender: TObject);
begin
    Form7.close;
  Form6.show;
end;

end.

