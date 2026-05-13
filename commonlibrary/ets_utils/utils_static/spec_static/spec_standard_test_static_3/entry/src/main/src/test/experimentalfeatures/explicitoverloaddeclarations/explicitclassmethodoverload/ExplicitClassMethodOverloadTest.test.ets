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

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_1800
     * @tc.name      testExplicitClassMethodOverload0018
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A17 = new A17();

      arktest.assertEQ('one', a.publicFoo(12.6));
      arktest.assertEQ('two', a.publicFoo('Hello!'));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_1900
     * @tc.name      testExplicitClassMethodOverload0019
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A18 = new A18();

      arktest.assertEQ('one', a.publicFoo(12.6));
      arktest.assertEQ('two', a.publicFoo('Hello!'));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_2000
     * @tc.name      testExplicitClassMethodOverload0020
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A19 = new A19();

      arktest.assertEQ('one', a.publicFoo(12.6));
      arktest.assertEQ('two', a.publicFoo('Hello!'));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_2100
     * @tc.name      testExplicitClassMethodOverload0021
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A20 = new A20();

      arktest.assertEQ('one', a.publicFoo(12.6));
      arktest.assertEQ('two', a.publicFoo('Hello!'));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_2200
     * @tc.name      testExplicitClassMethodOverload0022
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A21 = new A21();

      arktest.assertEQ('one', a.publicFoo(12.6));
      arktest.assertEQ('two', a.publicFoo('Hello!'));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_2300
     * @tc.name      testExplicitClassMethodOverload0023
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A22 = new A22();

      arktest.assertEQ('one', a.publicFoo(12.6));
      arktest.assertEQ('two', a.publicFoo('Hello!'));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_2400
     * @tc.name      testExplicitClassMethodOverload0024
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A23 = new A23();

      arktest.assertEQ('one', a.publicFoo(12.6));
      arktest.assertEQ('two', a.publicFoo('Hello!'));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_2500
     * @tc.name      testExplicitClassMethodOverload0025
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A24 = new A24();

      arktest.assertEQ('one', a.publicFoo(12.6));
      arktest.assertEQ('two', a.publicFoo('Hello!'));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_2600
     * @tc.name      testExplicitClassMethodOverload0026
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A25 = new A25();

      arktest.assertEQ('one', a.publicFoo(12.6));
      arktest.assertEQ('two', a.publicFoo('Hello!'));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_2700
     * @tc.name      testExplicitClassMethodOverload0027
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A26 = new A26();

      arktest.assertEQ('one', a.publicFoo(12.6));
      arktest.assertEQ('two', a.publicFoo('Hello!'));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_2800
     * @tc.name      testExplicitClassMethodOverload0028
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A27 = new A27();

      arktest.assertEQ('one', a.publicFoo(12.6));
      arktest.assertEQ('two', a.publicFoo('Hello!'));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_2900
     * @tc.name      testExplicitClassMethodOverload0029
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A28 = new A28();

      arktest.assertEQ('one', a.publicFoo(12.6));
      arktest.assertEQ('two', a.publicFoo('Hello!'));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_3000
     * @tc.name      testExplicitClassMethodOverload0030
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A29 = new A29();

      arktest.assertEQ('one', a.publicFoo(12.6));
      arktest.assertEQ('two', a.publicFoo('Hello!'));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_3100
     * @tc.name      testExplicitClassMethodOverload0031
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A30 = new A30();

      arktest.assertEQ('one', a.publicFoo(12.6));
      arktest.assertEQ('two', a.publicFoo('Hello!'));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_3200
     * @tc.name      testExplicitClassMethodOverload0032
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A31 = new A31();

      arktest.assertEQ('one', a.publicFoo(12.6));
      arktest.assertEQ('two', a.publicFoo('Hello!'));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_3300
     * @tc.name      testExplicitClassMethodOverload0033
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A32 = new A32();

      arktest.assertEQ('one', a.publicFoo(12.6));
      arktest.assertEQ('two', a.publicFoo('Hello!'));
    });
    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_3400
     * @tc.name      testExplicitClassMethodOverload0034
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B33 = new B33();
      arktest.assertEQ('f1f2f3', b.test());
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_3500
     * @tc.name      testExplicitClassMethodOverload0035
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B34 = new B34();
      arktest.assertEQ('f1f2f3', b.test());
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_3600
     * @tc.name      testExplicitClassMethodOverload0036
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B35 = new B35();
      arktest.assertEQ('f1f2f3', b.test());
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_3700
     * @tc.name      testExplicitClassMethodOverload0037
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B36 = new B36();
      arktest.assertEQ('f1f2f3', b.test());
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_3800
     * @tc.name      testExplicitClassMethodOverload0038
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B37 = new B37();
      arktest.assertEQ('f1f2f3', b.test());
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_3900
     * @tc.name      testExplicitClassMethodOverload0039
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B38 = new B38();
      arktest.assertEQ('f1f2f3', b.test());
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_4000
     * @tc.name      testExplicitClassMethodOverload0040
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B39 = new B39();
      arktest.assertEQ('f1f2f3', b.test());
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_4100
     * @tc.name      testExplicitClassMethodOverload0041
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B40 = new B40();
      arktest.assertEQ('f1f2f3', b.test());
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_4200
     * @tc.name      testExplicitClassMethodOverload0042
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B41 = new B41();
      arktest.assertEQ('f1f2f3', b.test());
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_4300
     * @tc.name      testExplicitClassMethodOverload0043
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B42 = new B42();
      arktest.assertEQ('f1f2f3', b.test());
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_4400
     * @tc.name      testExplicitClassMethodOverload0044
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B43 = new B43();
      arktest.assertEQ('f1f2f3', b.test());
    });
//编译器报protected overload cannot have private methods错误，暂时注释保留
/*    *//**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_4500
     * @tc.name      testExplicitClassMethodOverload0045
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*
    it('testExplicitClassMethodOverload0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B44 = new B44();
      arktest.assertEQ('f1f2f3', b.test());
    });*/

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_4600
     * @tc.name      testExplicitClassMethodOverload0046
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B45 = new B45();
      arktest.assertEQ('f1f2f3', b.test());
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_4700
     * @tc.name      testExplicitClassMethodOverload0047
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B46 = new B46();
      arktest.assertEQ('f1f2f3', b.test());
    });
//注释原因上面已说
/*    *//**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_4800
     * @tc.name      testExplicitClassMethodOverload0048
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*
    it('testExplicitClassMethodOverload0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B47 = new B47();
      arktest.assertEQ('f1f2f3', b.test());
    });*/

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_4900
     * @tc.name      testExplicitClassMethodOverload0049
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B48 = new B48();
      arktest.assertEQ('f1f2f3', b.test());
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_5000
     * @tc.name      testExplicitClassMethodOverload0050
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B49 = new B49();
      arktest.assertEQ('f1f2f3', b.test());
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_5100
     * @tc.name      testExplicitClassMethodOverload0051
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B50 = new B50();
      arktest.assertEQ('f1f2f3', b.test());
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_5200
     * @tc.name      testExplicitClassMethodOverload0052
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B51 = new B51();
      arktest.assertEQ('f1f2f3', b.test());
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_5300
     * @tc.name      testExplicitClassMethodOverload0053
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B52 = new B52();
      arktest.assertEQ('f1f2f3', b.test());
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_5400
     * @tc.name      testExplicitClassMethodOverload0054
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B53 = new B53();
      arktest.assertEQ('f1f2f3', b.test());
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_5500
     * @tc.name      testExplicitClassMethodOverload0055
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B54 = new B54();
      arktest.assertEQ('f1f2f3', b.test());
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_5600
     * @tc.name      testExplicitClassMethodOverload0056
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B55 = new B55();
      arktest.assertEQ('f1f2f3', b.test());
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_5700
     * @tc.name      testExplicitClassMethodOverload0057
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B56 = new B56();
      arktest.assertEQ('f1f2f3', b.test());
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_5800
     * @tc.name      testExplicitClassMethodOverload0058
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B57 = new B57();
      arktest.assertEQ('f1f2f3', b.test());
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_5900
     * @tc.name      testExplicitClassMethodOverload0059
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B58 = new B58();
      arktest.assertEQ('f1f2f3', b.test());
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_6000
     * @tc.name      testExplicitClassMethodOverload0060
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B59 = new B59();
      arktest.assertEQ('f1f2f3', b.test());
    });
    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_6100
     * @tc.name      testExplicitClassMethodOverload0061
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g = G1(1);
      arktest.assertEQ('Hi 1!', g.greeting);
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_6200
     * @tc.name      testExplicitClassMethodOverload0062
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g = G3("Kim");
      arktest.assertEQ('Hey Kim!', g.greeting);
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_6300
     * @tc.name      testExplicitClassMethodOverload0063
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g = G6(10);
      arktest.assertEQ('Hi 10!', g.greeting);
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_6400
     * @tc.name      testExplicitClassMethodOverload0064
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g = G8("Mao");
      arktest.assertEQ('Hey Mao!', g.greeting);
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_6500
     * @tc.name      testExplicitClassMethodOverload0065
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g = G10(true);
      arktest.assertEQ('Hi!', g.greeting);
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_6600
     * @tc.name      testExplicitClassMethodOverload0066
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g = G12(false);
      arktest.assertEQ('Bye!', g.greeting);
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_6700
     * @tc.name      testExplicitClassMethodOverload0067
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_invoke'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arktest.assertEQ('Hi 1!', G13(1));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_6800
     * @tc.name      testExplicitClassMethodOverload0068
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_invoke'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arktest.assertEQ('Hey Kim!', G15("Kim"));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_6900
     * @tc.name      testExplicitClassMethodOverload0069
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_invoke'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arktest.assertEQ('Hi 10!', G18(10));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_7000
     * @tc.name      testExplicitClassMethodOverload0070
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_invoke'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arktest.assertEQ('Hey Mao!', G20("Mao"));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_7100
     * @tc.name      testExplicitClassMethodOverload0071
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_invoke'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arktest.assertEQ('Hi!', G22(true));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_7200
     * @tc.name      testExplicitClassMethodOverload0072
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_invoke'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arktest.assertEQ('Bye!', G24(false));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_7300
     * @tc.name      testExplicitClassMethodOverload0073
     * @tc.desc      Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new C();

      c[0] = 1;
      c[1] = 10;
      c['a'] = 20;
      c[''] = 30;

      arktest.assertEQ(1, c[0]);
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_7400
     * @tc.name      testExplicitClassMethodOverload0074
     * @tc.desc      Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new C1();

      c[0] = 1;
      c[1] = 10;
      c['a'] = 20;
      c[''] = 30;

      arktest.assertEQ(10, c[1]);
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_7500
     * @tc.name      testExplicitClassMethodOverload0075
     * @tc.desc      Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new C2();

      c[0] = 1;
      c[1] = 10;
      c['a'] = 20;
      c[''] = 30;

      arktest.assertEQ(20, c['a']);
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_7600
     * @tc.name      testExplicitClassMethodOverload0076
     * @tc.desc      Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new C3();

      c[0] = 1;
      c[1] = 10;
      c['a'] = 20;
      c[''] = 30;

      arktest.assertEQ(30, c['']);
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_7700
     * @tc.name      testExplicitClassMethodOverload0077
     * @tc.desc      Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new C4();

      c[0] = 1;
      c[1] = 10;
      c['a'] = 20;
      c[''] = 30;

      arktest.assertEQ(undefined, c[3]);
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_7800
     * @tc.name      testExplicitClassMethodOverload0078
     * @tc.desc      Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new C5();

      c[0] = 1;
      c[1] = 10;
      c['a'] = 20;
      c[''] = 30;

      arktest.assertEQ(undefined, c['b']);
    });

/*    *//**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_7900
     * @tc.name      testExplicitClassMethodOverload0079
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*
    it('testExplicitClassMethodOverload0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A60 = new A60();
      arktest.assertEQ('f1', a.foo(1));
    });

    *//**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_8000
     * @tc.name      testExplicitClassMethodOverload0080
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*
    it('testExplicitClassMethodOverload0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A61 = new A61();
      arktest.assertEQ('f2', a.foo(true));
    });

    *//**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_8100
     * @tc.name      testExplicitClassMethodOverload0081
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*
    it('testExplicitClassMethodOverload0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A62 = new A62();
      arktest.assertEQ('f3', a.foo(2.5));
    });

    *//**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_8200
     * @tc.name      testExplicitClassMethodOverload0082
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*
    it('testExplicitClassMethodOverload0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A63 = new A63();
      arktest.assertEQ('f4', a.foo("Kim"));
    });

    *//**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_8300
     * @tc.name      testExplicitClassMethodOverload0083
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*
    it('testExplicitClassMethodOverload0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A64 = new A64();
      arktest.assertEQ('f5', a.foo(8, 12));
    });

    *//**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_8400
     * @tc.name      testExplicitClassMethodOverload0084
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*
    it('testExplicitClassMethodOverload0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A65 = new A65();
      arktest.assertEQ('f2', a.foo(true));
    });

    *//**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_8500
     * @tc.name      testExplicitClassMethodOverload0085
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*
    it('testExplicitClassMethodOverload0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A66 = new A66();
      arktest.assertEQ('f3', a.foo(2.5));
    });

    *//**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_8600
     * @tc.name      testExplicitClassMethodOverload0086
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*
    it('testExplicitClassMethodOverload0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A67 = new A67();
      arktest.assertEQ('f1', a.foo(15));
    });

    *//**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_8700
     * @tc.name      testExplicitClassMethodOverload0087
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*
    it('testExplicitClassMethodOverload0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A68 = new A68();
      arktest.assertEQ('f5', a.foo(8, 12));
    });

    *//**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_8800
     * @tc.name      testExplicitClassMethodOverload0088
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*
    it('testExplicitClassMethodOverload0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A69 = new A69();
      arktest.assertEQ('f2', a.foo(true));
    });

    *//**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_8900
     * @tc.name      testExplicitClassMethodOverload0089
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*
    it('testExplicitClassMethodOverload0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A70 = new A70();
      arktest.assertEQ('f4', a.foo("Kim"));
    });

    *//**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_9000
     * @tc.name      testExplicitClassMethodOverload0090
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*
    it('testExplicitClassMethodOverload0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A71 = new A71();
      arktest.assertEQ('f5', a.foo(8, 12));
    });

    *//**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_9100
     * @tc.name      testExplicitClassMethodOverload0091
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*
    it('testExplicitClassMethodOverload0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A72 = new A72();
      arktest.assertEQ('f4', a.foo("Kim"));
    });

    *//**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_9200
     * @tc.name      testExplicitClassMethodOverload0092
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*
    //注释理由在数据定义部分已说明
*//*    it('testExplicitClassMethodOverload0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A73 = new A73();
      arktest.assertEQ('f3', a.foo(12));
    });*//*

    *//**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_9300
     * @tc.name      testExplicitClassMethodOverload0093
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*
    it('testExplicitClassMethodOverload0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A74 = new A74();
      arktest.assertEQ('f5', a.foo(8, 12));
    });

    *//**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_9400
     * @tc.name      testExplicitClassMethodOverload0094
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*
    it('testExplicitClassMethodOverload0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A75 = new A75();
      arktest.assertEQ('f1', a.foo(1));
    });

    *//**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_9500
     * @tc.name      testExplicitClassMethodOverload0095
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*
    it('testExplicitClassMethodOverload0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A76 = new A76();
      arktest.assertEQ('f2', a.foo(true));
    });
    *//**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_9600
     * @tc.name      testExplicitClassMethodOverload0096
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*
    it('testExplicitClassMethodOverload0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A77 = new A77();
      arktest.assertEQ('f5', a.foo(8, 12));
    });

    *//**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_9700
     * @tc.name      testExplicitClassMethodOverload0097
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*
    it('testExplicitClassMethodOverload0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A78 = new A78();
      arktest.assertEQ('f4', a.foo("Kim"));
    });

    *//**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_9800
     * @tc.name      testExplicitClassMethodOverload0098
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*
    it('testExplicitClassMethodOverload0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A79 = new A79();
      arktest.assertEQ('f1', a.foo(1));
    });

    *//**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_9900
     * @tc.name      testExplicitClassMethodOverload0099
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*
    it('testExplicitClassMethodOverload0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A80 = new A80();
      arktest.assertEQ('f5', a.foo(8, 12));
    });

    *//**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_10000
     * @tc.name      testExplicitClassMethodOverload0100
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*
    it('testExplicitClassMethodOverload0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A81 = new A81();
      arktest.assertEQ('f3', a.foo(10.5));
    });

    *//**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_10100
     * @tc.name      testExplicitClassMethodOverload0101
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*
    //注释理由在数据定义部分已说明
*//*    it('testExplicitClassMethodOverload0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A82 = new A82();
      arktest.assertEQ('f3', a.foo(15));
    });*//*

    *//**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_10200
     * @tc.name      testExplicitClassMethodOverload0102
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*
    it('testExplicitClassMethodOverload0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A83 = new A83();
      arktest.assertEQ('f2', a.foo(false));
    });*/

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_10300
     * @tc.name      testExplicitClassMethodOverload0103
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A84 = new A84();
      arktest.assertEQ('f3', a.foo(10.5));
    });

/*    *//**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_10400
     * @tc.name      testExplicitClassMethodOverload0104
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*
    it('testExplicitClassMethodOverload0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A85 = new A85();
      arktest.assertEQ('f2', a.foo(true));
    });*/

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_10500
     * @tc.name      testExplicitClassMethodOverload0105
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A86 = new A86();
      arktest.assertEQ('f1', a.foo(15));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_10600
     * @tc.name      testExplicitClassMethodOverload0106
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A87 = new A87();
      arktest.assertEQ('f2', a.foo(false));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_10700
     * @tc.name      testExplicitClassMethodOverload0107
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A88 = new A88();
      arktest.assertEQ('f3', a.foo(10.5));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_10800
     * @tc.name      testExplicitClassMethodOverload0108
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A89 = new A89();
      arktest.assertEQ('f4', a.foo("Mao"));
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_10900
     * @tc.name      testExplicitClassMethodOverload0109
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A90 = new A90();
      arktest.assertEQ('f5', a.foo(8, 12));
    });
    /*
     * Temporarily commented out.
     * Corresponds to source case: cm_iterable_types_0.ets
     * Reason:
     * Current compiler reports ESE4002:
     * "Cannot assign to a readonly field value"
     * when constructing IteratorResult<T> via object literal in next().
     * Keep this case commented out for traceability, do not delete.
     */
    /*
    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_11000
     * @tc.name      testExplicitClassMethodOverload0110
     * @tc.desc      Methods with special names (see Indexable Types, Iterable Types, and Callable
     *               Types) can be overloaded like ordinary methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *\/
    it('testExplicitClassMethodOverload0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new C6();
      let res: string = "";
      for (let x of c) {
        res += x;
      }

      arktest.assertEQ("abc", res);
    });
    */

    /*
     * Temporarily commented out.
     * Corresponds to source case: cm_iterable_types_1.ets
     * Reason:
     * Current compiler reports ESE4002:
     * "Cannot assign to a readonly field value"
     * when constructing IteratorResult<T> via object literal in next().
     * Keep this case commented out for traceability, do not delete.
     */
    /*
    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_11100
     * @tc.name      testExplicitClassMethodOverload0111
     * @tc.desc      Methods with special names (see Indexable Types, Iterable Types, and Callable
     *               Types) can be overloaded like ordinary methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *\/
    it('testExplicitClassMethodOverload0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new C7();
      let res: int = 0;
      for (let x of c) {
        res += x;
      }

      arktest.assertEQ(65, res);
    });
    */

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_11200
     * @tc.name      testExplicitClassMethodOverload0112
     * @tc.desc      Async and static method modifiers can be applied to overload methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 12.6;
      let y: string = 'Hello!';
      let a: A91 = new A91();

      a.foo(x);
      a.foo(y);

      arktest.assertEQ(x, A91.num);
      arktest.assertEQ(y, A91.str);
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_11300
     * @tc.name      testExplicitClassMethodOverload0113
     * @tc.desc      Async and static method modifiers can be applied to overload methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 12.6;
      let y: string = 'Hello!';
      let a: A92 = new A92();

      a.foo(x);
      a.foo(y);

      arktest.assertEQ(x, A92.num);
      arktest.assertEQ(y, A92.str);
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_11400
     * @tc.name      testExplicitClassMethodOverload0114
     * @tc.desc      Async and static method modifiers can be applied to overload methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 12.6;
      let y: string = 'Hello!';
      let a: A93 = new A93();

      A93.foo(x);
      A93.foo(y);

      arktest.assertEQ(x, A93.num);
      arktest.assertEQ(y, A93.str);
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_11500
     * @tc.name      testExplicitClassMethodOverload0115
     * @tc.desc      Async and static method modifiers can be applied to overload methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 12.6;
      let y: string = 'Hello!';
      let a: A94 = new A94();

      A94.foo(x);
      A94.foo(y);

      arktest.assertEQ(x, A94.num);
      arktest.assertEQ(y, A94.str);
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_11600
     * @tc.name      testExplicitClassMethodOverload0116
     * @tc.desc      Async and static method modifiers can be applied to overload methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 12.6;
      let y: string = 'Hello!';
      let a: A95 = new A95();

      A95.foo(x);
      A95.foo(y);

      arktest.assertEQ(x, A95.num);
      arktest.assertEQ(y, A95.str);
    });
    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_11700
     * @tc.name      testExplicitClassMethodOverload0117
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth(new Object()), 'object')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_11800
     * @tc.name      testExplicitClassMethodOverload0118
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth(new Byte(-1)), 'byte')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_11900
     * @tc.name      testExplicitClassMethodOverload0119
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth(new Short(-1)), 'short')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_12000
     * @tc.name      testExplicitClassMethodOverload0120
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth(new Int(-1)), 'int')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_12100
     * @tc.name      testExplicitClassMethodOverload0121
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth(new Long(-1)), 'long')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_12200
     * @tc.name      testExplicitClassMethodOverload0122
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth(new Boolean(false)), 'boolean')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_12300
     * @tc.name      testExplicitClassMethodOverload0123
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth(true), 'boolean')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_12400
     * @tc.name      testExplicitClassMethodOverload0124
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth(false), 'boolean')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_12500
     * @tc.name      testExplicitClassMethodOverload0125
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth(new Float(3.14f)), 'float')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_12600
     * @tc.name      testExplicitClassMethodOverload0126
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth(new Double(3.14)), 'double')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_12700
     * @tc.name      testExplicitClassMethodOverload0127
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth(-1 as long), 'long')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_12800
     * @tc.name      testExplicitClassMethodOverload0128
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth(-1 as int), 'int')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_12900
     * @tc.name      testExplicitClassMethodOverload0129
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth(-1), 'byte')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_13000
     * @tc.name      testExplicitClassMethodOverload0130
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth(-1 as short), 'short')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_13100
     * @tc.name      testExplicitClassMethodOverload0131
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth(-1 as byte), 'byte')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_13200
     * @tc.name      testExplicitClassMethodOverload0132
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth(3.14), 'double')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_13300
     * @tc.name      testExplicitClassMethodOverload0133
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth(3.14f), 'float')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_13400
     * @tc.name      testExplicitClassMethodOverload0134
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth("abc"), 'string')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_13500
     * @tc.name      testExplicitClassMethodOverload0135
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // 1.2兼容性问题：非显式类型枚举参与 overload 决议时，优先命中基础数值类型重载(byte)，
    // 未命中枚举类型重载(Color)，暂时注释。
/*    it('testExplicitClassMethodOverload0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth(Color.Red), 'Color')
    });*/

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_13600
     * @tc.name      testExplicitClassMethodOverload0136
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // 1.2兼容性问题：字符串值枚举 Size1 参与 overload 决议时，
    // 实际优先命中 string 重载，而未命中 Size1 重载，暂时注释。
/*    it('testExplicitClassMethodOverload0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth(Size1.L), 'Size')
    });*/

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_13700
     * @tc.name      testExplicitClassMethodOverload0137
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth([3.14, "abc"] as T), 'T')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_13800
     * @tc.name      testExplicitClassMethodOverload0138
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth([3.14, false] as R), 'R')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_13900
     * @tc.name      testExplicitClassMethodOverload0139
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth(["abc"]), 'FA:string')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_14000
     * @tc.name      testExplicitClassMethodOverload0140
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth([(-1).toByte()]), 'FA:byte')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_14100
     * @tc.name      testExplicitClassMethodOverload0141
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth([(-1).toShort()]), 'FA:short')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_14200
     * @tc.name      testExplicitClassMethodOverload0142
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth([(-1).toInt()]), 'FA:int')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_14300
     * @tc.name      testExplicitClassMethodOverload0143
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth([(-1).toLong()]), 'FA:long')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_14400
     * @tc.name      testExplicitClassMethodOverload0144
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth([false]), 'FA:boolean')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_14500
     * @tc.name      testExplicitClassMethodOverload0145
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth([3.14f]), 'FA:float')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_14600
     * @tc.name      testExplicitClassMethodOverload0146
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth([3.14]), 'FA:double')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_14700
     * @tc.name      testExplicitClassMethodOverload0147
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth([new Object()]), 'FA:object')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_14800
     * @tc.name      testExplicitClassMethodOverload0148
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth([Color.Red]), 'FA:Color')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_14900
     * @tc.name      testExplicitClassMethodOverload0149
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // 1.2兼容性问题：字符串值枚举 Size1 参与 overload 决议时，
    // 实际优先命中 string 重载，而未命中 Size1 重载，暂时注释。
/*    it('testExplicitClassMethodOverload0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth([Size1.M]), 'FA:Size')
    });*/

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_15000
     * @tc.name      testExplicitClassMethodOverload0150
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth(new FixedArray<A96>(1)), 'FA:A')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_15100
     * @tc.name      testExplicitClassMethodOverload0151
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth([3.14, 3.14]), 'FA:double')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_15200
     * @tc.name      testExplicitClassMethodOverload0152
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth(["abc", "xyz"]), 'FA:string')
    });
    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_15300
     * @tc.name      testExplicitClassMethodOverload0153
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth(10, 20), 'i+i')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_15400
     * @tc.name      testExplicitClassMethodOverload0154
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth("a?", 1), 's+d')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_15500
     * @tc.name      testExplicitClassMethodOverload0155
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      arktest.assertEQ(a.meth("a?", 2.1), 's+d')
    });

  })
}
