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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0050
     * @tc.name testBigInt64ArrayOfOne0050
     * @tc.desc Verify BigInt64Array.of accepts 10 arguments and preserves array length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      expect(res.length).assertEqual(10);
      expect(res.$_get(9)).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0060
     * @tc.name testBigInt64ArrayOfOne0060
     * @tc.desc Verify BigInt64Array.of converts decimal literal 0 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(0);
      expect(res.$_get(0)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0070
     * @tc.name testBigInt64ArrayOfOne0070
     * @tc.desc Verify BigInt64Array.of converts decimal literal 1 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(1);
      expect(res.$_get(0)).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0080
     * @tc.name testBigInt64ArrayOfOne0080
     * @tc.desc Verify BigInt64Array.of converts decimal literal 9007199254740991 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(9007199254740991);
      expect(res.$_get(0)).assertEqual(9007199254740991n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0090
     * @tc.name testBigInt64ArrayOfOne0090
     * @tc.desc Verify BigInt64Array.of normalizes decimal literal -0 to 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(-0);
      expect(res.$_get(0)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0100
     * @tc.name testBigInt64ArrayOfOne0100
     * @tc.desc Verify BigInt64Array.of converts decimal literal -1 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(-1);
      expect(res.$_get(0)).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0110
     * @tc.name testBigInt64ArrayOfOne0110
     * @tc.desc Verify BigInt64Array.of converts negative decimal boundary -2147483648 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(-2147483648);
      expect(res.$_get(0)).assertEqual(-2147483648n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0120
     * @tc.name testBigInt64ArrayOfOne0120
     * @tc.desc Verify BigInt64Array.of converts large negative decimal literal to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(-9007199254740991);
      expect(res.$_get(0)).assertEqual(-9007199254740991n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0130
     * @tc.name testBigInt64ArrayOfOne0130
     * @tc.desc Verify BigInt64Array.of converts binary literal 0b0 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(0b0);
      expect(res.$_get(0)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0140
     * @tc.name testBigInt64ArrayOfOne0140
     * @tc.desc Verify BigInt64Array.of converts binary literal 0b1 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(0b1);
      expect(res.$_get(0)).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0150
     * @tc.name testBigInt64ArrayOfOne0150
     * @tc.desc Verify BigInt64Array.of converts binary literal 0b1010 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(0b1010);
      expect(res.$_get(0)).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0160
     * @tc.name testBigInt64ArrayOfOne0160
     * @tc.desc Verify BigInt64Array.of converts negative binary literal -0b1 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(-0b1);
      expect(res.$_get(0)).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0170
     * @tc.name testBigInt64ArrayOfOne0170
     * @tc.desc Verify BigInt64Array.of converts negative binary literal -0b1010 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(-0b1010);
      expect(res.$_get(0)).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0180
     * @tc.name testBigInt64ArrayOfOne0180
     * @tc.desc Verify BigInt64Array.of converts octal literal 0o0 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(0o0);
      expect(res.$_get(0)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0190
     * @tc.name testBigInt64ArrayOfOne0190
     * @tc.desc Verify BigInt64Array.of converts octal literal 0o1 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(0o1);
      expect(res.$_get(0)).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0200
     * @tc.name testBigInt64ArrayOfOne0200
     * @tc.desc Verify BigInt64Array.of converts octal literal 0o10 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(0o10);
      expect(res.$_get(0)).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0210
     * @tc.name testBigInt64ArrayOfOne0210
     * @tc.desc Verify BigInt64Array.of converts negative octal literal -0o1 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(-0o1);
      expect(res.$_get(0)).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0220
     * @tc.name testBigInt64ArrayOfOne0220
     * @tc.desc Verify BigInt64Array.of converts negative octal literal -0o10 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(-0o10);
      expect(res.$_get(0)).assertEqual(-8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0230
     * @tc.name testBigInt64ArrayOfOne0230
     * @tc.desc Verify BigInt64Array.of converts hexadecimal literal 0x0 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(0x0);
      expect(res.$_get(0)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0240
     * @tc.name testBigInt64ArrayOfOne0240
     * @tc.desc Verify BigInt64Array.of converts hexadecimal literal 0x1 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(0x1);
      expect(res.$_get(0)).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0250
     * @tc.name testBigInt64ArrayOfOne0250
     * @tc.desc Verify BigInt64Array.of converts hexadecimal literal 0x10 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(0x10);
      expect(res.$_get(0)).assertEqual(16n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0260
     * @tc.name testBigInt64ArrayOfOne0260
     * @tc.desc Verify BigInt64Array.of converts hexadecimal literal 0xFF to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(0xFF);
      expect(res.$_get(0)).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0270
     * @tc.name testBigInt64ArrayOfOne0270
     * @tc.desc Verify BigInt64Array.of converts negative hexadecimal literal -0x1 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(-0x1);
      expect(res.$_get(0)).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0280
     * @tc.name testBigInt64ArrayOfOne0280
     * @tc.desc Verify BigInt64Array.of converts negative hexadecimal literal -0x10 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(-0x10);
      expect(res.$_get(0)).assertEqual(-16n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0290
     * @tc.name testBigInt64ArrayOfOne0290
     * @tc.desc Verify BigInt64Array.of converts negative hexadecimal literal -0x100 to bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(-0x100);
      expect(res.$_get(0)).assertEqual(-256n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0300
     * @tc.name testBigInt64ArrayOfOne0300
     * @tc.desc Verify BigInt64Array.of preserves decimal and binary mixed arguments.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(0, 0b1);
      expect(res.$_get(0)).assertEqual(0n);
      expect(res.$_get(1)).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0310
     * @tc.name testBigInt64ArrayOfOne0310
     * @tc.desc Verify BigInt64Array.of preserves hexadecimal and octal mixed arguments.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(0x2, 0o3);
      expect(res.$_get(0)).assertEqual(2n);
      expect(res.$_get(1)).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0320
     * @tc.name testBigInt64ArrayOfOne0320
     * @tc.desc Verify BigInt64Array.of preserves positive and negative decimal arguments.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(100, -1);
      expect(res.$_get(0)).assertEqual(100n);
      expect(res.$_get(1)).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0330
     * @tc.name testBigInt64ArrayOfOne0330
     * @tc.desc Verify BigInt64Array.of preserves positive and negative boundary arguments.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(2147483647, -2147483648);
      expect(res.$_get(0)).assertEqual(2147483647n);
      expect(res.$_get(1)).assertEqual(-2147483648n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0340
     * @tc.name testBigInt64ArrayOfOne0340
     * @tc.desc Verify BigInt64Array.of preserves maximum safe value pairs.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(9007199254740991, -9007199254740991);
      expect(res.$_get(0)).assertEqual(9007199254740991n);
      expect(res.$_get(1)).assertEqual(-9007199254740991n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0350
     * @tc.name testBigInt64ArrayOfOne0350
     * @tc.desc Verify BigInt64Array.of preserves zero values from octal and hexadecimal literals.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(0x0, 0o0);
      expect(res.$_get(0)).assertEqual(0n);
      expect(res.$_get(1)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0360
     * @tc.name testBigInt64ArrayOfOne0360
     * @tc.desc Verify BigInt64Array.of preserves zero values from binary and negative decimal zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(0b0, -0);
      expect(res.$_get(0)).assertEqual(0n);
      expect(res.$_get(1)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0370
     * @tc.name testBigInt64ArrayOfOne0370
     * @tc.desc Verify empty BigInt64Array.of result has byteLength 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of();
      expect(res.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0380
     * @tc.name testBigInt64ArrayOfOne0380
     * @tc.desc Verify each BigInt64Array.of call returns a distinct instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res1 = BigInt64Array.of(1);
      let res2 = BigInt64Array.of(1);
      expect(res1 === res2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_ONE_0390
     * @tc.name testBigInt64ArrayOfOne0390
     * @tc.desc Verify BigInt64Array.of byteLength uses eight bytes per element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfOne0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = BigInt64Array.of(100, 200, 300);
      expect(res.byteLength).assertEqual(3 * 8);
      expect(res.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0400
     * @tc.name testBigInt64ArrayOfTwo0400
     * @tc.desc Verify BigInt64Array.of with 1 arguments reports length 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(99n);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0410
     * @tc.name testBigInt64ArrayOfTwo0410
     * @tc.desc Verify BigInt64Array.of with 1 arguments reports byteLength 8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(98n);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0420
     * @tc.name testBigInt64ArrayOfTwo0420
     * @tc.desc Verify BigInt64Array.of with 1 arguments preserves the value at index 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(97n);
      expect(arr.$_get(0)).assertEqual(97n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0430
     * @tc.name testBigInt64ArrayOfTwo0430
     * @tc.desc Verify BigInt64Array.of with 2 arguments reports length 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n, 2n);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0440
     * @tc.name testBigInt64ArrayOfTwo0440
     * @tc.desc Verify BigInt64Array.of with 2 arguments reports byteLength 16.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(11n, 12n);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0450
     * @tc.name testBigInt64ArrayOfTwo0450
     * @tc.desc Verify BigInt64Array.of with 2 arguments preserves the value at index 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(15n, 16n);
      expect(arr.$_get(1)).assertEqual(16n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0460
     * @tc.name testBigInt64ArrayOfTwo0460
     * @tc.desc Verify BigInt64Array.of with 3 arguments reports length 3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(10n, 20n, 30n);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0470
     * @tc.name testBigInt64ArrayOfTwo0470
     * @tc.desc Verify BigInt64Array.of with 3 arguments preserves the value at index 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(100n, 200n, 300n);
      expect(arr.$_get(2)).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0480
     * @tc.name testBigInt64ArrayOfTwo0480
     * @tc.desc Verify BigInt64Array.of with 10 arguments reports length 10.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0490
     * @tc.name testBigInt64ArrayOfTwo0490
     * @tc.desc Verify BigInt64Array.of with 10 arguments preserves the value at index 9.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(
        11n, 12n, 13n, 14n, 15n, 16n, 17n, 18n, 19n, 20n
      );
      expect(arr.$_get(9)).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0500
     * @tc.name testBigInt64ArrayOfTwo0500
     * @tc.desc Verify BigInt64Array.of accepts the bigint boundary literal 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(0n);
      expect(arr.$_get(0)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0510
     * @tc.name testBigInt64ArrayOfTwo0510
     * @tc.desc Verify BigInt64Array.of normalizes the bigint boundary literal -0n to 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(-0n);
      expect(arr.$_get(0)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0520
     * @tc.name testBigInt64ArrayOfTwo0520
     * @tc.desc Verify BigInt64Array.of preserves the bigint literal 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n);
      expect(arr.$_get(0)).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0530
     * @tc.name testBigInt64ArrayOfTwo0530
     * @tc.desc Verify BigInt64Array.of preserves the bigint literal -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(-1n);
      expect(arr.$_get(0)).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0540
     * @tc.name testBigInt64ArrayOfTwo0540
     * @tc.desc Verify BigInt64Array.of preserves the bigint literal 10n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(10n);
      expect(arr.$_get(0)).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0550
     * @tc.name testBigInt64ArrayOfTwo0550
     * @tc.desc Verify BigInt64Array.of preserves the bigint literal -10n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(-10n);
      expect(arr.$_get(0)).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0560
     * @tc.name testBigInt64ArrayOfTwo0560
     * @tc.desc Verify BigInt64Array.of preserves the maximum signed 64-bit bigint literal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(9223372036854775807n);
      expect(arr.$_get(0)).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0570
     * @tc.name testBigInt64ArrayOfTwo0570
     * @tc.desc Verify BigInt64Array.of preserves the minimum signed 64-bit bigint literal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(-9223372036854775808n);
      expect(arr.$_get(0)).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0580
     * @tc.name testBigInt64ArrayOfTwo0580
     * @tc.desc Verify BigInt64Array.of preserves the bigint literal just below the maximum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(9223372036854775806n);
      expect(arr.$_get(0)).assertEqual(9223372036854775806n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0590
     * @tc.name testBigInt64ArrayOfTwo0590
     * @tc.desc Verify BigInt64Array.of preserves the bigint literal just above the minimum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(-9223372036854775807n);
      expect(arr.$_get(0)).assertEqual(-9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0600
     * @tc.name testBigInt64ArrayOfTwo0600
     * @tc.desc Verify BigInt64Array.of stores the result of bigint addition 1n + 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n + 1n);
      expect(arr.$_get(0)).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0610
     * @tc.name testBigInt64ArrayOfTwo0610
     * @tc.desc Verify BigInt64Array.of stores the result of bigint division 10n / 2n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(10n / 2n);
      expect(arr.$_get(0)).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0620
     * @tc.name testBigInt64ArrayOfTwo0620
     * @tc.desc Verify BigInt64Array.of stores the result of bigint exponentiation 2n ** 10n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(2n ** 10n);
      expect(arr.$_get(0)).assertEqual(1024n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0630
     * @tc.name testBigInt64ArrayOfTwo0630
     * @tc.desc Verify BigInt64Array.of stores the result of bigint exponentiation 2n ** 62n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(2n ** 62n);
      expect(arr.$_get(0)).assertEqual(4611686018427387904n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0640
     * @tc.name testBigInt64ArrayOfTwo0640
     * @tc.desc Verify BigInt64Array.of stores the result of bigint left shift 1n << 10n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n << 10n);
      expect(arr.$_get(0)).assertEqual(1024n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0650
     * @tc.name testBigInt64ArrayOfTwo0650
     * @tc.desc Verify BigInt64Array.of stores the result of bigint bitwise not ~0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(~0n);
      expect(arr.$_get(0)).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0660
     * @tc.name testBigInt64ArrayOfTwo0660
     * @tc.desc Verify BigInt64Array.of stores the result of bigint bitwise and 5n & 3n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(5n & 3n);
      expect(arr.$_get(0)).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0670
     * @tc.name testBigInt64ArrayOfTwo0670
     * @tc.desc Verify BigInt64Array.of accepts a value created with BigInt(0).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(BigInt(0));
      expect(arr.$_get(0)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0680
     * @tc.name testBigInt64ArrayOfTwo0680
     * @tc.desc Verify BigInt64Array.of accepts a negative value created with BigInt(-1).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(BigInt(-1));
      expect(arr.$_get(0)).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0690
     * @tc.name testBigInt64ArrayOfTwo0690
     * @tc.desc Verify BigInt64Array.of accepts a value created from the string "123".
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(BigInt('123'));
      expect(arr.$_get(0)).assertEqual(123n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0700
     * @tc.name testBigInt64ArrayOfTwo0700
     * @tc.desc Verify BigInt64Array.of accepts a value created from the string "-123".
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(BigInt('-123'));
      expect(arr.$_get(0)).assertEqual(-123n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0710
     * @tc.name testBigInt64ArrayOfTwo0710
     * @tc.desc Verify BigInt64Array.of accepts a maximum signed 64-bit value from a string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(BigInt('9223372036854775807'));
      expect(arr.$_get(0)).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0720
     * @tc.name testBigInt64ArrayOfTwo0720
     * @tc.desc Verify BigInt64Array.of accepts a value created from the binary string "0b101".
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(BigInt('0b101'));
      expect(arr.$_get(0)).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0730
     * @tc.name testBigInt64ArrayOfTwo0730
     * @tc.desc Verify BigInt64Array.of accepts a value created from the octal string "0o17".
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(BigInt('0o17'));
      expect(arr.$_get(0)).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0740
     * @tc.name testBigInt64ArrayOfTwo0740
     * @tc.desc Verify BigInt64Array.of accepts a value created from the hexadecimal string "0x1f".
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(BigInt('0x1f'));
      expect(arr.$_get(0)).assertEqual(31n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0750
     * @tc.name testBigInt64ArrayOfTwo0750
     * @tc.desc Verify BigInt64Array.of accepts a value created from boolean true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(BigInt(true));
      expect(arr.$_get(0)).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0760
     * @tc.name testBigInt64ArrayOfTwo0760
     * @tc.desc Verify BigInt64Array.of accepts a value created from boolean false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(BigInt(false));
      expect(arr.$_get(0)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0770
     * @tc.name testBigInt64ArrayOfTwo0770
     * @tc.desc Verify BigInt64Array.of wraps MAX + 1n to the signed 64-bit minimum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(9223372036854775808n);
      expect(arr.$_get(0)).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0780
     * @tc.name testBigInt64ArrayOfTwo0780
     * @tc.desc Verify BigInt64Array.of wraps MAX + 2n to the signed 64-bit minimum plus one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(9223372036854775809n);
      expect(arr.$_get(0)).assertEqual(-9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0790
     * @tc.name testBigInt64ArrayOfTwo0790
     * @tc.desc Verify BigInt64Array.of wraps MIN - 1n to the signed 64-bit maximum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(-9223372036854775809n);
      expect(arr.$_get(0)).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0800
     * @tc.name testBigInt64ArrayOfTwo0800
     * @tc.desc Verify BigInt64Array.of wraps MIN - 2n to the signed 64-bit maximum minus one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(-9223372036854775810n);
      expect(arr.$_get(0)).assertEqual(9223372036854775806n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0810
     * @tc.name testBigInt64ArrayOfTwo0810
     * @tc.desc Verify BigInt64Array.of wraps the all-ones unsigned 64-bit value to -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(18446744073709551615n);
      expect(arr.$_get(0)).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0820
     * @tc.name testBigInt64ArrayOfTwo0820
     * @tc.desc Verify BigInt64Array.of wraps the unsigned 64-bit overflow boundary to 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(18446744073709551616n);
      expect(arr.$_get(0)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0830
     * @tc.name testBigInt64ArrayOfTwo0830
     * @tc.desc Verify BigInt64Array.of wraps a negative hexadecimal underflow value to 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(-18446744073709551616n);
      expect(arr.$_get(0)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0840
     * @tc.name testBigInt64ArrayOfTwo0840
     * @tc.desc Verify BigInt64Array.of returns a typed array with an accessible ArrayBuffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(99n);
      let hasBuffer = arr.buffer !== undefined;
      expect(hasBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0850
     * @tc.name testBigInt64ArrayOfTwo0850
     * @tc.desc Verify BigInt64Array.of creates an ArrayBuffer with the expected byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(123n);
      expect(arr.buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0860
     * @tc.name testBigInt64ArrayOfTwo0860
     * @tc.desc Verify BigInt64Array.of returns a typed array whose byteOffset is zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(99n);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0870
     * @tc.name testBigInt64ArrayOfTwo0870
     * @tc.desc Verify BigInt64Array.of keeps mutations on the same instance visible through the reference.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(42n);
      arr.$_set(0, 100n);
      expect(arr.$_get(0)).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0880
     * @tc.name testBigInt64ArrayOfTwo0880
     * @tc.desc Verify consecutive BigInt64Array.of calls produce independent instances.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = BigInt64Array.of(1n);
      let arr2 = BigInt64Array.of(1n);
      arr1.$_set(0, 2n);
      expect(arr2.$_get(0)).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0890
     * @tc.name testBigInt64ArrayOfTwo0890
     * @tc.desc Verify BigInt64Array.of preserves initialization order at the first position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(200n, 201n, 202n);
      expect(arr.$_get(0)).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0900
     * @tc.name testBigInt64ArrayOfTwo0900
     * @tc.desc Verify BigInt64Array.of preserves initialization order at the second position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(203n, 204n, 205n);
      expect(arr.$_get(1)).assertEqual(204n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_TWO_0910
     * @tc.name testBigInt64ArrayOfTwo0910
     * @tc.desc Verify BigInt64Array.of preserves initialization order at the third position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfTwo0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(206n, 207n, 208n);
      expect(arr.$_get(2)).assertEqual(208n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_0920
     * @tc.name testBigInt64ArrayOfThree0920
     * @tc.desc Verify BigInt64Array.of returns a BigInt64Array instance for a
     * single bigint item.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n);
      expect(arr instanceof BigInt64Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_0930
     * @tc.name testBigInt64ArrayOfThree0930
     * @tc.desc Verify BigInt64Array.of returns a BigInt64Array instance when
     * called without arguments.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of();
      expect(arr instanceof BigInt64Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_0940
     * @tc.name testBigInt64ArrayOfThree0940
     * @tc.desc Verify BigInt64Array.of returns an object value for the 0n input.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(0n);
      expect(typeof arr).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_0950
     * @tc.name testBigInt64ArrayOfThree0950
     * @tc.desc Verify BigInt64Array.of reports byteLength 8 for one element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_0960
     * @tc.name testBigInt64ArrayOfThree0960
     * @tc.desc Verify BigInt64Array.of reports byteLength 16 for two elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree0960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n, 2n);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_0970
     * @tc.name testBigInt64ArrayOfThree0970
     * @tc.desc Verify BigInt64Array.of reports byteLength 24 for three
     * elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree0970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n, 2n, 3n);
      expect(arr.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_0980
     * @tc.name testBigInt64ArrayOfThree0980
     * @tc.desc Verify BigInt64Array.of returns a result whose buffer is an
     * ArrayBuffer instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree0980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(42n);
      expect(arr.buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_0990
     * @tc.name testBigInt64ArrayOfThree0990
     * @tc.desc Verify BigInt64Array.of exposes BYTES_PER_ELEMENT as 8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree0990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(42n);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1000
     * @tc.name testBigInt64ArrayOfThree1000
     * @tc.desc Verify BigInt64Array.of stores -1n as a bigint element type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(-1n);
      expect(typeof arr[0]).assertEqual('bigint');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1010
     * @tc.name testBigInt64ArrayOfThree1010
     * @tc.desc Verify BigInt64Array.of stores all multi-argument elements as
     * bigint values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n, 2n, 3n);
      let allBigInt = typeof arr[0] === 'bigint' &&
        typeof arr[1] === 'bigint' && typeof arr[2] === 'bigint';
      expect(allBigInt).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1020
     * @tc.name testBigInt64ArrayOfThree1020
     * @tc.desc Verify updating the created array does not prevent the new value
     * from being stored independently.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg = 10n;
      let arr = BigInt64Array.of(arg);
      arr[0] = 20n;
      expect(arr[0]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1030
     * @tc.name testBigInt64ArrayOfThree1030
     * @tc.desc Verify separate BigInt64Array.of calls create independent arrays.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = BigInt64Array.of(1n);
      let arr2 = BigInt64Array.of(1n);
      arr1[0] = 5n;
      expect(arr2[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1040
     * @tc.name testBigInt64ArrayOfThree1040
     * @tc.desc Verify a result from BigInt64Array.of can be copied into another
     * BigInt64Array constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = BigInt64Array.of(1n, 2n);
      let arr2 = new BigInt64Array(arr1);
      expect(arr2.length).assertEqual(2);
      expect(arr2[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1050
     * @tc.name testBigInt64ArrayOfThree1050
     * @tc.desc Verify a new view created from the result buffer reads the same
     * bigint data.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = BigInt64Array.of(99n);
      let view = new BigInt64Array(arr1.buffer);
      expect(view[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1060
     * @tc.name testBigInt64ArrayOfThree1060
     * @tc.desc Verify negative index reads on the BigInt64Array.of result throw
     * RangeError.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testBigInt64ArrayOfThree1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n, 2n);
      try {
        arr[-1];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1070
     * @tc.name testBigInt64ArrayOfThree1070
     * @tc.desc Verify out-of-range positive index reads on the
     * BigInt64Array.of result throw RangeError.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testBigInt64ArrayOfThree1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n, 2n);
      try {
        arr[2];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1080
     * @tc.name testBigInt64ArrayOfThree1080
     * @tc.desc Verify slicing the BigInt64Array.of result keeps the expected
     * element and length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n, 2n, 3n);
      let sub = arr.slice(1, 2);
      expect(sub[0]).assertEqual(2n);
      expect(sub.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1090
     * @tc.name testBigInt64ArrayOfThree1090
     * @tc.desc Verify a BigInt64Array.of result can be updated to the maximum
     * bigint boundary value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree1090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(0n);
      arr[0] = BIGINT64_MAX;
      expect(arr[0]).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1100
     * @tc.name testBigInt64ArrayOfThree1100
     * @tc.desc Verify a BigInt64Array.of result can be updated to the minimum
     * bigint boundary value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(0n);
      arr[0] = BIGINT64_MIN;
      expect(arr[0]).assertEqual(BIGINT64_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1110
     * @tc.name testBigInt64ArrayOfThree1110
     * @tc.desc Verify BigInt64Array.of preserves consecutive hexadecimal bigint
     * values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree1110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(HEX_VARIANT_ONE, HEX_VARIANT_TWO);
      expect(arr[0]).assertEqual(4611686018427387904n);
      expect(arr[1]).assertEqual(3458764513820540928n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1120
     * @tc.name testBigInt64ArrayOfThree1120
     * @tc.desc Verify BigInt64Array.of preserves the decimal bigint literal
     * 1000000000000000000n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree1120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(DECIMAL_ONE_E18);
      expect(arr[0]).assertEqual(DECIMAL_ONE_E18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1130
     * @tc.name testBigInt64ArrayOfThree1130
     * @tc.desc Verify BigInt64Array.of preserves the decimal bigint literal
     * -1000000000000000000n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree1130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(DECIMAL_NEG_ONE_E18);
      expect(arr[0]).assertEqual(DECIMAL_NEG_ONE_E18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1140
     * @tc.name testBigInt64ArrayOfThree1140
     * @tc.desc Verify reverse swaps the minimum and maximum bigint values in the
     * result of BigInt64Array.of.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree1140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(BIGINT64_MIN, BIGINT64_MAX);
      arr.reverse();
      expect(arr[0]).assertEqual(BIGINT64_MAX);
      expect(arr[1]).assertEqual(BIGINT64_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1150
     * @tc.name testBigInt64ArrayOfThree1150
     * @tc.desc Verify includes finds a negative bigint in the result of
     * BigInt64Array.of.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree1150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(-1000n, 1000n);
      expect(arr.includes(-1000n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1160
     * @tc.name testBigInt64ArrayOfThree1160
     * @tc.desc Verify converting a two-element BigInt64Array.of result to
     * string returns comma-separated values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree1160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n, 2n);
      expect(arr.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1170
     * @tc.name testBigInt64ArrayOfThree1170
     * @tc.desc Verify converting the maximum bigint BigInt64Array.of result to
     * string preserves the full value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree1170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(BIGINT64_MAX);
      expect(arr.toString()).assertEqual('9223372036854775807');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1180
     * @tc.name testBigInt64ArrayOfThree1180
     * @tc.desc Verify converting the minimum bigint BigInt64Array.of result to
     * string preserves the full value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree1180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(BIGINT64_MIN);
      expect(arr.toString()).assertEqual('-9223372036854775808');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1190
     * @tc.name testBigInt64ArrayOfThree1190
     * @tc.desc Verify mapping an empty result from BigInt64Array.of keeps the
     * mapped array empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree1190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of();
      let mapped = arr.map((x) => x);
      expect(mapped.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1200
     * @tc.name testBigInt64ArrayOfThree1200
     * @tc.desc Verify joining negative bigint values from BigInt64Array.of uses
     * the expected separator output.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(-1n, -2n, -3n);
      expect(arr.join('_')).assertEqual('-1_-2_-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1210
     * @tc.name testBigInt64ArrayOfThree1210
     * @tc.desc Verify set copies elements from one BigInt64Array.of result into
     * another BigInt64Array instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree1210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = BigInt64Array.of(5n, 10n);
      let arr2 = new BigInt64Array(2);
      arr2.set(arr1);
      expect(arr2[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1220
     * @tc.name testBigInt64ArrayOfThree1220
     * @tc.desc Verify filtering binary bigint inputs from BigInt64Array.of keeps
     * only values greater than 3n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree1220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(3n, 4n, 5n);
      let filtered = arr.filter((x) => x > 3n);
      expect(filtered.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_OF_THREE_1230
     * @tc.name testBigInt64ArrayOfThree1230
     * @tc.desc Verify sorting extreme bigint values from BigInt64Array.of positions
     * the minimum value first and maximum value last.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOfThree1230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(BIGINT64_MAX, 0n, BIGINT64_MIN);
      arr.sort();
      expect(arr[0]).assertEqual(BIGINT64_MIN);
      expect(arr[2]).assertEqual(BIGINT64_MAX);
    });
  });
}
