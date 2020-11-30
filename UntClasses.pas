unit UntClasses;

interface

uses System.Generics.Collections;

  type
    TTipoConsulta = (tcPaciente, tcFarmaceutico, tcData);

    TTipoServicoFarm = class
    private
      FidTiposAtencaoFarm: Integer;
      FdescTipoAtencaoFarm: String;
      FvalorUnitario: Currency;
    public
      property idTiposAtencaoFarm : Integer     read FidTiposAtencaoFarm   write FidTiposAtencaoFarm;
      property descTipoAtencaoFarm: String      read FdescTipoAtencaoFarm  write FdescTipoAtencaoFarm;
      property valorUnitario : Currency         read FvalorUnitario        write FvalorUnitario;
    end;

    TServicosFarmTipos = class
    private
      FidTiposAtencaoFarm: Integer;
      FidServicosFarmTipos: Integer;
      FidServicosFarm: Integer;
    public
      property idServicosFarmTipos : Integer   read FidServicosFarmTipos   write FidServicosFarmTipos;
      property idTiposAtencaoFarm: Integer     read FidTiposAtencaoFarm    write FidTiposAtencaoFarm;
      property idServicosFarm : Integer        read FidServicosFarm        write FidServicosFarm;
    end;

    TServicosFarm = class
    private
      Fobservacoes: string;
      FidServicosFarm: Integer;
      FdataHora: TDatetime;
      FnomePaciente: String;
      FnomeFarmaceutico: String;
      FvalorTotalSevicos: Currency;
      FlistaServicos: TObjectList<TTipoServicoFarm>;

    public
      constructor Create;
      destructor Destroy; override;

      procedure AddServico(aServico:TTipoServicoFarm);

      property idServicosFarm  : Integer        read FidServicosFarm       write FidServicosFarm;
      property observacoes : string             read Fobservacoes          write Fobservacoes;
      property dataHora : TDatetime             read FdataHora             write FdataHora;
      property nomeFarmaceutico : String        read FnomeFarmaceutico     write FnomeFarmaceutico;
      property nomePaciente : String            read FnomePaciente         write FnomePaciente;
      property valorTotalSevicos : Currency     read FvalorTotalSevicos    write FvalorTotalSevicos;
      property listaServicos : TObjectList<TTipoServicoFarm> read FlistaServicos write FlistaServicos;
    end;


implementation

procedure TServicosFarm.AddServico(aServico: TTipoServicoFarm);
begin
  FlistaServicos.Add(aServico);
end;

constructor TServicosFarm.Create;
begin
  FlistaServicos := TObjectList<TTipoServicoFarm>.Create;
end;

destructor TServicosFarm.Destroy;
begin
  inherited;
  FlistaServicos.Free;
end;

end.
