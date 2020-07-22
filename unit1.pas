unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, sqlite3conn, FileUtil, Forms, Controls,
  Graphics, Dialogs, DBGrids, StdCtrls, DbCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DataSource1: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SQLite3Connection1: TSQLite3Connection;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure podklbasa;
    procedure kolvopr;
  private

  public

  end;

var
  Form1: TForm1;
  k,i: integer;
  s:String;
implementation
 uses Unit2, Unit3, Unit5, Unit4, Unit6;           //подключение разных модулей
{$R *.lfm}

{ TForm1 }

 Procedure TForm1.podklbasa;  //podkl k base
   begin

     try
      Form1.SQLite3Connection1.DatabaseName := 'C:\Users\Администратор\Desktop\Test2_bd\test_bd.db'; // указывает
     except
     ShowMessage('Ошибка подключения к базе!');
     end;
     //путь к базе
  Form1.SQLite3Connection1.CharSet := 'UTF8'; // указываем рабочую кодировку
  Form1.SQLite3Connection1.Transaction := SQLTransaction1; // указываем менеджер транзакций
  try  // пробуем подключится к базе
   Form1.SQLite3Connection1.Connected:=True;
    Form1.SQLite3Connection1.Open;
    Form1.SQLTransaction1.Active := True;
  except   // если не удалось то выводим сообщение о ошибке
    ShowMessage('Ошибка подключения к базе!');
  end;
   end;

 Procedure TForm1.kolvopr;
 begin
   Form1.SQLQuery1.Close;
 Form1.SQLQuery1.SQL.Clear;
 Form1.SQLQuery1.SQL.Append('SELECT id FROM  Voprosi;');
 Form1.SQLQuery1.Active:=True;
 Unit5.k:= SQLQuery1.RecordCount;
 Label2.Caption:=IntToStr(Unit5.k);
 Form1.SQLQuery1.Close;
 Form1.SQLQuery1.SQL.Clear;
 end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   Form1.podklbasa;
   Form1.kolvopr;


end;

procedure TForm1.Button1Click(Sender: TObject);    //изменить и создать вопросы
begin
 //Form1.close;
  Form2.show;
end;

procedure TForm1.Button2Click(Sender: TObject); //начать тест
begin
  if Unit5.k>100 then ShowMessage(' Лимит количества вопросов ');
  if Unit5.k>0 then Form6.show else ShowMessage(' В тесте нет вопросов ');
end;

procedure TForm1.Button3Click(Sender: TObject);  //выход из программы
begin
  Form1.Close;   //выход из программы
end;

procedure TForm1.Button4Click(Sender: TObject); // подключение к БД
begin

end;

end.

