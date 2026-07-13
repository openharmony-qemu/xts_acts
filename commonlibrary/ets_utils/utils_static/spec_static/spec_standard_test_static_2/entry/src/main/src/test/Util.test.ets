'use static'

export default class Utils{
  static async msSleep(count:int) : Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }

}
export class abrupt_completion_A {
    private _i: int = 42;
    get i(): int {
        if (this._i == 13) { throw new Error() }
        return this._i
    }
    set i(v: int) { this._i = v }
    get_i(): int { return this._i }
}
export class bigint_A {
    bi: bigint = 13n
}
export class class_fields_A {
    n: number; d: double; f: float; l: long; i: int; s: short; b: byte
}
export class class_fields_B {
    private _n: number = 1.0; get n(): number { return this._n }; set n(v: number) { this._n = v }
    private _d: double = 2.0; get d(): double { return this._d }; set d(v: double) { this._d = v }
    private _f: float = 3.0f; get f(): float { return this._f }; set f(v: float) { this._f = v }
    private _l: long = 4; get l(): long { return this._l }; set l(v: long) { this._l = v }
    private _i: int = 5; get i(): int { return this._i }; set i(v: int) { this._i = v }
    private _s: short = 6; get s(): short { return this._s }; set s(v: short) { this._s = v }
    private _b: byte = 7; get b(): byte { return this._b }; set b(v: byte) { this._b = v }
}
export interface I8<T> {}
export interface J<T> {}
export class A17<T> implements I8<T> {}
export class B<T> extends A17<T> implements J<T> {}
export class C<T> {}
