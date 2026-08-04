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

export default function BigInt64ArrayFind02Test(): void {
  describe('BigInt64ArrayFind02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_0100
     * @tc.name testBigInt64ArrayFindTwo0100
     * @tc.desc Verify `arr.find((v, idx, a) => { count++; return idx === 8; })` produces a result where `count` equals `9`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n]);
      let count = 0;
      arr.find((v: bigint, idx: int, a: BigInt64Array) => {
        count++;
        return idx === 8;
      });
      expect(count).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_0200
     * @tc.name testBigInt64ArrayFindTwo0200
     * @tc.desc Verify `arr.find((v, idx, a) => { count++; return idx === 9; })` produces a result where `count` equals `10`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n]);
      let count = 0;
      arr.find((v: bigint, idx: int, a: BigInt64Array) => {
        count++;
        return idx === 9;
      });
      expect(count).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_0300
     * @tc.name testBigInt64ArrayFindTwo0300
     * @tc.desc Verify `arr.find((v) => true)` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let res = arr.find((v: bigint) => true);
      expect(res).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_0400
     * @tc.name testBigInt64ArrayFindTwo0400
     * @tc.desc Verify `arr.find((v) => { called = true; return true; })` produces a result where `called` is false, `arr.find((v) => { called = true; return true; })` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let called = false;
      let res = arr.find((v: bigint) => {
        called = true;
        return true;
      });
      expect(called).assertEqual(false);
      expect(res).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_0500
     * @tc.name testBigInt64ArrayFindTwo0500
     * @tc.desc Verify `arr.find((v, i, a) => { if (i === 1) throw 'ErrorStr'; return false; });` throws a non-null error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      try {
        arr.find((v: bigint, i: int, a: BigInt64Array) => {
          if (i === 1) throw new Error('ErrorStr');
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_0600
     * @tc.name testBigInt64ArrayFindTwo0600
     * @tc.desc Verify `arr.find((v, i, a) => { if (i === 1) throw new Error('msg'); return false; });` throws a non-null error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      try {
        arr.find((v: bigint, i: int, a: BigInt64Array) => {
          if (i === 1) throw new Error('msg');
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_0700
     * @tc.name testBigInt64ArrayFindTwo0700
     * @tc.desc Verify `arr.find((v, i, a) => { if (i === 1) throw new TypeError('msg'); return false; });` throws a non-null error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      try {
        arr.find((v: bigint, i: int, a: BigInt64Array) => {
          if (i === 1) throw new TypeError('msg');
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_0800
     * @tc.name testBigInt64ArrayFindTwo0800
     * @tc.desc Verify `arr.find((v, i, a) => { if (i === 1) throw new RangeError('msg'); return false; });` throws a non-null error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      try {
        arr.find((v: bigint, i: int, a: BigInt64Array) => {
          if (i === 1) throw new RangeError('msg');
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_0900
     * @tc.name testBigInt64ArrayFindTwo0900
     * @tc.desc Verify `arr.find((v, i, a) => { if (i === 1) throw 404; return false; });` throws a non-null error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      try {
        arr.find((v: bigint, i: int, a: BigInt64Array) => {
          if (i === 1) throw new Error('404');
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_1000
     * @tc.name testBigInt64ArrayFindTwo1000
     * @tc.desc Verify `arr.find((v, i, a) => { if (i === 1) throw true; return false; });` throws a non-null error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      try {
        arr.find((v: bigint, i: int, a: BigInt64Array) => {
          if (i === 1) throw new Error('true');
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_1100
     * @tc.name testBigInt64ArrayFindTwo1100
     * @tc.desc Verify `arr.find((v, idx, a) => { if (idx === 0) { a.$_set(0, 99n); } return v === 10n; })` equals `10n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.find((v: bigint, idx: int, a: BigInt64Array) => {
        if (idx === 0) {
          a.$_set(0, 99n);
        }
        return v === 10n;
      });
      expect(res).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_1200
     * @tc.name testBigInt64ArrayFindTwo1200
     * @tc.desc Verify `arr.find((v, idx, a) => { if (idx === 0) { a.$_set(0, 99n); } return v === 99n; })` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.find((v: bigint, idx: int, a: BigInt64Array) => {
        if (idx === 0) {
          a.$_set(0, 99n);
        }
        return v === 99n;
      });
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_1300
     * @tc.name testBigInt64ArrayFindTwo1300
     * @tc.desc Verify `arr.find((v, idx, a) => { if (idx === 1) { a.$_set(1, 99n); } return v === 20n; })` equals `20n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.find((v: bigint, idx: int, a: BigInt64Array) => {
        if (idx === 1) {
          a.$_set(1, 99n);
        }
        return v === 20n;
      });
      expect(res).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_1400
     * @tc.name testBigInt64ArrayFindTwo1400
     * @tc.desc Verify `arr.find((v, idx, a) => { if (idx === 0) { a.$_set(1, 99n); } return v === 99n; })` equals `99n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.find((v: bigint, idx: int, a: BigInt64Array) => {
        if (idx === 0) {
          a.$_set(1, 99n);
        }
        return v === 99n;
      });
      expect(res).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_1500
     * @tc.name testBigInt64ArrayFindTwo1500
     * @tc.desc Verify `arr.find((v, idx, a) => { if (idx === 2) { a.$_set(2, 99n); } return v === 30n; })` equals `30n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.find((v: bigint, idx: int, a: BigInt64Array) => {
        if (idx === 2) {
          a.$_set(2, 99n);
        }
        return v === 30n;
      });
      expect(res).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_1600
     * @tc.name testBigInt64ArrayFindTwo1600
     * @tc.desc Verify `arr.find((v, idx, a) => { if (idx === 0) { a.$_set(2, 99n); } return v === 99n; })` equals `99n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.find((v: bigint, idx: int, a: BigInt64Array) => {
        if (idx === 0) {
          a.$_set(2, 99n);
        }
        return v === 99n;
      });
      expect(res).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_1700
     * @tc.name testBigInt64ArrayFindTwo1700
     * @tc.desc Verify `arr.find((v, idx, a) => { if (idx === 3) { a.$_set(3, 99n); } return v === 40n; })` equals `40n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.find((v: bigint, idx: int, a: BigInt64Array) => {
        if (idx === 3) {
          a.$_set(3, 99n);
        }
        return v === 40n;
      });
      expect(res).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_1800
     * @tc.name testBigInt64ArrayFindTwo1800
     * @tc.desc Verify `arr.find((v, idx, a) => { if (idx === 0) { a.$_set(3, 99n); } return v === 99n; })` equals `99n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.find((v: bigint, idx: int, a: BigInt64Array) => {
        if (idx === 0) {
          a.$_set(3, 99n);
        }
        return v === 99n;
      });
      expect(res).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_1900
     * @tc.name testBigInt64ArrayFindTwo1900
     * @tc.desc Verify `arr.find((v, idx, a) => { if (idx === 4) { a.$_set(4, 99n); } return v === 50n; })` equals `50n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.find((v: bigint, idx: int, a: BigInt64Array) => {
        if (idx === 4) {
          a.$_set(4, 99n);
        }
        return v === 50n;
      });
      expect(res).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_2000
     * @tc.name testBigInt64ArrayFindTwo2000
     * @tc.desc Verify `arr.find((v, idx, a) => { if (idx === 0) { a.$_set(4, 99n); } return v === 99n; })` equals `99n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.find((v: bigint, idx: int, a: BigInt64Array) => {
        if (idx === 0) {
          a.$_set(4, 99n);
        }
        return v === 99n;
      });
      expect(res).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_2100
     * @tc.name testBigInt64ArrayFindTwo2100
     * @tc.desc Verify `arr.find((v) => v === factor)` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
      let factor = 0n;
      let res = arr.find((v: bigint) => v === factor);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_2200
     * @tc.name testBigInt64ArrayFindTwo2200
     * @tc.desc Verify find on an empty BigInt64Array returns undefined without invoking the predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(0);
      let calls = 0;
      let res = arr.find((_v: bigint): boolean => {
        calls++;
        return true;
      });
      expect(res).assertEqual(undefined);
      expect(calls).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_2300
     * @tc.name testBigInt64ArrayFindTwo2300
     * @tc.desc Verify a no-match predicate visits the complete array and returns undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 3n, 5n, 7n]);
      let calls = 0;
      let res = arr.find((v: bigint): boolean => {
        calls++;
        return v % 2n === 0n;
      });
      expect(res).assertEqual(undefined);
      expect(calls).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_2400
     * @tc.name testBigInt64ArrayFindTwo2400
     * @tc.desc Verify find returns the first repeated match and stops before later duplicates.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 7n, 7n, 7n]);
      let calls = 0;
      let res = arr.find((v: bigint): boolean => {
        calls++;
        return v === 7n;
      });
      expect(res).assertEqual(7n);
      expect(calls).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_2500
     * @tc.name testBigInt64ArrayFindTwo2500
     * @tc.desc Verify the callback index can select the final element independently of its value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let res = arr.find((_v: bigint, idx: int): boolean => idx === arr.length - 1);
      expect(res).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_2600
     * @tc.name testBigInt64ArrayFindTwo2600
     * @tc.desc Verify the callback receives the original typed array instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([12n, 24n, 36n]);
      let receivedSameArray = false;
      let res = arr.find((v: bigint, _idx: int, array: BigInt64Array): boolean => {
        receivedSameArray = array === arr;
        return v === 24n;
      });
      expect(res).assertEqual(24n);
      expect(receivedSameArray).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_2700
     * @tc.name testBigInt64ArrayFindTwo2700
     * @tc.desc Verify find returns the first value below a negative threshold.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-2n, -8n, -10n, 4n]);
      let res = arr.find((v: bigint): boolean => v < -5n);
      expect(res).assertEqual(-8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_2800
     * @tc.name testBigInt64ArrayFindTwo2800
     * @tc.desc Verify find observes signed wrapping of a value above the int64 maximum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775808n, 1n]);
      let res = arr.find((v: bigint): boolean => v < 0n);
      expect(res).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_2900
     * @tc.name testBigInt64ArrayFindTwo2900
     * @tc.desc Verify find on a non-zero-offset view searches only visible elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(40);
      let root = new BigInt64Array(buffer);
      root.set([5n, 10n, 15n, 20n, 25n]);
      let view = new BigInt64Array(buffer, 16, 2);
      let res = view.find((v: bigint): boolean => v % 10n === 0n);
      expect(res).assertEqual(20n);
      expect(view.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_3000
     * @tc.name testBigInt64ArrayFindTwo3000
     * @tc.desc Verify find observes a value written by set before the search starts.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 6n, 9n, 12n]);
      arr.set(2, 99n);
      let res = arr.find((v: bigint): boolean => v > 50n);
      expect(res).assertEqual(99n);
      expect(arr[2]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_3100
     * @tc.name testBigInt64ArrayFindTwo3100
     * @tc.desc Verify `arr.find((v) => v === 9223372036854775807n)` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let res = arr.find((v: bigint) => v === 9223372036854775807n);
      expect(res).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_3200
     * @tc.name testBigInt64ArrayFindTwo3200
     * @tc.desc Verify `arr.find((v, idx) => idx === 0 && v === 9223372036854775807n)` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 1n]);
      let res = arr.find((v: bigint, idx: int) => idx === 0 && v === 9223372036854775807n);
      expect(res).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_3300
     * @tc.name testBigInt64ArrayFindTwo3300
     * @tc.desc Verify `arr.find((v) => v === -9223372036854775808n)` equals `-9223372036854775808n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n]);
      let res = arr.find((v: bigint) => v === -9223372036854775807n - 1n);
      expect(res).assertEqual(-9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_3400
     * @tc.name testBigInt64ArrayFindTwo3400
     * @tc.desc Verify `arr.find((v, idx) => idx === 0 && v === -9223372036854775808n)` equals `-9223372036854775808n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n, 1n]);
      let res = arr.find((v: bigint, idx: int) => idx === 0 && v === -9223372036854775807n - 1n);
      expect(res).assertEqual(-9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_TWO_3500
     * @tc.name testBigInt64ArrayFindTwo3500
     * @tc.desc Verify `arr.find((v) => v === 0n)` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindTwo3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let res = arr.find((v: bigint) => v === 0n);
      expect(res).assertEqual(0n);
    });

  });
}
