import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
class Neg<T extends number> {
  constructor (x: T) {}
}

class Pos<T extends number> {
  constructor (x: T) {}
}

class A1 {
  field: number;
  constructor(a: number) {
    this.field = a;
  }

  bar1(callee: number): number {
    return callee;
  }
}

function foo1(callee: number): number {
  return callee;
}
class A2{
  field: number;
  constructor(a: number) {
    this.field = a;
  }

  bar2(callee: number): number {
    return callee;
  }
}

function foo2(callee: number): number {
  return callee;
}

class A3 {
  field: number;
  constructor(a: number) {
    this.field = a;
  }

  bar3(callee: number): number {
    return callee;
  }
}

function foo3(callee: number): number {
  return callee;
}
class A4 {
  field: number;
  constructor(a: number) {
    this.field = a;
  }

  bar4(callee: number): number {
    return callee;
  }
}

function foo4(callee: number): number {
  return callee;
}
class A5 {
  field: number;
  constructor(a: number) {
    this.field = a;
  }

  bar5(callee: number): number {
    return callee;
  }
}

function foo5(callee: number): number {
  return callee;
}

class A6 {
  field: number;
  constructor(a: number) {
    this.field = a;
  }

  bar6(callee: number): number {
    return callee;
  }
}

function foo6(callee: number): number {
  return callee;
}

class A7 {
  field: number;
  constructor(a: number) {
    this.field = a;
  }

  bar7(callee: number): number {
    return callee;
  }
}

function foo7(callee: number): number {
  return callee;
}

class A8 {
  field: number;
  constructor(a: number) {
    this.field = a;
  }

  bar8(callee: number): number {
    return callee;
  }
}

function foo8(callee: number): number {
  return callee;
}

class A9 {
  field: number;
  constructor(a: number) {
    this.field = a;
  }

  bar9(callee: number): number {
    return callee;
  }
}

function foo9(callee: number): number {
  return callee;
}

class A10 {
  field: number;
  constructor(a: number) {
    this.field = a;
  }

  bar10(callee: number): number {
    return callee;
  }
}

function foo10(callee: number): number {
  return callee;
}

class A11 {
  field: number;
  constructor(a: number) {
    this.field = a;
  }

  bar11(callee: number): number {
    return callee;
  }
}

function foo11(callee: number): number {
  return callee;
}

class A12 {
  field: number;
  constructor(a: number) {
    this.field = a;
  }

  bar12(callee: number): number {
    return callee;
  }
}

function foo12(callee: number): number {
  return callee;
}

class A13 {
  field: number;
  constructor(a: number) {
    this.field = a;
  }

  bar13(callee: number): number {
    return callee;
  }
}

function foo13(callee: number): number {
  return callee;
}

class A14 {
  field: number;
  constructor(a: number) {
    this.field = a;
  }

  bar14(callee: number): number {
    return callee;
  }
}

function foo14(callee: number): number {
  return callee;
}

class A15 {
  field: number;
  constructor(a: number) {
    this.field = a;
  }

  bar15(callee: number): number {
    return callee;
  }
}

function foo15(callee: number): number {
  return callee;
}

class A16 {
  field: number;
  constructor(a: number) {
    this.field = a;
  }

  bar16(callee: number): number {
    return callee;
  }
}

function foo16(callee: number): number {
  return callee;
}

class A17 {
  field: number;
  constructor(a: number) {
    this.field = a;
  }

  bar17(callee: number): number {
    return callee;
  }
}

function foo17(callee: number): number {
  return callee;
}

class A18 {
  field: number;
  constructor(a: number) {
    this.field = a;
  }

  bar18(callee: number): number {
    return callee;
  }
}

function foo18(callee: number): number {
  return callee;
}

class A19 {
  field: number;
  constructor(a: number) {
    this.field = a;
  }

  bar19(callee: number): number {
    return callee;
  }
}

function foo19(callee: number): number {
  return callee;
}

enum Color20 { Red, Green, Blue }

class A20 {
  field: number;
  constructor(a: number) {
    this.field = a;
  }

  bar20(callee: number): number {
    return callee;
  }
}

function foo20(callee: number): number {
  return callee;
}

enum Color21 { Red=100, Green=200, Blue=300 }

class A21 {
  field: number;
  constructor(a: number) {
    this.field = a;
  }

  bar21(callee: number): number {
    return callee;
  }
}

function foo21(callee: number): number {
  return callee;
}

enum Color22 { Red=10, Green=20, Blue=30 }

class A22 {
  field: number;
  constructor(a: number) {
    this.field = a;
  }

  bar22(callee: number): number {
    return callee;
  }
}

function foo22(callee: number): number {
  return callee;
}

enum Color23 { Red=10001, Green=10002, Blue=10003 }

class A23 {
  field: number;
  constructor(a: number) {
    this.field = a;
  }

  bar23(callee: number): number {
    return callee;
  }
}

function foo23(callee: number): number {
  return callee;
}

enum Color24 { Red=20001, Green=20002, Blue=20003 }

class A24 {
  field: number;
  constructor(a: number) {
    this.field = a;
  }

  bar24(callee: number): number {
    return callee;
  }
}

function foo24(callee: number): number {
  return callee;
}


export default function SingleParamsTest(): void {
  describe('SingleParamsTest', () => {
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
     * @tc.number    SUB_SINGLE_PARAMS_TEST_0100
     * @tc.name      testSingleParams0001
     * @tc.desc      Type of any argument (except arguments of a rest parameter) must be compatible
     *               with the type of the corresponding parameter for any function, method, or constructor
     *               call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSingleParams0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSingleParams0001';
      

      let a1: A1 = new A1(0);
      expect(a1.field).assertEqual(0);
      expect(a1.bar1(0)).assertEqual(0);
      expect(foo1(0)).assertEqual(0);

      let a2: A1 = new A1(-128);
      expect(a2.field).assertEqual(-128);
      expect(a2.bar1(-128)).assertEqual(-128);
      expect(foo1(-128)).assertEqual(-128);

      let a3: A1 = new A1(127);
      expect(a3.field).assertEqual(127);
      expect(a3.bar1(127)).assertEqual(127);
      expect(foo1(127)).assertEqual(127);
    });

    /**
     * @tc.number    SUB_SINGLE_PARAMS_TEST_0200
     * @tc.name      testSingleParams0002
     * @tc.desc      Type of any argument (except arguments of a rest parameter) must be compatible
     *               with the type of the corresponding parameter for any function, method, or constructor
     *               call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSingleParams0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSingleParams0002';
      

      let a1: A2 = new A2(0);
      expect(a1.field).assertEqual(0);
      expect(a1.bar2(0)).assertEqual(0);
      expect(foo2(0)).assertEqual(0);

      let a2: A2 = new A2(-128);
      expect(a2.field).assertEqual(-128);
      expect(a2.bar2(-128)).assertEqual(-128);
      expect(foo2(-128)).assertEqual(-128);

      let a3: A2 = new A2(127);
      expect(a3.field).assertEqual(127);
      expect(a3.bar2(127)).assertEqual(127);
      expect(foo2(127)).assertEqual(127);
    });

    /**
     * @tc.number    SUB_SINGLE_PARAMS_TEST_0300
     * @tc.name      testSingleParams0003
     * @tc.desc      Type of any argument (except arguments of a rest parameter) must be compatible
     *               with the type of the corresponding parameter for any function, method, or constructor
     *               call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSingleParams0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSingleParams0003';
      

      let a1: A3 = new A3(0);
      expect(a1.field).assertEqual(0);
      expect(a1.bar3(0)).assertEqual(0);
      expect(foo3(0)).assertEqual(0);

      let a2: A3 = new A3(-128);
      expect(a2.field).assertEqual(-128);
      expect(a2.bar3(-128)).assertEqual(-128);
      expect(foo3(-128)).assertEqual(-128);

      let a3: A3 = new A3(127);
      expect(a3.field).assertEqual(127);
      expect(a3.bar3(127)).assertEqual(127);
      expect(foo3(127)).assertEqual(127);
    });

    /**
     * @tc.number    SUB_SINGLE_PARAMS_TEST_0400
     * @tc.name      testSingleParams0004
     * @tc.desc      Type of any argument (except arguments of a rest parameter) must be compatible
     *               with the type of the corresponding parameter for any function, method, or constructor
     *               call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSingleParams0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSingleParams0004';
      

      let a1: A4 = new A4(0);
      expect(a1.field).assertEqual(0.0);
      expect(a1.bar4(0)).assertEqual(0.0);
      expect(foo4(0)).assertEqual(0.0);

      let a2: A4 = new A4(-128);
      expect(a2.field).assertEqual(-128.0);
      expect(a2.bar4(-128)).assertEqual(-128.0);
      expect(foo4(-128)).assertEqual(-128.0);

      let a3: A4 = new A4(127);
      expect(a3.field).assertEqual(127.0);
      expect(a3.bar4(127)).assertEqual(127.0);
      expect(foo4(127)).assertEqual(127.0);
    });

    /**
     * @tc.number    SUB_SINGLE_PARAMS_TEST_0500
     * @tc.name      testSingleParams0005
     * @tc.desc      Type of any argument (except arguments of a rest parameter) must be compatible
     *               with the type of the corresponding parameter for any function, method, or constructor
     *               call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSingleParams0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSingleParams0005';
      

      let a1: A5 = new A5(0);
      expect(a1.field).assertEqual(0.0);
      expect(a1.bar5(0)).assertEqual(0.0);
      expect(foo5(0)).assertEqual(0.0);

      let a2: A5 = new A5(-128);
      expect(a2.field).assertEqual(-128.0);
      expect(a2.bar5(-128)).assertEqual(-128.0);
      expect(foo5(-128)).assertEqual(-128.0);

      let a3: A5 = new A5(127);
      expect(a3.field).assertEqual(127.0);
      expect(a3.bar5(127)).assertEqual(127.0);
      expect(foo5(127)).assertEqual(127.0);
    });

    /**
     * @tc.number    SUB_SINGLE_PARAMS_TEST_0600
     * @tc.name      testSingleParams0006
     * @tc.desc      Type of any argument (except arguments of a rest parameter) must be compatible
     *               with the type of the corresponding parameter for any function, method, or constructor
     *               call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSingleParams0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSingleParams0006';
      

      let a1: A6 = new A6(0);
      expect(a1.field).assertEqual(0.0);
      expect(a1.bar6(0)).assertEqual(0.0);
      expect(foo6(0)).assertEqual(0.0);

      let a2: A6 = new A6(-128);
      expect(a2.field).assertEqual(-128.0);
      expect(a2.bar6(-128)).assertEqual(-128.0);
      expect(foo6(-128)).assertEqual(-128.0);

      let a3: A6 = new A6(127);
      expect(a3.field).assertEqual(127.0);
      expect(a3.bar6(127)).assertEqual(127.0);
      expect(foo6(127)).assertEqual(127.0);
    });

    /**
     * @tc.number    SUB_SINGLE_PARAMS_TEST_0700
     * @tc.name      testSingleParams0007
     * @tc.desc      Type of any argument (except arguments of a rest parameter) must be compatible
     *               with the type of the corresponding parameter for any function, method, or constructor
     *               call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSingleParams0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSingleParams0007';
      

      let a1: A7 = new A7(0);
      expect(a1.field).assertEqual(0);
      expect(a1.bar7(0)).assertEqual(0);
      expect(foo7(0)).assertEqual(0);

      let a2: A7 = new A7(-32768);
      expect(a2.field).assertEqual(-32768);
      expect(a2.bar7(-32768)).assertEqual(-32768);
      expect(foo7(-32768)).assertEqual(-32768);

      let a3: A7 = new A7(32767);
      expect(a3.field).assertEqual(32767);
      expect(a3.bar7(32767)).assertEqual(32767);
      expect(foo7(32767)).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_SINGLE_PARAMS_TEST_0800
     * @tc.name      testSingleParams0008
     * @tc.desc      Type of any argument (except arguments of a rest parameter) must be compatible
     *               with the type of the corresponding parameter for any function, method, or constructor
     *               call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSingleParams0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSingleParams0008';
      

      let a1: A8 = new A8(0);
      expect(a1.field).assertEqual(0);
      expect(a1.bar8(0)).assertEqual(0);
      expect(foo8(0)).assertEqual(0);

      let a2: A8 = new A8(-32768);
      expect(a2.field).assertEqual(-32768);
      expect(a2.bar8(-32768)).assertEqual(-32768);
      expect(foo8(-32768)).assertEqual(-32768);

      let a3: A8 = new A8(32767);
      expect(a3.field).assertEqual(32767);
      expect(a3.bar8(32767)).assertEqual(32767);
      expect(foo8(32767)).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_SINGLE_PARAMS_TEST_0900
     * @tc.name      testSingleParams0009
     * @tc.desc      Type of any argument (except arguments of a rest parameter) must be compatible
     *               with the type of the corresponding parameter for any function, method, or constructor
     *               call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSingleParams0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSingleParams0009';
      

      let a1: A9 = new A9(0);
      expect(a1.field).assertEqual(0.0);
      expect(a1.bar9(0)).assertEqual(0.0);
      expect(foo9(0)).assertEqual(0.0);

      let a2: A9 = new A9(-32768);
      expect(a2.field).assertEqual(-32768.0);
      expect(a2.bar9(-32768)).assertEqual(-32768.0);
      expect(foo9(-32768)).assertEqual(-32768.0);

      let a3: A9 = new A9(32767);
      expect(a3.field).assertEqual(32767.0);
      expect(a3.bar9(32767)).assertEqual(32767.0);
      expect(foo9(32767)).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_SINGLE_PARAMS_TEST_1000
     * @tc.name      testSingleParams0010
     * @tc.desc      Type of any argument (except arguments of a rest parameter) must be compatible
     *               with the type of the corresponding parameter for any function, method, or constructor
     *               call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSingleParams0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSingleParams0010';
      

      let a1: A10 = new A10(0);
      expect(a1.field).assertEqual(0.0);
      expect(a1.bar10(0)).assertEqual(0.0);
      expect(foo10(0)).assertEqual(0.0);

      let a2: A10 = new A10(-32768);
      expect(a2.field).assertEqual(-32768.0);
      expect(a2.bar10(-32768)).assertEqual(-32768.0);
      expect(foo10(-32768)).assertEqual(-32768.0);

      let a3: A10 = new A10(32767);
      expect(a3.field).assertEqual(32767.0);
      expect(a3.bar10(32767)).assertEqual(32767.0);
      expect(foo10(32767)).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_SINGLE_PARAMS_TEST_1100
     * @tc.name      testSingleParams0011
     * @tc.desc      Type of any argument (except arguments of a rest parameter) must be compatible
     *               with the type of the corresponding parameter for any function, method, or constructor
     *               call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSingleParams0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSingleParams0011';
      

      let a1: A11 = new A11(0);
      expect(a1.field).assertEqual(0.0);
      expect(a1.bar11(0)).assertEqual(0.0);
      expect(foo11(0)).assertEqual(0.0);

      let a2: A11 = new A11(-32768);
      expect(a2.field).assertEqual(-32768.0);
      expect(a2.bar11(-32768)).assertEqual(-32768.0);
      expect(foo11(-32768)).assertEqual(-32768.0);

      let a3: A11 = new A11(32767);
      expect(a3.field).assertEqual(32767.0);
      expect(a3.bar11(32767)).assertEqual(32767.0);
      expect(foo11(32767)).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_SINGLE_PARAMS_TEST_1200
     * @tc.name      testSingleParams0012
     * @tc.desc      Type of any argument (except arguments of a rest parameter) must be compatible
     *               with the type of the corresponding parameter for any function, method, or constructor
     *               call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSingleParams0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSingleParams0012';
      

      let a1: A12 = new A12(0);
      expect(a1.field).assertEqual(0);
      expect(a1.bar12(0)).assertEqual(0);
      expect(foo12(0)).assertEqual(0);

      let a2: A12 = new A12(-2147483648);
      expect(a2.field).assertEqual(-2147483648);
      expect(a2.bar12(-2147483648)).assertEqual(-2147483648);
      expect(foo12(-2147483648)).assertEqual(-2147483648);

      let a3: A12 = new A12(2147483647);
      expect(a3.field).assertEqual(2147483647);
      expect(a3.bar12(2147483647)).assertEqual(2147483647);
      expect(foo12(2147483647)).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_SINGLE_PARAMS_TEST_1300
     * @tc.name      testSingleParams0013
     * @tc.desc      Type of any argument (except arguments of a rest parameter) must be compatible
     *               with the type of the corresponding parameter for any function, method, or constructor
     *               call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSingleParams0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSingleParams0013';
      

      let a1: A13 = new A13(0);
      expect(a1.field).assertEqual(0.0);
      expect(a1.bar13(0)).assertEqual(0.0);
      expect(foo13(0)).assertEqual(0.0);

      let a2: A13 = new A13(-2147483648);
      expect(a2.field).assertEqual(-2147483648);
      expect(a2.bar13(-2147483648)).assertEqual(-2147483648.0);
      expect(foo13(-2147483648)).assertEqual(-2147483648.0);

      let a3: A13 = new A13(2147483647);
      expect(a3.field).assertEqual(2147483647);
      expect(a3.bar13(2147483647)).assertEqual(2147483647.0);
      expect(foo13(2147483647)).assertEqual(2147483647.0);
    });

    /**
     * @tc.number    SUB_SINGLE_PARAMS_TEST_1400
     * @tc.name      testSingleParams0014
     * @tc.desc      Type of any argument (except arguments of a rest parameter) must be compatible
     *               with the type of the corresponding parameter for any function, method, or constructor
     *               call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSingleParams0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSingleParams0014';
      

      let a1: A14 = new A14(0);
      expect(a1.field).assertEqual(0.0);
      expect(a1.bar14(0)).assertEqual(0.0);
      expect(foo14(0)).assertEqual(0.0);

      let a2: A14 = new A14(-2147483648);
      expect(a2.field).assertEqual(-2147483648.0);
      expect(a2.bar14(-2147483648)).assertEqual(-2147483648.0);
      expect(foo14(-2147483648)).assertEqual(-2147483648.0);

      let a3: A14 = new A14(2147483647);
      expect(a3.field).assertEqual(2147483647.0);
      expect(a3.bar14(2147483647)).assertEqual(2147483647.0);
      expect(foo14(2147483647)).assertEqual(2147483647.0);
    });

    /**
     * @tc.number    SUB_SINGLE_PARAMS_TEST_1500
     * @tc.name      testSingleParams0015
     * @tc.desc      Type of any argument (except arguments of a rest parameter) must be compatible
     *               with the type of the corresponding parameter for any function, method, or constructor
     *               call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSingleParams0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSingleParams0015';
      

      let a1: A15 = new A15(0);
      expect(a1.field).assertEqual(0.0);
      expect(a1.bar15(0)).assertEqual(0.0);
      expect(foo15(0)).assertEqual(0.0);

      let a2: A15 = new A15(-2147483648);
      expect(a2.field).assertEqual(-2147483648.0);
      expect(a2.bar15(-2147483648)).assertEqual(-2147483648.0);
      expect(foo15(-2147483648)).assertEqual(-2147483648.0);

      let a3: A15 = new A15(2147483647);
      expect(a3.field).assertEqual(2147483647.0);
      expect(a3.bar15(2147483647)).assertEqual(2147483647.0);
      expect(foo15(2147483647)).assertEqual(2147483647.0);
    });

    /**
     * @tc.number    SUB_SINGLE_PARAMS_TEST_1600
     * @tc.name      testSingleParams0016
     * @tc.desc      Type of any argument (except arguments of a rest parameter) must be compatible
     *               with the type of the corresponding parameter for any function, method, or constructor
     *               call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSingleParams0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSingleParams0016';
      

      let a1: A16 = new A16(0);
      expect(a1.field).assertEqual(0.0);
      expect(a1.bar16(0)).assertEqual(0.0);
      expect(foo16(0)).assertEqual(0.0);

      let a2: A16 = new A16(-9223372036854775808);
      expect(a2.field).assertEqual(-9223372036854775808.0);
      expect(a2.bar16(-9223372036854775808)).assertEqual(-9223372036854775808.0);
      expect(foo16(-9223372036854775808)).assertEqual(-9223372036854775808.0);

      let a3: A16 = new A16(9223372036854775807);
      expect(a3.field).assertEqual(9223372036854775807.0);
      expect(a3.bar16(9223372036854775807)).assertEqual(9223372036854775807.0);
      expect(foo16(9223372036854775807)).assertEqual(9223372036854775807.0);
    });

    /**
     * @tc.number    SUB_SINGLE_PARAMS_TEST_1700
     * @tc.name      testSingleParams0017
     * @tc.desc      Type of any argument (except arguments of a rest parameter) must be compatible
     *               with the type of the corresponding parameter for any function, method, or constructor
     *               call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSingleParams0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSingleParams0017';
      

      let a1: A17 = new A17(0);
      expect(a1.field).assertEqual(0.0);
      expect(a1.bar17(0)).assertEqual(0.0);
      expect(foo17(0)).assertEqual(0.0);

      let a2: A17 = new A17(-9223372036854775808);
      expect(a2.field).assertEqual(-9223372036854775808.0);
      expect(a2.bar17(-9223372036854775808)).assertEqual(-9223372036854775808.0);
      expect(foo17(-9223372036854775808)).assertEqual(-9223372036854775808.0);

      let a3: A17 = new A17(9223372036854775807);
      expect(a3.field).assertEqual(9223372036854775807.0);
      expect(a3.bar17(9223372036854775807)).assertEqual(9223372036854775807.0);
      expect(foo17(9223372036854775807)).assertEqual(9223372036854775807.0);
    });

    /**
     * @tc.number    SUB_SINGLE_PARAMS_TEST_1800
     * @tc.name      testSingleParams0018
     * @tc.desc      Type of any argument (except arguments of a rest parameter) must be compatible
     *               with the type of the corresponding parameter for any function, method, or constructor
     *               call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSingleParams0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSingleParams0018';
      

      let a1: A18 = new A18(0);
      expect(a1.field).assertEqual(0.0);
      expect(a1.bar18(0)).assertEqual(0.0);
      expect(foo18(0)).assertEqual(0.0);

      let a2: A18 = new A18(-9223372036854775808);
      expect(a2.field).assertEqual(-9223372036854775808.0);
      expect(a2.bar18(-9223372036854775808)).assertEqual(-9223372036854775808.0);
      expect(foo18(-9223372036854775808)).assertEqual(-9223372036854775808.0);

      let a3: A18 = new A18(9223372036854775807);
      expect(a3.field).assertEqual(9223372036854775807.0);
      expect(a3.bar18(9223372036854775807)).assertEqual(9223372036854775807.0);
      expect(foo18(9223372036854775807)).assertEqual(9223372036854775807.0);
    });

    /**
     * @tc.number    SUB_SINGLE_PARAMS_TEST_1900
     * @tc.name      testSingleParams0019
     * @tc.desc      Type of any argument (except arguments of a rest parameter) must be compatible
     *               with the type of the corresponding parameter for any function, method, or constructor
     *               call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSingleParams0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSingleParams0019';
      

      let a1: A19 = new A19(0.0);
      expect(a1.field).assertEqual(0.0);
      expect(a1.bar19(0.0)).assertEqual(0.0);
      expect(foo19(0.0)).assertEqual(0.0);

      let a2: A19 = new A19(-0.0);
      expect(a2.field).assertEqual(-0.0);
      expect(a2.bar19(-0.0)).assertEqual(-0.0);
      expect(foo19(-0.0)).assertEqual(-0.0);

      let a3: A19 = new A19(3.4028234663852886e38);
      expect(a3.field).assertEqual(3.4028234663852886e38);
      expect(a3.bar19(3.4028234663852886e38)).assertEqual(3.4028234663852886e38);
      expect(foo19(3.4028234663852886e38)).assertEqual(3.4028234663852886e38);

      let a4: A19 = new A19(1.401298464324817e-45);
      expect(a4.field).assertEqual(1.401298464324817e-45);
      expect(a4.bar19(1.401298464324817e-45)).assertEqual(1.401298464324817e-45);
      expect(foo19(1.401298464324817e-45)).assertEqual(1.401298464324817e-45);

      let a5: A19 = new A19(-3.4028234663852886e38);
      expect(a5.field).assertEqual(-3.4028234663852886e38);
      expect(a5.bar19(-3.4028234663852886e38)).assertEqual(-3.4028234663852886e38);
      expect(foo19(-3.4028234663852886e38)).assertEqual(-3.4028234663852886e38);

      let a6: A19 = new A19(-1.401298464324817e-45);
      expect(a6.field).assertEqual(-1.401298464324817e-45);
      expect(a6.bar19(-1.401298464324817e-45)).assertEqual(-1.401298464324817e-45);
      expect(foo19(-1.401298464324817e-45)).assertEqual(-1.401298464324817e-45);
    });

    /**
     * @tc.number    SUB_SINGLE_PARAMS_TEST_2000
     * @tc.name      testSingleParams0020
     * @tc.desc      Type of any argument (except arguments of a rest parameter) must be compatible
     *               with the type of the corresponding parameter for any function, method, or constructor
     *               call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSingleParams0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSingleParams0020';
      

      let a1: A20 = new A20(Color20.Red);
      expect(a1.field).assertEqual(0);
      expect(a1.bar20(Color20.Red)).assertEqual(0);
      expect(foo20(Color20.Red)).assertEqual(0);

      let a2: A20 = new A20(Color20.Green);
      expect(a2.field).assertEqual(1);
      expect(a2.bar20(Color20.Green)).assertEqual(1);
      expect(foo20(Color20.Green)).assertEqual(1);

      let a3: A20 = new A20(Color20.Blue);
      expect(a3.field).assertEqual(2);
      expect(a3.bar20(Color20.Blue)).assertEqual(2);
      expect(foo20(Color20.Blue)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SINGLE_PARAMS_TEST_2100
     * @tc.name      testSingleParams0021
     * @tc.desc      Type of any argument (except arguments of a rest parameter) must be compatible
     *               with the type of the corresponding parameter for any function, method, or constructor
     *               call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSingleParams0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSingleParams021';
      

      let a1: A21 = new A21(Color21.Red);
      expect(a1.field).assertEqual(100);
      expect(a1.bar21(Color21.Red)).assertEqual(100);
      expect(foo21(Color21.Red)).assertEqual(100);

      let a2: A21 = new A21(Color21.Green);
      expect(a2.field).assertEqual(200);
      expect(a2.bar21(Color21.Green)).assertEqual(200);
      expect(foo21(Color21.Green)).assertEqual(200);

      let a3: A21 = new A21(Color21.Blue);
      expect(a3.field).assertEqual(300);
      expect(a3.bar21(Color21.Blue)).assertEqual(300);
      expect(foo21(Color21.Blue)).assertEqual(300);
    });

    /**
     * @tc.number    SUB_SINGLE_PARAMS_TEST_2200
     * @tc.name      testSingleParams0022
     * @tc.desc      Type of any argument (except arguments of a rest parameter) must be compatible
     *               with the type of the corresponding parameter for any function, method, or constructor
     *               call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSingleParams0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSingleParams0022';
      

      let a1: A22 = new A22(Color22.Red);
      expect(a1.field).assertEqual(10.0);
      expect(a1.bar22(Color22.Red)).assertEqual(10.0);
      expect(foo22(Color22.Red)).assertEqual(10.0);

      let a2: A22 = new A22(Color22.Green);
      expect(a2.field).assertEqual(20.0);
      expect(a2.bar22(Color22.Green)).assertEqual(20.0);
      expect(foo22(Color22.Green)).assertEqual(20.0);

      let a3: A22 = new A22(Color22.Blue);
      expect(a3.field).assertEqual(30.0);
      expect(a3.bar22(Color22.Blue)).assertEqual(30.0);
      expect(foo22(Color22.Blue)).assertEqual(30.0);
    });

    /**
     * @tc.number    SUB_SINGLE_PARAMS_TEST_2300
     * @tc.name      testSingleParams0023
     * @tc.desc      Type of any argument (except arguments of a rest parameter) must be compatible
     *               with the type of the corresponding parameter for any function, method, or constructor
     *               call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSingleParams0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSingleParams0023';
      

      let a1: A23 = new A23(Color23.Red);
      expect(a1.field).assertEqual(10001.0);
      expect(a1.bar23(Color23.Red)).assertEqual(10001.0);
      expect(foo23(Color23.Red)).assertEqual(10001.0);

      let a2: A23 = new A23(Color23.Green);
      expect(a2.field).assertEqual(10002.0);
      expect(a2.bar23(Color23.Green)).assertEqual(10002.0);
      expect(foo23(Color23.Green)).assertEqual(10002.0);

      let a3: A23 = new A23(Color23.Blue);
      expect(a3.field).assertEqual(10003.0);
      expect(a3.bar23(Color23.Blue)).assertEqual(10003.0);
      expect(foo23(Color23.Blue)).assertEqual(10003.0);
    });

    /**
     * @tc.number    SUB_SINGLE_PARAMS_TEST_2400
     * @tc.name      testSingleParams0024
     * @tc.desc      Type of any argument (except arguments of a rest parameter) must be compatible
     *               with the type of the corresponding parameter for any function, method, or constructor
     *               call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSingleParams0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSingleParams0024';
      


      let a1: A24 = new A24(Color24.Red);
      expect(a1.field).assertEqual(20001.0);
      expect(a1.bar24(Color24.Red)).assertEqual(20001.0);
      expect(foo24(Color24.Red)).assertEqual(20001.0);

      let a2: A24 = new A24(Color24.Green);
      expect(a2.field).assertEqual(20002.0);
      expect(a2.bar24(Color24.Green)).assertEqual(20002.0);
      expect(foo24(Color24.Green)).assertEqual(20002.0);

      let a3: A24 = new A24(Color24.Blue);
      expect(a3.field).assertEqual(20003.0);
      expect(a3.bar24(Color24.Blue)).assertEqual(20003.0);
      expect(foo24(Color24.Blue)).assertEqual(20003.0);
    });
  })
}

