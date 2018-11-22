unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    btnClose: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure keypad;
    procedure Edit1Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Panel1Enter(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure Clic(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  keyleft:integer; //left value of panels
  keytop:integer;  //top value of panels
  keypads:array[0..15] of TButton;
  keypanel:TPanel;
  clicked:String; //name of object clicked on
  
implementation

{$R *.dfm}
//Procedure for Numpad
procedure TForm1.keypad;
var

i     :integer;
size  :integer;
space :integer;
begin
  size:=30; //size of buttons
  space:=5; //spacing between buttons
 //Set Keypanel Properties
  keypanel.Show;
  keypanel.Height:=10+(size+space)*5-space;
  keypanel.Width :=10+(size+space)*3-space;

  keypanel.BringToFront;
  //keypanel.Left  :=keyleft+5;
  //keypanel.Top   :=keytop+30;
  if keypanel.Left<>keyleft+5 then //ANIMATE!!
  begin
    while keypanel.Left>keyleft+5  do keypanel.Left:=keypanel.Left-1;
    while keypanel.Left<keyleft+5 do keypanel.Left:=keypanel.Left+1
  end;
  if keypanel.Top<>keytop+30 then //ANIMATE!!
  begin
    while keypanel.Top>keytop+30  do keypanel.Top:=keypanel.Top-1;
    while keypanel.Top<keytop+30  do keypanel.Top:=keypanel.Top+1
  end;
  // create 12 buttons
  i:=1;
  while i<16 do
  begin

    //Create 12 buttons
    keypads[i]:=TButton.Create(Self);
    keypads[i].parent:=keypanel;
    keypads[i].Left:=5+(size+space)*((i-1) mod 3);
    keypads[i].Top:=5+(size+space)*((i-1) div 3);
    keypads[i].Height:=size;
    keypads[i].Width:=size;
    keypads[i].SendToBack;
    keypads[i].Tag:=i;
    keypads[i].OnClick := Clic;

    Panel1.Caption:=IntToStr(i);

    keypads[i].Caption:= IntToStr(i);//+' row='+IntToStr(row);
    //keypads[i].OnClick:= clicked;

    i:=i+1;   //add 1 to i
  end;

  //Key Actions
  keypads[10].Caption:='-';
  keypads[11].Caption:='0';
  keypads[12].Caption:='.';
  keypads[13].Caption:='X';
  keypads[14].Caption:='<-';
  keypads[15].Caption:='go';


end;

procedure TForm1.Edit1Click(Sender: TObject);
begin
keyleft:=Edit1.Left;
keytop:=Edit1.Top;
clicked:='Edit1';
keypad;
end;

procedure TForm1.Edit2Click(Sender: TObject);
begin
keyleft:=Edit2.Left;
keytop:=Edit2.Top;
clicked:='Edit2';
keypad;
end;

procedure TForm1.Panel1Enter(Sender: TObject);
begin
 //Create panel for keys
  keypanel:=TPanel.Create(Self);
  keypanel.parent := panel1;
  keypanel.Color:=clRed;
  keypanel.BevelWidth:=3;
  keypanel.Hide;
  Edit1.Text:='';
  Edit2.Text:='';
end;
procedure TForm1.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Clic(Sender: TObject);
var
i:integer;
a:string;
begin
i:= TShape(Sender).Tag;
if clicked ='Edit1' then

  if keypads[i].Caption='-' then
  else

    if keypads[i].Caption='X' then
      keypanel.Hide
    else
      if keypads[i].Caption='<-' then

      begin
        a:=edit1.Text;
      // length(a):=length(a-1);
      edit1.Text := Copy(a,1,length(a)-1);
      end
      else
        if keypads[i].Caption='go' then
        else edit1.Text := edit1.text + keypads[i].caption;
if clicked ='Edit2' then

  if keypads[i].Caption='-' then
  else

    if keypads[i].Caption='X' then
      keypanel.Hide
    else
      if keypads[i].Caption='<-' then

      begin
        a:=edit2.Text;
      // length(a):=length(a-1);
      edit2.Text := Copy(a,1,length(a)-1);
      end
      else
        if keypads[i].Caption='go' then
        else edit2.Text := edit2.text + keypads[i].caption;
end;

end.
