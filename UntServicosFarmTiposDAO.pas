unit UntServicosFarmTiposDAO;

interface

uses UntClasses, UntDM, DB, System.SysUtils, FireDAC.Comp.Client,System.Generics.Collections;

type
  TServicosFarmTiposDAO = class

  private
  public
    class function inserirLista(AIdServico:Integer;aTiposServicos:TObjectList<TTipoServicoFarm>):boolean;
    class function inserir(AIdServico:Integer;aTiposServicos:TObjectList<TTipoServicoFarm>):boolean;
    class function excluir(AIdServico:Integer):boolean;
    class function excluirTipoServico(AIdServico:Integer;AIdTipoServico:Integer):boolean;
    class function consulta(AIdServico:Integer):TObjectList<TTipoServicoFarm>;
  end;


implementation

{ TServicosFarmTiposDAO }


class function TServicosFarmTiposDAO.consulta(
  AIdServico: Integer): TObjectList<TTipoServicoFarm>;
var fQry: TFDQuery;
    lTipoServicoFarm : TTipoServicoFarm;
begin
  try
    fQry := TFDQuery.Create(nil);
    fQry.Connection := DM.FDConnDB;
    Result := TObjectList<TTipoServicoFarm>.Create;

    fQry.SQL.Clear;
    fQry.SQL.Add('SELECT TS.ID_TIPOS_ATENCAO_FARM, ');
    fQry.SQL.Add('       TS.DESC_TIPO_ATENCAO_FARM, ');
    fQry.SQL.Add('       TS.VALOR_UNITARIO ');
    fQry.SQL.Add('FROM desenv.servicos_farm_tipos SF ');
    fQry.SQL.Add('INNER JOIN desenv.tipos_atencao_farm TS ON (TS.ID_TIPOS_ATENCAO_FARM = SF.ID_FR_TIPOS_ATENCAO_FARM) ');
    fQry.SQL.Add('where ID_FR_SERVICOS_FARM = :Param ');

    fQry.ParamByName('Param').AsInteger := AIdServico;

    try
      fQry.Prepare;
      fQry.Open();
      fQry.First;
      while not fQry.EOF do
      begin
        lTipoServicoFarm := TTipoServicoFarm.Create;
        lTipoServicoFarm.idTiposAtencaoFarm := fQry.FieldByName('ID_TIPOS_ATENCAO_FARM').AsInteger;
        lTipoServicoFarm.descTipoAtencaoFarm := fQry.FieldByName('DESC_TIPO_ATENCAO_FARM').AsString;
        lTipoServicoFarm.valorUnitario := fQry.FieldByName('VALOR_UNITARIO').AsCurrency;
        Result.Add(lTipoServicoFarm);

        fQry.Next;
      end;
    except
    end;

  finally
    fQry.Free;
  end;

end;

class function TServicosFarmTiposDAO.excluir(AIdServico: Integer): boolean;
var fQry: TFDQuery;
begin
  try
    fQry := TFDQuery.Create(nil);
    fQry.Connection := DM.FDConnDB;

    fQry.SQL.Clear;
    fQry.SQL.Add('delete from  desenv.servicos_farm_tipos ');
    fQry.SQL.Add('where ID_FR_SERVICOS_FARM = :ID_FR_SERVICOS_FARM');

    fQry.ParamByName('ID_FR_SERVICOS_FARM').AsInteger  := AIdServico;

    try
      fQry.Prepare;
      fQry.ExecSQL();
    except
      Result := False;
    end;

  finally
    fQry.Free;
  end;
end;

class function TServicosFarmTiposDAO.excluirTipoServico(AIdServico: Integer;
  AIdTipoServico:Integer): boolean;
begin
  //Excluir apenas 1 item especifico
end;

class function TServicosFarmTiposDAO.inserir(AIdServico: Integer;
  aTiposServicos: TObjectList<TTipoServicoFarm>): boolean;
begin
  //Inserir apenas quem está sem ID
end;

class function TServicosFarmTiposDAO.inserirLista(AIdServico:Integer;aTiposServicos:TObjectList<TTipoServicoFarm>): boolean;
var fQry: TFDQuery;
    aServicosFarmTipos : TTipoServicoFarm;
begin
  try
    fQry := TFDQuery.Create(nil);
    fQry.Connection := DM.FDConnDB;

    fQry.SQL.Clear;
    fQry.SQL.Add('insert into desenv.servicos_farm_tipos (ID_FR_TIPOS_ATENCAO_FARM, ID_FR_SERVICOS_FARM) ');
    fQry.SQL.Add('values (:ID_FR_TIPOS_ATENCAO_FARM, :ID_FR_SERVICOS_FARM)');

    fQry.ParamByName('ID_FR_SERVICOS_FARM').AsInteger  := AIdServico;

    for aServicosFarmTipos in aTiposServicos do
    begin
      fQry.ParamByName('ID_FR_TIPOS_ATENCAO_FARM').AsInteger := aServicosFarmTipos.idTiposAtencaoFarm;
      try
        fQry.Prepare;
        fQry.ExecSQL();
      except
        on E:Exception do
        begin
          Result := False;
          Exit;
        end;
      end;
    end;

    Result := True;

  finally
    fQry.Free;
  end;
end;

end.
