'use static';
import { A } from './file_A2.ets'

class B extends A {
  get foo(): number {
    return super.foo + 1
  }

  set foo(p: number) {
    super.foo = p + 1
  }
}

export B;