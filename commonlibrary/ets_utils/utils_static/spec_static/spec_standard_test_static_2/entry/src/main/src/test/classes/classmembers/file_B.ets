'use static';
import { A } from './file_A1.ets'

class B1 extends A {
  get foo(): number {
    return super.foo + 1
  }

  set foo(p: number) {
    super.foo = p + 1
  }
}

export B1;