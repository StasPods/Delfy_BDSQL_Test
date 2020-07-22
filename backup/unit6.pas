unit Unit6;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm6 }

  TForm6 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form6: TForm6;
  i,k:integer;
  z, t:String;
implementation
uses Unit1, Unit5, Unit7;           //подключение разных модулей
{$R *.lfm}

{ TForm6 }

procedure TForm6.Button1Click(Sender: TObject);
begin
     z:=Edit1.Text;
    t:=Edit2.Text;
  if (Edit1.Text=' ') and (Edit2.Text=' ') then ShowMessage('Вы не ввели Имя или Фамилию') else  begin

//  Form6.close;
    Form7.show;
  end;
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
   Edit1.text:=' ';
 Edit2.text:=' ';
end;

end.

