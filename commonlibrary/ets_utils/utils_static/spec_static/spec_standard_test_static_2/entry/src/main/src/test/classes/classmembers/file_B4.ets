'use static';
import { A } from './file_A4.ets'

class B extends A {
  constructor(p: number) {
    super(p + 1)
  }
}

export B;
