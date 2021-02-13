unit LOGIN;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Panel2: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Image1: TImage;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses DM, PRINCIPAL;

procedure TForm1.Button1Click(Sender: TObject);
   var  PRINCIPAL:Tform2;
begin
    PRINCIPAL:=Tform2.Create(Application);
      try
         DM.DM1.FDQ_OPERADOR.SQL.Clear;
         DM.DM1.FDQ_OPERADOR.SQL.Add('SELECT  * FROM OPERADOR');
         DM.DM1.FDQ_OPERADOR.SQL.Add('WHERE USUARIO = '+quotedstr(EDIT1.Text));
         DM.DM1.FDQ_OPERADOR.SQL.Add('AND CONTRA1 ='+quotedstr(EDIT2.Text));
         DM.DM1.FDQ_OPERADOR.Active:=true;
         if DM.DM1.FDQ_OPERADOR.RecordCount=1 then
             BEGIN
                      PRINCIPAL.ShowModal;
             END
             ELSE
                     SHOWMESSAGE('USUARIO O CONTRASE�A INCORRECTO');
      finally
           PRINCIPAL.Free;
      end;
  end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 APPLICATION.Terminate;
end;

end.