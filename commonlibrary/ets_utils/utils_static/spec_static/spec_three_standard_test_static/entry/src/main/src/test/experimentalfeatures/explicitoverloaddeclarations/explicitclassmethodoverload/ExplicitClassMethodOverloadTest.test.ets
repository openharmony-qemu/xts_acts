'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe,expect, it, Level, Size, TestType } from '../../../../../../hypium/index';

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
  static greetI(factory: () => G6, i: int): G6 {
    let g = factory();
    g.greeting = 'Hi ' + i + '!';
    return g;
  }
  static greetS(factory: () => G6, s: string): G6 {
    let g = factory();
    g.greeting = 'Hey ' + s + '!';
    return g;
  }
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
  static greetI(factory: () => G8, i: int): G8 {
    let g = factory();
    g.greeting = 'Hi ' + i + '!';
    return g;
  }
  static greetS(factory: () => G8, s: string): G8 {
    let g = factory();
    g.greeting = 'Hey ' + s + '!';
    return g;
  }
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
  static greetI(i: int): string { return 'Hi ' + i + '!' }
  static greetS(s: string): string { return 'Hey ' + s + '!' }
  static greetB(b: boolean): string { return b ? 'Hi!' : 'Bye!' }
  static overload $_invoke { greetI, greetS, greetB }
}

class G19 {
  static greetI(i: int): string { return 'Hi ' + i + '!' }
  static greetS(s: string): string { return 'Hey ' + s + '!' }
  static overload $_invoke { greetI, greetS }
}

class G20 extends G19 {
  static greetI(i: int): string { return 'Hi ' + i + '!' }
  static greetS(s: string): string { return 'Hey ' + s + '!' }
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
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_0200
     * @tc.name      testExplicitClassMethodOverload0001
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A = new A();

      expect(a.foo(12.6)).assertEqual('one');
      expect(a.foo('Hello!')).assertEqual('two');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_0300
     * @tc.name      testExplicitClassMethodOverload0002
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A1 = new A1();

      expect(a.foo(12.6)).assertEqual('one');
      expect(a.foo('Hello!')).assertEqual('two');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_0400
     * @tc.name      testExplicitClassMethodOverload0003
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A2 = new A2();

      expect(a.publicFoo(12.6)).assertEqual('one');
      expect(a.publicFoo('Hello!')).assertEqual('two');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_0500
     * @tc.name      testExplicitClassMethodOverload0004
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A3 = new A3();

      expect(a.publicFoo(12.6)).assertEqual('one');
      expect(a.publicFoo('Hello!')).assertEqual('two');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_0600
     * @tc.name      testExplicitClassMethodOverload0005
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A4 = new A4();

      expect(a.foo(12.6)).assertEqual('one');
      expect(a.foo('Hello!')).assertEqual('two');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_0700
     * @tc.name      testExplicitClassMethodOverload0006
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A5 = new A5();

      expect(a.foo(12.6)).assertEqual('one');
      expect(a.foo('Hello!')).assertEqual('two');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_0800
     * @tc.name      testExplicitClassMethodOverload0007
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A6 = new A6();

      expect(a.foo(12.6)).assertEqual('one');
      expect(a.foo('Hello!')).assertEqual('two');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_0900
     * @tc.name      testExplicitClassMethodOverload0008
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A7 = new A7();

      expect(a.foo(12.6)).assertEqual('one');
      expect(a.foo('Hello!')).assertEqual('two');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_1000
     * @tc.name      testExplicitClassMethodOverload0009
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A8 = new A8();

      expect(a.foo(12.6)).assertEqual('one');
      expect(a.foo('Hello!')).assertEqual('two');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_1100
     * @tc.name      testExplicitClassMethodOverload0010
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A9 = new A9();

      expect(a.foo(12.6)).assertEqual('one');
      expect(a.foo('Hello!')).assertEqual('two');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_1200
     * @tc.name      testExplicitClassMethodOverload0011
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A10 = new A10();

      expect(a.publicFoo(12.6)).assertEqual('one');
      expect(a.publicFoo('Hello!')).assertEqual('two');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_1300
     * @tc.name      testExplicitClassMethodOverload0012
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A11 = new A11();

      expect(a.publicFoo(12.6)).assertEqual('one');
      expect(a.publicFoo('Hello!')).assertEqual('two');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_1400
     * @tc.name      testExplicitClassMethodOverload0013
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A12 = new A12();

      expect(a.publicFoo(12.6)).assertEqual('one');
      expect(a.publicFoo('Hello!')).assertEqual('two');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_1500
     * @tc.name      testExplicitClassMethodOverload0014
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A13 = new A13();

      expect(a.publicFoo(12.6)).assertEqual('one');
      expect(a.publicFoo('Hello!')).assertEqual('two');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_1600
     * @tc.name      testExplicitClassMethodOverload0015
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A14 = new A14();

      expect(a.publicFoo(12.6)).assertEqual('one');
      expect(a.publicFoo('Hello!')).assertEqual('two');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_1700
     * @tc.name      testExplicitClassMethodOverload0016
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A15 = new A15();

      expect(a.publicFoo(12.6)).assertEqual('one');
      expect(a.publicFoo('Hello!')).assertEqual('two');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_1800
     * @tc.name      testExplicitClassMethodOverload0017
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A16 = new A16();

      expect(a.publicFoo(12.6)).assertEqual('one');
      expect(a.publicFoo('Hello!')).assertEqual('two');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_1900
     * @tc.name      testExplicitClassMethodOverload0018
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A17 = new A17();

      expect(a.publicFoo(12.6)).assertEqual('one');
      expect(a.publicFoo('Hello!')).assertEqual('two');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_2000
     * @tc.name      testExplicitClassMethodOverload0019
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A18 = new A18();

      expect(a.publicFoo(12.6)).assertEqual('one');
      expect(a.publicFoo('Hello!')).assertEqual('two');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_2100
     * @tc.name      testExplicitClassMethodOverload0020
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A19 = new A19();

      expect(a.publicFoo(12.6)).assertEqual('one');
      expect(a.publicFoo('Hello!')).assertEqual('two');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_2200
     * @tc.name      testExplicitClassMethodOverload0021
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A20 = new A20();

      expect(a.publicFoo(12.6)).assertEqual('one');
      expect(a.publicFoo('Hello!')).assertEqual('two');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_2300
     * @tc.name      testExplicitClassMethodOverload0022
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A21 = new A21();

      expect(a.publicFoo(12.6)).assertEqual('one');
      expect(a.publicFoo('Hello!')).assertEqual('two');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_2400
     * @tc.name      testExplicitClassMethodOverload0023
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A22 = new A22();

      expect(a.publicFoo(12.6)).assertEqual('one');
      expect(a.publicFoo('Hello!')).assertEqual('two');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_2500
     * @tc.name      testExplicitClassMethodOverload0024
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A23 = new A23();

      expect(a.publicFoo(12.6)).assertEqual('one');
      expect(a.publicFoo('Hello!')).assertEqual('two');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_2600
     * @tc.name      testExplicitClassMethodOverload0025
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A24 = new A24();

      expect(a.publicFoo(12.6)).assertEqual('one');
      expect(a.publicFoo('Hello!')).assertEqual('two');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_2700
     * @tc.name      testExplicitClassMethodOverload0026
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A25 = new A25();

      expect(a.publicFoo(12.6)).assertEqual('one');
      expect(a.publicFoo('Hello!')).assertEqual('two');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_2800
     * @tc.name      testExplicitClassMethodOverload0027
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A26 = new A26();

      expect(a.publicFoo(12.6)).assertEqual('one');
      expect(a.publicFoo('Hello!')).assertEqual('two');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_2900
     * @tc.name      testExplicitClassMethodOverload0028
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A27 = new A27();

      expect(a.publicFoo(12.6)).assertEqual('one');
      expect(a.publicFoo('Hello!')).assertEqual('two');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_3000
     * @tc.name      testExplicitClassMethodOverload0029
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A28 = new A28();

      expect(a.publicFoo(12.6)).assertEqual('one');
      expect(a.publicFoo('Hello!')).assertEqual('two');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_3100
     * @tc.name      testExplicitClassMethodOverload0030
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A29 = new A29();

      expect(a.publicFoo(12.6)).assertEqual('one');
      expect(a.publicFoo('Hello!')).assertEqual('two');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_3200
     * @tc.name      testExplicitClassMethodOverload0031
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A30 = new A30();

      expect(a.publicFoo(12.6)).assertEqual('one');
      expect(a.publicFoo('Hello!')).assertEqual('two');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_3300
     * @tc.name      testExplicitClassMethodOverload0032
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A31 = new A31();

      expect(a.publicFoo(12.6)).assertEqual('one');
      expect(a.publicFoo('Hello!')).assertEqual('two');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_3400
     * @tc.name      testExplicitClassMethodOverload0033
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A32 = new A32();
      expect(a.publicFoo(12.6)).assertEqual('one');
      expect(a.publicFoo('Hello!')).assertEqual('two');
    });
    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_3500
     * @tc.name      testExplicitClassMethodOverload0034
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B33 = new B33();
      expect(b.test()).assertEqual('f1f2f3');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_3600
     * @tc.name      testExplicitClassMethodOverload0035
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B34 = new B34();
      expect(b.test()).assertEqual('f1f2f3');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_3700
     * @tc.name      testExplicitClassMethodOverload0036
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B35 = new B35();
      expect(b.test()).assertEqual('f1f2f3');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_3800
     * @tc.name      testExplicitClassMethodOverload0037
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B36 = new B36();
      expect(b.test()).assertEqual('f1f2f3');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_3900
     * @tc.name      testExplicitClassMethodOverload0038
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B37 = new B37();
      expect(b.test()).assertEqual('f1f2f3');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_4000
     * @tc.name      testExplicitClassMethodOverload0039
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B38 = new B38();
      expect(b.test()).assertEqual('f1f2f3');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_4100
     * @tc.name      testExplicitClassMethodOverload0040
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B39 = new B39();
      expect(b.test()).assertEqual('f1f2f3');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_4200
     * @tc.name      testExplicitClassMethodOverload0041
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B40 = new B40();
      expect(b.test()).assertEqual('f1f2f3');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_4300
     * @tc.name      testExplicitClassMethodOverload0042
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B41 = new B41();
      expect(b.test()).assertEqual('f1f2f3');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_4400
     * @tc.name      testExplicitClassMethodOverload0043
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B42 = new B42();
      expect(b.test()).assertEqual('f1f2f3');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_4500
     * @tc.name      testExplicitClassMethodOverload0044
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B43 = new B43();
      expect(b.test()).assertEqual('f1f2f3');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_4700
     * @tc.name      testExplicitClassMethodOverload0046
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B45 = new B45();
      expect(b.test()).assertEqual('f1f2f3');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_4800
     * @tc.name      testExplicitClassMethodOverload0047
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B46 = new B46();
      expect(b.test()).assertEqual('f1f2f3');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_5000
     * @tc.name      testExplicitClassMethodOverload0049
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B48 = new B48();
      expect(b.test()).assertEqual('f1f2f3');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_5100
     * @tc.name      testExplicitClassMethodOverload0050
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B49 = new B49();
      expect(b.test()).assertEqual('f1f2f3');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_5200
     * @tc.name      testExplicitClassMethodOverload0051
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B50 = new B50();
      expect(b.test()).assertEqual('f1f2f3');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_5300
     * @tc.name      testExplicitClassMethodOverload0052
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B51 = new B51();
      expect(b.test()).assertEqual('f1f2f3');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_5400
     * @tc.name      testExplicitClassMethodOverload0053
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B52 = new B52();
      expect(b.test()).assertEqual('f1f2f3');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_5500
     * @tc.name      testExplicitClassMethodOverload0054
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B53 = new B53();
      expect(b.test()).assertEqual('f1f2f3');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_5600
     * @tc.name      testExplicitClassMethodOverload0055
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B54 = new B54();
      expect(b.test()).assertEqual('f1f2f3');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_5700
     * @tc.name      testExplicitClassMethodOverload0056
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B55 = new B55();
      expect(b.test()).assertEqual('f1f2f3');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_5800
     * @tc.name      testExplicitClassMethodOverload0057
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B56 = new B56();
      expect(b.test()).assertEqual('f1f2f3');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_5900
     * @tc.name      testExplicitClassMethodOverload0058
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B57 = new B57();
      expect(b.test()).assertEqual('f1f2f3');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_6000
     * @tc.name      testExplicitClassMethodOverload0059
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B58 = new B58();
      expect(b.test()).assertEqual('f1f2f3');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_6100
     * @tc.name      testExplicitClassMethodOverload0060
     * @tc.desc      Overload alias and overloaded methods can have different access modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B59 = new B59();
      expect(b.test()).assertEqual('f1f2f3');
    });
    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_6200
     * @tc.name      testExplicitClassMethodOverload0061
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g = G1(1);
      expect(g.greeting).assertEqual('Hi 1!');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_6300
     * @tc.name      testExplicitClassMethodOverload0062
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g = G3("Kim");
      expect(g.greeting).assertEqual('Hey Kim!');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_6400
     * @tc.name      testExplicitClassMethodOverload0063
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g = G6(10);
      expect(g.greeting).assertEqual('Hi 10!');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_6500
     * @tc.name      testExplicitClassMethodOverload0064
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g = G8("Mao");
      expect(g.greeting).assertEqual('Hey Mao!');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_6600
     * @tc.name      testExplicitClassMethodOverload0065
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g = G10(true);
      expect(g.greeting).assertEqual('Hi!');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_6700
     * @tc.name      testExplicitClassMethodOverload0066
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g = G12(false);
      expect(g.greeting).assertEqual('Bye!');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_6800
     * @tc.name      testExplicitClassMethodOverload0067
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_invoke'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(G13(1)).assertEqual('Hi 1!');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_6900
     * @tc.name      testExplicitClassMethodOverload0068
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_invoke'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(G15("Kim")).assertEqual('Hey Kim!');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_7000
     * @tc.name      testExplicitClassMethodOverload0069
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_invoke'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(G18(10)).assertEqual('Hi 10!');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_7100
     * @tc.name      testExplicitClassMethodOverload0070
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_invoke'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(G20("Mao")).assertEqual('Hey Mao!');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_7200
     * @tc.name      testExplicitClassMethodOverload0071
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_invoke'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(G22(true)).assertEqual('Hi!');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_7300
     * @tc.name      testExplicitClassMethodOverload0072
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_invoke'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(G24(false)).assertEqual('Bye!');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_7400
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

      expect(c[0]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_7500
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

      expect(c[1]).assertEqual(10);
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_7600
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

      expect(c['a']).assertEqual(20);
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_7700
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

      expect(c['']).assertEqual(30);
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_7800
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

      expect(c[3]).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_7900
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

      expect(c['b']).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_8000
     * @tc.name      testExplicitClassMethodOverload0103
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A84 = new A84();
      expect(a.foo(10.5)).assertEqual('f3');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_8100
     * @tc.name      testExplicitClassMethodOverload0105
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A86 = new A86();
      expect(a.foo(15)).assertEqual('f1');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_8200
     * @tc.name      testExplicitClassMethodOverload0106
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A87 = new A87();
      expect(a.foo(false)).assertEqual('f2');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_8300
     * @tc.name      testExplicitClassMethodOverload0107
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A88 = new A88();
      expect(a.foo(10.5)).assertEqual('f3');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TEST_8400
     * @tc.name      testExplicitClassMethodOverload0108
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A89 = new A89();
      expect(a.foo("Mao")).assertEqual('f4');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_0100
     * @tc.name      testExplicitClassMethodOverload0109
     * @tc.desc      'Methods with special names (see Indexable Types, Iterable Types, and Callable Types) can be overloaded like ordinary methods. Callable Types: $_instantiate'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A90 = new A90();
      expect(a.foo(8, 12)).assertEqual('f5');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_0200
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

      expect(A91.num).assertEqual(x);
      expect(A91.str).assertEqual(y);
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_0300
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
      expect(A92.num).assertEqual(x);
      expect(A92.str).assertEqual(y);
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_0400
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

      expect(A93.num).assertEqual(x);
      expect(A93.str).assertEqual(y);
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_0500
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

      expect(A94.num).assertEqual(x);
      expect(A94.str).assertEqual(y);
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_0600
     * @tc.name      testExplicitClassMethodOverload0116
     * @tc.desc      Async and static method modifiers can be applied to overload methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 12.6;
      let y: string = 'Hello!';
      A95.foo(x);
      A95.foo(y);
      expect(A95.num).assertEqual(x);
      expect(A95.str).assertEqual(y);
    });
    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_0700
     * @tc.name      testExplicitClassMethodOverload0117
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(new Object())).assertEqual('object')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_0800
     * @tc.name      testExplicitClassMethodOverload0118
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(new Byte(-1))).assertEqual('byte')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_0900
     * @tc.name      testExplicitClassMethodOverload0119
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(new Short(-1))).assertEqual('short')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_1000
     * @tc.name      testExplicitClassMethodOverload0120
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(new Int(-1))).assertEqual('int')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_1100
     * @tc.name      testExplicitClassMethodOverload0121
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(new Long(-1))).assertEqual('long')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_1200
     * @tc.name      testExplicitClassMethodOverload0122
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(new Boolean(false))).assertEqual('boolean')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_1300
     * @tc.name      testExplicitClassMethodOverload0123
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(true)).assertEqual('boolean')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_1400
     * @tc.name      testExplicitClassMethodOverload0124
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(false)).assertEqual('boolean')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_1500
     * @tc.name      testExplicitClassMethodOverload0125
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(new Float(3.14f))).assertEqual('float')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_1600
     * @tc.name      testExplicitClassMethodOverload0126
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(new Double(3.14))).assertEqual('double')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_1700
     * @tc.name      testExplicitClassMethodOverload0127
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(-1 as long)).assertEqual('long')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_1800
     * @tc.name      testExplicitClassMethodOverload0128
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(-1 as int)).assertEqual('int')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_1900
     * @tc.name      testExplicitClassMethodOverload0129
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(-1)).assertEqual('byte')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_2000
     * @tc.name      testExplicitClassMethodOverload0130
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(-1 as short)).assertEqual('short')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_2100
     * @tc.name      testExplicitClassMethodOverload0131
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(-1 as byte)).assertEqual('byte')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_2200
     * @tc.name      testExplicitClassMethodOverload0132
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(3.14)).assertEqual('double')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_2300
     * @tc.name      testExplicitClassMethodOverload0133
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(3.14f)).assertEqual('float')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_2400
     * @tc.name      testExplicitClassMethodOverload0134
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth("abc")).assertEqual('string')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_2500
     * @tc.name      testExplicitClassMethodOverload0137
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth([3.14, "abc"] as T)).assertEqual('T')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_2600
     * @tc.name      testExplicitClassMethodOverload0138
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth([3.14, false] as R)).assertEqual('R')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_2700
     * @tc.name      testExplicitClassMethodOverload0139
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(["abc"])).assertEqual('FA:string')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_2800
     * @tc.name      testExplicitClassMethodOverload0140
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth([(-1).toByte()])).assertEqual('FA:byte')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_2900
     * @tc.name      testExplicitClassMethodOverload0141
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth([(-1).toShort()])).assertEqual('FA:short')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_3000
     * @tc.name      testExplicitClassMethodOverload0142
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth([(-1).toInt()])).assertEqual('FA:int')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_3100
     * @tc.name      testExplicitClassMethodOverload0143
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth([(-1).toLong()])).assertEqual('FA:long')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_3200
     * @tc.name      testExplicitClassMethodOverload0144
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth([false])).assertEqual('FA:boolean')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_3300
     * @tc.name      testExplicitClassMethodOverload0145
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth([3.14f])).assertEqual('FA:float')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_3400
     * @tc.name      testExplicitClassMethodOverload0146
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth([3.14])).assertEqual('FA:double')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_3500
     * @tc.name      testExplicitClassMethodOverload0147
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth([new Object()])).assertEqual('FA:object')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_3600
     * @tc.name      testExplicitClassMethodOverload0148
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth([Color.Red])).assertEqual('FA:Color')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_3800
     * @tc.name      testExplicitClassMethodOverload0150
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(new FixedArray<A96>(1))).assertEqual('FA:A')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_3900
     * @tc.name      testExplicitClassMethodOverload0151
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth([3.14, 3.14])).assertEqual('FA:double')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_4000
     * @tc.name      testExplicitClassMethodOverload0152
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(["abc", "xyz"])).assertEqual('FA:string')
    });
    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_4100
     * @tc.name      testExplicitClassMethodOverload0153
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(10, 20)).assertEqual('i+i')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_4200
     * @tc.name      testExplicitClassMethodOverload0154
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth("a?", 1)).assertEqual('s+d')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_4300
     * @tc.name      testExplicitClassMethodOverload0155
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth("a?", 2.1)).assertEqual('s+d')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_4400
     * @tc.name      testExplicitClassMethodOverload0156
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(false, new X())).assertEqual('b+o?')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_4500
     * @tc.name      testExplicitClassMethodOverload0157
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(true, undefined)).assertEqual('b+o?')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_4600
     * @tc.name      testExplicitClassMethodOverload0158
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth((): void => { let i: int = 0 })).assertEqual('void-void')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_4700
     * @tc.name      testExplicitClassMethodOverload0159
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth((n: number): string => { return "n=" + n })).assertEqual('FF')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_4800
     * @tc.name      testExplicitClassMethodOverload0160
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth((p: string): int => { return p.length })).assertEqual('EE')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_4900
     * @tc.name      testExplicitClassMethodOverload0161
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(5, [new X(), new Y()])).assertEqual('i+o[]')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_5000
     * @tc.name      testExplicitClassMethodOverload0162
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth("abc", new X())).assertEqual('s+...o')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_5100
     * @tc.name      testExplicitClassMethodOverload0163
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth("abc", [new X()])).assertEqual('s+...o')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_5200
     * @tc.name      testExplicitClassMethodOverload0164
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth("abc", new X(), new Y())).assertEqual('s+...o')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_5300
     * @tc.name      testExplicitClassMethodOverload0165
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth("abc", new X(), new Y(), new Z())).assertEqual('s+...o')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_5400
     * @tc.name      testExplicitClassMethodOverload0166
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth("abc", [new X(), new Y()])).assertEqual('s+...o')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_5500
     * @tc.name      testExplicitClassMethodOverload0167
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(new X(), new Y())).assertEqual('X+Y')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_5600
     * @tc.name      testExplicitClassMethodOverload0168
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(new X(), new Z())).assertEqual('X+Y')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_5700
     * @tc.name      testExplicitClassMethodOverload0169
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(new Y(), new X())).assertEqual('objects')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_5800
     * @tc.name      testExplicitClassMethodOverload0170
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(new Y(), new Z())).assertEqual('Y+Z')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_5900
     * @tc.name      testExplicitClassMethodOverload0171
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(new Z(), new X())).assertEqual('objects')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_6000
     * @tc.name      testExplicitClassMethodOverload0172
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(new Z(), new Y())).assertEqual('X+Y')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_6100
     * @tc.name      testExplicitClassMethodOverload0173
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(new X())).assertEqual('X')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_6200
     * @tc.name      testExplicitClassMethodOverload0174
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(new Y())).assertEqual('X')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_6300
     * @tc.name      testExplicitClassMethodOverload0175
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(new Z())).assertEqual('Z')
    });
    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_6400
     * @tc.name      testExplicitClassMethodOverload0176
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth(10, 1.1, "new X()", true)).assertEqual('objects')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_6500
     * @tc.name      testExplicitClassMethodOverload0177
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A96 = new A96();
      expect(a.meth((v: number): void => { let k: int = 5; })).assertEqual('number-void')
    });
    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_6600
     * @tc.name      testExplicitClassMethodOverload0178
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Aabstract class tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A97 = new A97();
      let value: Object = new Object();
      expect(a.meth(value)).assertEqual('object')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_6700
     * @tc.name      testExplicitClassMethodOverload0179
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Aabstract class tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A97 = new A97();
      let value: Byte = new Byte(-1);
      expect(a.meth(value)).assertEqual('int')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_6800
     * @tc.name      testExplicitClassMethodOverload0180
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Aabstract class tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A97 = new A97();
      let value: Short = new Short(-1);
      expect(a.meth(value)).assertEqual('int')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_6900
     * @tc.name      testExplicitClassMethodOverload0181
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Aabstract class tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A97 = new A97();
      let value: Int = new Int(-1);
      expect(a.meth(value)).assertEqual('int')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_7000
     * @tc.name      testExplicitClassMethodOverload0182
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Aabstract class tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A97 = new A97();
      let value: Long = new Long(-1);
      expect(a.meth(value)).assertEqual('double')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_7100
     * @tc.name      testExplicitClassMethodOverload0183
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Aabstract class tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A97 = new A97();
      let value: Boolean = false;
      expect(a.meth(value)).assertEqual('boolean')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_7200
     * @tc.name      testExplicitClassMethodOverload0184
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Aabstract class tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A97 = new A97();
      let value: Float = new Float(3.14f);
      expect(a.meth(value)).assertEqual('double')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_7300
     * @tc.name      testExplicitClassMethodOverload0185
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Aabstract class tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A97 = new A97();
      let value: Number = new Double(3.14);
      expect(a.meth(value)).assertEqual('double')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_7400
     * @tc.name      testExplicitClassMethodOverload0186
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Aabstract class tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A97 = new A97();
      let value: String = "abc";
      expect(a.meth(value)).assertEqual('string')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_7600
     * @tc.name      testExplicitClassMethodOverload0188
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Aabstract class tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A97 = new A97();
      let value: T1 = [3.14, "abc"];
      expect(a.meth(value)).assertEqual('T')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_7700
     * @tc.name      testExplicitClassMethodOverload0189
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Aabstract class tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A97 = new A97();
      let value: R1 = [14, false];
      expect(a.meth(value)).assertEqual('R')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_7800
     * @tc.name      testExplicitClassMethodOverload0190
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Aabstract class tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A97 = new A97();
      let value: boolean = false;
      expect(a.meth([value])).assertEqual('object')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_7900
     * @tc.name      testExplicitClassMethodOverload0191
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Aabstract class tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A97 = new A97();
      let value: string = "abc";
      expect(a.meth([value, "xyz"])).assertEqual('object')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_8000
     * @tc.name      testExplicitClassMethodOverload0192
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Aabstract class tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A97 = new A97();
      let value: int = 10;
      expect(a.meth(value, 20)).assertEqual('i+i')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_8100
     * @tc.name      testExplicitClassMethodOverload0193
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Aabstract class tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A97 = new A97();
      let value: int = 1;
      expect(a.meth("a?", value)).assertEqual('objects')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_8200
     * @tc.name      testExplicitClassMethodOverload0194
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Aabstract class tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A97 = new A97();
      let value: boolean = false;
      expect(a.meth(value, Color1.Blue)).assertEqual('b+o?')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_8300
     * @tc.name      testExplicitClassMethodOverload0195
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Aabstract class tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A97 = new A97();
      let value: boolean = true;
      expect(a.meth(value, undefined)).assertEqual('b+o?')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_8400
     * @tc.name      testExplicitClassMethodOverload0196
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Aabstract class tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A97 = new A97();
      let value: SN = "ABC";
      expect(a.meth(value)).assertEqual('string')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_8500
     * @tc.name      testExplicitClassMethodOverload0197
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Aabstract class tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A97 = new A97();
      let value: SN = null;
      expect(a.meth(value)).assertEqual('SN')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_8600
     * @tc.name      testExplicitClassMethodOverload0198
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Aabstract class tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A97 = new A97();
      let value: SU = "ABC";
      expect(a.meth(value)).assertEqual('string')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_8700
     * @tc.name      testExplicitClassMethodOverload0199
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Aabstract class tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A97 = new A97();
      let value: SU = undefined;
      expect(a.meth(value)).assertEqual('SU')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_8800
     * @tc.name      testExplicitClassMethodOverload0200
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Aabstract class tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A97 = new A97();
      let value: SNU = "ABC";
      expect(a.meth(value)).assertEqual('string')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_8900
     * @tc.name      testExplicitClassMethodOverload0201
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Aabstract class tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A97 = new A97();
      let value: SNU = null;
      expect(a.meth(value)).assertEqual('SN')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_9000
     * @tc.name      testExplicitClassMethodOverload0202
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Aabstract class tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A97 = new A97();
      let value: SNU = undefined;
      expect(a.meth(value)).assertEqual('SU')
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_9100
     * @tc.name      testExplicitClassMethodOverload0203
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Aabstract class tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A97 = new A97();
      let value: FixedArray<boolean> = [false];
      expect(a.meth(value)).assertEqual('object')
    });
    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_9200
     * @tc.name      testExplicitClassMethodOverload0204
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Special tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A98 = new A98();
      expect(a.meth(1)).assertEqual('int');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_9300
     * @tc.name      testExplicitClassMethodOverload0205
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Special tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A98 = new A98();
      expect(a.meth(42, a)).assertEqual('i+o');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_9400
     * @tc.name      testExplicitClassMethodOverload0206
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Special tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A98 = new A98();
      expect(a.meth(42, a, undefined)).assertEqual('i+o+o?');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_9500
     * @tc.name      testExplicitClassMethodOverload0207
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Special tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A98 = new A98();
      expect(a.meth(12, a, a)).assertEqual('i+o+o?');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_9600
     * @tc.name      testExplicitClassMethodOverload0208
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Special tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A98 = new A98();
      expect(a.meth(61, 2.0)).assertEqual('i+o');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_9700
     * @tc.name      testExplicitClassMethodOverload0209
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Special tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A98 = new A98();
      expect(a.meth(11, [12], 15e23)).assertEqual('i+o+o?');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_9800
     * @tc.name      testExplicitClassMethodOverload0210
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Special tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A98 = new A98();
      expect(a.meth(2, [1.98, 88])).assertEqual('i+o');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_ONE_TEST_9900
     * @tc.name      testExplicitClassMethodOverload0211
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Special tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A98 = new A98();
      expect(a.meth(3, "abc", [18.0])).assertEqual('i+o+o?');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_0100
     * @tc.name      testExplicitClassMethodOverload0212
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Special tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A98 = new A98();
      expect(a.meth(3, 2, 1)).assertEqual('i+o+o?');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_0200
     * @tc.name      testExplicitClassMethodOverload0213
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Special tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A98 = new A98();
      expect(a.meth(3.6)).assertEqual('object');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_0300
     * @tc.name      testExplicitClassMethodOverload0214
     * @tc.desc      Method overload declaration allows declaring an overload alias as a class member
     *               for a set of static or instance methods. Special tests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A98 = new A98();
      expect(a.meth("abc")).assertEqual('object');
    });
    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_0400
     * @tc.name      testExplicitClassMethodOverload0215
     * @tc.desc      If a class has an overload declaration, then the overload declaration can be
     *               overridden in a subclass. If a subclass has no overload declaration, then the declaration
     *               from the superclass in used. If a subclass has an overload declaration, then the
     *               overload declaration must list all methods overloaded in a superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B3 = new B3();
      expect(b.foo(5)).assertEqual('B.fooN');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_0500
     * @tc.name      testExplicitClassMethodOverload0216
     * @tc.desc      If a class has an overload declaration, then the overload declaration can be
     *               overridden in a subclass. If a subclass has no overload declaration, then the declaration
     *               from the superclass in used. If a subclass has an overload declaration, then the
     *               overload declaration must list all methods overloaded in a superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B3 = new B3();
      expect(b.foo(1.1)).assertEqual('B.fooN');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_0600
     * @tc.name      testExplicitClassMethodOverload0217
     * @tc.desc      If a class has an overload declaration, then the overload declaration can be
     *               overridden in a subclass. If a subclass has no overload declaration, then the declaration
     *               from the superclass in used. If a subclass has an overload declaration, then the
     *               overload declaration must list all methods overloaded in a superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B3 = new B3();
      expect(b.foo('Hi')).assertEqual('A.fooS');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_0700
     * @tc.name      testExplicitClassMethodOverload0218
     * @tc.desc      If a class has an overload declaration, then the overload declaration can be
     *               overridden in a subclass. If a subclass has no overload declaration, then the declaration
     *               from the superclass in used. If a subclass has an overload declaration, then the
     *               overload declaration must list all methods overloaded in a superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B4 = new B4();
      expect(b.foo(5)).assertEqual('B.fooN');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_0800
     * @tc.name      testExplicitClassMethodOverload0219
     * @tc.desc      If a class has an overload declaration, then the overload declaration can be
     *               overridden in a subclass. If a subclass has no overload declaration, then the declaration
     *               from the superclass in used. If a subclass has an overload declaration, then the
     *               overload declaration must list all methods overloaded in a superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B4 = new B4();
      expect(b.foo(1.1)).assertEqual('B.fooN');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_0900
     * @tc.name      testExplicitClassMethodOverload0220
     * @tc.desc      If a class has an overload declaration, then the overload declaration can be
     *               overridden in a subclass. If a subclass has no overload declaration, then the declaration
     *               from the superclass in used. If a subclass has an overload declaration, then the
     *               overload declaration must list all methods overloaded in a superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B4 = new B4();
      expect(b.foo('Hi')).assertEqual('A.fooS');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_1000
     * @tc.name      testExplicitClassMethodOverload0221
     * @tc.desc      If a class has an overload declaration, then the overload declaration can be
     *               overridden in a subclass. If a subclass has no overload declaration, then the declaration
     *               from the superclass in used. If a subclass has an overload declaration, then the
     *               overload declaration must list all methods overloaded in a superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B5 = new B5();
      expect(b.foo(5)).assertEqual('B.fooI');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_1100
     * @tc.name      testExplicitClassMethodOverload0222
     * @tc.desc      If a class has an overload declaration, then the overload declaration can be
     *               overridden in a subclass. If a subclass has no overload declaration, then the declaration
     *               from the superclass in used. If a subclass has an overload declaration, then the
     *               overload declaration must list all methods overloaded in a superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B5 = new B5();
      expect(b.foo(1.1)).assertEqual('B.fooN');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_1200
     * @tc.name      testExplicitClassMethodOverload0223
     * @tc.desc      If a class has an overload declaration, then the overload declaration can be
     *               overridden in a subclass. If a subclass has no overload declaration, then the declaration
     *               from the superclass in used. If a subclass has an overload declaration, then the
     *               overload declaration must list all methods overloaded in a superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B5 = new B5();
      expect(b.foo('Hi')).assertEqual('A.fooS');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_1300
     * @tc.name      testExplicitClassMethodOverload0224
     * @tc.desc      If a class has an overload declaration, then the overload declaration can be
     *               overridden in a subclass. If a subclass has no overload declaration, then the declaration
     *               from the superclass in used. If a subclass has an overload declaration, then the
     *               overload declaration must list all methods overloaded in a superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B6 = new B6();
      expect(b.foo(5)).assertEqual('B.fooI');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_1400
     * @tc.name      testExplicitClassMethodOverload0225
     * @tc.desc      If a class has an overload declaration, then the overload declaration can be
     *               overridden in a subclass. If a subclass has no overload declaration, then the declaration
     *               from the superclass in used. If a subclass has an overload declaration, then the
     *               overload declaration must list all methods overloaded in a superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B6 = new B6();
      expect(b.foo(1.1)).assertEqual('B.fooN');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_1500
     * @tc.name      testExplicitClassMethodOverload0226
     * @tc.desc      If a class has an overload declaration, then the overload declaration can be
     *               overridden in a subclass. If a subclass has no overload declaration, then the declaration
     *               from the superclass in used. If a subclass has an overload declaration, then the
     *               overload declaration must list all methods overloaded in a superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B6 = new B6();
      expect(b.foo('Hi')).assertEqual('A.fooS');
    });
    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_1600
     * @tc.name      testExplicitClassMethodOverload0227
     * @tc.desc      If a class has an overload declaration, then the overload declaration can be
     *               overridden in a subclass. If a subclass has no overload declaration, then the declaration
     *               from the superclass in used. If a subclass has an overload declaration, then the
     *               overload declaration must list all methods overloaded in a superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B7 = new B7();
      expect(b.foo(5)).assertEqual('B.fooN');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_1700
     * @tc.name      testExplicitClassMethodOverload0228
     * @tc.desc      If a class has an overload declaration, then the overload declaration can be
     *               overridden in a subclass. If a subclass has no overload declaration, then the declaration
     *               from the superclass in used. If a subclass has an overload declaration, then the
     *               overload declaration must list all methods overloaded in a superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B7 = new B7();
      expect(b.foo(1.1)).assertEqual('B.fooN');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_1800
     * @tc.name      testExplicitClassMethodOverload0229
     * @tc.desc      If a class has an overload declaration, then the overload declaration can be
     *               overridden in a subclass. If a subclass has no overload declaration, then the declaration
     *               from the superclass in used. If a subclass has an overload declaration, then the
     *               overload declaration must list all methods overloaded in a superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B7 = new B7();
      expect(b.foo('Hi')).assertEqual('A.fooS');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_1900
     * @tc.name      testExplicitClassMethodOverload0230
     * @tc.desc      If a class has an overload declaration, then the overload declaration can be
     *               overridden in a subclass. If a subclass has no overload declaration, then the declaration
     *               from the superclass in used. If a subclass has an overload declaration, then the
     *               overload declaration must list all methods overloaded in a superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B8 = new B8();
      expect(b.foo(5)).assertEqual('B.fooN');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_2000
     * @tc.name      testExplicitClassMethodOverload0231
     * @tc.desc      If a class has an overload declaration, then the overload declaration can be
     *               overridden in a subclass. If a subclass has no overload declaration, then the declaration
     *               from the superclass in used. If a subclass has an overload declaration, then the
     *               overload declaration must list all methods overloaded in a superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B8 = new B8();
      expect(b.foo(1.1)).assertEqual('B.fooN');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_2100
     * @tc.name      testExplicitClassMethodOverload0232
     * @tc.desc      If a class has an overload declaration, then the overload declaration can be
     *               overridden in a subclass. If a subclass has no overload declaration, then the declaration
     *               from the superclass in used. If a subclass has an overload declaration, then the
     *               overload declaration must list all methods overloaded in a superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B8 = new B8();
      expect(b.foo('Hi')).assertEqual('A.fooS');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_2500
     * @tc.name      testExplicitClassMethodOverload0236
     * @tc.desc      If a class has an overload declaration, then the overload declaration can be
     *               overridden in a subclass. If a subclass has no overload declaration, then the declaration
     *               from the superclass in used. If a subclass has an overload declaration, then the
     *               overload declaration must list all methods overloaded in a superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B8 = new B8();
      expect(b.f2(5)).assertEqual('B.fooI');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_2600
     * @tc.name      testExplicitClassMethodOverload0237
     * @tc.desc      If a class has an overload declaration, then the overload declaration can be
     *               overridden in a subclass. If a subclass has no overload declaration, then the declaration
     *               from the superclass in used. If a subclass has an overload declaration, then the
     *               overload declaration must list all methods overloaded in a superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B9 = new B9();
      expect(b.f2(1.1)).assertEqual('B.fooN');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_2800
     * @tc.name      testExplicitClassMethodOverload0239
     * @tc.desc      If a class has an overload declaration, then the overload declaration can be
     *               overridden in a subclass. If a subclass has no overload declaration, then the declaration
     *               from the superclass in used. If a subclass has an overload declaration, then the
     *               overload declaration must list all methods overloaded in a superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B10 = new B10();
      expect(b.f2('Hi')).assertEqual('A.fooS');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_2900
     * @tc.name      testExplicitClassMethodOverload0240
     * @tc.desc      If a class has an overload declaration, then the overload declaration can be
     *               overridden in a subclass. If a subclass has no overload declaration, then the declaration
     *               from the superclass in used. If a subclass has an overload declaration, then the
     *               overload declaration must list all methods overloaded in a superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B11 = new B11();
      expect(b.f2(5)).assertEqual('B.fooI');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_3000
     * @tc.name      testExplicitClassMethodOverload0241
     * @tc.desc      If a class has an overload declaration, then the overload declaration can be
     *               overridden in a subclass. If a subclass has no overload declaration, then the declaration
     *               from the superclass in used. If a subclass has an overload declaration, then the
     *               overload declaration must list all methods overloaded in a superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B11 = new B11();
      expect(b.f2(1.1)).assertEqual('B.fooN');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_3100
     * @tc.name      testExplicitClassMethodOverload0242
     * @tc.desc      If a class has an overload declaration, then the overload declaration can be
     *               overridden in a subclass. If a subclass has no overload declaration, then the declaration
     *               from the superclass in used. If a subclass has an overload declaration, then the
     *               overload declaration must list all methods overloaded in a superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B12 = new B12();
      expect(b.f2(5)).assertEqual('B.fooI');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_3200
     * @tc.name      testExplicitClassMethodOverload0243
     * @tc.desc      If a class has an overload declaration, then the overload declaration can be
     *               overridden in a subclass. If a subclass has no overload declaration, then the declaration
     *               from the superclass in used. If a subclass has an overload declaration, then the
     *               overload declaration must list all methods overloaded in a superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B12 = new B12();
      expect(b.f2('Hi')).assertEqual('A.fooS');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_3300
     * @tc.name      testExplicitClassMethodOverload0244
     * @tc.desc      If a class has an overload declaration, then the overload declaration can be
     *               overridden in a subclass. If a subclass has no overload declaration, then the declaration
     *               from the superclass in used. If a subclass has an overload declaration, then the
     *               overload declaration must list all methods overloaded in a superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B13 = new B13();
      expect(b.f2(5)).assertEqual('B.fooI');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_3400
     * @tc.name      testExplicitClassMethodOverload0245
     * @tc.desc      If a class has an overload declaration, then the overload declaration can be
     *               overridden in a subclass. If a subclass has no overload declaration, then the declaration
     *               from the superclass in used. If a subclass has an overload declaration, then the
     *               overload declaration must list all methods overloaded in a superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B13 = new B13();
      expect(b.f2(1.1)).assertEqual('B.fooN');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_3500
     * @tc.name      testExplicitClassMethodOverload0246
     * @tc.desc      If a class has an overload declaration, then the overload declaration can be
     *               overridden in a subclass. If a subclass has no overload declaration, then the declaration
     *               from the superclass in used. If a subclass has an overload declaration, then the
     *               overload declaration must list all methods overloaded in a superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B13 = new B13();
      expect(b.f2('Hi')).assertEqual('A.fooS');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_3600
     * @tc.name      testExplicitClassMethodOverload0247
     * @tc.desc      If a class has an overload declaration, then the overload declaration can be
     *               overridden in a subclass. If a subclass has no overload declaration, then the declaration
     *               from the superclass in used. If a subclass has an overload declaration, then the
     *               overload declaration must list all methods overloaded in a superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B13 = new B13();
      expect(b.foo(5)).assertEqual('B.fooN');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_3700
     * @tc.name      testExplicitClassMethodOverload0248
     * @tc.desc      If a class has an overload declaration, then the overload declaration can be
     *               overridden in a subclass. If a subclass has no overload declaration, then the declaration
     *               from the superclass in used. If a subclass has an overload declaration, then the
     *               overload declaration must list all methods overloaded in a superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B13 = new B13();
      expect(b.foo(1.1)).assertEqual('B.fooN');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_3800
     * @tc.name      testExplicitClassMethodOverload0249
     * @tc.desc      If a class has an overload declaration, then the overload declaration can be
     *               overridden in a subclass. If a subclass has no overload declaration, then the declaration
     *               from the superclass in used. If a subclass has an overload declaration, then the
     *               overload declaration must list all methods overloaded in a superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B13 = new B13();
      expect(b.foo('Hi')).assertEqual('A.fooS');
    });
    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_3900
     * @tc.name      testExplicitClassMethodOverload0250
     * @tc.desc      Inheritance of overload declaration.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A100 = new A100();
      let b: B14 = new B14();
      let c: C10 = new C10();
      expect(a.foo(1)).assertEqual('A.fooN');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_4000
     * @tc.name      testExplicitClassMethodOverload0251
     * @tc.desc      Inheritance of overload declaration.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A100 = new A100();
      let b: B14 = new B14();
      let c: C10 = new C10();
      expect(a.foo(2.2)).assertEqual('A.fooN');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_4100
     * @tc.name      testExplicitClassMethodOverload0252
     * @tc.desc      Inheritance of overload declaration.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A100 = new A100();
      let b: B14 = new B14();
      let c: C10 = new C10();
      expect(a.foo('Hi!')).assertEqual('A.fooS');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_4200
     * @tc.name      testExplicitClassMethodOverload0253
     * @tc.desc      Inheritance of overload declaration.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A100 = new A100();
      let b: B14 = new B14();
      let c: C10 = new C10();
      expect(b.foo(1)).assertEqual('B.fooN');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_4300
     * @tc.name      testExplicitClassMethodOverload0254
     * @tc.desc      Inheritance of overload declaration.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A100 = new A100();
      let b: B14 = new B14();
      let c: C10 = new C10();
      expect(b.foo(2.2)).assertEqual('B.fooN');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_4400
     * @tc.name      testExplicitClassMethodOverload0255
     * @tc.desc      Inheritance of overload declaration.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A100 = new A100();
      let b: B14 = new B14();
      let c: C10 = new C10();
      expect(b.foo('Hi!')).assertEqual('A.fooS');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_4500
     * @tc.name      testExplicitClassMethodOverload0256
     * @tc.desc      Inheritance of overload declaration.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A100 = new A100();
      let b: B14 = new B14();
      let c: C10 = new C10();
      expect(c.foo(1)).assertEqual('C.fooI');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_4600
     * @tc.name      testExplicitClassMethodOverload0257
     * @tc.desc      Inheritance of overload declaration.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A100 = new A100();
      let b: B14 = new B14();
      let c: C10 = new C10();
      expect(c.foo(2.2)).assertEqual('A.fooN');
    });

    /**
     * @tc.number    SUB_EXPLICIT_CLASS_METHOD_OVERLOAD_TWO_TEST_4700
     * @tc.name      testExplicitClassMethodOverload0258
     * @tc.desc      Inheritance of overload declaration.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitClassMethodOverload0258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A100 = new A100();
      let b: B14 = new B14();
      let c: C10 = new C10();
      expect(c.foo('Hi!')).assertEqual('A.fooS');
    });
  })
}
