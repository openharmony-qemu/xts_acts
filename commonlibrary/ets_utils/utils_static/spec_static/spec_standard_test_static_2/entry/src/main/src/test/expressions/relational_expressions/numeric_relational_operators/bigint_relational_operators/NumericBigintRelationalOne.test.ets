/*---
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../../../../hypium';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

function getOperand1(): number { return 2; }
function getOperand2(): number { return 1; }
function getOperand3(): number { return 1; }
function getOperand4(): number { return -1; }
function getOperand5(): number { return 2.0; }
function getOperand6(): number { return 2.5; }
function getOperand7(): number { return 2.0; }

export default function NumericBigintRelationalTest() {
  describe("NumericBigintRelationalTest", () => {
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
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_10000
     * @tc.name      testNumericBigintRelational0100
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 2n;
      expect(b < 2.5).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_10100
     * @tc.name      testNumericBigintRelational0101
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 5n;
      expect(b < 5.9).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_10200
     * @tc.name      testNumericBigintRelational0102
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 10n;
      expect(b < 10.5).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_10300
     * @tc.name      testNumericBigintRelational0103
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 100n;
      expect(b < 100.9).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_10400
     * @tc.name      testNumericBigintRelational0104
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      expect(b >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_10500
     * @tc.name      testNumericBigintRelational0105
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 2n;
      expect(b >= 1).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_10600
     * @tc.name      testNumericBigintRelational0106
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 5n;
      expect(b >= 5).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_10700
     * @tc.name      testNumericBigintRelational0107
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 10n;
      expect(b >= 5).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_10800
     * @tc.name      testNumericBigintRelational0108
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 100n;
      expect(b >= 100).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_10900
     * @tc.name      testNumericBigintRelational0109
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 0n;
      expect(b <= 1).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_11000
     * @tc.name      testNumericBigintRelational0110
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      expect(b <= 2).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_11100
     * @tc.name      testNumericBigintRelational0111
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 3n;
      expect(b <= 5).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_11200
     * @tc.name      testNumericBigintRelational0112
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 5n;
      expect(b <= 5).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_11300
     * @tc.name      testNumericBigintRelational0113
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 50n;
      expect(b <= 100).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_11400
     * @tc.name      testNumericBigintRelational0114
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      expect(b >= 0.5).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_11500
     * @tc.name      testNumericBigintRelational0115
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 2n;
      expect(b >= 1.9).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_11600
     * @tc.name      testNumericBigintRelational0116
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 5n;
      expect(b >= 5.0).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_11700
     * @tc.name      testNumericBigintRelational0117
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0117", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 10n;
      expect(b >= 5.2).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_11800
     * @tc.name      testNumericBigintRelational0118
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const actual_outcome: boolean = (b < getOperand1());
      expect(actual_outcome).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_11900
     * @tc.name      testNumericBigintRelational0119
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 2n;
      const actual_outcome: boolean = (b < getOperand2());
      expect(actual_outcome).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_12000
     * @tc.name      testNumericBigintRelational0120
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const actual_outcome: boolean = (b < getOperand3());
      expect(actual_outcome).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_12100
     * @tc.name      testNumericBigintRelational0121
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = -2n;
      const actual_outcome: boolean = (b < getOperand4());
      expect(actual_outcome).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_12200
     * @tc.name      testNumericBigintRelational0122
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0122", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const actual_outcome: boolean = (b < getOperand5());
      expect(actual_outcome).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_12300
     * @tc.name      testNumericBigintRelational0123
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0123", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 2n;
      const actual_outcome: boolean = (b < getOperand6());
      expect(actual_outcome).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_12400
     * @tc.name      testNumericBigintRelational0124
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0124", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 2n;
      const actual_outcome: boolean = (b < getOperand7());
      expect(actual_outcome).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_15000
     * @tc.name      testNumericBigintRelational0150
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const x_var: number = 2;
      const actual_outcome: boolean = (b < x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_15100
     * @tc.name      testNumericBigintRelational0151
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0151", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 2n;
      const x_var: number = 1;
      const actual_outcome: boolean = (b < x_var);
      expect(actual_outcome == false).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_15200
     * @tc.name      testNumericBigintRelational0152
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0152", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const x_var: number = 1;
      const actual_outcome: boolean = (b < x_var);
      expect(actual_outcome == false).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_15300
     * @tc.name      testNumericBigintRelational0153
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0153", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = -2n;
      const x_var: number = -1;
      const actual_outcome: boolean = (b < x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_15400
     * @tc.name      testNumericBigintRelational0154
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0154", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const x_var: number = 2.0;
      const actual_outcome: boolean = (b < x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_15500
     * @tc.name      testNumericBigintRelational0155
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0155", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 2n;
      const x_var: number = 2.5;
      const actual_outcome: boolean = (b < x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_15600
     * @tc.name      testNumericBigintRelational0156
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0156", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 2n;
      const x_var: number = 2.0;
      const actual_outcome: boolean = (b < x_var);
      expect(actual_outcome == false).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_15700
     * @tc.name      testNumericBigintRelational0157
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0157", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const x_var: number = 0;
      const actual_outcome: boolean = (b > x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_15800
     * @tc.name      testNumericBigintRelational0158
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0158", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 0n;
      const x_var: number = 1;
      const actual_outcome: boolean = (b > x_var);
      expect(actual_outcome == false).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_15900
     * @tc.name      testNumericBigintRelational0159
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0159", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const x_var: number = 1;
      const actual_outcome: boolean = (b > x_var);
      expect(actual_outcome == false).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_16000
     * @tc.name      testNumericBigintRelational0160
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0160", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = -1n;
      const x_var: number = -2;
      const actual_outcome: boolean = (b > x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_16100
     * @tc.name      testNumericBigintRelational0161
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0161", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const x_var: number = 0.5;
      const actual_outcome: boolean = (b > x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_16200
     * @tc.name      testNumericBigintRelational0162
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0162", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 2n;
      const x_var: number = 1.9;
      const actual_outcome: boolean = (b > x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_16300
     * @tc.name      testNumericBigintRelational0163
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0163", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 5n;
      const x_var: number = 5.0;
      const actual_outcome: boolean = (b > x_var);
      expect(actual_outcome == false).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_16400
     * @tc.name      testNumericBigintRelational0164
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0164", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const x_var: number = 0;
      const actual_outcome: boolean = (b >= x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_16500
     * @tc.name      testNumericBigintRelational0165
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0165", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 0n;
      const x_var: number = 1;
      const actual_outcome: boolean = (b >= x_var);
      expect(actual_outcome == false).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_16600
     * @tc.name      testNumericBigintRelational0166
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0166", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const x_var: number = 1;
      const actual_outcome: boolean = (b >= x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_16700
     * @tc.name      testNumericBigintRelational0167
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0167", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = -1n;
      const x_var: number = -2;
      const actual_outcome: boolean = (b >= x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_16800
     * @tc.name      testNumericBigintRelational0168
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0168", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const x_var: number = 0.5;
      const actual_outcome: boolean = (b >= x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_16900
     * @tc.name      testNumericBigintRelational0169
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0169", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 2n;
      const x_var: number = 1.9;
      const actual_outcome: boolean = (b >= x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_17000
     * @tc.name      testNumericBigintRelational0170
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0170", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 5n;
      const x_var: number = 5.0;
      const actual_outcome: boolean = (b >= x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_17100
     * @tc.name      testNumericBigintRelational0171
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0171", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const x_var: number = 2;
      const actual_outcome: boolean = (b <= x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_17200
     * @tc.name      testNumericBigintRelational0172
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0172", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 2n;
      const x_var: number = 1;
      const actual_outcome: boolean = (b <= x_var);
      expect(actual_outcome == false).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_17300
     * @tc.name      testNumericBigintRelational0173
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0173", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const x_var: number = 1;
      const actual_outcome: boolean = (b <= x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_17400
     * @tc.name      testNumericBigintRelational0174
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0174", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = -2n;
      const x_var: number = -1;
      const actual_outcome: boolean = (b <= x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_17500
     * @tc.name      testNumericBigintRelational0175
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0175", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const x_var: number = 1.1;
      const actual_outcome: boolean = (b <= x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_17600
     * @tc.name      testNumericBigintRelational0176
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0176", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 2n;
      const x_var: number = 2.5;
      const actual_outcome: boolean = (b <= x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_17700
     * @tc.name      testNumericBigintRelational0177
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0177", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 2n;
      const x_var: number = 2.0;
      const actual_outcome: boolean = (b <= x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_17800
     * @tc.name      testNumericBigintRelational0178
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0178", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const x_var: number = 0;
      const actual_outcome: boolean = (b != x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_17900
     * @tc.name      testNumericBigintRelational0179
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0179", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const x_var: number = 1;
      const actual_outcome: boolean = (b != x_var);
      expect(actual_outcome).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_18000
     * @tc.name      testNumericBigintRelational0180
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0180", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const x_var: number = 2.0;
      const actual_outcome: boolean = (b != x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_18100
     * @tc.name      testNumericBigintRelational0181
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0181", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 2n;
      const x_var: number = 2.0;
      const actual_outcome: boolean = (b != x_var);
      expect(actual_outcome).assertTrue();
    });
  });
}
