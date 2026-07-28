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

export default function BigInt64ArrayFrom0302Test(): void {
  describe('BigInt64ArrayFrom0302Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_TWO_0100
     * @tc.name testBigInt64ArrayFromThreeTwo0100
     * @tc.desc Verify mapFn invocation count accumulation for Array source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromThreeTwo0100', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL2, (): void => {
      let count = 0;
      let src: Array<BigInt> = [10n, 20n, 30n];
      let res = BigInt64Array.from(
        src,
        (v: BigInt, k: number): BigInt => {
          count++;
          return v;
        }
      );
      expect(res.length).assertEqual(3);
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_TWO_0200
     * @tc.name testBigInt64ArrayFromThreeTwo0200
     * @tc.desc Verify mapFn invocation count accumulation for ArrayLike number source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromThreeTwo0200', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL2, (): void => {
      let count = 0;
      let src: Array<number> = [Number(10n), Number(20n), Number(30n)];
      let res = BigInt64Array.from(
        src as ArrayLike<number>,
        (v: number, k: number): BigInt => {
          count++;
          return BigInt(v);
        }
      );
      expect(res.length).assertEqual(3);
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_TWO_0300
     * @tc.name testBigInt64ArrayFromThreeTwo0300
     * @tc.desc Verify mapFn invocation count accumulation for Iterable SetValues source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromThreeTwo0300', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL2, (): void => {
      let count = 0;
      let set: Set<BigInt> = new Set<BigInt>([10n, 20n, 30n]);
      let src: IterableIterator<BigInt> = set.values();
      let res = BigInt64Array.from(
        src,
        (v: BigInt, k: number): BigInt => {
          count++;
          return v;
        }
      );
      expect(res.length).assertEqual(3);
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_TWO_0400
     * @tc.name testBigInt64ArrayFromThreeTwo0400
     * @tc.desc Verify mapFn records the first external index for Array source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromThreeTwo0400', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL2, (): void => {
      let ext: number[] = [];
      let src: Array<BigInt> = [10n, 20n, 30n];
      let res = BigInt64Array.from(
        src,
        (v: BigInt, k: number): BigInt => {
          ext.push(k);
          return v;
        }
      );
      expect(res[0]).assertEqual(10n);
      expect(ext[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_TWO_0500
     * @tc.name testBigInt64ArrayFromThreeTwo0500
     * @tc.desc Verify mapFn records the first external index for ArrayLike number source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromThreeTwo0500', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL2, (): void => {
      let ext: number[] = [];
      let src: Array<number> = [Number(10n), Number(20n), Number(30n)];
      let res = BigInt64Array.from(
        src as ArrayLike<number>,
        (v: number, k: number): BigInt => {
          ext.push(k);
          return BigInt(v);
        }
      );
      expect(res[0]).assertEqual(10n);
      expect(ext[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_TWO_0600
     * @tc.name testBigInt64ArrayFromThreeTwo0600
     * @tc.desc Verify mapFn records the first external index for Iterable SetValues source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromThreeTwo0600', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL2, (): void => {
      let ext: number[] = [];
      let set: Set<BigInt> = new Set<BigInt>([10n, 20n, 30n]);
      let src: IterableIterator<BigInt> = set.values();
      let res = BigInt64Array.from(
        src,
        (v: BigInt, k: number): BigInt => {
          ext.push(k);
          return v;
        }
      );
      expect(res[0]).assertEqual(10n);
      expect(ext[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_TWO_0700
     * @tc.name testBigInt64ArrayFromThreeTwo0700
     * @tc.desc Verify midpoint Error propagation stops after two invocations for Array source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromThreeTwo0700', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL2, (): void => {
      let count = 0;
      let src: Array<BigInt> = [10n, 20n, 30n];
      try {
        BigInt64Array.from(
          src,
          (v: BigInt, k: number): BigInt => {
            count++;
            if (k === 1) {
              throw new Error('Err');
            }
            return v;
          }
        );
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_TWO_0800
     * @tc.name testBigInt64ArrayFromThreeTwo0800
     * @tc.desc Verify midpoint Error propagation stops after two invocations for ArrayLike number source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromThreeTwo0800', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL2, (): void => {
      let count = 0;
      let src: Array<number> = [Number(10n), Number(20n), Number(30n)];
      try {
        BigInt64Array.from(
          src as ArrayLike<number>,
          (v: number, k: number): BigInt => {
            count++;
            if (k === 1) {
              throw new Error('Err');
            }
            return BigInt(v);
          }
        );
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_TWO_0900
     * @tc.name testBigInt64ArrayFromThreeTwo0900
     * @tc.desc Verify midpoint Error propagation stops after two invocations for Iterable SetValues source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromThreeTwo0900', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL2, (): void => {
      let count = 0;
      let set: Set<BigInt> = new Set<BigInt>([10n, 20n, 30n]);
      let src: IterableIterator<BigInt> = set.values();
      try {
        BigInt64Array.from(
          src,
          (v: BigInt, k: number): BigInt => {
            count++;
            if (k === 1) {
              throw new Error('Err');
            }
            return v;
          }
        );
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_TWO_1000
     * @tc.name testBigInt64ArrayFromThreeTwo1000
     * @tc.desc Verify tail Error propagation stops after three invocations for Array source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromThreeTwo1000', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL2, (): void => {
      let count = 0;
      let src: Array<BigInt> = [10n, 20n, 30n];
      try {
        BigInt64Array.from(
          src,
          (v: BigInt, k: number): BigInt => {
            count++;
            if (k === 2) {
              throw new Error('Err');
            }
            return v;
          }
        );
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_TWO_1100
     * @tc.name testBigInt64ArrayFromThreeTwo1100
     * @tc.desc Verify tail Error propagation stops after three invocations for ArrayLike number source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromThreeTwo1100', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL2, (): void => {
      let count = 0;
      let src: Array<number> = [Number(10n), Number(20n), Number(30n)];
      try {
        BigInt64Array.from(
          src as ArrayLike<number>,
          (v: number, k: number): BigInt => {
            count++;
            if (k === 2) {
              throw new Error('Err');
            }
            return BigInt(v);
          }
        );
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_TWO_1200
     * @tc.name testBigInt64ArrayFromThreeTwo1200
     * @tc.desc Verify tail Error propagation stops after three invocations for Iterable SetValues source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromThreeTwo1200', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL2, (): void => {
      let count = 0;
      let set: Set<BigInt> = new Set<BigInt>([10n, 20n, 30n]);
      let src: IterableIterator<BigInt> = set.values();
      try {
        BigInt64Array.from(
          src,
          (v: BigInt, k: number): BigInt => {
            count++;
            if (k === 2) {
              throw new Error('Err');
            }
            return v;
          }
        );
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_TWO_1300
     * @tc.name testBigInt64ArrayFromThreeTwo1300
     * @tc.desc Verify thrown TypeError is propagated for Array source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromThreeTwo1300', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL2, (): void => {
      let src: Array<BigInt> = [10n, 20n, 30n];
      try {
        BigInt64Array.from(
          src,
          (v: BigInt, k: number): BigInt => {
            if (k === 1) {
              throw new TypeError('TypeErr');
            }
            return v;
          }
        );
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_TWO_1400
     * @tc.name testBigInt64ArrayFromThreeTwo1400
     * @tc.desc Verify thrown TypeError is propagated for ArrayLike number source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromThreeTwo1400', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL2, (): void => {
      let src: Array<number> = [Number(10n), Number(20n), Number(30n)];
      try {
        BigInt64Array.from(
          src as ArrayLike<number>,
          (v: number, k: number): BigInt => {
            if (k === 1) {
              throw new TypeError('TypeErr');
            }
            return BigInt(v);
          }
        );
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_TWO_1500
     * @tc.name testBigInt64ArrayFromThreeTwo1500
     * @tc.desc Verify thrown TypeError is propagated for Iterable SetValues source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromThreeTwo1500', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL2, (): void => {
      let set: Set<BigInt> = new Set<BigInt>([10n, 20n, 30n]);
      let src: IterableIterator<BigInt> = set.values();
      try {
        BigInt64Array.from(
          src,
          (v: BigInt, k: number): BigInt => {
            if (k === 1) {
              throw new TypeError('TypeErr');
            }
            return v;
          }
        );
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_TWO_1600
     * @tc.name testBigInt64ArrayFromThreeTwo1600
     * @tc.desc Verify mutating the result does not affect Array source data.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromThreeTwo1600', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL2, (): void => {
      let src: Array<BigInt> = [10n, 20n, 30n];
      let res = BigInt64Array.from(src);
      res[0] = 99n;
      expect(src[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_TWO_1700
     * @tc.name testBigInt64ArrayFromThreeTwo1700
     * @tc.desc Verify mutating the result does not affect Set source data.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromThreeTwo1700', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL2, (): void => {
      let src: Set<BigInt> = new Set<BigInt>([10n, 20n, 30n]);
      let res = BigInt64Array.from(src);
      res[0] = 99n;
      expect(src.has(99n)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_TWO_1800
     * @tc.name testBigInt64ArrayFromThreeTwo1800
     * @tc.desc Verify mutating the result does not affect BigInt64Array source data.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromThreeTwo1800', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL2, (): void => {
      let src: BigInt64Array = new BigInt64Array([10n, 20n, 30n]);
      let res = BigInt64Array.from(src);
      res[0] = 99n;
      expect(src[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_TWO_1900
     * @tc.name testBigInt64ArrayFromThreeTwo1900
     * @tc.desc Verify mutating the result does not affect ArrayLike number source data.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromThreeTwo1900', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL2, (): void => {
      let src: Array<number> = [Number(10n), Number(20n), Number(30n)];
      let res = BigInt64Array.from(src as ArrayLike<number>, (v: number): BigInt => BigInt(v));
      res[0] = 99n;
      expect(src[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_TWO_2000
     * @tc.name testBigInt64ArrayFromThreeTwo2000
     * @tc.desc Verify mutating Array source data does not affect the created result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromThreeTwo2000', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL2, (): void => {
      let src: Array<BigInt> = [10n, 20n, 30n];
      let res = BigInt64Array.from(src);
      src[0] = 88n;
      expect(res[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_TWO_2100
     * @tc.name testBigInt64ArrayFromThreeTwo2100
     * @tc.desc Verify mutating Set source data does not affect the created result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromThreeTwo2100', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL2, (): void => {
      let src: Set<BigInt> = new Set<BigInt>([10n, 20n, 30n]);
      let res = BigInt64Array.from(src);
      src.add(88n);
      expect(res[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_TWO_2200
     * @tc.name testBigInt64ArrayFromThreeTwo2200
     * @tc.desc Verify mutating BigInt64Array source data does not affect the created result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromThreeTwo2200', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL2, (): void => {
      let src: BigInt64Array = new BigInt64Array([10n, 20n, 30n]);
      let res = BigInt64Array.from(src);
      src[0] = 88n;
      expect(res[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_TWO_2300
     * @tc.name testBigInt64ArrayFromThreeTwo2300
     * @tc.desc Verify mutating ArrayLike number source data does not affect the created result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromThreeTwo2300', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL2, (): void => {
      let src: Array<number> = [Number(10n), Number(20n), Number(30n)];
      let res = BigInt64Array.from(src as ArrayLike<number>, (v: number): BigInt => BigInt(v));
      src[0] = 88;
      expect(res[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_TWO_2400
     * @tc.name testBigInt64ArrayFromThreeTwo2400
     * @tc.desc Verify the created result has zero byteOffset for Array source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromThreeTwo2400', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL2, (): void => {
      let src: Array<BigInt> = [10n, 20n, 30n];
      let res = BigInt64Array.from(src);
      expect(res.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_TWO_2500
     * @tc.name testBigInt64ArrayFromThreeTwo2500
     * @tc.desc Verify from returns a BigInt64Array instance for Array source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromThreeTwo2500', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL2, (): void => {
      let src: Array<BigInt> = [10n, 20n, 30n];
      let res = BigInt64Array.from(src);
      expect(res instanceof BigInt64Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_TWO_2600
     * @tc.name testBigInt64ArrayFromThreeTwo2600
     * @tc.desc Verify the created result owns an ArrayBuffer for Array source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromThreeTwo2600', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL2, (): void => {
      let src: Array<BigInt> = [10n, 20n, 30n];
      let res = BigInt64Array.from(src);
      expect(res.buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_TWO_2700
     * @tc.name testBigInt64ArrayFromThreeTwo2700
     * @tc.desc Verify the created result joins to 10,20,30 for Array source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromThreeTwo2700', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL2, (): void => {
      let src: Array<BigInt> = [10n, 20n, 30n];
      let res = BigInt64Array.from(src);
      expect(res.join(',')).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_TWO_2800
     * @tc.name testBigInt64ArrayFromThreeTwo2800
     * @tc.desc Verify mapFn writes 0n to the first element for Array source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromThreeTwo2800', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL2, (): void => {
      let src: Array<BigInt> = [10n, 20n, 30n];
      let res = BigInt64Array.from(
        src,
        (v: BigInt): BigInt => {
          return 0n;
        }
      );
      expect(res[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_TWO_2900
     * @tc.name testBigInt64ArrayFromThreeTwo2900
     * @tc.desc Verify mapFn writes the max bigint to the second element for Array source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromThreeTwo2900', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL2, (): void => {
      let src: Array<BigInt> = [10n, 20n, 30n];
      let max = 9223372036854775807n;
      let res = BigInt64Array.from(
        src,
        (v: BigInt): BigInt => {
          return max;
        }
      );
      expect(res[1]).assertEqual(max);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_TWO_3000
     * @tc.name testBigInt64ArrayFromThreeTwo3000
     * @tc.desc Verify mapFn writes the min bigint to the third element for Array source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromThreeTwo3000', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL2, (): void => {
      let src: Array<BigInt> = [10n, 20n, 30n];
      let min = -9223372036854775807n - 1n;
      let res = BigInt64Array.from(
        src,
        (v: BigInt): BigInt => {
          return min;
        }
      );
      expect(res[2]).assertEqual(min);
    });

  });
}
