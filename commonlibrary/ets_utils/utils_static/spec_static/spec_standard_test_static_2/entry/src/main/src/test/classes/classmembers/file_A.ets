class A {
  _foo: number

  get foo(): number {
    return this._foo
  }

  set foo(p: number) {
    this._foo = p
  }
}

export A;
