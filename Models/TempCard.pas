unit TempCard;

interface

  uses SysUtils, DateUtils, chekSum;



type

  TTempCard = class
    const
      DRIVER_BIT_NUM = 0;
      ADMIN_BIT_NUM  = 1;
      MECH_BIT_NUM   = 2;
      PNR_BIT_NUM    = 3;



    private
      FCardCode    : Cardinal;
      FOperatorID  : Cardinal;
      FRole        : Byte;
      FSpeed       : Byte;
      FIGNTime     : Word;
      FWorkTime    : Word;


      function FormatWithLeadingZeros(Number: Cardinal; NumDigits: Integer): String;
    public



       //Card code
       procedure setCardCode(_cardCode : Cardinal); overload;
       function  setCardCode(id: String) : boolean; overload;
       function  getCardCode(): Cardinal;
       function  getCardCodeStr():String;



       // Operator id
       function  getOperatorID() : Cardinal;
       procedure setOperatorID(id : Cardinal);          overload;
       function  setOperatorID(id : String) : boolean;  overload;
       // Speed
       procedure setSpeed(_speed : Byte);
       function getSpeed : Byte;
       // IGN TIME
       procedure setIGNTime(IGNMin : word);
       function getIGNTime(): word;
       // Work time
       procedure setWorkTime(workMin : word);
       function getWorkTime(): Word;

       procedure ParseData(const Data: TArray<Byte>);
       function ToData: TArray<Byte>;
       function BuildCard() : TArray<byte>;


       // ROLE
       procedure setAdmin(role: boolean);
       procedure setDriver(role: boolean);
       procedure setMechan(role:boolean);
       procedure setPNR(role:boolean);

       function getIsAdmin() : boolean;
       function getIsDriver() : boolean;
       function getIsMechan() : boolean;
       function getIsPNR() : boolean;



       function TempCardVerification(tempCardRow : TArray<Byte>) : boolean;


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

function SetBit(var Value: Byte; BitPosition: Integer): Byte;
begin
  // Проверяем, что позиция бита находится в пределах 0-7
  if (BitPosition < 0) or (BitPosition > 7) then
    raise Exception.Create('Bit position must be between 0 and 7.');

  // Устанавливаем бит с помощью операции OR
  Result := Value or (1 shl BitPosition);
end;

function ResetBit(var Value: Byte; BitPosition: Integer): Byte;
begin
  // Проверяем, что позиция бита находится в пределах 0-7
  if (BitPosition < 0) or (BitPosition > 7) then
    raise Exception.Create('Bit position must be between 0 and 7.');

  // Сбрасываем бит с помощью операции AND и инверсии маски
  Result := Value and not (1 shl BitPosition);
end;


//procedure SetBit(var SetWord: Byte; BitNum: Byte);
//begin
//  SetWord := SetWord or BitNum; { Устанавливаем бит }
//end;
//
//procedure resetBit(var SetWord: Byte ; BitNum: Byte);
//begin
//  SetWord := SetWord or BitNum; { Устанавливаем бит }
//  SetWord := SetWord xor BitNum; { Переключаем бит   }
//end;

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
  result := GetBit(FRole, ADMIN_BIT_NUM);
end;

function TTempCard.getIsDriver: boolean;
begin
  result := GetBit(FRole, DRIVER_BIT_NUM);
end;

function TTempCard.getIsMechan: boolean;
begin
  result := GetBit(FRole, MECH_BIT_NUM);
end;

function TTempCard.getIsPNR: boolean;
begin
  result := GetBit(FRole, PNR_BIT_NUM);
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

function TTempCard.ToData: TArray<Byte>;
var
  Data: TArray<Byte>;
begin
  // Устанавливаем размер массива данных
  SetLength(Data, 14);

  // Копируем данные из полей класса в массив
  Move(FCardCode,   Data[00], SizeOf(FCardCode));
  Move(FOperatorID, Data[04], SizeOf(FOperatorID));
  Move(FRole,       Data[08], SizeOf(FRole));
  Move(FSpeed,      Data[09], SizeOf(FSpeed));
  Move(FIGNTime,    Data[10], SizeOf(FIGNTime));
  Move(FWorkTime,   Data[12], SizeOf(FWorkTime));

  Result := Data; // Возвращаем массив данных
end;

procedure TTempCard.setCardCode(_cardCode: Cardinal);
begin
  FCardCode := _cardCode;
end;


procedure TTempCard.setAdmin(role: boolean);
begin
 if role then
    FRole := SetBit(FRole, ADMIN_BIT_NUM) // Присваиваем результат обратно в FRole
  else
    FRole := resetBit(FRole, ADMIN_BIT_NUM); // Присваиваем результат обратно в FRole
end;

procedure TTempCard.setDriver(role: boolean);
begin
 if role then
    FRole := SetBit(FRole, DRIVER_BIT_NUM) // Присваиваем результат обратно в FRole
  else
    FRole := resetBit(FRole, DRIVER_BIT_NUM); // Присваиваем результат обратно в FRole
end;

procedure TTempCard.setMechan(role: boolean);
begin
  if role then
    FRole := SetBit(FRole, MECH_BIT_NUM) // Присваиваем результат обратно в FRole
  else
    FRole := resetBit(FRole, MECH_BIT_NUM); // Присваиваем результат обратно в FRole
end;

procedure TTempCard.setPNR(role: boolean);
begin
  if role then
    FRole := SetBit(FRole, PNR_BIT_NUM) // Присваиваем результат обратно в FRole
  else
    FRole := resetBit(FRole, PNR_BIT_NUM); // Присваиваем результат обратно в FRole
end;

procedure TTempCard.setIGNTime(IGNMin: word);
begin
  FIGNTime := IGNMin * 60; // Save to seconds
end;

procedure TTempCard.setWorkTime(workMin: word);
begin
  FWorkTime := workMin * 60; // Save to seconds
end;

function TTempCard.setOperatorID(id: String) : boolean;
begin
  if TryStrToInt(id, Integer(FOperatorID))
  then result := true  // Если преобразование прошло успешно, устанавливаем значение
  else result := false;
end;

function TTempCard.setCardCode(id: String) : boolean;
begin
  if TryStrToInt(id, Integer(FCardCode))
  then result := true  // Если преобразование прошло успешно, устанавливаем значение
  else result := false;
end;

procedure TTempCard.setOperatorID(id: Cardinal);
begin
  FOperatorID := id;
end;

procedure TTempCard.setSpeed(_speed: Byte);
begin
  FSpeed := _speed;
end;



//
function TTempCard.TempCardVerification(tempCardRow: TArray<Byte>): boolean;
var
  LengthSame: Boolean;
  TempCardDataRow:TArray<byte>;

begin
  // Сравниваем длины массивов
  TempCardDataRow := BuildCard;
  LengthSame := Length(TempCardDataRow) = Length(tempCardRow);

  // Если длины не равны, возвращаем false
  if not LengthSame then
    Exit(False);

  // Сравниваем содержимое массивов
  Result := CompareMem(@TempCardDataRow[0], @tempCardRow[0], Length(TempCardDataRow));
end;

// Build row data card + crc
function TTempCard.BuildCard: TArray<byte>;
var
  Data: TArray<Byte>;
  ChecksumCalc : Word;
begin
  Data := ToData;
  SetLength(Data, 16);

  ChecksumCalc := CalculateCRC16(Data, 14);

  // Записываем контрольную сумму в массив
  Data[14] := Lo(ChecksumCalc); // Младший байт
  Data[15] := Hi(ChecksumCalc); // Старший байт


  result := Data;
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
