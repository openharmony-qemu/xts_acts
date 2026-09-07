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

export default function int32ArrayKeysPart02Test(): void {
  describe('Int32ArrayKeysPart02Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_0100
     * @tc.name int32ArrayKeysPart02TestMindmapTest001
     * @tc.desc Verify keys() is immediately done for an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let it = a.keys();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_0200
     * @tc.name int32ArrayKeysPart02TestMindmapTest002
     * @tc.desc Verify keys() next IteratorResult
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(42);
      let it = a.keys();
      let r = it.next();
      expect(r.done).assertFalse();
      expect(r.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_0300
     * @tc.name int32ArrayKeysPart02TestMindmapTest003
     * @tc.desc Verify keys() IterableIterator<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let it: IterableIterator<int> = a.keys();
      expect(it.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_0400
     * @tc.name int32ArrayKeysPart02TestMindmapTest004
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let it1 = a.keys();
      let it2 = a.keys();
      let r1 = it1.next();
      let r2 = it2.next();
      expect(r1.value).assertEqual(0);
      expect(r2.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_0500
     * @tc.name int32ArrayKeysPart02TestMindmapTest005
     * @tc.desc Verify keys() this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let it = a.keys();
      let consumed = 0;
      for (const k of it) {
        consumed++;
      }
      expect(consumed).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_0600
     * @tc.name int32ArrayKeysPart02TestMindmapTest006
     * @tc.desc Verify keys() length=3 next value=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      expect(a.keys().next().value as int).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_0700
     * @tc.name int32ArrayKeysPart02TestMindmapTest007
     * @tc.desc Verify keys() length=3 next value=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let it = a.keys();
      it.next();
      expect(it.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_0800
     * @tc.name int32ArrayKeysPart02TestMindmapTest008
     * @tc.desc Verify keys() length=3 next value=2 = length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let it = a.keys();
      it.next();
      it.next();
      expect(it.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_0900
     * @tc.name int32ArrayKeysPart02TestMindmapTest009
     * @tc.desc Verify keys() length=4 next 0,1,2,3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let it = a.keys();
      expect(it.next().value).assertEqual(0);
      expect(it.next().value).assertEqual(1);
      expect(it.next().value).assertEqual(2);
      expect(it.next().value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_1000
     * @tc.name int32ArrayKeysPart02TestMindmapTest010
     * @tc.desc Verify keys() length=1 next next done value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(77);
      let it = a.keys();
      it.next();
      let r = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_1100
     * @tc.name int32ArrayKeysPart02TestMindmapTest011
     * @tc.desc Verify keys() length=5 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let it = a.keys();
      let last: number = -1;
      for (let i = 0; i < 5; i++) {
        last = it.next().value as int;
      }
      expect(last).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_1200
     * @tc.name int32ArrayKeysPart02TestMindmapTest012
     * @tc.desc Verify int32 keys 0..length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.fill(2147483647);
      let it = a.keys();
      expect(it.next().value).assertEqual(0);
      expect(it.next().value).assertEqual(1);
      expect(it.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_1300
     * @tc.name int32ArrayKeysPart02TestMindmapTest013
     * @tc.desc Verify int32 keys 0..length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.fill(-2147483648);
      let it = a.keys();
      expect(it.next().value).assertEqual(0);
      expect(it.next().value).assertEqual(1);
      expect(it.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_1400
     * @tc.name int32ArrayKeysPart02TestMindmapTest014
     * @tc.desc Verify / / keys 0..length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0, -1, 1, -100, 100);
      let it = a.keys();
      expect(it.next().value).assertEqual(0);
      expect(it.next().value).assertEqual(1);
      expect(it.next().value).assertEqual(2);
      expect(it.next().value).assertEqual(3);
      expect(it.next().value).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_1500
     * @tc.name int32ArrayKeysPart02TestMindmapTest015
     * @tc.desc Verify keys() length=3 next done=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let it = a.keys();
      expect(it.next().done).assertFalse();
      expect(it.next().done).assertFalse();
      expect(it.next().done).assertFalse();
      {
        let a: Int32Array = Int32Array.of(10, 20, 30);
        let it = a.keys();
        it.next();
        it.next();
        it.next();
        expect(it.next().done).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_1600
     * @tc.name int32ArrayKeysPart02TestMindmapTest016
     * @tc.desc Verify keys() next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10);
      let it = a.keys();
      it.next();
      it.next();
      expect(it.next().done).assertTrue();
      expect(it.next().done).assertTrue();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_1700
     * @tc.name int32ArrayKeysPart02TestMindmapTest017
     * @tc.desc Verify keys() next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array();
      expect(a.keys().next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_1800
     * @tc.name int32ArrayKeysPart02TestMindmapTest018
     * @tc.desc Verify keys() next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let it = new Int32Array(0).keys();
      expect(it.next().done).assertTrue();
      expect(it.next().done).assertTrue();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_1900
     * @tc.name int32ArrayKeysPart02TestMindmapTest019
     * @tc.desc Verify keys() done=false done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(5);
      let it = a.keys();
      expect(it.next().done).assertFalse();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_2000
     * @tc.name int32ArrayKeysPart02TestMindmapTest020
     * @tc.desc Verify for-of keys length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let count: int = 0;
      for (const k of a.keys()) {
        count++;
      }
      expect(count).assertEqual(3);
      expect(count).assertEqual(a.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_2100
     * @tc.name int32ArrayKeysPart02TestMindmapTest021
     * @tc.desc Verify for-of keys 0 length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let count: int = 0;
      for (const k of a.keys()) {
        count++;
      }
      expect(count).assertEqual(0);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_2200
     * @tc.name int32ArrayKeysPart02TestMindmapTest022
     * @tc.desc Verify for-of keys 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(9);
      let count: int = 0;
      let seen: int = -1;
      for (const k of a.keys()) {
        seen = k;
        count++;
      }
      expect(count).assertEqual(1);
      expect(seen).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_2300
     * @tc.name int32ArrayKeysPart02TestMindmapTest023
     * @tc.desc Verify (buf, 4, 2) keys = length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 4, 2);
      let count: int = 0;
      for (const k of a.keys()) {
        count++;
      }
      expect(count).assertEqual(2);
      expect(a.length).assertEqual(2);
      expect(a.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_2400
     * @tc.name int32ArrayKeysPart02TestMindmapTest024
     * @tc.desc Verify length=64 keys 64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(64);
      let count: int = 0;
      for (const k of a.keys()) {
        count++;
      }
      expect(count).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_2500
     * @tc.name int32ArrayKeysPart02TestMindmapTest025
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let firstVal = a.$_get(0);
      let secondVal = a.$_get(1);
      let thirdVal = a.$_get(2);
      a.keys();
      expect(a.$_get(0)).assertEqual(firstVal);
      expect(a.$_get(1)).assertEqual(secondVal);
      expect(a.$_get(2)).assertEqual(thirdVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_2600
     * @tc.name int32ArrayKeysPart02TestMindmapTest026
     * @tc.desc Verify for-of keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(5, 6, 7, 8);
      let collectedKeys: number[] = [];
      for (const k of a.keys()) {
        collectedKeys.push(k);
      }
      expect(collectedKeys.length).assertEqual(a.length);
      for (let ci: int = 0; ci < collectedKeys.length; ci = ci + 1) {
        expect(collectedKeys[ci]).assertEqual(ci);
      }
      expect(a.$_get(0)).assertEqual(5);
      expect(a.$_get(1)).assertEqual(6);
      expect(a.$_get(2)).assertEqual(7);
      expect(a.$_get(3)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_2700
     * @tc.name int32ArrayKeysPart02TestMindmapTest027
     * @tc.desc Verify keys() next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(100, -100);
      let it = a.keys();
      it.next();
      it.next();
      it.next();
      expect(a.$_get(0)).assertEqual(100);
      expect(a.$_get(1)).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_2800
     * @tc.name int32ArrayKeysPart02TestMindmapTest028
     * @tc.desc Verify keys() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(5);
      let len = a.length;
      a.keys();
      expect(a.length).assertEqual(len);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_2900
     * @tc.name int32ArrayKeysPart02TestMindmapTest029
     * @tc.desc Verify keys() byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let bl = a.byteLength;
      let collectedKeys: number[] = [];
      for (const k of a.keys()) {
        collectedKeys.push(k);
      }
      expect(collectedKeys.length).assertEqual(a.length);
      for (let ci: int = 0; ci < collectedKeys.length; ci = ci + 1) {
        expect(collectedKeys[ci]).assertEqual(ci);
      }
      expect(a.byteLength).assertEqual(bl);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_3000
     * @tc.name int32ArrayKeysPart02TestMindmapTest030
     * @tc.desc Verify keys() byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let bo = a.byteOffset;
      let collectedKeys: number[] = [];
      for (const k of a.keys()) {
        collectedKeys.push(k);
      }
      expect(collectedKeys.length).assertEqual(a.length);
      for (let ci: int = 0; ci < collectedKeys.length; ci = ci + 1) {
        expect(collectedKeys[ci]).assertEqual(ci);
      }
      expect(a.byteOffset).assertEqual(bo);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_3100
     * @tc.name int32ArrayKeysPart02TestMindmapTest031
     * @tc.desc Verify (buf, 8, 2) keys byteOffset 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let a: Int32Array = new Int32Array(buf, 8, 2);
      let bo = a.byteOffset;
      let collectedKeys: number[] = [];
      for (const k of a.keys()) {
        collectedKeys.push(k);
      }
      expect(collectedKeys.length).assertEqual(a.length);
      for (let ci: int = 0; ci < collectedKeys.length; ci = ci + 1) {
        expect(collectedKeys[ci]).assertEqual(ci);
      }
      expect(a.byteOffset).assertEqual(bo);
      expect(a.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_3200
     * @tc.name int32ArrayKeysPart02TestMindmapTest032
     * @tc.desc Verify keys ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf);
      a.$_set(0, 111);
      a.$_set(1, 222);
      a.$_set(2, 333);
      let collectedKeys: number[] = [];
      for (const k of a.keys()) {
        collectedKeys.push(k);
      }
      expect(collectedKeys.length).assertEqual(a.length);
      for (let ci: int = 0; ci < collectedKeys.length; ci = ci + 1) {
        expect(collectedKeys[ci]).assertEqual(ci);
      }
      let b: Int32Array = new Int32Array(buf);
      expect(b.$_get(0)).assertEqual(111);
      expect(b.$_get(1)).assertEqual(222);
      expect(b.$_get(2)).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_3300
     * @tc.name int32ArrayKeysPart02TestMindmapTest033
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, -20);
      for (let i = 0; i < 5; i++) {
        let collectedKeys: number[] = [];
        for (const k of a.keys()) {
          collectedKeys.push(k);
        }
        expect(collectedKeys.length).assertEqual(a.length);
        for (let ci: int = 0; ci < collectedKeys.length; ci = ci + 1) {
          expect(collectedKeys[ci]).assertEqual(ci);
        }
      }
      expect(a.$_get(0)).assertEqual(10);
      expect(a.$_get(1)).assertEqual(-20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_3400
     * @tc.name int32ArrayKeysPart02TestMindmapTest034
     * @tc.desc Verify keys() for-of next 0,1,2 length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let expected: int[] = [0, 1, 2];
      let it = a.keys();
      for (let i = 0; i < 3; i++) {
        expect(it.next().value).assertEqual(expected[i]);
      }
      let idx: int = 0;
      for (const k of a.keys()) {
        expect(k).assertEqual(expected[idx]);
        idx++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_3500
     * @tc.name int32ArrayKeysPart02TestMindmapTest035
     * @tc.desc Verify for-of keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(7);
      let count: int = 0;
      for (const k of a.keys()) {
        expect(k).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_3600
     * @tc.name int32ArrayKeysPart02TestMindmapTest036
     * @tc.desc Verify for-of keys [0, length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let i: int = 0;
      for (const k of a.keys()) {
        expect(k).assertEqual(i);
        i++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_3700
     * @tc.name int32ArrayKeysPart02TestMindmapTest037
     * @tc.desc Verify reverse for-of keys 0..length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      a.reverse();
      let seq: int[] = [];
      for (const k of a.keys()) {
        seq.push(k);
      }
      expect(seq[0]).assertEqual(0);
      expect(seq[1]).assertEqual(1);
      expect(seq[2]).assertEqual(2);
      expect(a.$_get(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_3800
     * @tc.name int32ArrayKeysPart02TestMindmapTest038
     * @tc.desc Verify sort for-of keys 0..length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(30, 10, 20);
      a.sort();
      let seq: int[] = [];
      for (const k of a.keys()) {
        seq.push(k);
      }
      expect(seq.length).assertEqual(3);
      expect(seq[0]).assertEqual(0);
      expect(seq[2]).assertEqual(2);
      expect(a.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_3900
     * @tc.name int32ArrayKeysPart02TestMindmapTest039
     * @tc.desc Verify fill for-of keys 0..length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      a.fill(-1);
      let seq: int[] = [];
      for (const k of a.keys()) {
        seq.push(k);
      }
      expect(seq[0]).assertEqual(0);
      expect(seq[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_4000
     * @tc.name int32ArrayKeysPart02TestMindmapTest040
     * @tc.desc Verify keys() for-of break 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let seen: int = -1;
      let runs: int = 0;
      for (const k of a.keys()) {
        seen = k;
        runs++;
        break;
      }
      expect(seen).assertEqual(0);
      expect(runs).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_4100
     * @tc.name int32ArrayKeysPart02TestMindmapTest041
     * @tc.desc Verify keys() for-of break 0,1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30, 40);
      let collected: int[] = [];
      for (const k of a.keys()) {
        collected.push(k);
        if (k === 1) {
          break;
        }
      }
      expect(collected.length).assertEqual(2);
      expect(collected[0]).assertEqual(0);
      expect(collected[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_4200
     * @tc.name int32ArrayKeysPart02TestMindmapTest042
     * @tc.desc Verify keys() for-of break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      for (const k of a.keys()) {
        if (k === 2) {
          break;
        }
      }
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_4300
     * @tc.name int32ArrayKeysPart02TestMindmapTest043
     * @tc.desc Verify keys() next for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30, 40);
      let it = a.keys();
      it.next();
      let rest: int[] = [];
      for (const k of it) {
        rest.push(k);
      }
      expect(rest.length).assertEqual(3);
      expect(rest[0]).assertEqual(1);
      expect(rest[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_4400
     * @tc.name int32ArrayKeysPart02TestMindmapTest044
     * @tc.desc Verify keys() for-of 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20);
      let it = a.keys();
      let collectedKeys: number[] = [];
      for (const k of it) {
        collectedKeys.push(k);
      }
      expect(collectedKeys.length).assertEqual(a.length);
      for (let ci: int = 0; ci < collectedKeys.length; ci = ci + 1) {
        expect(collectedKeys[ci]).assertEqual(ci);
      }
      let count: int = 0;
      for (const k of it) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_4500
     * @tc.name int32ArrayKeysPart02TestMindmapTest045
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let it = a.keys();
      try {
        for (const k of it) {
          if (k === 1) {
            throw new Error('abort');
          }
        }
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      let count: int = 0;
      for (const k of a.keys()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_4600
     * @tc.name int32ArrayKeysPart02TestMindmapTest046
     * @tc.desc Verify subarray(0) keys 0..length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let sub = a.subarray(0);
      let seq: int[] = [];
      for (const k of sub.keys()) {
        seq.push(k);
      }
      expect(seq.length).assertEqual(3);
      expect(seq[0]).assertEqual(0);
      expect(seq[2]).assertEqual(2);
      expect(sub.length).assertEqual(a.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_4700
     * @tc.name int32ArrayKeysPart02TestMindmapTest047
     * @tc.desc Verify subarray(1) keys 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30, 40);
      let sub = a.subarray(1);
      let seq: int[] = [];
      for (const k of sub.keys()) {
        seq.push(k);
      }
      expect(seq.length).assertEqual(3);
      expect(seq[0]).assertEqual(0);
      expect(seq[2]).assertEqual(2);
      expect(sub.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_4800
     * @tc.name int32ArrayKeysPart02TestMindmapTest048
     * @tc.desc Verify subarray(1,3) keys 0,1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30, 40);
      let sub = a.subarray(1, 3);
      let seq: int[] = [];
      for (const k of sub.keys()) {
        seq.push(k);
      }
      expect(seq.length).assertEqual(2);
      expect(seq[0]).assertEqual(0);
      expect(seq[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_4900
     * @tc.name int32ArrayKeysPart02TestMindmapTest049
     * @tc.desc Verify subarray begin===end keys 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let sub = a.subarray(2, 2);
      let count: int = 0;
      for (const k of sub.keys()) {
        count++;
      }
      expect(count).assertEqual(0);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_5000
     * @tc.name int32ArrayKeysPart02TestMindmapTest050
     * @tc.desc Verify slice(0) keys 0..length-1 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let cp = a.slice(0);
      let seq: int[] = [];
      for (const k of cp.keys()) {
        seq.push(k);
      }
      expect(seq.length).assertEqual(3);
      expect(seq[0]).assertEqual(0);
      expect(seq[2]).assertEqual(2);
      expect(cp.length).assertEqual(a.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_5100
     * @tc.name int32ArrayKeysPart02TestMindmapTest051
     * @tc.desc Verify slice keys copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let cp = a.slice(0);
      for (const k of cp.keys()) {
        cp.$_set(k, 999);
      }
      expect(a.$_get(0)).assertEqual(10);
      expect(cp.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_5200
     * @tc.name int32ArrayKeysPart02TestMindmapTest052
     * @tc.desc Verify for-of keys buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = new Int32Array(buf);
      let seq: int[] = [];
      for (const k of a.keys()) {
        b.$_set(k, (k + 1) * 11);
        seq.push(k);
      }
      expect(seq[0]).assertEqual(0);
      expect(seq[1]).assertEqual(1);
      expect(seq[2]).assertEqual(2);
      expect(b.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_5300
     * @tc.name int32ArrayKeysPart02TestMindmapTest053
     * @tc.desc Verify byteOffset=8 keys 0,1 /4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let a: Int32Array = new Int32Array(buf, 8, 2);
      let seq: int[] = [];
      for (const k of a.keys()) {
        seq.push(k);
      }
      expect(seq.length).assertEqual(2);
      expect(seq[0]).assertEqual(0);
      expect(seq[1]).assertEqual(1);
      expect(a.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_5400
     * @tc.name int32ArrayKeysPart02TestMindmapTest054
     * @tc.desc Verify buffer subarray keys 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30, 40);
      let s1 = a.subarray(0, 2);
      let s2 = a.subarray(2, 4);
      expect(s1.keys().next().value as int).assertEqual(0);
      expect(s2.keys().next().value as int).assertEqual(0);
      expect(s1.length).assertEqual(2);
      expect(s2.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_5500
     * @tc.name int32ArrayKeysPart02TestMindmapTest055
     * @tc.desc Verify keys $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let seq: int[] = [];
      for (const k of a.keys()) {
        a.$_set(k, -k);
        seq.push(k);
      }
      expect(seq[0]).assertEqual(0);
      expect(seq[1]).assertEqual(1);
      expect(seq[2]).assertEqual(2);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(-1);
      expect(a.$_get(2)).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_5600
     * @tc.name int32ArrayKeysPart02TestMindmapTest056
     * @tc.desc Verify keys fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let it = a.keys();
      let first = it.next().value;
      a.fill(7);
      let second = it.next().value;
      let third = it.next().value;
      expect(first).assertEqual(0);
      expect(second).assertEqual(1);
      expect(third).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_5700
     * @tc.name int32ArrayKeysPart02TestMindmapTest057
     * @tc.desc Verify keys reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30, 40);
      let it = a.keys();
      let first = it.next().value;
      a.reverse();
      let second = it.next().value;
      let third = it.next().value;
      let fourth = it.next().value;
      expect(first).assertEqual(0);
      expect(second).assertEqual(1);
      expect(third).assertEqual(2);
      expect(fourth).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_5800
     * @tc.name int32ArrayKeysPart02TestMindmapTest058
     * @tc.desc Verify keys reverse keys() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let collectedKeys: number[] = [];
      for (const k of a.keys()) {
        collectedKeys.push(k);
      }
      expect(collectedKeys.length).assertEqual(a.length);
      for (let ci: int = 0; ci < collectedKeys.length; ci = ci + 1) {
        expect(collectedKeys[ci]).assertEqual(ci);
      }
      a.reverse();
      let r = a.keys().next();
      expect(r.value).assertEqual(0);
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_5900
     * @tc.name int32ArrayKeysPart02TestMindmapTest059
     * @tc.desc Verify keys sort keys() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(30, 10, 20);
      let collectedKeys: number[] = [];
      for (const k of a.keys()) {
        collectedKeys.push(k);
      }
      expect(collectedKeys.length).assertEqual(a.length);
      for (let ci: int = 0; ci < collectedKeys.length; ci = ci + 1) {
        expect(collectedKeys[ci]).assertEqual(ci);
      }
      a.sort();
      let r = a.keys().next();
      expect(r.value).assertEqual(0);
      expect(a.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_6000
     * @tc.name int32ArrayKeysPart02TestMindmapTest060
     * @tc.desc Verify keys() values() next vs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20);
      expect(a.keys().next().value as int).assertEqual(0);
      expect(a.values().next().value).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_6100
     * @tc.name int32ArrayKeysPart02TestMindmapTest061
     * @tc.desc Verify keys() values() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let kc: int = 0;
      let keySum: int = 0;
      let valSum: int = 0;
      for (const k of a.keys()) {
        kc++;
        keySum += k;
      }
      for (const v of a.values()) {
        valSum += v;
      }
      expect(kc).assertEqual(3);
      expect(keySum).assertEqual(3);
      expect(valSum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_KEYS_PART02_TEST_MINDMAP_6200
     * @tc.name int32ArrayKeysPart02TestMindmapTest062
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayKeysPart02TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let it1 = a.keys();
      let it2 = a.keys();
      let c1: int = 0;
      let c2: int = 0;
      for (const k of it1) {
        c1++;
      }
      for (const k of it2) {
        c2++;
      }
      expect(c1).assertEqual(3);
      expect(c2).assertEqual(3);
    });
  });
}
