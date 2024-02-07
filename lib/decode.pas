unit decode;

interface

  function EncodePassword(const Password, Key: string): string;
  function DecodePassword(const EncodedPassword, Key: string): string;

implementation



//*****************************************************************
function EncodePassword(const Password, Key: string): string;
var
  i: Integer;
  pass : string;
begin
  pass := Password;

  for i := 1 to Length(pass) do
    pass[i] := Chr(Ord(pass[i]) xor Ord(Key[(i-1) mod Length(Key)+1]));

  result:=pass;
end;

function DecodePassword(const EncodedPassword, Key: string): string;
begin
  Result := EncodePassword(EncodedPassword, Key);
end;






end.
