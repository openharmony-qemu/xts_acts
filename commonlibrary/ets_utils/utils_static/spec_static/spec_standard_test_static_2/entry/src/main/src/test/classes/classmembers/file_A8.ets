'use static';
class A {
  private _fld: number;

  protected get fld(): number{
    return this._fld;
  }

  constructor(p: number) {
    this._fld = p + 1
  }
}

export A;