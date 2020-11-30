unit UntServicosFarmController;

interface


uses UntClasses, UntDM, DB, System.SysUtils, FireDAC.Comp.Client,
     System.Generics.Collections, Vcl.ComCtrls, Vcl.Dialogs;

type
  TServicosFarmController = class

  private
    FServico : TServicosFarm;
    FListaServicos : TObjectList<TTipoServicoFarm>;

    procedure ConsultaTiposServicos;
    function ValidarTela:Boolean;
    function RetornaTipoServico(aText:String):TTipoServicoFarm;
  public
    constructor Create;
    destructor Destroy; override;

    procedure LimparTela;
    procedure InserirServico;
    procedure AlterarServico;
    procedure ConsultaServico;
    procedure ExcluirServico;
    procedure CalcularTotal;

  end;


implementation

uses UntServicosFarm, UntServicosFarmDAO, UntTiposAtencaoFarmDAO;

{ TServicosFarmController }

procedure TServicosFarmController.AlterarServico;
begin
  if ValidarTela then
  begin
    TServicosFarmDAO.alteracao(FServico);
    LimparTela;
  end
  else
    ShowMessage('Verifique os Campos !');
end;

procedure TServicosFarmController.CalcularTotal;
var lTiposServicos : TTipoServicoFarm;
    i:Integer;
begin
  with FmCadServicosFarm do
  begin
    EdTotal.Text := '0.00';
    for lTiposServicos in FListaServicos do
    begin
      for i := 0 to ListVServicos.Items.Count-1 do
      begin
        if (ListVServicos.Items[i].Caption = lTiposServicos.descTipoAtencaoFarm) and
            ListVServicos.Items[i].Checked then
          EdTotal.Text := FormatCurr('0.00', strtoCurrdef(EdTotal.Text,0) + lTiposServicos.valorUnitario);
      end;
    end;
  end;
end;

procedure TServicosFarmController.ConsultaServico;
var lTiposServicos : TTipoServicoFarm;
    i:Integer;
begin
  with FmCadServicosFarm do
  begin
    if trim(EdFiltro.Text) <> EmptyStr then
    begin
      FServico := TServicosFarmDAO.consulta(EdFiltro.Text,TTipoConsulta(rgTipoConsulta.ItemIndex));
      if FServico <> nil then
      begin
        EdObservacoes.Text := FServico.observacoes;
        edData.DateTime    := FServico.dataHora;
        EdFarma.Text       := FServico.nomeFarmaceutico;
        EdPaciente.Text    := FServico.nomePaciente;
        EdTotal.Text       := FormatCurr('0,00', FServico.valorTotalSevicos);

        for lTiposServicos in FServico.listaServicos do
        begin
          for i := 0 to ListVServicos.Items.Count-1 do
          begin
            if ListVServicos.Items[i].Caption = lTiposServicos.descTipoAtencaoFarm then
              ListVServicos.Items[i].Checked := True;
          end;
        end;
      end;

      EdFiltro.Clear;
    end
    else
      ShowMessage('Você deve preencher algum valor no campo Filtro!');
  end;
end;

procedure TServicosFarmController.ConsultaTiposServicos;
var lTiposServicos : TTipoServicoFarm;
    Item: TListItem;
begin
  FListaServicos := TTiposAtencaoFarmDAO.consulta;

  FmCadServicosFarm.ListVServicos.Items.Clear;
  for lTiposServicos in FListaServicos do
  begin
    Item := FmCadServicosFarm.ListVServicos.Items.Add;
    Item.Caption := lTiposServicos.descTipoAtencaoFarm;
  end;
end;

constructor TServicosFarmController.Create;
begin
  FServico := TServicosFarm.Create;
  FListaServicos := TObjectList<TTipoServicoFarm>.Create;
end;

destructor TServicosFarmController.Destroy;
begin
  FServico.Free;
  inherited;
end;

procedure TServicosFarmController.ExcluirServico;
begin
  with FmCadServicosFarm do
  begin
    if FServico <> nil then
    begin
      TServicosFarmDAO.excluir(FServico);
      LimparTela;
    end;
  end;
end;

procedure TServicosFarmController.InserirServico;
begin
  if ValidarTela then
  begin
    TServicosFarmDAO.inserir(FServico);
    LimparTela;
  end
  else
    ShowMessage('Verifique os Campos !');

end;

procedure TServicosFarmController.LimparTela;
begin
  with FmCadServicosFarm do
  begin
    EdObservacoes.Clear;
    EdData.DateTime := now;
    EdFarma.Clear;
    EdPaciente.Clear;
    EdTotal.Clear;
    EdFiltro.Clear;
    rgTipoConsulta.ItemIndex := 0;
    ConsultaTiposServicos;
    if Visible then
      EdObservacoes.SetFocus;
  end;
end;

function TServicosFarmController.RetornaTipoServico(
  aText: String): TTipoServicoFarm;
var lTiposServicos : TTipoServicoFarm;
begin
  Result := TTipoServicoFarm.Create;
  for lTiposServicos in FListaServicos do
  begin
    if lTiposServicos.descTipoAtencaoFarm = aText then
    begin
      result := lTiposServicos;
      break;
    end;
  end;

end;

function TServicosFarmController.ValidarTela: Boolean;
var i:Integer;
begin
  with FmCadServicosFarm do
  begin
    FServico.observacoes      := EdObservacoes.text;
    FServico.dataHora         := edData.DateTime;
    FServico.nomeFarmaceutico := EdFarma.Text;
    FServico.nomePaciente     := EdPaciente.Text;
    FServico.valorTotalSevicos:= StrToCurrDef(EdTotal.Text,0);

    for i := 0 to ListVServicos.Items.Count-1 do
    begin
      if ListVServicos.Items[i].Checked then
       FServico.AddServico(RetornaTipoServico(ListVServicos.Items[i].Caption));
    end;

    Result := True;
  end;
end;

end.
