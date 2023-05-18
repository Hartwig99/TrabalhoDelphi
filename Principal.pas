unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, Grids, DBGrids;

type
  TForm1 = class(TForm)
    btn_Gravar: TButton;
    edt_Codigo: TEdit;
    lbl1: TLabel;
    edt_AlunoNome: TEdit;
    lbl2: TLabel;
    btn_Consultar: TButton;
    btn_Alterar: TButton;
    ClientDataSet1: TClientDataSet;
    dbgrdGrid: TDBGrid;
    lbl3: TLabel;
    btn1: TButton;
    procedure btn_GravarClick(Sender: TObject);
    procedure btn_ConsultarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    procedure p_salvar;
    function f_ConsultaAluno(codigo : string): Boolean;
    procedure  setDadosnaTela;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

   uses
  dmMySql;
{$R *.dfm}

procedure TForm1.p_salvar;
var
  vsSQL: string;
begin
  try

   Start;
   vsSQL := 'INSERT INTO aluno(AlunoID,AlunoNome) VALUES ( '+
   edt_Codigo.Text + ',"' + edt_AlunoNome.Text +'")';
   ExecuteSQL(vsSQl);
   Commit;
    except
         on E : Exception do
           begin
             E.Message := ' (ExecuteSQL): ' + E.Message + #13#10 + vsSQL;
              raise;
             end;

    end;
end;

procedure TForm1.btn_GravarClick(Sender: TObject);
begin
 p_salvar;
 ShowMessage('Dados Salvo com sucesso');
end;

function TForm1.f_ConsultaAluno(codigo: string): Boolean;
var
  SQL : string;
begin
  Result := False;
  if(codigo <> '') then
  begin
    SQL := 'SELECT * FROM aluno WHERE AlunoID ='+ codigo;
    ExecuteSQL(SQL, ClientDataSet1);
    if not ClientDataSet1.IsEmpty then
      begin
      setDadosnaTela;
      Result := True;
      
      end;
  end;
end;

procedure TForm1.btn_ConsultarClick(Sender: TObject);
begin
//codigo consultar
   if not (f_ConsultaAluno(edt_Codigo.Text))then
    begin
      ShowMessage('Cadastro nao encontrado');
      edt_Codigo.SetFocus;
    end;
    ShowMessage('Dados Consultados Com Sucesso');
end;
procedure TForm1.setDadosnaTela;
begin
   edt_AlunoNome.Text := ClientDataSet1.FieldByName('AlunoNome').AsString;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
     odm_MySql:= Todm_MySql.Create(Self);
     odm_MySql.con1.Connected := True;
end;

procedure TForm1.btn_AlterarClick(Sender: TObject);
var
  vsSQl: string;
begin
  // codigo alterar
  try
    Start;
   vsSQl := 'UPDATE aluno SET AlunoNome="'+ edt_AlunoNome.Text + '" WHERE AlunoId = '+ edt_Codigo.Text;

   ExecuteSQL(vsSQl);
   Commit;
   except
       on E : Exception do
           begin
             E.Message := ' (ExecuteSQL): ' + E.Message + #13#10 + vsSQL;
              raise;
             end;
   end;
   ShowMessage('Dados Alterado com sucesso');
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
 edt_Codigo.Clear;
 edt_AlunoNome.Clear;
end;

end.
