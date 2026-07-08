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
} from '../../../../hypium/index';
import Utils from './../Util.test';

const BIGINT64_MAX = 9223372036854775807n;
const BIGINT64_MIN = -9223372036854775807n - 1n;
const DECIMAL_ONE_E18 = 1000000000000000000n;
const DECIMAL_NEG_ONE_E18 = -1000000000000000000n;
const HEX_VARIANT_ONE = 4611686018427387904n;
const HEX_VARIANT_TWO = 3458764513820540928n;

export default function BigInt64ArrayOf01Test(): void {
  describe('BigInt64ArrayOf01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0010
     * @tc.name testBigInt64ArrayOfOne0010
     * @tc.desc Verify BigInt64Array.of returns an empty array when called without arguments.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of();
      expect(res.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0020
     * @tc.name testBigInt64ArrayOfOne0020
     * @tc.desc Verify BigInt64Array.of accepts 1 argument and preserves array length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(1);
      expect(res.length).assertEqual(1);
      expect(res.$_get(0)).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0030
     * @tc.name testBigInt64ArrayOfOne0030
     * @tc.desc Verify BigInt64Array.of accepts 2 arguments and preserves array length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(1, 2);
      expect(res.length).assertEqual(2);
      expect(res.$_get(0)).assertEqual(1n);
      expect(res.$_get(1)).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0040
     * @tc.name testBigInt64ArrayOfOne0040
     * @tc.desc Verify BigInt64Array.of accepts 3 arguments and preserves array length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(1, 2, 3);
      expect(res.length).assertEqual(3);
      expect(res.$_get(2)).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0110
     * @tc.name testBigInt64ArrayOfOne0110
     * @tc.desc Verify BigInt64Array.of accepts 10 arguments and preserves array length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      expect(res.length).assertEqual(10);
      expect(res.$_get(9)).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0120
     * @tc.name testBigInt64ArrayOfOne0120
     * @tc.desc Verify BigInt64Array.of converts decimal literal 0 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(0);
      expect(res.$_get(0)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0130
     * @tc.name testBigInt64ArrayOfOne0130
     * @tc.desc Verify BigInt64Array.of converts decimal literal 1 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(1);
      expect(res.$_get(0)).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0180
     * @tc.name testBigInt64ArrayOfOne0180
     * @tc.desc Verify BigInt64Array.of converts decimal literal 9007199254740991 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(9007199254740991);
      expect(res.$_get(0)).assertEqual(9007199254740991n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0190
     * @tc.name testBigInt64ArrayOfOne0190
     * @tc.desc Verify BigInt64Array.of normalizes decimal literal -0 to 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(-0);
      expect(res.$_get(0)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0200
     * @tc.name testBigInt64ArrayOfOne0200
     * @tc.desc Verify BigInt64Array.of converts decimal literal -1 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(-1);
      expect(res.$_get(0)).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0240
     * @tc.name testBigInt64ArrayOfOne0240
     * @tc.desc Verify BigInt64Array.of converts negative decimal boundary -2147483648 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(-2147483648);
      expect(res.$_get(0)).assertEqual(-2147483648n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0250
     * @tc.name testBigInt64ArrayOfOne0250
     * @tc.desc Verify BigInt64Array.of converts large negative decimal literal to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(-9007199254740991);
      expect(res.$_get(0)).assertEqual(-9007199254740991n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0470
     * @tc.name testBigInt64ArrayOfOne0470
     * @tc.desc Verify BigInt64Array.of converts binary literal 0b0 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(0b0);
      expect(res.$_get(0)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0480
     * @tc.name testBigInt64ArrayOfOne0480
     * @tc.desc Verify BigInt64Array.of converts binary literal 0b1 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(0b1);
      expect(res.$_get(0)).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0520
     * @tc.name testBigInt64ArrayOfOne0520
     * @tc.desc Verify BigInt64Array.of converts binary literal 0b1010 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(0b1010);
      expect(res.$_get(0)).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0550
     * @tc.name testBigInt64ArrayOfOne0550
     * @tc.desc Verify BigInt64Array.of converts negative binary literal -0b1 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(-0b1);
      expect(res.$_get(0)).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0590
     * @tc.name testBigInt64ArrayOfOne0590
     * @tc.desc Verify BigInt64Array.of converts negative binary literal -0b1010 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(-0b1010);
      expect(res.$_get(0)).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0620
     * @tc.name testBigInt64ArrayOfOne0620
     * @tc.desc Verify BigInt64Array.of converts octal literal 0o0 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(0o0);
      expect(res.$_get(0)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0630
     * @tc.name testBigInt64ArrayOfOne0630
     * @tc.desc Verify BigInt64Array.of converts octal literal 0o1 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(0o1);
      expect(res.$_get(0)).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0650
     * @tc.name testBigInt64ArrayOfOne0650
     * @tc.desc Verify BigInt64Array.of converts octal literal 0o10 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(0o10);
      expect(res.$_get(0)).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0700
     * @tc.name testBigInt64ArrayOfOne0700
     * @tc.desc Verify BigInt64Array.of converts negative octal literal -0o1 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(-0o1);
      expect(res.$_get(0)).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0720
     * @tc.name testBigInt64ArrayOfOne0720
     * @tc.desc Verify BigInt64Array.of converts negative octal literal -0o10 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(-0o10);
      expect(res.$_get(0)).assertEqual(-8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0770
     * @tc.name testBigInt64ArrayOfOne0770
     * @tc.desc Verify BigInt64Array.of converts hexadecimal literal 0x0 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(0x0);
      expect(res.$_get(0)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0780
     * @tc.name testBigInt64ArrayOfOne0780
     * @tc.desc Verify BigInt64Array.of converts hexadecimal literal 0x1 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(0x1);
      expect(res.$_get(0)).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0820
     * @tc.name testBigInt64ArrayOfOne0820
     * @tc.desc Verify BigInt64Array.of converts hexadecimal literal 0x10 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(0x10);
      expect(res.$_get(0)).assertEqual(16n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0830
     * @tc.name testBigInt64ArrayOfOne0830
     * @tc.desc Verify BigInt64Array.of converts hexadecimal literal 0xFF to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(0xFF);
      expect(res.$_get(0)).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0850
     * @tc.name testBigInt64ArrayOfOne0850
     * @tc.desc Verify BigInt64Array.of converts negative hexadecimal literal -0x1 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(-0x1);
      expect(res.$_get(0)).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0890
     * @tc.name testBigInt64ArrayOfOne0890
     * @tc.desc Verify BigInt64Array.of converts negative hexadecimal literal -0x10 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(-0x10);
      expect(res.$_get(0)).assertEqual(-16n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0910
     * @tc.name testBigInt64ArrayOfOne0910
     * @tc.desc Verify BigInt64Array.of converts negative hexadecimal literal -0x100 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(-0x100);
      expect(res.$_get(0)).assertEqual(-256n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0920
     * @tc.name testBigInt64ArrayOfOne0920
     * @tc.desc Verify BigInt64Array.of preserves decimal and binary mixed arguments.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(0, 0b1);
      expect(res.$_get(0)).assertEqual(0n);
      expect(res.$_get(1)).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0930
     * @tc.name testBigInt64ArrayOfOne0930
     * @tc.desc Verify BigInt64Array.of preserves hexadecimal and octal mixed arguments.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(0x2, 0o3);
      expect(res.$_get(0)).assertEqual(2n);
      expect(res.$_get(1)).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0940
     * @tc.name testBigInt64ArrayOfOne0940
     * @tc.desc Verify BigInt64Array.of preserves positive and negative decimal arguments.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(100, -1);
      expect(res.$_get(0)).assertEqual(100n);
      expect(res.$_get(1)).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0970
     * @tc.name testBigInt64ArrayOfOne0970
     * @tc.desc Verify BigInt64Array.of preserves positive and negative boundary arguments.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(2147483647, -2147483648);
      expect(res.$_get(0)).assertEqual(2147483647n);
      expect(res.$_get(1)).assertEqual(-2147483648n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0980
     * @tc.name testBigInt64ArrayOfOne0980
     * @tc.desc Verify BigInt64Array.of preserves maximum safe value pairs.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(9007199254740991, -9007199254740991);
      expect(res.$_get(0)).assertEqual(9007199254740991n);
      expect(res.$_get(1)).assertEqual(-9007199254740991n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_1000
     * @tc.name testBigInt64ArrayOfOne1000
     * @tc.desc Verify BigInt64Array.of preserves zero values from octal and hexadecimal literals.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(0x0, 0o0);
      expect(res.$_get(0)).assertEqual(0n);
      expect(res.$_get(1)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_1010
     * @tc.name testBigInt64ArrayOfOne1010
     * @tc.desc Verify BigInt64Array.of preserves zero values from binary and negative decimal zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(0b0, -0);
      expect(res.$_get(0)).assertEqual(0n);
      expect(res.$_get(1)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_1020
     * @tc.name testBigInt64ArrayOfOne1020
     * @tc.desc Verify empty BigInt64Array.of result has byteLength 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of();
      expect(res.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_1030
     * @tc.name testBigInt64ArrayOfOne1030
     * @tc.desc Verify each BigInt64Array.of call returns a distinct instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res1 = BigInt64Array.of(1);
      let res2 = BigInt64Array.of(1);
      expect(res1 === res2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_1040
     * @tc.name testBigInt64ArrayOfOne1040
     * @tc.desc Verify BigInt64Array.of byteLength uses eight bytes per element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(100, 200, 300);
      expect(res.byteLength).assertEqual(3 * 8);
      expect(res.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0010
     * @tc.name testBigInt64ArrayOfTwo001
     * @tc.desc Verify BigInt64Array.of with 1 arguments reports length 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(99n);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0020
     * @tc.name testBigInt64ArrayOfTwo002
     * @tc.desc Verify BigInt64Array.of with 1 arguments reports byteLength 8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(98n);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0030
     * @tc.name testBigInt64ArrayOfTwo003
     * @tc.desc Verify BigInt64Array.of with 1 arguments preserves the value at index 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(97n);
      expect(arr.$_get(0)).assertEqual(97n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0040
     * @tc.name testBigInt64ArrayOfTwo004
     * @tc.desc Verify BigInt64Array.of with 2 arguments reports length 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n, 2n);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0050
     * @tc.name testBigInt64ArrayOfTwo005
     * @tc.desc Verify BigInt64Array.of with 2 arguments reports byteLength 16.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(11n, 12n);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0070
     * @tc.name testBigInt64ArrayOfTwo007
     * @tc.desc Verify BigInt64Array.of with 2 arguments preserves the value at index 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(15n, 16n);
      expect(arr.$_get(1)).assertEqual(16n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0080
     * @tc.name testBigInt64ArrayOfTwo008
     * @tc.desc Verify BigInt64Array.of with 3 arguments reports length 3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(10n, 20n, 30n);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0110
     * @tc.name testBigInt64ArrayOfTwo011
     * @tc.desc Verify BigInt64Array.of with 3 arguments preserves the value at index 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(100n, 200n, 300n);
      expect(arr.$_get(2)).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0220
     * @tc.name testBigInt64ArrayOfTwo022
     * @tc.desc Verify BigInt64Array.of with 10 arguments reports length 10.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0230
     * @tc.name testBigInt64ArrayOfTwo023
     * @tc.desc Verify BigInt64Array.of with 10 arguments preserves the value at index 9.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(
        11n, 12n, 13n, 14n, 15n, 16n, 17n, 18n, 19n, 20n
      );
      expect(arr.$_get(9)).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0240
     * @tc.name testBigInt64ArrayOfTwo024
     * @tc.desc Verify BigInt64Array.of accepts the bigint boundary literal 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(0n);
      expect(arr.$_get(0)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0250
     * @tc.name testBigInt64ArrayOfTwo025
     * @tc.desc Verify BigInt64Array.of normalizes the bigint boundary literal -0n to 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(-0n);
      expect(arr.$_get(0)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0260
     * @tc.name testBigInt64ArrayOfTwo026
     * @tc.desc Verify BigInt64Array.of preserves the bigint literal 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n);
      expect(arr.$_get(0)).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0270
     * @tc.name testBigInt64ArrayOfTwo027
     * @tc.desc Verify BigInt64Array.of preserves the bigint literal -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(-1n);
      expect(arr.$_get(0)).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0280
     * @tc.name testBigInt64ArrayOfTwo028
     * @tc.desc Verify BigInt64Array.of preserves the bigint literal 10n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(10n);
      expect(arr.$_get(0)).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0290
     * @tc.name testBigInt64ArrayOfTwo029
     * @tc.desc Verify BigInt64Array.of preserves the bigint literal -10n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(-10n);
      expect(arr.$_get(0)).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0490
     * @tc.name testBigInt64ArrayOfTwo049
     * @tc.desc Verify BigInt64Array.of preserves the maximum signed 64-bit bigint literal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(9223372036854775807n);
      expect(arr.$_get(0)).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0500
     * @tc.name testBigInt64ArrayOfTwo050
     * @tc.desc Verify BigInt64Array.of preserves the minimum signed 64-bit bigint literal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(-9223372036854775808n);
      expect(arr.$_get(0)).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0510
     * @tc.name testBigInt64ArrayOfTwo051
     * @tc.desc Verify BigInt64Array.of preserves the bigint literal just below the maximum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(9223372036854775806n);
      expect(arr.$_get(0)).assertEqual(9223372036854775806n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0520
     * @tc.name testBigInt64ArrayOfTwo052
     * @tc.desc Verify BigInt64Array.of preserves the bigint literal just above the minimum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(-9223372036854775807n);
      expect(arr.$_get(0)).assertEqual(-9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0550
     * @tc.name testBigInt64ArrayOfTwo055
     * @tc.desc Verify BigInt64Array.of stores the result of bigint addition 1n + 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n + 1n);
      expect(arr.$_get(0)).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0580
     * @tc.name testBigInt64ArrayOfTwo058
     * @tc.desc Verify BigInt64Array.of stores the result of bigint division 10n / 2n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(10n / 2n);
      expect(arr.$_get(0)).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0600
     * @tc.name testBigInt64ArrayOfTwo060
     * @tc.desc Verify BigInt64Array.of stores the result of bigint exponentiation 2n ** 10n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(2n ** 10n);
      expect(arr.$_get(0)).assertEqual(1024n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0610
     * @tc.name testBigInt64ArrayOfTwo061
     * @tc.desc Verify BigInt64Array.of stores the result of bigint exponentiation 2n ** 62n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(2n ** 62n);
      expect(arr.$_get(0)).assertEqual(4611686018427387904n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0620
     * @tc.name testBigInt64ArrayOfTwo062
     * @tc.desc Verify BigInt64Array.of stores the result of bigint left shift 1n << 10n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n << 10n);
      expect(arr.$_get(0)).assertEqual(1024n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0640
     * @tc.name testBigInt64ArrayOfTwo064
     * @tc.desc Verify BigInt64Array.of stores the result of bigint bitwise not ~0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(~0n);
      expect(arr.$_get(0)).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0670
     * @tc.name testBigInt64ArrayOfTwo067
     * @tc.desc Verify BigInt64Array.of stores the result of bigint bitwise and 5n & 3n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(5n & 3n);
      expect(arr.$_get(0)).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0700
     * @tc.name testBigInt64ArrayOfTwo070
     * @tc.desc Verify BigInt64Array.of accepts a value created with BigInt(0).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(BigInt(0));
      expect(arr.$_get(0)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0720
     * @tc.name testBigInt64ArrayOfTwo072
     * @tc.desc Verify BigInt64Array.of accepts a negative value created with BigInt(-1).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(BigInt(-1));
      expect(arr.$_get(0)).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0750
     * @tc.name testBigInt64ArrayOfTwo075
     * @tc.desc Verify BigInt64Array.of accepts a value created from the string "123".
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(BigInt('123'));
      expect(arr.$_get(0)).assertEqual(123n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0760
     * @tc.name testBigInt64ArrayOfTwo076
     * @tc.desc Verify BigInt64Array.of accepts a value created from the string "-123".
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(BigInt('-123'));
      expect(arr.$_get(0)).assertEqual(-123n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0770
     * @tc.name testBigInt64ArrayOfTwo077
     * @tc.desc Verify BigInt64Array.of accepts a maximum signed 64-bit value from a string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(BigInt('9223372036854775807'));
      expect(arr.$_get(0)).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0780
     * @tc.name testBigInt64ArrayOfTwo078
     * @tc.desc Verify BigInt64Array.of accepts a value created from the binary string "0b101".
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(BigInt('0b101'));
      expect(arr.$_get(0)).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0800
     * @tc.name testBigInt64ArrayOfTwo080
     * @tc.desc Verify BigInt64Array.of accepts a value created from the octal string "0o17".
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(BigInt('0o17'));
      expect(arr.$_get(0)).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0820
     * @tc.name testBigInt64ArrayOfTwo082
     * @tc.desc Verify BigInt64Array.of accepts a value created from the hexadecimal string "0x1f".
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(BigInt('0x1f'));
      expect(arr.$_get(0)).assertEqual(31n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0830
     * @tc.name testBigInt64ArrayOfTwo083
     * @tc.desc Verify BigInt64Array.of accepts a value created from boolean true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(BigInt(true));
      expect(arr.$_get(0)).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0840
     * @tc.name testBigInt64ArrayOfTwo084
     * @tc.desc Verify BigInt64Array.of accepts a value created from boolean false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(BigInt(false));
      expect(arr.$_get(0)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0850
     * @tc.name testBigInt64ArrayOfTwo085
     * @tc.desc Verify BigInt64Array.of wraps MAX + 1n to the signed 64-bit minimum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(9223372036854775808n);
      expect(arr.$_get(0)).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0860
     * @tc.name testBigInt64ArrayOfTwo086
     * @tc.desc Verify BigInt64Array.of wraps MAX + 2n to the signed 64-bit minimum plus one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(9223372036854775809n);
      expect(arr.$_get(0)).assertEqual(-9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0870
     * @tc.name testBigInt64ArrayOfTwo087
     * @tc.desc Verify BigInt64Array.of wraps MIN - 1n to the signed 64-bit maximum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(-9223372036854775809n);
      expect(arr.$_get(0)).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0880
     * @tc.name testBigInt64ArrayOfTwo088
     * @tc.desc Verify BigInt64Array.of wraps MIN - 2n to the signed 64-bit maximum minus one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(-9223372036854775810n);
      expect(arr.$_get(0)).assertEqual(9223372036854775806n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0890
     * @tc.name testBigInt64ArrayOfTwo089
     * @tc.desc Verify BigInt64Array.of wraps the all-ones unsigned 64-bit value to -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(18446744073709551615n);
      expect(arr.$_get(0)).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0900
     * @tc.name testBigInt64ArrayOfTwo090
     * @tc.desc Verify BigInt64Array.of wraps the unsigned 64-bit overflow boundary to 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(18446744073709551616n);
      expect(arr.$_get(0)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0920
     * @tc.name testBigInt64ArrayOfTwo092
     * @tc.desc Verify BigInt64Array.of wraps a negative hexadecimal underflow value to 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(-18446744073709551616n);
      expect(arr.$_get(0)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0930
     * @tc.name testBigInt64ArrayOfTwo093
     * @tc.desc Verify BigInt64Array.of returns a typed array with an accessible ArrayBuffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(99n);
      let hasBuffer = arr.buffer !== undefined;
      expect(hasBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0940
     * @tc.name testBigInt64ArrayOfTwo094
     * @tc.desc Verify BigInt64Array.of creates an ArrayBuffer with the expected byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(123n);
      expect(arr.buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0950
     * @tc.name testBigInt64ArrayOfTwo095
     * @tc.desc Verify BigInt64Array.of returns a typed array whose byteOffset is zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(99n);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0960
     * @tc.name testBigInt64ArrayOfTwo096
     * @tc.desc Verify BigInt64Array.of keeps mutations on the same instance visible through the reference.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(42n);
      arr.$_set(0, 100n);
      expect(arr.$_get(0)).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0970
     * @tc.name testBigInt64ArrayOfTwo097
     * @tc.desc Verify consecutive BigInt64Array.of calls produce independent instances.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = BigInt64Array.of(1n);
      let arr2 = BigInt64Array.of(1n);
      arr1.$_set(0, 2n);
      expect(arr2.$_get(0)).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0980
     * @tc.name testBigInt64ArrayOfTwo098
     * @tc.desc Verify BigInt64Array.of preserves initialization order at the first position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(200n, 201n, 202n);
      expect(arr.$_get(0)).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0990
     * @tc.name testBigInt64ArrayOfTwo099
     * @tc.desc Verify BigInt64Array.of preserves initialization order at the second position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(203n, 204n, 205n);
      expect(arr.$_get(1)).assertEqual(204n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_1000
     * @tc.name testBigInt64ArrayOfTwo100
     * @tc.desc Verify BigInt64Array.of preserves initialization order at the third position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(206n, 207n, 208n);
      expect(arr.$_get(2)).assertEqual(208n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_0100
     * @tc.name testBigInt64ArrayOfThree001
     * @tc.desc Verify BigInt64Array.of returns a BigInt64Array instance for a
     * single bigint item.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n);
      expect(arr instanceof BigInt64Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_0200
     * @tc.name testBigInt64ArrayOfThree002
     * @tc.desc Verify BigInt64Array.of returns a BigInt64Array instance when
     * called without arguments.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of();
      expect(arr instanceof BigInt64Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_0300
     * @tc.name testBigInt64ArrayOfThree003
     * @tc.desc Verify BigInt64Array.of returns an object value for the 0n input.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(0n);
      expect(typeof arr).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_0500
     * @tc.name testBigInt64ArrayOfThree005
     * @tc.desc Verify BigInt64Array.of reports byteLength 8 for one element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_0600
     * @tc.name testBigInt64ArrayOfThree006
     * @tc.desc Verify BigInt64Array.of reports byteLength 16 for two elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n, 2n);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_0700
     * @tc.name testBigInt64ArrayOfThree007
     * @tc.desc Verify BigInt64Array.of reports byteLength 24 for three
     * elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n, 2n, 3n);
      expect(arr.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_0900
     * @tc.name testBigInt64ArrayOfThree009
     * @tc.desc Verify BigInt64Array.of returns a result whose buffer is an
     * ArrayBuffer instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(42n);
      expect(arr.buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1000
     * @tc.name testBigInt64ArrayOfThree010
     * @tc.desc Verify BigInt64Array.of exposes BYTES_PER_ELEMENT as 8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(42n);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1200
     * @tc.name testBigInt64ArrayOfThree012
     * @tc.desc Verify BigInt64Array.of stores -1n as a bigint element type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(-1n);
      expect(typeof arr[0]).assertEqual('bigint');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1300
     * @tc.name testBigInt64ArrayOfThree013
     * @tc.desc Verify BigInt64Array.of stores all multi-argument elements as
     * bigint values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n, 2n, 3n);
      let allBigInt = typeof arr[0] === 'bigint' &&
        typeof arr[1] === 'bigint' && typeof arr[2] === 'bigint';
      expect(allBigInt).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1400
     * @tc.name testBigInt64ArrayOfThree014
     * @tc.desc Verify updating the created array does not prevent the new value
     * from being stored independently.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg = 10n;
      let arr = BigInt64Array.of(arg);
      arr[0] = 20n;
      expect(arr[0]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1500
     * @tc.name testBigInt64ArrayOfThree015
     * @tc.desc Verify separate BigInt64Array.of calls create independent arrays.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = BigInt64Array.of(1n);
      let arr2 = BigInt64Array.of(1n);
      arr1[0] = 5n;
      expect(arr2[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1600
     * @tc.name testBigInt64ArrayOfThree016
     * @tc.desc Verify a result from BigInt64Array.of can be copied into another
     * BigInt64Array constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = BigInt64Array.of(1n, 2n);
      let arr2 = new BigInt64Array(arr1);
      expect(arr2.length).assertEqual(2);
      expect(arr2[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1700
     * @tc.name testBigInt64ArrayOfThree017
     * @tc.desc Verify a new view created from the result buffer reads the same
     * bigint data.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = BigInt64Array.of(99n);
      let view = new BigInt64Array(arr1.buffer);
      expect(view[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1800
     * @tc.name testBigInt64ArrayOfThree018
     * @tc.desc Verify negative index reads on the BigInt64Array.of result return
     * undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n, 2n);
      expect(arr[-1]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1900
     * @tc.name testBigInt64ArrayOfThree019
     * @tc.desc Verify out-of-range positive index reads on the
     * BigInt64Array.of result return undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n, 2n);
      expect(arr[2]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_2000
     * @tc.name testBigInt64ArrayOfThree020
     * @tc.desc Verify slicing the BigInt64Array.of result keeps the expected
     * element and length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n, 2n, 3n);
      let sub = arr.slice(1, 2);
      expect(sub[0]).assertEqual(2n);
      expect(sub.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_2100
     * @tc.name testBigInt64ArrayOfThree021
     * @tc.desc Verify a BigInt64Array.of result can be updated to the maximum
     * bigint boundary value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(0n);
      arr[0] = BIGINT64_MAX;
      expect(arr[0]).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_2200
     * @tc.name testBigInt64ArrayOfThree022
     * @tc.desc Verify a BigInt64Array.of result can be updated to the minimum
     * bigint boundary value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(0n);
      arr[0] = BIGINT64_MIN;
      expect(arr[0]).assertEqual(BIGINT64_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_2300
     * @tc.name testBigInt64ArrayOfThree023
     * @tc.desc Verify BigInt64Array.of preserves consecutive hexadecimal bigint
     * values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(HEX_VARIANT_ONE, HEX_VARIANT_TWO);
      expect(arr[0]).assertEqual(4611686018427387904n);
      expect(arr[1]).assertEqual(3458764513820540928n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_2400
     * @tc.name testBigInt64ArrayOfThree024
     * @tc.desc Verify BigInt64Array.of preserves the decimal bigint literal
     * 1000000000000000000n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(DECIMAL_ONE_E18);
      expect(arr[0]).assertEqual(DECIMAL_ONE_E18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_2500
     * @tc.name testBigInt64ArrayOfThree025
     * @tc.desc Verify BigInt64Array.of preserves the decimal bigint literal
     * -1000000000000000000n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(DECIMAL_NEG_ONE_E18);
      expect(arr[0]).assertEqual(DECIMAL_NEG_ONE_E18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_2600
     * @tc.name testBigInt64ArrayOfThree026
     * @tc.desc Verify reverse swaps the minimum and maximum bigint values in the
     * result of BigInt64Array.of.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(BIGINT64_MIN, BIGINT64_MAX);
      arr.reverse();
      expect(arr[0]).assertEqual(BIGINT64_MAX);
      expect(arr[1]).assertEqual(BIGINT64_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_2700
     * @tc.name testBigInt64ArrayOfThree027
     * @tc.desc Verify includes finds a negative bigint in the result of
     * BigInt64Array.of.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(-1000n, 1000n);
      expect(arr.includes(-1000n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_2900
     * @tc.name testBigInt64ArrayOfThree029
     * @tc.desc Verify converting a two-element BigInt64Array.of result to
     * string returns comma-separated values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n, 2n);
      expect(arr.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_3000
     * @tc.name testBigInt64ArrayOfThree030
     * @tc.desc Verify converting the maximum bigint BigInt64Array.of result to
     * string preserves the full value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(BIGINT64_MAX);
      expect(arr.toString()).assertEqual('9223372036854775807');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_3100
     * @tc.name testBigInt64ArrayOfThree031
     * @tc.desc Verify converting the minimum bigint BigInt64Array.of result to
     * string preserves the full value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(BIGINT64_MIN);
      expect(arr.toString()).assertEqual('-9223372036854775808');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_3200
     * @tc.name testBigInt64ArrayOfThree032
     * @tc.desc Verify mapping an empty result from BigInt64Array.of keeps the
     * mapped array empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of();
      let mapped = arr.map((x) => x);
      expect(mapped.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_3300
     * @tc.name testBigInt64ArrayOfThree033
     * @tc.desc Verify joining negative bigint values from BigInt64Array.of uses
     * the expected separator output.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(-1n, -2n, -3n);
      expect(arr.join('_')).assertEqual('-1_-2_-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_3400
     * @tc.name testBigInt64ArrayOfThree034
     * @tc.desc Verify set copies elements from one BigInt64Array.of result into
     * another BigInt64Array instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = BigInt64Array.of(5n, 10n);
      let arr2 = new BigInt64Array(2);
      arr2.set(arr1);
      expect(arr2[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_3700
     * @tc.name testBigInt64ArrayOfThree037
     * @tc.desc Verify filtering binary bigint inputs from BigInt64Array.of keeps
     * only values greater than 3n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(3n, 4n, 5n);
      let filtered = arr.filter((x) => x > 3n);
      expect(filtered.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_3800
     * @tc.name testBigInt64ArrayOfThree038
     * @tc.desc Verify sorting extreme bigint values from BigInt64Array.of places
     * the minimum value first and maximum value last.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(BIGINT64_MAX, 0n, BIGINT64_MIN);
      arr.sort();
      expect(arr[0]).assertEqual(BIGINT64_MIN);
      expect(arr[2]).assertEqual(BIGINT64_MAX);
    });
  });
}
