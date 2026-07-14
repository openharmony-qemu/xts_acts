'use static';

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level,
  Size, TestType
} from '../../../../hypium/index';
import Utils from './../Util.test';

const BIGINT_HEX_1F = BigInt('0x1F');
const BIGINT_OCTAL_37 = BigInt('0o37');
const BIGINT_BINARY_1111 = BigInt('0b1111');
const BIGINT_HEX_F = BigInt('0xF');
const BIGINT_OCTAL_17 = BigInt('0o17');

function createMixedRadixFifteenArray(): BigInt64Array {
  return new BigInt64Array([BIGINT_HEX_F, BIGINT_OCTAL_17, BIGINT_BINARY_1111, 15n]);
}

export default function BigInt64ArrayIncludes01Test(): void {
  describe('BigInt64ArrayIncludes01Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_ONE_0100
     * @tc.name testBigInt64ArrayIncludesOne0100
     * @tc.desc Verify `new BigInt64Array([]).includes(0n)` returns expected result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesOne0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let res = arr.includes(0n);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_ONE_0200
     * @tc.name testBigInt64ArrayIncludesOne0200
     * @tc.desc Verify `new BigInt64Array([]).includes(1n)` returns expected result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesOne0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let res = arr.includes(1n);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_ONE_0300
     * @tc.name testBigInt64ArrayIncludesOne0300
     * @tc.desc Verify `new BigInt64Array([]).includes(-1n)` returns expected result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesOne0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let res = arr.includes(-1n);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_ONE_0400
     * @tc.name testBigInt64ArrayIncludesOne0400
     * @tc.desc Verify `new BigInt64Array([]).includes(9223372036854775807n)` returns expected result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesOne0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let res = arr.includes(9223372036854775807n);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_ONE_0500
     * @tc.name testBigInt64ArrayIncludesOne0500
     * @tc.desc Verify `new BigInt64Array([]).includes(-9223372036854775808n)` returns expected result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesOne0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let res = arr.includes(-9223372036854775807n - 1n);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_ONE_0600
     * @tc.name testBigInt64ArrayIncludesOne0600
     * @tc.desc Verify `new BigInt64Array([0n]).includes(0n)` returns expected result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesOne0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let res = arr.includes(0n);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_ONE_0700
     * @tc.name testBigInt64ArrayIncludesOne0700
     * @tc.desc Verify `new BigInt64Array([0n]).includes(1n)` returns expected result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesOne0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let res = arr.includes(1n);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_ONE_0800
     * @tc.name testBigInt64ArrayIncludesOne0800
     * @tc.desc Verify `new BigInt64Array([0n]).includes(-1n)` returns expected result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesOne0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let res = arr.includes(-1n);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_ONE_0900
     * @tc.name testBigInt64ArrayIncludesOne0900
     * @tc.desc Verify `new BigInt64Array([0n]).includes(9223372036854775807n)` returns expected result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesOne0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let res = arr.includes(9223372036854775807n);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_ONE_1000
     * @tc.name testBigInt64ArrayIncludesOne1000
     * @tc.desc Verify `new BigInt64Array([0n]).includes(-9223372036854775808n)` returns expected result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesOne1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let res = arr.includes(-9223372036854775807n - 1n);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_ONE_1100
     * @tc.name testBigInt64ArrayIncludesOne1100
     * @tc.desc Verify `new BigInt64Array([1n]).includes(0n)` returns expected result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesOne1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let res = arr.includes(0n);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_ONE_1200
     * @tc.name testBigInt64ArrayIncludesOne1200
     * @tc.desc Verify `new BigInt64Array([1n]).includes(1n)` returns expected result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesOne1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let res = arr.includes(1n);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_ONE_1300
     * @tc.name testBigInt64ArrayIncludesOne1300
     * @tc.desc Verify `new BigInt64Array([1n]).includes(-1n)` returns expected result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesOne1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let res = arr.includes(-1n);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_ONE_1400
     * @tc.name testBigInt64ArrayIncludesOne1400
     * @tc.desc Verify `new BigInt64Array([1n]).includes(9223372036854775807n)` returns expected result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesOne1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let res = arr.includes(9223372036854775807n);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_ONE_1500
     * @tc.name testBigInt64ArrayIncludesOne1500
     * @tc.desc Verify `new BigInt64Array([1n]).includes(-9223372036854775808n)` returns expected result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesOne1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let res = arr.includes(-9223372036854775807n - 1n);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_TWO_1600
     * @tc.name testBigInt64ArrayIncludesTwo1600
     * @tc.desc Verify includes returns false when [-1n] searches 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesTwo1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n]);
      let res = arr.includes(0n);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_TWO_1700
     * @tc.name testBigInt64ArrayIncludesTwo1700
     * @tc.desc Verify includes returns false when [-1n] searches 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesTwo1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n]);
      let res = arr.includes(1n);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_TWO_1800
     * @tc.name testBigInt64ArrayIncludesTwo1800
     * @tc.desc Verify includes returns true when [-1n] searches -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesTwo1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n]);
      let res = arr.includes(-1n);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_TWO_1900
     * @tc.name testBigInt64ArrayIncludesTwo1900
     * @tc.desc Verify includes returns false when [-1n] searches 9223372036854775807n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesTwo1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n]);
      let res = arr.includes(9223372036854775807n);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_TWO_2000
     * @tc.name testBigInt64ArrayIncludesTwo2000
     * @tc.desc Verify includes returns false when [-1n] searches -9223372036854775808n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesTwo2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n]);
      let res = arr.includes(-9223372036854775807n - 1n);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_TWO_2100
     * @tc.name testBigInt64ArrayIncludesTwo2100
     * @tc.desc Verify includes returns false when [9223372036854775807n] searches 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesTwo2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let res = arr.includes(0n);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_TWO_2200
     * @tc.name testBigInt64ArrayIncludesTwo2200
     * @tc.desc Verify includes returns false when [9223372036854775807n] searches 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesTwo2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let res = arr.includes(1n);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_TWO_2300
     * @tc.name testBigInt64ArrayIncludesTwo2300
     * @tc.desc Verify includes returns false when [9223372036854775807n] searches -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesTwo2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let res = arr.includes(-1n);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_TWO_2400
     * @tc.name testBigInt64ArrayIncludesTwo2400
     * @tc.desc Verify includes returns true when [9223372036854775807n] searches 9223372036854775807n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesTwo2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let res = arr.includes(9223372036854775807n);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_TWO_2500
     * @tc.name testBigInt64ArrayIncludesTwo2500
     * @tc.desc Verify includes returns false when [9223372036854775807n] searches -9223372036854775808n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesTwo2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let res = arr.includes(-9223372036854775807n - 1n);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_TWO_2600
     * @tc.name testBigInt64ArrayIncludesTwo2600
     * @tc.desc Verify includes returns false when [-9223372036854775808n] searches 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesTwo2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n]);
      let res = arr.includes(0n);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_TWO_2700
     * @tc.name testBigInt64ArrayIncludesTwo2700
     * @tc.desc Verify includes returns false when [-9223372036854775808n] searches 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesTwo2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n]);
      let res = arr.includes(1n);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_TWO_2800
     * @tc.name testBigInt64ArrayIncludesTwo2800
     * @tc.desc Verify includes returns false when [-9223372036854775808n] searches -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesTwo2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n]);
      let res = arr.includes(-1n);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_TWO_2900
     * @tc.name testBigInt64ArrayIncludesTwo2900
     * @tc.desc Verify includes returns false when [-9223372036854775808n] searches 9223372036854775807n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesTwo2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n]);
      let res = arr.includes(9223372036854775807n);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_TWO_3000
     * @tc.name testBigInt64ArrayIncludesTwo3000
     * @tc.desc Verify includes returns true when [-9223372036854775808n] searches -9223372036854775808n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesTwo3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n]);
      let res = arr.includes(-9223372036854775807n - 1n);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_THREE_3100
     * @tc.name testBigInt64ArrayIncludesThree3100
     * @tc.desc Verify includes returns true when searching 0n in [0n, 1n, -1n, 42n, -42n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesThree3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, -1n, 42n, -42n]);
      let res = arr.includes(0n);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_THREE_3200
     * @tc.name testBigInt64ArrayIncludesThree3200
     * @tc.desc Verify includes returns true when searching 1n in [0n, 1n, -1n, 42n, -42n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesThree3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, -1n, 42n, -42n]);
      let res = arr.includes(1n);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_THREE_3300
     * @tc.name testBigInt64ArrayIncludesThree3300
     * @tc.desc Verify includes returns true when searching -1n in [0n, 1n, -1n, 42n, -42n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesThree3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, -1n, 42n, -42n]);
      let res = arr.includes(-1n);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_THREE_3400
     * @tc.name testBigInt64ArrayIncludesThree3400
     * @tc.desc Verify includes returns false when searching 9223372036854775807n in [0n, 1n, -1n, 42n, -42n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesThree3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, -1n, 42n, -42n]);
      let res = arr.includes(9223372036854775807n);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_THREE_3500
     * @tc.name testBigInt64ArrayIncludesThree3500
     * @tc.desc Verify includes returns false when searching -9223372036854775808n in [0n, 1n, -1n, 42n, -42n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesThree3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, -1n, 42n, -42n]);
      let res = arr.includes(-9223372036854775807n - 1n);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_THREE_3600
     * @tc.name testBigInt64ArrayIncludesThree3600
     * @tc.desc Verify includes returns true when searching 42n in [0n, 1n, -1n, 42n, -42n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesThree3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, -1n, 42n, -42n]);
      let res = arr.includes(42n);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_THREE_3700
     * @tc.name testBigInt64ArrayIncludesThree3700
     * @tc.desc Verify includes returns true when searching -42n in [0n, 1n, -1n, 42n, -42n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesThree3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, -1n, 42n, -42n]);
      let res = arr.includes(-42n);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_THREE_3800
     * @tc.name testBigInt64ArrayIncludesThree3800
     * @tc.desc Verify includes returns false when searching 0n in [9223372036854775807n, -9223372036854775808n,
     * 0x1Fn, 0o37n, 0b1111n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesThree3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        9223372036854775807n,
        -9223372036854775807n - 1n,
        31n,
        31n,
        15n
      ]);
      let res = arr.includes(0n);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_THREE_3900
     * @tc.name testBigInt64ArrayIncludesThree3900
     * @tc.desc Verify includes returns true when searching 9223372036854775807n in [9223372036854775807n,
     * -9223372036854775808n, 0x1Fn, 0o37n, 0b1111n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesThree3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        9223372036854775807n,
        -9223372036854775807n - 1n,
        31n,
        31n,
        15n
      ]);
      let res = arr.includes(9223372036854775807n);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_THREE_4000
     * @tc.name testBigInt64ArrayIncludesThree4000
     * @tc.desc Verify includes returns true when searching -9223372036854775808n in [9223372036854775807n,
     * -9223372036854775808n, 0x1Fn, 0o37n, 0b1111n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesThree4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        9223372036854775807n,
        -9223372036854775807n - 1n,
        31n,
        31n,
        15n
      ]);
      let res = arr.includes(-9223372036854775807n - 1n);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_THREE_4100
     * @tc.name testBigInt64ArrayIncludesThree4100
     * @tc.desc Verify includes returns true when searching 0x1Fn in [9223372036854775807n, -9223372036854775808n,
     * 0x1Fn, 0o37n, 0b1111n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesThree4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        9223372036854775807n,
        -9223372036854775807n - 1n,
        31n,
        31n,
        15n
      ]);
      let res = arr.includes(31n);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_THREE_4200
     * @tc.name testBigInt64ArrayIncludesThree4200
     * @tc.desc Verify includes returns true when searching 0b1111n in [9223372036854775807n, -9223372036854775808n,
     * 0x1Fn, 0o37n, 0b1111n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesThree4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        9223372036854775807n,
        -9223372036854775807n - 1n,
        31n,
        31n,
        15n
      ]);
      let res = arr.includes(15n);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_THREE_4300
     * @tc.name testBigInt64ArrayIncludesThree4300
     * @tc.desc Verify includes returns false when searching 0n in [-10n, 10n, 255n, -255n, 88n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesThree4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-10n, 10n, 255n, -255n, 88n]);
      let res = arr.includes(0n);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_THREE_4400
     * @tc.name testBigInt64ArrayIncludesThree4400
     * @tc.desc Verify includes returns false when searching 9223372036854775807n in [-10n, 10n, 255n, -255n, 88n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesThree4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-10n, 10n, 255n, -255n, 88n]);
      let res = arr.includes(9223372036854775807n);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_THREE_4500
     * @tc.name testBigInt64ArrayIncludesThree4500
     * @tc.desc Verify includes returns false when searching -9223372036854775808n in [-10n, 10n, 255n, -255n, 88n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesThree4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-10n, 10n, 255n, -255n, 88n]);
      let res = arr.includes(-9223372036854775808n);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_FOUR_4600
     * @tc.name testBigInt64ArrayIncludesFour4600
     * @tc.desc Verify includes returns false when searching -42n in the baseline array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesFour4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-10n, 10n, 255n, -255n, 88n]);
      let res = arr.includes(-42n);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_FOUR_4700
     * @tc.name testBigInt64ArrayIncludesFour4700
     * @tc.desc Verify includes returns true when searching 10n in the baseline array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesFour4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-10n, 10n, 255n, -255n, 88n]);
      let res = arr.includes(10n);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_FOUR_4800
     * @tc.name testBigInt64ArrayIncludesFour4800
     * @tc.desc Verify includes returns true when searching -10n in the baseline array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesFour4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-10n, 10n, 255n, -255n, 88n]);
      let res = arr.includes(-10n);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_FOUR_4900
     * @tc.name testBigInt64ArrayIncludesFour4900
     * @tc.desc Verify includes returns true when searching 255n in the baseline array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesFour4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-10n, 10n, 255n, -255n, 88n]);
      let res = arr.includes(255n);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_FOUR_5000
     * @tc.name testBigInt64ArrayIncludesFour5000
     * @tc.desc Verify includes returns true when searching -255n in the baseline array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesFour5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-10n, 10n, 255n, -255n, 88n]);
      let res = arr.includes(-255n);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_FOUR_5100
     * @tc.name testBigInt64ArrayIncludesFour5100
     * @tc.desc Verify includes returns true when searching 88n in the baseline array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesFour5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-10n, 10n, 255n, -255n, 88n]);
      let res = arr.includes(88n);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_FOUR_5200
     * @tc.name testBigInt64ArrayIncludesFour5200
     * @tc.desc Verify includes finds repeated 10n when fromIndex is 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesFour5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 10n, 20n]);
      let res = arr.includes(10n, 0);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_FOUR_5300
     * @tc.name testBigInt64ArrayIncludesFour5300
     * @tc.desc Verify includes returns false for missing 99n when fromIndex is 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesFour5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 10n, 20n]);
      let res = arr.includes(99n, 0);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_FOUR_5400
     * @tc.name testBigInt64ArrayIncludesFour5400
     * @tc.desc Verify includes finds repeated 10n when fromIndex is 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesFour5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 10n, 20n]);
      let res = arr.includes(10n, 1);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_FOUR_5500
     * @tc.name testBigInt64ArrayIncludesFour5500
     * @tc.desc Verify includes finds unique 30n when fromIndex is 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesFour5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 10n, 20n]);
      let res = arr.includes(30n, 2);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_FOUR_5600
     * @tc.name testBigInt64ArrayIncludesFour5600
     * @tc.desc Verify includes returns false for 30n when fromIndex is 3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesFour5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 10n, 20n]);
      let res = arr.includes(30n, 3);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_FOUR_5700
     * @tc.name testBigInt64ArrayIncludesFour5700
     * @tc.desc Verify includes finds trailing 20n when fromIndex is 3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesFour5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 10n, 20n]);
      let res = arr.includes(20n, 3);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_FOUR_5800
     * @tc.name testBigInt64ArrayIncludesFour5800
     * @tc.desc Verify includes finds repeated 10n when fromIndex is 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesFour5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 10n, 20n]);
      let res = arr.includes(10n, 5);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_FOUR_5900
     * @tc.name testBigInt64ArrayIncludesFour5900
     * @tc.desc Verify includes finds trailing 20n when fromIndex is 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesFour5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 10n, 20n]);
      let res = arr.includes(20n, 5);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_FOUR_6000
     * @tc.name testBigInt64ArrayIncludesFour6000
     * @tc.desc Verify includes returns false for 10n when fromIndex is 6.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesFour6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 10n, 20n]);
      let res = arr.includes(10n, 6);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_FOUR_6100
     * @tc.name testBigInt64ArrayIncludesFour6100
     * @tc.desc Verify includes finds 20n at the last index when fromIndex is 6.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesFour6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 10n, 20n]);
      let res = arr.includes(20n, 6);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_FOUR_6200
     * @tc.name testBigInt64ArrayIncludesFour6200
     * @tc.desc Verify includes returns false for 10n when fromIndex is 7.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesFour6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 10n, 20n]);
      let res = arr.includes(10n, 7);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_FOUR_6300
     * @tc.name testBigInt64ArrayIncludesFour6300
     * @tc.desc Verify includes returns false for 10n when fromIndex is 8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesFour6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 10n, 20n]);
      let res = arr.includes(10n, 8);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_FOUR_6400
     * @tc.name testBigInt64ArrayIncludesFour6400
     * @tc.desc Verify includes returns false when fromIndex is far beyond array length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesFour6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 10n, 20n]);
      let res = arr.includes(10n, 100);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_FIVE_6500
     * @tc.name testBigInt64ArrayIncludesFive6500
     * @tc.desc Verify includes returns false for repeated 10n when fromIndex is 2147483647.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesFive6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 10n, 20n]);
      let res = arr.includes(10n, 2147483647);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_FIVE_6600
     * @tc.name testBigInt64ArrayIncludesFive6600
     * @tc.desc Verify includes returns false for repeated 10n when fromIndex is -1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesFive6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 10n, 20n]);
      let res = arr.includes(10n, -1);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_FIVE_6700
     * @tc.name testBigInt64ArrayIncludesFive6700
     * @tc.desc Verify includes returns true for repeated 20n when fromIndex is -1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesFive6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 10n, 20n]);
      let res = arr.includes(20n, -1);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_FIVE_6800
     * @tc.name testBigInt64ArrayIncludesFive6800
     * @tc.desc Verify includes returns true for repeated 10n when fromIndex is -2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesFive6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 10n, 20n]);
      let res = arr.includes(10n, -2);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_FIVE_6900
     * @tc.name testBigInt64ArrayIncludesFive6900
     * @tc.desc Verify includes returns true for repeated 20n when fromIndex is -2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesFive6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 10n, 20n]);
      let res = arr.includes(20n, -2);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_FIVE_7000
     * @tc.name testBigInt64ArrayIncludesFive7000
     * @tc.desc Verify includes returns false for existing 30n when fromIndex is -4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesFive7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 10n, 20n]);
      let res = arr.includes(30n, -4);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_FIVE_7100
     * @tc.name testBigInt64ArrayIncludesFive7100
     * @tc.desc Verify includes returns true for existing 30n when fromIndex is -5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesFive7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 10n, 20n]);
      let res = arr.includes(30n, -5);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_FIVE_7200
     * @tc.name testBigInt64ArrayIncludesFive7200
     * @tc.desc Verify includes returns true for repeated 10n when fromIndex is -7.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesFive7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 10n, 20n]);
      let res = arr.includes(10n, -7);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_FIVE_7300
     * @tc.name testBigInt64ArrayIncludesFive7300
     * @tc.desc Verify includes returns false for missing 99n when fromIndex is -7.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesFive7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 10n, 20n]);
      let res = arr.includes(99n, -7);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_FIVE_7400
     * @tc.name testBigInt64ArrayIncludesFive7400
     * @tc.desc Verify includes returns true for repeated 10n when fromIndex is -8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesFive7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 10n, 20n]);
      let res = arr.includes(10n, -8);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_FIVE_7500
     * @tc.name testBigInt64ArrayIncludesFive7500
     * @tc.desc Verify includes returns false for missing 99n when fromIndex is -8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesFive7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 10n, 20n]);
      let res = arr.includes(99n, -8);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_FIVE_7600
     * @tc.name testBigInt64ArrayIncludesFive7600
     * @tc.desc Verify includes returns true for repeated 10n when fromIndex is -100.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesFive7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 10n, 20n]);
      let res = arr.includes(10n, -100);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_FIVE_7700
     * @tc.name testBigInt64ArrayIncludesFive7700
     * @tc.desc Verify includes returns false for missing 99n when fromIndex is -100.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesFive7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 10n, 20n]);
      let res = arr.includes(99n, -100);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_SIX_7800
     * @tc.name testBigInt64ArrayIncludesSix7800
     * @tc.desc Verify includes finds repeated 10n when fromIndex is -2147483648.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesSix7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 10n, 20n]);
      let res = arr.includes(10n, -2147483648);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_SIX_7900
     * @tc.name testBigInt64ArrayIncludesSix7900
     * @tc.desc Verify includes returns false for missing 99n when fromIndex is -2147483648.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesSix7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 10n, 20n]);
      let res = arr.includes(99n, -2147483648);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_SIX_8000
     * @tc.name testBigInt64ArrayIncludesSix8000
     * @tc.desc Verify includes finds equivalent 0xFn in the mixed-radix 15n array when fromIndex is -4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesSix8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createMixedRadixFifteenArray();
      let res = arr.includes(BIGINT_HEX_F, -4);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_SIX_8100
     * @tc.name testBigInt64ArrayIncludesSix8100
     * @tc.desc Verify includes finds equivalent 0xFn in the mixed-radix 15n array when fromIndex is 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesSix8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createMixedRadixFifteenArray();
      let res = arr.includes(BIGINT_HEX_F, 0);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_SIX_8200
     * @tc.name testBigInt64ArrayIncludesSix8200
     * @tc.desc Verify includes finds equivalent 0xFn in the mixed-radix 15n array when fromIndex is 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesSix8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createMixedRadixFifteenArray();
      let res = arr.includes(BIGINT_HEX_F, 1);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_SIX_8300
     * @tc.name testBigInt64ArrayIncludesSix8300
     * @tc.desc Verify includes finds equivalent 0xFn in the mixed-radix 15n array when fromIndex is 3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesSix8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createMixedRadixFifteenArray();
      let res = arr.includes(BIGINT_HEX_F, 3);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_SIX_8400
     * @tc.name testBigInt64ArrayIncludesSix8400
     * @tc.desc Verify includes returns false for 0xFn in the mixed-radix 15n array when fromIndex is 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesSix8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createMixedRadixFifteenArray();
      let res = arr.includes(BIGINT_HEX_F, 4);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_SIX_8500
     * @tc.name testBigInt64ArrayIncludesSix8500
     * @tc.desc Verify includes finds equivalent 0o17n in the mixed-radix 15n array when fromIndex is -4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesSix8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createMixedRadixFifteenArray();
      let res = arr.includes(BIGINT_OCTAL_17, -4);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_SIX_8600
     * @tc.name testBigInt64ArrayIncludesSix8600
     * @tc.desc Verify includes returns false for 0o17n in the mixed-radix 15n array when fromIndex is 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesSix8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createMixedRadixFifteenArray();
      let res = arr.includes(BIGINT_OCTAL_17, 4);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_SIX_8700
     * @tc.name testBigInt64ArrayIncludesSix8700
     * @tc.desc Verify includes finds equivalent 0b1111n in the mixed-radix 15n array when fromIndex is -4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesSix8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createMixedRadixFifteenArray();
      let res = arr.includes(BIGINT_BINARY_1111, -4);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_SIX_8800
     * @tc.name testBigInt64ArrayIncludesSix8800
     * @tc.desc Verify includes returns false for 0b1111n in the mixed-radix 15n array when fromIndex is 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesSix8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createMixedRadixFifteenArray();
      let res = arr.includes(BIGINT_BINARY_1111, 4);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_SIX_8900
     * @tc.name testBigInt64ArrayIncludesSix8900
     * @tc.desc Verify includes finds equivalent 15n in the mixed-radix 15n array when fromIndex is -4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesSix8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createMixedRadixFifteenArray();
      let res = arr.includes(15n, -4);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_SIX_9000
     * @tc.name testBigInt64ArrayIncludesSix9000
     * @tc.desc Verify includes returns false for 15n in the mixed-radix 15n array when fromIndex is 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesSix9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createMixedRadixFifteenArray();
      let res = arr.includes(15n, 4);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_SIX_9100
     * @tc.name testBigInt64ArrayIncludesSix9100
     * @tc.desc Verify undefined fromIndex behaves like an omitted fromIndex for 3n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesSix9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res = arr.includes(3n, undefined);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INCLUDES_SIX_9200
     * @tc.name testBigInt64ArrayIncludesSix9200
     * @tc.desc Verify undefined fromIndex still returns false for missing 5n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIncludesSix9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res = arr.includes(5n, undefined);
      expect(res).assertEqual(false);
    });
  });
}
