program CadServicosFarm;

uses
  Vcl.Forms,
  UntDM in 'UntDM.pas' {DM: TDataModule},
  UntServicosFarm in 'UntServicosFarm.pas' {FmCadServicosFarm},
  UntClasses in 'UntClasses.pas',
  UntServicosFarmTiposDAO in 'UntServicosFarmTiposDAO.pas',
  UntServicosFarmDAO in 'UntServicosFarmDAO.pas',
  UntTiposAtencaoFarmDAO in 'UntTiposAtencaoFarmDAO.pas',
  UntServicosFarmController in 'UntServicosFarmController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFmCadServicosFarm, FmCadServicosFarm);
  Application.Run;
end.
