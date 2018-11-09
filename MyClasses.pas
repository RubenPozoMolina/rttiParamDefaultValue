unit MyClasses;

interface

type
  IDefaultValue = Interface
    ['{230C86BD-5BD0-464C-9AF2-AB38A8D11F6A}']
    function Concat: string;
  end;

  TDefaultValue = class(TInterfacedObject, IDefaultValue)
  private
    fFirst: string;
    fSecond: string;
    fThird: string;
  public
    constructor Create(pFirst: string = 'first' ; pSecond: string = 'second' ; pThird: string = 'third');
    function Concat: string;
  end;

implementation

{ TDefaultValue }

function TDefaultValue.Concat: string;
begin
  Result := fFirst + ' ' + fSecond + ' ' + fThird;
end;

constructor TDefaultValue.Create(pFirst: string; pSecond: string; pThird: string);
begin
  fFirst := pFirst;
  fSecond := pSecond;
  fThird := pThird;
end;

end.
