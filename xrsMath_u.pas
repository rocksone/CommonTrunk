unit xrsMath_u;

interface

// UNITS
uses
  Winapi.Windows,
System.Variants,
System.SysUtils,
Vcl.Graphics;

// CONST
// RESOURCESTING

// FUNKTIONS
 function VarToIntDef(const V: Variant; const ADefault: Integer = 0): Integer;
 function BlackWhiteContrastColor(value: TColor):TColor;

// Time
 function Int2Time(i: Integer;  Positiv: Boolean = True; ShowZero: Boolean = False): String;
// PROCEDURES

implementation

// uses
// rsResourcestring_u;

function VarToIntDef(const V: Variant; const ADefault: Integer = 0): Integer;
//
// convert Var to int
begin
  if V = NULL then
    Result := ADefault
  else
    Result := V;
end;

function BlackWhiteContrastColor(value: TColor):TColor;
var
  intensity : Integer;
begin
  value := ColorToRGB(value);

  intensity := GetBValue(value) * 21 // Blue
    + GetGValue(value) * 174 // Green
    + GetRValue(value) * 61; // Red
   // intensity = 0 -> dark
   // intensity = 255*256 -> bright
  if intensity >= (128*256) then
    Result := clBlack
  else
    Result := clWhite;
end;



function Int2Time(i: Integer;  Positiv: Boolean = True; ShowZero: Boolean = False): String;
var
  Stunden, RestMinuten, Hours : integer;
begin
  Hours := VarToIntDef(i);
  if (Hours = 0) and not ShowZero then
    Result := ''
  else
  begin

    Stunden := Hours div 60;
    RestMinuten := Hours mod 60;

    if not Positiv Then
      Result := Format('%.2d:%.2d', [Stunden, abs(RestMinuten)])
    else
    begin
      if Hours > 0 then

        Result := Format('+%.2d:%.2d', [Stunden, abs(RestMinuten)])
      else
        Result := Format('%.2d:%.2d', [Stunden, abs(RestMinuten)]);
    end;
  end;

end;


end.