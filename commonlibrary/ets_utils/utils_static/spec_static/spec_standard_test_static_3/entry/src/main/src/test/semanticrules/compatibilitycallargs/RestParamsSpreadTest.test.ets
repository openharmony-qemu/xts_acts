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
  field: number[];
  constructor(...a: number[]) {
    this.field = a;
  }

  bar1(...callee: number[]): number[] {
    return callee;
  }
}

function foo1(...callee: Array<number>): number[] {
  return callee;
}

class A2 {
  field: number[];
  constructor(...a: number[]) {
    this.field = a;
  }

  bar2(...callee: number[]): number[] {
    return callee;
  }
}

function foo2(...callee: Array<number>): number[] {
  return callee;
}

class A3 {
  field: number[];
  constructor(...a: number[]) {
    this.field = a;
  }

  bar3(...callee: number[]): number[] {
    return callee;
  }
}

function foo3(...callee: Array<number>): number[] {
  return callee;
}

class A4 {
  field: number[];
  constructor(...a: number[]) {
    this.field = a;
  }

  bar4(...callee: number[]): number[] {
    return callee;
  }
}

function foo4(...callee: Array<number>): number[] {
  return callee;
}

class A5 {
  field: number[];
  constructor(...a: number[]) {
    this.field = a;
  }

  bar5(...callee: number[]): number[] {
    return callee;
  }
}

function foo5(...callee: Array<number>): number[] {
  return callee;
}

class A6 {
  field: number[];
  constructor(...a: number[]) {
    this.field = a;
  }

  bar6(...callee: number[]): number[] {
    return callee;
  }
}

function foo6(...callee: Array<number>): number[] {
  return callee;
}


export default function RestParamsSpreadTest(): void {
  describe('RestParamsSpreadTest', () => {
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
     * @tc.number    SUB_REST_PARAMS_SPREAD_0100
     * @tc.name      testRestParamsSpread0001
     * @tc.desc      If a single argument corresponding to the rest parameter has the spread operator,
     *               then the expression that follows the operator must refer to an array of a type compatible
     *               with the type of the array rest parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRestParamsSpread0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testRestParamsSpread0001';
      

      let arr: number[] = [0, -128, 127];
      let a: A1 = new A1(...arr);
      let method_result = a.bar1(...arr);
      let func_result = foo1(...arr);

      expect(method_result[0]).assertEqual(0);
      expect(func_result[0]).assertEqual(0);
      expect(a.field[0]).assertEqual(0);

      expect(method_result[1]).assertEqual(-128);
      expect(func_result[1]).assertEqual(-128);
      expect(a.field[1]).assertEqual(-128);

      expect(method_result[2]).assertEqual(127);
      expect(func_result[2]).assertEqual(127);
      expect(a.field[2]).assertEqual(127);

    });

    /**
     * @tc.number    SUB_REST_PARAMS_SPREAD_0200
     * @tc.name      testRestParamsSpread0002
     * @tc.desc      If a single argument corresponding to the rest parameter has the spread operator,
     *               then the expression that follows the operator must refer to an array of a type compatible
     *               with the type of the array rest parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRestParamsSpread0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testRestParamsSpread0002';
      

      let arr: number[] = [0, -128, 127];
      let a: A2 = new A2(...arr);
      let method_result = a.bar2(...arr);
      let func_result = foo2(...arr);

      expect(method_result[0]).assertEqual(0);
      expect(func_result[0]).assertEqual(0);
      expect(a.field[0]).assertEqual(0);

      expect(method_result[1]).assertEqual(-128);
      expect(func_result[1]).assertEqual(-128);
      expect(a.field[1]).assertEqual(-128);

      expect(method_result[2]).assertEqual(127);
      expect(func_result[2]).assertEqual(127);
      expect(a.field[2]).assertEqual(127);

    });

    /**
     * @tc.number    SUB_REST_PARAMS_SPREAD_0300
     * @tc.name      testRestParamsSpread0003
     * @tc.desc      If a single argument corresponding to the rest parameter has the spread operator,
     *               then the expression that follows the operator must refer to an array of a type compatible
     *               with the type of the array rest parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRestParamsSpread0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testRestParamsSpread0003';
      

      let arr: number[] = [0, -128, 127];
      let a: A3 = new A3(...arr);
      let method_result = a.bar3(...arr);
      let func_result = foo3(...arr);

      expect(method_result[0]).assertEqual(0);
      expect(func_result[0]).assertEqual(0);
      expect(a.field[0]).assertEqual(0);

      expect(method_result[1]).assertEqual(-128);
      expect(func_result[1]).assertEqual(-128);
      expect(a.field[1]).assertEqual(-128);

      expect(method_result[2]).assertEqual(127);
      expect(func_result[2]).assertEqual(127);
      expect(a.field[2]).assertEqual(127);

    });

    /**
     * @tc.number    SUB_REST_PARAMS_SPREAD_0400
     * @tc.name      testRestParamsSpread0004
     * @tc.desc      If a single argument corresponding to the rest parameter has the spread operator,
     *               then the expression that follows the operator must refer to an array of a type compatible
     *               with the type of the array rest parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRestParamsSpread0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testRestParamsSpread0004';
      

      let arr: number[] = [0.0, -128.0, 127.0];
      let a: A4 = new A4(...arr);
      let method_result = a.bar4(...arr);
      let func_result = foo4(...arr);

      expect(method_result[0]).assertEqual(0.0);
      expect(func_result[0]).assertEqual(0.0);
      expect(a.field[0]).assertEqual(0.0);

      expect(method_result[1]).assertEqual(-128.0);
      expect(func_result[1]).assertEqual(-128.0);
      expect(a.field[1]).assertEqual(-128.0);

      expect(method_result[2]).assertEqual(127.0);
      expect(func_result[2]).assertEqual(127.0);
      expect(a.field[2]).assertEqual(127.0);

    });

    /**
     * @tc.number    SUB_REST_PARAMS_SPREAD_0500
     * @tc.name      testRestParamsSpread0005
     * @tc.desc      If a single argument corresponding to the rest parameter has the spread operator,
     *               then the expression that follows the operator must refer to an array of a type compatible
     *               with the type of the array rest parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRestParamsSpread0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testRestParamsSpread0005';
      

      let arr: number[] = [0, -32768, 32767];
      let a: A5 = new A5(...arr);
      let method_result = a.bar5(...arr);
      let func_result = foo5(...arr);

      expect(method_result[0]).assertEqual(0);
      expect(func_result[0]).assertEqual(0);
      expect(a.field[0]).assertEqual(0);

      expect(method_result[1]).assertEqual(-32768);
      expect(func_result[1]).assertEqual(-32768);
      expect(a.field[1]).assertEqual(-32768);

      expect(method_result[2]).assertEqual(32767);
      expect(func_result[2]).assertEqual(32767);
      expect(a.field[2]).assertEqual(32767);

    });

    /**
     * @tc.number    SUB_REST_PARAMS_SPREAD_0600
     * @tc.name      testRestParamsSpread0006
     * @tc.desc      If a single argument corresponding to the rest parameter has the spread operator,
     *               then the expression that follows the operator must refer to an array of a type compatible
     *               with the type of the array rest parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRestParamsSpread0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testRestParamsSpread0006';
      

      let arr: number[] = [0, -32768, 32767];
      let a: A6 = new A6(...arr);
      let method_result = a.bar6(...arr);
      let func_result = foo6(...arr);

      expect(method_result[0]).assertEqual(0.0);
      expect(func_result[0]).assertEqual(0.0);
      expect(a.field[0]).assertEqual(0.0);

      expect(method_result[1]).assertEqual(-32768);
      expect(func_result[1]).assertEqual(-32768);
      expect(a.field[1]).assertEqual(-32768);

      expect(method_result[2]).assertEqual(32767);
      expect(func_result[2]).assertEqual(32767);
      expect(a.field[2]).assertEqual(32767);
    });
  })
}


