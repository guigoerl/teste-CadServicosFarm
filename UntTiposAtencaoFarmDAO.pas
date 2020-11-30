unit UntTiposAtencaoFarmDAO;

interface

uses UntClasses, UntDM, DB, System.SysUtils,System.Generics.Collections, FireDAC.Comp.Client;

type
  TTiposAtencaoFarmDAO = class

  private
  public
    class function consulta:TObjectList<TTipoServicoFarm>;
  end;


implementation

{ TTiposAtencaoFarmDAO }

class function TTiposAtencaoFarmDAO.consulta: TObjectList<TTipoServicoFarm>;
var fQry: TFDQuery;
    lTipoServicoFarm : TTipoServicoFarm;
begin
  try
    fQry := TFDQuery.Create(nil);
    fQry.Connection := DM.FDConnDB;
    Result := TObjectList<TTipoServicoFarm>.Create;

    fQry.SQL.Clear;
    fQry.SQL.Add('SELECT * FROM tipos_atencao_farm ');

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

end.
