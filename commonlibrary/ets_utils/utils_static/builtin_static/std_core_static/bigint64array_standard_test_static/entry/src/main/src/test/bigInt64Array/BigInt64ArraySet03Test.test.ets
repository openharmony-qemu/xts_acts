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
  afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level,
  Size, TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function BigInt64ArraySet0202Test(): void {
  describe('BigInt64ArraySet0202Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0010
     * @tc.name testBigInt64ArraySetThree0010
     * @tc.desc Verify set accepts an empty source at offset one hundred and keeps the tail element unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(100);
      let src = new BigInt64Array([]);
      target.set(src, 100);
      expect(target.length).assertEqual(100);
      expect(target[99]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0020
     * @tc.name testBigInt64ArraySetThree0020
     * @tc.desc Verify set writes the maximum signed sixty four bit bigint at offset zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src = new BigInt64Array([9223372036854775807n]);
      target.set(src, 0);
      expect(target[0]).assertEqual(9223372036854775807n);
      expect(target[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0030
     * @tc.name testBigInt64ArraySetThree0030
     * @tc.desc Verify set writes the minimum signed sixty four bit bigint at offset one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src = new BigInt64Array([-9223372036854775808n]);
      target.set(src, 1);
      expect(target[1]).assertEqual(-9223372036854775808n);
      expect(target[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0040
     * @tc.name testBigInt64ArraySetThree0040
     * @tc.desc Verify set handles a source that is the same view as the target.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      arr.set(arr, 0);
      expect(arr[0]).assertEqual(1n);
      expect(arr[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0050
     * @tc.name testBigInt64ArraySetThree0050
     * @tc.desc Verify set copies correctly when an overlapping view shifts data right by one element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let src = arr.subarray(0, 4);
      arr.set(src, 1);
      expect(arr[1]).assertEqual(1n);
      expect(arr[4]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0060
     * @tc.name testBigInt64ArraySetThree0060
     * @tc.desc Verify set copies correctly when an overlapping view shifts data right by two elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let src = arr.subarray(0, 3);
      arr.set(src, 2);
      expect(arr[2]).assertEqual(1n);
      expect(arr[4]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0070
     * @tc.name testBigInt64ArraySetThree0070
     * @tc.desc Verify set copies correctly when an overlapping view shifts data left by one element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let src = arr.subarray(1, 5);
      arr.set(src, 0);
      expect(arr[0]).assertEqual(2n);
      expect(arr[3]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0080
     * @tc.name testBigInt64ArraySetThree0080
     * @tc.desc Verify set copies correctly when an overlapping view shifts data left by two elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let src = arr.subarray(2, 5);
      arr.set(src, 0);
      expect(arr[0]).assertEqual(3n);
      expect(arr[2]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0090
     * @tc.name testBigInt64ArraySetThree0090
     * @tc.desc Verify set copies between overlapping subarrays from the same buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(80);
      let full = new BigInt64Array(buffer);
      full[0] = 1n;
      full[1] = 2n;
      full[2] = 3n;
      full[3] = 4n;
      let target = new BigInt64Array(buffer, 8, 4);
      let src = new BigInt64Array(buffer, 0, 4);
      target.set(src, 0);
      expect(target.length).assertEqual(4);
      expect(target[0]).assertEqual(1n);
      expect(target[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0100
     * @tc.name testBigInt64ArraySetThree0100
     * @tc.desc Verify set copies correctly for reverse overlap between views on one buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(80);
      let full = new BigInt64Array(buffer);
      full[1] = 7n;
      full[2] = 8n;
      full[3] = 9n;
      full[4] = 10n;
      full[5] = 11n;
      let target = new BigInt64Array(buffer, 0, 5);
      let src = new BigInt64Array(buffer, 8, 5);
      target.set(src, 0);
      expect(target.length).assertEqual(5);
      expect(target[0]).assertEqual(7n);
      expect(target[4]).assertEqual(11n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0110
     * @tc.name testBigInt64ArraySetThree0110
     * @tc.desc Verify set copies correctly between non overlapping views on the same buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(80);
      let full = new BigInt64Array(buffer);
      full[5] = 21n;
      full[6] = 22n;
      full[7] = 23n;
      full[8] = 24n;
      full[9] = 25n;
      let target = new BigInt64Array(buffer, 0, 5);
      let src = new BigInt64Array(buffer, 40, 5);
      target.set(src, 0);
      expect(target.length).assertEqual(5);
      expect(target[0]).assertEqual(21n);
      expect(target[4]).assertEqual(25n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0120
     * @tc.name testBigInt64ArraySetThree0120
     * @tc.desc Verify set updates a right shifted target subarray within one shared view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let target = arr.subarray(1, 4);
      let src = arr.subarray(0, 3);
      target.set(src, 0);
      expect(target[0]).assertEqual(10n);
      expect(arr[2]).assertEqual(20n);
      expect(arr[3]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0130
     * @tc.name testBigInt64ArraySetThree0130
     * @tc.desc Verify set updates a left shifted target subarray within one shared view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let target = arr.subarray(0, 3);
      let src = arr.subarray(2, 5);
      target.set(src, 0);
      expect(target[0]).assertEqual(30n);
      expect(arr[1]).assertEqual(40n);
      expect(arr[2]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0140
     * @tc.name testBigInt64ArraySetThree0140
     * @tc.desc Verify set throws or leaves the target unchanged when offset equals target length with one source item.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array([11n, 22n, 33n, 44n, 55n]);
      let src = new BigInt64Array([101n]);
      let caught: Error | undefined = undefined;
      try {
        target.set(src, 5);
      } catch (error) {
        caught = error;
      }
      expect(caught !== undefined || target[4] === 55n).assertTrue();
      expect(target[0]).assertEqual(11n);
      expect(target[4]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0150
     * @tc.name testBigInt64ArraySetThree0150
     * @tc.desc Verify set throws or leaves the target unchanged for offset six with an empty source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array([11n, 22n, 33n, 44n, 55n]);
      let src = new BigInt64Array(0);
      let caught: Error | undefined = undefined;
      try {
        target.set(src, 6);
      } catch (error) {
        caught = error;
      }
      expect(caught !== undefined || target[4] === 55n).assertTrue();
      expect(target[0]).assertEqual(11n);
      expect(target[4]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0160
     * @tc.name testBigInt64ArraySetThree0160
     * @tc.desc Verify set throws or leaves the target unchanged for offset six with one source item.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array([11n, 22n, 33n, 44n, 55n]);
      let src = new BigInt64Array([101n]);
      let caught: Error | undefined = undefined;
      try {
        target.set(src, 6);
      } catch (error) {
        caught = error;
      }
      expect(caught !== undefined || target[4] === 55n).assertTrue();
      expect(target[0]).assertEqual(11n);
      expect(target[4]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0170
     * @tc.name testBigInt64ArraySetThree0170
     * @tc.desc Verify set throws or leaves the target unchanged for negative offset minus one with one source item.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array([11n, 22n, 33n, 44n, 55n]);
      let src = new BigInt64Array([101n]);
      let caught: Error | undefined = undefined;
      try {
        target.set(src, -1);
      } catch (error) {
        caught = error;
      }
      expect(caught !== undefined || target[0] === 11n).assertTrue();
      expect(target[0]).assertEqual(11n);
      expect(target[4]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0180
     * @tc.name testBigInt64ArraySetThree0180
     * @tc.desc Verify set throws or leaves the target unchanged for negative offset minus ten with an empty source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array([11n, 22n, 33n, 44n, 55n]);
      let src = new BigInt64Array(0);
      let caught: Error | undefined = undefined;
      try {
        target.set(src, -10);
      } catch (error) {
        caught = error;
      }
      expect(caught !== undefined || target[0] === 11n).assertTrue();
      expect(target[0]).assertEqual(11n);
      expect(target[4]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0190
     * @tc.name testBigInt64ArraySetThree0190
     * @tc.desc Verify set throws or leaves a zero length target unchanged
     * when one source item is written at offset zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(0);
      let src = new BigInt64Array([101n]);
      let caught: Error | undefined = undefined;
      try {
        target.set(src, 0);
      } catch (error) {
        caught = error;
      }
      expect(caught !== undefined || target.length === 0).assertTrue();
      expect(target.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0200
     * @tc.name testBigInt64ArraySetThree0200
     * @tc.desc Verify set throws or leaves the last element unchanged for
     * target length one hundred and offset one hundred.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(100);
      target[99] = 999n;
      let src = new BigInt64Array([101n]);
      let caught: Error | undefined = undefined;
      try {
        target.set(src, 100);
      } catch (error) {
        caught = error;
      }
      expect(caught !== undefined || target[99] === 999n).assertTrue();
      expect(target.length).assertEqual(100);
      expect(target[99]).assertEqual(999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0210
     * @tc.name testBigInt64ArraySetThree0210
     * @tc.desc Verify set throws or leaves the target unchanged when two source items start at offset four.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array([11n, 22n, 33n, 44n, 55n]);
      let src = new BigInt64Array([101n, 202n]);
      let caught: Error | undefined = undefined;
      try {
        target.set(src, 4);
      } catch (error) {
        caught = error;
      }
      expect(caught !== undefined || target[4] === 55n).assertTrue();
      expect(target[3]).assertEqual(44n);
      expect(target[4]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0220
     * @tc.name testBigInt64ArraySetThree0220
     * @tc.desc Verify set throws or leaves the target unchanged when two source items start at offset five.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array([11n, 22n, 33n, 44n, 55n]);
      let src = new BigInt64Array([101n, 202n]);
      let caught: Error | undefined = undefined;
      try {
        target.set(src, 5);
      } catch (error) {
        caught = error;
      }
      expect(caught !== undefined || target[4] === 55n).assertTrue();
      expect(target[0]).assertEqual(11n);
      expect(target[4]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0230
     * @tc.name testBigInt64ArraySetThree0230
     * @tc.desc Verify set throws or leaves a two element target unchanged when the source has three items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array([11n, 22n]);
      let src = new BigInt64Array([101n, 202n, 303n]);
      let caught: Error | undefined = undefined;
      try {
        target.set(src, 0);
      } catch (error) {
        caught = error;
      }
      expect(caught !== undefined || target[1] === 22n).assertTrue();
      expect(target[0]).assertEqual(11n);
      expect(target[1]).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0240
     * @tc.name testBigInt64ArraySetThree0240
     * @tc.desc Verify set throws or leaves a two element target unchanged for offset one with two source items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array([11n, 22n]);
      let src = new BigInt64Array([101n, 202n]);
      let caught: Error | undefined = undefined;
      try {
        target.set(src, 1);
      } catch (error) {
        caught = error;
      }
      expect(caught !== undefined || target[1] === 22n).assertTrue();
      expect(target[0]).assertEqual(11n);
      expect(target[1]).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0250
     * @tc.name testBigInt64ArraySetThree0250
     * @tc.desc Verify set throws or leaves a two element target unchanged for offset two with one source item.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array([11n, 22n]);
      let src = new BigInt64Array([101n]);
      let caught: Error | undefined = undefined;
      try {
        target.set(src, 2);
      } catch (error) {
        caught = error;
      }
      expect(caught !== undefined || target[1] === 22n).assertTrue();
      expect(target[0]).assertEqual(11n);
      expect(target[1]).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0260
     * @tc.name testBigInt64ArraySetThree0260
     * @tc.desc Verify set throws or leaves the target unchanged for a very large positive offset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array([11n, 22n, 33n, 44n, 55n]);
      let src = new BigInt64Array([101n]);
      let caught: Error | undefined = undefined;
      try {
        target.set(src, 2147483647);
      } catch (error) {
        caught = error;
      }
      expect(caught !== undefined || target[4] === 55n).assertTrue();
      expect(target[0]).assertEqual(11n);
      expect(target[4]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0270
     * @tc.name testBigInt64ArraySetThree0270
     * @tc.desc Verify set throws or leaves the target unchanged for a very large negative offset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array([11n, 22n, 33n, 44n, 55n]);
      let src = new BigInt64Array([101n]);
      let caught: Error | undefined = undefined;
      try {
        target.set(src, -2147483648);
      } catch (error) {
        caught = error;
      }
      expect(caught !== undefined || target[0] === 11n).assertTrue();
      expect(target[0]).assertEqual(11n);
      expect(target[4]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0280
     * @tc.name testBigInt64ArraySetThree0280
     * @tc.desc Verify set throws or leaves a two element target unchanged for offset minus one with an empty source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array([11n, 22n]);
      let src = new BigInt64Array(0);
      let caught: Error | undefined = undefined;
      try {
        target.set(src, -1);
      } catch (error) {
        caught = error;
      }
      expect(caught !== undefined || target[0] === 11n).assertTrue();
      expect(target[0]).assertEqual(11n);
      expect(target[1]).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0290
     * @tc.name testBigInt64ArraySetThree0290
     * @tc.desc Verify set returns undefined after a successful copy into a non empty target.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array([0n, 0n, 0n, 0n, 0n]);
      let src = new BigInt64Array([10n, 20n, 30n]);
      let result = target.set(src, 1);
      expect(result).assertEqual(undefined);
      expect(target[1]).assertEqual(10n);
      expect(target[3]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0300
     * @tc.name testBigInt64ArraySetThree0300
     * @tc.desc Verify triple alias shared buffer with three views on the same buffer after set through view1 the other two views share the same underlying storage.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let view1 = new BigInt64Array(buffer, 0, 3);
      let view2 = new BigInt64Array(buffer, 0, 2);
      let view3 = new BigInt64Array(buffer, 0, 1);
      view1[0] = 100n;
      view1[1] = 200n;
      view1[2] = 300n;
      let src = new BigInt64Array([777n, 888n, 999n]);
      view1.set(src, 0);
      expect(view2[0]).assertEqual(777n);
      expect(view2[1]).assertEqual(888n);
      expect(view3[0]).assertEqual(777n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0310
     * @tc.name testBigInt64ArraySetThree0310
     * @tc.desc Verify overlap right shift by one with MAX and MIN boundary values preserved in the copy.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxVal = 9223372036854775807n;
      let minVal = -9223372036854775808n;
      let arr = new BigInt64Array([maxVal, minVal, 0n, 0n, 0n]);
      let src = arr.subarray(0, 2);
      arr.set(src, 1);
      expect(arr[1]).assertEqual(maxVal);
      expect(arr[2]).assertEqual(minVal);
      expect(arr[0]).assertEqual(maxVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0320
     * @tc.name testBigInt64ArraySetThree0320
     * @tc.desc Verify subarray chain set where target is a subarray of a subarray and source is the root view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 60n, 70n, 80n]);
      let inner = root.subarray(1, 7);
      let target = inner.subarray(1, 4);
      let src = root.subarray(3, 6);
      target.set(src, 0);
      expect(root[2]).assertEqual(40n);
      expect(root[3]).assertEqual(50n);
      expect(root[4]).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0330
     * @tc.name testBigInt64ArraySetThree0330
     * @tc.desc Verify Uint8Array byte level verification after set on a shared buffer ensures correct byte layout.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let bigView = new BigInt64Array(buffer);
      let bytes = new Uint8Array(buffer);
      let src = new BigInt64Array([72_623_859_790_382_856n]);
      bigView.set(src, 0);
      expect(bytes[0]).assertEqual(0x08);
      expect(bytes[7]).assertEqual(0x01);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0340
     * @tc.name testBigInt64ArraySetThree0340
     * @tc.desc Verify overlap with single element subview where source and target share the same element in a buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let full = new BigInt64Array(buffer);
      full[0] = 42n;
      full[1] = 84n;
      let target = new BigInt64Array(buffer, 0, 1);
      let src = new BigInt64Array(buffer, 8, 1);
      target.set(src, 0);
      expect(full[0]).assertEqual(84n);
      expect(full[1]).assertEqual(84n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0350
     * @tc.name testBigInt64ArraySetThree0350
     * @tc.desc Verify overlap left shift by three elements copying from a subarray that starts at offset three.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n]);
      let src = arr.subarray(3, 8);
      arr.set(src, 0);
      expect(arr[0]).assertEqual(4n);
      expect(arr[4]).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0360
     * @tc.name testBigInt64ArraySetThree0360
     * @tc.desc Verify self set with offset one where source equals target and elements are shifted correctly without corruption.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      arr.set(arr, 1);
      expect(arr[1]).assertEqual(1n);
      expect(arr[2]).assertEqual(2n);
      expect(arr[3]).assertEqual(3n);
      expect(arr[4]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0370
     * @tc.name testBigInt64ArraySetThree0370
     * @tc.desc Verify set with offset exactly at target byteLength divided by BYTES_PER_ELEMENT is a boundary that throws or keeps target unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array([10n, 20n, 30n]);
      let src = new BigInt64Array([99n]);
      let caught: Error | undefined = undefined;
      let arr = new BigInt64Array()
      try {
        target.set(src, target.byteLength / arr.BYTES_PER_ELEMENT);
      } catch (error) {
        caught = error;
      }
      expect(caught !== undefined || target[2] === 30n).assertTrue();
      expect(target[0]).assertEqual(10n);
      expect(target[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0380
     * @tc.name testBigInt64ArraySetThree0380
     * @tc.desc Verify two non overlapping subviews on the same buffer perform independent set operations in isolation from each other.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(32);
      let subview1 = new BigInt64Array(buffer, 0, 2);
      let subview2 = new BigInt64Array(buffer, 16, 2);
      let src1 = new BigInt64Array([11n, 22n]);
      let src2 = new BigInt64Array([33n, 44n]);
      subview1.set(src1, 0);
      subview2.set(src2, 0);
      let full = new BigInt64Array(buffer);
      expect(full[0]).assertEqual(11n);
      expect(full[1]).assertEqual(22n);
      expect(full[2]).assertEqual(33n);
      expect(full[3]).assertEqual(44n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0390
     * @tc.name testBigInt64ArraySetThree0390
     * @tc.desc Verify overlap right shift by one with negative values preserves the correct negative bigint copy order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, -2n, -3n, -4n, -5n]);
      let src = arr.subarray(0, 4);
      arr.set(src, 1);
      expect(arr[1]).assertEqual(-1n);
      expect(arr[4]).assertEqual(-4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_TWO_0400
     * @tc.name testBigInt64ArraySetThree0400
     * @tc.desc Verify set on a view with non zero byteOffset at offset zero copies data relative to the view start position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetThree0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(40);
      let full = new BigInt64Array(buffer);
      full[0] = 99n;
      full[1] = 88n;
      full[2] = 77n;
      full[3] = 66n;
      full[4] = 55n;
      let target = new BigInt64Array(buffer, 8, 3);
      let src = new BigInt64Array([1n, 2n, 3n]);
      target.set(src, 0);
      expect(target[0]).assertEqual(1n);
      expect(target[2]).assertEqual(3n);
      expect(full[0]).assertEqual(99n);
      expect(full[4]).assertEqual(55n);
    });
  });
}
