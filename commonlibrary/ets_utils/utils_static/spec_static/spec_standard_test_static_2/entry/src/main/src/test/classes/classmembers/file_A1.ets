'use static';
class A {
  _foo: number

  protected get foo(): number {
    return this._foo
  }

  protected set foo(p: number) {
    this._foo = p
  }
}

export A;