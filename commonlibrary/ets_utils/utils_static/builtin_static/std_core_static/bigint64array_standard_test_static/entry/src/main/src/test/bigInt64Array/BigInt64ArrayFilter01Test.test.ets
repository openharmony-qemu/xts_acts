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

export default function BigInt64ArrayFilter01Test(): void {
  describe('BigInt64ArrayFilter01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_0100
     * @tc.name testBigInt64ArrayFilterOne0100
     * @tc.desc Verify `arr.filter(() => { return true; })` produces a result where `res.length` equals `2`, `res[0]` equals `10n`, and `res[1]` equals `20n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let res = arr.filter(() => {
        return true;
      });
      expect(res.length).assertEqual(2);
      expect(res[0]).assertEqual(10n);
      expect(res[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_0200
     * @tc.name testBigInt64ArrayFilterOne0200
     * @tc.desc Verify `arr.filter(() => { return false; })` produces a result where `res.length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let res = arr.filter(() => {
        return false;
      });
      expect(res.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_0300
     * @tc.name testBigInt64ArrayFilterOne0300
     * @tc.desc Verify `arr.filter((val) => { return val === 10n; })` produces a result where `res.length` equals `1`, `res[0]` equals `10n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let res = arr.filter((val) => {
        return val === 10n;
      });
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_0400
     * @tc.name testBigInt64ArrayFilterOne0400
     * @tc.desc Verify `arr.filter((val) => { return val !== 10n; })` produces a result where `res.length` equals `1`, `res[0]` equals `20n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let res = arr.filter((val) => {
        return val !== 10n;
      });
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_0500
     * @tc.name testBigInt64ArrayFilterOne0500
     * @tc.desc Verify `arr.filter((val, index) => { return index === 0; })` produces a result where `res.length` equals `1`, `res[0]` equals `10n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let res = arr.filter((val, index) => {
        return index === 0;
      });
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_0600
     * @tc.name testBigInt64ArrayFilterOne0600
     * @tc.desc Verify filtering all elements preserves order without mutating the source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let res = arr.filter((val, index) => {
        return index === 1;
      });
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_0700
     * @tc.name testBigInt64ArrayFilterOne0700
     * @tc.desc Verify `arr.filter((val, index, array) => { return array.length === 2; })` produces a result where `res.length` equals `2`, `res[0]` equals `10n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let res = arr.filter((val, index, array) => {
        return array.length === 2;
      });
      expect(res.length).assertEqual(2);
      expect(res[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_0800
     * @tc.name testBigInt64ArrayFilterOne0800
     * @tc.desc Verify `arr.filter((val, index, array) => { return array[index] === val; })` produces a result where `res.length` equals `2`, `res[1]` equals `20n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let res = arr.filter((val, index, array) => {
        return array[index] === val;
      });
      expect(res.length).assertEqual(2);
      expect(res[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_0900
     * @tc.name testBigInt64ArrayFilterOne0900
     * @tc.desc Verify `arr.filter((val) => { return val === 9223372036854775807n; })` produces a result where `res.length` equals `1`, `res[0]` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let res = arr.filter((val) => {
        return val === 9223372036854775807n;
      });
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_1000
     * @tc.name testBigInt64ArrayFilterOne1000
     * @tc.desc Verify `arr.filter((val) => { return val === -9223372036854775808n; })` produces a result where `res.length` equals `1`, `res[0]` equals `-9223372036854775808n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n]);
      let res = arr.filter((val) => {
        return val === -9223372036854775807n - 1n;
      });
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(-9223372036854775807n - 1n);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_1100
     * @tc.name testBigInt64ArrayFilterOne1100
     * @tc.desc Verify `arr.filter((val) => { return val === 0n; })` produces a result where `res.length` equals `1`, `res[0]` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let res = arr.filter((val) => {
        return val === 0n;
      });
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_1200
     * @tc.name testBigInt64ArrayFilterOne1200
     * @tc.desc Verify `arr.filter((val) => { return val === 1n; })` produces a result where `res.length` equals `1`, `res[0]` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let res = arr.filter((val) => {
        return val === 1n;
      });
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_1300
     * @tc.name testBigInt64ArrayFilterOne1300
     * @tc.desc Verify `arr.filter((val) => { return val === -1n; })` produces a result where `res.length` equals `1`, `res[0]` equals `-1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n]);
      let res = arr.filter((val) => {
        return val === -1n;
      });
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_1400
     * @tc.name testBigInt64ArrayFilterOne1400
     * @tc.desc Verify `arr.filter((val) => { return val === 4n; })` produces a result where `res.length` equals `1`, `res[0]` equals `4n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9n >> 1n]);
      let res = arr.filter((val) => {
        return val === 4n;
      });
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_1500
     * @tc.name testBigInt64ArrayFilterOne1500
     * @tc.desc Verify `arr.filter((val) => { return val === 1n; })` produces a result where `res.length` equals `1`, `res[0]` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n & 3n]);
      let res = arr.filter((val) => {
        return val === 1n;
      });
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_1600
     * @tc.name testBigInt64ArrayFilterOne1600
     * @tc.desc Verify `arr.filter((val) => { return val === 7n; })` produces a result where `res.length` equals `1`, `res[0]` equals `7n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n | 2n]);
      let res = arr.filter((val) => {
        return val === 7n;
      });
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_1700
     * @tc.name testBigInt64ArrayFilterOne1700
     * @tc.desc Verify `arr.filter((val) => { return val === 6n; })` produces a result where `res.length` equals `1`, `res[0]` equals `6n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n ^ 3n]);
      let res = arr.filter((val) => {
        return val === 6n;
      });
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_1800
     * @tc.name testBigInt64ArrayFilterOne1800
     * @tc.desc Verify `arr.filter((val) => { return val === 2n; })` produces a result where `res.length` equals `1`, `res[0]` equals `2n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([~(-3n)]);
      let res = arr.filter((val) => {
        return val === 2n;
      });
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_1900
     * @tc.name testBigInt64ArrayFilterOne1900
     * @tc.desc Verify `arr.filter((val) => { return val !== 9223372036854775807n; })` produces a result where `res.length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let res = arr.filter((val) => {
        return val !== 9223372036854775807n;
      });
      expect(res.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_2000
     * @tc.name testBigInt64ArrayFilterOne2000
     * @tc.desc Verify `arr.filter((val) => { return val !== -9223372036854775808n; })` produces a result where `res.length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n]);
      let res = arr.filter((val) => {
        return val !== -9223372036854775807n - 1n;
      });
      expect(res.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_2100
     * @tc.name testBigInt64ArrayFilterOne2100
     * @tc.desc Verify `arr.filter((val) => { return val !== 0n; })` produces a result where `res.length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let res = arr.filter((val) => {
        return val !== 0n;
      });
      expect(res.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_2200
     * @tc.name testBigInt64ArrayFilterOne2200
     * @tc.desc Verify `arr.filter((val, index) => { return index === 0; })` produces a result where `res.length` equals `1`, `res[0]` equals `10n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.filter((val, index) => {
        return index === 0;
      });
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_2300
     * @tc.name testBigInt64ArrayFilterOne2300
     * @tc.desc Verify `arr.filter((val, index) => { return index === 1; })` produces a result where `res.length` equals `1`, `res[0]` equals `20n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-3n, 0n, 3n]);
      let res = arr.filter((_val: bigint): boolean => true);
      expect(res.join()).assertEqual('-3,0,3');
      expect(arr.join()).assertEqual('-3,0,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_2400
     * @tc.name testBigInt64ArrayFilterOne2400
     * @tc.desc Verify filter creates an independent buffer for the selected values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 3n, 4n, 5n]);
      let res = arr.filter((val: bigint): boolean => val % 2n === 0n);
      expect(res.join()).assertEqual('2,4');
      expect(res.buffer === arr.buffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_2500
     * @tc.name testBigInt64ArrayFilterOne2500
     * @tc.desc Verify `arr.filter((val, index) => { return index !== 0; })` produces a result where `res.length` equals `2`, `res[0]` equals `20n`, and `res[1]` equals `30n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.filter((val, index) => {
        return index !== 0;
      });
      expect(res.length).assertEqual(2);
      expect(res[0]).assertEqual(20n);
      expect(res[1]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_2600
     * @tc.name testBigInt64ArrayFilterOne2600
     * @tc.desc Verify `arr.filter((val, index) => { return index !== 1; })` produces a result where `res.length` equals `2`, `res[0]` equals `10n`, and `res[1]` equals `30n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.filter((val, index) => {
        return index !== 1;
      });
      expect(res.length).assertEqual(2);
      expect(res[0]).assertEqual(10n);
      expect(res[1]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_2700
     * @tc.name testBigInt64ArrayFilterOne2700
     * @tc.desc Verify `arr.filter((val, index) => { return index > 0; })` produces a result where `res.length` equals `2`, `res[0]` equals `20n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.filter((val, index) => {
        return index > 0;
      });
      expect(res.length).assertEqual(2);
      expect(res[0]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_2800
     * @tc.name testBigInt64ArrayFilterOne2800
     * @tc.desc Verify `arr.filter((val, index) => { return index >= 1; })` produces a result where `res.length` equals `2`, `res[0]` equals `20n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.filter((val, index) => {
        return index >= 1;
      });
      expect(res.length).assertEqual(2);
      expect(res[0]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_2900
     * @tc.name testBigInt64ArrayFilterOne2900
     * @tc.desc Verify `arr.filter((val, index) => { return index < 2; })` produces a result where `res.length` equals `2`, `res[0]` equals `10n`, and `res[1]` equals `20n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.filter((val, index) => {
        return index < 2;
      });
      expect(res.length).assertEqual(2);
      expect(res[0]).assertEqual(10n);
      expect(res[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_3000
     * @tc.name testBigInt64ArrayFilterOne3000
     * @tc.desc Verify `arr.filter((val, index) => { return index <= 1; })` produces a result where `res.length` equals `2`, `res[0]` equals `10n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.filter((val, index) => {
        return index <= 1;
      });
      expect(res.length).assertEqual(2);
      expect(res[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_3100
     * @tc.name testBigInt64ArrayFilterOne3100
     * @tc.desc Verify `arr.filter((val, index) => { return index % 2 === 0; })` produces a result where `res.length` equals `2`, `res[0]` equals `10n`, and `res[1]` equals `30n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let res = arr.filter((val, index) => {
        return index % 2 === 0;
      });
      expect(res.length).assertEqual(2);
      expect(res[0]).assertEqual(10n);
      expect(res[1]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_3200
     * @tc.name testBigInt64ArrayFilterOne3200
     * @tc.desc Verify `arr.filter((val, index) => { return index % 2 !== 0; })` produces a result where `res.length` equals `2`, `res[0]` equals `20n`, and `res[1]` equals `40n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let res = arr.filter((val, index) => {
        return index % 2 !== 0;
      });
      expect(res.length).assertEqual(2);
      expect(res[0]).assertEqual(20n);
      expect(res[1]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_3300
     * @tc.name testBigInt64ArrayFilterOne3300
     * @tc.desc Verify `arr.filter((val, index) => { return index + 1 === 2; })` produces a result where `res.length` equals `1`, `res[0]` equals `20n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.filter((val, index) => {
        return index + 1 === 2;
      });
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_3400
     * @tc.name testBigInt64ArrayFilterOne3400
     * @tc.desc Verify `arr.filter((val, index) => { return index * 2 === 0; })` produces a result where `res.length` equals `1`, `res[0]` equals `10n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.filter((val, index) => {
        return index * 2 === 0;
      });
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_3500
     * @tc.name testBigInt64ArrayFilterOne3500
     * @tc.desc Verify `arr.filter((val, index) => { return index === 9; })` produces a result where `res.length` equals `1`, `res[0]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
      let res = arr.filter((val, index) => {
        return index === 9;
      });
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_3600
     * @tc.name testBigInt64ArrayFilterOne3600
     * @tc.desc Verify `arr.filter((val, index) => { return index === 5; })` produces a result where `res.length` equals `1`, `res[0]` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
      let res = arr.filter((val, index) => {
        return index === 5;
      });
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_3700
     * @tc.name testBigInt64ArrayFilterOne3700
     * @tc.desc Verify `arr.filter((val, index) => { return index > 7; })` produces a result where `res.length` equals `2`, `res[0]` equals `8n`, and `res[1]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
      let res = arr.filter((val, index) => {
        return index > 7;
      });
      expect(res.length).assertEqual(2);
      expect(res[0]).assertEqual(8n);
      expect(res[1]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_3800
     * @tc.name testBigInt64ArrayFilterOne3800
     * @tc.desc Verify `arr.filter((val, index) => { return index < 2; })` produces a result where `res.length` equals `2`, `res[0]` equals `0n`, and `res[1]` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
      let res = arr.filter((val, index) => {
        return index < 2;
      });
      expect(res.length).assertEqual(2);
      expect(res[0]).assertEqual(0n);
      expect(res[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_3900
     * @tc.name testBigInt64ArrayFilterOne3900
     * @tc.desc Verify `arr.filter((val, index, array) => { return array.length === 1; })` produces a result where `res.length` equals `1`, `res[0]` equals `10n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let res = arr.filter((val, index, array) => {
        return array.length === 1;
      });
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_4000
     * @tc.name testBigInt64ArrayFilterOne4000
     * @tc.desc Verify `arr.filter((val, index, array) => { return array.length === 3; })` produces a result where `res.length` equals `3`, `res[0]` equals `10n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.filter((val, index, array) => {
        return array.length === 3;
      });
      expect(res.length).assertEqual(3);
      expect(res[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_4100
     * @tc.name testBigInt64ArrayFilterOne4100
     * @tc.desc Verify `arr.filter((val, index, array) => { return array[0] === 10n && val === 20n; })` produces a result where `res.length` equals `1`, `res[0]` equals `20n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.filter((val, index, array) => {
        return array[0] === 10n && val === 20n;
      });
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_4200
     * @tc.name testBigInt64ArrayFilterOne4200
     * @tc.desc Verify a subarray filter receives relative indices and the subarray instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let view = root.subarray(1, 4);
      let res = view.filter((val: bigint, index: int, array: BigInt64Array): boolean => {
        return array === view && index === 2 && val === 40n;
      });
      expect(res.join()).assertEqual('40');
      expect(root.join()).assertEqual('10,20,30,40,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_4300
     * @tc.name testBigInt64ArrayFilterOne4300
     * @tc.desc Verify filter observes the order produced by reverse and returns matching negatives.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, 2n, -3n, 4n]);
      arr.reverse();
      let res = arr.filter((val: bigint): boolean => val < 0n);
      expect(res.join()).assertEqual('-3,-1');
      expect(arr.join()).assertEqual('4,-3,2,-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_4400
     * @tc.name testBigInt64ArrayFilterOne4400
     * @tc.desc Verify `arr.filter((val, index, array) => { return array[index] === val; })` produces a result where `res.length` equals `3`, `res[0]` equals `10n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.filter((val, index, array) => {
        return array[index] === val;
      });
      expect(res.length).assertEqual(3);
      expect(res[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_4500
     * @tc.name testBigInt64ArrayFilterOne4500
     * @tc.desc Verify `arr.filter((val, index, array) => { return array[index] === array[0]; })` produces a result where `res.length` equals `1`, `res[0]` equals `10n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.filter((val, index, array) => {
        return array[index] === array[0];
      });
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_4600
     * @tc.name testBigInt64ArrayFilterOne4600
     * @tc.desc Verify `arr.filter((val, index, array) => { return array[index] === array[1]; })` produces a result where `res.length` equals `1`, `res[0]` equals `20n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.filter((val, index, array) => {
        return array[index] === array[1];
      });
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_4700
     * @tc.name testBigInt64ArrayFilterOne4700
     * @tc.desc Verify `arr.filter((val, index, array) => { return array[array.length - 1] === val; })` produces a result where `res.length` equals `1`, `res[0]` equals `30n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.filter((val, index, array) => {
        return array[array.length - 1] === val;
      });
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_4800
     * @tc.name testBigInt64ArrayFilterOne4800
     * @tc.desc Verify filter throws RangeError when its callback reads past the
     * right boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let callbackCount = 0;
      try {
        arr.filter((val, index, array) => {
          callbackCount++;
          return array[index + 1] !== 20n;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(callbackCount).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_4900
     * @tc.name testBigInt64ArrayFilterOne4900
     * @tc.desc Verify filter throws RangeError when its callback reads past the
     * left boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let callbackCount = 0;
      try {
        arr.filter((val, index, array) => {
          callbackCount++;
          return array[index - 1] !== 20n;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(callbackCount).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_ONE_5000
     * @tc.name testBigInt64ArrayFilterOne5000
     * @tc.desc Verify filtering for `10n` returns all matching elements in a new BigInt64Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterOne5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 10n, 30n]);
      let res = arr.filter((val) => {
        return val === 10n;
      });
      expect(res === arr).assertFalse();
      expect(res.length).assertEqual(2);
      expect(res[0]).assertEqual(10n);
      expect(res[1]).assertEqual(10n);
    });

  });
}
