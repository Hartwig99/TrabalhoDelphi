object odm_MySql: Todm_MySql
  OldCreateOrder = False
  Left = 846
  Top = 269
  Height = 250
  Width = 520
  object con1: TZConnection
    Protocol = 'mysql-4.1'
    HostName = 'localhost'
    Port = 3307
    Database = 'prova'
    User = 'root'
    Password = 'server'
    Connected = True
    Left = 96
    Top = 32
  end
  object zqry1: TZQuery
    Connection = con1
    Params = <>
    Left = 96
    Top = 88
  end
  object dtstprvdr1: TDataSetProvider
    DataSet = zqry1
    Left = 96
    Top = 144
  end
  object ds1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 88
  end
end
