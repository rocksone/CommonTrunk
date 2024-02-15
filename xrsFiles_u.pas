//-----------------------------------------------------------------------------
// 
//-----------------------------------------------------------------------------
unit xrsFiles_u;

interface

uses
  Winapi.ShellAPI,
  Winapi.ShlObj,
  Winapi.ActiveX,
  Winapi.Messages,
  Winapi.Windows,
  Winapi.WinSock,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Types,
  System.DateUtils,
  System.Math,
  System.UITypes,
  Data.DB,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Graphics,
  Vcl.Controls,
  IdHashMessageDigest,
  System.AnsiStrings;
  
  const
  MAX_PATH = 260;
{$EXTERNALSYM MAX_PATH}

resourcestring
  rs_DirectoryName = 'Das Verzeichnis %s kann nicht erstellt werden!';
  rs_FileName = 'Die Datei %s oder kann nicht erstellt werden!';


  procedure CheckCreatedir(DirectoryName: string);
  function GetApplicationDirectory(PathDelimter: Boolean = True): string;
  function GetSpecialFolderPath(Folder: Integer; CanCreate: Boolean): string;
  
implementation
  
procedure CheckCreatedir(DirectoryName: string);
// - CHECK OF EXIST OR CREATE DIRECTORY
begin
  if not DirectoryExists(DirectoryName) then
    if not ForceDirectories(DirectoryName) then
      raise Exception.Create(format(rs_DirectoryName, [DirectoryName]));
end;

function GetApplicationDirectory(PathDelimter: Boolean = True): string;
// -DIRECTORIO DE LA APLICACION [x]
begin
  if PathDelimter then
    Result := ExtractFileDir(Application.ExeName) + PathDelim
  else
    Result := ExtractFileDir(Application.ExeName) ;
end;

function GetSpecialFolderPath(Folder: Integer; CanCreate: Boolean): string;
 // CSIDL_APPDATA          | Eigene Einstellungen 	    | C:\Users\<user>\AppData\Roaming 	Nur Benutzer <user> 	Versteckt, geeignet für Konfiguration
 // CSIDL_PERSONAL         | Eigene Dokumente 	        | C:\Users\<user>\Documents 	Nur Benutzer <user> 	Sichtbarvar
 // CSIDL_COMMON_APPDATA   | Öffentliche Einstellungen  | C:\ProgramData 	Alle Benutzer 	Versteckt, geeignet für Konfiguration  FilePath: array [0 .. 255] of char;
 // CSIDL_COMMON_DOCUMENTS | Öffentliche Dokumente 	    | C:\Users\Public\Documents 	Alle Benutzer 	Sichtbar  // FilePath: array [0..MAX_PATH] of char;
var
  FilePath: array [0 .. 255] of char;
  // FilePath: array [0..MAX_PATH] of char;
begin
  SHGetSpecialFolderPath(0, @FilePath[0], Folder, CanCreate);
  Result := FilePath;
end;
end.