unit TempCard;

interface

  uses SysUtils, DateUtils;

type

  TTempCard = class
    private
      FCardCode    : Cardinal;
      FOperatorID  : Cardinal;
      FRole        : Byte;
      FSpeed       : Byte;
      FIGNTime     : Word;
      FWorkTime    : Word;

      function FormatWithLeadingZeros(Number: Cardinal; NumDigits: Integer): String;
    public

       TempCardDataRow:TArray<byte>;

       //Card code
       procedure setCardCode(_cardCode : Cardinal);
       function  getCardCode(): Cardinal;
       function  getCardCodeStr():String;

       // Operator id
       function getOperatorID() : Cardinal; 
       // Speed
       procedure setSpeed(_speed : Byte);
       function getSpeed : Byte; 
       // IGN TIME 
       function getIGNTime(): word; 
       // Work time
       function getWorkTime(): Word;

       procedure ParseData(const Data: TArray<Byte>);

       // ROLE
       function getIsAdmin() : boolean;
       function getIsDriver() : boolean;
       function getIsMechan() : boolean;
       function getIsPNR() : boolean;

       function verification(tempCardRow : TArray<Byte>) : boolean;

  end;

implementation

{ TTempCard }

function GetBit(Value: Byte; BitPosition: Integer): Boolean;
begin
  // Проверяем, что позиция бита находится в пределах 0-7
  if (BitPosition < 0) or (BitPosition > 7) then
    raise Exception.Create('Bit position must be between 0 and 7.');

  // Возвращаем true, если бит установлен, иначе false
  Result := (Value and (1 shl BitPosition)) <> 0;
end;

function TTempCard.getCardCode: Cardinal;
begin
  result := FCardCode;
end;

function TTempCard.getCardCodeStr: String;
begin
  result := FormatWithLeadingZeros(FCardCode, 10);
end;

function TTempCard.getIGNTime: word;
begin
  result := FIGNTime;
end;

function TTempCard.getIsAdmin: boolean;
begin
  result := GetBit(FRole, 1);
end;

function TTempCard.getIsDriver: boolean;
begin
  result := GetBit(FRole, 0);
end;

function TTempCard.getIsMechan: boolean;
begin
  result := GetBit(FRole, 2);
end;

function TTempCard.getIsPNR: boolean;
begin
  result := GetBit(FRole, 3);
end;

function TTempCard.getOperatorID: Cardinal;
begin
  result :=  FOperatorID;
end;

function TTempCard.getSpeed: Byte;
begin
  result := FSpeed;
end;

function TTempCard.getWorkTime: Word;
begin
  result := FWorkTime;
end;

procedure TTempCard.ParseData(const Data: TArray<Byte>);
begin
  if Length(Data) < 14 then
    raise Exception.Create('Недостаточно данных для парсинга');

  // Извлекаем данные из массива
  Move(Data[0],  FCardCode,   SizeOf(FCardCode));
  Move(Data[4],  FOperatorID, SizeOf(FOperatorID));
  Move(Data[8],  FRole,       SizeOf(FRole));
  Move(Data[9],  FSpeed,      SizeOf(FSpeed));
  Move(Data[10], FIGNTime,    SizeOf(FIGNTime));
  Move(Data[12], FWorkTime,   SizeOf(FWorkTime));

end;

procedure TTempCard.setCardCode(_cardCode: Cardinal);
begin
  FCardCode := _cardCode;
end;


procedure TTempCard.setSpeed(_speed: Byte);
begin
  FSpeed := _speed;
end;

//
function TTempCard.verification(tempCardRow: TArray<Byte>): boolean;
var
  LengthSame: Boolean;
begin
  // Сравниваем длины массивов
  LengthSame := Length(TempCardDataRow) = Length(tempCardRow);

  // Если длины не равны, возвращаем false
  if not LengthSame then
    Exit(False);

  // Сравниваем содержимое массивов
  Result := CompareMem(@TempCardDataRow[0], @tempCardRow[0], Length(TempCardDataRow));
end;

function TTempCard.FormatWithLeadingZeros(Number: Cardinal; NumDigits: Integer) : String;
var
  Buffer: string;
begin
  // Форматируем число с заданным количеством символов и ведущими нулями
  Buffer := Format('%.0d', [Number]); // Превращаем число в строку без десятичных знаков

  // Добавляем ведущие нули до нужного количества цифр
  while Length(Buffer) < NumDigits do
    Buffer := '0' + Buffer;

  result := Buffer;
end;

end.
