unit Unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, Forms, Controls, Graphics, Dialogs,
  StdCtrls, DBGrids;

type

  { TForm4 }

  TForm4 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form4: TForm4;

implementation
 uses Unit3, Unit1, Unit2;
{$R *.lfm}

 { TForm4 }

 procedure TForm4.Button2Click(Sender: TObject); // переход на форму изменения и удаления вопросов
 begin
  Form4.close;
   Form3.show;
 end;

procedure TForm4.FormCreate(Sender: TObject);  //очистка всех полей для записи
begin
 Edit1.text:=' ';
 Edit2.text:=' ';
 Edit3.text:=' ';
 Edit4.text:=' ';
end;

procedure TForm4.Button1Click(Sender: TObject);    // добавление вопроса
var a:String;
begin
 try
 //vopros
Form1.SQLQuery1.Close;
Form1.SQLQuery1.SQL.Clear;
Form1.SQLQuery1.SQL.Add('insert into Voprosi(Vopros) values(:p1);');
Form1.SQLQuery1.Params.Items[0].asstring:=edit1.text;
  Form1.SQLQuery1.ExecSQL;
  Form1.SQLTransaction1.Commit;

 //1 variant
 if RadioButton1.Checked = True then a:='1' else a:='0';
 Form1.SQLQuery1.Close;
 Form1.SQLQuery1.SQL.Clear;
Form1.SQLQuery1.SQL.Add('INSERT INTO Otveti (№Voprosa, №Otveta, Otvet, Pravilnii) values((Select id From Voprosi Where Vopros = :p1), 1, :p2, :p3) ;');
Form1.SQLQuery1.Params.Items[0].asstring:=edit1.text;
Form1.SQLQuery1.Params.Items[1].asstring:=edit2.text;
Form1.SQLQuery1.Params.Items[2].asstring:=a;
  Form1.SQLQuery1.ExecSQL;
  Form1.SQLTransaction1.Commit;

  //2 variant
   if RadioButton2.Checked = True then a:='1' else a:='0';
   Form1.SQLQuery1.Close;
   Form1.SQLQuery1.SQL.Clear;
Form1.SQLQuery1.SQL.Add('INSERT INTO Otveti (№Voprosa, №Otveta, Otvet, Pravilnii) values((Select id From Voprosi Where Vopros = :p1), 2, :p2, :p3) ;');
Form1.SQLQuery1.Params.Items[0].asstring:=edit1.text;
Form1.SQLQuery1.Params.Items[1].asstring:=edit3.text;
Form1.SQLQuery1.Params.Items[2].asstring:=a;
  Form1.SQLQuery1.ExecSQL;
  Form1.SQLTransaction1.Commit;

  //3 variant
  if RadioButton3.Checked = True then a:='1' else a:='0';
   Form1.SQLQuery1.Close;
   Form1.SQLQuery1.SQL.Clear;
Form1.SQLQuery1.SQL.Add('INSERT INTO Otveti (№Voprosa, №Otveta, Otvet, Pravilnii) values((Select id From Voprosi Where Vopros = :p1), 3, :p2, :p3) ;');
Form1.SQLQuery1.Params.Items[0].asstring:=edit1.text;
Form1.SQLQuery1.Params.Items[1].asstring:=edit4.text;
Form1.SQLQuery1.Params.Items[2].asstring:=a;
  Form1.SQLQuery1.ExecSQL;
  Form1.SQLTransaction1.Commit;

  ShowMessage(' Вопрос и варианты ответов записаны');
  Form4.close;
  Form3.show;
 //Edit1.text:=' ';
 //Edit2.text:=' ';
 //Edit3.text:=' ';
 //Edit4.text:=' ';
    except
     ShowMessage(' Вопрос и варианты ответов не записаны');
 end;


  end;


end.

