/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll
} from "../../../../../../hypium/index";

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

enum Color { Red, Green, Blue }
enum Mode { OFF = 0, ON = 1, AUTO = 2 }

class BigIntObj {
  count: bigint = 0n;
  constructor(count: bigint) {
    this.count = count;
  }
}
class BigIntObj2 {
  big: bigint = 0n;
  constructor(big: bigint) {
    this.big = big;
  }
}

export default function ExtendedConditionalExpressionsTest16():void {
  describe('ExtendedConditionalExpressionsTest16', () => {
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
      // This API supports only one parameter: preset action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })

    // ===== BigInt truthy base value (Long.MAX_VALUE) - ops pattern =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_0100
     * @tc.name    testConditionalExpression0622
     * @tc.desc      BigInt truthy base value operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0622', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 9223372036854775807n;  // truthy base value (Long.MAX_VALUE as bigint)

      expect((!a) ? false : true).assertTrue();
      expect(((a && 0n) ? false : true)).assertTrue();
      expect(((a || 0n) ? true : false)).assertTrue();
      expect(((a && 1n) ? true : false)).assertTrue();
      expect(((a || 1n) ? true : false)).assertTrue();
      expect(((a && -1n) ? true : false)).assertTrue();
      expect(((a || -1n) ? true : false)).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_0200
     * @tc.name    testConditionalExpression0623
     * @tc.desc      BigInt truthy with Number operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0623', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 9223372036854775807n;

      expect(((a && 0) ? false : true)).assertTrue();
      expect(((a || 0) ? true : false)).assertTrue();
      expect(((a && 1) ? true : false)).assertTrue();
      expect(((a || 1) ? true : false)).assertTrue();
      expect(((a && Number.NaN) ? false : true)).assertTrue();
      expect(((a || Number.NaN) ? true : false)).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_0300
     * @tc.name    testConditionalExpression0624
     * @tc.desc      BigInt truthy with Long value operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0624', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 9223372036854775807n;
      let minVal: bigint = -9223372036854775808n;
      let maxVal: bigint = 9223372036854775807n;

      expect(((a && minVal) ? true : false)).assertTrue();
      expect(((a || minVal) ? true : false)).assertTrue();
      expect(((a && maxVal) ? true : false)).assertTrue();
      expect(((a || maxVal) ? true : false)).assertTrue();
      expect(((a && 0n) ? false : true)).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_0400
     * @tc.name    testConditionalExpression0625
     * @tc.desc      BigInt truthy with Boolean operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0625', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 9223372036854775807n;

      expect(((a && false) ? false : true)).assertTrue();
      expect(((a || false) ? true : false)).assertTrue();
      expect(((a && true) ? true : false)).assertTrue();
      expect(((a || true) ? true : false)).assertTrue();
    });

    // ===== BigInt falsy base value (0n) - ops pattern =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_0500
     * @tc.name    testConditionalExpression0626
     * @tc.desc      BigInt falsy base value operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0626', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 0n;  // falsy base value

      expect((!a) ? true : false).assertTrue();
      expect(((a && 1n) ? false : true)).assertTrue();
      expect(((a || 1n) ? true : false)).assertTrue();
      expect(((a && -1n) ? false : true)).assertTrue();
      expect(((a || -1n) ? true : false)).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_0600
     * @tc.name    testConditionalExpression0627
     * @tc.desc      BigInt falsy with Number operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0627', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 0n;

      expect(((a && 0) ? false : true)).assertTrue();
      expect(((a || 0) ? false : true)).assertTrue();
      expect(((a && 1) ? false : true)).assertTrue();
      expect(((a || 1) ? true : false)).assertTrue();
      expect(((a && Number.NaN) ? false : true)).assertTrue();
      expect(((a || Number.NaN) ? false : true)).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_0700
     * @tc.name    testConditionalExpression0628
     * @tc.desc      BigInt falsy with Long value operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0628', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 0n;
      let minVal: bigint = -9223372036854775808n;
      let maxVal: bigint = 9223372036854775807n;

      expect(((a && minVal) ? false : true)).assertTrue();
      expect(((a || minVal) ? true : false)).assertTrue();
      expect(((a && maxVal) ? false : true)).assertTrue();
      expect(((a || maxVal) ? true : false)).assertTrue();
    });

    // ===== BigInt negative value (truthy) =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_0800
     * @tc.name    testConditionalExpression0629
     * @tc.desc      BigInt negative value operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0629', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = -1n;  // truthy

      expect((!a) ? false : true).assertTrue();
      expect(((a && 0n) ? false : true)).assertTrue();
      expect(((a || 0n) ? true : false)).assertTrue();
      expect(((a && 1n) ? true : false)).assertTrue();
    });

    // ===== Char truthiness tests =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_0900
     * @tc.name    testConditionalExpression0630
     * @tc.desc      Char null character truthiness tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: char = c'\u0000';  // falsy

      expect((!a) ? true : false).assertTrue();
      expect(((a && c' ') ? false : true)).assertTrue();
      expect(((a || c' ') ? true : false)).assertTrue();
      expect(((a && 1) ? false : true)).assertTrue();
      expect(((a || 1) ? true : false)).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_1000
     * @tc.name    testConditionalExpression0631
     * @tc.desc      Char space character truthiness tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0631', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: char = c' ';  // truthy

      expect((!a) ? false : true).assertTrue();
      expect(((a && c'\u0000') ? false : true)).assertTrue();
      expect(((a || c'\u0000') ? true : false)).assertTrue();
      expect(((a && 1) ? true : false)).assertTrue();
      expect(((a || 1) ? true : false)).assertTrue();
    });

    // ===== String method return values =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_1100
     * @tc.name    testConditionalExpression0632
     * @tc.desc      String empty substring truthiness tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0632', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: String = new String("\u0000\u0000").substring(0, 0);  // falsy

      expect((!a) ? true : false).assertTrue();
      expect(((a && "x") ? false : true)).assertTrue();
      expect(((a || "x") ? true : false)).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_1200
     * @tc.name    testConditionalExpression0633
     * @tc.desc      String non-empty substring truthiness tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0633', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: String = new String("\u0000\u0000").substring(0, 1);  // truthy

      expect((!a) ? false : true).assertTrue();
      expect(((a && "x") ? true : false)).assertTrue();
      expect(((a || "x") ? true : false)).assertTrue();
    });

    // ===== Number special values with BigInt =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_1300
     * @tc.name    testConditionalExpression0634
     * @tc.desc      BigInt with positive infinity operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0634', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 1n;

      expect(((a && Number.POSITIVE_INFINITY) ? true : false)).assertTrue();
      expect(((a || Number.POSITIVE_INFINITY) ? true : false)).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_1400
     * @tc.name    testConditionalExpression0635
     * @tc.desc      BigInt with negative infinity operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0635', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 1n;

      expect(((a && Number.NEGATIVE_INFINITY) ? true : false)).assertTrue();
      expect(((a || Number.NEGATIVE_INFINITY) ? true : false)).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_1500
     * @tc.name    testConditionalExpression0636
     * @tc.desc      BigInt with NaN operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0636', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 1n;

      expect(((a && Number.NaN) ? false : true)).assertTrue();
      expect(((a || Number.NaN) ? true : false)).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_1600
     * @tc.name    testConditionalExpression0637
     * @tc.desc      BigInt with Number MIN_VALUE operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0637', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 1n;

      expect(((a && Number.MIN_VALUE) ? true : false)).assertTrue();
      expect(((a || Number.MIN_VALUE) ? true : false)).assertTrue();
    });

    // ===== While loop with BigInt =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_1700
     * @tc.name    testConditionalExpression0638
     * @tc.desc      While loop with truthy BigInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0638', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let v: bigint = 1n;

      while (v) {
        if (retcode == 1) {
          retcode = 0;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_1800
     * @tc.name    testConditionalExpression0639
     * @tc.desc      While loop with falsy BigInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0639', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 0;
      let v: bigint = 0n;

      while (v) {
        if (retcode == 0) {
          retcode = 1;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_1900
     * @tc.name    testConditionalExpression0640
     * @tc.desc      While loop with negative BigInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let v: bigint = -1n;

      while (v) {
        if (retcode == 1) {
          retcode = 0;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_2000
     * @tc.name    testConditionalExpression0641
     * @tc.desc      While loop with large BigInt value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0641', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let v: bigint = 9007199254740991n;

      while (v) {
        if (retcode == 1) {
          retcode = 0;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    // ===== Do-while loop with BigInt =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_2100
     * @tc.name    testConditionalExpression0642
     * @tc.desc      Do-while loop with truthy BigInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0642', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let v: bigint = 1n;

      do {
        if (retcode == 1) {
          retcode = 0;
          break;
        }
      } while (v);
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_2200
     * @tc.name    testConditionalExpression0643
     * @tc.desc      Do-while loop with falsy BigInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0643', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let v: bigint = 0n;

      do {
        if (retcode == 1) {
          retcode = 0;
        }
      } while (v);
      expect(retcode).assertEqual(0);
    });

    // ===== If statement with BigInt =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_2300
     * @tc.name    testConditionalExpression0644
     * @tc.desc      If statement with truthy BigInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0644', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: bigint = 1n;

      if (v) {
        res = 0;
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_2400
     * @tc.name    testConditionalExpression0645
     * @tc.desc      If statement with falsy BigInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0645', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: bigint = 0n;

      if (v) {
        res = 0;
      }
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_2500
     * @tc.name    testConditionalExpression0646
     * @tc.desc      If statement with negative BigInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0646', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: bigint = -1n;

      if (v) {
        res = 0;
      }
      expect(res).assertEqual(0);
    });

    // ===== Conditional expression with BigInt =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_2600
     * @tc.name    testConditionalExpression0647
     * @tc.desc      Conditional expression with truthy BigInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0647', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: bigint = 1n;
      let res = v ? 0 : 1;
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_2700
     * @tc.name    testConditionalExpression0648
     * @tc.desc      Conditional expression with falsy BigInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0648', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: bigint = 0n;
      let res = v ? 0 : 1;
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_2800
     * @tc.name    testConditionalExpression0649
     * @tc.desc      Conditional expression with negative BigInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0649', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: bigint = -1n;
      let res = v ? 0 : 1;
      expect(res).assertEqual(0);
    });

    // ===== Array operations with BigInt =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_2900
     * @tc.name    testConditionalExpression0650
     * @tc.desc      BigInt array index access truthiness
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: bigint[] = [0n, 1n, -1n];
      let res: number = 1;

      if (arr[0]) {  // 0n is falsy
        res = 0;
      }
      expect(res).assertEqual(1);

      if (arr[1]) {  // 1n is truthy
        res = 0;
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_3000
     * @tc.name    testConditionalExpression0651
     * @tc.desc      BigInt array filter with comparison
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0651', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: bigint[] = [0n, 1n, 2n, 3n];
      let filtered = arr.filter(x => x > 0n);
      expect(filtered.length).assertEqual(3);
    });

    // ===== Object with BigInt property =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_3100
     * @tc.name    testConditionalExpression0652
     * @tc.desc      Object with BigInt property truthiness
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0652', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: BigIntObj = new BigIntObj(0n);
      let res: number = 1;

      if (obj.count) {
        res = 0;
      }
      expect(res).assertEqual(1);

      obj.count = 1n;
      if (obj.count) {
        res = 0;
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_3200
     * @tc.name    testConditionalExpression0653
     * @tc.desc      BigInt object optional chain with nullish coalescing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0653', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: BigIntObj2 = new BigIntObj2(0n);
      let result: bigint = obj.big ?? -1n;
      expect(result).assertEqual(0n);
    });

    // ===== Enum with BigInt combination =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_3300
     * @tc.name    testConditionalExpression0654
     * @tc.desc      BigInt truthy with enum AND operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0654', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 1n;
      let mode: Mode = Mode.ON;

      expect(((a && mode) ? true : false)).assertTrue();
      expect(((a || mode) ? true : false)).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SIXTEEN_EXPRESSIONS_3400
     * @tc.name    testConditionalExpression0655
     * @tc.desc      BigInt falsy with enum OR operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0655', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 0n;
      let mode: Mode = Mode.OFF;  // 0

      expect(((a && mode) ? false : true)).assertTrue();
      expect(((a || mode) ? false : true)).assertTrue();
    });
  });
}
