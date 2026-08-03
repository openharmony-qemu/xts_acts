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

export default function typedUArraysReverseTest05(): void {
  describe('TypedUArraysReverseTest05', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_0100
     * @tc.name testTypedUArraysReverseTestFileE001
     * @tc.desc Verify Uint16Array reverse preserves byteLength 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      arr.reverse();
      expect(arr.byteLength).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_0200
     * @tc.name testTypedUArraysReverseTestFileE002
     * @tc.desc Verify Uint32Array reverse preserves byteLength 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      arr.reverse();
      expect(arr.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_0300
     * @tc.name testTypedUArraysReverseTestFileE003
     * @tc.desc Verify Uint8ClampedArray reverse preserves byteLength 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.reverse();
      expect(arr.byteLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_0400
     * @tc.name testTypedUArraysReverseTestFileE004
     * @tc.desc Verify BigUint64Array reverse preserves byteLength 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      arr.reverse();
      expect(arr.byteLength).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_0500
     * @tc.name testTypedUArraysReverseTestFileE005
     * @tc.desc Verify Uint8Array(0) reverse byteLength remains 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      arr.reverse();
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_0600
     * @tc.name testTypedUArraysReverseTestFileE006
     * @tc.desc Verify Uint8Array([42]) reverse byteLength remains 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      arr.reverse();
      expect(arr.byteLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_0700
     * @tc.name testTypedUArraysReverseTestFileE007
     * @tc.desc Verify Uint16Array([42]) reverse byteLength remains 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([42]);
      arr.reverse();
      expect(arr.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_0800
     * @tc.name testTypedUArraysReverseTestFileE008
     * @tc.desc Verify Uint32Array([42]) reverse byteLength remains 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([42]);
      arr.reverse();
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_0900
     * @tc.name testTypedUArraysReverseTestFileE009
     * @tc.desc Verify BigUint64Array([42n]) reverse byteLength remains 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([42n]);
      arr.reverse();
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_1000
     * @tc.name testTypedUArraysReverseTestFileE010
     * @tc.desc Verify Uint8Array reverse preserves byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.reverse();
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_1100
     * @tc.name testTypedUArraysReverseTestFileE011
     * @tc.desc Verify Uint16Array reverse preserves byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      arr.reverse();
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_1200
     * @tc.name testTypedUArraysReverseTestFileE012
     * @tc.desc Verify Uint32Array reverse preserves byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      arr.reverse();
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_1300
     * @tc.name testTypedUArraysReverseTestFileE013
     * @tc.desc Verify Uint8ClampedArray reverse preserves byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.reverse();
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_1400
     * @tc.name testTypedUArraysReverseTestFileE014
     * @tc.desc Verify BigUint64Array reverse preserves byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      arr.reverse();
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_1500
     * @tc.name testTypedUArraysReverseTestFileE015
     * @tc.desc Verify Uint8Array buffer view reverse preserves byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Uint8Array(buf, 4, 8);
      view.reverse();
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_1600
     * @tc.name testTypedUArraysReverseTestFileE016
     * @tc.desc Verify Uint16Array buffer view reverse preserves byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const view = new Uint16Array(buf, 8, 4);
      view.reverse();
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_1700
     * @tc.name testTypedUArraysReverseTestFileE017
     * @tc.desc Verify Uint32Array buffer view reverse preserves byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(64);
      const view = new Uint32Array(buf, 16, 8);
      view.reverse();
      expect(view.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_1800
     * @tc.name testTypedUArraysReverseTestFileE018
     * @tc.desc Verify Uint8Array reverse preserves buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const buf = arr.buffer;
      arr.reverse();
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_1900
     * @tc.name testTypedUArraysReverseTestFileE019
     * @tc.desc Verify Uint16Array reverse preserves buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const buf = arr.buffer;
      arr.reverse();
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_2000
     * @tc.name testTypedUArraysReverseTestFileE020
     * @tc.desc Verify Uint32Array reverse preserves buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const buf = arr.buffer;
      arr.reverse();
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_2100
     * @tc.name testTypedUArraysReverseTestFileE021
     * @tc.desc Verify Uint8ClampedArray reverse preserves buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const buf = arr.buffer;
      arr.reverse();
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_2200
     * @tc.name testTypedUArraysReverseTestFileE022
     * @tc.desc Verify BigUint64Array reverse preserves buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const buf = arr.buffer;
      arr.reverse();
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_2300
     * @tc.name testTypedUArraysReverseTestFileE023
     * @tc.desc Verify Uint8Array buffer view reverse preserves buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Uint8Array(buf, 4, 8);
      view.reverse();
      expect(view.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_2400
     * @tc.name testTypedUArraysReverseTestFileE024
     * @tc.desc Verify Uint16Array buffer view reverse preserves buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const view = new Uint16Array(buf, 8, 4);
      view.reverse();
      expect(view.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_2500
     * @tc.name testTypedUArraysReverseTestFileE025
     * @tc.desc Verify Uint32Array buffer view reverse preserves buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(64);
      const view = new Uint32Array(buf, 16, 8);
      view.reverse();
      expect(view.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_2600
     * @tc.name testTypedUArraysReverseTestFileE026
     * @tc.desc Verify Uint8Array reverse returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.reverse();
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_2700
     * @tc.name testTypedUArraysReverseTestFileE027
     * @tc.desc Verify Uint16Array reverse returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const ret = arr.reverse();
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_2800
     * @tc.name testTypedUArraysReverseTestFileE028
     * @tc.desc Verify BigUint64Array reverse returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const ret = arr.reverse();
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_2900
     * @tc.name testTypedUArraysReverseTestFileE029
     * @tc.desc Verify Uint8Array(0) reverse returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const ret = arr.reverse();
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_3000
     * @tc.name testTypedUArraysReverseTestFileE030
     * @tc.desc Verify Uint8Array([99]) reverse returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([99]);
      const ret = arr.reverse();
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_3100
     * @tc.name testTypedUArraysReverseTestFileE031
     * @tc.desc Verify Uint8Array reverse modifies element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.reverse();
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(2);
      expect(arr[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_3200
     * @tc.name testTypedUArraysReverseTestFileE032
     * @tc.desc Verify Uint8Array reverse preserves length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.reverse();
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_3300
     * @tc.name testTypedUArraysReverseTestFileE033
     * @tc.desc Verify Uint8Array reverse preserves byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.reverse();
      expect(arr.byteLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_3400

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_3500

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_3400
     * @tc.name testTypedUArraysReverseTestFileE034
     * @tc.desc Verify Uint16Array reverse preserves BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      arr.reverse();
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_3500
     * @tc.name testTypedUArraysReverseTestFileE035
     * @tc.desc Verify Uint8Array reverse returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = expect(arr.reverse()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_3600
     * @tc.name testTypedUArraysReverseTestFileE036
     * @tc.desc Verify shared buffer child view reverse affects parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const parent = new Uint8Array(buf);
      for (let i = 0; i < 16; i++) {
        parent[i] = i;
      }
      const child = new Uint8Array(buf, 0, 4);
      child.reverse();
      expect(parent[3]).assertEqual(0);
      expect(parent[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_3700
     * @tc.name testTypedUArraysReverseTestFileE037
     * @tc.desc Verify shared buffer parent reverse affects child
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const parent = new Uint8Array(buf);
      const child = new Uint8Array(buf, 0, 4);
      parent.reverse();
      expect(child[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_3800
     * @tc.name testTypedUArraysReverseTestFileE038
     * @tc.desc Verify adjacent views on same buffer reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const v1 = new Uint8Array(buf, 0, 4);
      for (let i = 0; i < 4; i++) {
        v1[i] = i;
      }
      const v2 = new Uint8Array(buf, 4, 4);
      for (let i = 0; i < 4; i++) {
        v2[i] = i + 4;
      }
      v1.reverse();
      expect(v1[0]).assertEqual(3);
      expect(v2[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_3900
     * @tc.name testTypedUArraysReverseTestFileE039
     * @tc.desc Verify buffer view reverse with offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Uint8Array(buf, 4, 4);
      for (let i = 0; i < 4; i++) {
        view[i] = i + 1;
      }
      view.reverse();
      expect(view[0]).assertEqual(4);
      expect(view[3]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_4000
     * @tc.name testTypedUArraysReverseTestFileE040
     * @tc.desc Verify same buffer multiple views reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Uint8Array(buf, 0, 4);
      for (let i = 0; i < 4; i++) {
        a[i] = i + 1;
      }
      const b = new Uint8Array(buf, 0, 4);
      a.reverse();
      expect(b[0]).assertEqual(4);
      expect(b[3]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART301_4100
     * @tc.name testTypedUArraysReverseTestFileE041
     * @tc.desc Verify child reverse affects overlapping parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileE041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const parent = new Uint8Array(buf);
      for (let i = 0; i < 16; i++) {
        parent[i] = i + 1;
      }
      const child = new Uint8Array(buf, 0, 4);
      child.reverse();
      expect(parent[0]).assertEqual(4);
      expect(parent[1]).assertEqual(3);
    });

  });
}
