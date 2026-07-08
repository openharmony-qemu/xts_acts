'use static'

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

export default function BigInt64Array02Test(): void {
  describe('BigInt64Array02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0010
     * @tc.name testBigInt64ArrayTwo0010
     * @tc.desc Verify zero-length constructor result has object type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(0);
      expect(typeof arr).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0020
     * @tc.name testBigInt64ArrayTwo0020
     * @tc.desc Verify length constructor returns a BigInt64Array instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      expect(arr instanceof BigInt64Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0030
     * @tc.name testBigInt64ArrayTwo0030
     * @tc.desc Verify buffer and byteOffset constructor returns a BigInt64Array instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr = new BigInt64Array(buf, 8);
      expect(arr instanceof BigInt64Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0040
     * @tc.name testBigInt64ArrayTwo0040
     * @tc.desc Verify buffer, byteOffset, and length constructor returns a BigInt64Array instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let arr = new BigInt64Array(buf, 0, 3);
      expect(arr instanceof BigInt64Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0050
     * @tc.name testBigInt64ArrayTwo0050
     * @tc.desc Verify BigInt64Array.of without arguments returns a BigInt64Array instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of();
      expect(arr instanceof BigInt64Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0060
     * @tc.name testBigInt64ArrayTwo0060
     * @tc.desc Verify BigInt64Array.of with one argument returns object type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(7n);
      expect(typeof arr).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0070
     * @tc.name testBigInt64ArrayTwo0070
     * @tc.desc Verify BigInt64Array.of with multiple arguments returns the expected length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n, 2n, 3n, 4n);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0080
     * @tc.name testBigInt64ArrayTwo0080
     * @tc.desc Verify writing zero stores zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(2);
      arr[1] = 0n;
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0090
     * @tc.name testBigInt64ArrayTwo0090
     * @tc.desc Verify writing minus one stores minus one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = -1n;
      expect(arr[0]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0100
     * @tc.name testBigInt64ArrayTwo0100
     * @tc.desc Verify $_set writes zero and $_get reads it back.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(2);
      arr.$_set(0, 0n);
      expect(arr.$_get(0)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0110
     * @tc.name testBigInt64ArrayTwo0110
     * @tc.desc Verify $_set writes minus one and $_get reads it back.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(2);
      arr.$_set(1, -1n);
      expect(arr.$_get(1)).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0120
     * @tc.name testBigInt64ArrayTwo0120
     * @tc.desc Verify BigInt64Array.BYTES_PER_ELEMENT has number type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array()
      expect(typeof arr.BYTES_PER_ELEMENT).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0130
     * @tc.name testBigInt64ArrayTwo0130
     * @tc.desc Verify byteLength has number type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(4);
      expect(typeof arr.byteLength).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0140
     * @tc.name testBigInt64ArrayTwo0140
     * @tc.desc Verify byteOffset has number type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr = new BigInt64Array(buf, 8);
      expect(typeof arr.byteOffset).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0150
     * @tc.name testBigInt64ArrayTwo0150
     * @tc.desc Verify length has number type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      expect(typeof arr.length).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0160
     * @tc.name testBigInt64ArrayTwo0160
     * @tc.desc Verify buffer has object type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      expect(typeof arr.buffer).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0170
     * @tc.name testBigInt64ArrayTwo0170
     * @tc.desc Verify toString returns string type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      expect(typeof arr.toString()).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0180
     * @tc.name testBigInt64ArrayTwo0180
     * @tc.desc Verify join returns string type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 4n]);
      expect(typeof arr.join()).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0190
     * @tc.name testBigInt64ArrayTwo0190
     * @tc.desc Verify indexOf returns number type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      expect(typeof arr.indexOf(2n)).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0200
     * @tc.name testBigInt64ArrayTwo0200
     * @tc.desc Verify lastIndexOf returns number type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 1n]);
      expect(typeof arr.lastIndexOf(1n)).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0210
     * @tc.name testBigInt64ArrayTwo0210
     * @tc.desc Verify find returns bigint type when a matching value exists.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let result = arr.find((v) => v > 15n);
      expect(typeof result).assertEqual('bigint');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0220
     * @tc.name testBigInt64ArrayTwo0220
     * @tc.desc Verify findIndex returns number type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n]);
      expect(typeof arr.findIndex((v) => v > 8n)).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0230
     * @tc.name testBigInt64ArrayTwo0230
     * @tc.desc Verify entries returns object type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let iter = arr.entries();
      expect(typeof iter).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0240
     * @tc.name testBigInt64ArrayTwo0240
     * @tc.desc Verify keys returns object type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let iter = arr.keys();
      expect(typeof iter).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0250
     * @tc.name testBigInt64ArrayTwo0250
     * @tc.desc Verify values returns object type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n]);
      let iter = arr.values();
      expect(typeof iter).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0260
     * @tc.name testBigInt64ArrayTwo0260
     * @tc.desc Verify every returns boolean type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 4n]);
      expect(typeof arr.every((v) => v > 0n)).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0270
     * @tc.name testBigInt64ArrayTwo0270
     * @tc.desc Verify some returns boolean type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -1n]);
      expect(typeof arr.some((v) => v < 0n)).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0280
     * @tc.name testBigInt64ArrayTwo0280
     * @tc.desc Verify includes returns boolean type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      expect(typeof arr.includes(100n)).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0290
     * @tc.name testBigInt64ArrayTwo0290
     * @tc.desc Verify at returns bigint type for a valid index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9n, 18n]);
      let result = arr.at(0);
      expect(typeof result).assertEqual('bigint');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0300
     * @tc.name testBigInt64ArrayTwo0300
     * @tc.desc Verify length three produces byteLength twenty-four.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      expect(arr.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0310
     * @tc.name testBigInt64ArrayTwo0310
     * @tc.desc Verify byteOffset eight is reported as eight.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr = new BigInt64Array(buf, 8);
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0320
     * @tc.name testBigInt64ArrayTwo0320
     * @tc.desc Verify byteOffset zero is reported as zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new BigInt64Array(buf, 0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0330
     * @tc.name testBigInt64ArrayTwo0330
     * @tc.desc Verify indexOf returns the matching index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      expect(arr.indexOf(20n)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0340
     * @tc.name testBigInt64ArrayTwo0340
     * @tc.desc Verify indexOf returns minus one when no element matches.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      expect(arr.indexOf(99n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0350
     * @tc.name testBigInt64ArrayTwo0350
     * @tc.desc Verify lastIndexOf returns the last index of a repeated element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 1n, 3n]);
      expect(arr.lastIndexOf(1n)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0360
     * @tc.name testBigInt64ArrayTwo0360
     * @tc.desc Verify includes returns true for an existing element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n]);
      expect(arr.includes(10n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0370
     * @tc.name testBigInt64ArrayTwo0370
     * @tc.desc Verify includes returns false for a missing element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n]);
      expect(arr.includes(99n)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0380
     * @tc.name testBigInt64ArrayTwo0380
     * @tc.desc Verify every returns true when all elements match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 4n, 6n]);
      expect(arr.every((v) => v % 2n === 0n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0390
     * @tc.name testBigInt64ArrayTwo0390
     * @tc.desc Verify every returns false when any element fails.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 3n, 6n]);
      expect(arr.every((v) => v % 2n === 0n)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0400
     * @tc.name testBigInt64ArrayTwo0400
     * @tc.desc Verify some returns true when one element matches.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -5n, 3n]);
      expect(arr.some((v) => v < 0n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0410
     * @tc.name testBigInt64ArrayTwo0410
     * @tc.desc Verify some returns false when no element matches.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      expect(arr.some((v) => v > 100n)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0420
     * @tc.name testBigInt64ArrayTwo0420
     * @tc.desc Verify find returns the first matching element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 50n, 100n]);
      expect(arr.find((v) => v > 40n)).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0430
     * @tc.name testBigInt64ArrayTwo0430
     * @tc.desc Verify find returns undefined when no element matches.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let result = arr.find((v) => v > 100n);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0440
     * @tc.name testBigInt64ArrayTwo0440
     * @tc.desc Verify findIndex returns the first matching index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 20n]);
      expect(arr.findIndex((v) => v > 8n)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0450
     * @tc.name testBigInt64ArrayTwo0450
     * @tc.desc Verify findIndex returns minus one when no element matches.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      expect(arr.findIndex((v) => v > 100n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0460
     * @tc.name testBigInt64ArrayTwo0460
     * @tc.desc Verify at zero returns the first element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 14n, 21n]);
      expect(arr.at(0)).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0470
     * @tc.name testBigInt64ArrayTwo0470
     * @tc.desc Verify at negative one returns the last element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 14n, 21n]);
      expect(arr.at(-1)).assertEqual(21n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0480
     * @tc.name testBigInt64ArrayTwo0480
     * @tc.desc Verify at length returns undefined for an out-of-range index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let result = arr.at(3);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0490
     * @tc.name testBigInt64ArrayTwo0490
     * @tc.desc Verify toString returns a comma-separated string for multiple elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0500
     * @tc.name testBigInt64ArrayTwo0500
     * @tc.desc Verify join with a comma matches the toString result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([4n, 5n, 6n]);
      expect(arr.join(',')).assertEqual(arr.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0510
     * @tc.name testBigInt64ArrayTwo0510
     * @tc.desc Verify join uses the custom separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      expect(arr.join('|')).assertEqual('1|2|3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0520
     * @tc.name testBigInt64ArrayTwo0520
     * @tc.desc Verify join with an empty separator concatenates all values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      expect(arr.join('')).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0530
     * @tc.name testBigInt64ArrayTwo0530
     * @tc.desc Verify construction from FixedArray preserves the source length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<BigInt> = [1n, 2n, 3n, 4n, 5n];
      let arr = new BigInt64Array(src);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0540
     * @tc.name testBigInt64ArrayTwo0540
     * @tc.desc Verify slice returns the expected length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sliced = arr.slice(1, 3);
      expect(sliced.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0550
     * @tc.name testBigInt64ArrayTwo0550
     * @tc.desc Verify filter returns the expected length for partial matches.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let filtered = arr.filter((v) => v > 2n);
      expect(filtered.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0560
     * @tc.name testBigInt64ArrayTwo0560
     * @tc.desc Verify map returns the same length as the source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let mapped = arr.map((v) => v * 2n);
      expect(mapped.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0570
     * @tc.name testBigInt64ArrayTwo0570
     * @tc.desc Verify subarray returns the expected length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub = arr.subarray(1, 4);
      expect(sub.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0580
     * @tc.name testBigInt64ArrayTwo0580
     * @tc.desc Verify subarray of an empty range returns length zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(2, 2);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0590
     * @tc.name testBigInt64ArrayTwo0590
     * @tc.desc Verify slice returns the expected byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sliced = arr.slice(0, 2);
      expect(sliced.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0600
     * @tc.name testBigInt64ArrayTwo0600
     * @tc.desc Verify filter returns the expected byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let filtered = arr.filter((v) => v > 1n);
      expect(filtered.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0610
     * @tc.name testBigInt64ArrayTwo0610
     * @tc.desc Verify map returns the same byteLength as the source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let mapped = arr.map((v) => v + 1n);
      expect(mapped.byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0620
     * @tc.name testBigInt64ArrayTwo0620
     * @tc.desc Verify slice does not change original elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      arr.slice(1, 3);
      expect(arr[0]).assertEqual(1n);
      expect(arr[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0630
     * @tc.name testBigInt64ArrayTwo0630
     * @tc.desc Verify map does not change original elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.map((v) => v * 10n);
      expect(arr[0]).assertEqual(1n);
      expect(arr[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0640
     * @tc.name testBigInt64ArrayTwo0640
     * @tc.desc Verify filter does not change the original length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      arr.filter((v) => v > 2n);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0650
     * @tc.name testBigInt64ArrayTwo0650
     * @tc.desc Verify filter does not change original element values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      arr.filter((v) => v > 15n);
      expect(arr[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0660
     * @tc.name testBigInt64ArrayTwo0660
     * @tc.desc Verify find does not change original elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n]);
      arr.find((v) => v > 8n);
      expect(arr[0]).assertEqual(5n);
      expect(arr[2]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0670
     * @tc.name testBigInt64ArrayTwo0670
     * @tc.desc Verify indexOf does not change original elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.indexOf(2n);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0680
     * @tc.name testBigInt64ArrayTwo0680
     * @tc.desc Verify includes does not change the original array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.includes(1n);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0690
     * @tc.name testBigInt64ArrayTwo0690
     * @tc.desc Verify every does not change original elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 4n, 6n]);
      arr.every((v) => v > 0n);
      expect(arr[0]).assertEqual(2n);
      expect(arr[2]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0700
     * @tc.name testBigInt64ArrayTwo0700
     * @tc.desc Verify some does not change original elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -1n, 2n]);
      arr.some((v) => v < 0n);
      expect(arr[1]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0710
     * @tc.name testBigInt64ArrayTwo0710
     * @tc.desc Verify join does not change original elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.join(',');
      expect(arr[0]).assertEqual(1n);
      expect(arr[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0720
     * @tc.name testBigInt64ArrayTwo0720
     * @tc.desc Verify toString does not change the original length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 8n, 9n]);
      arr.toString();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0730
     * @tc.name testBigInt64ArrayTwo0730
     * @tc.desc Verify forEach without writes does not change original elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 6n, 9n]);
      arr.forEach((_v) => {});
      expect(arr[0]).assertEqual(3n);
      expect(arr[2]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0740
     * @tc.name testBigInt64ArrayTwo0740
     * @tc.desc Verify reduce does not change original elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.reduce((acc, v) => acc + v, 0n);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0750
     * @tc.name testBigInt64ArrayTwo0750
     * @tc.desc Verify at does not change original elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      arr.at(1);
      expect(arr[0]).assertEqual(10n);
      expect(arr[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0760
     * @tc.name testBigInt64ArrayTwo0760
     * @tc.desc Verify key iteration does not change the original array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      for (let _k of arr.keys()) {
        let currentKey = _k;
        expect(currentKey >= 0).assertTrue();
      }
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0770
     * @tc.name testBigInt64ArrayTwo0770
     * @tc.desc Verify value iteration does not change original elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([4n, 5n, 6n]);
      for (let _v of arr.values()) {
        let currentValue = _v;
        expect(typeof currentValue).assertEqual('bigint');
      }
      expect(arr[1]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0780
     * @tc.name testBigInt64ArrayTwo0780
     * @tc.desc Verify sort returns a BigInt64Array instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      let sorted = arr.sort();
      expect(sorted instanceof BigInt64Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0790
     * @tc.name testBigInt64ArrayTwo0790
     * @tc.desc Verify sort returns the same in-place array object.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      let sorted = arr.sort();
      expect(sorted.length).assertEqual(arr.length);
      expect(sorted[0]).assertEqual(arr[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0800
     * @tc.name testBigInt64ArrayTwo0800
     * @tc.desc Verify fill returns a BigInt64Array instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      let filled = arr.fill(5n);
      expect(filled instanceof BigInt64Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0810
     * @tc.name testBigInt64ArrayTwo0810
     * @tc.desc Verify fill returns an in-place view that shares the same buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      let filled = arr.fill(7n);
      expect(filled.buffer === arr.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0820
     * @tc.name testBigInt64ArrayTwo0820
     * @tc.desc Verify copyWithin returns a BigInt64Array instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let result = arr.copyWithin(0, 2);
      expect(result instanceof BigInt64Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0830
     * @tc.name testBigInt64ArrayTwo0830
     * @tc.desc Verify copyWithin returns an in-place view that shares the same buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let result = arr.copyWithin(1, 0);
      expect(result.buffer === arr.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0840
     * @tc.name testBigInt64ArrayTwo0840
     * @tc.desc Verify reverse returns a BigInt64Array instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let reversed = arr.reverse();
      expect(reversed instanceof BigInt64Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0850
     * @tc.name testBigInt64ArrayTwo0850
     * @tc.desc Verify reverse returns an in-place view that shares the same buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let reversed = arr.reverse();
      expect(reversed.buffer === arr.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0860
     * @tc.name testBigInt64ArrayTwo0860
     * @tc.desc Verify ArrayBuffer.isView returns true for BigInt64Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0870
     * @tc.name testBigInt64ArrayTwo0870
     * @tc.desc Verify ArrayBuffer.isView returns false for a plain array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let plain: Array<BigInt> = [1n, 2n];
      expect(ArrayBuffer.isView(plain)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0880
     * @tc.name testBigInt64ArrayTwo0880
     * @tc.desc Verify subarray shares the same buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(1, 3);
      expect(sub.buffer === arr.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0890
     * @tc.name testBigInt64ArrayTwo0890
     * @tc.desc Verify subarray byteOffset equals start times eight.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let sub = arr.subarray(2);
      expect(sub.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0900
     * @tc.name testBigInt64ArrayTwo0900
     * @tc.desc Verify writing through the original array updates the derived view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(0, 2);
      arr[0] = 55n;
      expect(sub[0]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0910
     * @tc.name testBigInt64ArrayTwo0910
     * @tc.desc Verify slice returns an independent copy without shared buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sliced = arr.slice();
      expect(sliced.buffer === arr.buffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0920
     * @tc.name testBigInt64ArrayTwo0920
     * @tc.desc Verify editing a slice copy does not affect the original array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sliced = arr.slice();
      sliced[0] = 999n;
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0930
     * @tc.name testBigInt64ArrayTwo0930
     * @tc.desc Verify a view created from ArrayBuffer keeps the original buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let arr = new BigInt64Array(buf);
      expect(arr.buffer === buf).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0940
     * @tc.name testBigInt64ArrayTwo0940
     * @tc.desc Verify writes are visible across views that share one ArrayBuffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view1 = new BigInt64Array(buf, 0, 1);
      let view2 = new BigInt64Array(buf, 0, 2);
      view1[0] = 42n;
      expect(view2[0]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0950
     * @tc.name testBigInt64ArrayTwo0950
     * @tc.desc Verify a full-range subarray keeps the original byteOffset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let arr = new BigInt64Array(buf, 0, 3);
      let sub = arr.subarray(0);
      expect(sub.byteOffset).assertEqual(arr.byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0960
     * @tc.name testBigInt64ArrayTwo0960
     * @tc.desc Verify BigInt64Array.from with FixedArray returns a BigInt64Array instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<BigInt> = [1n, 2n, 3n];
      let arr = BigInt64Array.from(src);
      expect(arr instanceof BigInt64Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0970
     * @tc.name testBigInt64ArrayTwo0970
     * @tc.desc Verify BigInt64Array.from with Array source and mapFn keeps the source length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<BigInt> = [1n, 2n, 3n];
      let arr = BigInt64Array.from(src, (v: BigInt): BigInt => v * 2n);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0980
     * @tc.name testBigInt64ArrayTwo0980
     * @tc.desc Verify BigInt64Array.from with Array source and mapFn returns expected elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<BigInt> = [1n, 2n, 3n];
      let arr = BigInt64Array.from(src, (v: BigInt): BigInt => v + 10n);
      expect(arr[0]).assertEqual(11n);
      expect(arr[2]).assertEqual(13n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_0990
     * @tc.name testBigInt64ArrayTwo0990
     * @tc.desc Verify BigInt64Array.from with Array returns expected values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo0990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<BigInt> = [5n, 10n, 15n];
      let arr = BigInt64Array.from(src);
      expect(arr[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1000
     * @tc.name testBigInt64ArrayTwo1000
     * @tc.desc Verify BigInt64Array.from with BigInt64Array returns an independent copy.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original = new BigInt64Array([1n, 2n, 3n]);
      let copy = BigInt64Array.from(original);
      copy[0] = 99n;
      expect(original[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1010
     * @tc.name testBigInt64ArrayTwo1010
     * @tc.desc Verify BigInt64Array.of without arguments reports length zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1020
     * @tc.name testBigInt64ArrayTwo1020
     * @tc.desc Verify BigInt64Array.of with maximum and minimum values stores both elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(9223372036854775807n, -9223372036854775808n);
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1030
     * @tc.name testBigInt64ArrayTwo1030
     * @tc.desc Verify misaligned byteOffset throws RangeError.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let errorName = '';
      try {
        new BigInt64Array(buf, 4);
      } catch (e) {
        errorName = e.name;
      }
      expect(errorName).assertEqual('RangeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1040
     * @tc.name testBigInt64ArrayTwo1040
     * @tc.desc Verify constructor throws RangeError when byteOffset exceeds the buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let errorName = '';
      try {
        new BigInt64Array(buf, 16);
      } catch (e) {
        errorName = e.name;
      }
      expect(errorName).assertEqual('RangeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1050
     * @tc.name testBigInt64ArrayTwo1050
     * @tc.desc Verify constructor throws RangeError for negative length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errorName = '';
      try {
        new BigInt64Array(-1);
      } catch (e) {
        errorName = e.name;
      }
      expect(errorName).assertEqual('RangeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1060
     * @tc.name testBigInt64ArrayTwo1060
     * @tc.desc Verify constructor throws RangeError for Infinity length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errorName = '';
      try {
        new BigInt64Array(Infinity);
      } catch (e) {
        errorName = e.name;
      }
      expect(errorName).assertEqual('RangeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1070
     * @tc.name testBigInt64ArrayTwo1070
     * @tc.desc Verify reduce throws TypeError on an empty array without initialValue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(0);
      let errorName = '';
      try {
        arr.reduce((acc, v) => acc + v);
      } catch (e) {
        errorName = e.name;
      }
      expect(errorName).assertEqual('TypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1080
     * @tc.name testBigInt64ArrayTwo1080
     * @tc.desc Verify reduceRight throws TypeError on an empty array without initialValue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(0);
      let errorName = '';
      try {
        arr.reduceRight((acc, v) => acc + v);
      } catch (e) {
        errorName = e.name;
      }
      expect(errorName).assertEqual('TypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1090
     * @tc.name testBigInt64ArrayTwo1090
     * @tc.desc Verify with throws RangeError for a positive out-of-range index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let errorName = '';
      try {
        arr.with(5, 99n);
      } catch (e) {
        errorName = e.name;
      }
      expect(errorName).assertEqual('RangeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1100
     * @tc.name testBigInt64ArrayTwo1100
     * @tc.desc Verify with throws RangeError for a negative out-of-range index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let errorName = '';
      try {
        arr.with(-10, 0n);
      } catch (e) {
        errorName = e.name;
      }
      expect(errorName).assertEqual('RangeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1110
     * @tc.name testBigInt64ArrayTwo1110
     * @tc.desc Verify set throws RangeError when the target range overflows.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(2);
      let src: FixedArray<BigInt> = [1n, 2n, 3n];
      let errorName = '';
      try {
        arr.set(src, 1);
      } catch (e) {
        errorName = e.name;
      }
      expect(errorName).assertEqual('RangeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1120
     * @tc.name testBigInt64ArrayTwo1120
     * @tc.desc Verify $_get throws RangeError for an out-of-range index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let errorName = '';
      try {
        arr.$_get(5);
      } catch (e) {
        errorName = e.name;
      }
      expect(errorName).assertEqual('RangeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1130
     * @tc.name testBigInt64ArrayTwo1130
     * @tc.desc Verify $_set throws RangeError for an out-of-range index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let errorName = '';
      try {
        arr.$_set(10, 99n);
      } catch (e) {
        errorName = e.name;
      }
      expect(errorName).assertEqual('RangeError');
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1140
     * @tc.name testBigInt64ArrayTwo1140
     * @tc.desc Verify sort propagates the callback error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      let errorMessage = '';
      try {
        arr.sort((_a, _b) => { throw new Error('sort error'); });
      } catch (e) {
        errorMessage = e.message;
      }
      expect(errorMessage).assertEqual('sort error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1150
     * @tc.name testBigInt64ArrayTwo1150
     * @tc.desc Verify map propagates the callback error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let errorMessage = '';
      try {
        arr.map((_v) => { throw new Error('map error'); });
      } catch (e) {
        errorMessage = e.message;
      }
      expect(errorMessage).assertEqual('map error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1160
     * @tc.name testBigInt64ArrayTwo1160
     * @tc.desc Verify forEach propagates the callback error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let errorMessage = '';
      try {
        arr.forEach((_v) => { throw new Error('forEach error'); });
      } catch (e) {
        errorMessage = e.message;
      }
      expect(errorMessage).assertEqual('forEach error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1170
     * @tc.name testBigInt64ArrayTwo1170
     * @tc.desc Verify filter propagates the callback error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let errorMessage = '';
      try {
        arr.filter((_v) => { throw new Error('filter error'); });
      } catch (e) {
        errorMessage = e.message;
      }
      expect(errorMessage).assertEqual('filter error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1180
     * @tc.name testBigInt64ArrayTwo1180
     * @tc.desc Verify reduce propagates the callback error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let errorMessage = '';
      try {
        arr.reduce((_acc: BigInt, _v: BigInt): BigInt => { throw new Error('reduce error'); }, 0n);
      } catch (e) {
        errorMessage = e.message;
      }
      expect(errorMessage).assertEqual('reduce error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1190
     * @tc.name testBigInt64ArrayTwo1190
     * @tc.desc Verify BigInt64Array.from propagates the mapFn error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<BigInt> = [1n, 2n, 3n];
      let errorMessage = '';
      try {
        BigInt64Array.from(src, (_v: BigInt): BigInt => { throw new Error('from error'); });
      } catch (e) {
        errorMessage = e.message;
      }
      expect(errorMessage).assertEqual('from error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1200
     * @tc.name testBigInt64ArrayTwo1200
     * @tc.desc Verify fill stores the maximum value in every element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      arr.fill(9223372036854775807n);
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[2]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1210
     * @tc.name testBigInt64ArrayTwo1210
     * @tc.desc Verify fill stores the minimum value in every element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      arr.fill(-9223372036854775808n);
      expect(arr[0]).assertEqual(-9223372036854775808n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1220
     * @tc.name testBigInt64ArrayTwo1220
     * @tc.desc Verify set stores the maximum value that $_get can read back.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(2);
      let src: FixedArray<BigInt> = [9223372036854775807n];
      arr.set(src, 0);
      expect(arr.$_get(0)).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1230
     * @tc.name testBigInt64ArrayTwo1230
     * @tc.desc Verify copyWithin silently clamps an out-of-range start index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.copyWithin(0, 100);
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1240
     * @tc.name testBigInt64ArrayTwo1240
     * @tc.desc Verify fill silently clamps an out-of-range start index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.fill(0n, 100);
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1250
     * @tc.name testBigInt64ArrayTwo1250
     * @tc.desc Verify slice silently clamps an out-of-range end index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sliced = arr.slice(1, 100);
      expect(sliced.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1260
     * @tc.name testBigInt64ArrayTwo1260
     * @tc.desc Verify subarray silently clamps an out-of-range begin index to an empty view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(100);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1270
     * @tc.name testBigInt64ArrayTwo1270
     * @tc.desc Verify fill treats an end before start as an empty clamped range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 5n, 5n]);
      arr.fill(0n, 2, 1);
      expect(arr[0]).assertEqual(5n);
      expect(arr[2]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1280
     * @tc.name testBigInt64ArrayTwo1280
     * @tc.desc Verify multiple views with different byteOffsets write independently on one buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let v1 = new BigInt64Array(buf, 0, 1);
      let v2 = new BigInt64Array(buf, 8, 1);
      v1[0] = 111n;
      v2[0] = 222n;
      expect(v1[0]).assertEqual(111n);
      expect(v2[0]).assertEqual(222n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1290
     * @tc.name testBigInt64ArrayTwo1290
     * @tc.desc Verify subarray writes update the corresponding source position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub = arr.subarray(2, 4);
      sub[0] = 88n;
      expect(arr[2]).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1300
     * @tc.name testBigInt64ArrayTwo1300
     * @tc.desc Verify nested subarray views share the same buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub1 = arr.subarray(1);
      let sub2 = sub1.subarray(1);
      expect(sub2.buffer === arr.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1310
     * @tc.name testBigInt64ArrayTwo1310
     * @tc.desc Verify nested subarray writes update the top-level array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub1 = arr.subarray(1);
      let sub2 = sub1.subarray(1);
      sub2[0] = 77n;
      expect(arr[2]).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1320
     * @tc.name testBigInt64ArrayTwo1320
     * @tc.desc Verify map returns a new array that does not share the original buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let mapped = arr.map((v) => v * 2n);
      expect(mapped.buffer === arr.buffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1330
     * @tc.name testBigInt64ArrayTwo1330
     * @tc.desc Verify filter returns a new array that does not share the original buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let filtered = arr.filter((v) => v > 2n);
      expect(filtered.buffer === arr.buffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1340
     * @tc.name testBigInt64ArrayTwo1340
     * @tc.desc Verify subarray byteOffset equals start times eight plus the original byteOffset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let arr = new BigInt64Array(buf, 8, 3);
      let sub = arr.subarray(1);
      expect(sub.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1350
     * @tc.name testBigInt64ArrayTwo1350
     * @tc.desc Verify original array and subarray can share a buffer with different byteLengths.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(0, 2);
      expect(arr.byteLength).assertEqual(32);
      expect(sub.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1360
     * @tc.name testBigInt64ArrayTwo1360
     * @tc.desc Verify with returns a new array without changing the original array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let newArr = arr.with(1, 99n);
      expect(arr[1]).assertEqual(2n);
      expect(newArr[1]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TWO_1370
     * @tc.name testBigInt64ArrayTwo1370
     * @tc.desc Verify with returns a BigInt64Array instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayTwo1370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let newArr = arr.with(0, 50n);
      expect(newArr instanceof BigInt64Array).assertTrue();
    });

  });
}
