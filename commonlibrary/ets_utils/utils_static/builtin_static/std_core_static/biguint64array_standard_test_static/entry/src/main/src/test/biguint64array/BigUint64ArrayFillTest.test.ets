'use static'


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function biguint64arrayFillTest(): void {

  describe('BigUint64ArrayFillTest', () => {
    beforeAll(() => {
    });
    beforeEach(async () => {
    await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0010
     * @tc.name testBigUint64ArrayFill001
     * @tc.desc Verify fill(0n) with a single argument fills the entire array with 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([99n, 99n, 99n]);
      sourceArray.fill(0n);
      expect(sourceArray[0]).assertEqual(0n);
      expect(sourceArray[1]).assertEqual(0n);
      expect(sourceArray[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0020
     * @tc.name testBigUint64ArrayFill002
     * @tc.desc Verify fill(1n) with a single argument fills the entire array with 1n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n, 0n]);
      sourceArray.fill(1n);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(1n);
      expect(sourceArray[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0030
     * @tc.name testBigUint64ArrayFill003
     * @tc.desc Verify fill(42n) with a single argument fills entire array with conventional value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(3);
      sourceArray.fill(42n);
      expect(sourceArray[0]).assertEqual(42n);
      expect(sourceArray[1]).assertEqual(42n);
      expect(sourceArray[2]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0040
     * @tc.name testBigUint64ArrayFill004
     * @tc.desc Verify fill(0n) on a zero-length array is a no-op and length remains 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let emptyArray = new BigUint64Array(0);
      emptyArray.fill(0n);
      expect(emptyArray.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0050
     * @tc.name testBigUint64ArrayFill005
     * @tc.desc Verify fill(42n) on a single-element array replaces the only element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let singleArray = new BigUint64Array([100n]);
      singleArray.fill(42n);
      expect(singleArray[0]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0060
     * @tc.name testBigUint64ArrayFill006
     * @tc.desc Verify fill(99999999n) stores a large conventional BigInt accurately
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(2);
      sourceArray.fill(99999999n);
      expect(sourceArray[0]).assertEqual(99999999n);
      expect(sourceArray[1]).assertEqual(99999999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0070
     * @tc.name testBigUint64ArrayFill007
     * @tc.desc Verify fill() with value passed via variable instead of literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fillValue: bigint = 77n;
      let sourceArray = new BigUint64Array(2);
      sourceArray.fill(fillValue);
      expect(sourceArray[0]).assertEqual(77n);
      expect(sourceArray[1]).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0080
     * @tc.name testBigUint64ArrayFill008
     * @tc.desc Verify fill() with value read from another BigUint64Array element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([100n, 200n]);
      let targetArray = new BigUint64Array(3);
      targetArray.fill(sourceArray[0]);
      expect(targetArray[0]).assertEqual(100n);
      expect(targetArray[1]).assertEqual(100n);
      expect(targetArray[2]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0090
     * @tc.name testBigUint64ArrayFill009
     * @tc.desc Verify fill(42n) on array already containing 42n is idempotent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([42n, 42n]);
      sourceArray.fill(42n);
      expect(sourceArray[0]).assertEqual(42n);
      expect(sourceArray[1]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0100
     * @tc.name testBigUint64ArrayFill010
     * @tc.desc Verify fill() with two different values in sequence, second overwrites first
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      sourceArray.fill(99n);
      sourceArray.fill(55n);
      expect(sourceArray[0]).assertEqual(55n);
      expect(sourceArray[1]).assertEqual(55n);
      expect(sourceArray[2]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0110
     * @tc.name testBigUint64ArrayFill011
     * @tc.desc Verify fill(MAX) then fill(0n) overwrites all elements correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(3);
      sourceArray.fill(18446744073709551615n);
      sourceArray.fill(0n);
      expect(sourceArray[0]).assertEqual(0n);
      expect(sourceArray[1]).assertEqual(0n);
      expect(sourceArray[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0120
     * @tc.name testBigUint64ArrayFill012
     * @tc.desc Verify fill() with value from BigInt(0) constructor conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fillValue: bigint = BigInt(0);
      let sourceArray = new BigUint64Array(2);
      sourceArray.fill(fillValue);
      expect(sourceArray[0]).assertEqual(0n);
      expect(sourceArray[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0130
     * @tc.name testBigUint64ArrayFill013
     * @tc.desc Verify fill() with value from BigInt(Number.MAX_SAFE_INTEGER)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fillValue: bigint = BigInt(Number.MAX_SAFE_INTEGER);
      let sourceArray = new BigUint64Array(2);
      sourceArray.fill(fillValue);
      expect(sourceArray[0]).assertEqual(fillValue);
      expect(sourceArray[1]).assertEqual(fillValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0140
     * @tc.name testBigUint64ArrayFill014
     * @tc.desc Verify fill() with BigInt(-1) wraps to MAX via constructor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fillValue: bigint = BigInt(-1);
      let sourceArray = new BigUint64Array(2);
      sourceArray.fill(fillValue);
      expect(sourceArray[0]).assertEqual(18446744073709551615n);
      expect(sourceArray[1]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0150
     * @tc.name testBigUint64ArrayFill015
     * @tc.desc Verify fill() with BigInt(255) from int constructor stores 255n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n]);
      sourceArray.fill(BigInt(255));
      expect(sourceArray[0]).assertEqual(255n);
      expect(sourceArray[1]).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0160
     * @tc.name testBigUint64ArrayFill016
     * @tc.desc Verify fill() with BigInt expression 100n+200n computes and stores correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n]);
      sourceArray.fill(BigInt(100) + BigInt(200));
      expect(sourceArray[0]).assertEqual(300n);
      expect(sourceArray[1]).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0170
     * @tc.name testBigUint64ArrayFill017
     * @tc.desc Verify fill(0n) on length-5 array and verify each element via subscript
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(5);
      sourceArray.fill(0n);
      expect(sourceArray[0]).assertEqual(0n);
      expect(sourceArray[1]).assertEqual(0n);
      expect(sourceArray[2]).assertEqual(0n);
      expect(sourceArray[3]).assertEqual(0n);
      expect(sourceArray[4]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0180
     * @tc.name testBigUint64ArrayFill018
     * @tc.desc Verify fill(42n) on length-100 array and spot-check head and tail
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let longArray = new BigUint64Array(100);
      longArray.fill(42n);
      expect(longArray[0]).assertEqual(42n);
      expect(longArray[99]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0190
     * @tc.name testBigUint64ArrayFill019
     * @tc.desc Verify fill(MAX) stores 2^64-1 exactly without truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxValue: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array(2);
      sourceArray.fill(maxValue);
      expect(sourceArray[0]).assertEqual(maxValue);
      expect(sourceArray[1]).assertEqual(maxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0200
     * @tc.name testBigUint64ArrayFill020
     * @tc.desc Verify fill(MAX-1) stores 2^64-2 exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let nearMax: bigint = 18446744073709551614n;
      let sourceArray = new BigUint64Array(2);
      sourceArray.fill(nearMax);
      expect(sourceArray[0]).assertEqual(nearMax);
      expect(sourceArray[1]).assertEqual(nearMax);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0210
     * @tc.name testBigUint64ArrayFill021
     * @tc.desc Verify fill(2^63-1) half-range value stores correctly without overflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let halfRange: bigint = 9223372036854775807n;
      let sourceArray = new BigUint64Array(2);
      sourceArray.fill(halfRange);
      expect(sourceArray[0]).assertEqual(halfRange);
      expect(sourceArray[1]).assertEqual(halfRange);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0220
     * @tc.name testBigUint64ArrayFill022
     * @tc.desc Verify fill(2^63) value stores correctly in uint64 range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let halfRangePlus: bigint = 9223372036854775808n;
      let sourceArray = new BigUint64Array(1);
      sourceArray.fill(halfRangePlus);
      expect(sourceArray[0]).assertEqual(halfRangePlus);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0230
     * @tc.name testBigUint64ArrayFill023
     * @tc.desc Verify fill(2^64) overflows modulo 2^64 and wraps to 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(2);
      sourceArray.fill(18446744073709551616n);
      expect(sourceArray[0]).assertEqual(0n);
      expect(sourceArray[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0240
     * @tc.name testBigUint64ArrayFill024
     * @tc.desc Verify fill(2^64+1) overflows modulo 2^64 and wraps to 1n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(2);
      sourceArray.fill(18446744073709551617n);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0250
     * @tc.name testBigUint64ArrayFill025
     * @tc.desc Verify fill(2^64+2) overflows and wraps to 2n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(2);
      sourceArray.fill(18446744073709551618n);
      expect(sourceArray[0]).assertEqual(2n);
      expect(sourceArray[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0260
     * @tc.name testBigUint64ArrayFill026
     * @tc.desc Verify fill(2^64+42) overflows and wraps to 42n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(2);
      sourceArray.fill(18446744073709551658n);
      expect(sourceArray[0]).assertEqual(42n);
      expect(sourceArray[1]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0270
     * @tc.name testBigUint64ArrayFill027
     * @tc.desc Verify fill(3*2^64-1) wraps to MAX
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(2);
      sourceArray.fill(55340232221128654847n);
      expect(sourceArray[0]).assertEqual(18446744073709551615n);
      expect(sourceArray[1]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0280
     * @tc.name testBigUint64ArrayFill028
     * @tc.desc Verify fill(-1n) wraps to MAX (2^64-1)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(2);
      sourceArray.fill(-1n);
      expect(sourceArray[0]).assertEqual(18446744073709551615n);
      expect(sourceArray[1]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0290
     * @tc.name testBigUint64ArrayFill029
     * @tc.desc Verify fill(-2n) wraps to MAX-1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(2);
      sourceArray.fill(-2n);
      expect(sourceArray[0]).assertEqual(18446744073709551614n);
      expect(sourceArray[1]).assertEqual(18446744073709551614n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0300
     * @tc.name testBigUint64ArrayFill030
     * @tc.desc Verify fill(-3n) wraps to MAX-2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n]);
      sourceArray.fill(-3n);
      expect(sourceArray[0]).assertEqual(18446744073709551613n);
      expect(sourceArray[1]).assertEqual(18446744073709551613n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0310
     * @tc.name testBigUint64ArrayFill031
     * @tc.desc Verify fill(-2^64) wraps to 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(1);
      sourceArray.fill(-18446744073709551616n);
      expect(sourceArray[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0320
     * @tc.name testBigUint64ArrayFill032
     * @tc.desc Verify fill(-(2^64-1)) wraps to 1n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(1);
      sourceArray.fill(-18446744073709551615n);
      expect(sourceArray[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0330
     * @tc.name testBigUint64ArrayFill033
     * @tc.desc Verify fill(-9223372036854775808n) wraps to symmetric positive 2^63
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(2);
      sourceArray.fill(-9223372036854775808n);
      expect(sourceArray[0]).assertEqual(9223372036854775808n);
      expect(sourceArray[1]).assertEqual(9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0340
     * @tc.name testBigUint64ArrayFill034
     * @tc.desc Verify fill(-(2^64+100)) wraps correctly via modulo
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n]);
      let negativeValue: bigint = -(18446744073709551616n + 100n);
      sourceArray.fill(negativeValue);
      expect(sourceArray[0]).assertEqual(18446744073709551516n);
      expect(sourceArray[1]).assertEqual(18446744073709551516n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0350
     * @tc.name testBigUint64ArrayFill035
     * @tc.desc Verify fill with overflow then normal fill, second overwrites first
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      sourceArray.fill(-1n);
      sourceArray.fill(42n);
      expect(sourceArray[0]).assertEqual(42n);
      expect(sourceArray[1]).assertEqual(42n);
      expect(sourceArray[2]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0360
     * @tc.name testBigUint64ArrayFill036
     * @tc.desc Verify fill with normal then overflow, overflow wrap overwrites
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      sourceArray.fill(42n);
      sourceArray.fill(-1n);
      expect(sourceArray[0]).assertEqual(18446744073709551615n);
      expect(sourceArray[1]).assertEqual(18446744073709551615n);
      expect(sourceArray[2]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0370
     * @tc.name testBigUint64ArrayFill037
     * @tc.desc Verify fill(2^64+value) on length-100 array, spot-check head and tail
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let longArray = new BigUint64Array(100);
      longArray.fill(18446744073709551616n + 42n);
      expect(longArray[0]).assertEqual(42n);
      expect(longArray[99]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0380
     * @tc.name testBigUint64ArrayFill038
     * @tc.desc Verify fill(2*2^64+7) wraps to 7n via expression
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n]);
      sourceArray.fill(2n * 18446744073709551616n + 7n);
      expect(sourceArray[0]).assertEqual(7n);
      expect(sourceArray[1]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0390
     * @tc.name testBigUint64ArrayFill039
     * @tc.desc Verify fill(2^64) overflow to 0n compared with direct 0n fill yields same result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let overflowArray = new BigUint64Array([1n, 2n, 3n]);
      overflowArray.fill(18446744073709551616n);
      let zeroArray = new BigUint64Array([1n, 2n, 3n]);
      zeroArray.fill(0n);
      expect(overflowArray[0]).assertEqual(zeroArray[0]);
      expect(overflowArray[1]).assertEqual(zeroArray[1]);
      expect(overflowArray[2]).assertEqual(zeroArray[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0400
     * @tc.name testBigUint64ArrayFill040
     * @tc.desc Verify fill(-1n) wrap to MAX compared with direct MAX fill yields same result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let wrapArray = new BigUint64Array([0n, 0n, 0n]);
      wrapArray.fill(-1n);
      let maxArray = new BigUint64Array([0n, 0n, 0n]);
      maxArray.fill(18446744073709551615n);
      expect(wrapArray[0]).assertEqual(maxArray[0]);
      expect(wrapArray[1]).assertEqual(maxArray[1]);
      expect(wrapArray[2]).assertEqual(maxArray[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0410
     * @tc.name testBigUint64ArrayFill041
     * @tc.desc Verify fill(value, start) with start=1 fills from index 1 to end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      sourceArray.fill(99n, 1);
      expect(sourceArray[0]).assertEqual(10n);
      expect(sourceArray[1]).assertEqual(99n);
      expect(sourceArray[2]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0420
     * @tc.name testBigUint64ArrayFill042
     * @tc.desc Verify fill(value, start=0) explicitly fills from beginning (same as single-arg)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      sourceArray.fill(0n, 0);
      expect(sourceArray[0]).assertEqual(0n);
      expect(sourceArray[1]).assertEqual(0n);
      expect(sourceArray[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0430
     * @tc.name testBigUint64ArrayFill043
     * @tc.desc Verify fill(value, start=length-1) fills only the last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      sourceArray.fill(88n, 3);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(3n);
      expect(sourceArray[3]).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0440
     * @tc.name testBigUint64ArrayFill044
     * @tc.desc Verify fill(value, start=length) is a no-op since start equals length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([7n, 7n, 7n]);
      sourceArray.fill(99n, 3);
      expect(sourceArray[0]).assertEqual(7n);
      expect(sourceArray[1]).assertEqual(7n);
      expect(sourceArray[2]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0450
     * @tc.name testBigUint64ArrayFill045
     * @tc.desc Verify fill(value, start=length+1) is a no-op, start clamped to length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([3n, 3n, 3n]);
      sourceArray.fill(99n, 4);
      expect(sourceArray[0]).assertEqual(3n);
      expect(sourceArray[1]).assertEqual(3n);
      expect(sourceArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0460
     * @tc.name testBigUint64ArrayFill046
     * @tc.desc Verify fill(value, start=100) with start far exceeding length is a no-op
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 2n]);
      sourceArray.fill(5n, 100);
      expect(sourceArray[0]).assertEqual(2n);
      expect(sourceArray[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0470
     * @tc.name testBigUint64ArrayFill047
     * @tc.desc Verify fill(value, start=-1) normalizes to length-1, fills only last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      sourceArray.fill(7n, -1);
      expect(sourceArray[0]).assertEqual(10n);
      expect(sourceArray[1]).assertEqual(20n);
      expect(sourceArray[2]).assertEqual(30n);
      expect(sourceArray[3]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0480
     * @tc.name testBigUint64ArrayFill048
     * @tc.desc Verify fill(value, start=-2) normalizes to length-2, fills last two elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      sourceArray.fill(0n, -2);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(0n);
      expect(sourceArray[3]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0490
     * @tc.name testBigUint64ArrayFill049
     * @tc.desc Verify fill(value, start=-(length)) normalizes to 0, fills entire array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      sourceArray.fill(5n, -3);
      expect(sourceArray[0]).assertEqual(5n);
      expect(sourceArray[1]).assertEqual(5n);
      expect(sourceArray[2]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0500
     * @tc.name testBigUint64ArrayFill050
     * @tc.desc Verify fill(value, start=-(length+1)) clamps to 0, fills entire array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      sourceArray.fill(9n, -4);
      expect(sourceArray[0]).assertEqual(9n);
      expect(sourceArray[1]).assertEqual(9n);
      expect(sourceArray[2]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0510
     * @tc.name testBigUint64ArrayFill051
     * @tc.desc Verify fill(value, start=-10000) with large negative start clamps to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      sourceArray.fill(3n, -10000);
      expect(sourceArray[0]).assertEqual(3n);
      expect(sourceArray[1]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0520
     * @tc.name testBigUint64ArrayFill052
     * @tc.desc Verify fill(value, start=2147483647) with int max start is a no-op
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 6n]);
      sourceArray.fill(1n, 2147483647);
      expect(sourceArray[0]).assertEqual(5n);
      expect(sourceArray[1]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0530
     * @tc.name testBigUint64ArrayFill053
     * @tc.desc Verify fill(value, start=-2147483648) with int min start clamps to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([8n, 9n]);
      sourceArray.fill(0n, -2147483648);
      expect(sourceArray[0]).assertEqual(0n);
      expect(sourceArray[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0540
     * @tc.name testBigUint64ArrayFill054
     * @tc.desc Verify fill(value, start=-1) on single-element array fills the only element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([100n]);
      sourceArray.fill(99n, -1);
      expect(sourceArray[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0550
     * @tc.name testBigUint64ArrayFill055
     * @tc.desc Verify fill(value, start=-3) on length-5 array normalizes to index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      sourceArray.fill(99n, -3);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(99n);
      expect(sourceArray[3]).assertEqual(99n);
      expect(sourceArray[4]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0560
     * @tc.name testBigUint64ArrayFill056
     * @tc.desc Verify fill(value, start=-5) on length-5 normalizes to 0, fills all
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      sourceArray.fill(22n, -5);
      expect(sourceArray[0]).assertEqual(22n);
      expect(sourceArray[1]).assertEqual(22n);
      expect(sourceArray[2]).assertEqual(22n);
      expect(sourceArray[3]).assertEqual(22n);
      expect(sourceArray[4]).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0570
     * @tc.name testBigUint64ArrayFill057
     * @tc.desc Verify fill with start from negative normalization matches explicit start=0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let normalizedArray = new BigUint64Array([1n, 2n, 3n]);
      normalizedArray.fill(99n, -3);
      let explicitArray = new BigUint64Array([1n, 2n, 3n]);
      explicitArray.fill(99n, 0);
      expect(normalizedArray[0]).assertEqual(explicitArray[0]);
      expect(normalizedArray[1]).assertEqual(explicitArray[1]);
      expect(normalizedArray[2]).assertEqual(explicitArray[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0580
     * @tc.name testBigUint64ArrayFill058
     * @tc.desc Verify fill(value, undefined, end) defaults start to 0, fills [0, end)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      sourceArray.fill(9n, undefined, 2);
      expect(sourceArray[0]).assertEqual(9n);
      expect(sourceArray[1]).assertEqual(9n);
      expect(sourceArray[2]).assertEqual(3n);
      expect(sourceArray[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0590
     * @tc.name testBigUint64ArrayFill059
     * @tc.desc Verify fill(value, start, end=0) with start=0 is a no-op
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([7n, 7n, 7n]);
      sourceArray.fill(1n, 0, 0);
      expect(sourceArray[0]).assertEqual(7n);
      expect(sourceArray[1]).assertEqual(7n);
      expect(sourceArray[2]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0600
     * @tc.name testBigUint64ArrayFill060
     * @tc.desc Verify fill(value, 0, 1) fills only the first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 5n, 5n]);
      sourceArray.fill(9n, 0, 1);
      expect(sourceArray[0]).assertEqual(9n);
      expect(sourceArray[1]).assertEqual(5n);
      expect(sourceArray[2]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0610
     * @tc.name testBigUint64ArrayFill061
     * @tc.desc Verify fill(value, 0, length-1) fills all but the last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n, 0n, 0n]);
      sourceArray.fill(7n, 0, 3);
      expect(sourceArray[0]).assertEqual(7n);
      expect(sourceArray[1]).assertEqual(7n);
      expect(sourceArray[2]).assertEqual(7n);
      expect(sourceArray[3]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0620
     * @tc.name testBigUint64ArrayFill062
     * @tc.desc Verify fill(value, 0, length) fills entire array, equivalent to single-arg
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      sourceArray.fill(8n, 0, 3);
      expect(sourceArray[0]).assertEqual(8n);
      expect(sourceArray[1]).assertEqual(8n);
      expect(sourceArray[2]).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0630
     * @tc.name testBigUint64ArrayFill063
     * @tc.desc Verify fill(value, 0, length+1) clamps end to length, fills all
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 2n, 2n]);
      sourceArray.fill(4n, 0, 4);
      expect(sourceArray[0]).assertEqual(4n);
      expect(sourceArray[1]).assertEqual(4n);
      expect(sourceArray[2]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0640
     * @tc.name testBigUint64ArrayFill064
     * @tc.desc Verify fill(value, 0, -1) with negative end normalizes to length-1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n, 0n, 0n]);
      sourceArray.fill(3n, 0, -1);
      expect(sourceArray[0]).assertEqual(3n);
      expect(sourceArray[1]).assertEqual(3n);
      expect(sourceArray[2]).assertEqual(3n);
      expect(sourceArray[3]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0650
     * @tc.name testBigUint64ArrayFill065
     * @tc.desc Verify fill(value, 0, -2) with negative end normalizes to length-2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n, 0n, 0n]);
      sourceArray.fill(5n, 0, -2);
      expect(sourceArray[0]).assertEqual(5n);
      expect(sourceArray[1]).assertEqual(5n);
      expect(sourceArray[2]).assertEqual(0n);
      expect(sourceArray[3]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0660
     * @tc.name testBigUint64ArrayFill066
     * @tc.desc Verify fill(value, 0, -(length)) normalizes end to 0, no-op
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      sourceArray.fill(9n, 0, -3);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0670
     * @tc.name testBigUint64ArrayFill067
     * @tc.desc Verify fill(value, 0, -(length+1)) clamps end to 0, no-op
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 5n]);
      sourceArray.fill(1n, 0, -3);
      expect(sourceArray[0]).assertEqual(5n);
      expect(sourceArray[1]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0680
     * @tc.name testBigUint64ArrayFill068
     * @tc.desc Verify fill(value, 0, -10000) with large negative end clamps to 0, no-op
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 2n, 2n]);
      sourceArray.fill(7n, 0, -10000);
      expect(sourceArray[0]).assertEqual(2n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0690
     * @tc.name testBigUint64ArrayFill069
     * @tc.desc Verify fill(value, 0, 2147483647) with int max end clamps to length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 1n]);
      sourceArray.fill(9n, 0, 2147483647);
      expect(sourceArray[0]).assertEqual(9n);
      expect(sourceArray[1]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0700
     * @tc.name testBigUint64ArrayFill070
     * @tc.desc Verify fill(value, 0, -2147483648) with int min end clamps to 0, no-op
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      sourceArray.fill(55n, 0, -2147483648);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0710
     * @tc.name testBigUint64ArrayFill071
     * @tc.desc Verify fill(value, start=1, end=3) fills exactly indices 1 and 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n, 0n, 0n]);
      sourceArray.fill(4n, 1, 3);
      expect(sourceArray[0]).assertEqual(0n);
      expect(sourceArray[1]).assertEqual(4n);
      expect(sourceArray[2]).assertEqual(4n);
      expect(sourceArray[3]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0720
     * @tc.name testBigUint64ArrayFill072
     * @tc.desc Verify fill(value, start=1, end=2) fills exactly one element at index 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n, 0n]);
      sourceArray.fill(5n, 1, 2);
      expect(sourceArray[0]).assertEqual(0n);
      expect(sourceArray[1]).assertEqual(5n);
      expect(sourceArray[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0730
     * @tc.name testBigUint64ArrayFill073
     * @tc.desc Verify fill(value, start=end) with same start and end is a no-op
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([3n, 3n, 3n]);
      sourceArray.fill(9n, 1, 1);
      expect(sourceArray[0]).assertEqual(3n);
      expect(sourceArray[1]).assertEqual(3n);
      expect(sourceArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0740
     * @tc.name testBigUint64ArrayFill074
     * @tc.desc Verify fill(value, start > end) is a no-op, array unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([7n, 7n, 7n]);
      sourceArray.fill(1n, 2, 1);
      expect(sourceArray[0]).assertEqual(7n);
      expect(sourceArray[1]).assertEqual(7n);
      expect(sourceArray[2]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0750
     * @tc.name testBigUint64ArrayFill075
     * @tc.desc Verify fill(value, negative-start > end) after normalization start > end, no-op
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      sourceArray.fill(0n, -1, 1);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(3n);
      expect(sourceArray[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0760
     * @tc.name testBigUint64ArrayFill076
     * @tc.desc Verify fill(value, start=length-1, end=length) fills the last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      sourceArray.fill(0n, 4, 5);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(3n);
      expect(sourceArray[3]).assertEqual(4n);
      expect(sourceArray[4]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0770
     * @tc.name testBigUint64ArrayFill077
     * @tc.desc Verify fill(value, start=-2, end=-1) fills the second-to-last element only
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n, 0n, 0n]);
      sourceArray.fill(6n, -2, -1);
      expect(sourceArray[0]).assertEqual(0n);
      expect(sourceArray[1]).assertEqual(0n);
      expect(sourceArray[2]).assertEqual(6n);
      expect(sourceArray[3]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0780
     * @tc.name testBigUint64ArrayFill078
     * @tc.desc Verify fill(value, start=-(length), end=length) fills the entire array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      sourceArray.fill(7n, -3, 3);
      expect(sourceArray[0]).assertEqual(7n);
      expect(sourceArray[1]).assertEqual(7n);
      expect(sourceArray[2]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0790
     * @tc.name testBigUint64ArrayFill079
     * @tc.desc Verify fill(value, start=100, end=200) with both exceeding length, no-op
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([4n, 4n]);
      sourceArray.fill(1n, 100, 200);
      expect(sourceArray[0]).assertEqual(4n);
      expect(sourceArray[1]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0800
     * @tc.name testBigUint64ArrayFill080
     * @tc.desc Verify fill(value, start=-100, end=-50) with both negative beyond length, no-op
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 2n]);
      sourceArray.fill(8n, -100, -50);
      expect(sourceArray[0]).assertEqual(2n);
      expect(sourceArray[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0810
     * @tc.name testBigUint64ArrayFill081
     * @tc.desc Verify fill(value, start=1, end=-1) fills [1, length-1) with negative end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      sourceArray.fill(55n, 1, -1);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(55n);
      expect(sourceArray[2]).assertEqual(55n);
      expect(sourceArray[3]).assertEqual(55n);
      expect(sourceArray[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0820
     * @tc.name testBigUint64ArrayFill082
     * @tc.desc Verify fill(value, start=-1, end=length) normalizes start, fills last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      sourceArray.fill(99n, -1, 5);
      expect(sourceArray[0]).assertEqual(10n);
      expect(sourceArray[1]).assertEqual(20n);
      expect(sourceArray[2]).assertEqual(30n);
      expect(sourceArray[3]).assertEqual(40n);
      expect(sourceArray[4]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0830
     * @tc.name testBigUint64ArrayFill083
     * @tc.desc Verify fill(value, 0, -1) on length-1 array normalizes end to 0, no-op
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let singleArray = new BigUint64Array([100n]);
      singleArray.fill(99n, 0, -1);
      expect(singleArray[0]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0840
     * @tc.name testBigUint64ArrayFill084
     * @tc.desc Verify fill(value, start=2, end=4) partial fill and verify boundary elements unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      sourceArray.fill(0n, 2, 4);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(0n);
      expect(sourceArray[3]).assertEqual(0n);
      expect(sourceArray[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0850
     * @tc.name testBigUint64ArrayFill085
     * @tc.desc Verify fill returns this, the same reference as the original array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let returnValue = sourceArray.fill(9n);
      expect(returnValue).assertEqual(sourceArray);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0860
     * @tc.name testBigUint64ArrayFill086
     * @tc.desc Verify fill return value is a BigUint64Array instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(2);
      let returnValue = sourceArray.fill(1n);
      expect(returnValue.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0870
     * @tc.name testBigUint64ArrayFill087
     * @tc.desc Verify chain fill().fill() where second overwrites the first
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n, 0n]);
      sourceArray.fill(5n).fill(9n);
      expect(sourceArray[0]).assertEqual(9n);
      expect(sourceArray[1]).assertEqual(9n);
      expect(sourceArray[2]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0880
     * @tc.name testBigUint64ArrayFill088
     * @tc.desc Verify triple chain fill where final value overwrites previous two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n]);
      sourceArray.fill(1n).fill(2n).fill(3n);
      expect(sourceArray[0]).assertEqual(3n);
      expect(sourceArray[1]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0890
     * @tc.name testBigUint64ArrayFill089
     * @tc.desc Verify fill does not change array length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let lengthBefore: int = sourceArray.length;
      sourceArray.fill(0n, 1, 3);
      expect(sourceArray.length).assertEqual(lengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0900
     * @tc.name testBigUint64ArrayFill090
     * @tc.desc Verify fill does not change byteLength
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let byteLenBefore: int = sourceArray.byteLength;
      sourceArray.fill(9n);
      expect(sourceArray.byteLength).assertEqual(byteLenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0910
     * @tc.name testBigUint64ArrayFill091
     * @tc.desc Verify fill does not change the underlying buffer reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(3);
      let bufBefore: ArrayBuffer = sourceArray.buffer;
      sourceArray.fill(7n);
      expect(sourceArray.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0920
     * @tc.name testBigUint64ArrayFill092
     * @tc.desc Verify fill does not change byteOffset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let offsetBefore: int = sourceArray.byteOffset;
      sourceArray.fill(55n);
      expect(sourceArray.byteOffset).assertEqual(offsetBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0930
     * @tc.name testBigUint64ArrayFill093
     * @tc.desc Verify fill(start=0, end=0) returns this without modifying array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 5n]);
      let returnValue = sourceArray.fill(99n, 0, 0);
      expect(returnValue).assertEqual(sourceArray);
      expect(sourceArray[0]).assertEqual(5n);
      expect(sourceArray[1]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0940
     * @tc.name testBigUint64ArrayFill094
     * @tc.desc Verify fill(start > end) returns this without modifying array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let returnValue = sourceArray.fill(99n, 3, 1);
      expect(returnValue[0]).assertEqual(1n);
      expect(returnValue[1]).assertEqual(2n);
      expect(returnValue[2]).assertEqual(3n);
      expect(returnValue[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0950
     * @tc.name testBigUint64ArrayFill095
     * @tc.desc Verify fill then subscript read returns the filled value consistently
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(4);
      sourceArray.fill(42n, 1, 3);
      expect(sourceArray[0]).assertEqual(0n);
      expect(sourceArray[1]).assertEqual(42n);
      expect(sourceArray[2]).assertEqual(42n);
      expect(sourceArray[3]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0960
     * @tc.name testBigUint64ArrayFill096
     * @tc.desc Verify chain fill with different ranges: fill(1n, 0, 2).fill(2n, 2, 4) mixed ranges
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n, 0n, 0n]);
      sourceArray.fill(99n).fill(55n, 1, 3);
      expect(sourceArray[0]).assertEqual(99n);
      expect(sourceArray[1]).assertEqual(55n);
      expect(sourceArray[2]).assertEqual(55n);
      expect(sourceArray[3]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0970
     * @tc.name testBigUint64ArrayFill097
     * @tc.desc Verify chain fill return type is BigUint64Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let chainedResult: BigUint64Array = sourceArray.fill(11n).fill(22n);
      expect(chainedResult.BYTES_PER_ELEMENT).assertEqual(8);
      expect(chainedResult[0]).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0980
     * @tc.name testBigUint64ArrayFill098
     * @tc.desc Verify number-typed fill(0) yields same result as BigInt fill(0n)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let bigintArray = new BigUint64Array([99n, 99n, 99n]);
      bigintArray.fill(0n);
      let numberArray = new BigUint64Array([99n, 99n, 99n]);
      numberArray.fill(0);
      expect(bigintArray[0]).assertEqual(numberArray[0]);
      expect(bigintArray[1]).assertEqual(numberArray[1]);
      expect(bigintArray[2]).assertEqual(numberArray[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_0990
     * @tc.name testBigUint64ArrayFill099
     * @tc.desc Verify number-typed fill(42) yields same result as BigInt fill(42n) full array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let bigintArray = new BigUint64Array([99n, 99n, 99n]);
      bigintArray.fill(42n);
      let numberArray = new BigUint64Array([99n, 99n, 99n]);
      numberArray.fill(42);
      expect(bigintArray[0]).assertEqual(numberArray[0]);
      expect(bigintArray[1]).assertEqual(numberArray[1]);
      expect(bigintArray[2]).assertEqual(numberArray[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1000
     * @tc.name testBigUint64ArrayFill100
     * @tc.desc Verify number-typed fill(-1) wraps to MAX same as BigInt fill(-1n)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let bigintArray = new BigUint64Array([0n, 0n]);
      bigintArray.fill(-1n, 0, 1);
      let numberArray = new BigUint64Array([0n, 0n]);
      numberArray.fill(-1, 0, 1);
      expect(bigintArray[0]).assertEqual(numberArray[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1010
     * @tc.name testBigUint64ArrayFill101
     * @tc.desc Verify number-typed fill(-2) wraps to MAX-1 same as BigInt fill(-2n)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let bigintArray = new BigUint64Array([0n, 0n]);
      bigintArray.fill(-2n, 0, 1);
      let numberArray = new BigUint64Array([0n, 0n]);
      numberArray.fill(-2, 0, 1);
      expect(bigintArray[0]).assertEqual(18446744073709551614n);
      expect(numberArray[0]).assertEqual(18446744073709551614n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1020
     * @tc.name testBigUint64ArrayFill102
     * @tc.desc Verify number-typed fill(-2147483648) int32 min wraps via BigInt conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n]);
      sourceArray.fill(-2147483648, 0, 1);
      expect(sourceArray[0]).assertEqual(18446744071562067968n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1030
     * @tc.name testBigUint64ArrayFill103
     * @tc.desc Verify number-typed fill(2147483647) int32 max stores correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n]);
      sourceArray.fill(2147483647, 0, 1);
      expect(sourceArray[0]).assertEqual(2147483647n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1040
     * @tc.name testBigUint64ArrayFill104
     * @tc.desc Verify number-typed fill(MAX_SAFE_INTEGER) converts precisely
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n]);
      sourceArray.fill(9007199254740991, 0, 1);
      expect(sourceArray[0]).assertEqual(9007199254740991n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1050
     * @tc.name testBigUint64ArrayFill105
     * @tc.desc Verify number-typed fill(MAX_SAFE_INTEGER+1) double precisely representable
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n]);
      sourceArray.fill(9007199254740992, 0, 1);
      expect(sourceArray[0]).assertEqual(9007199254740992n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1060
     * @tc.name testBigUint64ArrayFill106
     * @tc.desc Verify BigInt fill(value, start) with negative start, cross-overload same behavior as number fill
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let bigintArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      bigintArray.fill(5n, -2);
      let numberArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      numberArray.fill(5, -2);
      expect(bigintArray[2]).assertEqual(numberArray[2]);
      expect(bigintArray[3]).assertEqual(numberArray[3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1070
     * @tc.name testBigUint64ArrayFill107
     * @tc.desc Verify BigInt fill(value, 0, end) negative end, same as number fill negative end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let bigintArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      bigintArray.fill(5n, 0, -2);
      let numberArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      numberArray.fill(5, 0, -2);
      expect(bigintArray[0]).assertEqual(numberArray[0]);
      expect(bigintArray[1]).assertEqual(numberArray[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1080
     * @tc.name testBigUint64ArrayFill108
     * @tc.desc Verify start > end no-op behavior is identical across overloads
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let bigintArray = new BigUint64Array([10n, 20n, 30n]);
      bigintArray.fill(9n, 2, 1);
      let numberArray = new BigUint64Array([10n, 20n, 30n]);
      numberArray.fill(9, 2, 1);
      expect(bigintArray[0]).assertEqual(10n);
      expect(numberArray[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1090
     * @tc.name testBigUint64ArrayFill109
     * @tc.desc Verify start=0 end=0 no-op same across overloads
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let bigintArray = new BigUint64Array([10n, 20n, 30n]);
      bigintArray.fill(9n, 0, 0);
      let numberArray = new BigUint64Array([10n, 20n, 30n]);
      numberArray.fill(9, 0, 0);
      expect(bigintArray[0]).assertEqual(10n);
      expect(numberArray[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1100
     * @tc.name testBigUint64ArrayFill110
     * @tc.desc Verify start=end=length no-op same across overloads
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let bigintArray = new BigUint64Array([10n, 20n, 30n]);
      bigintArray.fill(9n, 3, 3);
      let numberArray = new BigUint64Array([10n, 20n, 30n]);
      numberArray.fill(9, 3, 3);
      expect(bigintArray[0]).assertEqual(10n);
      expect(numberArray[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1110
     * @tc.name testBigUint64ArrayFill111
     * @tc.desc Verify negative start beyond -length clamps to 0 same across overloads
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let bigintArray = new BigUint64Array([10n, 20n, 30n]);
      bigintArray.fill(5n, -10);
      let numberArray = new BigUint64Array([10n, 20n, 30n]);
      numberArray.fill(5, -10);
      expect(bigintArray[0]).assertEqual(numberArray[0]);
      expect(bigintArray[1]).assertEqual(numberArray[1]);
      expect(bigintArray[2]).assertEqual(numberArray[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1120
     * @tc.name testBigUint64ArrayFill112
     * @tc.desc Verify explicit start=0 and end=length matches default behavior across overloads
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let defaultBigintArray = new BigUint64Array([3n, 3n, 3n]);
      defaultBigintArray.fill(2n);
      let explicitBigintArray = new BigUint64Array([3n, 3n, 3n]);
      explicitBigintArray.fill(2n, 0, 3);
      let defaultNumberArray = new BigUint64Array([3n, 3n, 3n]);
      defaultNumberArray.fill(2);
      let explicitNumberArray = new BigUint64Array([3n, 3n, 3n]);
      explicitNumberArray.fill(2, 0, 3);
      expect(defaultBigintArray[1]).assertEqual(explicitBigintArray[1]);
      expect(defaultNumberArray[1]).assertEqual(explicitNumberArray[1]);
      expect(defaultBigintArray[1]).assertEqual(defaultNumberArray[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1130
     * @tc.name testBigUint64ArrayFill113
     * @tc.desc Verify cross-overload chain fill(value).fill(number) returns same reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n, 0n, 0n]);
      let returnValue = sourceArray.fill(1n, 0, 2).fill(2, 2, 4);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(1n);
      expect(sourceArray[2]).assertEqual(2n);
      expect(sourceArray[3]).assertEqual(2n);
      expect(returnValue).assertEqual(sourceArray);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1140
     * @tc.name testBigUint64ArrayFill114
     * @tc.desc Verify cross-overload fill produces same join output
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let bigintArray = new BigUint64Array([0n, 0n, 0n]);
      bigintArray.fill(42n);
      let numberArray = new BigUint64Array([0n, 0n, 0n]);
      numberArray.fill(42);
      let bigintJoin: string = bigintArray.join(',');
      let numberJoin: string = numberArray.join(',');
      expect(bigintJoin).assertEqual(numberJoin);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1150
     * @tc.name testBigUint64ArrayFill115
     * @tc.desc Verify fill via reference modifies original array (shared identity)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let returnValue = sourceArray.fill(5n, 0, 2);
      returnValue[0] = 99n;
      expect(sourceArray[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1160
     * @tc.name testBigUint64ArrayFill116
     * @tc.desc Verify two references to same array, fill through one, visible through other
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let firstRef = new BigUint64Array([10n, 20n, 30n]);
      let secondRef = firstRef;
      firstRef.fill(99n, 0, 1);
      expect(secondRef[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1170
     * @tc.name testBigUint64ArrayFill117
     * @tc.desc Verify fill through subarray view on same buffer is visible in parent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let parentArray = new BigUint64Array([0n, 0n, 0n, 0n]);
      let subView = new BigUint64Array(parentArray.buffer, 0, 2);
      subView.fill(88n);
      expect(parentArray[0]).assertEqual(88n);
      expect(parentArray[1]).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1180
     * @tc.name testBigUint64ArrayFill118
     * @tc.desc Verify fill on parent is visible through overlapping subarray view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let parentArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let subView = new BigUint64Array(parentArray.buffer, 8, 2);
      parentArray.fill(9n, 1, 3);
      expect(subView[0]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1190
     * @tc.name testBigUint64ArrayFill119
     * @tc.desc Verify cross-overload fill visible through subarray view on same buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let parentArray = new BigUint64Array([0n, 0n, 0n, 0n]);
      parentArray.fill(77, 0, 4);
      let subView = new BigUint64Array(parentArray.buffer, 16, 1);
      expect(subView[0]).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1200
     * @tc.name testBigUint64ArrayFill120
     * @tc.desc Verify two independent BigUint64Array instances fill independently
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let firstArray = new BigUint64Array([10n, 20n]);
      let secondArray = new BigUint64Array([10n, 20n]);
      firstArray.fill(99n);
      secondArray.fill(33n);
      expect(firstArray[0]).assertEqual(99n);
      expect(secondArray[0]).assertEqual(33n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1210
     * @tc.name testBigUint64ArrayFill121
     * @tc.desc Verify cumulative fill effects: sequential partial fills on same array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      sourceArray.fill(1n, 0, 1);
      sourceArray.fill(2n, 1, 2);
      sourceArray.fill(3n, 2, 3);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1220
     * @tc.name testBigUint64ArrayFill122
     * @tc.desc Verify fill then manual subscript assignment overwrites fill value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n, 0n]);
      sourceArray.fill(5n);
      sourceArray[1] = 9n;
      expect(sourceArray[0]).assertEqual(5n);
      expect(sourceArray[1]).assertEqual(9n);
      expect(sourceArray[2]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1230
     * @tc.name testBigUint64ArrayFill123
     * @tc.desc Verify cross-overload overlapping fills: BigInt then number on overlapping range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n, 0n, 0n]);
      sourceArray.fill(1n, 0, 3);
      sourceArray.fill(2, 1, 4);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(2n);
      expect(sourceArray[3]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1240
     * @tc.name testBigUint64ArrayFill124
     * @tc.desc Verify fill writes to underlying ArrayBuffer, visible through new view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(4);
      sourceArray.fill(42n);
      let bufferView = new BigUint64Array(sourceArray.buffer);
      expect(bufferView[0]).assertEqual(42n);
      expect(bufferView[3]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1250
     * @tc.name testBigUint64ArrayFill125
     * @tc.desc Verify partial fill on one view is visible through differently-offset view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(24);
      let firstView = new BigUint64Array(buffer, 0, 2);
      let secondView = new BigUint64Array(buffer, 8, 1);
      firstView.fill(55n);
      expect(secondView[0]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1260
     * @tc.name testBigUint64ArrayFill126
     * @tc.desc Verify BYTES_PER_ELEMENT is 8 before and after fill
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n]);
      expect(sourceArray.BYTES_PER_ELEMENT).assertEqual(8);
      sourceArray.fill(42n);
      expect(sourceArray.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1270
     * @tc.name testBigUint64ArrayFill127
     * @tc.desc Verify fill with overflow value on partial range only affects specified range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n, 0n, 0n]);
      sourceArray.fill(-1n, 1, 3);
      expect(sourceArray[0]).assertEqual(0n);
      expect(sourceArray[1]).assertEqual(18446744073709551615n);
      expect(sourceArray[2]).assertEqual(18446744073709551615n);
      expect(sourceArray[3]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1280
     * @tc.name testBigUint64ArrayFill128
     * @tc.desc Verify BigInt fill with expression value (MAX-1n) computed at call site
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxValue: bigint = 18446744073709551615n;
      let computedValue: bigint = maxValue - 1n;
      let sourceArray = new BigUint64Array(2);
      sourceArray.fill(computedValue);
      expect(sourceArray[0]).assertEqual(18446744073709551614n);
      expect(sourceArray[1]).assertEqual(18446744073709551614n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1290
     * @tc.name testBigUint64ArrayFill129
     * @tc.desc Verify fill with value constructed from BigInt(Number.MAX_SAFE_INTEGER) does not overflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let safeValue: bigint = BigInt(Number.MAX_SAFE_INTEGER);
      let sourceArray = new BigUint64Array(1);
      sourceArray.fill(safeValue);
      expect(sourceArray[0]).assertEqual(safeValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1300
     * @tc.name testBigUint64ArrayFill130
     * @tc.desc Verify start and end both negative with same value results in no-op
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 5n, 5n]);
      sourceArray.fill(9n, -1, -1);
      expect(sourceArray[0]).assertEqual(5n);
      expect(sourceArray[1]).assertEqual(5n);
      expect(sourceArray[2]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1310
     * @tc.name testBigUint64ArrayFill131
     * @tc.desc Verify fill(0n) on default-constructed array (all 0n) is idempotent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(5);
      sourceArray.fill(0n);
      expect(sourceArray[0]).assertEqual(0n);
      expect(sourceArray[1]).assertEqual(0n);
      expect(sourceArray[2]).assertEqual(0n);
      expect(sourceArray[3]).assertEqual(0n);
      expect(sourceArray[4]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1320
     * @tc.name testBigUint64ArrayFill132
     * @tc.desc Verify pre-filled array with same value as fill is effectively idempotent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fillValue: bigint = 99n;
      let sourceArray = new BigUint64Array([fillValue, fillValue, fillValue]);
      sourceArray.fill(fillValue);
      expect(sourceArray[0]).assertEqual(fillValue);
      expect(sourceArray[1]).assertEqual(fillValue);
      expect(sourceArray[2]).assertEqual(fillValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1330
     * @tc.name testBigUint64ArrayFill133
     * @tc.desc Verify fill with byteLength from new ArrayBuffer(16) offset 0 maintains offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(32);
      let sourceArray = new BigUint64Array(buffer, 8, 3);
      expect(sourceArray.byteOffset).assertEqual(8);
      sourceArray.fill(5n);
      expect(sourceArray.byteOffset).assertEqual(8);
      sourceArray.fill(7);
      expect(sourceArray.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1340
     * @tc.name testBigUint64ArrayFill134
     * @tc.desc Verify fill(value: int) accepts binary literal 0b101010 and writes 42n to every element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n]);
      let binaryFillValue: int = 0b101010;
      sourceArray.fill(binaryFillValue);
      expect(sourceArray[0]).assertEqual(42n);
      expect(sourceArray[1]).assertEqual(42n);
      expect(sourceArray[2]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1350
     * @tc.name testBigUint64ArrayFill135
     * @tc.desc Verify fill(value: int) accepts octal literal 0o52 and writes 42n to every element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n]);
      let octalFillValue: int = 0o52;
      sourceArray.fill(octalFillValue);
      expect(sourceArray[0]).assertEqual(42n);
      expect(sourceArray[1]).assertEqual(42n);
      expect(sourceArray[2]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1360
     * @tc.name testBigUint64ArrayFill136
     * @tc.desc Verify fill(value: int) accepts hexadecimal literal 0x2A and writes 42n to every element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n]);
      let hexadecimalFillValue: int = 0x2A;
      sourceArray.fill(hexadecimalFillValue);
      expect(sourceArray[0]).assertEqual(42n);
      expect(sourceArray[1]).assertEqual(42n);
      expect(sourceArray[2]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1370
     * @tc.name testBigUint64ArrayFill137
     * @tc.desc Verify fill(value: BigInt) accepts BigInt from binary number 0b11111111 and writes 255n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n]);
      let binarySourceValue: int = 0b11111111;
      let fillValue: bigint = BigInt(binarySourceValue);
      sourceArray.fill(fillValue);
      expect(sourceArray[0]).assertEqual(255n);
      expect(sourceArray[1]).assertEqual(255n);
      expect(sourceArray[2]).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1380
     * @tc.name testBigUint64ArrayFill138
     * @tc.desc Verify fill(value: BigInt) accepts BigInt from octal number 0o377 and writes 255n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n]);
      let octalSourceValue: int = 0o377;
      let fillValue: bigint = BigInt(octalSourceValue);
      sourceArray.fill(fillValue);
      expect(sourceArray[0]).assertEqual(255n);
      expect(sourceArray[1]).assertEqual(255n);
      expect(sourceArray[2]).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1390
     * @tc.name testBigUint64ArrayFill139
     * @tc.desc Verify fill(value: BigInt) accepts BigInt from hexadecimal number 0xFF and writes 255n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n]);
      let hexadecimalSourceValue: int = 0xFF;
      let fillValue: bigint = BigInt(hexadecimalSourceValue);
      sourceArray.fill(fillValue);
      expect(sourceArray[0]).assertEqual(255n);
      expect(sourceArray[1]).assertEqual(255n);
      expect(sourceArray[2]).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1400
     * @tc.name testBigUint64ArrayFill140
     * @tc.desc Verify fill(value:int,start:int,end:int) with binary value 0b101010, octal start 0o1, and hex end 0x04 fills [1,4)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let binaryFillValue: int = 0b101010;
      let octalStartIndex: int = 0o1;
      let hexadecimalEndIndex: int = 0x04;
      sourceArray.fill(binaryFillValue, octalStartIndex, hexadecimalEndIndex);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(42n);
      expect(sourceArray[2]).assertEqual(42n);
      expect(sourceArray[3]).assertEqual(42n);
      expect(sourceArray[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1410
     * @tc.name testBigUint64ArrayFill141
     * @tc.desc Verify fill(BigInt(number),start:int,end:int) with BigInt(0xFF), binary negative start, and hex end fills normalized [2,4)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([9n, 8n, 7n, 6n, 5n]);
      let hexadecimalSourceValue: int = 0xFF;
      let fillValue: bigint = BigInt(hexadecimalSourceValue);
      let binaryStartMagnitude: int = 0b11;
      let normalizedStartIndex: int = -binaryStartMagnitude;
      let hexadecimalEndIndex: int = 0x04;
      sourceArray.fill(fillValue, normalizedStartIndex, hexadecimalEndIndex);
      expect(sourceArray[0]).assertEqual(9n);
      expect(sourceArray[1]).assertEqual(8n);
      expect(sourceArray[2]).assertEqual(255n);
      expect(sourceArray[3]).assertEqual(255n);
      expect(sourceArray[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1420
     * @tc.name testBigUint64ArrayFill142
     * @tc.desc Verify fill(value:int,start:int,end:int) with octal value 0o52 clamps negative octal start and binary overlength end to full range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([3n, 4n, 5n, 6n]);
      let octalFillValue: int = 0o52;
      let octalStartMagnitude: int = 0o10;
      let normalizedStartIndex: int = -octalStartMagnitude;
      let binaryEndIndex: int = 0b100000;
      sourceArray.fill(octalFillValue, normalizedStartIndex, binaryEndIndex);
      expect(sourceArray[0]).assertEqual(42n);
      expect(sourceArray[1]).assertEqual(42n);
      expect(sourceArray[2]).assertEqual(42n);
      expect(sourceArray[3]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1430
     * @tc.name testBigUint64ArrayFill143
     * @tc.desc Verify fill(value: byte) accepts declared byte value 12 and writes 12n to every element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n]);
      let byteFillValue: byte = 12;
      sourceArray.fill(byteFillValue);
      expect(sourceArray[0]).assertEqual(12n);
      expect(sourceArray[1]).assertEqual(12n);
      expect(sourceArray[2]).assertEqual(12n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1440
     * @tc.name testBigUint64ArrayFill144
     * @tc.desc Verify fill(value: short) accepts declared short value 2048 and writes 2048n to every element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n]);
      let shortFillValue: short = 2048;
      sourceArray.fill(shortFillValue);
      expect(sourceArray[0]).assertEqual(2048n);
      expect(sourceArray[1]).assertEqual(2048n);
      expect(sourceArray[2]).assertEqual(2048n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1450
     * @tc.name testBigUint64ArrayFill145
     * @tc.desc Verify fill(value: long) accepts declared long value 10000000000 and writes 10000000000n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n]);
      let longFillValue: long = 10000000000;
      sourceArray.fill(longFillValue);
      expect(sourceArray[0]).assertEqual(10000000000n);
      expect(sourceArray[1]).assertEqual(10000000000n);
      expect(sourceArray[2]).assertEqual(10000000000n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1460
     * @tc.name testBigUint64ArrayFill146
     * @tc.desc Verify fill(value: BigInt, start: byte) accepts declared byte start 1 and fills through the end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let fillValue: bigint = 9n;
      let byteStartIndex: byte = 1;
      sourceArray.fill(fillValue, byteStartIndex);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(9n);
      expect(sourceArray[2]).assertEqual(9n);
      expect(sourceArray[3]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1470
     * @tc.name testBigUint64ArrayFill147
     * @tc.desc Verify fill(value: BigInt, start: short, end: short) accepts declared short range [1,3)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let fillValue: bigint = 77n;
      let shortStartIndex: short = 1;
      let shortEndIndex: short = 3;
      sourceArray.fill(fillValue, shortStartIndex, shortEndIndex);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(77n);
      expect(sourceArray[2]).assertEqual(77n);
      expect(sourceArray[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1480
     * @tc.name testBigUint64ArrayFill148
     * @tc.desc Verify fill(value: BigInt, start: int, end: byte) accepts declared byte end 3 and fills [1,3)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let fillValue: bigint = 66n;
      let startIndex: int = 1;
      let byteEndIndex: byte = 3;
      sourceArray.fill(fillValue, startIndex, byteEndIndex);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(66n);
      expect(sourceArray[2]).assertEqual(66n);
      expect(sourceArray[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1490
     * @tc.name testBigUint64ArrayFill149
     * @tc.desc Verify fill() mutates its receiver while map() returns a filled copy and leaves its source unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fillValue: bigint = 9n;
      let mutableArray = new BigUint64Array([1n, 2n, 3n]);
      let fillResult = mutableArray.fill(fillValue);
      expect(fillResult).assertEqual(mutableArray);
      expect(mutableArray[0]).assertEqual(9n);
      expect(mutableArray[1]).assertEqual(9n);
      expect(mutableArray[2]).assertEqual(9n);
      let immutableSourceArray = new BigUint64Array([1n, 2n, 3n]);
      let mappedArray = immutableSourceArray.map((): bigint => {
        return fillValue;
      });
      expect(mappedArray[0]).assertEqual(9n);
      expect(mappedArray[1]).assertEqual(9n);
      expect(mappedArray[2]).assertEqual(9n);
      expect(immutableSourceArray[0]).assertEqual(1n);
      expect(immutableSourceArray[1]).assertEqual(2n);
      expect(immutableSourceArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1500
     * @tc.name testBigUint64ArrayFill150
     * @tc.desc Verify fill on non-zero byteOffset view writes back only inside the shared buffer window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sharedBuffer);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      let byteOffset: int = 8;
      let viewLength: int = 3;
      let windowView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let fillValue: bigint = 77n;
      let startIndex: int = 1;
      let endIndex: int = 3;
      windowView.fill(fillValue, startIndex, endIndex);
      expect(fullView[0]).assertEqual(10n);
      expect(fullView[1]).assertEqual(20n);
      expect(fullView[2]).assertEqual(77n);
      expect(fullView[3]).assertEqual(77n);
      expect(fullView[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1510
     * @tc.name testBigUint64ArrayFill151
     * @tc.desc Verify fill on a subarray window writes only the selected range back to the parent array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let parentArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n, 60n]);
      let windowView = parentArray.subarray(1, 5);
      let fillValue: bigint = 88n;
      let startIndex: int = 1;
      let endIndex: int = 3;
      windowView.fill(fillValue, startIndex, endIndex);
      expect(parentArray[0]).assertEqual(10n);
      expect(parentArray[1]).assertEqual(20n);
      expect(parentArray[2]).assertEqual(88n);
      expect(parentArray[3]).assertEqual(88n);
      expect(parentArray[4]).assertEqual(50n);
      expect(parentArray[5]).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1520
     * @tc.name testBigUint64ArrayFill152
     * @tc.desc Verify fill negative start and end are normalized inside a subarray window before parent writeback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let parentArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n, 7n]);
      let windowView = parentArray.subarray(2, 6);
      let fillValue: bigint = 9n;
      let startIndex: int = -3;
      let endIndex: int = -1;
      windowView.fill(fillValue, startIndex, endIndex);
      expect(parentArray[0]).assertEqual(1n);
      expect(parentArray[1]).assertEqual(2n);
      expect(parentArray[2]).assertEqual(3n);
      expect(parentArray[3]).assertEqual(9n);
      expect(parentArray[4]).assertEqual(9n);
      expect(parentArray[5]).assertEqual(6n);
      expect(parentArray[6]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1530
     * @tc.name testBigUint64ArrayFill153
     * @tc.desc Verify fill(value: int) accepts decimal literal 42 and writes 42n to every element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let decimalFillValue: int = 42;
      sourceArray.fill(decimalFillValue);
      expect(sourceArray[0]).assertEqual(42n);
      expect(sourceArray[1]).assertEqual(42n);
      expect(sourceArray[2]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1540
     * @tc.name testBigUint64ArrayFill154
     * @tc.desc Verify fill on byteOffset view clamps negative start and overlength end inside the local window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(48);
      let fullView = new BigUint64Array(sharedBuffer);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      fullView[5] = 60n;
      let byteOffset: int = 8;
      let viewLength: int = 4;
      let windowView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let fillValue: bigint = 99n;
      let startIndex: int = -100;
      let endIndex: int = 100;
      windowView.fill(fillValue, startIndex, endIndex);
      expect(fullView[0]).assertEqual(10n);
      expect(fullView[1]).assertEqual(99n);
      expect(fullView[2]).assertEqual(99n);
      expect(fullView[3]).assertEqual(99n);
      expect(fullView[4]).assertEqual(99n);
      expect(fullView[5]).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1550
     * @tc.name testBigUint64ArrayFill155
     * @tc.desc Verify subarray fill is no-op when normalized negative start is greater than normalized end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let parentArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      let windowView = parentArray.subarray(1, 5);
      let fillValue: bigint = 77n;
      let startIndex: int = -1;
      let endIndex: int = -3;
      windowView.fill(fillValue, startIndex, endIndex);
      expect(parentArray[0]).assertEqual(1n);
      expect(parentArray[1]).assertEqual(2n);
      expect(parentArray[2]).assertEqual(3n);
      expect(parentArray[3]).assertEqual(4n);
      expect(parentArray[4]).assertEqual(5n);
      expect(parentArray[5]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1560
     * @tc.name testBigUint64ArrayFill156
     * @tc.desc Verify fill on a nested subarray from a byteOffset view writes to the correct shared buffer positions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(64);
      let fullView = new BigUint64Array(sourceBuffer);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      fullView[5] = 60n;
      fullView[6] = 70n;
      fullView[7] = 80n;
      let byteOffset: int = 8;
      let offsetLength: int = 6;
      let offsetView = new BigUint64Array(sourceBuffer, byteOffset, offsetLength);
      let middleWindow = offsetView.subarray(1, 5);
      let nestedWindow = middleWindow.subarray(1, 4);
      let fillValue: bigint = 88n;
      let startIndex: int = 1;
      let endIndex: int = 3;
      nestedWindow.fill(fillValue, startIndex, endIndex);
      expect(fullView[0]).assertEqual(10n);
      expect(fullView[1]).assertEqual(20n);
      expect(fullView[2]).assertEqual(30n);
      expect(fullView[3]).assertEqual(40n);
      expect(fullView[4]).assertEqual(88n);
      expect(fullView[5]).assertEqual(88n);
      expect(fullView[6]).assertEqual(70n);
      expect(fullView[7]).assertEqual(80n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1570
     * @tc.name testBigUint64ArrayFill157
     * @tc.desc Verify fill on a slice window mutates the independent copy without changing the source buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(48);
      let fullView = new BigUint64Array(sourceBuffer);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      fullView[5] = 60n;
      let byteOffset: int = 8;
      let offsetLength: int = 4;
      let offsetView = new BigUint64Array(sourceBuffer, byteOffset, offsetLength);
      let sliceBegin: int = 1;
      let sliceEnd: int = 4;
      let sliceWindow = offsetView.slice(sliceBegin, sliceEnd);
      let fillValue: bigint = 77n;
      let startIndex: int = 1;
      let endIndex: int = 3;
      sliceWindow.fill(fillValue, startIndex, endIndex);
      let usesIndependentBuffer: boolean = sliceWindow.buffer !== sourceBuffer;
      expect(usesIndependentBuffer).assertTrue();
      expect(sliceWindow[0]).assertEqual(30n);
      expect(sliceWindow[1]).assertEqual(77n);
      expect(sliceWindow[2]).assertEqual(77n);
      expect(fullView[0]).assertEqual(10n);
      expect(fullView[1]).assertEqual(20n);
      expect(fullView[2]).assertEqual(30n);
      expect(fullView[3]).assertEqual(40n);
      expect(fullView[4]).assertEqual(50n);
      expect(fullView[5]).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1580
     * @tc.name testBigUint64ArrayFill158
     * @tc.desc Verify zero-length byteOffset view fill is a no-op and preserves source data
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sourceBuffer);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      let byteOffset: int = 16;
      let viewLength: int = 0;
      let zeroLengthView = new BigUint64Array(sourceBuffer, byteOffset, viewLength);
      let fillValue: bigint = 99n;
      let startIndex: int = 0;
      let endIndex: int = 0;
      let returnedView: BigUint64Array = zeroLengthView.fill(fillValue, startIndex, endIndex);
      expect(returnedView).assertEqual(zeroLengthView);
      expect(zeroLengthView.length).assertEqual(0);
      expect(zeroLengthView.byteOffset).assertEqual(16);
      expect(zeroLengthView.byteLength).assertEqual(0);
      expect(fullView[0]).assertEqual(10n);
      expect(fullView[1]).assertEqual(20n);
      expect(fullView[2]).assertEqual(30n);
      expect(fullView[3]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1590
     * @tc.name testBigUint64ArrayFill159
     * @tc.desc Verify fill(value: byte) with -1 writes wrapped MAX only inside [1,3)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 10n, 20n, 30n]);
      let byteFillValue: byte = -1;
      let startIndex: int = 1;
      let endIndex: int = 3;
      sourceArray.fill(byteFillValue, startIndex, endIndex);
      expect(sourceArray[0]).assertEqual(0n);
      expect(sourceArray[1]).assertEqual(18446744073709551615n);
      expect(sourceArray[2]).assertEqual(18446744073709551615n);
      expect(sourceArray[3]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1600
     * @tc.name testBigUint64ArrayFill160
     * @tc.desc Verify fill(value: short) with minimum short wraps by uint64 conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let shortFillValue: short = -32768;
      let startIndex: int = 0;
      let endIndex: int = 2;
      sourceArray.fill(shortFillValue, startIndex, endIndex);
      expect(sourceArray[0]).assertEqual(18446744073709518848n);
      expect(sourceArray[1]).assertEqual(18446744073709518848n);
      expect(sourceArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1610
     * @tc.name testBigUint64ArrayFill161
     * @tc.desc Verify fill(value: long) with -1 and negative start writes MAX to the last two elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 6n, 7n, 8n]);
      let longFillValue: long = -1;
      let startIndex: int = -2;
      sourceArray.fill(longFillValue, startIndex);
      expect(sourceArray[0]).assertEqual(5n);
      expect(sourceArray[1]).assertEqual(6n);
      expect(sourceArray[2]).assertEqual(18446744073709551615n);
      expect(sourceArray[3]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1620
     * @tc.name testBigUint64ArrayFill162
     * @tc.desc Verify fill(value: int) with hexadecimal int max writes 2147483647n to one element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n, 0n]);
      let hexadecimalMaxIntValue: int = 0x7FFFFFFF;
      let startIndex: int = 1;
      let endIndex: int = 2;
      sourceArray.fill(hexadecimalMaxIntValue, startIndex, endIndex);
      expect(sourceArray[0]).assertEqual(0n);
      expect(sourceArray[1]).assertEqual(2147483647n);
      expect(sourceArray[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1630
     * @tc.name testBigUint64ArrayFill163
     * @tc.desc Verify BigInt(binary number) value with negative start and end fills the normalized one-element window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let binarySourceValue: int = 0b11111111;
      let fillValue: bigint = BigInt(binarySourceValue);
      let startIndex: int = -2;
      let endIndex: int = -1;
      sourceArray.fill(fillValue, startIndex, endIndex);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(3n);
      expect(sourceArray[3]).assertEqual(255n);
      expect(sourceArray[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1640
     * @tc.name testBigUint64ArrayFill164
     * @tc.desc Verify BigInt(octal number) value with positive start and negative end fills the middle range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let octalSourceValue: int = 0o377;
      let fillValue: bigint = BigInt(octalSourceValue);
      let startIndex: int = 1;
      let endIndex: int = -1;
      sourceArray.fill(fillValue, startIndex, endIndex);
      expect(sourceArray[0]).assertEqual(10n);
      expect(sourceArray[1]).assertEqual(255n);
      expect(sourceArray[2]).assertEqual(255n);
      expect(sourceArray[3]).assertEqual(255n);
      expect(sourceArray[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1650
     * @tc.name testBigUint64ArrayFill165
     * @tc.desc Verify fill(value, undefined, -1) defaults start to 0 and normalizes end to length minus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let fillValue: bigint = 12n;
      let endIndex: int = -1;
      sourceArray.fill(fillValue, undefined, endIndex);
      expect(sourceArray[0]).assertEqual(12n);
      expect(sourceArray[1]).assertEqual(12n);
      expect(sourceArray[2]).assertEqual(12n);
      expect(sourceArray[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1660
     * @tc.name testBigUint64ArrayFill166
     * @tc.desc Verify fill(value, undefined, overlength end) defaults start and clamps end to length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let fillValue: bigint = 44n;
      let endIndex: int = 100;
      sourceArray.fill(fillValue, undefined, endIndex);
      expect(sourceArray[0]).assertEqual(44n);
      expect(sourceArray[1]).assertEqual(44n);
      expect(sourceArray[2]).assertEqual(44n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1670
     * @tc.name testBigUint64ArrayFill167
     * @tc.desc Verify fill(value, start: byte) accepts negative byte start and fills the last two elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let fillValue: bigint = 66n;
      let byteStartIndex: byte = -2;
      sourceArray.fill(fillValue, byteStartIndex);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(66n);
      expect(sourceArray[3]).assertEqual(66n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1680
     * @tc.name testBigUint64ArrayFill168
     * @tc.desc Verify fill(value, start, end: short) accepts negative short end and preserves the tail element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 6n, 7n, 8n]);
      let fillValue: bigint = 77n;
      let startIndex: int = 0;
      let shortEndIndex: short = -1;
      sourceArray.fill(fillValue, startIndex, shortEndIndex);
      expect(sourceArray[0]).assertEqual(77n);
      expect(sourceArray[1]).assertEqual(77n);
      expect(sourceArray[2]).assertEqual(77n);
      expect(sourceArray[3]).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1690
     * @tc.name testBigUint64ArrayFill169
     * @tc.desc Verify fill(value, start: short, end: byte) is no-op when the typed start is greater than typed end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([9n, 8n, 7n, 6n]);
      let fillValue: bigint = 55n;
      let shortStartIndex: short = 3;
      let byteEndIndex: byte = 1;
      let returnedArray: BigUint64Array = sourceArray.fill(fillValue, shortStartIndex, byteEndIndex);
      expect(returnedArray).assertEqual(sourceArray);
      expect(sourceArray[0]).assertEqual(9n);
      expect(sourceArray[1]).assertEqual(8n);
      expect(sourceArray[2]).assertEqual(7n);
      expect(sourceArray[3]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1700
     * @tc.name testBigUint64ArrayFill170
     * @tc.desc Verify byte source converted by toInt supplies start index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let byteStart: byte = 2;
      let startIndex: int = byteStart.toInt();
      sourceArray.fill(99n, startIndex);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(99n);
      expect(sourceArray[3]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1710
     * @tc.name testBigUint64ArrayFill171
     * @tc.desc Verify short source converted by toInt supplies negative end index -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let shortEnd: short = -1;
      let startIndex: int = 0;
      let endIndex: int = shortEnd.toInt();
      sourceArray.fill(88n, startIndex, endIndex);
      expect(sourceArray[0]).assertEqual(88n);
      expect(sourceArray[1]).assertEqual(88n);
      expect(sourceArray[2]).assertEqual(88n);
      expect(sourceArray[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1720
     * @tc.name testBigUint64ArrayFill172
     * @tc.desc Verify long source converted by toInt supplies negative start index -3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let longStart: long = -3;
      let startIndex: int = longStart.toInt();
      sourceArray.fill(77n, startIndex);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(77n);
      expect(sourceArray[3]).assertEqual(77n);
      expect(sourceArray[4]).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1730
     * @tc.name testBigUint64ArrayFill173
     * @tc.desc Verify fill truncates float start 1.9f to index 1 and overwrites the suffix with 66n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let floatStart: float = 1.9f;
      let startIndex: int = floatStart.toInt();
      sourceArray.fill(66n, startIndex);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(66n);
      expect(sourceArray[2]).assertEqual(66n);
      expect(sourceArray[3]).assertEqual(66n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1740
     * @tc.name testBigUint64ArrayFill174
     * @tc.desc Verify float source 3.9f converted by toInt supplies exclusive end index 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let floatEnd: float = 3.9f;
      let startIndex: int = 0;
      let endIndex: int = floatEnd.toInt();
      sourceArray.fill(55n, startIndex, endIndex);
      expect(sourceArray[0]).assertEqual(55n);
      expect(sourceArray[1]).assertEqual(55n);
      expect(sourceArray[2]).assertEqual(55n);
      expect(sourceArray[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1750
     * @tc.name testBigUint64ArrayFill175
     * @tc.desc Verify double source 2.9 converted by toInt supplies start index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let doubleStart: double = 2.9;
      let startIndex: int = doubleStart.toInt();
      sourceArray.fill(44n, startIndex);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(44n);
      expect(sourceArray[3]).assertEqual(44n);
      expect(sourceArray[4]).assertEqual(44n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1760
     * @tc.name testBigUint64ArrayFill176
     * @tc.desc Verify double source -1.9 converted by toInt supplies negative exclusive end index -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let doubleEnd: double = -1.9;
      let startIndex: int = 0;
      let endIndex: int = doubleEnd.toInt();
      sourceArray.fill(33n, startIndex, endIndex);
      expect(sourceArray[0]).assertEqual(33n);
      expect(sourceArray[1]).assertEqual(33n);
      expect(sourceArray[2]).assertEqual(33n);
      expect(sourceArray[3]).assertEqual(33n);
      expect(sourceArray[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1770
     * @tc.name testBigUint64ArrayFill177
     * @tc.desc Verify double source -2.9 converted by toInt supplies negative start index -2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let doubleStart: double = -2.9;
      let startIndex: int = doubleStart.toInt();
      sourceArray.fill(22n, startIndex);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(3n);
      expect(sourceArray[3]).assertEqual(22n);
      expect(sourceArray[4]).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1780
     * @tc.name testBigUint64ArrayFill178
     * @tc.desc Verify int minimum start and int maximum end combine to fill the complete array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let startIndex: int = -2147483648;
      let endIndex: int = 2147483647;
      sourceArray.fill(77n, startIndex, endIndex);
      expect(sourceArray[0]).assertEqual(77n);
      expect(sourceArray[1]).assertEqual(77n);
      expect(sourceArray[2]).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1790
     * @tc.name testBigUint64ArrayFill179
     * @tc.desc Verify int maximum start and int minimum end combine to a no-op returning this
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let startIndex: int = 2147483647;
      let endIndex: int = -2147483648;
      let returnedArray: BigUint64Array = sourceArray.fill(66n, startIndex, endIndex);
      expect(returnedArray).assertEqual(sourceArray);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1800
     * @tc.name testBigUint64ArrayFill180
     * @tc.desc Verify a later overlapping subarray fill overrides only its selected parent positions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let parentArray = new BigUint64Array(5);
      parentArray.fill(1n);
      let localView = parentArray.subarray(1, 4);
      localView.fill(2n, 1, 3);
      expect(parentArray[0]).assertEqual(1n);
      expect(parentArray[1]).assertEqual(1n);
      expect(parentArray[2]).assertEqual(2n);
      expect(parentArray[3]).assertEqual(2n);
      expect(parentArray[4]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILL_1810
     * @tc.name testBigUint64ArrayFill181
     * @tc.desc Verify sequential fills on touching half-open ranges do not overwrite each other
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFill181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n, 0n, 0n]);
      sourceArray.fill(3n, 0, 2);
      sourceArray.fill(4n, 2, 4);
      expect(sourceArray[0]).assertEqual(3n);
      expect(sourceArray[1]).assertEqual(3n);
      expect(sourceArray[2]).assertEqual(4n);
      expect(sourceArray[3]).assertEqual(4n);
    });
  });
}
