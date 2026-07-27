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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_0100
     * @tc.name testTypedUArraysKeysPart2_001
     * @tc.desc Verify Uint8Array keys first value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_0200
     * @tc.name testTypedUArraysKeysPart2_002
     * @tc.desc Verify Uint8Array empty keys done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const iterator = arr.keys();
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_0300
     * @tc.name testTypedUArraysKeysPart2_003
     * @tc.desc Verify Uint8Array keys single value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_0400
     * @tc.name testTypedUArraysKeysPart2_004
     * @tc.desc Verify Uint16Array keys first value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0xFFFF]);
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_0500
     * @tc.name testTypedUArraysKeysPart2_005
     * @tc.desc Verify Uint32Array keys first value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0xFFFFFFFF]);
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_0600
     * @tc.name testTypedUArraysKeysPart2_006
     * @tc.desc Verify BigUint64Array keys second value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, BigInt('18446744073709551615')]);
      const iterator = arr.keys();
      iterator.next();
      expect(iterator.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_0700
     * @tc.name testTypedUArraysKeysPart2_007
     * @tc.desc Verify Uint8ClampedArray keys first value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 255]);
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_0800
     * @tc.name testTypedUArraysKeysPart2_008
     * @tc.desc Verify Uint8Array keys large first value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(1000);
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_0900
     * @tc.name testTypedUArraysKeysPart2_009
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const iterator = arr.keys();
      const result = iterator.next();
      expect(result.done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_1000
     * @tc.name testTypedUArraysKeysPart2_010
     * @tc.desc Verify keys() [0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([100]);
      const iterator = arr.keys();
      let result = iterator.next()
      expect(result.value).assertEqual(0)
      expect(result.done).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_1100
     * @tc.name testTypedUArraysKeysPart2_011
     * @tc.desc Verify keys() [0, 1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_1200
     * @tc.name testTypedUArraysKeysPart2_012
     * @tc.desc Verify keys() [0..9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_1300
     * @tc.name testTypedUArraysKeysPart2_013
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_1400
     * @tc.name testTypedUArraysKeysPart2_014
     * @tc.desc Verify keys() Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const iterator = arr.keys();
      const r = iterator.next();
      expect(r.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_1500
     * @tc.name testTypedUArraysKeysPart2_015
     * @tc.desc Verify keys() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_1600
     * @tc.name testTypedUArraysKeysPart2_016
     * @tc.desc Verify keys() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_1700
     * @tc.name testTypedUArraysKeysPart2_017
     * @tc.desc Verify keys() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const iterator = arr.keys();
      iterator.next();
      iterator.next();
      iterator.next();
      let result = iterator.next();
      expect(result.done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_1800
     * @tc.name testTypedUArraysKeysPart2_018
     * @tc.desc Verify keys() value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1])
      const iterator = arr.keys()
      iterator.next()
      let result = iterator.next()
      expect(result.value).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_1900
     * @tc.name testTypedUArraysKeysPart2_019
     * @tc.desc Verify Uint8Array 0 keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0])
      const iterator = arr.keys()
      const r = iterator.next()
      expect(r.value).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_2000
     * @tc.name testTypedUArraysKeysPart2_020
     * @tc.desc Verify Uint8Array 255 keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 0xFF])
      const iterator = arr.keys()
      const r = iterator.next()
      expect(r.value).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_2100
     * @tc.name testTypedUArraysKeysPart2_021
     * @tc.desc Verify Uint16Array 0xFFFF keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535, 0xFFFF])
      const iterator = arr.keys()
      const r = iterator.next()
      expect(r.value).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_2200
     * @tc.name testTypedUArraysKeysPart2_022
     * @tc.desc Verify Uint32Array 0xFFFFFFFF keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 0xFFFFFFFF])
      const iterator = arr.keys()
      const r = iterator.next()
      expect(r.value).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_2300
     * @tc.name testTypedUArraysKeysPart2_023
     * @tc.desc Verify BigUint64Array BigUint64 keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), 0n])
      const iterator = arr.keys()
      const r = iterator.next()
      expect(r.value).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_2400
     * @tc.name testTypedUArraysKeysPart2_024
     * @tc.desc Verify Uint8ClampedArray keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 0])
      const iterator = arr.keys()
      const r = iterator.next()
      expect(r.value).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_2500
     * @tc.name testTypedUArraysKeysPart2_025
     * @tc.desc Verify keys() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_2600
     * @tc.name testTypedUArraysKeysPart2_026
     * @tc.desc Verify keys() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_2700
     * @tc.name testTypedUArraysKeysPart2_027
     * @tc.desc Verify keys() 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1])
      const iterator = arr.keys()
      let count = 0
      while (true) {
        const r = iterator.next()
        if (r.done) {
          break
        }
        count++
      }
      expect(count).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_2800
     * @tc.name testTypedUArraysKeysPart2_028
     * @tc.desc Verify 100 keys() 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(100)
      const iterator = arr.keys()
      let count = 0
      while (true) {
        const r = iterator.next()
        if (r.done) {
          break
        }
        count++
      }
      expect(count).assertEqual(100)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_2900
     * @tc.name testTypedUArraysKeysPart2_029
     * @tc.desc Verify 1000 keys() 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1000)
      const iterator = arr.keys()
      let count = 0
      while (true) {
        const r = iterator.next()
        if (r.done) {
          break
        }
        count++
      }
      expect(count).assertEqual(1000)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_3000
     * @tc.name testTypedUArraysKeysPart2_030
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      const originalLength = arr.length
      arr.keys()
      expect(arr.length).assertEqual(originalLength)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_3100
     * @tc.name testTypedUArraysKeysPart2_031
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      arr.keys()
      expect(arr[0]).assertEqual(10)
      expect(arr[1]).assertEqual(20)
      expect(arr[2]).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_3200
     * @tc.name testTypedUArraysKeysPart2_032
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300])
      const iterator = arr.keys()
      iterator.next()
      expect(arr[0]).assertEqual(100)
      iterator.next()
      expect(arr[1]).assertEqual(200)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_3300
     * @tc.name testTypedUArraysKeysPart2_033
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 10, 15])
      const iterator = arr.keys()
      while (!iterator.next().done) {}
      expect(arr[0]).assertEqual(5)
      expect(arr[2]).assertEqual(15)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_3400
     * @tc.name testTypedUArraysKeysPart2_034
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0)
      arr.keys()
      expect(arr.length).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_3500
     * @tc.name testTypedUArraysKeysPart2_035
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42])
      arr.keys()
      expect(arr[0]).assertEqual(42)
      expect(arr.length).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART2_3600
     * @tc.name testTypedUArraysKeysPart2_036
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart2_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      arr.keys();
      arr.keys();
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

  });
}
