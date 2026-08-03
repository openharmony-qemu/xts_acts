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

export default function typedUArraysKeysTest05(): void {
  describe('TypedUArraysKeysTest05', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART105_0100
     * @tc.name testTypedUArraysKeysTestFileE001
     * @tc.desc Verify BigUint64Array keys independent iterators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter1 = arr.keys();
      const iter2 = arr.keys();
      expect(iter1.next().value).assertEqual(0);
      expect(iter2.next().value).assertEqual(0);
      expect(iter1.next().value).assertEqual(1);
      expect(iter2.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART105_0200
     * @tc.name testTypedUArraysKeysTestFileE002
     * @tc.desc Verify Uint8Array empty keys done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const iter = arr.keys();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART105_0300
     * @tc.name testTypedUArraysKeysTestFileE003
     * @tc.desc Verify Uint8ClampedArray empty keys done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const iter = arr.keys();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART105_0400
     * @tc.name testTypedUArraysKeysTestFileE004
     * @tc.desc Verify Uint16Array empty keys done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(0);
      const iter = arr.keys();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART105_0500
     * @tc.name testTypedUArraysKeysTestFileE005
     * @tc.desc Verify Uint32Array empty keys done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileE005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      const iter = arr.keys();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART105_0600
     * @tc.name testTypedUArraysKeysTestFileE006
     * @tc.desc Verify BigUint64Array empty keys done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileE006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0);
      const iter = arr.keys();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART105_0700
     * @tc.name testTypedUArraysKeysTestFileE007
     * @tc.desc Verify Uint8Array single 0 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileE007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART105_0800
     * @tc.name testTypedUArraysKeysTestFileE008
     * @tc.desc Verify Uint8Array single 255 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileE008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART105_0900
     * @tc.name testTypedUArraysKeysTestFileE009
     * @tc.desc Verify Uint16Array single 0 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileE009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART105_1000
     * @tc.name testTypedUArraysKeysTestFileE010
     * @tc.desc Verify Uint16Array single 65535 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileE010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART105_1100
     * @tc.name testTypedUArraysKeysTestFileE011
     * @tc.desc Verify Uint32Array single 0 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileE011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART105_1200
     * @tc.name testTypedUArraysKeysTestFileE012
     * @tc.desc Verify Uint32Array single 4294967295 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileE012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART105_1300
     * @tc.name testTypedUArraysKeysTestFileE013
     * @tc.desc Verify BigUint64Array single 0n keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileE013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART105_1400
     * @tc.name testTypedUArraysKeysTestFileE014
     * @tc.desc Verify BigUint64Array single BigUint64 max keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileE014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615')]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART105_1500
     * @tc.name testTypedUArraysKeysTestFileE015
     * @tc.desc Verify Uint8ClampedArray single 0 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileE015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART105_1600
     * @tc.name testTypedUArraysKeysTestFileE016
     * @tc.desc Verify Uint8ClampedArray single 255 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileE016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART105_1700
     * @tc.name testTypedUArraysKeysTestFileE017
     * @tc.desc Verify Uint8ClampedArray single -1 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileE017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART105_1800
     * @tc.name testTypedUArraysKeysTestFileE018
     * @tc.desc Verify Uint8ClampedArray single 256 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileE018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([256]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART105_1900
     * @tc.name testTypedUArraysKeysTestFileE019
     * @tc.desc Verify Uint8Array keys index sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileE019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.keys();
      let result = iter.next();
      let expected = 0;
      while (!result.done) {
        expect(result.value!).assertEqual(expected);
        expected++;
        result = iter.next();
      }
      expect(expected).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART105_2000
     * @tc.name testTypedUArraysKeysTestFileE020
     * @tc.desc Verify Uint16Array keys index sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileE020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const iter = arr.keys();
      let result = iter.next();
      let expected = 0;
      while (!result.done) {
        expect(result.value!).assertEqual(expected);
        expected++;
        result = iter.next();
      }
      expect(expected).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART105_2100
     * @tc.name testTypedUArraysKeysTestFileE021
     * @tc.desc Verify Uint32Array keys index sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileE021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const iter = arr.keys();
      let result = iter.next();
      let expected = 0;
      while (!result.done) {
        expect(result.value!).assertEqual(expected);
        expected++;
        result = iter.next();
      }
      expect(expected).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART105_2200
     * @tc.name testTypedUArraysKeysTestFileE022
     * @tc.desc Verify BigUint64Array keys index sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileE022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter = arr.keys();
      let result = iter.next();
      let expected = 0;
      while (!result.done) {
        expect(result.value!).assertEqual(expected);
        expected++;
        result = iter.next();
      }
      expect(expected).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART105_2300
     * @tc.name testTypedUArraysKeysTestFileE023
     * @tc.desc Verify Uint8ClampedArray keys index sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileE023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const iter = arr.keys();
      let result = iter.next();
      let expected = 0;
      while (!result.done) {
        expect(result.value!).assertEqual(expected);
        expected++;
        result = iter.next();
      }
      expect(expected).assertEqual(arr.length);
    });
  });
}
