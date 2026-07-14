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
import Utils from '../Util.test';

const BIGINT64_MAX = 9223372036854775807n;
const BIGINT64_MIN = -9223372036854775808n;

export default function BigInt64ArrayReduceRight01Test(): void {
  describe('BigInt64ArrayReduceRight01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_0100
     * @tc.name testBigInt64ArrayReduceRightOne0100
     * @tc.desc Verify reduceRight accepts callbackfn and initialValue with arity two.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let result = arr.reduceRight<BigInt>((prev, curr) => prev + curr, 10n);
      expect(result).assertEqual(16n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_0200
     * @tc.name testBigInt64ArrayReduceRightOne0200
     * @tc.desc Verify callbackfn accumulates bigint values and returns bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let result = arr.reduceRight<BigInt>((prev, curr) => prev + curr, 0n);
      expect(result).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_0300
     * @tc.name testBigInt64ArrayReduceRightOne0300
     * @tc.desc Verify callbackfn can accumulate a string result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let result = arr.reduceRight<string>((prev, curr) => prev + curr.toString(), '');
      expect(result).assertEqual('321');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_0400
     * @tc.name testBigInt64ArrayReduceRightOne0400
     * @tc.desc Verify callbackfn can accumulate a number using currentIndex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n]);
      let result = arr.reduceRight<number>((prev, curr, index) => prev + index, 100);
      expect(result).assertEqual(103);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_0500
     * @tc.name testBigInt64ArrayReduceRightOne0500
     * @tc.desc Verify callbackfn can accumulate a boolean condition.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 4n, 6n]);
      let result = arr.reduceRight<boolean>(
      (prev, curr) => prev && (curr % 2n === 0n),
      true
      );
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_0600
     * @tc.name testBigInt64ArrayReduceRightOne0600
     * @tc.desc Verify callbackfn visits currentIndex from right to left.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 1n, 1n]);
      let res = arr.reduceRight<string>((prev, curr, idx) => prev + idx.toString(), '');
      expect(res).assertEqual('210');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_0700
     * @tc.name testBigInt64ArrayReduceRightOne0700
     * @tc.desc Verify callbackfn can read the array context parameter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let result = arr.reduceRight<BigInt>((prev, curr, idx, a) => prev + a[0] + a[1], 0n);
      expect(result).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_0800
     * @tc.name testBigInt64ArrayReduceRightOne0800
     * @tc.desc Verify callbackfn may return a constant value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let result = arr.reduceRight<BigInt>((prev, curr) => 99n, 0n);
      expect(result).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_0900
     * @tc.name testBigInt64ArrayReduceRightOne0900
     * @tc.desc Verify callbackfn can modify external state on each call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let count = 0;
      arr.reduceRight<BigInt>((prev, curr) => {
        count++;
        return prev;
      }, 0n);
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_1000
     * @tc.name testBigInt64ArrayReduceRightOne1000
     * @tc.desc Verify callbackfn can branch on currentValue dynamically.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let result = arr.reduceRight<BigInt>(
      (prev, curr) => curr > 1n ? prev + curr : prev,
      10n
      );
      expect(result).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_1100
     * @tc.name testBigInt64ArrayReduceRightOne1100
     * @tc.desc Verify callback exceptions are propagated by reduceRight.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      try {
        arr.reduceRight<BigInt>((prev, curr) => {
          throw new Error('Callback Error');
        }, 0n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_1200
     * @tc.name testBigInt64ArrayReduceRightOne1200
     * @tc.desc Verify empty arrays return initialValue without calling callbackfn.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let called = false;
      let result = arr.reduceRight<BigInt>((prev, curr) => {
        called = true;
        return prev;
      }, 55n);
      expect(result).assertEqual(55n);
      expect(called).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_1300
     * @tc.name testBigInt64ArrayReduceRightOne1300
     * @tc.desc Verify callbackfn can return a BigInt64Array accumulator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let result = arr.reduceRight<BigInt64Array>((prev, curr) => {
        let p = new BigInt64Array(1);
        p[0] = prev[0] + curr;
        return p;
      }, new BigInt64Array([10n]));
      expect(result[0]).assertEqual(13n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_1400
     * @tc.name testBigInt64ArrayReduceRightOne1400
     * @tc.desc Verify reduceRight propagates a ClassCastError thrown on the first callback invocation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let callbackCount: int = 0;
      try {
        arr.reduceRight((prev: BigInt, curr: BigInt): BigInt => {
          callbackCount++;
          throw new ClassCastError('reduceRight first callback error');
        }, 10n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
        expect(e.message).assertEqual('reduceRight first callback error');
      }
      expect(callbackCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_1500
     * @tc.name testBigInt64ArrayReduceRightOne1500
     * @tc.desc Verify reduceRight propagates a ClassCastError thrown after one successful callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let callbackCount: int = 0;
      try {
        arr.reduceRight((prev: BigInt, curr: BigInt): BigInt => {
          callbackCount++;
          if (callbackCount === 2) {
            throw new ClassCastError('reduceRight second callback error');
          }
          return prev + curr;
        }, 0n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
        expect(e.message).assertEqual('reduceRight second callback error');
      }
      expect(callbackCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_1600
     * @tc.name testBigInt64ArrayReduceRightOne1600
     * @tc.desc Verify initialValue 0n participates in bigint subtraction.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let result = arr.reduceRight<BigInt>((prev, curr) => prev - curr, 0n);
      expect(result).assertEqual(-30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_1700
     * @tc.name testBigInt64ArrayReduceRightOne1700
     * @tc.desc Verify initialValue 0 works with a number accumulator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let result = arr.reduceRight<number>((prev, curr) => prev + 1, 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_1800
     * @tc.name testBigInt64ArrayReduceRightOne1800
     * @tc.desc Verify initialValue Number.MAX_SAFE_INTEGER is preserved.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let result = arr.reduceRight<number>((prev, curr) => prev, Number.MAX_SAFE_INTEGER);
      expect(result).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_1900
     * @tc.name testBigInt64ArrayReduceRightOne1900
     * @tc.desc Verify initialValue Number.MIN_SAFE_INTEGER is preserved.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let result = arr.reduceRight<number>((prev, curr) => prev, Number.MIN_SAFE_INTEGER);
      expect(result).assertEqual(Number.MIN_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_2000
     * @tc.name testBigInt64ArrayReduceRightOne2000
     * @tc.desc Verify initialValue Math.PI is preserved.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let result = arr.reduceRight<number>((prev, curr) => prev, Math.PI);
      expect(result).assertEqual(Math.PI);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_2100
     * @tc.name testBigInt64ArrayReduceRightOne2100
     * @tc.desc Verify initialValue at bigint maximum boundary works.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let result = arr.reduceRight<BigInt>((prev, curr) => prev - curr, BIGINT64_MAX);
      expect(result).assertEqual(9223372036854775806n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_2200
     * @tc.name testBigInt64ArrayReduceRightOne2200
     * @tc.desc Verify initialValue at bigint minimum boundary works.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let result = arr.reduceRight<BigInt>((prev, curr) => prev + curr, BIGINT64_MIN);
      expect(result).assertEqual(-9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_2300
     * @tc.name testBigInt64ArrayReduceRightOne2300
     * @tc.desc Verify undefined initialValue is returned for an empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let result = arr.reduceRight<string | undefined>((prev, curr) => prev, undefined);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_2400
     * @tc.name testBigInt64ArrayReduceRightOne2400
     * @tc.desc Verify null initialValue can be returned by the callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let result = arr.reduceRight<BigInt | null>((prev, curr) => null, null);
      expect(result).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_2500
     * @tc.name testBigInt64ArrayReduceRightOne2500
     * @tc.desc Verify NaN initialValue is preserved by number accumulation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let result = arr.reduceRight<number>((prev, curr) => prev, NaN);
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_2600
     * @tc.name testBigInt64ArrayReduceRightOne2600
     * @tc.desc Verify negative zero bigint behaves like 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let result = arr.reduceRight<BigInt>((prev, curr) => prev + curr, -0n);
      expect(result).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_2700
     * @tc.name testBigInt64ArrayReduceRightOne2700
     * @tc.desc Verify negative zero number keeps its sign.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let result = arr.reduceRight<number>((prev, curr) => prev, -0);
      expect(1 / result).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_2800
     * @tc.name testBigInt64ArrayReduceRightOne2800
     * @tc.desc Verify Infinity initialValue is preserved.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let result = arr.reduceRight<number>((prev, curr) => prev, Infinity);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_2900
     * @tc.name testBigInt64ArrayReduceRightOne2900
     * @tc.desc Verify negative Infinity initialValue is preserved.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let result = arr.reduceRight<number>((prev, curr) => prev, -Infinity);
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_3000
     * @tc.name testBigInt64ArrayReduceRightOne3000
     * @tc.desc Verify reduceRight processes elements from right to left by string concatenation order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let result = arr.reduceRight<string>((prev, curr) => prev + curr.toString(), '');
      expect(result).assertEqual('2010');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_3100
     * @tc.name testBigInt64ArrayReduceRightOne3100
     * @tc.desc Verify reduceRight sums a multi-element array from right to left with a computed BigInt initialValue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 4n, 8n]);
      let initVal: BigInt = BigInt(16);
      let result = arr.reduceRight<BigInt>((prev, curr) => prev + curr, initVal);
      expect(result).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_3200
     * @tc.name testBigInt64ArrayReduceRightOne3200
     * @tc.desc Verify reduceRight accumulates array elements into a Number accumulator from right to left.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let result = arr.reduceRight<number>((prev, curr) => prev + Number(curr), 100);
      expect(result).assertEqual(106);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_3300
     * @tc.name testBigInt64ArrayReduceRightOne3300
     * @tc.desc Verify an object-wrapped symbol can be used as initialValue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let symbolObj: Object = {};
      let result = arr.reduceRight<Object>((prev, curr) => prev, symbolObj);
      expect(result).assertEqual(symbolObj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_3400
     * @tc.name testBigInt64ArrayReduceRightOne3400
     * @tc.desc Verify an Array accumulator can collect values from right to left.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let result = arr.reduceRight<Array<BigInt>>((prev, curr) => {
        prev.push(curr);
        return prev;
      }, new Array<BigInt>());
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(2n);
      expect(result[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_3500
     * @tc.name testBigInt64ArrayReduceRightOne3500
     * @tc.desc Verify a Set accumulator can collect unique bigint values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 1n, 2n]);
      let result = arr.reduceRight<Set<BigInt>>((prev, curr) => {
        prev.add(curr);
        return prev;
      }, new Set<BigInt>());
      expect(result.size).assertEqual(2);
      expect(result.has(1n)).assertTrue();
      expect(result.has(2n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_3600
     * @tc.name testBigInt64ArrayReduceRightOne3600
     * @tc.desc Verify descending source values follow right-to-left subtraction.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let result = arr.reduceRight<BigInt>((prev, curr) => prev - curr, 10n);
      expect(result).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_3700
     * @tc.name testBigInt64ArrayReduceRightOne3700
     * @tc.desc Verify an all-zero source array leaves the sum unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n, 0n]);
      let result = arr.reduceRight<BigInt>((prev, curr) => prev + curr, 100n);
      expect(result).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_3800
     * @tc.name testBigInt64ArrayReduceRightOne3800
     * @tc.desc Verify a source array containing bigint minimum boundary works.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([BIGINT64_MIN]);
      let result = arr.reduceRight<BigInt>((prev, curr) => curr, 0n);
      expect(result).assertEqual(BIGINT64_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_3900
     * @tc.name testBigInt64ArrayReduceRightOne3900
     * @tc.desc Verify a source array containing bigint maximum boundary works.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([BIGINT64_MAX, 1n]);
      let result = arr.reduceRight<BigInt>((prev, curr) => curr, 0n);
      expect(result).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_4000
     * @tc.name testBigInt64ArrayReduceRightOne4000
     * @tc.desc Verify mixed positive and negative source values accumulate correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, -20n, 30n]);
      let result = arr.reduceRight<BigInt>((prev, curr) => prev + curr, 0n);
      expect(result).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_4100
     * @tc.name testBigInt64ArrayReduceRightOne4100
     * @tc.desc Verify a single element appends to a string initialValue once.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n]);
      let result = arr.reduceRight<string>((prev, curr) => prev + curr.toString(), 'start-');
      expect(result).assertEqual('start-100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_4200
     * @tc.name testBigInt64ArrayReduceRightOne4200
     * @tc.desc Verify a ten-element source array sums from right to left.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n]);
      let result = arr.reduceRight<BigInt>((prev, curr) => prev + curr, 0n);
      expect(result).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_4300
     * @tc.name testBigInt64ArrayReduceRightOne4300
     * @tc.desc Verify reduceRight works on a view with shared buffer offset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new ArrayBuffer(24);
      let arr1 = new BigInt64Array(base, 0, 3);
      arr1[0] = 1n;
      arr1[1] = 2n;
      arr1[2] = 3n;
      let arr2 = new BigInt64Array(base, 8, 2);
      let result = arr2.reduceRight<BigInt>((prev, curr) => prev - curr, 10n);
      expect(result).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_4400
     * @tc.name testBigInt64ArrayReduceRightOne4400
     * @tc.desc Verify reduceRight works on a subarray view with offset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub = arr.subarray(1, 4);
      let result = sub.reduceRight<BigInt>((prev, curr) => prev + curr, 10n);
      expect(result).assertEqual(19n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_4500
     * @tc.name testBigInt64ArrayReduceRightOne4500
     * @tc.desc Verify updating an unvisited element affects later callback reads.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let result = arr.reduceRight<BigInt>((prev, curr, idx, a) => {
        if (idx === 2) {
          a[0] = 99n;
        }
        return prev + curr;
      }, 0n);
      expect(result).assertEqual(104n);
      expect(arr[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_4600
     * @tc.name testBigInt64ArrayReduceRightOne4600
     * @tc.desc Verify updating an already visited element does not change past reads.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let result = arr.reduceRight<BigInt>((prev, curr, idx, a) => {
        if (idx === 0) {
          a[2] = 99n;
        }
        return prev + curr;
      }, 0n);
      expect(result).assertEqual(6n);
      expect(arr[2]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_4700
     * @tc.name testBigInt64ArrayReduceRightOne4700
     * @tc.desc Verify callbackfn can populate an external map by index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let extMap = new Map<number, BigInt>();
      let result = arr.reduceRight<number>((prev, curr, idx) => {
        extMap.set(idx, curr);
        return prev + 1;
      }, 0);
      expect(result).assertEqual(2);
      expect(extMap.get(0)).assertEqual(1n);
      expect(extMap.get(1)).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_4800
     * @tc.name testBigInt64ArrayReduceRightOne4800
     * @tc.desc Verify nested reduceRight calls can contribute to the outer result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let sub = new BigInt64Array([3n, 4n]);
      let result = arr.reduceRight<BigInt>((prev, curr) => {
        let inner = sub.reduceRight<BigInt>((p, c) => p + c, 0n);
        return prev + curr + inner;
      }, 0n);
      expect(result).assertEqual(17n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_4900
     * @tc.name testBigInt64ArrayReduceRightOne4900
     * @tc.desc Verify reduceRight works after chained map and filter operations.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let mapped = arr.map((x) => x * 2n);
      let filtered = mapped.filter((x) => x > 4n);
      let res = filtered.reduceRight<BigInt>((p, c) => p + c, 0n);
      expect(res).assertEqual(14n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_5000
     * @tc.name testBigInt64ArrayReduceRightOne5000
     * @tc.desc Verify callbackfn can return the same BigInt64Array reference.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let result = arr.reduceRight<BigInt64Array>((prev, curr, idx, a) => a, arr);
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_5100
     * @tc.name testBigInt64ArrayReduceRightOne5100
     * @tc.desc Verify number accumulation may exceed Number.MAX_SAFE_INTEGER.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9007199254740991n, 10n]);
      let result = arr.reduceRight<number>((prev, curr) => prev + Number(curr), 0);
      expect(result > Number.MAX_SAFE_INTEGER).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_5200
     * @tc.name testBigInt64ArrayReduceRightOne5200
     * @tc.desc Verify an exception at index one interrupts further iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let count = 0;
      try {
        arr.reduceRight<BigInt>((prev, curr, idx) => {
          count++;
          if (idx === 1) {
            throw new Error('Interrupt');
          }
          return prev + curr;
        }, 0n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_5300
     * @tc.name testBigInt64ArrayReduceRightOne5300
     * @tc.desc Verify a string accumulator returns a string result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let res = arr.reduceRight<string>((prev, curr) => prev + curr.toString(), '');
      expect(typeof res).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_5400
     * @tc.name testBigInt64ArrayReduceRightOne5400
     * @tc.desc Verify a number accumulator returns a number result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let res = arr.reduceRight<number>((prev, curr) => prev, 0);
      expect(typeof res).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_5500
     * @tc.name testBigInt64ArrayReduceRightOne5500
     * @tc.desc Verify a boolean accumulator returns a boolean result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let res = arr.reduceRight<boolean>((prev, curr) => prev, false);
      expect(typeof res).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_5600
     * @tc.name testBigInt64ArrayReduceRightOne5600
     * @tc.desc Verify an Array accumulator returns an Array instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let res = arr.reduceRight<Array<BigInt>>((prev, curr) => prev, new Array<BigInt>());
      expect(res instanceof Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_5700
     * @tc.name testBigInt64ArrayReduceRightOne5700
     * @tc.desc Verify reduceRight sums 100 elements from right to left with initialValue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = BigInt(i + 1);
      }
      let result = arr.reduceRight<BigInt>((prev, curr) => prev + curr, 0n);
      expect(result).assertEqual(5050n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_5800
     * @tc.name testBigInt64ArrayReduceRightOne5800
     * @tc.desc Verify reduceRight concatenates elements as strings from right to left.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(10);
      for (let i = 0; i < 10; i++) {
        arr[i] = BigInt(i);
      }
      let result = arr.reduceRight<string>((prev, curr) => prev + curr.toString() + ',', '');
      expect(result).assertEqual('9,8,7,6,5,4,3,2,1,0,');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_5900
     * @tc.name testBigInt64ArrayReduceRightOne5900
     * @tc.desc Verify callback is invoked for single-element array with initialValue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([42n]);
      let called = false;
      let capturedCurr = 0n;
      let result = arr.reduceRight<BigInt>((prev, curr) => {
        called = true;
        capturedCurr = curr;
        return prev + curr;
      }, 100n);
      expect(result).assertEqual(142n);
      expect(called).assertTrue();
      expect(capturedCurr).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_6000
     * @tc.name testBigInt64ArrayReduceRightOne6000
     * @tc.desc Verify reduceRight with MAX and MIN values plus initialValue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([BIGINT64_MAX, BIGINT64_MIN]);
      let result = arr.reduceRight<BigInt>((prev, curr) => prev + curr, 10n);
      expect(result).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_6100
     * @tc.name testBigInt64ArrayReduceRightOne6100
     * @tc.desc Verify reduceRight handles double MAX overflow with initialValue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([BIGINT64_MAX, BIGINT64_MAX]);
      let result = arr.reduceRight<BigInt>((prev, curr) => prev + curr, 1n);
      expect(result).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_6200
     * @tc.name testBigInt64ArrayReduceRightOne6200
     * @tc.desc Verify reduceRight tracks accumulator values through right-to-left iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let accTrace: Array<BigInt> = [];
      arr.reduceRight<BigInt>((prev, curr) => {
        accTrace.push(prev);
        return prev + curr;
      }, 10n);
      expect(accTrace[0]).assertEqual(10n);
      expect(accTrace[1]).assertEqual(13n);
      expect(accTrace[2]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_6300
     * @tc.name testBigInt64ArrayReduceRightOne6300
     * @tc.desc Verify reduceRight supports boolean OR accumulator from right to left.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n, 5n]);
      let result = arr.reduceRight<boolean>(
        (prev, curr) => prev || (curr > 0n),
        false
      );
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_6400
     * @tc.name testBigInt64ArrayReduceRightOne6400
     * @tc.desc Verify reduceRight observes mutations to later-visited elements during right-to-left iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let visitedValues: Array<BigInt> = [];
      arr.reduceRight<BigInt>((prev, curr, idx, a) => {
        visitedValues.push(curr);
        if (idx === 2) {
          a[3] = 99n;
        }
        return prev + curr;
      }, 0n);
      expect(visitedValues[0]).assertEqual(4n);
      expect(visitedValues[1]).assertEqual(3n);
      expect(visitedValues[2]).assertEqual(2n);
      expect(visitedValues[3]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_ONE_6500
     * @tc.name testBigInt64ArrayReduceRightOne6500
     * @tc.desc Verify array properties are preserved after reduceRight with initialValue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightOne6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let originalLength = arr.length;
      let originalByteLength = arr.byteLength;
      arr.reduceRight<BigInt>((prev, curr) => prev + curr, 0n);
      expect(arr.length).assertEqual(originalLength);
      expect(arr.byteLength).assertEqual(originalByteLength);
      expect(arr[0]).assertEqual(1n);
      expect(arr[4]).assertEqual(5n);
    });
  });
}
