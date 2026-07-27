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

export default function TypedUArraysEvery02Test(): void {

  describe('TypedUArraysEvery02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_4300
     * @tc.name testTypedUArraysEvery042
     * @tc.desc Verify every TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.every((v, idx, array) => {
        expect(typeof v).assertEqual(typeof v);
        expect(typeof idx).assertEqual(typeof idx);
        expect(array).assertEqual(arr);
        return true;
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_4400
     * @tc.name testTypedUArraysEvery043
     * @tc.desc Verify predicate array BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      arr.every((v, idx, array) => {
        expect(typeof v).assertEqual(typeof v);
        expect(typeof idx).assertEqual(typeof idx);
        expect(array).assertEqual(arr);
        return true;
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_4400
     * @tc.name testTypedUArraysEvery044
     * @tc.desc Verify 0 every Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_4500
     * @tc.name testTypedUArraysEvery045
     * @tc.desc Verify 255 every Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 255, 255]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_4600
     * @tc.name testTypedUArraysEvery046
     * @tc.desc Verify 65535 every Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535, 65535]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_4700
     * @tc.name testTypedUArraysEvery047
     * @tc.desc Verify 4294967295 every Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_4800
     * @tc.name testTypedUArraysEvery048
     * @tc.desc Verify Uint8ClampedArray 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 255]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_4900
     * @tc.name testTypedUArraysEvery049
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), BigInt('18446744073709551615')]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_5000
     * @tc.name testTypedUArraysEvery050
     * @tc.desc Verify BigUint64Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_5100
     * @tc.name testTypedUArraysEvery051
     * @tc.desc Verify thisArg predicate Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const min = 1;
      const max = 5;
      const result = arr.every((v) => {
        return v >= min && v <= max;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_5200
     * @tc.name testTypedUArraysEvery052
     * @tc.desc Verify predicate parameter types with Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let thisIsObject = false;
      arr.every((v) => {
        thisIsObject = typeof v === 'number';
        return true;
      });
      expect(thisIsObject).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_5300
     * @tc.name testTypedUArraysEvery053
     * @tc.desc Verify every returns true for single element Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_5400
     * @tc.name testTypedUArraysEvery054
     * @tc.desc Verify every returns false when predicate fails for Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const result = arr.every((v) => v > 100);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_5500
     * @tc.name testTypedUArraysEvery055
     * @tc.desc Verify every returns true for repeated value Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([7, 7, 7, 7]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_5600

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_5700
     * @tc.name testTypedUArraysEvery057
     * @tc.desc Verify every returns true for sequential values Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_5800
     * @tc.name testTypedUArraysEvery058
     * @tc.desc Verify predicate every Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      try {
        arr.every((v) => {
          expect(typeof v).assertEqual(typeof v);
          throw new Error('predicate error');
        });
        expect(true).assertFail();
      } catch (e) {
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_5900
     * @tc.name testTypedUArraysEvery059
     * @tc.desc Verify predicate every Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      try {
        arr.every((v) => {
          if (v === 2) {
            throw new RangeError('range');
          }
          return true;
        });
        expect(true).assertFail();
      } catch (e) {
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_6000
     * @tc.name testTypedUArraysEvery060
     * @tc.desc Verify predicate every BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      try {
        arr.every((v) => {
          if (v === 2n) {
            throw new TypeError('type');
          }
          return true;
        });
        expect(true).assertFail();
      } catch (e) {
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_6100
     * @tc.name testTypedUArraysEvery061
     * @tc.desc Verify predicate every Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.every((v) => {
          if (v === 2) {
            throw new SyntaxError('syntax');
          }
          return true;
        });
        expect(true).assertFail();
      } catch (e) {
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_6200
     * @tc.name testTypedUArraysEvery062
     * @tc.desc Verify 0 TypeError Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_6300
     * @tc.name testTypedUArraysEvery063
     * @tc.desc Verify predicate boolean every Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_6400
     * @tc.name testTypedUArraysEvery064
     * @tc.desc Verify predicate 0/falsy every false Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.every((v) => v > 100);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_6500
     * @tc.name testTypedUArraysEvery065
     * @tc.desc Verify predicate false Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      const result = arr.every((v) => v > 100);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_6600
     * @tc.name testTypedUArraysEvery066
     * @tc.desc Verify Uint8ClampedArray 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([300, 400, 500]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_6700
     * @tc.name testTypedUArraysEvery067
     * @tc.desc Verify Uint8ClampedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-100, -200, -50]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_6800
     * @tc.name testTypedUArraysEvery068
     * @tc.desc Verify every returns true for Uint8ClampedArray with boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-50, 128, 300]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_6900
     * @tc.name testTypedUArraysEvery069
     * @tc.desc Verify Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([256, 512, 768]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_7000
     * @tc.name testTypedUArraysEvery070
     * @tc.desc Verify every returns true for Uint8Array with overflow values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([257, 258, 259]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_7100
     * @tc.name testTypedUArraysEvery071
     * @tc.desc Verify Uint16Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65536, 131072]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_7200
     * @tc.name testTypedUArraysEvery072
     * @tc.desc Verify Uint32Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967296, 8589934592]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_7300
     * @tc.name testTypedUArraysEvery073
     * @tc.desc Verify BigUint64Array BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615')]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_7400
     * @tc.name testTypedUArraysEvery074
     * @tc.desc Verify BigUint64Array BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 1n, BigInt('18446744073709551615')]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_7500
     * @tc.name testTypedUArraysEvery075
     * @tc.desc Verify every returns true for Uint8ClampedArray with fractional values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255.9, 256.1, 300.5]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_7600
     * @tc.name testTypedUArraysEvery076
     * @tc.desc Verify every returns true for Uint8Array with floating point values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3.9, 2.1, 1.7]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_7700
     * @tc.name testTypedUArraysEvery077
     * @tc.desc Verify every returns true for Uint16Array with fractional values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([99.9, 100.1]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_7800
     * @tc.name testTypedUArraysEvery078
     * @tc.desc Verify predicate value types are number with Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let allNumber = true;
      arr.every((v) => {
        if (typeof v !== 'number') {
          allNumber = false;
        }
        return true;
      });
      expect(allNumber).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_7900
     * @tc.name testTypedUArraysEvery079
     * @tc.desc Verify BigUint64Array value BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let allBigInt = true;
      arr.every((v) => {
        if (typeof v !== 'bigint') {
          allBigInt = false;
        }
        return true;
      });
      expect(allBigInt).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_8000
     * @tc.name testTypedUArraysEvery080
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-100, 0, 128, 255, 300]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_8100

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_8200
     * @tc.name testTypedUArraysEvery082
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 4294967295]);
      const result = arr.every(() => true);
      expect(result).assertTrue();
    });

  });
}
