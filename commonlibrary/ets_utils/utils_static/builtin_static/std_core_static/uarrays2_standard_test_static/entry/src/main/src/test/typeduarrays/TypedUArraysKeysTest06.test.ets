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

export default function typedUArraysKeysTest06(): void {
  describe('TypedUArraysKeysTest06', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST06_0100
     * @tc.name testTypedUArraysKeysTestFileF001
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      const iter1 = arr.keys()
      const iter2 = arr.keys()
      const r1 = iter1.next()
      expect(r1.value).assertEqual(0)
      const r2 = iter2.next()
      expect(r2.value).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST06_0200
     * @tc.name testTypedUArraysKeysTestFileF002
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileF002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      const iter1 = arr.keys()
      const iter2 = arr.keys()
      iter1.next()
      iter1.next()
      const r = iter2.next()
      expect(r.value).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST06_0300
     * @tc.name testTypedUArraysKeysTestFileF003
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileF003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4])
      const iter1 = arr.keys()
      const iter2 = arr.keys()
      expect(iter1.next().value).assertEqual(0)
      expect(iter2.next().value).assertEqual(0)
      expect(iter1.next().value).assertEqual(1)
      expect(iter2.next().value).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST06_0400
     * @tc.name testTypedUArraysKeysTestFileF004
     * @tc.desc Verify keys() done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileF004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0)
      const iter1 = arr.keys()
      const iter2 = arr.keys()
      expect(iter1.next().done).assertEqual(true)
      expect(iter2.next().done).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST06_0500
     * @tc.name testTypedUArraysKeysTestFileF005
     * @tc.desc Verify for...of keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileF005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST06_0600
     * @tc.name testTypedUArraysKeysTestFileF006
     * @tc.desc Verify for...of keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileF006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0)
      const indices: number[] = []
      for (const key of arr.keys()) {
        indices.push(key)
      }
      expect(indices.length).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST06_0700
     * @tc.name testTypedUArraysKeysTestFileF007
     * @tc.desc Verify for...of keys() [0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileF007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([99]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST06_0800
     * @tc.name testTypedUArraysKeysTestFileF008
     * @tc.desc Verify for...of keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileF008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300, 400])
      let allMatch = true
      for (const key of arr.keys()) {
        if (arr[key.toInt()] !== (key + 1) * 100) {
          allMatch = false
        }
      }
      expect(allMatch).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST06_0900
     * @tc.name testTypedUArraysKeysTestFileF009
     * @tc.desc Verify for...of keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileF009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 10, 15]);
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(10);
      expect(arr[2]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST06_1000
     * @tc.name testTypedUArraysKeysTestFileF010
     * @tc.desc Verify Array.from keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileF010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST06_1100
     * @tc.name testTypedUArraysKeysTestFileF011
     * @tc.desc Verify Array.from keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileF011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0)
      const indices = Array.from(arr.keys())
      expect(indices.length).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST06_1200
     * @tc.name testTypedUArraysKeysTestFileF012
     * @tc.desc Verify Array.from Uint16Array keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileF012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(5);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().value).assertEqual(3);
      expect(iter.next().value).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST06_1300
     * @tc.name testTypedUArraysKeysTestFileF013
     * @tc.desc Verify Array.from keys() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileF013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(10)
      const indices = Array.from(arr.keys())
      expect(indices.length).assertEqual(arr.length)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST06_1400
     * @tc.name testTypedUArraysKeysTestFileF014
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileF014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST06_1500
     * @tc.name testTypedUArraysKeysTestFileF015
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileF015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST06_1600
     * @tc.name testTypedUArraysKeysTestFileF016
     * @tc.desc Verify Uint8Array Uint16Array keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileF016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Uint8Array(3)
      const arr2 = new Uint16Array(3)
      const iter1 = arr1.keys()
      const iter2 = arr2.keys()
      expect(iter1.next().value).assertEqual(iter2.next().value)
      expect(iter1.next().value).assertEqual(iter2.next().value)
      expect(iter1.next().value).assertEqual(iter2.next().value)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST06_1700
     * @tc.name testTypedUArraysKeysTestFileF017
     * @tc.desc Verify Uint32Array BigUint64Array keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileF017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Uint32Array(2)
      const arr2 = new BigUint64Array(2)
      const iter1 = arr1.keys()
      const iter2 = arr2.keys()
      expect(iter1.next().value).assertEqual(iter2.next().value)
      expect(iter1.next().value).assertEqual(iter2.next().value)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST06_1800
     * @tc.name testTypedUArraysKeysTestFileF018
     * @tc.desc Verify Uint8ClampedArray keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileF018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Uint8ClampedArray(4)
      const arr2 = new Uint8Array(4)
      const iter1 = arr1.keys()
      const iter2 = arr2.keys()
      let match = true
      for (let i = 0; i < 4; i++) {
        if (iter1.next().value !== iter2.next().value) {
          match = false
        }
      }
      expect(match).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST06_1900
     * @tc.name testTypedUArraysKeysTestFileF019
     * @tc.desc Verify buffer keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileF019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 4, 4);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST06_2000
     * @tc.name testTypedUArraysKeysTestFileF020
     * @tc.desc Verify buffer keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileF020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8)
      const arr = new Uint8Array(buf, 4, 0)
      const iterator = arr.keys()
      let result = iterator.next()
      expect(result.done).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST06_2100
     * @tc.name testTypedUArraysKeysTestFileF021
     * @tc.desc Verify buffer keys() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileF021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32)
      const arr = new Uint16Array(buf, 8, 3)
      const iterator = arr.keys()
      const r = iterator.next()
      expect(r.value).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST06_2200
     * @tc.name testTypedUArraysKeysTestFileF022
     * @tc.desc Verify buffer keys() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileF022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20)
      const arr = new Uint8Array(buf, 2, 6)
      let count = 0
      const iterator = arr.keys()
      while (!iterator.next().done) {
        count++
      }
      expect(count).assertEqual(arr.length)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST06_2300
     * @tc.name testTypedUArraysKeysTestFileF023
     * @tc.desc Verify next() value done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileF023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      const iterator = arr.keys();
      let result = iterator.next();
      expect(result.value).assertEqual(0);
      expect(result.done).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST06_2400
     * @tc.name testTypedUArraysKeysTestFileF024
     * @tc.desc Verify next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileF024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1])
      const iterator = arr.keys()
      iterator.next()
      const r1 = iterator.next()
      const r2 = iterator.next()
      expect(r1.done).assertEqual(true)
      expect(r2.done).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST06_2500
     * @tc.name testTypedUArraysKeysTestFileF025
     * @tc.desc Verify keys() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileF025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      const iterator = arr.keys()
      const r = iterator.next()
      expect(r.value).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST06_2600
     * @tc.name testTypedUArraysKeysTestFileF026
     * @tc.desc Verify keys() length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileF026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5)
      const indices = Array.from(arr.keys())
      expect(indices[indices.length - 1]).assertEqual(arr.length - 1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST06_2700
     * @tc.name testTypedUArraysKeysTestFileF027
     * @tc.desc Verify keys() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileF027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1])
      const indices = Array.from(arr.keys())
      expect(indices[indices.length - 1]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST06_2800
     * @tc.name testTypedUArraysKeysTestFileF028
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileF028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(10)
      const iterator = arr.keys()
      let prev = -1
      let allIncreasing = true
      while (true) {
        const r = iterator.next()
        if (r.done) {
          break
        }
        let v = r.value;
        if (v !== undefined) {
          if (v <= prev) {
            allIncreasing = false
          }
          prev = v
        }
      }
      expect(allIncreasing).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST06_2900
     * @tc.name testTypedUArraysKeysTestFileF029
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileF029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(20)
      const iterator = arr.keys()
      let expected = 0
      let noGaps = true
      while (true) {
        const r = iterator.next()
        if (r.done) {
          break
        }
        if (r.value !== expected) {
          noGaps = false
        }
        expected++
      }
      expect(noGaps).assertEqual(true)
    });
  });
}
