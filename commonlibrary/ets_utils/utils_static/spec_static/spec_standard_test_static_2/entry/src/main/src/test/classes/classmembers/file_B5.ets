import { A } from './file_A5.ets'

class B1 extends A {
  constructor(p: number) {
    super(p + 1)
  }
}

export B1;