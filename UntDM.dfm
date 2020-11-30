object DM: TDM
  OldCreateOrder = False
  Height = 179
  Width = 324
  object FDConnDB: TFDConnection
    Params.Strings = (
      'Database=desenv'
      'User_Name=root'
      'Password=mysql'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 32
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 216
    Top = 32
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Program Files (x86)\MySQL\MySQL Server 5.7\lib\libmysql.dll'
    Left = 216
    Top = 88
  end
end
