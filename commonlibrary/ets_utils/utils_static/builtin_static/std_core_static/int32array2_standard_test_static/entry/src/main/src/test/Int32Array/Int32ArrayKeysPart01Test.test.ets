'use static';


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int32ArrayKeysPart01Test(): void {
  describe('Int32ArrayKeysPart01Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_0100
     * @tc.name int32ArrayKeysPart01TestMindmapTest001
     * @tc.desc Verify an empty Int32Array keys iterator is done with undefined value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array();
      let it = a.keys();
      let r = it.next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_0200
     * @tc.name int32ArrayKeysPart01TestMindmapTest002
     * @tc.desc Verify a length-4 Int32Array keys iterator starts at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let it = a.keys();
      expect(it.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_0300
     * @tc.name int32ArrayKeysPart01TestMindmapTest003
     * @tc.desc Verify an initialized Int32Array keys iterator starts at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let it = a.keys();
      expect(it.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_0400
     * @tc.name int32ArrayKeysPart01TestMindmapTest004
     * @tc.desc Verify an Int32Array.of keys iterator starts at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let it = a.keys();
      expect(it.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_0500
     * @tc.name int32ArrayKeysPart01TestMindmapTest005
     * @tc.desc Verify an Int32Array.from keys iterator starts at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [4, 5];
      let a: Int32Array = Int32Array.from(src);
      let it = a.keys();
      expect(it.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_0600
     * @tc.name int32ArrayKeysPart01TestMindmapTest006
     * @tc.desc Verify Int32Array.of(1).keys() next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let it = Int32Array.of(1).keys();
      let r = it.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_0700
     * @tc.name int32ArrayKeysPart01TestMindmapTest007
     * @tc.desc Verify an ArrayBuffer-backed keys iterator starts at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf);
      let it = a.keys();
      expect(it.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_0800
     * @tc.name int32ArrayKeysPart01TestMindmapTest008
     * @tc.desc Verify a subarray keys iterator starts at relative index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let sub = a.subarray(1);
      let it = sub.keys();
      expect(it.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_0900
     * @tc.name int32ArrayKeysPart01TestMindmapTest009
     * @tc.desc Verify 1 new Int32Array(1) keys() next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let r = a.keys().next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_1000
     * @tc.name int32ArrayKeysPart01TestMindmapTest010
     * @tc.desc Verify new Int32Array([]) keys() next().done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [];
      let a: Int32Array = new Int32Array(src);
      let r = a.keys().next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_1100
     * @tc.name int32ArrayKeysPart01TestMindmapTest011
     * @tc.desc Verify new Int32Array([42]) keys() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([42]);
      let idx: int = a.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_1200
     * @tc.name int32ArrayKeysPart01TestMindmapTest012
     * @tc.desc Verify Int32Array.of() length=0 keys() next().done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of();
      let r = a.keys().next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_1300
     * @tc.name int32ArrayKeysPart01TestMindmapTest013
     * @tc.desc Verify Int32Array.of keys() index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(99);
      let idx: int = a.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_1400
     * @tc.name int32ArrayKeysPart01TestMindmapTest014
     * @tc.desc Verify Int32Array.from length=0 keys() next().done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [];
      let a: Int32Array = Int32Array.from(src);
      let r = a.keys().next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_1500
     * @tc.name int32ArrayKeysPart01TestMindmapTest015
     * @tc.desc Verify ArrayBuffer new Int32Array(buf, 4, 2) keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 4, 2);
      let r = a.keys().next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_1600
     * @tc.name int32ArrayKeysPart01TestMindmapTest016
     * @tc.desc Verify subarray(1,2) keys() index 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let sub = a.subarray(1, 2);
      let idx: int = sub.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_1700
     * @tc.name int32ArrayKeysPart01TestMindmapTest017
     * @tc.desc Verify new Int32Array(other) keys() index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([7]);
      let a: Int32Array = new Int32Array(src);
      let idx: int = a.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_1800
     * @tc.name int32ArrayKeysPart01TestMindmapTest018
     * @tc.desc Verify number new Int32Array(2.0) keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2.0);
      let r = a.keys().next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_1900
     * @tc.name int32ArrayKeysPart01TestMindmapTest019
     * @tc.desc Verify length=1 keys() 2 next done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let it = a.keys();
      it.next();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_2000
     * @tc.name int32ArrayKeysPart01TestMindmapTest020
     * @tc.desc Verify length=2 keys() 3 next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2]);
      let it = a.keys();
      it.next();
      it.next();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_2100
     * @tc.name int32ArrayKeysPart01TestMindmapTest021
     * @tc.desc Verify length=3 keys() next 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let it = a.keys();
      it.next();
      let idx: int = it.next().value as int;
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_2200
     * @tc.name int32ArrayKeysPart01TestMindmapTest022
     * @tc.desc Verify length=3 keys() next 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let it = a.keys();
      it.next();
      it.next();
      let idx: int = it.next().value as int;
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_2300
     * @tc.name int32ArrayKeysPart01TestMindmapTest023
     * @tc.desc Verify length=32 keys() 32 done=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(32);
      let it = a.keys();
      for (let i = 0; i < 31; i++) {
        it.next();
      }
      expect(it.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_2400
     * @tc.name int32ArrayKeysPart01TestMindmapTest024
     * @tc.desc Verify length=32 keys() 32 31 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(32);
      let it = a.keys();
      for (let i = 0; i < 31; i++) {
        it.next();
      }
      let idx: int = it.next().value as int;
      expect(idx).assertEqual(31);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_2500
     * @tc.name int32ArrayKeysPart01TestMindmapTest025
     * @tc.desc Verify length=32 keys() 33 next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(32);
      let it = a.keys();
      for (let i = 0; i < 32; i++) {
        it.next();
      }
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_2600
     * @tc.name int32ArrayKeysPart01TestMindmapTest026
     * @tc.desc Verify 0 keys() index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([0]);
      let idx: int = a.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_2700
     * @tc.name int32ArrayKeysPart01TestMindmapTest027
     * @tc.desc Verify -1 keys() index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-1]);
      let idx: int = a.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_2800
     * @tc.name int32ArrayKeysPart01TestMindmapTest028
     * @tc.desc Verify int32 2147483647 keys() index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([2147483647]);
      let idx: int = a.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_2900
     * @tc.name int32ArrayKeysPart01TestMindmapTest029
     * @tc.desc Verify int32 -2147483648 keys() index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-2147483648]);
      let idx: int = a.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_3000
     * @tc.name int32ArrayKeysPart01TestMindmapTest030
     * @tc.desc Verify $_set Number.NaN ToInt32 0 keys() index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, Number.NaN);
      let idx: int = a.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_3100
     * @tc.name int32ArrayKeysPart01TestMindmapTest031
     * @tc.desc Verify $_set Number.POSITIVE_INFINITY ToInt32 0 keys() index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, Number.POSITIVE_INFINITY);
      let idx: int = a.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_3200
     * @tc.name int32ArrayKeysPart01TestMindmapTest032
     * @tc.desc Verify $_set -Number.POSITIVE_INFINITY ToInt32 0 keys() index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, -Number.POSITIVE_INFINITY);
      let idx: int = a.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_3300
     * @tc.name int32ArrayKeysPart01TestMindmapTest033
     * @tc.desc Verify $_set 3.5 ToInt32 3 keys() index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 3.5);
      let idx: int = a.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_3400
     * @tc.name int32ArrayKeysPart01TestMindmapTest034
     * @tc.desc Verify $_set MAX+1=2147483648 MIN keys() index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 2147483648);
      let idx: int = a.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_3500
     * @tc.name int32ArrayKeysPart01TestMindmapTest035
     * @tc.desc Verify [10,20,30] keys() index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let idx: int = a.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_3600
     * @tc.name int32ArrayKeysPart01TestMindmapTest036
     * @tc.desc Verify [-5,0,5] keys() index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-5, 0, 5]);
      let idx: int = a.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_3700
     * @tc.name int32ArrayKeysPart01TestMindmapTest037
     * @tc.desc Verify 0 [0,0,0] keys() index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([0, 0, 0]);
      let it = a.keys();
      it.next();
      it.next();
      let idx: int = it.next().value as int;
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_3800
     * @tc.name int32ArrayKeysPart01TestMindmapTest038
     * @tc.desc Verify [MAX, MIN] keys() index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      a.$_set(0, 2147483647);
      a.$_set(1, -2147483648);
      let it = a.keys();
      it.next();
      let idx: int = it.next().value as int;
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_3900
     * @tc.name int32ArrayKeysPart01TestMindmapTest039
     * @tc.desc Verify ArrayBuffer(byteLength=4) keys() index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let a: Int32Array = new Int32Array(buf, 0, 1);
      let idx: int = a.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_4000
     * @tc.name int32ArrayKeysPart01TestMindmapTest040
     * @tc.desc Verify ArrayBuffer(byteOffset=4, length=1) keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(buf, 4, 1);
      let r = a.keys().next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_4100
     * @tc.name int32ArrayKeysPart01TestMindmapTest041
     * @tc.desc Verify ArrayBuffer(byteOffset=8, length=2) keys() index=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 8, 2);
      let idx: int = a.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_4200
     * @tc.name int32ArrayKeysPart01TestMindmapTest042
     * @tc.desc Verify Int32Array ArrayBuffer $_set keys() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let a1: Int32Array = new Int32Array(buf, 0, 2);
      a1.$_set(0, 77);
      let a2: Int32Array = new Int32Array(buf, 0, 2);
      let idx: number = a2.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_4300
     * @tc.name int32ArrayKeysPart01TestMindmapTest043
     * @tc.desc Verify ArrayBuffer a1 0 a2(byteOffset=4) keys() index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let a1: Int32Array = new Int32Array(buf, 0, 1);
      let a2: Int32Array = new Int32Array(buf, 4, 1);
      a1.$_set(0, 99);
      let idx: number = a2.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_4400
     * @tc.name int32ArrayKeysPart01TestMindmapTest044
     * @tc.desc Verify ArrayBuffer byteLength=4096 Int32Array keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4096);
      let a: Int32Array = new Int32Array(buf);
      let r = a.keys().next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_4500
     * @tc.name int32ArrayKeysPart01TestMindmapTest045
     * @tc.desc Verify ArrayBuffer byteOffset=12 3 int32 length=1 keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 12, 1);
      let r = a.keys().next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_4600
     * @tc.name int32ArrayKeysPart01TestMindmapTest046
     * @tc.desc Verify subarray(1) length=2 keys() index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let sub = a.subarray(1);
      let it = sub.keys();
      it.next();
      let idx: int = it.next().value as int;
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_4700
     * @tc.name int32ArrayKeysPart01TestMindmapTest047
     * @tc.desc Verify subarray(0,0) keys() next().done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let sub = a.subarray(0, 0);
      let r = sub.keys().next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_4800
     * @tc.name int32ArrayKeysPart01TestMindmapTest048
     * @tc.desc Verify subarray(2,3) length=1 keys() index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let sub = a.subarray(2, 3);
      let idx: int = sub.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_4900
     * @tc.name int32ArrayKeysPart01TestMindmapTest049
     * @tc.desc Verify subarray keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let sub = a.subarray(0, 2);
      a.$_set(1, 999);
      let it = sub.keys();
      it.next();
      let idx: int = it.next().value as int;
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_5000
     * @tc.name int32ArrayKeysPart01TestMindmapTest050
     * @tc.desc Verify subarray subarray(3,3) length=0 keys() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let sub = a.subarray(3, 3);
      let r = sub.keys().next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_5100
     * @tc.name int32ArrayKeysPart01TestMindmapTest051
     * @tc.desc Verify subarray subarray(-1) keys() index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let sub = a.subarray(-1);
      let idx: int = sub.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_5200
     * @tc.name int32ArrayKeysPart01TestMindmapTest052
     * @tc.desc Verify subarray subarray(-2,-1) length=1 keys() index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let sub = a.subarray(-2, -1);
      let idx: int = sub.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_5300
     * @tc.name int32ArrayKeysPart01TestMindmapTest053
     * @tc.desc Verify length=1 $_set(0, 5) keys() index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 5);
      let idx: int = a.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_5400
     * @tc.name int32ArrayKeysPart01TestMindmapTest054
     * @tc.desc Verify $_set keys() index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.$_set(0, 11);
      a.$_set(1, 22);
      a.$_set(2, 33);
      let idx: int = a.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_5500
     * @tc.name int32ArrayKeysPart01TestMindmapTest055
     * @tc.desc Verify $_set keys() index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.$_set(0, 11);
      a.$_set(1, 22);
      a.$_set(2, 33);
      let it = a.keys();
      it.next();
      it.next();
      let idx: int = it.next().value as int;
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_5600
     * @tc.name int32ArrayKeysPart01TestMindmapTest056
     * @tc.desc Verify $_set(0, 7) keys() index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 1);
      a.$_set(0, 7);
      let idx: int = a.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_5700
     * @tc.name int32ArrayKeysPart01TestMindmapTest057
     * @tc.desc Verify length=3 $_set(1, 50) keys() index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.$_set(1, 50);
      let idx: int = a.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_5800
     * @tc.name int32ArrayKeysPart01TestMindmapTest058
     * @tc.desc Verify length=3 MAX keys() index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.$_set(2, 2147483647);
      let it = a.keys();
      it.next();
      it.next();
      let idx: int = it.next().value as int;
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_5900
     * @tc.name int32ArrayKeysPart01TestMindmapTest059
     * @tc.desc Verify new Int32Array(3).fill(8) keys() index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.fill(8);
      let idx: int = a.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_6000
     * @tc.name int32ArrayKeysPart01TestMindmapTest060
     * @tc.desc Verify new Int32Array(3).fill(-1) keys() index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.fill(-1);
      let it = a.keys();
      it.next();
      let idx: int = it.next().value as int;
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_6100
     * @tc.name int32ArrayKeysPart01TestMindmapTest061
     * @tc.desc Verify new Int32Array(2).fill(MAX) keys() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      a.fill(2147483647);
      let it = a.keys();
      it.next();
      it.next();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_6200
     * @tc.name int32ArrayKeysPart01TestMindmapTest062
     * @tc.desc Verify new Int32Array(3).fill(0) keys() index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.fill(0);
      let it = a.keys();
      it.next();
      it.next();
      let idx: int = it.next().value as int;
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_6300
     * @tc.name int32ArrayKeysPart01TestMindmapTest063
     * @tc.desc Verify [1,2,3].reverse() keys() 0,1,2 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      a.reverse();
      let it = a.keys();
      let i0: number = it.next().value as int;
      let i1: number = it.next().value as int;
      let i2: number = it.next().value as int;
      expect(i0).assertEqual(0);
      expect(i1).assertEqual(1);
      expect(i2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_6400
     * @tc.name int32ArrayKeysPart01TestMindmapTest064
     * @tc.desc Verify [3,1,2].sort() keys() index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([3, 1, 2]);
      a.sort();
      let idx: int = a.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_6500
     * @tc.name int32ArrayKeysPart01TestMindmapTest065
     * @tc.desc Verify [-1,0,1].sort() keys() 0,1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-1, 0, 1]);
      a.sort();
      let it = a.keys();
      let i0: number = it.next().value as int;
      let i1: number = it.next().value as int;
      expect(i0).assertEqual(0);
      expect(i1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_6600
     * @tc.name int32ArrayKeysPart01TestMindmapTest066
     * @tc.desc Verify [MAX, 0, MIN].sort() keys() index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.$_set(0, 2147483647);
      a.$_set(1, 0);
      a.$_set(2, -2147483648);
      a.sort();
      let it = a.keys();
      it.next();
      it.next();
      let idx: int = it.next().value as int;
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_6700
     * @tc.name int32ArrayKeysPart01TestMindmapTest067
     * @tc.desc Verify [1,2,3,4].copyWithin(2,0) keys() 0,1,2,3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4]);
      a.copyWithin(2, 0);
      let it = a.keys();
      for (let expected = 0; expected < 4; expected++) {
        let got: number = it.next().value as int;
        expect(got).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_6800
     * @tc.name int32ArrayKeysPart01TestMindmapTest068
     * @tc.desc Verify Int32Array(3).set([7,8,9] as number[]) keys() index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let src: number[] = [7, 8, 9];
      a.set(src as number[]);
      let idx: int = a.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_6900
     * @tc.name int32ArrayKeysPart01TestMindmapTest069
     * @tc.desc Verify Int32Array(4).set([11,22] as number[], 2) offset=2 keys() index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let src: number[] = [11, 22];
      a.set(src as number[], 2);
      let idx: int = a.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_7000
     * @tc.name int32ArrayKeysPart01TestMindmapTest070
     * @tc.desc Verify Int32Array(4).set([11,22] as number[], 2) keys() index=2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let src: number[] = [11, 22];
      a.set(src as number[], 2);
      let it = a.keys();
      it.next();
      it.next();
      let idx: int = it.next().value as int;
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_7100
     * @tc.name int32ArrayKeysPart01TestMindmapTest071
     * @tc.desc Verify Int32Array(4).set([11,22] as number[], 2) keys() index=3 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let src: number[] = [11, 22];
      a.set(src as number[], 2);
      let it = a.keys();
      it.next();
      it.next();
      it.next();
      let idx: int = it.next().value as int;
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_7200
     * @tc.name int32ArrayKeysPart01TestMindmapTest072
     * @tc.desc Verify [1,2,3].slice() keys() index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let s = a.slice();
      let idx: number = s.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_7300
     * @tc.name int32ArrayKeysPart01TestMindmapTest073
     * @tc.desc Verify slice keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let s = a.slice();
      s.$_set(0, 999);
      let idx: number = s.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_7400
     * @tc.name int32ArrayKeysPart01TestMindmapTest074
     * @tc.desc Verify [1,2,3,4].slice(1,3) length=2 keys() index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4]);
      let s = a.slice(1, 3);
      let it = s.keys();
      it.next();
      let idx: int = it.next().value as int;
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_7500
     * @tc.name int32ArrayKeysPart01TestMindmapTest075
     * @tc.desc Verify [1,2,3,4].slice(1,3) length=2 keys() next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4]);
      let s = a.slice(1, 3);
      let it = s.keys();
      it.next();
      it.next();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_7600
     * @tc.name int32ArrayKeysPart01TestMindmapTest076
     * @tc.desc Verify keys() next() done false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1]);
      let r = a.keys().next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_7700
     * @tc.name int32ArrayKeysPart01TestMindmapTest077
     * @tc.desc Verify keys() length length=3 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      a.keys();
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_7800
     * @tc.name int32ArrayKeysPart01TestMindmapTest078
     * @tc.desc Verify keys() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2]);
      let it = a.keys();
      it.next();
      it.next();
      it.next();
      expect(a.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_7900
     * @tc.name int32ArrayKeysPart01TestMindmapTest079
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([5, 6]);
      let it = a.keys();
      it.next();
      it.next();
      expect(a.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_8000
     * @tc.name int32ArrayKeysPart01TestMindmapTest080
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([100]);
      let it = a.keys();
      it.next();
      it.next();
      expect(a.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_8100
     * @tc.name int32ArrayKeysPart01TestMindmapTest081
     * @tc.desc Verify keys() byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2]);
      let it = a.keys();
      it.next();
      it.next();
      expect(a.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_8200
     * @tc.name int32ArrayKeysPart01TestMindmapTest082
     * @tc.desc Verify Int32Array.from([1,2,3], x => x*2) keys() 0,1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1, 2, 3];
      let a: Int32Array = Int32Array.from(src as number[], (x: number, k: number): number => x * 2);
      let it = a.keys();
      let i0: number = it.next().value as int;
      let i1: number = it.next().value as int;
      let i2: number = it.next().value as int;
      expect(i0).assertEqual(0);
      expect(i1).assertEqual(1);
      expect(i2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_8300
     * @tc.name int32ArrayKeysPart01TestMindmapTest083
     * @tc.desc Verify Int32Array.from([1], x => -x) keys() index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1];
      let a: Int32Array = Int32Array.from(src, (x: number) => -x);
      let idx: int = a.keys().next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_8400
     * @tc.name int32ArrayKeysPart01TestMindmapTest084
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let it1 = a.keys();
      let it2 = a.keys();
      it1.next();
      it1.next();
      let idx: number = it2.next().value as int;
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART01_TEST_MINDMAP_8500
     * @tc.name int32ArrayKeysPart01TestMindmapTest085
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart01TestMindmapTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2]);
      let it1 = a.keys();
      let it2 = a.keys();
      it1.next();
      it1.next();
      it1.next();
      expect(it2.next().done).assertFalse();
    });

  });
}
