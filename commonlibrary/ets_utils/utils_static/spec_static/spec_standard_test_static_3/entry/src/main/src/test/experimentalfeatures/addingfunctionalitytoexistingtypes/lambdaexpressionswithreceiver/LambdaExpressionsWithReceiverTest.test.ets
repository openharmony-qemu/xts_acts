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
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_0100
     * @tc.name      testLambdaExpressionsWithReceiver0001
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A = new A()
      f(a)
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_0200
     * @tc.name      testLambdaExpressionsWithReceiver0002
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A1 = new A1()
      a.f1()
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_0300
     * @tc.name      testLambdaExpressionsWithReceiver0003
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: I = {}
      f2(i)
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_0400
     * @tc.name      testLambdaExpressionsWithReceiver0004
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: I1 = {}
      i.f3()
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_0500
     * @tc.name      testLambdaExpressionsWithReceiver0005
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: number[] = [0, 1]
      n.f4()
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_0600
     * @tc.name      testLambdaExpressionsWithReceiver0006
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: number[] = [0, 1]
      f5(n)
    });

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

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_1100
     * @tc.name      testLambdaExpressionsWithReceiver0011
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: Number = 1
      f14(n)
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_1200
     * @tc.name      testLambdaExpressionsWithReceiver0012
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: Number = 1
      n.f15()
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_1300
     * @tc.name      testLambdaExpressionsWithReceiver0013
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: I3 = {}
      f16(i)
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_1400
     * @tc.name      testLambdaExpressionsWithReceiver0014
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: I4 = {}
      i.f17()
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_1500
     * @tc.name      testLambdaExpressionsWithReceiver0015
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: number = 1
      f18(n)
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_1600
     * @tc.name      testLambdaExpressionsWithReceiver0016
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: number = 1
      n.f19()
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_1700
     * @tc.name      testLambdaExpressionsWithReceiver0017
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: byte = 1
      f20(n)
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_1800
     * @tc.name      testLambdaExpressionsWithReceiver0018
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: byte = 1
      n.f21()
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_1900
     * @tc.name      testLambdaExpressionsWithReceiver0019
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: short = 1
      f22(n)
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_2000
     * @tc.name      testLambdaExpressionsWithReceiver0020
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: short = 1
      n.f23()
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_2100
     * @tc.name      testLambdaExpressionsWithReceiver0021
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: int = 1
      f24(n)
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_2200
     * @tc.name      testLambdaExpressionsWithReceiver0022
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: int = 1
      n.f25()
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_2300
     * @tc.name      testLambdaExpressionsWithReceiver0023
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: long = 1
      f26(n)
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_2400
     * @tc.name      testLambdaExpressionsWithReceiver0024
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: long = 1
      n.f27()
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_2500
     * @tc.name      testLambdaExpressionsWithReceiver0025
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: bigint = 1n
      f28(n)
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_2600
     * @tc.name      testLambdaExpressionsWithReceiver0026
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: bigint = 1n
      n.f29()
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_2700
     * @tc.name      testLambdaExpressionsWithReceiver0027
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: float = 1.0f
      f30(n)
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_2800
     * @tc.name      testLambdaExpressionsWithReceiver0028
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: float = 1.0f
      n.f31()
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_2900
     * @tc.name      testLambdaExpressionsWithReceiver0029
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: double = 1.0
      f32(n)
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_3000
     * @tc.name      testLambdaExpressionsWithReceiver0030
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: double = 1.0
      n.f33()
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_3100
     * @tc.name      testLambdaExpressionsWithReceiver0031
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: boolean = true
      f34(n)
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_3200
     * @tc.name      testLambdaExpressionsWithReceiver0032
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: boolean = true
      n.f35()
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_3300
     * @tc.name      testLambdaExpressionsWithReceiver0033
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: string = "abc"
      f36(n)
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_3400
     * @tc.name      testLambdaExpressionsWithReceiver0034
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: string = "abc"
      n.f37()
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_3500
     * @tc.name      testLambdaExpressionsWithReceiver0035
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: char = c'a'
      f38(n)
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_3600
     * @tc.name      testLambdaExpressionsWithReceiver0036
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: char = c'a'
      n.f39()
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_3700
     * @tc.name      testLambdaExpressionsWithReceiver0037
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: Function = (): void => {}
      f40(n)
    });

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSIONS_WITH_RECEIVER_3800
     * @tc.name      testLambdaExpressionsWithReceiver0038
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level Declarations) that looks almost the same as Function Declarations, except that the first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLambdaExpressionsWithReceiver0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: Function = (): void => {}
      n.f41()
    });
  })
}