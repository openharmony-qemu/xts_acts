import { A } from './file_A8.ets'

class B1 extends A {
  constructor(p: number) {
    super(p + 1)
  }

  get foo(): number {
    return super.fld
  }
}

export B1;
