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
import Utils from '../Util.test';

export default function BigInt64ArrayToStringTest(): void {
  describe('BigInt64ArrayToStringTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_0100
     * @tc.name testBigInt64ArrayToString001
     * @tc.desc Verify toString on an empty BigInt64Array from an empty initializer list returns an empty string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      expect(arr.toString()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_0200
     * @tc.name testBigInt64ArrayToString002
     * @tc.desc Verify toString on a zero-length fixed-size BigInt64Array returns an empty string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(0);
      let str = arr.toString();
      expect(str).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_0300
     * @tc.name testBigInt64ArrayToString003
     * @tc.desc Verify toString on a length-1 default-initialized BigInt64Array returns the string "0".
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      expect(arr.toString()).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_0400
     * @tc.name testBigInt64ArrayToString004
     * @tc.desc Verify toString on a length-5 default-initialized BigInt64Array returns five zeros separated by commas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      expect(arr.toString()).assertEqual("0,0,0,0,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_0500
     * @tc.name testBigInt64ArrayToString005
     * @tc.desc Verify toString on a single positive one element returns "1".
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      expect(arr.toString()).assertEqual("1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_0600
     * @tc.name testBigInt64ArrayToString006
     * @tc.desc Verify toString on a single negative one element returns "-1".
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n]);
      expect(arr.toString()).assertEqual("-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_0700
     * @tc.name testBigInt64ArrayToString007
     * @tc.desc Verify toString on a single negative zero element returns "0" (negative zero normalized).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-0n]);
      expect(arr.toString()).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_0800
     * @tc.name testBigInt64ArrayToString008
     * @tc.desc Verify toString on a single arbitrary large value returns the correct decimal string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([123456789n]);
      expect(arr.toString()).assertEqual("123456789");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_0900
     * @tc.name testBigInt64ArrayToString009
     * @tc.desc Verify toString on a single BigInt64 MAX element returns the correct decimal string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      expect(arr.toString()).assertEqual("9223372036854775807");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_1000
     * @tc.name testBigInt64ArrayToString010
     * @tc.desc Verify toString on a single BigInt64 MIN element returns the correct decimal string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n]);
      expect(arr.toString()).assertEqual("-9223372036854775808");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_1100
     * @tc.name testBigInt64ArrayToString011
     * @tc.desc Verify toString on BigInt64 MAX minus one returns the correct decimal string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775806n]);
      expect(arr.toString()).assertEqual("9223372036854775806");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_1200
     * @tc.name testBigInt64ArrayToString012
     * @tc.desc Verify toString on BigInt64 MIN plus one returns the correct decimal string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n]);
      expect(arr.toString()).assertEqual("-9223372036854775807");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_1300
     * @tc.name testBigInt64ArrayToString013
     * @tc.desc Verify toString on Number.MAX_SAFE_INTEGER as a BigInt returns the correct string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9007199254740991n]);
      expect(arr.toString()).assertEqual("9007199254740991");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_1400
     * @tc.name testBigInt64ArrayToString014
     * @tc.desc Verify toString on an array with MAX, MIN, and zero in sequence produces the correct joined output.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, -9223372036854775808n, 0n]);
      expect(arr.toString()).assertEqual("9223372036854775807,-9223372036854775808,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_1500
     * @tc.name testBigInt64ArrayToString015
     * @tc.desc Verify toString reflects wraparound when MAX+1 is stored as BigInt64 MIN.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxVal: bigint = 9223372036854775807n;
      let val = maxVal + 1n;
      let arr = new BigInt64Array([val]);
      expect(arr.toString()).assertEqual("-9223372036854775808");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_1600
     * @tc.name testBigInt64ArrayToString016
     * @tc.desc Verify toString reflects wraparound when MAX+2 is stored.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxVal: bigint = 9223372036854775807n;
      let val = maxVal + 2n;
      let arr = new BigInt64Array([val]);
      expect(arr.toString()).assertEqual("-9223372036854775807");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_1700
     * @tc.name testBigInt64ArrayToString017
     * @tc.desc Verify toString reflects wraparound when MIN-1 is stored as BigInt64 MAX.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minVal: bigint = -9223372036854775808n;
      let val = minVal - 1n;
      let arr = new BigInt64Array([val]);
      expect(arr.toString()).assertEqual("9223372036854775807");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_1800
     * @tc.name testBigInt64ArrayToString018
     * @tc.desc Verify toString reflects overflow when assigning an overflow-wrapped value to an existing element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let maxVal: bigint = 9223372036854775807n;
      arr[0] = maxVal + 1n;
      expect(arr.toString()).assertEqual("-9223372036854775808,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_1900
     * @tc.name testBigInt64ArrayToString019
     * @tc.desc Verify toString joins two positive elements with a comma separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      expect(arr.toString()).assertEqual("1,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_2000
     * @tc.name testBigInt64ArrayToString020
     * @tc.desc Verify toString joins two negative elements with a comma separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, -2n]);
      expect(arr.toString()).assertEqual("-1,-2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_2100
     * @tc.name testBigInt64ArrayToString021
     * @tc.desc Verify toString joins mixed-sign elements in insertion order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -1n]);
      expect(arr.toString()).assertEqual("1,-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_2200
     * @tc.name testBigInt64ArrayToString022
     * @tc.desc Verify toString joins two zero elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n]);
      expect(arr.toString()).assertEqual("0,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_2300
     * @tc.name testBigInt64ArrayToString023
     * @tc.desc Verify toString joins three sequential positive elements in insertion order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      expect(arr.toString()).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_2400
     * @tc.name testBigInt64ArrayToString024
     * @tc.desc Verify toString joins five elements with mixed values in insertion order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, -1n, 2n, -2n]);
      expect(arr.toString()).assertEqual("0,1,-1,2,-2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_2500
     * @tc.name testBigInt64ArrayToString025
     * @tc.desc Verify toString on a BigInt64Array created via BigInt64Array.of returns the correct joined string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(9n, 8n, 7n);
      expect(arr.toString()).assertEqual("9,8,7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_2600
     * @tc.name testBigInt64ArrayToString026
     * @tc.desc Verify toString on a BigInt64Array created via BigInt64Array.from returns the correct joined string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.from([1n, 2n, 3n]);
      expect(arr.toString()).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_2700
     * @tc.name testBigInt64ArrayToString027
     * @tc.desc Verify toString on a BigInt64Array created via BigInt64Array.from with a mapping function returns mapped values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.from([1n, 2n, 3n], (x: bigint) => x * 2n);
      expect(arr.toString()).assertEqual("2,4,6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_2800
     * @tc.name testBigInt64ArrayToString028
     * @tc.desc Verify toString on a BigInt64Array constructed by passing another BigInt64Array to the constructor returns the same string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([10n, 20n, 30n]);
      let arr = new BigInt64Array(src);
      expect(arr.toString()).assertEqual("10,20,30");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_2900
     * @tc.name testBigInt64ArrayToString029
     * @tc.desc Verify toString on a BigInt64Array created from an ArrayBuffer with values set via DataView.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let dv = new DataView(buf);
      dv.setBigInt64(0, 10n, true);
      dv.setBigInt64(8, 20n, true);
      dv.setBigInt64(16, 30n, true);
      let arr = new BigInt64Array(buf);
      expect(arr.toString()).assertEqual("10,20,30");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_3000
     * @tc.name testBigInt64ArrayToString030
     * @tc.desc Verify toString on a BigInt64Array constructed from an ArrayBuffer at a byteOffset returns the correct subset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let full = new BigInt64Array(buf);
      full[0] = 100n;
      full[1] = 200n;
      full[2] = 300n;
      full[3] = 400n;
      let arr = new BigInt64Array(buf, 8, 2);
      expect(arr.toString()).assertEqual("200,300");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_3100
     * @tc.name testBigInt64ArrayToString031
     * @tc.desc Verify toString on a BigInt64Array from an ArrayBuffer without explicit length uses remaining buffer capacity.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let full = new BigInt64Array(buf);
      full[0] = 55n;
      full[1] = 66n;
      let arr = new BigInt64Array(buf);
      expect(arr.toString()).assertEqual("55,66");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_3200
     * @tc.name testBigInt64ArrayToString032
     * @tc.desc Verify toString reflects mutation of the first element via direct assignment.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr[0] = 99n;
      expect(arr.toString()).assertEqual("99,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_3300
     * @tc.name testBigInt64ArrayToString033
     * @tc.desc Verify toString reflects mutation of the last element via direct assignment.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr[2] = 88n;
      expect(arr.toString()).assertEqual("1,2,88");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_3400
     * @tc.name testBigInt64ArrayToString034
     * @tc.desc Verify out-of-bounds write throws RangeError on a two-element BigInt64Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      try {
        arr[2] = 99n;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_3500
     * @tc.name testBigInt64ArrayToString035
     * @tc.desc Verify toString after swapping two elements by direct assignment reflects the new order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([111n, 222n]);
      let tmp = arr[0];
      arr[0] = arr[1];
      arr[1] = tmp;
      expect(arr.toString()).assertEqual("222,111");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_3600
     * @tc.name testBigInt64ArrayToString036
     * @tc.desc Verify toString reflects setting an element to a negative overflow-wrapped value (MIN-1n wraps to MAX).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let minVal: bigint = -9223372036854775808n;
      arr[1] = minVal - 1n;
      expect(arr.toString()).assertEqual("1,9223372036854775807,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_3700
     * @tc.name testBigInt64ArrayToString037
     * @tc.desc Verify toString reflects the reversed element order after calling reverse.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.reverse();
      expect(arr.toString()).assertEqual("3,2,1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_3800
     * @tc.name testBigInt64ArrayToString038
     * @tc.desc Verify toString reflects ascending sorted order after calling sort.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      arr.sort();
      expect(arr.toString()).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_3900
     * @tc.name testBigInt64ArrayToString039
     * @tc.desc Verify toString reflects the values after filling the entire array with a single value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.fill(9n);
      expect(arr.toString()).assertEqual("9,9,9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_4000
     * @tc.name testBigInt64ArrayToString040
     * @tc.desc Verify toString reflects the values after fill with a start and end index range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      arr.fill(9n, 1, 3);
      expect(arr.toString()).assertEqual("1,9,9,4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_4100
     * @tc.name testBigInt64ArrayToString041
     * @tc.desc Verify toString reflects the values after copyWithin mutation with source and target offsets.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      arr.copyWithin(0, 2);
      expect(arr.toString()).assertEqual("3,4,3,4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_4200
     * @tc.name testBigInt64ArrayToString042
     * @tc.desc Verify calling toString does not mutate the original array elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      arr.toString();
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_4300
     * @tc.name testBigInt64ArrayToString043
     * @tc.desc Verify three consecutive toString calls on an unmodified array return the same content.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 14n, 21n]);
      let s1 = arr.toString();
      let s2 = arr.toString();
      let s3 = arr.toString();
      expect(s1).assertEqual(s2);
      expect(s2).assertEqual(s3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_4400
     * @tc.name testBigInt64ArrayToString044
     * @tc.desc Verify toString on a subarray view returns only the elements in the viewed range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let sub = arr.subarray(1, 3);
      expect(sub.toString()).assertEqual("20,30");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_4500
     * @tc.name testBigInt64ArrayToString045
     * @tc.desc Verify toString on a sliced copy returns the elements in the sliced range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let sl = arr.slice(2, 4);
      expect(sl.toString()).assertEqual("30,40");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_4600
     * @tc.name testBigInt64ArrayToString046
     * @tc.desc Verify toString reflects buffer-level modifications made through a Uint8Array view of the same buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new BigInt64Array(buf);
      arr[0] = 1n;
      let u8 = new Uint8Array(buf);
      u8[0] = 2;
      expect(arr.toString()).assertEqual("2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_4700
     * @tc.name testBigInt64ArrayToString047
     * @tc.desc Verify toString reflects buffer-level modifications made through an Int8Array view of the same buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new BigInt64Array(buf);
      arr[0] = 0n;
      let i8 = new Int8Array(buf);
      i8[0] = 1;
      expect(arr.toString()).assertEqual("1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_4800
     * @tc.name testBigInt64ArrayToString048
     * @tc.desc Verify toString on a subarray reflects mutations made to the parent array via the shared buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = parent.subarray(1, 3);
      parent[1] = 99n;
      expect(sub.toString()).assertEqual("99,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_4900
     * @tc.name testBigInt64ArrayToString049
     * @tc.desc Verify toString on a subarray reflects buffer-level modification through a Uint8Array view of the shared buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let parent = new BigInt64Array(buf);
      parent[0] = 100n;
      parent[1] = 200n;
      parent[2] = 300n;
      let sub = parent.subarray(0, 2);
      let u8 = new Uint8Array(buf);
      u8[0] = 1;
      expect(sub.toString()).assertEqual("1,200");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_5000
     * @tc.name testBigInt64ArrayToString050
     * @tc.desc Verify toString on a 100-element array filled with a negative value produces the correct joined output.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      arr.fill(-1n);
      let expectedArr: string[] = [];
      for (let i = 0; i < 100; i++) {
        expectedArr.push("-1");
      }
      expect(arr.toString()).assertEqual(expectedArr.join(","));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_5100
     * @tc.name testBigInt64ArrayToString051
     * @tc.desc Verify toString on an array where every element is BigInt64 MAX produces correct repeated output.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 9223372036854775807n]);
      expect(arr.toString()).assertEqual("9223372036854775807,9223372036854775807");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_5200
     * @tc.name testBigInt64ArrayToString052
     * @tc.desc Verify toString on an array where every element is BigInt64 MIN produces correct repeated output.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n, -9223372036854775808n]);
      expect(arr.toString()).assertEqual("-9223372036854775808,-9223372036854775808");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_5300
     * @tc.name testBigInt64ArrayToString053
     * @tc.desc Verify toString on the result of with returns the modified element values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let modified = arr.with(0, 99n);
      expect(modified.toString()).assertEqual("99,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_5400
     * @tc.name testBigInt64ArrayToString054
     * @tc.desc Verify toString on the result of toSorted returns the sorted element values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      let sorted = arr.toSorted();
      expect(sorted.toString()).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_5500
     * @tc.name testBigInt64ArrayToString055
     * @tc.desc Verify toString on the result of toReversed returns the reversed element values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let rev = arr.toReversed();
      expect(rev.toString()).assertEqual("3,2,1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_5600
     * @tc.name testBigInt64ArrayToString056
     * @tc.desc Verify toString on the original array is unchanged after calling with (non-mutation).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let modified = arr.with(1, 99n);
      expect(arr.toString()).assertEqual("10,20,30");
      expect(modified.toString()).assertEqual("10,99,30");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_5700
     * @tc.name testBigInt64ArrayToString057
     * @tc.desc Verify toString after chaining toSorted then toReversed on the result produces reverse-sorted order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 4n, 2n]);
      let sorted = arr.toSorted();
      let revSorted = sorted.toReversed();
      expect(revSorted.toString()).assertEqual("4,3,2,1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_5800
     * @tc.name testBigInt64ArrayToString058
     * @tc.desc Verify toString on an array where each element equals its index produces the expected decimal sequence.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      for (let i = 0; i < 5; i++) {
        arr[i] = BigInt(i);
      }
      expect(arr.toString()).assertEqual("0,1,2,3,4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_5900
     * @tc.name testBigInt64ArrayToString059
     * @tc.desc Verify toString on an array of sequential powers of two produces the correct joined output.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 4n, 8n, 16n]);
      expect(arr.toString()).assertEqual("1,2,4,8,16");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_6000
     * @tc.name testBigInt64ArrayToString060
     * @tc.desc Verify toString on an array with values at important bit-pattern boundaries (8-bit, 16-bit edges).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([255n, 256n, 65535n, 65536n]);
      expect(arr.toString()).assertEqual("255,256,65535,65536");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_6100
     * @tc.name testBigInt64ArrayToString061
     * @tc.desc Verify toString on an array with alternating-sign values ordered by increasing magnitude produces correct output.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -2n, 3n, -4n, 5n]);
      expect(arr.toString()).assertEqual("1,-2,3,-4,5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_6200
     * @tc.name testBigInt64ArrayToString062
     * @tc.desc Verify toString on an array of descending negative values produces correct order-preserving output.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, -10n, -100n, -1000n]);
      expect(arr.toString()).assertEqual("-1,-10,-100,-1000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_6300
     * @tc.name testBigInt64ArrayToString063
     * @tc.desc Verify toString on an array of mixed positive and negative numbers in arbitrary order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, -2n, 1n, 0n, -1n, 2n, -3n]);
      expect(arr.toString()).assertEqual("3,-2,1,0,-1,2,-3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_6400
     * @tc.name testBigInt64ArrayToString064
     * @tc.desc Verify toString after sort on mixed positive, negative and zero values produces the expected ascending order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, -5n, 5n, -1n, 1n]);
      arr.sort();
      expect(arr.toString()).assertEqual("-5,-1,0,1,5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_6500
     * @tc.name testBigInt64ArrayToString065
     * @tc.desc Verify toString after copyWithin with an explicit end index preserves elements outside the target range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      arr.copyWithin(0, 2, 4);
      expect(arr.toString()).assertEqual("3,4,3,4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_6600
     * @tc.name testBigInt64ArrayToString066
     * @tc.desc Verify toString after calling set to overwrite elements at the start of the array reflects the new values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.set([9n, 8n]);
      expect(arr.toString()).assertEqual("9,8,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_6700
     * @tc.name testBigInt64ArrayToString067
     * @tc.desc Verify toString after modifying values via DataView on the same buffer reflects the updated values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr = new BigInt64Array(buf);
      arr[0] = 1n;
      arr[1] = 2n;
      let dv = new DataView(buf);
      dv.setBigInt64(0, 100n, true);
      dv.setBigInt64(8, 200n, true);
      expect(arr.toString()).assertEqual("100,200");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_6800
     * @tc.name testBigInt64ArrayToString068
     * @tc.desc Verify toString on a BigInt64Array constructed from a buffer at offset 16 with length 2 returns the correct elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(40);
      let full = new BigInt64Array(buf);
      full[0] = 10n;
      full[1] = 20n;
      full[2] = 30n;
      full[3] = 40n;
      full[4] = 50n;
      let arr = new BigInt64Array(buf, 16, 2);
      expect(arr.toString()).assertEqual("30,40");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_6900
     * @tc.name testBigInt64ArrayToString069
     * @tc.desc Verify toString on a 200-element array filled with a pattern produces the correct joined output.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 200;
      let arr = new BigInt64Array(count);
      for (let i = 0; i < count; i++) {
        arr[i] = BigInt(i % 10);
      }
      let result = arr.toString();
      let parts = result.split(",");
      expect(parts[0]).assertEqual("0");
      expect(parts[50]).assertEqual("0");
      expect(parts[100]).assertEqual("0");
      expect(parts[150]).assertEqual("0");
      expect(parts[199]).assertEqual("9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_7000
     * @tc.name testBigInt64ArrayToString070
     * @tc.desc Verify toString on an array where all elements are the same arbitrary value produces correct repeated output.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([42n, 42n, 42n, 42n]);
      expect(arr.toString()).assertEqual("42,42,42,42");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_7100
     * @tc.name testBigInt64ArrayToString071
     * @tc.desc Verify toString on an array with consecutive alternating signs produces the correct mixed output.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -1n, 2n, -2n, 3n, -3n]);
      expect(arr.toString()).assertEqual("1,-1,2,-2,3,-3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_7200
     * @tc.name testBigInt64ArrayToString072
     * @tc.desc Verify toString on an array of very negative values near MIN produces correct decimal output.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n, -9223372036854775808n + 1n, -9223372036854775808n + 2n]);
      expect(arr.toString()).assertEqual("-9223372036854775808,-9223372036854775807,-9223372036854775806");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_7300
     * @tc.name testBigInt64ArrayToString073
     * @tc.desc Verify two independently constructed BigInt64Arrays with the same values produce identical toString output.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new BigInt64Array([1n, 2n, 3n]);
      let arr2 = new BigInt64Array([1n, 2n, 3n]);
      expect(arr1.toString()).assertEqual(arr2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_7400
     * @tc.name testBigInt64ArrayToString074
     * @tc.desc Verify toString equals join without argument for the same array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      expect(arr.toString()).assertEqual(arr.join());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_7500
     * @tc.name testBigInt64ArrayToString075
     * @tc.desc Verify join with custom separator '|' and empty separator produces correct strings.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      expect(arr.join('|')).assertEqual('1|2|3');
      expect(arr.join('')).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_7600
     * @tc.name testBigInt64ArrayToString076
     * @tc.desc Verify toString on a very large array (10000 elements) produces correct joined output.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(10000);
      arr.fill(1n);
      let str = arr.toString();
      expect(str.startsWith('1,1,1')).assertTrue();
      expect(str.endsWith('1,1,1')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_7700
     * @tc.name testBigInt64ArrayToString077
     * @tc.desc Verify BigInt via string constructor for MAX+1 wraps to MIN in toString output.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let big = BigInt("9223372036854775808");
      let arr = new BigInt64Array([big]);
      expect(arr.toString()).assertEqual("-9223372036854775808");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_7800
     * @tc.name testBigInt64ArrayToString078
     * @tc.desc Verify BigInt via string constructor for MIN-1 wraps to MAX in toString output.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let big = BigInt("-9223372036854775809");
      let arr = new BigInt64Array([big]);
      expect(arr.toString()).assertEqual("9223372036854775807");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_7900
     * @tc.name testBigInt64ArrayToString079
     * @tc.desc Verify toString shows wraparound pair MAX and MAX+1 in array output.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxVal: bigint = 9223372036854775807n;
      let arr = new BigInt64Array(2);
      arr[0] = 9223372036854775807n;
      arr[1] = maxVal + 1n;
      expect(arr.toString()).assertEqual("9223372036854775807,-9223372036854775808");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_8000
     * @tc.name testBigInt64ArrayToString080
     * @tc.desc Verify toString shows wraparound with zero for MIN and MIN-1 pair.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minVal: bigint = -9223372036854775808n;
      let arr = new BigInt64Array(3);
      arr[0] = -9223372036854775808n;
      arr[1] = minVal - 1n;
      arr[2] = 0n;
      expect(arr.toString()).assertEqual("-9223372036854775808,9223372036854775807,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_8100
     * @tc.name testBigInt64ArrayToString081
     * @tc.desc Verify toString on an array with 5 sequential overflow values produces correct output.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxVal: bigint = 9223372036854775807n;
      let arr = new BigInt64Array(5);
      arr[0] = 9223372036854775805n;
      arr[1] = 9223372036854775806n;
      arr[2] = 9223372036854775807n;
      arr[3] = maxVal + 1n;
      arr[4] = maxVal + 2n;
      expect(arr.toString()).assertEqual("9223372036854775805,9223372036854775806,9223372036854775807,-9223372036854775808,-9223372036854775807");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_8200
     * @tc.name testBigInt64ArrayToString082
     * @tc.desc Verify toString on [0n, 1n, MAX] produces "0,1,9223372036854775807" without spaces.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, 9223372036854775807n]);
      expect(arr.toString()).assertEqual("0,1,9223372036854775807");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_8300
     * @tc.name testBigInt64ArrayToString083
     * @tc.desc Verify toString on [0n] returns "0" not "-0" or "+0".
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let str = arr.toString();
      expect(str).assertEqual("0");
      expect(str !== "-0").assertTrue();
      expect(str !== "+0").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_8400
     * @tc.name testBigInt64ArrayToString084
     * @tc.desc Verify toString on all-negative array [-5n,-10n,-15n] produces correct joined output.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-5n, -10n, -15n]);
      expect(arr.toString()).assertEqual("-5,-10,-15");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_8500
     * @tc.name testBigInt64ArrayToString085
     * @tc.desc Verify toString on array where index equals value [0n,1n,2n,3n] produces correct output.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, 2n, 3n]);
      expect(arr.toString()).assertEqual("0,1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_8600
     * @tc.name testBigInt64ArrayToString086
     * @tc.desc Verify toString on alternating +1/-1 array produces correct output.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -1n, 1n, -1n]);
      expect(arr.toString()).assertEqual("1,-1,1,-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_8700
     * @tc.name testBigInt64ArrayToString087
     * @tc.desc Verify toString on array with value doubling pattern [1n,2n,4n,8n] produces correct output.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 4n, 8n]);
      expect(arr.toString()).assertEqual("1,2,4,8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_8800
     * @tc.name testBigInt64ArrayToString088
     * @tc.desc Verify toString after subarray returns only subarray elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n, 20n, 25n]);
      let sub = arr.subarray(2, 5);
      expect(sub.toString()).assertEqual("15,20,25");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_8900
     * @tc.name testBigInt64ArrayToString089
     * @tc.desc Verify toString on array with negative values produces correct comma-separated string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-5n, 0n, 5n]);
      expect(arr.toString()).assertEqual("-5,0,5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_9000
     * @tc.name testBigInt64ArrayToString090
     * @tc.desc Verify toString on 50-element array produces correct values at representative positions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(50);
      for (let i = 0; i < 50; i++) {
        arr[i] = BigInt(i);
      }
      let str = arr.toString();
      let parts = str.split(",");
      expect(parts[0]).assertEqual("0");
      expect(parts[25]).assertEqual("25");
      expect(parts[49]).assertEqual("49");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_STRING_9100
     * @tc.name testBigInt64ArrayToString091
     * @tc.desc Verify toString on BigInt64Array from ArrayBuffer offset view produces correct output.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToString091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let full = new BigInt64Array(buf);
      full[0] = 11n;
      full[1] = 22n;
      full[2] = 33n;
      full[3] = 44n;
      let arr = new BigInt64Array(buf, 8, 3);
      expect(arr.toString()).assertEqual("22,33,44");
    });

  });
}
