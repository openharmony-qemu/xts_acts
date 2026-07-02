'use static';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class A {}
let f = (this: A): void => {}

class A1 {}
let f1 = (this: A1): void => {}

interface I {}
let f2 = (this: I): void => {}

interface I1 {}
let f3 = (this: I1): void => {}

let f4 = (this: number[]): void => {}

let f5 = (this: number[]): void => {}

class A2 {
  f6(): string { return "A" }
}
class B {
  a: A2
  constructor(a: A2) {
    this.a = a
  }
  f7 = (this: A2): string => { return this.f6() }
}

class A3 {
  f8(): string { return "A" }
}
class B1 {
  f9 = (this: B1, a: A3): string => { return a.f8() }
}

class A4 {
  f10(): string { return "A" }
}
class B2 {
  f11 = (this: A4): string => { return this.f10() }
}

class A5 {
  f12(): string { return "A" }
}
interface I2 {
  f13: (this: A5) => string
}

let f14 = (this: Number): void => {}

let f15 = (this: Number): void => {}

interface I3 {}
let f16 = (this: I3): void => {}

interface I4 {}
let f17 = (this: I4): void => {}

let f18 = (this: number): void => {}

let f19 = (this: number): void => {}

let f20 = (this: byte): void => {}

let f21 = (this: byte): void => {}

let f22 = (this: short): void => {}

let f23 = (this: short): void => {}

let f24 = (this: int): void => {}

let f25 = (this: int): void => {}

let f26 = (this: long): void => {}

let f27 = (this: long): void => {}

let f28 = (this: bigint): void => {}

let f29 = (this: bigint): void => {}

let f30 = (this: float): void => {}

let f31 = (this: float): void => {}

let f32 = (this: double): void => {}

let f33 = (this: double): void => {}

let f34 = (this: boolean): void => {}

let f35 = (this: boolean): void => {}

let f36 = (this: string): void => {}

let f37 = (this: string): void => {}

let f38 = (this: char): void => {}

let f39 = (this: char): void => {}

let f40 = (this: Function): void => {}

let f41 = (this: Function): void => {}

export default function LambdaExpressionsWithReceiverTest(): void {
  describe('LambdaExpressionsWithReceiverTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_0700
     * @tc.name      testLambdaExpressionsWithReceiver0007
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A2 = new A2()
      let b: B = new B(a)
      expect(b.f7(a)).assertEqual("A")
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_0800
     * @tc.name      testLambdaExpressionsWithReceiver0008
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A3 = new A3()
      let b: B1 = new B1()
      expect(b.f9(b, a)).assertEqual("A")
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_0900
     * @tc.name      testLambdaExpressionsWithReceiver0009
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A4 = new A4()
      let b: B2 = new B2()
      expect(b.f11(a)).assertEqual("A")
      expect(a.f10()).assertEqual("A")
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_1000
     * @tc.name      testLambdaExpressionsWithReceiver0010
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A5 = new A5()
      let i: I2 = { f13: (this: A5): string => { return this.f12() } }
      expect(i.f13(a)).assertEqual("A")
    });
  })
}