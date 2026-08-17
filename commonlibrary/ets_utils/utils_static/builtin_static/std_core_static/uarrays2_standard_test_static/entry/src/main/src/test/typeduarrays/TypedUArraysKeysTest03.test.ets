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

export default function typedUArraysKeysTest03(): void {
  describe('TypedUArraysKeysTest03', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST03_0100
     * @tc.name testTypedUArraysKeysTestFileC001
     * @tc.desc Verify Uint8Array keys first value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileC001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST03_0200
     * @tc.name testTypedUArraysKeysTestFileC002
     * @tc.desc Verify Uint8Array empty keys done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileC002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const iterator = arr.keys();
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST03_0300
     * @tc.name testTypedUArraysKeysTestFileC003
     * @tc.desc Verify Uint8Array keys single value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileC003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST03_0400
     * @tc.name testTypedUArraysKeysTestFileC004
     * @tc.desc Verify Uint16Array keys first value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileC004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0xFFFF]);
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST03_0500
     * @tc.name testTypedUArraysKeysTestFileC005
     * @tc.desc Verify Uint32Array keys first value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileC005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0xFFFFFFFF]);
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST03_0600
     * @tc.name testTypedUArraysKeysTestFileC006
     * @tc.desc Verify BigUint64Array keys second value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileC006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, BigInt('18446744073709551615')]);
      const iterator = arr.keys();
      iterator.next();
      expect(iterator.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST03_0700
     * @tc.name testTypedUArraysKeysTestFileC007
     * @tc.desc Verify Uint8ClampedArray keys first value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileC007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 255]);
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST03_0800
     * @tc.name testTypedUArraysKeysTestFileC008
     * @tc.desc Verify Uint8Array keys large first value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileC008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(1000);
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST03_0900
     * @tc.name testTypedUArraysKeysTestFileC009
     * @tc.desc Verify keys() [0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileC009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([100]);
      const iterator = arr.keys();
      let result = iterator.next()
      expect(result.value).assertEqual(0)
      expect(result.done).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST03_1000
     * @tc.name testTypedUArraysKeysTestFileC010
     * @tc.desc Verify keys() [0, 1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileC010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iterator = arr.keys()
      const r1 = iterator.next()
      expect(r1.value).assertEqual(0)
      const r2 = iterator.next()
      expect(r2.value).assertEqual(1)
      const r3 = iterator.next()
      expect(r3.value).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST03_1100
     * @tc.name testTypedUArraysKeysTestFileC011
     * @tc.desc Verify keys() [0..9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileC011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(10);
      const iterator = arr.keys()
      let i = 0
      while (i < 10) {
        const r = iterator.next()
        expect(r.value).assertEqual(i)
        expect(r.done).assertEqual(false)
        i++
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST03_1200
     * @tc.name testTypedUArraysKeysTestFileC012
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileC012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(100);
      const iterator = arr.keys()
      const first = iterator.next()
      expect(first.value).assertEqual(0)
      const lastIdx = 99
      let count = 1
      while (count < lastIdx) {
        iterator.next()
        count++
      }
      const last = iterator.next()
      expect(last.value).assertEqual(99)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST03_1300
     * @tc.name testTypedUArraysKeysTestFileC013
     * @tc.desc Verify keys() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileC013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 1, 2, 3, 4])
      const iterator = arr.keys()
      const r0 = iterator.next()
      expect(r0.value).assertEqual(0)
      const r1 = iterator.next()
      let v0 = r0.value;
      if (v0 !== undefined) {
        expect(r1.value).assertEqual(v0 + 1)
      }
      const r2 = iterator.next()
      let v1 = r1.value;
      if (v1 !== undefined) {
        expect(r2.value).assertEqual(v1 + 1)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST03_1400
     * @tc.name testTypedUArraysKeysTestFileC014
     * @tc.desc Verify keys() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileC014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 10, 15])
      const iterator = arr.keys()
      let lastValue: number = 0
      while (true) {
        const r = iterator.next()
        if (r.done) {
          break
        }
        let v = r.value;
        if (v !== undefined) {
          lastValue = v;
        }
      }
      expect(lastValue + 1).assertEqual(arr.length)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST03_1500
     * @tc.name testTypedUArraysKeysTestFileC015
     * @tc.desc Verify keys() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileC015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const iterator = arr.keys();
      iterator.next();
      iterator.next();
      iterator.next();
      let result = iterator.next();
      expect(result.done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST03_1600
     * @tc.name testTypedUArraysKeysTestFileC016
     * @tc.desc Verify keys() value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileC016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1])
      const iterator = arr.keys()
      iterator.next()
      let result = iterator.next()
      expect(result.value).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST03_1700
     * @tc.name testTypedUArraysKeysTestFileC017
     * @tc.desc Verify Uint8Array 0 keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileC017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0])
      const iterator = arr.keys()
      const r = iterator.next()
      expect(r.value).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST03_1800
     * @tc.name testTypedUArraysKeysTestFileC018
     * @tc.desc Verify keys() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileC018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5)
      const iterator = arr.keys()
      let count = 0
      while (true) {
        const r = iterator.next()
        if (r.done) {
          break
        }
        count++
      }
      expect(count).assertEqual(arr.length)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST03_1900
     * @tc.name testTypedUArraysKeysTestFileC019
     * @tc.desc Verify keys() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileC019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0)
      const iterator = arr.keys()
      let count = 0
      while (true) {
        const r = iterator.next()
        if (r.done) {
          break
        }
        count++
      }
      expect(count).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST03_2000
     * @tc.name testTypedUArraysKeysTestFileC020
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileC020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      const originalLength = arr.length
      arr.keys()
      expect(arr.length).assertEqual(originalLength)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST03_2100
     * @tc.name testTypedUArraysKeysTestFileC021
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileC021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      arr.keys()
      expect(arr[0]).assertEqual(10)
      expect(arr[1]).assertEqual(20)
      expect(arr[2]).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST03_2200
     * @tc.name testTypedUArraysKeysTestFileC022
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileC022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300])
      const iterator = arr.keys()
      iterator.next()
      expect(arr[0]).assertEqual(100)
      iterator.next()
      expect(arr[1]).assertEqual(200)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST03_2300
     * @tc.name testTypedUArraysKeysTestFileC023
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileC023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 10, 15])
      const iterator = arr.keys()
      while (!iterator.next().done) {}
      expect(arr[0]).assertEqual(5)
      expect(arr[2]).assertEqual(15)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST03_2400
     * @tc.name testTypedUArraysKeysTestFileC024
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileC024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0)
      arr.keys()
      expect(arr.length).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST03_2500
     * @tc.name testTypedUArraysKeysTestFileC025
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileC025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42])
      arr.keys()
      expect(arr[0]).assertEqual(42)
      expect(arr.length).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYSTEST03_2600
     * @tc.name testTypedUArraysKeysTestFileC026
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileC026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      arr.keys();
      arr.keys();
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });
  });
}
