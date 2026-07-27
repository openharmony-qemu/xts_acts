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

export default function TypedUArraysEvery01Test(): void {

  describe('TypedUArraysEvery01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_0100
     * @tc.name testTypedUArraysEvery001
     * @tc.desc Verify every TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      try {
        arr.every((v) => {
          expect(typeof v).assertEqual(typeof v);
          throw new TypeError('not a function');
        });
        expect(true).assertFail();
      } catch (e) {
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_0200
     * @tc.name testTypedUArraysEvery002
     * @tc.desc Verify (predicate) every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_0300
     * @tc.name testTypedUArraysEvery003
     * @tc.desc Verify (predicate + thisArg) every thisArg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const minVal = 0;
      const result = arr.every((v) => {
        return v >= minVal;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_0400

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_0500
     * @tc.name testTypedUArraysEvery005
     * @tc.desc Verify predicate TypeError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      try {
        arr.every((v) => {
          expect(typeof v).assertEqual(typeof v);
          throw new TypeError('predicate error');
        });
        expect(true).assertFail();
      } catch (e) {
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_0600
     * @tc.name testTypedUArraysEvery006
     * @tc.desc Verify predicate TypeError Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      try {
        arr.every((v) => {
          expect(typeof v).assertEqual(typeof v);
          throw new TypeError('predicate error');
        });
        expect(true).assertFail();
      } catch (e) {
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_0700
     * @tc.name testTypedUArraysEvery007
     * @tc.desc Verify predicate TypeError Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      try {
        arr.every((v) => {
          expect(typeof v).assertEqual(typeof v);
          throw new TypeError('predicate error');
        });
        expect(true).assertFail();
      } catch (e) {
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_0800
     * @tc.name testTypedUArraysEvery008
     * @tc.desc Verify predicate TypeError Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.every((v) => {
          expect(typeof v).assertEqual(typeof v);
          throw new TypeError('predicate error');
        });
        expect(true).assertFail();
      } catch (e) {
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_0900
     * @tc.name testTypedUArraysEvery009
     * @tc.desc Verify predicate TypeError BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      try {
        arr.every((v) => {
          expect(typeof v).assertEqual(typeof v);
          throw new TypeError('predicate error');
        });
        expect(true).assertFail();
      } catch (e) {
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_1000

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_1100
     * @tc.name testTypedUArraysEvery011
     * @tc.desc Verify thisArg null every Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_1200
     * @tc.name testTypedUArraysEvery012
     * @tc.desc Verify thisArg Double predicate this Number Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_1300

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_1400
     * @tc.name testTypedUArraysEvery014
     * @tc.desc Verify true Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_1500
     * @tc.name testTypedUArraysEvery015
     * @tc.desc Verify false Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.every((v) => v > 100);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_1600
     * @tc.name testTypedUArraysEvery016
     * @tc.desc Verify every true Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_1700
     * @tc.name testTypedUArraysEvery017
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount = 0;
      const arr = new Uint8Array([0, 1, 2, 3]);
      const result = arr.every((v) => {
        callCount++;
        return v > 0;
      });
      expect(result).assertFalse();
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_1800
     * @tc.name testTypedUArraysEvery018
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount = 0;
      const arr = new Uint8Array([1, 2, 3, 4, 0]);
      const result = arr.every((v) => {
        callCount++;
        return v > 0;
      });
      expect(result).assertFalse();
      expect(callCount).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_1900
     * @tc.name testTypedUArraysEvery019
     * @tc.desc Verify true Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_2000
     * @tc.name testTypedUArraysEvery020
     * @tc.desc Verify false Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 50]);
      const result = arr.every((v) => v >= 100);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_2100
     * @tc.name testTypedUArraysEvery021
     * @tc.desc Verify every true Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_2200
     * @tc.name testTypedUArraysEvery022
     * @tc.desc Verify true Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_2300
     * @tc.name testTypedUArraysEvery023
     * @tc.desc Verify false Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 500]);
      const result = arr.every((v) => v >= 1000);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_2400
     * @tc.name testTypedUArraysEvery024
     * @tc.desc Verify every true Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_2500
     * @tc.name testTypedUArraysEvery025
     * @tc.desc Verify true Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 128, 255]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_2600
     * @tc.name testTypedUArraysEvery026
     * @tc.desc Verify false Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 128, 255]);
      const result = arr.every((v) => v > 255);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_2700
     * @tc.name testTypedUArraysEvery027
     * @tc.desc Verify every true Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_2800
     * @tc.name testTypedUArraysEvery028
     * @tc.desc Verify true BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 100n]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_2900
     * @tc.name testTypedUArraysEvery029
     * @tc.desc Verify false BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 0n, 100n]);
      const result = arr.every((v) => v > 0n);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_3000
     * @tc.name testTypedUArraysEvery030
     * @tc.desc Verify every true BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_3100
     * @tc.name testTypedUArraysEvery031
     * @tc.desc Verify BigUint64Array BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([100n, 200n, 300n]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_3200

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_3300
     * @tc.name testTypedUArraysEvery033
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, BigInt('18446744073709551615'), 1000n]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_3400
     * @tc.name testTypedUArraysEvery034
     * @tc.desc Verify predicate index Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const indices: number[] = [];
      arr.every((v, idx) => {
        expect(typeof v).assertEqual(typeof v);
        indices.push(idx);
        return true;
      });
      const val0 = indices[0];
      expect(val0).assertEqual(0);
      const val1 = indices[1];
      expect(val1).assertEqual(1);
      const val2 = indices[2];
      expect(val2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_3500
     * @tc.name testTypedUArraysEvery035
     * @tc.desc Verify predicate index Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30]);
      const indices: number[] = [];
      arr.every((v, idx) => {
        expect(typeof v).assertEqual(typeof v);
        indices.push(idx);
        return true;
      });
      const val0 = indices[0];
      expect(val0).assertEqual(0);
      const val1 = indices[1];
      expect(val1).assertEqual(1);
      const val2 = indices[2];
      expect(val2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_3600
     * @tc.name testTypedUArraysEvery036
     * @tc.desc Verify predicate index Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([10, 20, 30]);
      const indices: number[] = [];
      arr.every((v, idx) => {
        expect(typeof v).assertEqual(typeof v);
        indices.push(idx);
        return true;
      });
      const val0 = indices[0];
      expect(val0).assertEqual(0);
      const val1 = indices[1];
      expect(val1).assertEqual(1);
      const val2 = indices[2];
      expect(val2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_3700
     * @tc.name testTypedUArraysEvery037
     * @tc.desc Verify predicate index Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const indices: number[] = [];
      arr.every((v, idx) => {
        expect(typeof v).assertEqual(typeof v);
        indices.push(idx);
        return true;
      });
      const val0 = indices[0];
      expect(val0).assertEqual(0);
      const val1 = indices[1];
      expect(val1).assertEqual(1);
      const val2 = indices[2];
      expect(val2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_3800
     * @tc.name testTypedUArraysEvery038
     * @tc.desc Verify predicate index BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const indices: number[] = [];
      arr.every((v, idx) => {
        expect(typeof v).assertEqual(typeof v);
        indices.push(idx);
        return true;
      });
      const val0 = indices[0];
      expect(val0).assertEqual(0);
      const val1 = indices[1];
      expect(val1).assertEqual(1);
      const val2 = indices[2];
      expect(val2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_3900
     * @tc.name testTypedUArraysEvery039
     * @tc.desc Verify predicate array Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      arr.every((v, idx, array) => {
        expect(typeof v).assertEqual(typeof v);
        expect(typeof idx).assertEqual(typeof idx);
        expect(array).assertEqual(arr);
        return true;
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_4000
     * @tc.name testTypedUArraysEvery040
     * @tc.desc Verify predicate array Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      arr.every((v, idx, array) => {
        expect(typeof v).assertEqual(typeof v);
        expect(typeof idx).assertEqual(typeof idx);
        expect(array).assertEqual(arr);
        return true;
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_4100
     * @tc.name testTypedUArraysEvery041
     * @tc.desc Verify predicate array Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      arr.every((v, idx, array) => {
        expect(typeof v).assertEqual(typeof v);
        expect(typeof idx).assertEqual(typeof idx);
        expect(array).assertEqual(arr);
        return true;
      });
    });

  });
}
