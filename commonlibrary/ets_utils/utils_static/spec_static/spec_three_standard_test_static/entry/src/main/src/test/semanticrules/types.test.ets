'use static'
export class Neg<T extends number> {
  constructor (x: T) {}
}

export class Pos<T extends number> {
  constructor (x: T) {}
}

export abstract class A_1<U, V> {}
export abstract class B1_1<U, V> extends A_1<U, V> {}
export class B2_1<U, V> extends A_1<U, V> {
  b2_v: U | V
  constructor (p: U | V) {
    this.b2_v = p
  }
}
export class C1_1<U, V> extends B1_1<U, V> {
  c1_v: U | V
  constructor (p: U | V) {
    this.c1_v = p
  }
}
export class C2_1<U, V> extends B1_1<U, V> {
  c2_v: U | V
  constructor (p: U | V) {
    this.c2_v = p
  }
}
export class Other_1<T> {
  other_v: T
  constructor (p: T) {
    this.other_v = p
  }
}
