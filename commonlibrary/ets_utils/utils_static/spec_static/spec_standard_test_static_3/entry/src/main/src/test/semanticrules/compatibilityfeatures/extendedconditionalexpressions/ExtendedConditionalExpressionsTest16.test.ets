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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0001
     * @tc.name      testOpsBigIntTruthy_16_0001
     * @tc.desc      BigInt truthy base value operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsBigIntTruthy_16_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0002
     * @tc.name      testOpsBigIntTruthyWithNumber_16_0002
     * @tc.desc      BigInt truthy with Number operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsBigIntTruthyWithNumber_16_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 9223372036854775807n;

      expect(((a && 0) ? false : true)).assertTrue();
      expect(((a || 0) ? true : false)).assertTrue();
      expect(((a && 1) ? true : false)).assertTrue();
      expect(((a || 1) ? true : false)).assertTrue();
      expect(((a && Number.NaN) ? false : true)).assertTrue();
      expect(((a || Number.NaN) ? true : false)).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0003
     * @tc.name      testOpsBigIntTruthyWithLong_16_0003
     * @tc.desc      BigInt truthy with Long value operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsBigIntTruthyWithLong_16_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0004
     * @tc.name      testOpsBigIntTruthyWithBoolean_16_0004
     * @tc.desc      BigInt truthy with Boolean operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsBigIntTruthyWithBoolean_16_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 9223372036854775807n;

      expect(((a && false) ? false : true)).assertTrue();
      expect(((a || false) ? true : false)).assertTrue();
      expect(((a && true) ? true : false)).assertTrue();
      expect(((a || true) ? true : false)).assertTrue();
    });

    // ===== BigInt falsy base value (0n) - ops pattern =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0005
     * @tc.name      testOpsBigIntFalsy_16_0005
     * @tc.desc      BigInt falsy base value operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsBigIntFalsy_16_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 0n;  // falsy base value

      expect((!a) ? true : false).assertTrue();
      expect(((a && 1n) ? false : true)).assertTrue();
      expect(((a || 1n) ? true : false)).assertTrue();
      expect(((a && -1n) ? false : true)).assertTrue();
      expect(((a || -1n) ? true : false)).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0006
     * @tc.name      testOpsBigIntFalsyWithNumber_16_0006
     * @tc.desc      BigInt falsy with Number operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsBigIntFalsyWithNumber_16_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 0n;

      expect(((a && 0) ? false : true)).assertTrue();
      expect(((a || 0) ? false : true)).assertTrue();
      expect(((a && 1) ? false : true)).assertTrue();
      expect(((a || 1) ? true : false)).assertTrue();
      expect(((a && Number.NaN) ? false : true)).assertTrue();
      expect(((a || Number.NaN) ? false : true)).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0007
     * @tc.name      testOpsBigIntFalsyWithLong_16_0007
     * @tc.desc      BigInt falsy with Long value operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsBigIntFalsyWithLong_16_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0008
     * @tc.name      testOpsBigIntNegative_16_0008
     * @tc.desc      BigInt negative value operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsBigIntNegative_16_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = -1n;  // truthy

      expect((!a) ? false : true).assertTrue();
      expect(((a && 0n) ? false : true)).assertTrue();
      expect(((a || 0n) ? true : false)).assertTrue();
      expect(((a && 1n) ? true : false)).assertTrue();
    });

    // ===== Char truthiness tests =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0009
     * @tc.name      testOpsCharNullTruthy_16_0009
     * @tc.desc      Char null character truthiness tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsCharNullTruthy_16_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: char = c'\u0000';  // falsy

      expect((!a) ? true : false).assertTrue();
      expect(((a && c' ') ? false : true)).assertTrue();
      expect(((a || c' ') ? true : false)).assertTrue();
      expect(((a && 1) ? false : true)).assertTrue();
      expect(((a || 1) ? true : false)).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0010
     * @tc.name      testOpsCharSpaceTruthy_16_0010
     * @tc.desc      Char space character truthiness tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsCharSpaceTruthy_16_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: char = c' ';  // truthy

      expect((!a) ? false : true).assertTrue();
      expect(((a && c'\u0000') ? false : true)).assertTrue();
      expect(((a || c'\u0000') ? true : false)).assertTrue();
      expect(((a && 1) ? true : false)).assertTrue();
      expect(((a || 1) ? true : false)).assertTrue();
    });

    // ===== String method return values =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0011
     * @tc.name      testOpsStringEmptySubstring_16_0011
     * @tc.desc      String empty substring truthiness tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsStringEmptySubstring_16_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: String = new String("\u0000\u0000").substring(0, 0);  // falsy

      expect((!a) ? true : false).assertTrue();
      expect(((a && "x") ? false : true)).assertTrue();
      expect(((a || "x") ? true : false)).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0012
     * @tc.name      testOpsStringNonEmptySubstring_16_0012
     * @tc.desc      String non-empty substring truthiness tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsStringNonEmptySubstring_16_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: String = new String("\u0000\u0000").substring(0, 1);  // truthy

      expect((!a) ? false : true).assertTrue();
      expect(((a && "x") ? true : false)).assertTrue();
      expect(((a || "x") ? true : false)).assertTrue();
    });

    // ===== Number special values with BigInt =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0013
     * @tc.name      testOpsBigIntWithPositiveInfinity_16_0013
     * @tc.desc      BigInt with positive infinity operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsBigIntWithPositiveInfinity_16_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 1n;

      expect(((a && Number.POSITIVE_INFINITY) ? true : false)).assertTrue();
      expect(((a || Number.POSITIVE_INFINITY) ? true : false)).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0014
     * @tc.name      testOpsBigIntWithNegativeInfinity_16_0014
     * @tc.desc      BigInt with negative infinity operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsBigIntWithNegativeInfinity_16_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 1n;

      expect(((a && Number.NEGATIVE_INFINITY) ? true : false)).assertTrue();
      expect(((a || Number.NEGATIVE_INFINITY) ? true : false)).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0015
     * @tc.name      testOpsBigIntWithNaN_16_0015
     * @tc.desc      BigInt with NaN operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsBigIntWithNaN_16_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 1n;

      expect(((a && Number.NaN) ? false : true)).assertTrue();
      expect(((a || Number.NaN) ? true : false)).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0016
     * @tc.name      testOpsBigIntWithMinValue_16_0016
     * @tc.desc      BigInt with Number MIN_VALUE operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsBigIntWithMinValue_16_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 1n;

      expect(((a && Number.MIN_VALUE) ? true : false)).assertTrue();
      expect(((a || Number.MIN_VALUE) ? true : false)).assertTrue();
    });

    // ===== While loop with BigInt =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0017
     * @tc.name      testWhileBigIntTruthy_16_0017
     * @tc.desc      While loop with truthy BigInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileBigIntTruthy_16_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0018
     * @tc.name      testWhileBigIntFalsy_16_0018
     * @tc.desc      While loop with falsy BigInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileBigIntFalsy_16_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0019
     * @tc.name      testWhileBigIntNegative_16_0019
     * @tc.desc      While loop with negative BigInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileBigIntNegative_16_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0020
     * @tc.name      testWhileBigIntLarge_16_0020
     * @tc.desc      While loop with large BigInt value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileBigIntLarge_16_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0021
     * @tc.name      testDoWhileBigIntTruthy_16_0021
     * @tc.desc      Do-while loop with truthy BigInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDoWhileBigIntTruthy_16_0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0022
     * @tc.name      testDoWhileBigIntFalsy_16_0022
     * @tc.desc      Do-while loop with falsy BigInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDoWhileBigIntFalsy_16_0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0023
     * @tc.name      testIfBigIntTruthy_16_0023
     * @tc.desc      If statement with truthy BigInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfBigIntTruthy_16_0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: bigint = 1n;

      if (v) {
        res = 0;
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0024
     * @tc.name      testIfBigIntFalsy_16_0024
     * @tc.desc      If statement with falsy BigInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfBigIntFalsy_16_0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: bigint = 0n;

      if (v) {
        res = 0;
      }
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0025
     * @tc.name      testIfBigIntNegative_16_0025
     * @tc.desc      If statement with negative BigInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfBigIntNegative_16_0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: bigint = -1n;

      if (v) {
        res = 0;
      }
      expect(res).assertEqual(0);
    });

    // ===== Conditional expression with BigInt =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0026
     * @tc.name      testCondBigIntTruthy_16_0026
     * @tc.desc      Conditional expression with truthy BigInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondBigIntTruthy_16_0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: bigint = 1n;
      let res = v ? 0 : 1;
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0027
     * @tc.name      testCondBigIntFalsy_16_0027
     * @tc.desc      Conditional expression with falsy BigInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondBigIntFalsy_16_0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: bigint = 0n;
      let res = v ? 0 : 1;
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0028
     * @tc.name      testCondBigIntNegative_16_0028
     * @tc.desc      Conditional expression with negative BigInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondBigIntNegative_16_0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: bigint = -1n;
      let res = v ? 0 : 1;
      expect(res).assertEqual(0);
    });

    // ===== Array operations with BigInt =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0029
     * @tc.name      testBigIntArrayIndexAccess_16_0029
     * @tc.desc      BigInt array index access truthiness
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBigIntArrayIndexAccess_16_0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0030
     * @tc.name      testBigIntArrayFilter_16_0030
     * @tc.desc      BigInt array filter with comparison
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBigIntArrayFilter_16_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: bigint[] = [0n, 1n, 2n, 3n];
      let filtered = arr.filter(x => x > 0n);
      expect(filtered.length).assertEqual(3);
    });

    // ===== Object with BigInt property =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0031
     * @tc.name      testBigIntObjectProperty_16_0031
     * @tc.desc      Object with BigInt property truthiness
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBigIntObjectProperty_16_0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0032
     * @tc.name      testBigIntObjectOptionalChain_16_0032
     * @tc.desc      BigInt object optional chain with nullish coalescing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBigIntObjectOptionalChain_16_0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: BigIntObj2 = new BigIntObj2(0n);
      let result: bigint = obj.big ?? -1n;
      expect(result).assertEqual(0n);
    });

    // ===== Enum with BigInt combination =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0033
     * @tc.name      testBigIntEnumAnd_16_0033
     * @tc.desc      BigInt truthy with enum AND operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBigIntEnumAnd_16_0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 1n;
      let mode: Mode = Mode.ON;

      expect(((a && mode) ? true : false)).assertTrue();
      expect(((a || mode) ? true : false)).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16_0034
     * @tc.name      testBigIntEnumOr_16_0034
     * @tc.desc      BigInt falsy with enum OR operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBigIntEnumOr_16_0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 0n;
      let mode: Mode = Mode.OFF;  // 0

      expect(((a && mode) ? false : true)).assertTrue();
      expect(((a || mode) ? false : true)).assertTrue();
    });
  });
}
