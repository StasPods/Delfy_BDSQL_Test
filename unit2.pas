unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation
 uses Unit1, Unit3;
{$R *.lfm}

{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);  // запись пароля
begin
  if (edit1.Text='admin') then
  begin
  Form2.Close;
  Form3.show;
  end
  else  begin
    showmessage('неправильный пароль');
    Edit1.text:=' ';
    end;
end;

procedure TForm2.Button2Click(Sender: TObject);  // переход на главную форму
begin
  Form2.Close;
    Form1.show;
end;

end.

