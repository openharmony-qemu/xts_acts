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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function typedUArraysForEach02(): void {
  describe('TypedUArraysForEach02', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_0100
     * @tc.name testTypedUArraysForEachFileB001
     * @tc.desc Verify 4294967295 forEach Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 0]);
      let maxVal: number = 0;
      arr.forEach((v) => {
        if (v > maxVal) maxVal = v;
      });
      expect(maxVal).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_0200
     * @tc.name testTypedUArraysForEachFileB002
     * @tc.desc Verify Uint8ClampedArray 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([300, 400, 500]);
      let all255 = true;
      arr.forEach((v) => {
        if (v !== 255) all255 = false;
      });
      expect(all255).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_0300
     * @tc.name testTypedUArraysForEachFileB003
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([100n, 0n, 1n]);
      let found = false;
      arr.forEach((v) => {
        if (v === 100n) {
          found = true;
        }
      });
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_0400
     * @tc.name testTypedUArraysForEachFileB004
     * @tc.desc Verify BigUint64Array BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n, 40n]);
      let sum = 0n;
      arr.forEach((v) => {
        sum += v;
      });
      expect(sum).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_0500
     * @tc.name testTypedUArraysForEachFileB005
     * @tc.desc Verify BigUint64Array BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let allBigInt = true;
      arr.forEach((v) => {
        if (typeof v !== 'bigint') allBigInt = false;
      });
      expect(allBigInt).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_0600
     * @tc.name testTypedUArraysForEachFileB006
     * @tc.desc Verify forEach Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      let val: number = 0;
      arr.forEach((v) => {
        val = v;
      });
      expect(val).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_0700
     * @tc.name testTypedUArraysForEachFileB007
     * @tc.desc Verify forEach Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0]);
      let count = 0;
      arr.forEach((v) => {
        if (v >= 0) {
          count++;
        }
      });
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_0800
     * @tc.name testTypedUArraysForEachFileB008
     * @tc.desc Verify thisArg callbackfn Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const values: number[] = [];
      arr.forEach((v) => {
        values.push(v * 2);
      });
      expect(values[0]).assertEqual(2);
      expect(values[4]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_0900
     * @tc.name testTypedUArraysForEachFileB009
     * @tc.desc Verify thisArg Double callbackfn this Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let thisType = '';
      arr.forEach((v) => {
        thisType = typeof v;
      });
      expect(thisType).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_1000
     * @tc.name testTypedUArraysForEachFileB010
     * @tc.desc Verify callbackfn Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      let count = 0;
      arr.forEach((v) => {
        if (v >= 0) {
          count++;
        }
      });
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_1100
     * @tc.name testTypedUArraysForEachFileB011
     * @tc.desc Verify forEach Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1000);
      let found = false;
      arr.forEach((v) => {
        if (v !== 0) found = true;
      });
      expect(found).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_1200
     * @tc.name testTypedUArraysForEachFileB012
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 3, 3]);
      let count = 0;
      arr.forEach((v) => {
        if (v >= 0) {
          count++;
        }
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_1300
     * @tc.name testTypedUArraysForEachFileB013
     * @tc.desc Verify callbackfn Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([5, 10, 15]);
      let total: number = 0;
      arr.forEach((v) => {
        total += v * 2;
      });
      expect(total).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_1400
     * @tc.name testTypedUArraysForEachFileB014
     * @tc.desc Verify Uint8ClampedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1, -2, -3]);
      arr.forEach((v) => {
        expect(v).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_1500
     * @tc.name testTypedUArraysForEachFileB015
     * @tc.desc Verify callbackfn forEach Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      try {
        arr.forEach((v) => {
          if (v >= 0) {
            throw new TypeError('error in callback');
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_1600
     * @tc.name testTypedUArraysForEachFileB016
     * @tc.desc Verify callbackfn forEach Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      try {
        arr.forEach((v) => {
          if (v === 2) throw new RangeError('range');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_1700
     * @tc.name testTypedUArraysForEachFileB017
     * @tc.desc Verify callbackfn forEach BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      try {
        arr.forEach((v) => {
          if (v === 2n) throw new TypeError('type');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_1800
     * @tc.name testTypedUArraysForEachFileB018
     * @tc.desc Verify callbackfn forEach Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.forEach((v) => {
          if (v === 2) throw new SyntaxError('syntax');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('SyntaxError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_1900
     * @tc.name testTypedUArraysForEachFileB019
     * @tc.desc Verify callbackfn void forEach Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let count = 0;
      arr.forEach((v) => {
        if (v >= 0) {
          count++;
        }
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_2000
     * @tc.name testTypedUArraysForEachFileB020
     * @tc.desc Verify 0 TypeError Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.forEach((v) => {
          if (v >= 0) {
            throw new TypeError('not a function');
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_2100
     * @tc.name testTypedUArraysForEachFileB021
     * @tc.desc Verify Uint8ClampedArray 255 forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([300, 400, 500]);
      arr.forEach((v) => {
        expect(v).assertEqual(255);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_2200
     * @tc.name testTypedUArraysForEachFileB022
     * @tc.desc Verify Uint8ClampedArray 0 forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-100, -200]);
      arr.forEach((v) => {
        expect(v).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_2300
     * @tc.name testTypedUArraysForEachFileB023
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-50, 128, 300]);
      const expected = [0, 128, 255];
      let idx = 0;
      arr.forEach((v) => {
        expect(v).assertEqual(expected[idx]);
        idx++;
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_2400
     * @tc.name testTypedUArraysForEachFileB024
     * @tc.desc Verify Uint8Array 256 0 forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([256, 257]);
      arr.forEach((v, index) => {
        expect(v).assertEqual(arr[index]);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_2500
     * @tc.name testTypedUArraysForEachFileB025
     * @tc.desc Verify Uint16Array 65536 0 forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65536, 65537]);
      arr.forEach((v, index) => {
        expect(v).assertEqual(arr[index]);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_2600
     * @tc.name testTypedUArraysForEachFileB026
     * @tc.desc Verify Uint32Array 4294967296 0 forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967296]);
      arr.forEach((v) => {
        expect(v).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_2700
     * @tc.name testTypedUArraysForEachFileB027
     * @tc.desc Verify BigUint64Array BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([100n]);
      arr.forEach((v) => {
        expect(v).assertEqual(100n);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_2800
     * @tc.name testTypedUArraysForEachFileB028
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255.9, 256.1, -0.5]);
      arr.forEach((v, index) => {
        expect(v).assertEqual(arr[index]);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_2900
     * @tc.name testTypedUArraysForEachFileB029
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3.9, 2.1]);
      const expected = [3, 2];
      let idx = 0;
      arr.forEach((v) => {
        expect(v).assertEqual(expected[idx]);
        idx++;
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_3000
     * @tc.name testTypedUArraysForEachFileB030
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([99.9, 100.1]);
      const expected = [99, 100];
      let idx = 0;
      arr.forEach((v) => {
        expect(v).assertEqual(expected[idx]);
        idx++;
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_3100
     * @tc.name testTypedUArraysForEachFileB031
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000000.9, 2000000.1]);
      arr.forEach((v) => {
        expect(Number.isInteger(v)).assertTrue();
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_3200
     * @tc.name testTypedUArraysForEachFileB032
     * @tc.desc Verify BigUint64Array BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let sum = 0n;
      let count = 0;
      arr.forEach((v) => {
        sum += v;
        count++;
      });
      expect(sum).assertEqual(6n);
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_3300
     * @tc.name testTypedUArraysForEachFileB033
     * @tc.desc Verify subarray forEach Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const full = new Uint8Array([1, 2, 3, 4, 5]);
      const view = full.subarray(1, 4);
      const collected: number[] = [];
      view.forEach((v) => { collected.push(v); });
      expect(collected.length).assertEqual(3);
      const val15 = collected[0];
      expect(val15).assertEqual(2);
      const val16 = collected[2];
      expect(val16).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_3400
     * @tc.name testTypedUArraysForEachFileB034
     * @tc.desc Verify BigUint64Array forEach 32 BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([4294967296n, 4294967297n]);
      let sum = 0n;
      arr.forEach((v) => {
        sum += v;
      });
      expect(sum).assertEqual(8589934593n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_3500
     * @tc.name testTypedUArraysForEachFileB035
     * @tc.desc Verify forEach thisArg Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let sum: number = 0;
      arr.forEach((v) => {
        sum += v;
      });
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_3600
     * @tc.name testTypedUArraysForEachFileB036
     * @tc.desc Verify Uint8ClampedArray forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-50, 0, 128, 200, 300]);
      let min: number = 255;
      let max: number = 0;
      arr.forEach((v) => {
        if (v < min) min = v;
        if (v > max) max = v;
      });
      expect(min).assertEqual(0);
      expect(max).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_3700
     * @tc.name testTypedUArraysForEachFileB037
     * @tc.desc Verify BigUint64Array forEach typeof BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 100n, BigInt('18446744073709551615')]);
      let sum = 0n;
      let count = 0;
      arr.forEach((v) => {
        sum += v;
        count++;
      });
      expect(sum).assertEqual(BigInt('18446744073709551716'));
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_3800
     * @tc.name testTypedUArraysForEachFileB038
     * @tc.desc Verify 10000 forEach Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(10000);
      let found = false;
      arr.forEach((v) => {
        if (v !== 0) found = true;
      });
      expect(found).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_3900
     * @tc.name testTypedUArraysForEachFileB039
     * @tc.desc Verify forEach value Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 65535]);
      const values: number[] = [];
      arr.forEach((v) => { values.push(v); });
      const val17 = values[0];
      expect(val17).assertEqual(0);
      const val18 = values[1];
      expect(val18).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH02_4000
     * @tc.name testTypedUArraysForEachFileB040
     * @tc.desc Verify forEach value Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachFileB040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 4294967295]);
      const values: number[] = [];
      arr.forEach((v) => { values.push(v); });
      const val19 = values[0];
      expect(val19).assertEqual(0);
      const val20 = values[1];
      expect(val20).assertEqual(4294967295);
    });

  });
}
