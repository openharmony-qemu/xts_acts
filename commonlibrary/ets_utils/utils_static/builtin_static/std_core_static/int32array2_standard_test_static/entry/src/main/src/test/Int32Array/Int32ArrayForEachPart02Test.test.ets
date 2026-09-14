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

export default function int32ArrayForEachPart02Test(): void {
  describe('Int32ArrayForEachPart02Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_0100
     * @tc.name int32ArrayForEachPart02TestMindmapTest001
     * @tc.desc Verify ArrayBuffer-backed view visits 3 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf);
      let callbackCount: int = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callbackCount++;
      });
      expect(callbackCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_0200
     * @tc.name int32ArrayForEachPart02TestMindmapTest002
     * @tc.desc Verify forEach callback third parameter is the source Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let sameArray: boolean = true;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (a !== arr) {
          sameArray = false;
        }
      });
      expect(sameArray).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_0300
     * @tc.name int32ArrayForEachPart02TestMindmapTest003
     * @tc.desc Verify empty view does not invoke callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let callbackCount: int = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callbackCount++;
      });
      expect(callbackCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_0400
     * @tc.name int32ArrayForEachPart02TestMindmapTest004
     * @tc.desc Verify forEach returns undefined and visits value 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let visitedValue: number = 0;
      let result: void = arr.forEach((v: number, i: int, a: Int32Array): void => {
        visitedValue = v;
      });
      expect(visitedValue).assertEqual(42);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_0500
     * @tc.name int32ArrayForEachPart02TestMindmapTest005
     * @tc.desc Verify byteOffset view visits its 3 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let view: Int32Array = new Int32Array(buf, 8, 3);
      let callbackCount: int = 0;
      view.forEach((v: number, i: int, a: Int32Array): void => {
        callbackCount++;
      });
      expect(callbackCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_0600
     * @tc.name int32ArrayForEachPart02TestMindmapTest006
     * @tc.desc Verify forEach returns undefined after visiting every element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6, 7);
      let callbackCount: int = 0;
      let result: void = arr.forEach((v: number, i: int, a: Int32Array): void => {
        callbackCount++;
      });
      expect(callbackCount).assertEqual(3);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_0700
     * @tc.name int32ArrayForEachPart02TestMindmapTest007
     * @tc.desc Verify forEach does not change array reference identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let refBefore: Int32Array = arr;
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr).assertEqual(refBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_0800
     * @tc.name int32ArrayForEachPart02TestMindmapTest008
     * @tc.desc Verify forEach with empty callback preserves all array elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(4, 5, 6);
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(1)).assertEqual(5);
      expect(arr.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_0900
     * @tc.name int32ArrayForEachPart02TestMindmapTest009
     * @tc.desc Verify forEach leaves the source unchanged when the callback does not write elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_1000
     * @tc.name int32ArrayForEachPart02TestMindmapTest010
     * @tc.desc Verify forEach() array arr of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9);
      let allSame: boolean = true;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (a !== arr) {
          allSame = false;
        }
      });
      expect(allSame).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_1100
     * @tc.name int32ArrayForEachPart02TestMindmapTest011
     * @tc.desc Verify forEach() array Int32Array ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 11);
      arr.$_set(1, 22);
      let callbackCount: int = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        expect(a).assertEqual(arr);
        expect(i).assertEqual(callbackCount);
        expect(v).assertEqual((callbackCount + 1) * 11);
        callbackCount++;
      });
      expect(callbackCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_1200
     * @tc.name int32ArrayForEachPart02TestMindmapTest012
     * @tc.desc Verify forEach() callback receives value 100 once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(100);
      let callbackCount: int = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        expect(v).assertEqual(100);
        callbackCount++;
      });
      expect(callbackCount).assertEqual(1);
      {
        let arr: Int32Array = Int32Array.of(5);
        let callbackCount: int = 0;
        arr.forEach((v: number, i: int, a: Int32Array): void => {
          expect(i).assertEqual(0);
          callbackCount++;
        });
        expect(callbackCount).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_1300
     * @tc.name int32ArrayForEachPart02TestMindmapTest013
     * @tc.desc Verify forEach length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let before: int = arr.length;
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_1400
     * @tc.name int32ArrayForEachPart02TestMindmapTest014
     * @tc.desc Verify forEach on empty array preserves length=0 and byteLength=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_1500
     * @tc.name int32ArrayForEachPart02TestMindmapTest015
     * @tc.desc Verify forEach length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(99);
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_1600
     * @tc.name int32ArrayForEachPart02TestMindmapTest016
     * @tc.desc Verify forEach byteLength length*4 INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648, -1, 0);
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.byteLength).assertEqual(arr.length * 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_1700
     * @tc.name int32ArrayForEachPart02TestMindmapTest017
     * @tc.desc Verify forEach() array.length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let allEq: boolean = true;
      let expected: int = arr.length;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (a.length !== expected) {
          allEq = false;
        }
      });
      expect(allEq).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_1800
     * @tc.name int32ArrayForEachPart02TestMindmapTest018
     * @tc.desc Verify 0 forEach byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf);
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_1900
     * @tc.name int32ArrayForEachPart02TestMindmapTest019
     * @tc.desc Verify byteOffset=8 forEach byteOffset 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let view: Int32Array = new Int32Array(buf, 8, 3);
      let before: int = view.byteOffset;
      let seen: number[] = [];
      let callCount: number = 0;
      view.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(view.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(view.$_get(idx));
      }
      expect(view.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_2000
     * @tc.name int32ArrayForEachPart02TestMindmapTest020
     * @tc.desc Verify BYTES_PER_ELEMENT forEach 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_2100
     * @tc.name int32ArrayForEachPart02TestMindmapTest021
     * @tc.desc Verify BYTES_PER_ELEMENT forEach 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let view: Int32Array = new Int32Array(buf, 4, 3);
      let seen: number[] = [];
      let callCount: number = 0;
      view.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(view.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(view.$_get(idx));
      }
      expect(view.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_2200
     * @tc.name int32ArrayForEachPart02TestMindmapTest022
     * @tc.desc Verify forEach buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let bufBefore: ArrayBuffer = arr.buffer;
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_2300
     * @tc.name int32ArrayForEachPart02TestMindmapTest023
     * @tc.desc Verify forEach buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(4, 5, 6);
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.buffer.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_2400
     * @tc.name int32ArrayForEachPart02TestMindmapTest024
     * @tc.desc Verify forEach buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(new ArrayBuffer(32));
      let bbBefore: int = arr.buffer.byteLength;
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.buffer.byteLength).assertEqual(bbBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_2500
     * @tc.name int32ArrayForEachPart02TestMindmapTest025
     * @tc.desc Verify forEach detach buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a1: Int32Array = new Int32Array(buf);
      a1.$_set(0, 11);
      a1.$_set(1, 22);
      let seen: number[] = [];
      let callCount: number = 0;
      a1.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(a1.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(a1.$_get(idx));
      }
      let a2: Int32Array = new Int32Array(buf);
      expect(a2.$_get(0)).assertEqual(11);
      expect(a2.$_get(1)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_2600
     * @tc.name int32ArrayForEachPart02TestMindmapTest026
     * @tc.desc Verify buffer a1 forEach a2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a1: Int32Array = new Int32Array(buf);
      let a2: Int32Array = new Int32Array(buf);
      a1.$_set(0, 111);
      a1.$_set(1, 222);
      a1.$_set(2, 333);
      a1.$_set(3, 444);
      let seen: number[] = [];
      let callCount: number = 0;
      a1.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(a1.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(a1.$_get(idx));
      }
      expect(a2.$_get(0)).assertEqual(111);
      expect(a2.$_get(1)).assertEqual(222);
      expect(a2.$_get(2)).assertEqual(333);
      expect(a2.$_get(3)).assertEqual(444);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_2700
     * @tc.name int32ArrayForEachPart02TestMindmapTest027
     * @tc.desc Verify subarray forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let sub: Int32Array = parent.subarray(1, 4);
      let seen: number[] = [];
      let callCount: number = 0;
      sub.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(sub.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(sub.$_get(idx));
      }
      expect(parent.$_get(0)).assertEqual(10);
      expect(parent.$_get(1)).assertEqual(20);
      expect(parent.$_get(2)).assertEqual(30);
      expect(parent.$_get(3)).assertEqual(40);
      expect(parent.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_2800
     * @tc.name int32ArrayForEachPart02TestMindmapTest028
     * @tc.desc Verify forEach buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sub: Int32Array = parent.subarray(1, 3);
      let seen: number[] = [];
      let callCount: number = 0;
      parent.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(parent.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(parent.$_get(idx));
      }
      expect(sub.length).assertEqual(2);
      expect(sub.$_get(0)).assertEqual(2);
      expect(sub.$_get(1)).assertEqual(3);
      expect(sub.buffer).assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_2900
     * @tc.name int32ArrayForEachPart02TestMindmapTest029
     * @tc.desc Verify slice forEach buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(11, 22, 33);
      let cp: Int32Array = orig.slice();
      let seen: number[] = [];
      let callCount: number = 0;
      cp.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(cp.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(cp.$_get(idx));
      }
      expect(cp.$_get(0)).assertEqual(11);
      expect(cp.$_get(1)).assertEqual(22);
      expect(cp.$_get(2)).assertEqual(33);
      expect(cp.buffer).not().assertEqual(orig.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_3000
     * @tc.name int32ArrayForEachPart02TestMindmapTest030
     * @tc.desc Verify ArrayBuffer.isView forEach true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_3100
     * @tc.name int32ArrayForEachPart02TestMindmapTest031
     * @tc.desc Verify forEach buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let v: Int32Array = new Int32Array(buf, 4, 4);
      let seen: number[] = [];
      let callCount: number = 0;
      v.forEach((val: number, idx: int, a: Int32Array): void => {
        callCount++;
        seen.push(val);
      });
      expect(callCount).assertEqual(v.length);
      for (let idx2: int = 0; idx2 < seen.length; idx2 = idx2 + 1) {
        expect(seen[idx2]).assertEqual(v.$_get(idx2));
      }
      expect(v.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_3200
     * @tc.name int32ArrayForEachPart02TestMindmapTest032
     * @tc.desc Verify forEach with empty callback preserves negative values unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, -100, -2024);
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(-100);
      expect(arr.$_get(2)).assertEqual(-2024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_3300
     * @tc.name int32ArrayForEachPart02TestMindmapTest033
     * @tc.desc Verify new Int32Array(N) forEach 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_3400
     * @tc.name int32ArrayForEachPart02TestMindmapTest034
     * @tc.desc Verify INT_MAX forEach INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, 0);
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.$_get(0)).assertEqual(2147483647);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_3500
     * @tc.name int32ArrayForEachPart02TestMindmapTest035
     * @tc.desc Verify INT_MIN forEach INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648, 1);
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_3600
     * @tc.name int32ArrayForEachPart02TestMindmapTest036
     * @tc.desc Verify -1/0/1 forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, 0, 1);
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_3700
     * @tc.name int32ArrayForEachPart02TestMindmapTest037
     * @tc.desc Verify Number.NaN ToInt32 0 forEach 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, (0.0 / 0.0));
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_3800
     * @tc.name int32ArrayForEachPart02TestMindmapTest038
     * @tc.desc Verify +Number.POSITIVE_INFINITY ToInt32 0 forEach 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, (1.0 / 0.0));
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_3900
     * @tc.name int32ArrayForEachPart02TestMindmapTest039
     * @tc.desc Verify -Number.POSITIVE_INFINITY ToInt32 0 forEach 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, (-1.0 / 0.0));
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_4000
     * @tc.name int32ArrayForEachPart02TestMindmapTest040
     * @tc.desc Verify 0.5 -0.9 ToInt32 forEach 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, 0.5);
      arr.$_set(1, -0.9);
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_4100
     * @tc.name int32ArrayForEachPart02TestMindmapTest041
     * @tc.desc Verify 2147483648 -2147483648 forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648);
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_4200
     * @tc.name int32ArrayForEachPart02TestMindmapTest042
     * @tc.desc Verify 4294967296 0 forEach 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 4294967296);
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_4300
     * @tc.name int32ArrayForEachPart02TestMindmapTest043
     * @tc.desc Verify from() forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [5, 15, 25, 35];
      let arr: Int32Array = Int32Array.from(src);
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(1)).assertEqual(15);
      expect(arr.$_get(2)).assertEqual(25);
      expect(arr.$_get(3)).assertEqual(35);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_4400
     * @tc.name int32ArrayForEachPart02TestMindmapTest044
     * @tc.desc Verify ArrayBuffer $_set forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 100);
      arr.$_set(1, 200);
      arr.$_set(2, 300);
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.$_get(0)).assertEqual(100);
      expect(arr.$_get(1)).assertEqual(200);
      expect(arr.$_get(2)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_4500
     * @tc.name int32ArrayForEachPart02TestMindmapTest045
     * @tc.desc Verify subarray forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = Int32Array.of(10, 20, 30, 40);
      let sub: Int32Array = parent.subarray(1, 3);
      let seen: number[] = [];
      let callCount: number = 0;
      sub.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(sub.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(sub.$_get(idx));
      }
      expect(sub.$_get(0)).assertEqual(20);
      expect(sub.$_get(1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_4600
     * @tc.name int32ArrayForEachPart02TestMindmapTest046
     * @tc.desc Verify forEach with empty callback preserves array of repeated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 7, 7, 7);
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(7);
      expect(arr.$_get(2)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_4700
     * @tc.name int32ArrayForEachPart02TestMindmapTest047
     * @tc.desc Verify forEach with empty callback preserves mixed signed values unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-50, 0, 50, -100, 100);
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.$_get(0)).assertEqual(-50);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(50);
      expect(arr.$_get(3)).assertEqual(-100);
      expect(arr.$_get(4)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_4800
     * @tc.name int32ArrayForEachPart02TestMindmapTest048
     * @tc.desc Verify forEach with empty callback preserves first element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(77, 2, 3);
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_4900
     * @tc.name int32ArrayForEachPart02TestMindmapTest049
     * @tc.desc Verify forEach with empty callback preserves last element accessed via length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 88);
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.$_get(arr.length - 1)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_5000
     * @tc.name int32ArrayForEachPart02TestMindmapTest050
     * @tc.desc Verify forEach with empty callback preserves element at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 55, 3);
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.$_get(1)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_5100
     * @tc.name int32ArrayForEachPart02TestMindmapTest051
     * @tc.desc Verify forEach with empty callback preserves single element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(12345);
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.$_get(0)).assertEqual(12345);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_5200
     * @tc.name int32ArrayForEachPart02TestMindmapTest052
     * @tc.desc Verify 8 forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(8);
      for (let i: int = 0; i < 8; i = i + 1) {
        arr.$_set(i, (i + 1) * 11);
      }
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      for (let i: int = 0; i < 8; i = i + 1) {
        expect(arr.$_get(i)).assertEqual((i + 1) * 11);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_5300
     * @tc.name int32ArrayForEachPart02TestMindmapTest053
     * @tc.desc Verify 0xFF forEach 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0xFF, 0x100);
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.$_get(0)).assertEqual(255);
      expect(arr.$_get(1)).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_5400
     * @tc.name int32ArrayForEachPart02TestMindmapTest054
     * @tc.desc Verify forEach with an empty callback preserves elements 4 and 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(4, 5);
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_5500
     * @tc.name int32ArrayForEachPart02TestMindmapTest055
     * @tc.desc Verify forEach() sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2, 4, 6);
      let sum: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        sum = sum + v;
      });
      expect(sum).assertEqual(12);
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(1)).assertEqual(4);
      expect(arr.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_5600
     * @tc.name int32ArrayForEachPart02TestMindmapTest056
     * @tc.desc Verify forEach with toString in callback concatenates all array values in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let s: string = '';
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        s = s + v.toString();
      });
      expect(s).assertEqual('123');
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_5700
     * @tc.name int32ArrayForEachPart02TestMindmapTest057
     * @tc.desc Verify forEach callback is invoked once per element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let count: int = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        count = count + 1;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_5800
     * @tc.name int32ArrayForEachPart02TestMindmapTest058
     * @tc.desc Verify two consecutive forEach calls produce identical concatenated results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6, 7);
      let first: string = '';
      let second: string = '';
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        first = first + v.toString() + ',';
      });
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        second = second + v.toString() + ',';
      });
      expect(first).assertEqual('5,6,7,');
      expect(second).assertEqual('5,6,7,');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_5900
     * @tc.name int32ArrayForEachPart02TestMindmapTest059
     * @tc.desc Verify forEach keys() 0..length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let fv: number[] = [];
      let fi: number[] = [];
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        fv.push(v);
        fi.push(i);
        expect(a).assertEqual(arr);
      });
      expect(fv.length).assertEqual(3);
      expect(fv[0]).assertEqual(10);
      expect(fv[1]).assertEqual(20);
      expect(fv[2]).assertEqual(30);
      expect(fi[0]).assertEqual(0);
      expect(fi[1]).assertEqual(1);
      expect(fi[2]).assertEqual(2);
      let idx: number[] = [];
      for (let k of arr.keys()) {
        idx.push(k);
      }
      expect(idx.length).assertEqual(3);
      expect(idx[0]).assertEqual(0);
      expect(idx[1]).assertEqual(1);
      expect(idx[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_6000
     * @tc.name int32ArrayForEachPart02TestMindmapTest060
     * @tc.desc Verify forEach values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(4, 5, 6);
      let fv: number[] = [];
      let fi: number[] = [];
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        fv.push(v);
        fi.push(i);
        expect(a).assertEqual(arr);
      });
      expect(fv.length).assertEqual(3);
      expect(fv[0]).assertEqual(4);
      expect(fv[1]).assertEqual(5);
      expect(fv[2]).assertEqual(6);
      expect(fi[0]).assertEqual(0);
      expect(fi[1]).assertEqual(1);
      expect(fi[2]).assertEqual(2);
      let vals: number[] = [];
      for (let v of arr.values()) {
        vals.push(v);
      }
      expect(vals.length).assertEqual(3);
      expect(vals[0]).assertEqual(4);
      expect(vals[1]).assertEqual(5);
      expect(vals[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_6100
     * @tc.name int32ArrayForEachPart02TestMindmapTest061
     * @tc.desc Verify forEach buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let a1: Int32Array = new Int32Array(buf);
      for (let i: int = 0; i < 6; i = i + 1) {
        a1.$_set(i, i + 1);
      }
      let fv: number[] = [];
      let fi: number[] = [];
      a1.forEach((v: number, i: int, a: Int32Array): void => {
        fv.push(v);
        fi.push(i);
        expect(a).assertEqual(a1);
      });
      expect(fv.length).assertEqual(6);
      expect(fv[0]).assertEqual(1);
      expect(fv[1]).assertEqual(2);
      expect(fv[2]).assertEqual(3);
      expect(fv[3]).assertEqual(4);
      expect(fv[4]).assertEqual(5);
      expect(fv[5]).assertEqual(6);
      expect(fi[0]).assertEqual(0);
      expect(fi[1]).assertEqual(1);
      expect(fi[2]).assertEqual(2);
      expect(fi[3]).assertEqual(3);
      expect(fi[4]).assertEqual(4);
      expect(fi[5]).assertEqual(5);
      let a2: Int32Array = new Int32Array(buf, 8, 2);
      expect(a2.length).assertEqual(2);
      expect(a2.$_get(0)).assertEqual(3);
      expect(a2.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_6200
     * @tc.name int32ArrayForEachPart02TestMindmapTest062
     * @tc.desc Verify forEach subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let fv: number[] = [];
      let fi: number[] = [];
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        fv.push(v);
        fi.push(i);
        expect(a).assertEqual(arr);
      });
      expect(fv.length).assertEqual(5);
      expect(fv[0]).assertEqual(1);
      expect(fv[1]).assertEqual(2);
      expect(fv[2]).assertEqual(3);
      expect(fv[3]).assertEqual(4);
      expect(fv[4]).assertEqual(5);
      expect(fi[0]).assertEqual(0);
      expect(fi[1]).assertEqual(1);
      expect(fi[2]).assertEqual(2);
      expect(fi[3]).assertEqual(3);
      expect(fi[4]).assertEqual(4);
      let sub: Int32Array = arr.subarray(2, 4);
      expect(sub.length).assertEqual(2);
      expect(sub.$_get(0)).assertEqual(3);
      expect(sub.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_6300
     * @tc.name int32ArrayForEachPart02TestMindmapTest063
     * @tc.desc Verify forEach slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(9, 8, 7);
      let fv: number[] = [];
      let fi: number[] = [];
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        fv.push(v);
        fi.push(i);
        expect(a).assertEqual(arr);
      });
      expect(fv.length).assertEqual(3);
      expect(fv[0]).assertEqual(9);
      expect(fv[1]).assertEqual(8);
      expect(fv[2]).assertEqual(7);
      expect(fi[0]).assertEqual(0);
      expect(fi[1]).assertEqual(1);
      expect(fi[2]).assertEqual(2);
      let cp: Int32Array = arr.slice();
      expect(cp.length).assertEqual(3);
      expect(cp.$_get(0)).assertEqual(9);
      expect(cp.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_6400
     * @tc.name int32ArrayForEachPart02TestMindmapTest064
     * @tc.desc Verify forEach forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let b: Int32Array = Int32Array.of(10, 20);
      let outerVals: number[] = [];
      let innerVals: number[] = [];
      a.forEach((va: number, ia: int, aa: Int32Array): void => {
        outerVals.push(va);
        b.forEach((vb: number, ib: int, ab: Int32Array): void => {
          innerVals.push(vb);
        });
      });
      expect(outerVals.length).assertEqual(2);
      expect(outerVals[0]).assertEqual(1);
      expect(outerVals[1]).assertEqual(2);
      expect(innerVals.length).assertEqual(4);
      expect(innerVals[0]).assertEqual(10);
      expect(innerVals[1]).assertEqual(20);
      expect(innerVals[2]).assertEqual(10);
      expect(innerVals[3]).assertEqual(20);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(b.$_get(0)).assertEqual(10);
      expect(b.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_6500
     * @tc.name int32ArrayForEachPart02TestMindmapTest065
     * @tc.desc Verify forEach sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 1, 2);
      let fv: number[] = [];
      let fi: number[] = [];
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        fv.push(v);
        fi.push(i);
        expect(a).assertEqual(arr);
      });
      expect(fv.length).assertEqual(3);
      expect(fv[0]).assertEqual(3);
      expect(fv[1]).assertEqual(1);
      expect(fv[2]).assertEqual(2);
      expect(fi[0]).assertEqual(0);
      expect(fi[1]).assertEqual(1);
      expect(fi[2]).assertEqual(2);
      arr.sort((x: number, y: number): int => {
        if (x < y) {
          return -1;
        }
        if (x > y) {
          return 1;
        }
        return 0;
      });
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_6600
     * @tc.name int32ArrayForEachPart02TestMindmapTest066
     * @tc.desc Verify forEach reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let fv: number[] = [];
      let fi: number[] = [];
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        fv.push(v);
        fi.push(i);
        expect(a).assertEqual(arr);
      });
      expect(fv.length).assertEqual(3);
      expect(fv[0]).assertEqual(1);
      expect(fv[1]).assertEqual(2);
      expect(fv[2]).assertEqual(3);
      expect(fi[0]).assertEqual(0);
      expect(fi[1]).assertEqual(1);
      expect(fi[2]).assertEqual(2);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_6700
     * @tc.name int32ArrayForEachPart02TestMindmapTest067
     * @tc.desc Verify forEach indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let fv: number[] = [];
      let fi: number[] = [];
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        fv.push(v);
        fi.push(i);
        expect(a).assertEqual(arr);
      });
      expect(fv.length).assertEqual(3);
      expect(fv[0]).assertEqual(10);
      expect(fv[1]).assertEqual(20);
      expect(fv[2]).assertEqual(30);
      expect(fi[0]).assertEqual(0);
      expect(fi[1]).assertEqual(1);
      expect(fi[2]).assertEqual(2);
      expect(arr.indexOf(20)).assertEqual(1);
      expect(arr.indexOf(999)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_6800
     * @tc.name int32ArrayForEachPart02TestMindmapTest068
     * @tc.desc Verify forEach includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let fv: number[] = [];
      let fi: number[] = [];
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        fv.push(v);
        fi.push(i);
        expect(a).assertEqual(arr);
      });
      expect(fv.length).assertEqual(3);
      expect(fv[0]).assertEqual(1);
      expect(fv[1]).assertEqual(2);
      expect(fv[2]).assertEqual(3);
      expect(fi[0]).assertEqual(0);
      expect(fi[1]).assertEqual(1);
      expect(fi[2]).assertEqual(2);
      expect(arr.includes(2)).assertTrue();
      expect(arr.includes(99)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_6900
     * @tc.name int32ArrayForEachPart02TestMindmapTest069
     * @tc.desc Verify forEach every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2, 4, 6);
      let fv: number[] = [];
      let fi: number[] = [];
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        fv.push(v);
        fi.push(i);
        expect(a).assertEqual(arr);
      });
      expect(fv.length).assertEqual(3);
      expect(fv[0]).assertEqual(2);
      expect(fv[1]).assertEqual(4);
      expect(fv[2]).assertEqual(6);
      expect(fi[0]).assertEqual(0);
      expect(fi[1]).assertEqual(1);
      expect(fi[2]).assertEqual(2);
      let allEven: boolean = arr.every((v: number, i: int, a: Int32Array): boolean => (v) % 2 === 0);
      expect(allEven).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_7000
     * @tc.name int32ArrayForEachPart02TestMindmapTest070
     * @tc.desc Verify forEach some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let fv: number[] = [];
      let fi: number[] = [];
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        fv.push(v);
        fi.push(i);
        expect(a).assertEqual(arr);
      });
      expect(fv.length).assertEqual(3);
      expect(fv[0]).assertEqual(1);
      expect(fv[1]).assertEqual(2);
      expect(fv[2]).assertEqual(3);
      expect(fi[0]).assertEqual(0);
      expect(fi[1]).assertEqual(1);
      expect(fi[2]).assertEqual(2);
      let hasTwo: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => v === 2);
      expect(hasTwo).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_7100
     * @tc.name int32ArrayForEachPart02TestMindmapTest071
     * @tc.desc Verify forEach at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(11, 22, 33);
      let fv: number[] = [];
      let fi: number[] = [];
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        fv.push(v);
        fi.push(i);
        expect(a).assertEqual(arr);
      });
      expect(fv.length).assertEqual(3);
      expect(fv[0]).assertEqual(11);
      expect(fv[1]).assertEqual(22);
      expect(fv[2]).assertEqual(33);
      expect(fi[0]).assertEqual(0);
      expect(fi[1]).assertEqual(1);
      expect(fi[2]).assertEqual(2);
      expect(arr.at(0)).assertEqual(11);
      expect(arr.at(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_7200
     * @tc.name int32ArrayForEachPart02TestMindmapTest072
     * @tc.desc Verify forEach at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(11, 22, 33);
      let fv: number[] = [];
      let fi: number[] = [];
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        fv.push(v);
        fi.push(i);
        expect(a).assertEqual(arr);
      });
      expect(fv.length).assertEqual(3);
      expect(fv[0]).assertEqual(11);
      expect(fv[1]).assertEqual(22);
      expect(fv[2]).assertEqual(33);
      expect(fi[0]).assertEqual(0);
      expect(fi[1]).assertEqual(1);
      expect(fi[2]).assertEqual(2);
      expect(arr.at(-1)).assertEqual(33);
      expect(arr.at(-3)).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_7300
     * @tc.name int32ArrayForEachPart02TestMindmapTest073
     * @tc.desc Verify forEach() array.buffer arr.buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let sameBuf: boolean = true;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (a.buffer !== arr.buffer) {
          sameBuf = false;
        }
      });
      expect(sameBuf).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_7400
     * @tc.name int32ArrayForEachPart02TestMindmapTest074
     * @tc.desc Verify forEach() array.length arr.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 6, 9, 12);
      let lenOk: boolean = true;
      let expected: int = arr.length;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (a.length !== expected) {
          lenOk = false;
        }
      });
      expect(lenOk).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_7500
     * @tc.name int32ArrayForEachPart02TestMindmapTest075
     * @tc.desc Verify forEach() array.BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let bpeOk: boolean = true;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (a.BYTES_PER_ELEMENT !== 4) {
          bpeOk = false;
        }
      });
      expect(bpeOk).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART02_TEST_MINDMAP_7600
     * @tc.name int32ArrayForEachPart02TestMindmapTest076
     * @tc.desc Verify new Int32Array(length) forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart02TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(6);
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      for (let i: int = 0; i < 6; i = i + 1) {
        expect(arr.$_get(i)).assertEqual(0);
      }
    });


  });
}
