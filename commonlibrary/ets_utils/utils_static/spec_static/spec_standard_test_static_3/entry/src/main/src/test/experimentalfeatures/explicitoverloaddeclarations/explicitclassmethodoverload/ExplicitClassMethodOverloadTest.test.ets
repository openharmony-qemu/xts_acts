import { afterAll, afterEach, beforeAll, beforeEach, describe, it, Level, Size, TestType } from '../../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class A {
  one(n: number): string { return 'one' }
  two(s: string): string { return 'two' }
  overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}

class A1 {
  public one(n: number): string { return 'one' }
  public two(s: string): string { return 'two' }
  public overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}

class A2 {
  protected one(n: number): string { return 'one' }
  protected two(s: string): string { return 'two' }
  protected overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}

class A3 {
  private one(n: number): string { return 'one' }
  private two(s: string): string { return 'two' }
  private overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}

class A4 {
  public one(n: number): string { return 'one' }
  two(s: string): string { return 'two' }
  overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}

class A5 {
  one(n: number): string { return 'one' }
  public two(s: string): string { return 'two' }
  overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}

class A6 {
  public one(n: number): string { return 'one' }
  public two(s: string): string { return 'two' }
  overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}

class A7 {
  public one(n: number): string { return 'one' }
  two(s: string): string { return 'two' }
  public overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}

class A8 {
  one(n: number): string { return 'one' }
  public two(s: string): string { return 'two' }
  public overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}

class A9 {
  one(n: number): string { return 'one' }
  two(s: string): string { return 'two' }
  public overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}

class A10 {
  one(n: number): string { return 'one' }
  two(s: string): string { return 'two' }
  protected overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}

class A11 {
  public one(n: number): string { return 'one' }
  two(s: string): string { return 'two' }
  protected overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}

class A12 {
  one(n: number): string { return 'one' }
  public two(s: string): string { return 'two' }
  protected overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}

class A13 {
  public one(n: number): string { return 'one' }
  public two(s: string): string { return 'two' }
  protected overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}

class A14 {
  protected one(n: number): string { return 'one' }
  two(s: string): string { return 'two' }
  protected overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}

class A15 {
  one(n: number): string { return 'one' }
  protected two(s: string): string { return 'two' }
  protected overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}

class A16 {
  protected one(n: number): string { return 'one' }
  public two(s: string): string { return 'two' }
  protected overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}

class A17 {
  public one(n: number): string { return 'one' }
  protected two(s: string): string { return 'two' }
  protected overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}

class A18 {
  one(n: number): string { return 'one' }
  two(s: string): string { return 'two' }
  private overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}

class A19 {
  public one(n: number): string { return 'one' }
  two(s: string): string { return 'two' }
  private overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}

class A20 {
  one(n: number): string { return 'one' }
  public two(s: string): string { return 'two' }
  private overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}

class A21 {
  public one(n: number): string { return 'one' }
  public two(s: string): string { return 'two' }
  private overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}

class A22 {
  protected one(n: number): string { return 'one' }
  two(s: string): string { return 'two' }
  private overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}

class A23 {
  one(n: number): string { return 'one' }
  protected two(s: string): string { return 'two' }
  private overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}

class A24 {
  protected one(n: number): string { return 'one' }
  public two(s: string): string { return 'two' }
  private overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}

class A25 {
  public one(n: number): string { return 'one' }
  protected two(s: string): string { return 'two' }
  private overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}

class A26 {
  protected one(n: number): string { return 'one' }
  protected two(s: string): string { return 'two' }
  private overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}

class A27 {
  private one(n: number): string { return 'one' }
  two(s: string): string { return 'two' }
  private overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}

class A28 {
  one(n: number): string { return 'one' }
  private two(s: string): string { return 'two' }
  private overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}

class A29 {
  private one(n: number): string { return 'one' }
  protected two(s: string): string { return 'two' }
  private overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}

class A30 {
  protected one(n: number): string { return 'one' }
  private two(s: string): string { return 'two' }
  private overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}

class A31 {
  private one(n: number): string { return 'one' }
  public two(s: string): string { return 'two' }
  private overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}

class A32 {
  public one(n: number): string { return 'one' }
  private two(s: string): string { return 'two' }
  private overload foo { one, two }

publicFoo(x: number | string): string {
  if (x instanceof number) {
    return this.foo(x);
  } else {
    return this.foo(x);
  }
}
}
class A33 {
  f1(n: number): string { return 'f1' }
  f2(s: string): string { return 'f2' }
  overload foo { f1, f2 }
}

class B33 extends A33 {
  f3(s: boolean): string { return 'f3' }
  overload foo { f1, f2, f3 }

test(): string {
  return this.foo(12.6) + this.foo('test') + this.foo(true);
}
}

class A34 {
  public f1(n: number): string { return 'f1' }
  public f2(s: string): string { return 'f2' }
  public overload foo { f1, f2 }
}

class B34 extends A34 {
  public f3(s: boolean): string { return 'f3' }
  public overload foo { f1, f2, f3 }

test(): string {
  return this.foo(12.6) + this.foo('test') + this.foo(true);
}
}

class A35 {
  protected f1(n: number): string { return 'f1' }
  protected f2(s: string): string { return 'f2' }
  protected overload foo { f1, f2 }
}

class B35 extends A35 {
  protected f3(s: boolean): string { return 'f3' }
  protected overload foo { f1, f2, f3 }

test(): string {
  return this.foo(12.6) + this.foo('test') + this.foo(true);
}
}

class A36 {
  public f1(n: number): string { return 'f1' }
  public f2(s: string): string { return 'f2' }
  overload foo { f1, f2 }
}

class B36 extends A36 {
  f3(s: boolean): string { return 'f3' }
  public overload foo { f1, f2, f3 }

test(): string {
  return this.foo(12.6) + this.foo('test') + this.foo(true);
}
}

class A37 {
  public f1(n: number): string { return 'f1' }
  public f2(s: string): string { return 'f2' }
  public overload foo { f1, f2 }
}

class B37 extends A37 {
  public f3(s: boolean): string { return 'f3' }
  overload foo { f1, f2, f3 }

test(): string {
  return this.foo(12.6) + this.foo('test') + this.foo(true);
}
}

class A38 {
  public f1(n: number): string { return 'f1' }
  public f2(s: string): string { return 'f2' }
  protected overload foo { f1, f2 }
}

class B38 extends A38 {
  protected f3(s: boolean): string { return 'f3' }
  protected overload foo { f1, f2, f3 }

test(): string {
  return this.foo(12.6) + this.foo('test') + this.foo(true);
}
}

class A39 {
  public f1(n: number): string { return 'f1' }
  public f2(s: string): string { return 'f2' }
  protected overload foo { f1, f2 }
}

class B39 extends A39 {
  public f3(s: boolean): string { return 'f3' }
  protected overload foo { f1, f2, f3 }

test(): string {
  return this.foo(12.6) + this.foo('test') + this.foo(true);
}
}

class A40 {
  protected f1(n: number): string { return 'f1' }
  protected f2(s: string): string { return 'f2' }
  protected overload foo { f1, f2 }
}

class B40 extends A40 {
  protected f3(s: boolean): string { return 'f3' }
  protected overload foo { f1, f2, f3 }

test(): string {
  return this.foo(12.6) + this.foo('test') + this.foo(true);
}
}

class A41 {
  protected f1(n: number): string { return 'f1' }
  protected f2(s: string): string { return 'f2' }
  protected overload foo { f1, f2 }
}

class B41 extends A41 {
  public f3(s: boolean): string { return 'f3' }
  protected overload foo { f1, f2, f3 }

test(): string {
  return this.foo(12.6) + this.foo('test') + this.foo(true);
}
}

class A42 {
  public f1(n: number): string { return 'f1' }
  public f2(s: string): string { return 'f2' }
  private overload foo { f1, f2 }
}

class B42 extends A42 {
  public f3(s: boolean): string { return 'f3' }
  protected overload foo { f1, f2, f3 }

test(): string {
  return this.foo(12.6) + this.foo('test') + this.foo(true);
}
}

class A43 {
  public f1(n: number): string { return 'f1' }
  public f2(s: string): string { return 'f2' }
  private overload foo { f1, f2 }
}

class B43 extends A43 {
  protected f3(s: boolean): string { return 'f3' }
  protected overload foo { f1, f2, f3 }

test(): string {
  return this.foo(12.6) + this.foo('test') + this.foo(true);
}
}
//Access modifier mismatch:
// a 'public' overload requires all methods to be 'public';
// a 'protected' overload cannot have 'private' methods.
//会报如上错误，所以暂时注释但是不删除
/*class A44 {
  public f1(n: number): string { return 'f1' }
  public f2(s: string): string { return 'f2' }
  private overload foo { f1, f2 }
}

class B44 extends A44 {
  private f3(s: boolean): string { return 'f3' }
  protected overload foo { f1, f2, f3 }

test(): string {
  return this.foo(12.6) + this.foo('test') + this.foo(true);
}
}*/

class A45 {
  protected f1(n: number): string { return 'f1' }
  protected f2(s: string): string { return 'f2' }
  private overload foo { f1, f2 }
}

class B45 extends A45 {
  public f3(s: boolean): string { return 'f3' }
  protected overload foo { f1, f2, f3 }

test(): string {
  return this.foo(12.6) + this.foo('test') + this.foo(true);
}
}

class A46 {
  protected f1(n: number): string { return 'f1' }
  protected f2(s: string): string { return 'f2' }
  private overload foo { f1, f2 }
}

class B46 extends A46 {
  protected f3(s: boolean): string { return 'f3' }
  protected overload foo { f1, f2, f3 }

test(): string {
  return this.foo(12.6) + this.foo('test') + this.foo(true);
}
}
//Access modifier mismatch:
// a 'public' overload requires all methods to be 'public';
// a 'protected' overload cannot have 'private' methods.
//会报如上错误，所以暂时注释但是不删除
/*class A47 {
  protected f1(n: number): string { return 'f1' }
  protected f2(s: string): string { return 'f2' }
  private overload foo { f1, f2 }
}

class B47 extends A47 {
  private f3(s: boolean): string { return 'f3' }
  protected overload foo { f1, f2, f3 }

test(): string {
  return this.foo(12.6) + this.foo('test') + this.foo(true);
}
}*/

class A48 {
  public f1(n: number): string { return 'f1' }
  public f2(s: string): string { return 'f2' }
  public overload foo { f1, f2 }
}

class B48 extends A48 {
  public f3(s: boolean): string { return 'f3' }
  private overload foo { f1, f2, f3 }

test(): string {
  return this.foo(12.6) + this.foo('test') + this.foo(true);
}
}

class A49 {
  public f1(n: number): string { return 'f1' }
  public f2(s: string): string { return 'f2' }
  public overload foo { f1, f2 }
}

class B49 extends A49 {
  protected f3(s: boolean): string { return 'f3' }
  private overload foo { f1, f2, f3 }

test(): string {
  return this.foo(12.6) + this.foo('test') + this.foo(true);
}
}

class A50 {
  public f1(n: number): string { return 'f1' }
  public f2(s: string): string { return 'f2' }
  public overload foo { f1, f2 }
}

class B50 extends A50 {
  private f3(s: boolean): string { return 'f3' }
  private overload foo { f1, f2, f3 }

test(): string {
  return this.foo(12.6) + this.foo('test') + this.foo(true);
}
}

class A51 {
  protected f1(n: number): string { return 'f1' }
  protected f2(s: string): string { return 'f2' }
  protected overload foo { f1, f2 }
}

class B51 extends A51 {
  public f3(s: boolean): string { return 'f3' }
  private overload foo { f1, f2, f3 }

test(): string {
  return this.foo(12.6) + this.foo('test') + this.foo(true);
}
}

class A52 {
  protected f1(n: number): string { return 'f1' }
  protected f2(s: string): string { return 'f2' }
  protected overload foo { f1, f2 }
}

class B52 extends A52 {
  protected f3(s: boolean): string { return 'f3' }
  private overload foo { f1, f2, f3 }

test(): string {
  return this.foo(12.6) + this.foo('test') + this.foo(true);
}
}

class A53 {
  protected f1(n: number): string { return 'f1' }
  protected f2(s: string): string { return 'f2' }
  protected overload foo { f1, f2 }
}

class B53 extends A53 {
  private f3(s: boolean): string { return 'f3' }
  private overload foo { f1, f2, f3 }

test(): string {
  return this.foo(12.6) + this.foo('test') + this.foo(true);
}
}

class A54 {
  public f1(n: number): string { return 'f1' }
  public f2(s: string): string { return 'f2' }
  private overload foo { f1, f2 }
}

class B54 extends A54 {
  public f3(s: boolean): string { return 'f3' }
  private overload foo { f1, f2, f3 }

test(): string {
  return this.foo(12.6) + this.foo('test') + this.foo(true);
}
}

class A55 {
  public f1(n: number): string { return 'f1' }
  public f2(s: string): string { return 'f2' }
  private overload foo { f1, f2 }
}

class B55 extends A55 {
  protected f3(s: boolean): string { return 'f3' }
  private overload foo { f1, f2, f3 }

test(): string {
  return this.foo(12.6) + this.foo('test') + this.foo(true);
}
}

class A56 {
  public f1(n: number): string { return 'f1' }
  public f2(s: string): string { return 'f2' }
  private overload foo { f1, f2 }
}

class B56 extends A56 {
  private f3(s: boolean): string { return 'f3' }
  private overload foo { f1, f2, f3 }

test(): string {
  return this.foo(12.6) + this.foo('test') + this.foo(true);
}
}

class A57 {
  protected f1(n: number): string { return 'f1' }
  protected f2(s: string): string { return 'f2' }
  private overload foo { f1, f2 }
}

class B57 extends A57 {
  public f3(s: boolean): string { return 'f3' }
  private overload foo { f1, f2, f3 }

test(): string {
  return this.foo(12.6) + this.foo('test') + this.foo(true);
}
}

class A58 {
  protected f1(n: number): string { return 'f1' }
  protected f2(s: string): string { return 'f2' }
  private overload foo { f1, f2 }
}

class B58 extends A58 {
  protected f3(s: boolean): string { return 'f3' }
  private overload foo { f1, f2, f3 }

test(): string {
  return this.foo(12.6) + this.foo('test') + this.foo(true);
}
}

class A59 {
  protected f1(n: number): string { return 'f1' }
  protected f2(s: string): string { return 'f2' }
  private overload foo { f1, f2 }
}

class B59 extends A59 {
  private f3(s: boolean): string { return 'f3' }
  private overload foo { f1, f2, f3 }

test(): string {
  return this.foo(12.6) + this.foo('test') + this.foo(true);
}
}
class G1 {
  greeting = "";

  static greetI(factory: () => G1, i: int): G1 {
    let g = factory();
    g.greeting = 'Hi ' + i + '!';
    return g;
  }

  static greetS(factory: () => G1, s: string): G1 {
    let g = factory();
    g.greeting = 'Hey ' + s + '!';
    return g;
  }

  static overload $_instantiate { greetI, greetS }
}

class G2 extends G1 {
  static greetB(factory: () => G2, b: boolean): G2 {
    let g = factory();
    g.greeting = b ? 'Hi!' : 'Bye!';
    return g;
  }

  static overload $_instantiate { greetI, greetS, greetB }
}

class G3 {
  greeting = "";

  static greetI(factory: () => G3, i: int): G3 {
    let g = factory();
    g.greeting = 'Hi ' + i + '!';
    return g;
  }

  static greetS(factory: () => G3, s: string): G3 {
    let g = factory();
    g.greeting = 'Hey ' + s + '!';
    return g;
  }

  static overload $_instantiate { greetI, greetS }
}

class G4 extends G3 {
  static greetB(factory: () => G4, b: boolean): G4 {
    let g = factory();
    g.greeting = b ? 'Hi!' : 'Bye!';
    return g;
  }

  static overload $_instantiate { greetI, greetS, greetB }
}

class G5 {
  greeting = "";

  static greetI(factory: () => G5, i: int): G5 {
    let g = factory();
    g.greeting = 'Hi ' + i + '!';
    return g;
  }

  static greetS(factory: () => G5, s: string): G5 {
    let g = factory();
    g.greeting = 'Hey ' + s + '!';
    return g;
  }

  static overload $_instantiate { greetI, greetS }
}

class G6 extends G5 {
  static greetB(factory: () => G6, b: boolean): G6 {
    let g = factory();
    g.greeting = b ? 'Hi!' : 'Bye!';
    return g;
  }

  static overload $_instantiate { greetI, greetS, greetB }
}

class G7 {
  greeting = "";

  static greetI(factory: () => G7, i: int): G7 {
    let g = factory();
    g.greeting = 'Hi ' + i + '!';
    return g;
  }

  static greetS(factory: () => G7, s: string): G7 {
    let g = factory();
    g.greeting = 'Hey ' + s + '!';
    return g;
  }

  static overload $_instantiate { greetI, greetS }
}

class G8 extends G7 {
  static greetB(factory: () => G8, b: boolean): G8 {
    let g = factory();
    g.greeting = b ? 'Hi!' : 'Bye!';
    return g;
  }

  static overload $_instantiate { greetI, greetS, greetB }
}

class G9 {
  greeting = "";

  static greetI(factory: () => G9, i: int): G9 {
    let g = factory();
    g.greeting = 'Hi ' + i + '!';
    return g;
  }

  static greetS(factory: () => G9, s: string): G9 {
    let g = factory();
    g.greeting = 'Hey ' + s + '!';
    return g;
  }

  static overload $_instantiate { greetI, greetS }
}

class G10 extends G9 {
  static greetB(factory: () => G10, b: boolean): G10 {
    let g = factory();
    g.greeting = b ? 'Hi!' : 'Bye!';
    return g;
  }

  static overload $_instantiate { greetI, greetS, greetB }
}

class G11 {
  greeting = "";

  static greetI(factory: () => G11, i: int): G11 {
    let g = factory();
    g.greeting = 'Hi ' + i + '!';
    return g;
  }

  static greetS(factory: () => G11, s: string): G11 {
    let g = factory();
    g.greeting = 'Hey ' + s + '!';
    return g;
  }

  static overload $_instantiate { greetI, greetS }
}

class G12 extends G11 {
  static greetB(factory: () => G12, b: boolean): G12 {
    let g = factory();
    g.greeting = b ? 'Hi!' : 'Bye!';
    return g;
  }

  static overload $_instantiate { greetI, greetS, greetB }
}

class G13 {
  static greetI(i: int): string { return 'Hi ' + i + '!' }
  static greetS(s: string): string { return 'Hey ' + s + '!' }
  static overload $_invoke { greetI, greetS }
}

class G14 extends G13 {
  static greetB(b: boolean): string { return b ? 'Hi!' : 'Bye!' }
  static overload $_invoke { greetI, greetS, greetB }
}

class G15 {
  static greetI(i: int): string { return 'Hi ' + i + '!' }
  static greetS(s: string): string { return 'Hey ' + s + '!' }
  static overload $_invoke { greetI, greetS }
}

class G16 extends G15 {
  static greetB(b: boolean): string { return b ? 'Hi!' : 'Bye!' }
  static overload $_invoke { greetI, greetS, greetB }
}

class G17 {
  static greetI(i: int): string { return 'Hi ' + i + '!' }
  static greetS(s: string): string { return 'Hey ' + s + '!' }
  static overload $_invoke { greetI, greetS }
}

class G18 extends G17 {
  static greetB(b: boolean): string { return b ? 'Hi!' : 'Bye!' }
  static overload $_invoke { greetI, greetS, greetB }
}

class G19 {
  static greetI(i: int): string { return 'Hi ' + i + '!' }
  static greetS(s: string): string { return 'Hey ' + s + '!' }
  static overload $_invoke { greetI, greetS }
}

class G20 extends G19 {
  static greetB(b: boolean): string { return b ? 'Hi!' : 'Bye!' }
  static overload $_invoke { greetI, greetS, greetB }
}

class G21 {
  static greetI(i: int): string { return 'Hi ' + i + '!' }
  static greetS(s: string): string { return 'Hey ' + s + '!' }
  static overload $_invoke { greetI, greetS }
}

class G22 extends G21 {
  static greetB(b: boolean): string { return b ? 'Hi!' : 'Bye!' }
  static overload $_invoke { greetI, greetS, greetB }
}

class G23 {
  static greetI(i: int): string { return 'Hi ' + i + '!' }
  static greetS(s: string): string { return 'Hey ' + s + '!' }
  static overload $_invoke { greetI, greetS }
}

class G24 extends G23 {
  static greetB(b: boolean): string { return b ? 'Hi!' : 'Bye!' }
  static overload $_invoke { greetI, greetS, greetB }
}

class C {
  private ids: Map<int, int> = new Map<int, int>();
  private names: Map<string, int> = new Map<string, int>();

  getByNumber(index: int): int | undefined { return this.ids.get(index) }
  getByString(index: string): int | undefined { return this.names.get(index) }
  overload $_get { getByNumber, getByString }

setByNumber(index: int, value: int) { this.ids.set(index, value) }
setByString(index: string, value: int) { this.names.set(index, value) }
overload $_set { setByNumber, setByString }
}

class C1 {
  private ids: Map<int, int> = new Map<int, int>();
  private names: Map<string, int> = new Map<string, int>();

  getByNumber(index: int): int | undefined { return this.ids.get(index) }
  getByString(index: string): int | undefined { return this.names.get(index) }
  overload $_get { getByNumber, getByString }

setByNumber(index: int, value: int) { this.ids.set(index, value) }
setByString(index: string, value: int) { this.names.set(index, value) }
overload $_set { setByNumber, setByString }
}

class C2 {
  private ids: Map<int, int> = new Map<int, int>();
  private names: Map<string, int> = new Map<string, int>();

  getByNumber(index: int): int | undefined { return this.ids.get(index) }
  getByString(index: string): int | undefined { return this.names.get(index) }
  overload $_get { getByNumber, getByString }

setByNumber(index: int, value: int) { this.ids.set(index, value) }
setByString(index: string, value: int) { this.names.set(index, value) }
overload $_set { setByNumber, setByString }
}

class C3 {
  private ids: Map<int, int> = new Map<int, int>();
  private names: Map<string, int> = new Map<string, int>();

  getByNumber(index: int): int | undefined { return this.ids.get(index) }
  getByString(index: string): int | undefined { return this.names.get(index) }
  overload $_get { getByNumber, getByString }

setByNumber(index: int, value: int) { this.ids.set(index, value) }
setByString(index: string, value: int) { this.names.set(index, value) }
overload $_set { setByNumber, setByString }
}

class C4 {
  private ids: Map<int, int> = new Map<int, int>();
  private names: Map<string, int> = new Map<string, int>();

  getByNumber(index: int): int | undefined { return this.ids.get(index) }
  getByString(index: string): int | undefined { return this.names.get(index) }
  overload $_get { getByNumber, getByString }

setByNumber(index: int, value: int) { this.ids.set(index, value) }
setByString(index: string, value: int) { this.names.set(index, value) }
overload $_set { setByNumber, setByString }
}

class C5 {
  private ids: Map<int, int> = new Map<int, int>();
  private names: Map<string, int> = new Map<string, int>();

  getByNumber(index: int): int | undefined { return this.ids.get(index) }
  getByString(index: string): int | undefined { return this.names.get(index) }
  overload $_get { getByNumber, getByString }

setByNumber(index: int, value: int) { this.ids.set(index, value) }
setByString(index: string, value: int) { this.names.set(index, value) }
overload $_set { setByNumber, setByString }
}

interface I49 {
  f1(x: int): string;
  f2(x: boolean): string;
  overload foo { f1, f2 }
}

interface I50 {
  f3(x: number): string;
  f4(x: string): string;
  overload foo { f3, f4 }
}

class A84 implements I49, I50 {
  f1(x: int): string { return 'f1' }
  f2(x: boolean): string { return 'f2' }
  f3(x: number): string { return 'f3' }
  f4(x: string): string { return 'f4' }
  f5(x: int, y: int): string { return 'f5' }
  overload foo { f1, f2, f3, f4 }
}

interface I53 {
  f1(x: int): string;
  f2(x: boolean): string;
  overload foo { f1, f2 }
}

interface I54 {
  f3(x: number): string;
  f4(x: string): string;
  overload foo { f3, f4 }
}

class A86 implements I53, I54 {
  f1(x: int): string { return 'f1' }
  f2(x: boolean): string { return 'f2' }
  f3(x: number): string { return 'f3' }
  f4(x: string): string { return 'f4' }
  f5(x: int, y: int): string { return 'f5' }
  overload foo { f1, f2, f3, f4, f5 }
}

interface I55 {
  f1(x: int): string;
  f2(x: boolean): string;
  overload foo { f1, f2 }
}

interface I56 {
  f3(x: number): string;
  f4(x: string): string;
  overload foo { f3, f4 }
}

class A87 implements I55, I56 {
  f1(x: int): string { return 'f1' }
  f2(x: boolean): string { return 'f2' }
  f3(x: number): string { return 'f3' }
  f4(x: string): string { return 'f4' }
  f5(x: int, y: int): string { return 'f5' }
  overload foo { f1, f2, f3, f4, f5 }
}

interface I57 {
  f1(x: int): string;
  f2(x: boolean): string;
  overload foo { f1, f2 }
}

interface I58 {
  f3(x: number): string;
  f4(x: string): string;
  overload foo { f3, f4 }
}

class A88 implements I57, I58 {
  f1(x: int): string { return 'f1' }
  f2(x: boolean): string { return 'f2' }
  f3(x: number): string { return 'f3' }
  f4(x: string): string { return 'f4' }
  f5(x: int, y: int): string { return 'f5' }
  overload foo { f1, f2, f3, f4, f5 }
}

interface I59 {
  f1(x: int): string;
  f2(x: boolean): string;
  overload foo { f1, f2 }
}

interface I60 {
  f3(x: number): string;
  f4(x: string): string;
  overload foo { f3, f4 }
}

class A89 implements I59, I60 {
  f1(x: int): string { return 'f1' }
  f2(x: boolean): string { return 'f2' }
  f3(x: number): string { return 'f3' }
  f4(x: string): string { return 'f4' }
  f5(x: int, y: int): string { return 'f5' }
  overload foo { f1, f2, f3, f4, f5 }
}

interface I61 {
  f1(x: int): string;
  f2(x: boolean): string;
  overload foo { f1, f2 }
}

interface I62 {
  f3(x: number): string;
  f4(x: string): string;
  overload foo { f3, f4 }
}

class A90 implements I61, I62 {
  f1(x: int): string { return 'f1' }
  f2(x: boolean): string { return 'f2' }
  f3(x: number): string { return 'f3' }
  f4(x: string): string { return 'f4' }
  f5(x: int, y: int): string { return 'f5' }
  overload foo { f1, f2, f3, f4, f5 }
}
/*
 * Temporarily commented out.
 * Corresponds to source cases:
 *   - cm_iterable_types_0.ets
 *   - cm_iterable_types_1.ets
 * Reason:
 * Current compiler reports ESE4002:
 * "Cannot assign to a readonly field value"
 * when constructing IteratorResult<T> via object literal in next().
 * Keep these cases commented out for traceability, do not delete.
 */

/*
class C6 {
  data1: string[] = ['a', 'b', 'c'];
  data2: int[] = [2, 12, 45, 0, 6];
  iter1(): CIter1 { return new CIter1(this) }
  iter2(): CIter2 { return new CIter2(this) }
  overload $_iterator{ iter1, iter2 }
}

class CIter1 implements Iterator<string> {
  index = 0;
  base: C6;
  constructor(base: C6) {
    this.base = base;
  }
  next(): IteratorResult<string> {
    return {
      done: this.index >= this.base.data1.length,
      value: this.index >= this.base.data1.length ? undefined : this.base.data1[this.index++]
    }
  }
}

class CIter2 implements Iterator<int> {
  index = 0;
  base: C6;
  constructor(base: C6) {
    this.base = base;
  }
  next(): IteratorResult<int> {
    return {
      done: this.index >= this.base.data2.length,
      value: this.index >= this.base.data2.length ? undefined : this.base.data2[this.index++]
    }
  }
}
*/

/*
class C7 {
  data1: string[] = ['a', 'b', 'c'];
  data2: int[] = [2, 12, 45, 0, 6];
  iter1(): CIter3 { return new CIter3(this) }
  iter2(): CIter4 { return new CIter4(this) }
  overload $_iterator{ iter2, iter1 }
}

class CIter3 implements Iterator<string> {
  index = 0;
  base: C7;
  constructor(base: C7) {
    this.base = base;
  }
  next(): IteratorResult<string> {
    return {
      done: this.index >= this.base.data1.length,
      value: this.index >= this.base.data1.length ? undefined : this.base.data1[this.index++]
    }
  }
}

class CIter4 implements Iterator<int> {
  index = 0;
  base: C7;
  constructor(base: C7) {
    this.base = base;
  }
  next(): IteratorResult<int> {
    return {
      done: this.index >= this.base.data2.length,
      value: this.index >= this.base.data2.length ? undefined : this.base.data2[this.index++]
    }
  }
}
*/

class A91 {
  static num: number = 0;
  static str: string = '';

  one(n: number) { A91.num = n }
  two(s: string) { A91.str = s }
  overload foo { one, two }
}

class A92 {
  static num: number = 0;
  static str: string = '';

  async one(n: number) { A92.num = n }
  async two(s: string) { A92.str = s }
  async overload foo { one, two }
}

class A93 {
  static num: number = 0;
  static str: string = '';

  static one(n: number) { A93.num = n }
  static two(s: string) { A93.str = s }
  static overload foo { one, two }
}

class A94 {
  static num: number = 0;
  static str: string = '';

  async static one(n: number) { A94.num = n }
  async static two(s: string) { A94.str = s }
  async static overload foo { one, two }
}

class A95 {
  static num: number = 0;
  static str: string = '';

  static async one(n: number) { A95.num = n }
  static async two(s: string) { A95.str = s }
  static async overload foo { one, two }
}
enum Color { Red, Green = 82, Blue }
enum Size1 { S = "small", M = "medium", L = "large" }

type T = [number, string];
type R = [number, boolean];
type FF = (p: number) => string;
type EE = (p: string) => int;

class X {}
class Y extends X {}
class Z extends Y {}

class A96 {
  m01(p: byte): string { return "byte" }
  m02(p: short): string { return "short" }
  m03(p: int): string { return "int" }
  m04(p: long): string { return "long" }
  m05(p: boolean): string { return "boolean" }
  m06(p: float): string { return "float" }
  m07(p: double): string { return "double" }
  m08(p: string): string { return "string" }
  m09(p: Color): string { return "Color" }
  m10(p: Size1): string { return "Size" }
  m11(p: T): string { return "T" }
  m12(p: R): string { return "R" }
  m13(p: () => void): string { return "void-void" }
  m14(p: (p: number) => void): string { return "number-void" }
  m15(p: FF): string { return "FF" }
  m16(p: EE): string { return "EE" }
  m17(p: FixedArray<Color>): string { return "FA:Color" }
  m18(p: FixedArray<A96>): string { return "FA:A" }
  m19(p: FixedArray<byte>): string { return "FA:byte" }
  m20(p: FixedArray<short>): string { return "FA:short" }
  m21(p: FixedArray<int>): string { return "FA:int" }
  m22(p: FixedArray<long>): string { return "FA:long" }
  m23(p: FixedArray<boolean>): string { return "FA:boolean" }
  m24(p: FixedArray<float>): string { return "FA:float" }
  m25(p: FixedArray<double>): string { return "FA:double" }
  m26(p: FixedArray<number>): string { return "FA:number" }
  m27(p: FixedArray<string>): string { return "FA:string" }
  m28(p: FixedArray<Size1>): string { return "FA:Size" }
  m29(p: FixedArray<object>): string { return "FA:object" }
  m30(p: int, q: int): string { return "i+i" }
  m31(p: string, q: double): string { return "s+d" }
  m32(p: boolean, q?: object): string { return "b+o?" }
  m33(p: int, q: object[]): string { return "i+o[]" }
  m34(p: string, ...q: object[]): string { return "s+...o" }
  m35(p: Y, q: Z): string { return "Y+Z" }
  m36(p: X, q: Y): string { return "X+Y" }
  m37(p: Z): string { return "Z" }
  m38(p: X): string { return "X" }
  m39(p: object): string { return "object" }
  m40(...p: object[]): string { return "objects" }

  overload meth {
  m01, m02, m03, m04, m05, m06, m07, m08, m09, m10,
  m11, m12, m13, m14, m15, m16, m17, m18, m19, m20,
  m21, m22, m23, m24, m25, m26, m27, m28, m29, m30,
  m31, m32, m33, m34, m35, m36, m37, m38, m39, m40
}
}
enum Color1 { Red, Green = 82, Blue }

type T1 = [number, string];
type R1 = [int, boolean];

type SN = string | null
type SU = string | undefined
type SNU = string | null | undefined

abstract class B1 {
  m01(p: int): string { return "int" }
  m02(p: boolean): string { return "boolean" }
  m03(p: double): string { return "double" }
  m04(p: string): string { return "string" }
  m05(p: Color1): string { return "Color" }
  m06(p: T1): string { return "T" }
  m07(p: R1): string { return "R" }
  m08(p: SN): string { return 'SN' }
  m09(p: SU): string { return 'SU' }
  m10(p: SNU): string { return 'SNU' }
  m11(p: int, q: int): string { return "i+i" }
  m12(p: boolean, q?: object): string { return "b+o?" }

  overload meth { m01, m02, m03, m04, m05 }
}

class A97 extends B1 {
  m13(p: object): string { return "object" }
  m14(...p: object[]): string { return "objects" }

  overload meth {
  m01, m02, m03, m04, m05, m06, m07, m08, m09, m10,
  m11, m12, m13, m14
}
}

class B2 {
  m1(p: int): string { return 'int' }
  m2(p: int, q: object): string { return 'i+o' }
  m3(p: int, q: object, r?: object): string { return 'i+o+o?' }

  overload meth { m1, m2 }
}

class A98 extends B2 {
  m4(p: object): string { return "object" }

  overload meth { m1, m2, m3, m4 }
}
class A99 {
  overload foo { fooN, fooS }
fooN(n: number): string { return 'A.fooN' }
fooS(s: string): string { return 'A.fooS' }
}

class B3 extends A99 {
  override fooN(n: number): string { return 'B.fooN' }
  fooI(n: int): string { return 'B.fooI' }
  overload foo { fooN, fooS }
}

class B4 extends A99 {
  override fooN(n: number): string { return 'B.fooN' }
  fooI(n: int): string { return 'B.fooI' }
  overload foo { fooS, fooN }
}

class B5 extends A99 {
  override fooN(n: number): string { return 'B.fooN' }
  fooI(n: int): string { return 'B.fooI' }
  overload foo { fooI, fooN, fooS }
}

class B6 extends A99 {
  override fooN(n: number): string { return 'B.fooN' }
  fooI(n: int): string { return 'B.fooI' }
  overload foo { fooS, fooI, fooN }
}

class B7 extends A99 {
  override fooN(n: number): string { return 'B.fooN' }
  fooI(n: int): string { return 'B.fooI' }
  overload foo { fooS, fooN, fooI }
}

class B8 extends A99 {
  override fooN(n: number): string { return 'B.fooN' }
  fooI(n: int): string { return 'B.fooI' }
  overload f2 { fooI }
}

class B9 extends A99 {
  override fooN(n: number): string { return 'B.fooN' }
  fooI(n: int): string { return 'B.fooI' }
  overload f2 { fooN }
}

class B10 extends A99 {
  override fooN(n: number): string { return 'B.fooN' }
  fooI(n: int): string { return 'B.fooI' }
  overload f2 { fooS }
}

class B11 extends A99 {
  override fooN(n: number): string { return 'B.fooN' }
  fooI(n: int): string { return 'B.fooI' }
  overload f2 { fooI, fooN }
}

class B12 extends A99 {
  override fooN(n: number): string { return 'B.fooN' }
  fooI(n: int): string { return 'B.fooI' }
  overload f2 { fooS, fooI }
}

class B13 extends A99 {
  override fooN(n: number): string { return 'B.fooN' }
  fooI(n: int): string { return 'B.fooI' }
  overload f2 { fooI, fooN, fooS }
}

class A100 {
  overload foo { fooN, fooS }
fooN(n: number): string { return 'A.fooN' }
fooS(s: string): string { return 'A.fooS' }
}

class B14 extends A100 {
  override fooN(n: number): string { return 'B.fooN' }
}

class C10 extends A100 {
  fooI(n: int): string { return 'C.fooI' }
  overload foo { fooI, fooN, fooS }
}

/*
 * Temporarily commented out.
 * Corresponds to source cases: cm_subclass_9.ets ~ cm_subclass_19.ets
 * Reason:
 * Current compiler requires that if a subclass redeclares the same overload alias,
 * it must list all methods overloaded in the superclass.
 * These cases intentionally omit inherited overload members and trigger ESE0390.
 * Keep them commented out for traceability, do not delete.
 */

/*class C11 extends A100 {
  fooI(n: int): string { return 'C.fooI' }
  overload foo { fooN }
}

class C12 extends A100 {
  fooI(n: int): string { return 'C.fooI' }
  overload foo { fooS }
}

class C13 extends A100 {
  fooI(n: int): string { return 'C.fooI' }
  overload foo { fooI }
}

class C14 extends A100 {
  fooI(n: int): string { return 'C.fooI' }
  overload foo { fooI, fooN }
}

class C15 extends A100 {
  fooI(n: int): string { return 'C.fooI' }
  overload foo { fooI, fooS }
}

class C16 extends A100 {
  fooI(n: int): string { return 'C.fooI' }
  overload foo { fooN, fooI }
}

class C17 extends A100 {
  fooI(n: int): string { return 'C.fooI' }
  overload foo { fooS, fooI }
}*/
export default function ExplicitClassMethodOverloadTest(): void {
  describe('ExplicitClassMethodOverloadTest', () => {
    beforeAll(() => {
    })

    beforeEach(async () => {
      await sleep(30);
    })

    afterEach(() => {
    })

    afterAll(() => {
    })

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_0100
     * @tc.name      testExplicitClassMethodOverload0001
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A = new A();

      arktest.assertEQ('one', a.foo(12.6));
      arktest.assertEQ('two', a.foo('Hello!'));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_0200
     * @tc.name      testExplicitClassMethodOverload0002
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A1 = new A1();

      arktest.assertEQ('one', a.foo(12.6));
      arktest.assertEQ('two', a.foo('Hello!'));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_0300
     * @tc.name      testExplicitClassMethodOverload0003
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A2 = new A2();

      arktest.assertEQ('one', a.publicFoo(12.6));
      arktest.assertEQ('two', a.publicFoo('Hello!'));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_0400
     * @tc.name      testExplicitClassMethodOverload0004
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A3 = new A3();

      arktest.assertEQ('one', a.publicFoo(12.6));
      arktest.assertEQ('two', a.publicFoo('Hello!'));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_0500
     * @tc.name      testExplicitClassMethodOverload0005
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A4 = new A4();

      arktest.assertEQ('one', a.foo(12.6));
      arktest.assertEQ('two', a.foo('Hello!'));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_0600
     * @tc.name      testExplicitClassMethodOverload0006
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A5 = new A5();

      arktest.assertEQ('one', a.foo(12.6));
      arktest.assertEQ('two', a.foo('Hello!'));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_0700
     * @tc.name      testExplicitClassMethodOverload0007
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A6 = new A6();

      arktest.assertEQ('one', a.foo(12.6));
      arktest.assertEQ('two', a.foo('Hello!'));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_0800
     * @tc.name      testExplicitClassMethodOverload0008
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A7 = new A7();

      arktest.assertEQ('one', a.foo(12.6));
      arktest.assertEQ('two', a.foo('Hello!'));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_0900
     * @tc.name      testExplicitClassMethodOverload0009
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A8 = new A8();

      arktest.assertEQ('one', a.foo(12.6));
      arktest.assertEQ('two', a.foo('Hello!'));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_1000
     * @tc.name      testExplicitClassMethodOverload0010
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A9 = new A9();

      arktest.assertEQ('one', a.foo(12.6));
      arktest.assertEQ('two', a.foo('Hello!'));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_1100
     * @tc.name      testExplicitClassMethodOverload0011
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A10 = new A10();

      arktest.assertEQ('one', a.publicFoo(12.6));
      arktest.assertEQ('two', a.publicFoo('Hello!'));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_1200
     * @tc.name      testExplicitClassMethodOverload0012
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A11 = new A11();

      arktest.assertEQ('one', a.publicFoo(12.6));
      arktest.assertEQ('two', a.publicFoo('Hello!'));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_1300
     * @tc.name      testExplicitClassMethodOverload0013
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A12 = new A12();

      arktest.assertEQ('one', a.publicFoo(12.6));
      arktest.assertEQ('two', a.publicFoo('Hello!'));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_1400
     * @tc.name      testExplicitClassMethodOverload0014
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A13 = new A13();

      arktest.assertEQ('one', a.publicFoo(12.6));
      arktest.assertEQ('two', a.publicFoo('Hello!'));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_1500
     * @tc.name      testExplicitClassMethodOverload0015
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A14 = new A14();

      arktest.assertEQ('one', a.publicFoo(12.6));
      arktest.assertEQ('two', a.publicFoo('Hello!'));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_1600
     * @tc.name      testExplicitClassMethodOverload0016
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A15 = new A15();

      arktest.assertEQ('one', a.publicFoo(12.6));
      arktest.assertEQ('two', a.publicFoo('Hello!'));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_1700
     * @tc.name      testExplicitClassMethodOverload0017
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A16 = new A16();

      arktest.assertEQ('one', a.publicFoo(12.6));
      arktest.assertEQ('two', a.publicFoo('Hello!'));
    });


  })
}
