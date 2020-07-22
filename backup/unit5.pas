unit Unit5;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs,
  StdCtrls, DBGrids;

type

  { TForm5 }

  TForm5 = class(TForm)
    Button1: TButton;
    DataSource1: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    SQLQuery1: TSQLQuery;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
  private

  public

  end;

var
  Form5: TForm5;
   a, b, c: Array[1..100] of String;
   d: Array[1..100] of Integer;
   s,x:String;
   k,f,i:integer;
   z:real;
implementation
  uses Unit1, Unit6, Unit7;
{$R *.lfm}

  { TForm5 }

  procedure TForm5.Button1Click(Sender: TObject);  //следующие вопросы
  begin
   RadioButton1.Checked:=False;
   RadioButton2.Checked:=False;
   RadioButton3.Checked:=False;
     f:=f+1;
    if f<=k then begin
    SQLQuery1.Close;

 SQLQuery1.SQL.Clear;

  SQLQuery1.SQL.Append('SELECT substr(Vopros, 0, 20), substr(Otvet, 0, 20)  FROM  Voprosi, Otveti WHERE (Voprosi.id = '+a[f]+') AND (Otveti.№Voprosa = '+a[f]+');');
 SQLQuery1.Active:=True;
 Label1.Caption:= SQLQuery1.Fields.Fields[0].DisplayText;// здесь вопрос
 Label2.Caption:=SQLQuery1.Fields.Fields[1].DisplayText;    // здесь 1 вариант ответа
 SQLQuery1.Next;                                   // переход на следующую строчку
 Label3.Caption:=SQLQuery1.Fields.Fields[1].DisplayText;     // здесь 2 вариант ответа
 SQLQuery1.Next;
 Label4.Caption:=SQLQuery1.Fields.Fields[1].DisplayText;     // здесь 2 вариант ответа
 end
    else begin
          ShowMessage(' Вы закончили тест');
      for i:=1 to k do  //сравнение
 begin
 if c[i]=b[i] then d[i]:=1 else d[i]:=0;
 end;
      for i:=1 to k do  //результаты
 begin
 z:=z+d[i];
 end;
      z:=(z/k)*100;
       ////////////////
        if z>70 then
begin
x:=' у вас оценка 5 ';
end;
if (z>34) and (z<71) then
begin
x:=' у вас оценка 4 ';
end;
if (z>10) and (z<35) then
begin
x:=' у вас оценка 3 ';
end;
if z<10 then
begin
x:=' у вас оценка 2 ';
end;
       ////////////////
          Form5.Close;
          Form7.Show;
    end;



  end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  Form1.kolvopr;
  //запись в массив N вопросов
        Form1.SQLQuery1.Close;
 Form1.SQLQuery1.SQL.Clear;
 Form1.SQLQuery1.SQL.Append('SELECT id FROM  Voprosi;');
 Form1.SQLQuery1.Active:=True;
 s:= Form1.SQLQuery1.Fields.Fields[0].DisplayText;
 k:= Form1.SQLQuery1.RecordCount;
 i:=1;
 while i<=k do begin
      a[i]:=Form1.SQLQuery1.Fields[0].DisplayText;
       i:=i+1;
       Form1.SQLQuery1.Next;
       end;
 Form1.SQLQuery1.Close;
 Form1.SQLQuery1.SQL.Clear;

 //запись правильных ответов в массив
         Form1.SQLQuery1.Close;
 Form1.SQLQuery1.SQL.Clear;
 Form1.SQLQuery1.SQL.Append('SELECT №Otveta FROM  Otveti WHERE Pravilnii=1;');
 Form1.SQLQuery1.Active:=True;
 s:= Form1.SQLQuery1.Fields.Fields[0].DisplayText;
 k:= Form1.SQLQuery1.RecordCount;
 i:=1;
 while i<=k do begin
      b[i]:=Form1.SQLQuery1.Fields[0].DisplayText;
       i:=i+1;
       Form1.SQLQuery1.Next;
       end;
 Form1.SQLQuery1.Close;
 Form1.SQLQuery1.SQL.Clear;
  f:=1;
   //////////////////////
   if f<=k then begin
    SQLQuery1.Close;

 SQLQuery1.SQL.Clear;

  SQLQuery1.SQL.Append('SELECT substr(Vopros, 0, 20), substr(Otvet, 0, 20)  FROM  Voprosi, Otveti WHERE (Voprosi.id = '+a[f]+') AND (Otveti.№Voprosa = '+a[f]+');');
 SQLQuery1.Active:=True;
 Label1.Caption:= SQLQuery1.Fields.Fields[0].DisplayText;// здесь вопрос
 Label2.Caption:=SQLQuery1.Fields.Fields[1].DisplayText;    // здесь 1 вариант ответа
 SQLQuery1.Next;                                   // переход на следующую строчку
 Label3.Caption:=SQLQuery1.Fields.Fields[1].DisplayText;     // здесь 2 вариант ответа
 SQLQuery1.Next;
 Label4.Caption:=SQLQuery1.Fields.Fields[1].DisplayText;     // здесь 2 вариант ответа
 end
    else ShowMessage('voprosov net');


 end;

procedure TForm5.RadioButton1Click(Sender: TObject);
begin
  c[f]:='1';
end;

procedure TForm5.RadioButton2Click(Sender: TObject);
begin
  c[f]:='2';
end;

procedure TForm5.RadioButton3Click(Sender: TObject);
begin
  c[f]:='3'
end;

end.

