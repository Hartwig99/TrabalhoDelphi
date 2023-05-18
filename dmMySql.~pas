unit dmMySql;

interface

uses
  SysUtils, Classes, Provider, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZConnection, DBClient;

type
  Todm_MySql = class(TDataModule)
    con1: TZConnection;
    zqry1: TZQuery;
    dtstprvdr1: TDataSetProvider;
    ds1: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  odm_MySql: Todm_MySql;

  function ExecuteSQL(vsSQL: string; const ClientDataSet: TClientDataSet = nil): Boolean;

   procedure Commit;
   procedure RollBack;
   procedure Start;

implementation
    function ExecuteSQL(vsSQL: string; const ClientDataSet : TClientDataSet = nil): Boolean;
    begin
      Result := False;
      if not odm_MySql.con1.Connected then
       Exit;
      try
        odm_MySql.zqry1.Close;
        odm_MySql.zqry1.SQL.Clear;
        odm_MySql.zqry1.SQL.Add(vsSQL);
        if(Pos('SELECT' , Trim(UpperCase(vsSQL))) in [1,2])then
        begin
          odm_MySql.zqry1.Open;
          if ClientDataSet <> nil then
          begin
            ClientDataSet.Close;
            ClientDataSet.SetProvider(odm_MySql.dtstprvdr1);
            ClientDataSet.Open;
          end;
         end else
         odm_MySql.zqry1.ExecSQL;
         Result := True;
         except
           on E : Exception do
           begin
             E.Message := ' (ExecuteSQL): ' + E.Message + #13#10 + vsSQL;
              raise;
             end;
           end;
        end;

    procedure  Commit;
    begin
      If odm_MySql.con1.InTransaction then
      odm_MySql.con1.Commit;
    end;
    procedure   RollBack;
    begin
      if odm_MySql.con1.InTransaction then
      odm_MySql.con1.Rollback;
    end;
    procedure Start;
    begin
      if  not odm_MySql.con1.InTransaction then
      odm_MySql.con1.StartTransaction;
    end;

{$R *.dfm}

end.
