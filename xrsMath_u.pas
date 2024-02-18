unit xrsMath_u;

interface

// UNITS
uses

System.Variants;

// CONST
// RESOURCESTING

// PROCEDURES
 function VarToIntDef(const V: Variant; const ADefault: Integer = 0): Integer;

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

end.