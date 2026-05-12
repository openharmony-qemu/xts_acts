import { A } from './file_A10.ets'

class B extends A {
  foo(p: number): number {
    return super.foo(p) + p
  }
}

export B;
