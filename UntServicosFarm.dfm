object FmCadServicosFarm: TFmCadServicosFarm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'CADASTRO SERVI'#199'OS FARMACEUTICOS'
  ClientHeight = 374
  ClientWidth = 647
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnConsulta: TPanel
    Left = 0
    Top = 0
    Width = 647
    Height = 70
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 30
      Top = 17
      Width = 29
      Height = 13
      Caption = 'Filtro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Button1: TButton
      Left = 551
      Top = 23
      Width = 75
      Height = 25
      Caption = 'Consulta'
      TabOrder = 0
      OnClick = Button1Click
    end
    object EdFiltro: TEdit
      Left = 30
      Top = 33
      Width = 198
      Height = 21
      TabOrder = 1
    end
    object rgTipoConsulta: TRadioGroup
      Left = 234
      Top = 15
      Width = 295
      Height = 39
      Caption = 'Tipo Consulta'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Paciente'
        'Farmaceutico'
        'Data')
      TabOrder = 2
    end
  end
  object PnBotoes: TPanel
    Left = 0
    Top = 325
    Width = 647
    Height = 49
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 304
    object Button2: TButton
      Left = 174
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Incluir'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 253
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 1
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 334
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 2
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 413
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Limpar'
      TabOrder = 3
      OnClick = Button5Click
    end
  end
  object PnCadastro: TPanel
    Left = 0
    Top = 70
    Width = 647
    Height = 255
    Align = alClient
    TabOrder = 2
    ExplicitTop = 64
    object Label2: TLabel
      Left = 38
      Top = 25
      Width = 73
      Height = 13
      Caption = 'Observa'#231#245'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 38
      Top = 65
      Width = 66
      Height = 13
      Caption = 'Data / Hora'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 38
      Top = 146
      Width = 49
      Height = 13
      Caption = 'Paciente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 38
      Top = 105
      Width = 77
      Height = 13
      Caption = 'Farmaceutico'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 38
      Top = 189
      Width = 80
      Height = 13
      Caption = 'Total Servi'#231'os'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 358
      Top = 25
      Width = 54
      Height = 13
      Caption = 'Servi'#231'os :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdObservacoes: TEdit
      Left = 38
      Top = 41
      Width = 275
      Height = 21
      TabOrder = 0
    end
    object EdFarma: TEdit
      Left = 38
      Top = 121
      Width = 275
      Height = 21
      TabOrder = 2
    end
    object EdPaciente: TEdit
      Left = 38
      Top = 164
      Width = 275
      Height = 21
      TabOrder = 3
    end
    object EdTotal: TEdit
      Left = 38
      Top = 207
      Width = 275
      Height = 21
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 5
    end
    object ListVServicos: TListView
      Left = 358
      Top = 41
      Width = 257
      Height = 187
      Checkboxes = True
      Columns = <>
      ReadOnly = True
      TabOrder = 4
      ViewStyle = vsSmallIcon
      OnItemChecked = ListVServicosItemChecked
    end
    object edData: TDateTimePicker
      Left = 38
      Top = 80
      Width = 186
      Height = 21
      Date = 44164.829962812500000000
      Time = 44164.829962812500000000
      TabOrder = 1
    end
  end
end
