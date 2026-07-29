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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function typedUArraysForEach01(): void {
  describe('TypedUArraysForEach01', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_0100
     * @tc.name testTypedUArraysForEach001
     * @tc.desc Verify forEach TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      try {
        arr.forEach((v) => {
          if (v >= 0) {
            throw new TypeError('not a function');
          }
        });
        expect(true).assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_0200
     * @tc.name testTypedUArraysForEach002
     * @tc.desc Verify (callbackfn) forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const collected: number[] = [];
      arr.forEach((v) => { collected.push(v); });
      expect(collected.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_0300

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_0400

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_0500

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_0600
     * @tc.name testTypedUArraysForEach006
     * @tc.desc Verify callbackfn TypeError Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      try {
        arr.forEach((v) => {
          if (v >= 0) {
            throw new TypeError('not a function');
          }
        });
        expect(true).assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_0700
     * @tc.name testTypedUArraysForEach007
     * @tc.desc Verify callbackfn TypeError Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      try {
        arr.forEach((v) => {
          if (v >= 0) {
            throw new TypeError('not a function');
          }
        });
        expect(true).assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_0800
     * @tc.name testTypedUArraysForEach008
     * @tc.desc Verify callbackfn TypeError Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.forEach((v) => {
          if (v >= 0) {
            throw new TypeError('not a function');
          }
        });
        expect(true).assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_0900
     * @tc.name testTypedUArraysForEach009
     * @tc.desc Verify callbackfn TypeError BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      try {
        arr.forEach((v) => {
          if (v >= 0n) {
            throw new TypeError('not a function');
          }
        });
        expect(true).assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_1000

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_1100
     * @tc.name testTypedUArraysForEach011
     * @tc.desc Verify thisArg null callbackfn Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      const collected: number[] = [];
      arr.forEach((v) => { collected.push(v); });
      expect(collected.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_1200
     * @tc.name testTypedUArraysForEach012
     * @tc.desc Verify thisArg Double callbackfn this Number Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      arr.forEach((v) => {
        expect(typeof v === 'number').assertTrue();
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_1300

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_1400
     * @tc.name testTypedUArraysForEach014
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40, 50]);
      const collected: number[] = [];
      arr.forEach((v) => { collected.push(v); });
      const val0 = collected[0];
      expect(val0).assertEqual(10);
      const val1 = collected[1];
      expect(val1).assertEqual(20);
      const val2 = collected[2];
      expect(val2).assertEqual(30);
      const val3 = collected[3];
      expect(val3).assertEqual(40);
      const val4 = collected[4];
      expect(val4).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_1500
     * @tc.name testTypedUArraysForEach015
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let sum: number = 0;
      arr.forEach((v) => {
        sum += v;
      });
      expect(sum).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_1600
     * @tc.name testTypedUArraysForEach016
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false;
      const arr = new Uint8Array([]);
      arr.forEach((v) => {
        if (v >= 0) {
          called = true;
        }
      });
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_1700
     * @tc.name testTypedUArraysForEach017
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const collected: number[] = [];
      arr.forEach((v) => { collected.push(v); });
      const val5 = collected[0];
      expect(val5).assertEqual(100);
      const val6 = collected[1];
      expect(val6).assertEqual(200);
      const val7 = collected[2];
      expect(val7).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_1800
     * @tc.name testTypedUArraysForEach018
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called = false;
      const arr = new Uint16Array([]);
      arr.forEach((v) => {
        if (v >= 0) {
          called = true;
        }
      });
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_1900
     * @tc.name testTypedUArraysForEach019
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const collected: number[] = [];
      arr.forEach((v) => { collected.push(v); });
      const val8 = collected[0];
      expect(val8).assertEqual(1000);
      const val9 = collected[1];
      expect(val9).assertEqual(2000);
      const val10 = collected[2];
      expect(val10).assertEqual(3000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_2000
     * @tc.name testTypedUArraysForEach020
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called = false;
      const arr = new Uint32Array([]);
      arr.forEach((v) => {
        if (v >= 0) {
          called = true;
        }
      });
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_2100
     * @tc.name testTypedUArraysForEach021
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 128, 255]);
      const collected: number[] = [];
      arr.forEach((v) => { collected.push(v); });
      const val11 = collected[0];
      expect(val11).assertEqual(0);
      const val12 = collected[1];
      expect(val12).assertEqual(128);
      const val13 = collected[2];
      expect(val13).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_2200
     * @tc.name testTypedUArraysForEach022
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called = false;
      const arr = new Uint8ClampedArray([]);
      arr.forEach((v) => {
        if (v >= 0) {
          called = true;
        }
      });
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_2300
     * @tc.name testTypedUArraysForEach023
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let sum = 0n;
      arr.forEach((v) => {
        sum += v;
      });
      expect(sum).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_2400
     * @tc.name testTypedUArraysForEach024
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called = false;
      const arr = new BigUint64Array([]);
      arr.forEach((v) => {
        if (v >= 0n) {
          called = true;
        }
      });
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_2500
     * @tc.name testTypedUArraysForEach025
     * @tc.desc Verify callbackfn value Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      arr.forEach((v, idx) => {
        expect(v).assertEqual(arr[idx.toInt()]);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_2600
     * @tc.name testTypedUArraysForEach026
     * @tc.desc Verify callbackfn value Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      arr.forEach((v, idx) => {
        expect(v).assertEqual(arr[idx.toInt()]);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_2700
     * @tc.name testTypedUArraysForEach027
     * @tc.desc Verify callbackfn value Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      arr.forEach((v, idx) => {
        expect(v).assertEqual(arr[idx.toInt()]);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_2800
     * @tc.name testTypedUArraysForEach028
     * @tc.desc Verify callbackfn value Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 128, 255]);
      arr.forEach((v, idx) => {
        expect(v).assertEqual(arr[idx.toInt()]);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_2900
     * @tc.name testTypedUArraysForEach029
     * @tc.desc Verify callbackfn value BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      arr.forEach((v, idx) => {
        expect(v).assertEqual(arr[idx.toInt()]);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_3000
     * @tc.name testTypedUArraysForEach030
     * @tc.desc Verify index 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40]);
      let expectedIdx = 0;
      arr.forEach((v, idx) => {
        expect(idx).assertEqual(expectedIdx);
        expectedIdx++;
      });
      expect(expectedIdx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_3100
     * @tc.name testTypedUArraysForEach031
     * @tc.desc Verify index 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30]);
      let expectedIdx = 0;
      arr.forEach((v, idx) => {
        expect(idx).assertEqual(expectedIdx);
        expectedIdx++;
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_3200
     * @tc.name testTypedUArraysForEach032
     * @tc.desc Verify index 0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let expectedIdx = 0;
      arr.forEach((v, idx) => {
        expect(idx).assertEqual(expectedIdx);
        expectedIdx++;
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_3300
     * @tc.name testTypedUArraysForEach033
     * @tc.desc Verify array Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      arr.forEach((v, idx, array) => {
        expect(array).assertEqual(arr);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_3400
     * @tc.name testTypedUArraysForEach034
     * @tc.desc Verify array Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      arr.forEach((v, idx, array) => {
        expect(array).assertEqual(arr);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_3500
     * @tc.name testTypedUArraysForEach035
     * @tc.desc Verify array Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      arr.forEach((v, idx, array) => {
        expect(array).assertEqual(arr);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_3600
     * @tc.name testTypedUArraysForEach036
     * @tc.desc Verify array Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.forEach((v, idx, array) => {
        expect(array).assertEqual(arr);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_3700
     * @tc.name testTypedUArraysForEach037
     * @tc.desc Verify array BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      arr.forEach((v, idx, array) => {
        expect(array).assertEqual(arr);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_3800
     * @tc.name testTypedUArraysForEach038
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const results: number[] = [];
      try {
        arr.forEach((v, idx) => {
          results.push(v);
          if (idx === 0) {
            throw new TypeError('stop iteration');
          }
        });
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        expect(results.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_3900
     * @tc.name testTypedUArraysForEach039
     * @tc.desc Verify 0 forEach Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2]);
      let hasZero = false;
      arr.forEach((v) => {
        if (v === 0) hasZero = true;
      });
      expect(hasZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_4000
     * @tc.name testTypedUArraysForEach040
     * @tc.desc Verify 255 forEach Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([254, 255, 0]);
      let maxVal: number = 0;
      arr.forEach((v) => {
        if (v > maxVal) maxVal = v;
      });
      expect(maxVal).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_4100
     * @tc.name testTypedUArraysForEach041
     * @tc.desc Verify 65535 forEach Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535, 0, 100]);
      let maxVal: number = 0;
      arr.forEach((v) => {
        if (v > maxVal) maxVal = v;
      });
      expect(maxVal).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_4200
     * @tc.name testTypedUArraysForEach042
     * @tc.desc Verify 4294967295 forEach Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 0]);
      arr.forEach((v) => {
        expect(v === 4294967295 || v === 0).assertTrue();
      });
    });

  });
}
