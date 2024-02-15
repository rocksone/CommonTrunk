unit xrsSystem_u;

interface

// UNITS
uses
  Winapi.Windows,

  cxGraphics,



  cxImage,
  dxGDIPlusClasses

;


// Data.DB,
// FireDAC.Comp.Client,
// Vcl.Dialogs,
// Vcl.Controls;

// CONST
// RESOURCESTING

// COMPUTER FUNCTIONEN
function GetComputerName: String;

// GRAFIC FUNCTIONEN
procedure rGetImageFromImageList(ImageList: TcxImageList; Component: TcxImage; ImageNr: Integer);

implementation

// uses
// rsResourcestring_u;

//-----------------------------------------------------------------------------
// COMPUTER FUNCTIONEN
//-----------------------------------------------------------------------------

function GetComputerName: String;

var
  ComputerName: array [0 .. MAX_COMPUTERNAME_LENGTH] of Char;
  Size: DWORD;
begin
  Size := MAX_COMPUTERNAME_LENGTH + 1;
  if Winapi.Windows.GetComputerName(ComputerName, Size) then
    result := ComputerName
  else
    result := '';
end;

//-----------------------------------------------------------------------------
// GRAFIC FUNCTIONEN
//-----------------------------------------------------------------------------

procedure rgetImageFromImageList(ImageList: TcxImageList; Component: TcxImage; ImageNr: Integer);
var
  AImage: TdxSmartImage;
begin
  AImage := TdxSmartImage.Create;
  try
    ImageList.GetImage(ImageNr, AImage);
    Component.Picture.Assign(AImage);
  finally
    AImage.Free;
  end;

end;

end.
