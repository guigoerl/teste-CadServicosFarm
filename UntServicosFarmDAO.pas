unit UntServicosFarmDAO;

interface

uses UntClasses, UntDM, UntServicosFarmTiposDAO, DB, System.SysUtils, FireDAC.Comp.Client;


type
  TServicosFarmDAO = class

  private
  public
    class function inserir(aServicos:TServicosFarm):boolean;
    class function excluir(aServicos:TServicosFarm):boolean;
    class function alteracao(aServicos:TServicosFarm):boolean;
    class function consulta(aFiltro:String;aTipoConsulta:TTipoConsulta):TServicosFarm;
  end;


implementation


{ TServicosFarmDAO }

class function TServicosFarmDAO.alteracao(aServicos: TServicosFarm): boolean;
var fQry: TFDQuery;
    lID:Integer;
begin
  try
    fQry := TFDQuery.Create(nil);
    fQry.Connection := DM.FDConnDB;

    fQry.SQL.Clear;
    fQry.SQL.Add('update desenv.servicos_farm set ');
    fQry.SQL.Add('    OBSERVACOES = :OBSERVACOES, ');
    fQry.SQL.Add('    DATA_HORA = :DATA_HORA, ');
    fQry.SQL.Add('    NOME_FARMACEUTICO = :NOME_FARMACEUTICO, ');
    fQry.SQL.Add('    NOME_PACIENTE = :NOME_PACIENTE, ');
    fQry.SQL.Add('    VALOR_TOTAL_SERVICOS = :VALOR_TOTAL');
    fQry.SQL.Add('where ID_SERVICOS_FARM = :ID_SERVICOS_FARM ');

    fQry.ParamByName('ID_SERVICOS_FARM').AsInteger  := aServicos.idServicosFarm;
    fQry.ParamByName('OBSERVACOES').AsString        := aServicos.observacoes;
    fQry.ParamByName('DATA_HORA').AsDatetime        := aServicos.dataHora;
    fQry.ParamByName('NOME_FARMACEUTICO').AsString  := aServicos.nomeFarmaceutico;
    fQry.ParamByName('NOME_PACIENTE').AsString      := aServicos.nomePaciente;
    fQry.ParamByName('VALOR_TOTAL').AsCurrency      := aServicos.valorTotalSevicos;

    try
      fQry.Prepare;
      fQry.ExecSql();
      TServicosFarmTiposDAO.excluir(aServicos.idServicosFarm);
      TServicosFarmTiposDAO.inserirLista(aServicos.idServicosFarm,aServicos.listaServicos);
      Result := True;
    except
      Result := False;
    end;

  finally
    fQry.Free;
  end;
end;

class function TServicosFarmDAO.consulta(aFiltro: String;
  aTipoConsulta: TTipoConsulta): TServicosFarm;
var fQry: TFDQuery;
    lID:Integer;
begin
  try
    fQry := TFDQuery.Create(nil);
    fQry.Connection := DM.FDConnDB;
    Result := TServicosFarm.Create;

    fQry.SQL.Clear;
    fQry.SQL.Add('SELECT * FROM servicos_farm ');
    fQry.SQL.Add('WHERE 1 = 1 ');

    if aTipoConsulta = tcPaciente then
    begin
      fQry.SQL.Add('and NOME_PACIENTE = :Param ');
      fQry.ParamByName('Param').AsString := aFiltro;
    end
    else if aTipoConsulta = tcFarmaceutico then
    begin
      fQry.SQL.Add('and NOME_FARMACEUTICO = :Param ');
      fQry.ParamByName('Param').AsString := aFiltro;
    end
    else if aTipoConsulta = tcData then
    begin
      fQry.SQL.Add('and DATA_HORA = :Param ');
      fQry.ParamByName('Param').AsDateTime := StrToDateTime(aFiltro);
    end;

    fQry.SQL.Add('order by ID_SERVICOS_FARM desc');

    try
      fQry.Prepare;
      fQry.Open();
      fQry.First;

      if not fQry.IsEmpty then
      begin
        Result.idServicosFarm   := fQry.FieldByName('ID_SERVICOS_FARM').AsInteger;
        Result.observacoes      := fQry.FieldByName('OBSERVACOES').AsString;
        Result.dataHora         := fQry.FieldByName('DATA_HORA').AsDateTime;
        Result.nomeFarmaceutico := fQry.FieldByName('NOME_FARMACEUTICO').AsString;
        Result.nomePaciente     := fQry.FieldByName('NOME_PACIENTE').AsString;
        Result.valorTotalSevicos:= fQry.FieldByName('VALOR_TOTAL_SERVICOS').AsCurrency;
        Result.listaServicos    := TServicosFarmTiposDAO.Consulta(Result.idServicosFarm);
      end;
    except
    end;

  finally
    fQry.Free;
  end;
end;

class function TServicosFarmDAO.excluir(aServicos: TServicosFarm): boolean;
var fQry: TFDQuery;
begin
  try
    fQry := TFDQuery.Create(nil);
    fQry.Connection := DM.FDConnDB;

    fQry.SQL.Clear;
    fQry.SQL.Add('delete from desenv.servicos_farm ');
    fQry.SQL.Add('where ID_SERVICOS_FARM = :ID_SERVICOS_FARM');

    fQry.ParamByName('ID_SERVICOS_FARM').AsInteger := aServicos.idServicosFarm;
    try
      fQry.Prepare;
      fQry.ExecSql();
      Result := True;
    except
      Result := False;
    end;

  finally
    fQry.Free;
  end;
end;

class function TServicosFarmDAO.inserir(aServicos: TServicosFarm): boolean;
var fQry: TFDQuery;
    lID:Integer;
begin
  try
    fQry := TFDQuery.Create(nil);
    fQry.Connection := DM.FDConnDB;

    fQry.SQL.Clear;
    fQry.SQL.Add('insert into desenv.servicos_farm (OBSERVACOES, DATA_HORA, NOME_FARMACEUTICO, NOME_PACIENTE, VALOR_TOTAL_SERVICOS) ');
    fQry.SQL.Add('values (:OBSERVACOES, :DATA_HORA, :NOME_FARMACEUTICO, :NOME_PACIENTE, :VALOR_TOTAL); ');
    fQry.SQL.Add(' SELECT Max(ID_SERVICOS_FARM) as ID_SERVICOS_FARM from desenv.servicos_farm; ');


    fQry.ParamByName('OBSERVACOES').AsString        := aServicos.observacoes;
    fQry.ParamByName('DATA_HORA').AsDatetime        := aServicos.dataHora;
    fQry.ParamByName('NOME_FARMACEUTICO').AsString  := aServicos.nomeFarmaceutico;
    fQry.ParamByName('NOME_PACIENTE').AsString      := aServicos.nomePaciente;
    fQry.ParamByName('VALOR_TOTAL').AsCurrency      := aServicos.valorTotalSevicos;

    try
      fQry.Prepare;
      fQry.Open();
      lID := fQry.FieldByName('ID_SERVICOS_FARM').AsInteger;
      TServicosFarmTiposDAO.inserirLista(lID,aServicos.listaServicos);
      Result := True;
    except
      Result := False;
    end;

  finally
    fQry.Free;
  end;
end;

end.
