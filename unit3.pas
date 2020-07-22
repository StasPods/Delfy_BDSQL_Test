unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, Forms, Controls, Graphics, Dialogs,
  StdCtrls;

type

  { TForm3 }

  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ComboBox1: TComboBox;
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
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure initVopros;
  private

  public

  end;

var
  Form3: TForm3;

implementation
   uses Unit2, Unit1, Unit4;
{$R *.lfm}

   { TForm3 }

   Procedure TForm3.initVopros; // запись ComboBox
   Var i,k:integer;
   s:String;
     begin
        Combobox1.Clear;
       Form1.SQLQuery1.SQL.Clear;
       Form1.SQLQuery1.SQL.Append('select substr(Vopros, 0, 20) from Voprosi');
       Form1.SQLQuery1.Active:=true;
       s:=Form1.SQLQuery1.Fields.Fields[0].DisplayText;
       k:=Form1.SQLQuery1.RecordCount;
       for i:=1 to k do begin
       Combobox1.Items.Append(Form1.SQLQuery1.Fields.Fields[0].DisplayText);
       Form1.SQLQuery1.Next;
       end;
       Form1.SQLQuery1.Active:=false;
       Form1.SQLQuery1.SQL.Clear;
       Form1.SQLQuery1.Close;
     end;

   procedure TForm3.Button3Click(Sender: TObject); //переход на главную форму
   begin
     Form1.show;
   end;

procedure TForm3.Button4Click(Sender: TObject); //изменение вопроса и варианта ответа
var a,b,c: String;
d:String;
begin
  try
 //vopros
Form1.SQLQuery1.Close;
Form1.SQLQuery1.SQL.Clear;
Form1.SQLQuery1.SQL.Add('update Voprosi set Vopros=:p1 where id=(Select id From Voprosi Where Vopros = :p2);');
Form1.SQLQuery1.Params.Items[0].asstring:=edit1.text;
Form1.SQLQuery1.Params.Items[1].asstring:=ComboBox1.Text;
  Form1.SQLQuery1.ExecSQL;
  Form1.SQLTransaction1.Commit;

 //1 variant
   d:='1';
   if RadioButton1.Checked = True then a:='1' else a:='0';
   Form1.SQLQuery1.Close;
 Form1.SQLQuery1.SQL.Clear;
Form1.SQLQuery1.SQL.Add('update Otveti set №Voprosa=(Select id From Voprosi Where Vopros = :p1), №Otveta = :p2, Otvet=:p3, Pravilnii = :p4 WHERE №Voprosa = (Select id From Voprosi Where Vopros = :p1) and №Otveta=:p2;');
Form1.SQLQuery1.Params.Items[0].asstring:=ComboBox1.Text;
Form1.SQLQuery1.Params.Items[1].asstring:=d;
Form1.SQLQuery1.Params.Items[2].asstring:=Edit2.Text;
Form1.SQLQuery1.Params.Items[3].asstring:=a;
  Form1.SQLQuery1.ExecSQL;
  Form1.SQLTransaction1.Commit;



  //2 variant
  d:='2';
  if RadioButton2.Checked = True then b:='1' else b:='0';
   Form1.SQLQuery1.Close;
   Form1.SQLQuery1.SQL.Clear;
  Form1.SQLQuery1.SQL.Add('update Otveti set №Voprosa=(Select id From Voprosi Where Vopros = :p1), №Otveta = :p2, Otvet=:p3, Pravilnii = :p4 WHERE №Voprosa = (Select id From Voprosi Where Vopros = :p1) and №Otveta=:p2;');
  Form1.SQLQuery1.Params.Items[0].asstring:=ComboBox1.Text;
  Form1.SQLQuery1.Params.Items[1].asstring:=d;
  Form1.SQLQuery1.Params.Items[2].asstring:=Edit3.Text;
  Form1.SQLQuery1.Params.Items[3].asstring:=b;
    Form1.SQLQuery1.ExecSQL;
    Form1.SQLTransaction1.Commit;


  //3 variant
  d:='3';
    if RadioButton3.Checked = True then c:='1' else c:='0';
   Form1.SQLQuery1.Close;
   Form1.SQLQuery1.SQL.Clear;
Form1.SQLQuery1.SQL.Add('update Otveti set №Voprosa=(Select id From Voprosi Where Vopros = :p1), №Otveta = :p2, Otvet=:p3, Pravilnii = :p4 WHERE №Voprosa = (Select id From Voprosi Where Vopros = :p1) and №Otveta=:p2;');
Form1.SQLQuery1.Params.Items[0].asstring:=combobox1.text;
Form1.SQLQuery1.Params.Items[1].asstring:=d;
Form1.SQLQuery1.Params.Items[2].asstring:=Edit4.text;
Form1.SQLQuery1.Params.Items[3].asstring:=c;
  Form1.SQLQuery1.ExecSQL;
  Form1.SQLTransaction1.Commit;

  initVopros;
  ShowMessage(' Вопрос и варианты обновлены');
  Edit1.text:=' ';
 Edit2.text:=' ';
 Edit3.text:=' ';
 Edit4.text:=' ';
    except
     ShowMessage('Вопрос и варианты ответов не обновлены');
 end;
end;

procedure TForm3.ComboBox1Change(Sender: TObject);  // вывод вопроса и вариантов ответа
var a, b, c:String;
begin
  //variant
   Edit1.Text:=ComboBox1.Text;
   // 1 variant
   Form1.SQLQuery1.Close;
   Form1.SQLQuery1.SQL.Clear;
          Form1.SQLQuery1.SQL.Clear;
       Form1.SQLQuery1.SQL.Append('select substr(Otvet, 0, 20) from Otveti where №Voprosa = (select id from Voprosi where Vopros = :p1) and №Otveta = 1;');
Form1.SQLQuery1.Params.Items[0].Asstring:=ComboBox1.Text;
       Form1.SQLQuery1.Active:=true;
       Edit2.Text:=Form1.SQLQuery1.Fields.Fields[0].DisplayText;

      Form1.SQLQuery1.Close;
   Form1.SQLQuery1.SQL.Clear;
          Form1.SQLQuery1.SQL.Clear;
       Form1.SQLQuery1.SQL.Append('select Pravilnii from Otveti where №Voprosa = (select id from Voprosi where Vopros = :p1) and №Otveta = 1;');
Form1.SQLQuery1.Params.Items[0].asstring:=ComboBox1.Text;
       Form1.SQLQuery1.Active:=true;
       a:=Form1.SQLQuery1.Fields.Fields[0].DisplayText;

       if a='1' then RadioButton1.Checked:=True;

   // 2 variant
    Form1.SQLQuery1.Close;
   Form1.SQLQuery1.SQL.Clear;
          Form1.SQLQuery1.SQL.Clear;
       Form1.SQLQuery1.SQL.Append('select substr(Otvet, 0, 20) from Otveti where №Voprosa = (select id from Voprosi where Vopros = :p1) and №Otveta = 2;');
Form1.SQLQuery1.Params.Items[0].Asstring:=ComboBox1.Text;
       Form1.SQLQuery1.Active:=true;
       Edit3.Text:=Form1.SQLQuery1.Fields.Fields[0].DisplayText;

            Form1.SQLQuery1.Close;
   Form1.SQLQuery1.SQL.Clear;
          Form1.SQLQuery1.SQL.Clear;
       Form1.SQLQuery1.SQL.Append('select Pravilnii from Otveti where №Voprosa = (select id from Voprosi where Vopros = :p1) and №Otveta = 2;');
Form1.SQLQuery1.Params.Items[0].Asstring:=ComboBox1.Text;
       Form1.SQLQuery1.Active:=true;
       b:=Form1.SQLQuery1.Fields.Fields[0].DisplayText;
       if b='1' then RadioButton2.Checked:=True;

   // 3 variant
    Form1.SQLQuery1.Close;
   Form1.SQLQuery1.SQL.Clear;
          Form1.SQLQuery1.SQL.Clear;
       Form1.SQLQuery1.SQL.Append('select substr(Otvet, 0, 20) from Otveti where №Voprosa = (select id from Voprosi where Vopros = :p1) and №Otveta = 3;');
Form1.SQLQuery1.Params.Items[0].asstring:=ComboBox1.Text;
       Form1.SQLQuery1.Active:=true;
       Edit4.Text:=Form1.SQLQuery1.Fields.Fields[0].DisplayText;

          Form1.SQLQuery1.Close;
   Form1.SQLQuery1.SQL.Clear;
          Form1.SQLQuery1.SQL.Clear;
       Form1.SQLQuery1.SQL.Append('select Pravilnii from Otveti where №Voprosa = (select id from Voprosi where Vopros = :p1) and №Otveta = 3;');
Form1.SQLQuery1.Params.Items[0].asstring:=ComboBox1.Text;
       Form1.SQLQuery1.Active:=true;
       c:=Form1.SQLQuery1.Fields.Fields[0].DisplayText;
       if c='1' then RadioButton3.Checked:=True;

end;

procedure TForm3.FormCreate(Sender: TObject); // включение вопроса
begin
 initVopros;
 Edit1.text:=' ';
 Edit2.text:=' ';
 Edit3.text:=' ';
 Edit4.text:=' ';
end;

procedure TForm3.Button1Click(Sender: TObject);  //переход на форму добавление вопросов
begin
   Form3.close;
   Form4.show;
end;

procedure TForm3.Button2Click(Sender: TObject);  // удалить вопрос
begin
  try
  Form1.SQLQuery1.Close;  // закрываем компонент
   Form1.SQLQuery1.SQL.Clear;
  Form1.SQLQuery1.SQL.Add('delete from Voprosi where id=(Select id From Voprosi Where Vopros = :p1);'); // запрос на удаление данных
  Form1.SQLQuery1.Params.Items[0].asstring:=ComboBox1.text; //указываем требуемый параметр
  Form1.SQLQuery1.ExecSQL; // выполняем запрос
  Form1.SQLTransaction1.Commit; //подтверждаем изменения в базе
  ShowMessage(' Вопрос удален');
  initVopros;
 Edit1.text:=' ';
 Edit2.text:=' ';
 Edit3.text:=' ';
 Edit4.text:=' ';
    except
    ShowMessage(' Вопрос не удален');
  end;
  end;



end.

