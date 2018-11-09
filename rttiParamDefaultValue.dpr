program rttiParamDefaultValue;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.RTTI,
  System.SysUtils,
  MyClasses in 'MyClasses.pas';

function GetObject: TDefaultValue;
var
  context: TRttiContext;
  rttiType :TRttiType;
  instance : TRttiInstanceType;
  value : TValue;
  createMethod: TRttiMethod;
  params: TArray<TRttiParameter>;
begin
  Result := nil;
  context := TRttiContext.Create;
  rttiType:= context.FindType('MyClasses.TDefaultValue');
  if rttiType<>nil then
  begin
    instance := rttiType.AsInstance;
    createMethod := instance.GetMethod('Create');
    params := createMethod.GetParameters;
    value := instance.GetMethod('Create').Invoke(instance.MetaclassType, []);
    Result := value.AsType<TDefaultValue>;
  end;
end;

procedure Main;
var
  defaultValue: TDefaultValue;
begin
  defaultValue := GetObject;
  try
    if defaultValue <> nil then
      Writeln(defaultValue.Concat);
  finally
    defaultValue.Free;
  end;
end;

begin
  try
    Main;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Readln;
end.
