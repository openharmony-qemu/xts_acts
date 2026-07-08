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
import Utils from './../Util.test';

export default function BigInt64ArrayForEach02Test(): void {
  describe('BigInt64ArrayForEach02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_0100
     * @tc.name testBigInt64ArrayForEachTwo0100
     * @tc.desc Verify forEach keeps an empty array length at 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      arr.forEach((val, idx, a) => {});
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_0200
     * @tc.name testBigInt64ArrayForEachTwo0200
     * @tc.desc Verify forEach keeps a single 0n element unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      arr.forEach((val, idx, a) => {});
      expect(arr[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_0300
     * @tc.name testBigInt64ArrayForEachTwo0300
     * @tc.desc Verify forEach keeps the maximum bigint element unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      arr.forEach((val, idx, a) => {});
      expect(arr[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_0400
     * @tc.name testBigInt64ArrayForEachTwo0400
     * @tc.desc Verify forEach keeps the minimum bigint element unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n]);
      arr.forEach((val, idx, a) => {});
      expect(arr[0]).assertEqual(-9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_0500
     * @tc.name testBigInt64ArrayForEachTwo0500
     * @tc.desc Verify forEach keeps increasing elements in the same order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.forEach((val, idx, a) => {});
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_0600
     * @tc.name testBigInt64ArrayForEachTwo0600
     * @tc.desc Verify read-only callback access keeps one positive element unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([42n]);
      let visited = 0n;
      arr.forEach((val, idx, a) => {
        visited = val;
        return;
      });
      expect(visited).assertEqual(42n);
      expect(arr[0]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_0700
     * @tc.name testBigInt64ArrayForEachTwo0700
     * @tc.desc Verify accumulating callback state does not change elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let sum = 0n;
      arr.forEach((val, idx, a) => {
        sum += val;
      });
      expect(sum).assertEqual(30n);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_0800
     * @tc.name testBigInt64ArrayForEachTwo0800
     * @tc.desc Verify mixed boundary elements stay unchanged after forEach.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, -9223372036854775807n - 1n, 0n]);
      arr.forEach((val, idx, a) => {});
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[1]).assertEqual(-9223372036854775807n - 1n);
      expect(arr[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_0900
     * @tc.name testBigInt64ArrayForEachTwo0900
     * @tc.desc Verify forEach keeps single positive array length at 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n]);
      arr.forEach((val, idx, a) => {});
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_1000
     * @tc.name testBigInt64ArrayForEachTwo1000
     * @tc.desc Verify forEach keeps three positive elements length at 3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      arr.forEach((val, idx, a) => {});
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_1100
     * @tc.name testBigInt64ArrayForEachTwo1100
     * @tc.desc Verify forEach keeps repeated-value array length at 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 5n, 5n, 5n]);
      arr.forEach((val, idx, a) => {});
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_1200
     * @tc.name testBigInt64ArrayForEachTwo1200
     * @tc.desc Verify forEach keeps two zero elements length at 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n]);
      arr.forEach((val, idx, a) => {});
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_1300
     * @tc.name testBigInt64ArrayForEachTwo1300
     * @tc.desc Verify thrown callback error does not change length 3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let caught = false;
      try {
        arr.forEach((val, idx, a) => {
          if (val === 2n) {
            throw new Error("break");
          }
        });
      } catch (e) {
        caught = true;
        expect(arr.length).assertEqual(3);
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_1400
     * @tc.name testBigInt64ArrayForEachTwo1400
     * @tc.desc Verify thrown callback error does not change length 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9n]);
      let caught = false;
      try {
        arr.forEach((val, idx, a) => {
          throw new Error("dummy");
        });
      } catch (e) {
        caught = true;
        expect(arr.length).assertEqual(1);
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_1500
     * @tc.name testBigInt64ArrayForEachTwo1500
     * @tc.desc Verify five-element array length stays 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      arr.forEach((v) => {});
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_1600
     * @tc.name testBigInt64ArrayForEachTwo1600
     * @tc.desc Verify mixed-radix six-element array length stays 6.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, -5n, 6n]);
      arr.forEach((v) => {});
      expect(arr.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_1700
     * @tc.name testBigInt64ArrayForEachTwo1700
     * @tc.desc Verify empty array length stays 0 inside try path.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      arr.forEach((val, idx, a) => {
        throw new Error();
      });
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_1800
     * @tc.name testBigInt64ArrayForEachTwo1800
     * @tc.desc Verify empty array byteLength stays 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      arr.forEach((val, idx, a) => {});
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_1900
     * @tc.name testBigInt64ArrayForEachTwo1900
     * @tc.desc Verify single positive element byteLength stays 8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n]);
      arr.forEach((val, idx, a) => {});
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_2000
     * @tc.name testBigInt64ArrayForEachTwo2000
     * @tc.desc Verify maximum-value element byteLength stays 8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      arr.forEach((val, idx, a) => {});
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_2100
     * @tc.name testBigInt64ArrayForEachTwo2100
     * @tc.desc Verify minimum-value element byteLength stays 8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n]);
      arr.forEach((val, idx, a) => {});
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_2200
     * @tc.name testBigInt64ArrayForEachTwo2200
     * @tc.desc Verify two-element array byteLength stays 16.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      arr.forEach((val, idx, a) => {});
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_2300
     * @tc.name testBigInt64ArrayForEachTwo2300
     * @tc.desc Verify three-element array byteLength stays 24.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.forEach((val, idx, a) => {});
      expect(arr.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_2400
     * @tc.name testBigInt64ArrayForEachTwo2400
     * @tc.desc Verify five-element mixed array byteLength stays 40.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 255n, -2n, 7n, 1n]);
      arr.forEach((val, idx, a) => {});
      expect(arr.byteLength).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_2500
     * @tc.name testBigInt64ArrayForEachTwo2500
     * @tc.desc Verify thrown callback error does not change byteLength 8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([50n]);
      let caught = false;
      try {
        arr.forEach((val, idx, a) => {
          throw new Error();
        });
      } catch (e) {
        caught = true;
        expect(arr.byteLength).assertEqual(8);
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_2600
     * @tc.name testBigInt64ArrayForEachTwo2600
     * @tc.desc Verify callback reads do not change byteLength 16.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let len = 0;
      arr.forEach((val, idx, a) => {
        len = a.byteLength;
      });
      expect(len).assertEqual(16);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_2700
     * @tc.name testBigInt64ArrayForEachTwo2700
     * @tc.desc Verify empty array keeps the same buffer reference.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let buf1 = arr.buffer;
      arr.forEach((v) => {});
      let buf2 = arr.buffer;
      expect(buf1).assertEqual(buf2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_2800
     * @tc.name testBigInt64ArrayForEachTwo2800
     * @tc.desc Verify max-value array keeps the same buffer reference.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let buf1 = arr.buffer;
      arr.forEach((v) => {});
      expect(arr.buffer).assertEqual(buf1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_2900
     * @tc.name testBigInt64ArrayForEachTwo2900
     * @tc.desc Verify min-value array keeps the same buffer reference.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n]);
      let buf1 = arr.buffer;
      arr.forEach((v) => {});
      expect(arr.buffer).assertEqual(buf1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_3000
     * @tc.name testBigInt64ArrayForEachTwo3000
     * @tc.desc Verify two-element array keeps buffer.byteLength at 16.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n]);
      arr.forEach((v) => {});
      expect(arr.buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_3100
     * @tc.name testBigInt64ArrayForEachTwo3100
     * @tc.desc Verify three-element array keeps buffer.byteLength at 24.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n, 33n]);
      arr.forEach((v) => {});
      expect(arr.buffer.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_3200
     * @tc.name testBigInt64ArrayForEachTwo3200
     * @tc.desc Verify buffer-backed view keeps byteOffset 8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr = new BigInt64Array(buf, 8, 1);
      arr.forEach((v) => {});
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_3300
     * @tc.name testBigInt64ArrayForEachTwo3300
     * @tc.desc Verify buffer-backed view keeps byteOffset 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr = new BigInt64Array(buf, 0, 1);
      arr.forEach((v) => {});
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_3400
     * @tc.name testBigInt64ArrayForEachTwo3400
     * @tc.desc Verify external buffer view keeps byteOffset 16.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let arr = new BigInt64Array(buf, 16, 1);
      arr.forEach((v) => {});
      expect(arr.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_3500
     * @tc.name testBigInt64ArrayForEachTwo3500
     * @tc.desc Verify exception flow keeps view byteOffset 8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr = new BigInt64Array(buf, 8, 1);
      let caught = false;
      try {
        arr.forEach((v) => {
          throw new Error();
        });
      } catch (e) {
        caught = true;
      }
      expect(caught).assertTrue();
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_3600
     * @tc.name testBigInt64ArrayForEachTwo3600
     * @tc.desc Verify two-element view keeps byteOffset 8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let arr = new BigInt64Array(buf, 8, 2);
      arr.forEach((v) => {});
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_3700
     * @tc.name testBigInt64ArrayForEachTwo3700
     * @tc.desc Verify zero-offset two-element view keeps byteOffset 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr = new BigInt64Array(buf, 0, 2);
      arr.forEach((v) => {});
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_3800
     * @tc.name testBigInt64ArrayForEachTwo3800
     * @tc.desc Verify exception flow keeps default byteOffset 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let caught = false;
      try {
        arr.forEach((v) => {
          throw new Error();
        });
      } catch (e) {
        caught = true;
      }
      expect(caught).assertTrue();
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_3900
     * @tc.name testBigInt64ArrayForEachTwo3900
     * @tc.desc Verify single-element array remains a BigInt64Array instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      arr.forEach((v) => {});
      expect(arr instanceof BigInt64Array).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_4000
     * @tc.name testBigInt64ArrayForEachTwo4000
     * @tc.desc Verify multi-element array remains a BigInt64Array instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      arr.forEach((v) => {});
      expect(arr instanceof BigInt64Array).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_4100
     * @tc.name testBigInt64ArrayForEachTwo4100
     * @tc.desc Verify empty array remains a BigInt64Array instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      arr.forEach((v) => {});
      expect(arr instanceof BigInt64Array).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_4200
     * @tc.name testBigInt64ArrayForEachTwo4200
     * @tc.desc Verify shared buffer data stays visible in sibling view B.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let a = new BigInt64Array(buf);
      let b = new BigInt64Array(buf);
      a[0] = 55n;
      a[1] = 66n;
      a.forEach((val) => {});
      expect(b[0]).assertEqual(55n);
      expect(b[1]).assertEqual(66n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_4300
     * @tc.name testBigInt64ArrayForEachTwo4300
     * @tc.desc Verify front-view traversal does not change tail view data.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let a = new BigInt64Array(buf, 0, 2);
      let b = new BigInt64Array(buf, 16, 2);
      b[0] = 77n;
      a.forEach((val) => {});
      expect(b[0]).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_4400
     * @tc.name testBigInt64ArrayForEachTwo4400
     * @tc.desc Verify full-view traversal keeps sliced sibling max value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let a = new BigInt64Array(buf);
      a[1] = 9223372036854775807n;
      let b = new BigInt64Array(buf, 8, 1);
      a.forEach((val) => {});
      expect(b[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_4500
     * @tc.name testBigInt64ArrayForEachTwo4500
     * @tc.desc Verify thrown callback error keeps sibling min value intact.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let a = new BigInt64Array(buf);
      let b = new BigInt64Array(buf, 8, 1);
      b[0] = -9223372036854775807n - 1n;
      let caught = false;
      try {
        a.forEach((val) => {
          throw new Error();
        });
      } catch (e) {
        caught = true;
      }
      expect(caught).assertTrue();
      expect(b[0]).assertEqual(-9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_4600
     * @tc.name testBigInt64ArrayForEachTwo4600
     * @tc.desc Verify full-range traversal keeps peer negative value intact.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let a = new BigInt64Array(buf);
      a[0] = -1n;
      let b = new BigInt64Array(buf, 0, 1);
      a.forEach((val) => {});
      expect(b[0]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_4700
     * @tc.name testBigInt64ArrayForEachTwo4700
     * @tc.desc Verify separate single-element views keep untouched third data.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let a = new BigInt64Array(buf, 0, 1);
      let b = new BigInt64Array(buf, 8, 1);
      let c = new BigInt64Array(buf, 16, 1);
      a[0] = 1n;
      b[0] = 2n;
      c[0] = 3n;
      a.forEach((val) => {});
      b.forEach((val) => {});
      expect(c[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_4800
     * @tc.name testBigInt64ArrayForEachTwo4800
     * @tc.desc Verify head-view traversal does not affect far-tail data.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(80);
      let a = new BigInt64Array(buf, 0, 1);
      let b = new BigInt64Array(buf, 72, 1);
      b[0] = 100n;
      a.forEach((val) => {});
      expect(b[0]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_4900
     * @tc.name testBigInt64ArrayForEachTwo4900
     * @tc.desc Verify nested forEach calls keep source elements unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([40n, 50n]);
      arr.forEach((val1, idx1, a1) => {
        arr.forEach((val2, idx2, a2) => {});
      });
      expect(arr[0]).assertEqual(40n);
      expect(arr[1]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_5000
     * @tc.name testBigInt64ArrayForEachTwo5000
     * @tc.desc Verify taking a slice inside callback does not change length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -1n]);
      let copied = new BigInt64Array([]);
      arr.forEach((val) => {
        copied = arr.slice();
      });
      expect(copied.length).assertEqual(2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_5100
     * @tc.name testBigInt64ArrayForEachTwo5100
     * @tc.desc Verify separate arrays with the same max value stay equal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new BigInt64Array([9223372036854775807n]);
      let b = new BigInt64Array([9223372036854775807n]);
      a.forEach((val) => {});
      b.forEach((val) => {});
      expect(a[0]).assertEqual(b[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_5200
     * @tc.name testBigInt64ArrayForEachTwo5200
     * @tc.desc Verify nested traversal keeps each view byteOffset unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf1 = new ArrayBuffer(16);
      let buf2 = new ArrayBuffer(24);
      let a = new BigInt64Array(buf1, 8, 1);
      let b = new BigInt64Array(buf2, 16, 1);
      a.forEach((v) => {
        b.forEach((u) => {});
      });
      expect(a.byteOffset).assertEqual(8);
      expect(b.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_5300
     * @tc.name testBigInt64ArrayForEachTwo5300
     * @tc.desc Verify nested traversal keeps both array lengths unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new BigInt64Array([-1n]);
      let d = new BigInt64Array([15n, 16n]);
      d.forEach((v) => {
        c.forEach((u) => {});
      });
      expect(d.length).assertEqual(2);
      expect(c.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_5400
     * @tc.name testBigInt64ArrayForEachTwo5400
     * @tc.desc Verify repeated minimum values stay unchanged after traversal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n, -9223372036854775807n - 1n]);
      arr.forEach((val) => {});
      expect(arr[0]).assertEqual(-9223372036854775807n - 1n);
      expect(arr[1]).assertEqual(-9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOR_EACH_TWO_5500
     * @tc.name testBigInt64ArrayForEachTwo5500
     * @tc.desc Verify zero and positive elements stay unchanged after traversal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayForEachTwo5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n]);
      arr.forEach((val) => {});
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(1n);
    });
  });
}
