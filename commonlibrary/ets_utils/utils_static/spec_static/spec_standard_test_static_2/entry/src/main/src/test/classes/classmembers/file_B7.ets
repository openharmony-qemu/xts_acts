'use static'
import { A } from './file_A7.ets'

class B extends A {
  constructor(p: number) {
    super(p + 1)
  }

  get foo(): number {
    return super.fld
  }
}

export B;
