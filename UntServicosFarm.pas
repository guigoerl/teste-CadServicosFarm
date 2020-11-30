unit UntServicosFarm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, UntServicosFarmController;

type
  TFmCadServicosFarm = class(TForm)
    PnConsulta: TPanel;
    PnBotoes: TPanel;
    PnCadastro: TPanel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button1: TButton;
    Label1: TLabel;
    EdFiltro: TEdit;
    rgTipoConsulta: TRadioGroup;
    EdObservacoes: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EdFarma: TEdit;
    EdPaciente: TEdit;
    Label6: TLabel;
    EdTotal: TEdit;
    Label7: TLabel;
    ListVServicos: TListView;
    edData: TDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ListVServicosItemChecked(Sender: TObject; Item: TListItem);
  private
    FServicosFarmController : TServicosFarmController;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmCadServicosFarm: TFmCadServicosFarm;

implementation

uses UntClasses;

{$R *.dfm}

procedure TFmCadServicosFarm.Button1Click(Sender: TObject);
begin
  FServicosFarmController.ConsultaServico;
end;

procedure TFmCadServicosFarm.Button2Click(Sender: TObject);
begin
  FServicosFarmController.InserirServico;
end;

procedure TFmCadServicosFarm.Button3Click(Sender: TObject);
begin
  FServicosFarmController.ExcluirServico;
end;

procedure TFmCadServicosFarm.Button4Click(Sender: TObject);
begin
  FServicosFarmController.AlterarServico;
end;

procedure TFmCadServicosFarm.Button5Click(Sender: TObject);
begin
  FServicosFarmController.LimparTela;
end;

procedure TFmCadServicosFarm.FormCreate(Sender: TObject);
begin
  FServicosFarmController := TServicosFarmController.Create;
  FServicosFarmController.LimparTela;
end;

procedure TFmCadServicosFarm.ListVServicosItemChecked(Sender: TObject;
  Item: TListItem);
begin
  FServicosFarmController.CalcularTotal;
end;

end.
