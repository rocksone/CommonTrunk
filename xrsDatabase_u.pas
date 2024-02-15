unit xrsDatabase_u;

interface

// UNITS
uses
  System.SysUtils,
  Data.DB,
  FireDAC.Comp.Client,
  Vcl.Dialogs,
  Vcl.Controls,
  System.UITypes;

// CONST
// RESOURCESTING

// PROCEDURES
function newGuid(): Tguid;
function clsGuid(): Tguid;
procedure DoSaveQuery(queryname: TFDquery; CloseQuery: Boolean = True);
procedure DoSaveQueryAsk(queryname: TFDquery; CloseQuery: Boolean = True);
procedure DoDBEdit(queryname: TFDquery);
function isDBClosed(queryname: TFDquery): Boolean;
function isDBEditMode(queryname: TFDquery):boolean;
implementation

uses
  xrsResourcestring_u;

//
// GENERATE GUID
function newGuid(): Tguid;
begin
  result := Tguid.NewGuid;
end;

function clsGuid(): Tguid;
begin
  result := Tguid.Empty;
end;

function isDBEditMode(queryname: TFDquery):boolean;
begin
result := False;
  if  (queryname.state in [dsedit, dsinsert]) then
    result := True;
end;


procedure DoDBEdit(queryname: TFDquery);
begin
  if not (queryname.state in [dsedit, dsinsert]) then
    queryname.Edit;
end;

procedure DoSaveQuery(queryname: TFDquery; CloseQuery: Boolean = True);
begin
  if (queryname.state in [dsedit, dsinsert]) then
    queryname.post;
    if CloseQuery then
  queryname.Close;
end;

procedure DoSaveQueryAsk(queryname: TFDquery; CloseQuery: Boolean = True);
begin
  if (queryname.state in [dsedit, dsinsert]) then
  begin
    if MessageDlg(rsSaveData, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      queryname.post;
        if CloseQuery then
    queryname.Cancel;
  end;
end;

function isDBClosed(queryname: TFDquery): Boolean;
begin
result := False;
if queryname.Active = False then

result := True;
end;

end.
