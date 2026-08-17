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

export default function typedUArraysKeysTest02(): void {
  describe('TypedUArraysKeysTest02', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST02_0100
     * @tc.name testTypedUArraysKeysTestFileB001
     * @tc.desc Verify Uint16Array keys length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileB001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const iter = arr.keys();
      iter.next();
      iter.next();
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST02_0200
     * @tc.name testTypedUArraysKeysTestFileB002
     * @tc.desc Verify Uint32Array keys 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileB002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST02_0300
     * @tc.name testTypedUArraysKeysTestFileB003
     * @tc.desc Verify Uint32Array keys length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileB003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const iter = arr.keys();
      iter.next();
      iter.next();
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST02_0400
     * @tc.name testTypedUArraysKeysTestFileB004
     * @tc.desc Verify BigUint64Array keys 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileB004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST02_0500
     * @tc.name testTypedUArraysKeysTestFileB005
     * @tc.desc Verify BigUint64Array keys length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileB005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter = arr.keys();
      iter.next();
      iter.next();
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST02_0600
     * @tc.name testTypedUArraysKeysTestFileB006
     * @tc.desc Verify Uint8ClampedArray keys 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileB006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST02_0700
     * @tc.name testTypedUArraysKeysTestFileB007
     * @tc.desc Verify Uint8ClampedArray keys length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileB007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const iter = arr.keys();
      iter.next();
      iter.next();
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST02_0800
     * @tc.name testTypedUArraysKeysTestFileB008
     * @tc.desc Verify Uint8Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileB008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40, 50]);
      const iter = arr.keys();
      let prev: number = -1;
      let result = iter.next();
      while (!result.done) {
        expect(result.value).assertEqual(prev + 1);
        prev = prev + 1;
        result = iter.next();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST02_0900
     * @tc.name testTypedUArraysKeysTestFileB009
     * @tc.desc Verify Uint16Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileB009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300, 400, 500]);
      const iter = arr.keys();
      let prev: number = -1;
      let result = iter.next();
      while (!result.done) {
        expect(result.value).assertEqual(prev + 1);
        prev = prev + 1;
        result = iter.next();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST02_1000
     * @tc.name testTypedUArraysKeysTestFileB010
     * @tc.desc Verify Uint32Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileB010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000, 4000, 5000]);
      const iter = arr.keys();
      let prev: number = -1;
      let result = iter.next();
      while (!result.done) {
        expect(result.value).assertEqual(prev + 1);
        prev = prev + 1;
        result = iter.next();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST02_1100
     * @tc.name testTypedUArraysKeysTestFileB011
     * @tc.desc Verify BigUint64Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileB011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      const iter = arr.keys();
      let prev: number = -1;
      let result = iter.next();
      while (!result.done) {
        expect(result.value).assertEqual(prev + 1);
        prev = prev + 1;
        result = iter.next();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST02_1200
     * @tc.name testTypedUArraysKeysTestFileB012
     * @tc.desc Verify Uint8Array keys next value done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileB012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.keys();
      let result = iter.next();
      expect(result.value).assertEqual(0);
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST02_1300
     * @tc.name testTypedUArraysKeysTestFileB013
     * @tc.desc Verify Uint8ClampedArray keys next value done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileB013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const iter = arr.keys();
      let result = iter.next();
      expect(result.value).assertEqual(0);
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST02_1400
     * @tc.name testTypedUArraysKeysTestFileB014
     * @tc.desc Verify Uint16Array keys next value done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileB014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const iter = arr.keys();
      let result = iter.next();
      expect(result.value).assertEqual(0);
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST02_1500
     * @tc.name testTypedUArraysKeysTestFileB015
     * @tc.desc Verify Uint32Array keys next value done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileB015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const iter = arr.keys();
      let result = iter.next();
      expect(result.value).assertEqual(0);
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST02_1600
     * @tc.name testTypedUArraysKeysTestFileB016
     * @tc.desc Verify BigUint64Array keys next value done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileB016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter = arr.keys();
      let result = iter.next();
      expect(result.value).assertEqual(0);
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST02_1700
     * @tc.name testTypedUArraysKeysTestFileB017
     * @tc.desc Verify Uint8Array keys next done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileB017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.keys();
      iter.next();
      iter.next();
      iter.next();
      const afterDone = iter.next();
      expect(afterDone.done).assertTrue();
      const afterDone2 = iter.next();
      expect(afterDone2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST02_1800
     * @tc.name testTypedUArraysKeysTestFileB018
     * @tc.desc Verify Uint16Array keys next done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileB018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const iter = arr.keys();
      iter.next();
      iter.next();
      iter.next();
      const afterDone = iter.next();
      expect(afterDone.done).assertTrue();
      const afterDone2 = iter.next();
      expect(afterDone2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST02_1900
     * @tc.name testTypedUArraysKeysTestFileB019
     * @tc.desc Verify Uint32Array keys next done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileB019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const iter = arr.keys();
      iter.next();
      iter.next();
      iter.next();
      const afterDone = iter.next();
      expect(afterDone.done).assertTrue();
      const afterDone2 = iter.next();
      expect(afterDone2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST02_2000
     * @tc.name testTypedUArraysKeysTestFileB020
     * @tc.desc Verify BigUint64Array keys next done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileB020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter = arr.keys();
      iter.next();
      iter.next();
      iter.next();
      const afterDone = iter.next();
      expect(afterDone.done).assertTrue();
      const afterDone2 = iter.next();
      expect(afterDone2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST02_2100
     * @tc.name testTypedUArraysKeysTestFileB021
     * @tc.desc Verify Uint8ClampedArray keys next done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileB021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const iter = arr.keys();
      iter.next();
      iter.next();
      iter.next();
      const afterDone = iter.next();
      expect(afterDone.done).assertTrue();
      const afterDone2 = iter.next();
      expect(afterDone2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST02_2200
     * @tc.name testTypedUArraysKeysTestFileB022
     * @tc.desc Verify Uint8Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileB022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter1 = arr.keys();
      const iter2 = arr.keys();
      expect(iter1.next().value).assertEqual(0);
      expect(iter2.next().value).assertEqual(0);
      expect(iter1.next().value).assertEqual(1);
      expect(iter2.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST02_2300
     * @tc.name testTypedUArraysKeysTestFileB023
     * @tc.desc Verify Uint8ClampedArray keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileB023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const iter1 = arr.keys();
      const iter2 = arr.keys();
      expect(iter1.next().value).assertEqual(0);
      expect(iter2.next().value).assertEqual(0);
      expect(iter1.next().value).assertEqual(1);
      expect(iter2.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST02_2400
     * @tc.name testTypedUArraysKeysTestFileB024
     * @tc.desc Verify Uint16Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileB024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const iter1 = arr.keys();
      const iter2 = arr.keys();
      expect(iter1.next().value).assertEqual(0);
      expect(iter2.next().value).assertEqual(0);
      expect(iter1.next().value).assertEqual(1);
      expect(iter2.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST02_2500
     * @tc.name testTypedUArraysKeysTestFileB025
     * @tc.desc Verify Uint32Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileB025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const iter1 = arr.keys();
      const iter2 = arr.keys();
      expect(iter1.next().value).assertEqual(0);
      expect(iter2.next().value).assertEqual(0);
      expect(iter1.next().value).assertEqual(1);
      expect(iter2.next().value).assertEqual(1);
    });
  });
}
