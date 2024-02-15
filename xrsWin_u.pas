unit xrsWin_u;



interface
uses
  Winapi.Messages,
  Winapi.Windows;

procedure ResetWinParams();
implementation

uses
  xGlobalVars_u;

procedure ResetWinParams();
begin
  APP.WIN_Type      := wtNone;
  APP.WIN_EditMode  := WinModeNone;
  APP.WIN_Paramt    := -1;
  APP.WIN_ID        := -1;
  APP.WIN_Guid      := TGUID.Empty;
end;
end.
