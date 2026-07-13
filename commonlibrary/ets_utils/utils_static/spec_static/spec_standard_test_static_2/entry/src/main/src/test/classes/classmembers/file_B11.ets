'use static'
import { A } from './file_A11.ets'

class B1 extends A {
  foo(p: number): number {
    return super.foo(p) + p
  }
}

export B1;
