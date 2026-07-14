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

export default function BigInt64ArrayForEach01Test(): void {
  describe('BigInt64ArrayForEach01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_ONE_0100
     * @tc.name testBigInt64ArrayForEachOne0100
     * @tc.desc Verify forEach accepts a callback with zero parameters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachOne0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let count = 0;
      arr.forEach(() => {
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_ONE_0200
     * @tc.name testBigInt64ArrayForEachOne0200
     * @tc.desc Verify forEach accepts a callback with three parameters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachOne0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([6n, 7n]);
      let count = 0;
      arr.forEach((v: BigInt, i: int, a: BigInt64Array) => {
        expect(i).assertEqual(count);
        expect(a.length).assertEqual(2);
        if (i === 0) expect(v).assertEqual(6n);
        if (i === 1) expect(v).assertEqual(7n);
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_ONE_0300
     * @tc.name testBigInt64ArrayForEachOne0300
     * @tc.desc Verify forEach accepts a separately declared arrow callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachOne0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([8n, 9n]);
      let count = 0;
      let cb = (v: BigInt, i: int) => {
        expect(i).assertEqual(count);
        count++;
      };
      arr.forEach(cb);
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_ONE_0400
     * @tc.name testBigInt64ArrayForEachOne0400
     * @tc.desc Verify forEach passes the maximum positive integer value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachOne0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let max = 9223372036854775807n;
      let arr = new BigInt64Array([max]);
      let count = 0;
      arr.forEach((v: BigInt) => {
        expect(v).assertEqual(max);
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_ONE_0500
     * @tc.name testBigInt64ArrayForEachOne0500
     * @tc.desc Verify forEach passes the minimum negative integer value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachOne0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let min = -9223372036854775807n - 1n;
      let arr = new BigInt64Array([min]);
      let count = 0;
      arr.forEach((v: BigInt) => {
        expect(v).assertEqual(min);
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_ONE_0600
     * @tc.name testBigInt64ArrayForEachOne0600
     * @tc.desc Verify forEach passes the 0n value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachOne0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let count = 0;
      arr.forEach((v: BigInt) => {
        expect(v).assertEqual(0n);
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_ONE_0700
     * @tc.name testBigInt64ArrayForEachOne0700
     * @tc.desc Verify forEach passes the 1n value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachOne0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let count = 0;
      arr.forEach((v: BigInt) => {
        expect(v).assertEqual(1n);
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_ONE_0800
     * @tc.name testBigInt64ArrayForEachOne0800
     * @tc.desc Verify forEach passes the -1n value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachOne0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n]);
      let count = 0;
      arr.forEach((v: BigInt) => {
        expect(v).assertEqual(-1n);
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_ONE_0900
     * @tc.name testBigInt64ArrayForEachOne0900
     * @tc.desc Verify forEach passes the 1000n value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachOne0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1000n]);
      let count = 0;
      arr.forEach((v: BigInt) => {
        expect(v).assertEqual(1000n);
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_ONE_1000
     * @tc.name testBigInt64ArrayForEachOne1000
     * @tc.desc Verify forEach passes the -1000n value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachOne1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1000n]);
      let count = 0;
      arr.forEach((v: BigInt) => {
        expect(v).assertEqual(-1000n);
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_ONE_1100
     * @tc.name testBigInt64ArrayForEachOne1100
     * @tc.desc Verify forEach passes the maximum positive integer minus one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachOne1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val = 9223372036854775806n;
      let arr = new BigInt64Array([val]);
      let count = 0;
      arr.forEach((v: BigInt) => {
        expect(v).assertEqual(val);
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_ONE_1200
     * @tc.name testBigInt64ArrayForEachOne1200
     * @tc.desc Verify forEach passes the minimum negative integer plus one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachOne1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val = -9223372036854775807n;
      let arr = new BigInt64Array([val]);
      let count = 0;
      arr.forEach((v: BigInt) => {
        expect(v).assertEqual(val);
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_ONE_1300
     * @tc.name testBigInt64ArrayForEachOne1300
     * @tc.desc Verify forEach passes the 32-bit signed maximum positive value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachOne1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val = 2147483647n;
      let arr = new BigInt64Array([val]);
      let count = 0;
      arr.forEach((v: BigInt) => {
        expect(v).assertEqual(val);
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_ONE_1400
     * @tc.name testBigInt64ArrayForEachOne1400
     * @tc.desc Verify forEach passes the 32-bit signed minimum negative value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachOne1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val = -2147483648n;
      let arr = new BigInt64Array([val]);
      let count = 0;
      arr.forEach((v: BigInt) => {
        expect(v).assertEqual(val);
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_ONE_1500
     * @tc.name testBigInt64ArrayForEachOne1500
     * @tc.desc Verify forEach passes the 8-bit unsigned maximum value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachOne1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val = 255n;
      let arr = new BigInt64Array([val]);
      let count = 0;
      arr.forEach((v: BigInt) => {
        expect(v).assertEqual(val);
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_ONE_1600
     * @tc.name testBigInt64ArrayForEachOne1600
     * @tc.desc Verify forEach passes the negative 8-bit lower boundary value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachOne1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val = -256n;
      let arr = new BigInt64Array([val]);
      let count = 0;
      arr.forEach((v: BigInt) => {
        expect(v).assertEqual(val);
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_ONE_1700
     * @tc.name testBigInt64ArrayForEachOne1700
     * @tc.desc Verify forEach passes the binary 15 value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachOne1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val = 15n;
      let arr = new BigInt64Array([val]);
      let count = 0;
      arr.forEach((v: BigInt) => {
        expect(v).assertEqual(val);
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_ONE_1800
     * @tc.name testBigInt64ArrayForEachOne1800
     * @tc.desc Verify forEach passes the octal expression for 511.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachOne1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val = 511n;
      let arr = new BigInt64Array([val]);
      let count = 0;
      arr.forEach((v: BigInt) => {
        expect(v).assertEqual(val);
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_ONE_1900
     * @tc.name testBigInt64ArrayForEachOne1900
     * @tc.desc Verify forEach passes the negative octal expression for 511.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachOne1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val = -511n;
      let arr = new BigInt64Array([val]);
      let count = 0;
      arr.forEach((v: BigInt) => {
        expect(v).assertEqual(val);
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_ONE_2000
     * @tc.name testBigInt64ArrayForEachOne2000
     * @tc.desc Verify forEach visits every element in a zero-initialized array
     * of length 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachOne2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(0);
      let count = 0;
      arr.forEach((v: BigInt) => {
        count++;
      });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_ONE_2100
     * @tc.name testBigInt64ArrayForEachOne2100
     * @tc.desc Verify forEach visits every element in a zero-initialized array
     * of length 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachOne2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      let count = 0;
      arr.forEach((v: BigInt) => {
        expect(v).assertEqual(0n);
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_ONE_2200
     * @tc.name testBigInt64ArrayForEachOne2200
     * @tc.desc Verify forEach iterates maximum and minimum boundary values in
     * order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachOne2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let max = 9223372036854775807n;
      let min = -9223372036854775807n - 1n;
      let arr = new BigInt64Array([max, min]);
      let count = 0;
      arr.forEach((v: BigInt, i: int) => {
        if (i === 0) expect(v).assertEqual(max);
        if (i === 1) expect(v).assertEqual(min);
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_ONE_2300
     * @tc.name testBigInt64ArrayForEachOne2300
     * @tc.desc Verify forEach iterates minimum and maximum boundary values in
     * reversed order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachOne2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let max = 9223372036854775807n;
      let min = -9223372036854775807n - 1n;
      let arr = new BigInt64Array([min, max]);
      let count = 0;
      arr.forEach((v: BigInt, i: int) => {
        if (i === 0) expect(v).assertEqual(min);
        if (i === 1) expect(v).assertEqual(max);
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_ONE_2400
     * @tc.name testBigInt64ArrayForEachOne2400
     * @tc.desc Verify forEach iterates zero and maximum boundary values in
     * order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachOne2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let max = 9223372036854775807n;
      let arr = new BigInt64Array([0n, max]);
      let count = 0;
      arr.forEach((v: BigInt, i: int) => {
        if (i === 0) expect(v).assertEqual(0n);
        if (i === 1) expect(v).assertEqual(max);
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_ONE_2500
     * @tc.name testBigInt64ArrayForEachOne2500
     * @tc.desc Verify forEach iterates maximum boundary and zero values in
     * order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachOne2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let max = 9223372036854775807n;
      let arr = new BigInt64Array([max, 0n]);
      let count = 0;
      arr.forEach((v: BigInt, i: int) => {
        if (i === 0) expect(v).assertEqual(max);
        if (i === 1) expect(v).assertEqual(0n);
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_ONE_2600
     * @tc.name testBigInt64ArrayForEachOne2600
     * @tc.desc Verify forEach iterates zero and minimum boundary values in
     * order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachOne2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let min = -9223372036854775807n - 1n;
      let arr = new BigInt64Array([0n, min]);
      let count = 0;
      arr.forEach((v: BigInt, i: int) => {
        if (i === 0) expect(v).assertEqual(0n);
        if (i === 1) expect(v).assertEqual(min);
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_ONE_2700
     * @tc.name testBigInt64ArrayForEachOne2700
     * @tc.desc Verify forEach iterates minimum boundary and zero values in
     * order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachOne2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let min = -9223372036854775807n - 1n;
      let arr = new BigInt64Array([min, 0n]);
      let count = 0;
      arr.forEach((v: BigInt, i: int) => {
        if (i === 0) expect(v).assertEqual(min);
        if (i === 1) expect(v).assertEqual(0n);
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_ONE_2800
     * @tc.name testBigInt64ArrayForEachOne2800
     * @tc.desc Verify forEach iterates 1n and -1n in order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachOne2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -1n]);
      let count = 0;
      arr.forEach((v: BigInt, i: int) => {
        if (i === 0) expect(v).assertEqual(1n);
        if (i === 1) expect(v).assertEqual(-1n);
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_ONE_2900
     * @tc.name testBigInt64ArrayForEachOne2900
     * @tc.desc Verify forEach iterates -1n and 1n in order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachOne2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, 1n]);
      let count = 0;
      arr.forEach((v: BigInt, i: int) => {
        if (i === 0) expect(v).assertEqual(-1n);
        if (i === 1) expect(v).assertEqual(1n);
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_ONE_3000
     * @tc.name testBigInt64ArrayForEachOne3000
     * @tc.desc Verify forEach iterates increasing positive multiples of ten in
     * order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachOne3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let count = 0;
      arr.forEach((v: BigInt, i: int) => {
        if (i === 0) expect(v).assertEqual(10n);
        if (i === 1) expect(v).assertEqual(20n);
        if (i === 2) expect(v).assertEqual(30n);
        count++;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_ONE_3100
     * @tc.name testBigInt64ArrayForEachOne3100
     * @tc.desc Verify forEach iterates decreasing negative multiples of ten in
     * order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachOne3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-10n, -20n, -30n]);
      let count = 0;
      arr.forEach((v: BigInt, i: int) => {
        if (i === 0) expect(v).assertEqual(-10n);
        if (i === 1) expect(v).assertEqual(-20n);
        if (i === 2) expect(v).assertEqual(-30n);
        count++;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_ONE_3200
     * @tc.name testBigInt64ArrayForEachOne3200
     * @tc.desc Verify forEach iterates maximum, zero, and minimum values in
     * order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachOne3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let max = 9223372036854775807n;
      let min = -9223372036854775807n - 1n;
      let arr = new BigInt64Array([max, 0n, min]);
      let count = 0;
      arr.forEach((v: BigInt, i: int) => {
        if (i === 0) expect(v).assertEqual(max);
        if (i === 1) expect(v).assertEqual(0n);
        if (i === 2) expect(v).assertEqual(min);
        count++;
      });
      expect(count).assertEqual(3);
    });
  });
}
