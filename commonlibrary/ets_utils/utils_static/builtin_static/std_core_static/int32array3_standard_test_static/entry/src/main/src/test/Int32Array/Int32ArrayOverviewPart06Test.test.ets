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

export default function int32ArrayOverviewPart06Test(): void {
  describe('Int32ArrayOverviewPart06Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0010
     * @tc.name int32ArrayOverviewPart06TestMindmapTest001
     * @tc.desc Verify new Int32Array(5) length is 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(5);
      expect(a.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0020
     * @tc.name int32ArrayOverviewPart06TestMindmapTest002
     * @tc.desc Verify Int32Array.of(1,2,3) length and values; Also verify verify Int32Array Array.isArray false; Also verify verify ArrayBuffer.isView Int32Array true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(3);

      {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      expect(Array.isArray(a)).assertFalse();
      }

      {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      expect(ArrayBuffer.isView(a)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0030
     * @tc.name int32ArrayOverviewPart06TestMindmapTest003
     * @tc.desc Verify Int32Array.from([1,2]) length and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1, 2];
      let a: Int32Array = Int32Array.from(src);
      expect(a.length).assertEqual(2);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0040
     * @tc.name int32ArrayOverviewPart06TestMindmapTest004
     * @tc.desc Verify ArrayBuffer new Int32Array(buf,0,2) length and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 2);
      expect(a.length).assertEqual(2);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0050
     * @tc.name int32ArrayOverviewPart06TestMindmapTest005
     * @tc.desc Verify subarray ArrayBuffer.isView true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let b: Int32Array = a.subarray(1, 2);
      expect(ArrayBuffer.isView(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0060
     * @tc.name int32ArrayOverviewPart06TestMindmapTest006
     * @tc.desc Verify slice ArrayBuffer.isView true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let b: Int32Array = a.slice(0, 2);
      expect(ArrayBuffer.isView(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0070
     * @tc.name int32ArrayOverviewPart06TestMindmapTest007
     * @tc.desc Verify new Int32Array(buf, 4, 2) byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 4, 2);
      expect(a.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0080
     * @tc.name int32ArrayOverviewPart06TestMindmapTest008
     * @tc.desc Verify new Int32Array(buf, 0, 2) buffer buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 2);
      expect(a.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0090
     * @tc.name int32ArrayOverviewPart06TestMindmapTest009
     * @tc.desc Verify length new Int32Array(buf, 8) length 2 buf=16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 8);
      expect(a.length).assertEqual(2);
      expect(a.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0100
     * @tc.name int32ArrayOverviewPart06TestMindmapTest010
     * @tc.desc Verify byteOffset/length new Int32Array(buf) buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf);
      expect(a.length).assertEqual(3);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0110
     * @tc.name int32ArrayOverviewPart06TestMindmapTest011
     * @tc.desc Verify Int32Array.of(10, 20, 30) 10 20 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      expect(a.$_get(0)).assertEqual(10);
      expect(a.$_get(1)).assertEqual(20);
      expect(a.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0120
     * @tc.name int32ArrayOverviewPart06TestMindmapTest012
     * @tc.desc Verify Int32Array.of(10, 20, 30) byteLength 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      expect(a.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0130
     * @tc.name int32ArrayOverviewPart06TestMindmapTest013
     * @tc.desc Verify Int32Array.from([1,2,3]) length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1, 2, 3];
      let a: Int32Array = Int32Array.from(src);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0140
     * @tc.name int32ArrayOverviewPart06TestMindmapTest014
     * @tc.desc Verify Int32Array.from mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(1, 2, 3);
      let _mapped: number[] = [];
      for (let _i: int = 0; _i < src.length; _i++) {
        _mapped.push(src.$_get(_i) * 2);
      }
      let a: Int32Array = Int32Array.from(_mapped);
      expect(a.$_get(0)).assertEqual(2);
      expect(a.$_get(1)).assertEqual(4);
      expect(a.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0150
     * @tc.name int32ArrayOverviewPart06TestMindmapTest015
     * @tc.desc Verify Int32Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1, 2, 3];
      Int32Array.from(src);
      expect(src.length).assertEqual(3);
      expect(src.$_get(0)).assertEqual(1);
      expect(src.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0160
     * @tc.name int32ArrayOverviewPart06TestMindmapTest016
     * @tc.desc Verify Int32Array.from Int32Array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(7, 8, 9);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0170
     * @tc.name int32ArrayOverviewPart06TestMindmapTest017
     * @tc.desc Verify at(0) number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let v: number | undefined = a.at(0);
      expect(v).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0180
     * @tc.name int32ArrayOverviewPart06TestMindmapTest018
     * @tc.desc Verify at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let v: number | undefined = a.at(-1);
      expect(v).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0190
     * @tc.name int32ArrayOverviewPart06TestMindmapTest019
     * @tc.desc Verify at(-length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let v: number | undefined = a.at(-3);
      expect(v).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0200
     * @tc.name int32ArrayOverviewPart06TestMindmapTest020
     * @tc.desc Verify at(0) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array();
      let v: number | undefined = a.at(0);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0210
     * @tc.name int32ArrayOverviewPart06TestMindmapTest021
     * @tc.desc Verify $_set(0, v) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      a.$_set(0, 42);
      expect(a.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0220
     * @tc.name int32ArrayOverviewPart06TestMindmapTest022
     * @tc.desc Verify $_set $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      a.$_set(1, 99);
      expect(a.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0230
     * @tc.name int32ArrayOverviewPart06TestMindmapTest023
     * @tc.desc Verify $_set index=length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      try {
        a.$_set(2, 100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0240
     * @tc.name int32ArrayOverviewPart06TestMindmapTest024
     * @tc.desc Verify $_get index=length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      try {
        a.$_get(2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0250
     * @tc.name int32ArrayOverviewPart06TestMindmapTest025
     * @tc.desc Verify Int32Array copy constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let r: Int32Array = new Int32Array(a);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0260
     * @tc.name int32ArrayOverviewPart06TestMindmapTest026
     * @tc.desc Verify Int32Array copy from buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let r: Int32Array = new Int32Array(a.buffer);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0270
     * @tc.name int32ArrayOverviewPart06TestMindmapTest027
     * @tc.desc Verify Int32Array set combines views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let other: Int32Array = Int32Array.of(3);
      let combined: Int32Array = new Int32Array(3);
      combined.set(a);
      combined.set(other, 2);
      expect(combined.length).assertEqual(3);
      expect(combined.$_get(2)).assertEqual(3);
      expect(a.length).assertEqual(2);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0280
     * @tc.name int32ArrayOverviewPart06TestMindmapTest028
     * @tc.desc Verify copyWithin this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: Int32Array = a.copyWithin(2, 0);
      expect(r).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0290
     * @tc.name int32ArrayOverviewPart06TestMindmapTest029
     * @tc.desc Verify copyWithin length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      a.copyWithin(2, 0, 2);
      expect(a.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0300
     * @tc.name int32ArrayOverviewPart06TestMindmapTest030
     * @tc.desc Verify entries() Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20);
      let it = a.entries();
      expect((it as Object) instanceof Int32Array).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0310
     * @tc.name int32ArrayOverviewPart06TestMindmapTest031
     * @tc.desc Verify keys() next().value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20);
      let it = a.keys();
      let first = it.next();
      expect(first.done).assertFalse();
      expect(first.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0320
     * @tc.name int32ArrayOverviewPart06TestMindmapTest032
     * @tc.desc Verify values() next().value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20);
      let it = a.values();
      let first = it.next();
      expect(first.done).assertFalse();
      expect(first.value).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0330
     * @tc.name int32ArrayOverviewPart06TestMindmapTest033
     * @tc.desc Verify entries() next().value [0,10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20);
      let firstIdx: number = -1;
      let firstVal: number = -1;
      let cnt: int = 0;
      for (let i: int = 0; i < a.length; i++) {
        let v: number = a.$_get(i);
        if (cnt === 0) {
          firstIdx = i;
          firstVal = v;
        }
        cnt++;
      }
      expect(firstIdx).assertEqual(0);
      expect(firstVal).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0340
     * @tc.name int32ArrayOverviewPart06TestMindmapTest034
     * @tc.desc Verify values next().done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10);
      let it = a.values();
      it.next();
      let end = it.next();
      expect(end.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0350
     * @tc.name int32ArrayOverviewPart06TestMindmapTest035
     * @tc.desc Verify $_iterator() values() next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(5, 6);
      let it1 = a.$_iterator();
      let it2 = a.values();
      expect(it1.next().value).assertEqual(it2.next().value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0360
     * @tc.name int32ArrayOverviewPart06TestMindmapTest036
     * @tc.desc Verify values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let it1 = a.values();
      let it2 = a.values();
      it1.next();
      expect(it2.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0370
     * @tc.name int32ArrayOverviewPart06TestMindmapTest037
     * @tc.desc Verify every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(2, 3, 6);
      let r: boolean = a.every((v: number, _i: int, _arr: Int32Array): boolean => v % 2 === 0);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0380
     * @tc.name int32ArrayOverviewPart06TestMindmapTest038
     * @tc.desc Verify every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array();
      let r: boolean = a.every((v: number, _i: int, _arr: Int32Array): boolean => false);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0390
     * @tc.name int32ArrayOverviewPart06TestMindmapTest039
     * @tc.desc Verify every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      a.every((v: number, _i: int, _arr: Int32Array): boolean => v > 0);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0400
     * @tc.name int32ArrayOverviewPart06TestMindmapTest040
     * @tc.desc Verify some true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(2, 3, 6);
      let r: boolean = a.some((v: number, _i: int, _arr: Int32Array): boolean => v === 3);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0410
     * @tc.name int32ArrayOverviewPart06TestMindmapTest041
     * @tc.desc Verify some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(2, 4, 6);
      let r: boolean = a.some((v: number, _i: int, _arr: Int32Array): boolean => v % 2 !== 0);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0420
     * @tc.name int32ArrayOverviewPart06TestMindmapTest042
     * @tc.desc Verify some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array();
      let r: boolean = a.some((v: number, _i: int, _arr: Int32Array): boolean => true);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0430
     * @tc.name int32ArrayOverviewPart06TestMindmapTest043
     * @tc.desc Verify fill this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let r: Int32Array = a.fill(7);
      expect(r).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0440
     * @tc.name int32ArrayOverviewPart06TestMindmapTest044
     * @tc.desc Verify fill length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.fill(1);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0450
     * @tc.name int32ArrayOverviewPart06TestMindmapTest045
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      a.fill(9, 1, 3);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(9);
      expect(a.$_get(2)).assertEqual(9);
      expect(a.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0460
     * @tc.name int32ArrayOverviewPart06TestMindmapTest046
     * @tc.desc Verify filter length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: Int32Array = a.filter((v: number, _i: int, _arr: Int32Array): boolean => v % 2 === 0);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0470
     * @tc.name int32ArrayOverviewPart06TestMindmapTest047
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: Int32Array = a.filter((v: number, _i: int, _arr: Int32Array): boolean => v > 2);
      expect(r.$_get(0)).assertEqual(3);
      expect(r.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0480
     * @tc.name int32ArrayOverviewPart06TestMindmapTest048
     * @tc.desc Verify filter buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = a.filter((v: number, _i: int, _arr: Int32Array): boolean => v > 1);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0490
     * @tc.name int32ArrayOverviewPart06TestMindmapTest049
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      a.filter((v: number, _i: int, _arr: Int32Array): boolean => v % 2 === 0);
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0500
     * @tc.name int32ArrayOverviewPart06TestMindmapTest050
     * @tc.desc Verify filter length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 3, 5);
      let r: Int32Array = a.filter((v: number, _i: int, _arr: Int32Array): boolean => v % 2 === 0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0510
     * @tc.name int32ArrayOverviewPart06TestMindmapTest051
     * @tc.desc Verify find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let r: number | undefined = a.find((v: number, _i: int, _arr: Int32Array): boolean => v === 20);
      expect(r).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0520
     * @tc.name int32ArrayOverviewPart06TestMindmapTest052
     * @tc.desc Verify find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let r: number | undefined = a.find((v: number, _i: int, _arr: Int32Array): boolean => v === 99);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0530
     * @tc.name int32ArrayOverviewPart06TestMindmapTest053
     * @tc.desc Verify findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let r: number = a.findIndex((v: number, _i: int, _arr: Int32Array): boolean => v === 30);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0540
     * @tc.name int32ArrayOverviewPart06TestMindmapTest054
     * @tc.desc Verify findIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let r: number = a.findIndex((v: number, _i: int, _arr: Int32Array): boolean => v === 99);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0550
     * @tc.name int32ArrayOverviewPart06TestMindmapTest055
     * @tc.desc Verify findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 20, 30);
      let r: number | undefined = a.findLast((v: number, _i: int, _arr: Int32Array): boolean => v === 20);
      expect(r).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0560
     * @tc.name int32ArrayOverviewPart06TestMindmapTest056
     * @tc.desc Verify findLastIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let r: number = a.findLastIndex((v: number, _i: int, _arr: Int32Array): boolean => v > 100);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0570
     * @tc.name int32ArrayOverviewPart06TestMindmapTest057
     * @tc.desc Verify find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      a.find((v: number, _i: int, _arr: Int32Array): boolean => v === 2);
      a.findIndex((v: number, _i: int, _arr: Int32Array): boolean => v === 2);
      a.findLast((v: number, _i: int, _arr: Int32Array): boolean => v === 2);
      a.findLastIndex((v: number, _i: int, _arr: Int32Array): boolean => v === 2);
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0580
     * @tc.name int32ArrayOverviewPart06TestMindmapTest058
     * @tc.desc Verify forEach undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let cnt: int = 0;
      a.forEach((_v: number, _i: int, _arr: Int32Array): void => {
        cnt = cnt + 1;
      });
      expect(cnt).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0590
     * @tc.name int32ArrayOverviewPart06TestMindmapTest059
     * @tc.desc Verify forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let sum: int = 0;
      a.forEach((v: number, _i: int, _arr: Int32Array): void => {
        sum += v;
      });
      expect(a.$_get(0)).assertEqual(1);
      expect(a.length).assertEqual(3);
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0600
     * @tc.name int32ArrayOverviewPart06TestMindmapTest060
     * @tc.desc Verify forEach 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array();
      let count: int = 0;
      a.forEach((_v: number, _i: int, _arr: Int32Array): void => {
        count++;
      });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0610
     * @tc.name int32ArrayOverviewPart06TestMindmapTest061
     * @tc.desc Verify includes true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      expect(a.includes(20)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0620
     * @tc.name int32ArrayOverviewPart06TestMindmapTest062
     * @tc.desc Verify includes false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      expect(a.includes(99)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0630
     * @tc.name int32ArrayOverviewPart06TestMindmapTest063
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 20, 30);
      expect(a.indexOf(20)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0640
     * @tc.name int32ArrayOverviewPart06TestMindmapTest064
     * @tc.desc Verify indexOf -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      expect(a.indexOf(99)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0650
     * @tc.name int32ArrayOverviewPart06TestMindmapTest065
     * @tc.desc Verify lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 20, 30);
      expect(a.lastIndexOf(20)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0660
     * @tc.name int32ArrayOverviewPart06TestMindmapTest066
     * @tc.desc Verify lastIndexOf -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      expect(a.lastIndexOf(99)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0670
     * @tc.name int32ArrayOverviewPart06TestMindmapTest067
     * @tc.desc Verify includes, indexOf, and lastIndexOf find an existing value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      expect(a.includes(20)).assertTrue();
      expect(a.indexOf(20)).assertEqual(1);
      expect(a.lastIndexOf(20)).assertEqual(1);
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(10);
      expect(a.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0680
     * @tc.name int32ArrayOverviewPart06TestMindmapTest068
     * @tc.desc Verify join string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1);
      let s: string = a.join();
      expect(s).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0690
     * @tc.name int32ArrayOverviewPart06TestMindmapTest069
     * @tc.desc Verify map doubles each value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v * 2);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(2);
      expect(r.$_get(1)).assertEqual(4);
      expect(r.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0700
     * @tc.name int32ArrayOverviewPart06TestMindmapTest070
     * @tc.desc Verify map length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v * 2);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0710
     * @tc.name int32ArrayOverviewPart06TestMindmapTest071
     * @tc.desc Verify map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v + 10);
      expect(r.$_get(0)).assertEqual(11);
      expect(r.$_get(1)).assertEqual(12);
      expect(r.$_get(2)).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0720
     * @tc.name int32ArrayOverviewPart06TestMindmapTest072
     * @tc.desc Verify map buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0730
     * @tc.name int32ArrayOverviewPart06TestMindmapTest073
     * @tc.desc Verify map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      a.map((v: number, _i: int, _arr: Int32Array): number => v * 2);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0740
     * @tc.name int32ArrayOverviewPart06TestMindmapTest074
     * @tc.desc Verify reduce initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let r: number = a.reduce((acc: number, v: number, _i: int, _arr: Int32Array): number => acc + v, 100);
      expect(r).assertEqual(106);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0750
     * @tc.name int32ArrayOverviewPart06TestMindmapTest075
     * @tc.desc Verify reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let r: number = a.reduceRight((acc: number, v: number, _i: int, _arr: Int32Array): number => acc * 10 + v);
      expect(r).assertEqual(321);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0760
     * @tc.name int32ArrayOverviewPart06TestMindmapTest076
     * @tc.desc Verify reduceRight initialValue initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array();
      let r: number = a.reduceRight((acc: number, v: number, _i: int, _arr: Int32Array): number => acc + 1, 7);
      expect(r).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0770
     * @tc.name int32ArrayOverviewPart06TestMindmapTest077
     * @tc.desc Verify reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      a.reduce((acc: number, v: number, _i: int, _arr: Int32Array): number => acc + v, 0);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0780
     * @tc.name int32ArrayOverviewPart06TestMindmapTest078
     * @tc.desc Verify reverse this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = a.reverse();
      expect(r).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0790
     * @tc.name int32ArrayOverviewPart06TestMindmapTest079
     * @tc.desc Verify reverse length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      a.reverse();
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0800
     * @tc.name int32ArrayOverviewPart06TestMindmapTest080
     * @tc.desc Verify set(array) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let src: Int32Array = Int32Array.of(7, 8);
      a.set(src);
      expect(a.$_get(0)).assertEqual(7);
      expect(a.$_get(1)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0810
     * @tc.name int32ArrayOverviewPart06TestMindmapTest081
     * @tc.desc Verify set(array, offset) offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let src: Int32Array = Int32Array.of(5, 6);
      a.set(src, 1);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(5);
      expect(a.$_get(2)).assertEqual(6);
      expect(a.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0820
     * @tc.name int32ArrayOverviewPart06TestMindmapTest082
     * @tc.desc Verify set length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let src: Int32Array = Int32Array.of(1, 2);
      a.set(src);
      expect(a.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0830
     * @tc.name int32ArrayOverviewPart06TestMindmapTest083
     * @tc.desc Verify slice returns values at indexes 1 and 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: Int32Array = a.slice(1, 3);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(2);
      expect(r.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0840
     * @tc.name int32ArrayOverviewPart06TestMindmapTest084
     * @tc.desc Verify slice buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = a.slice(0, 2);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0850
     * @tc.name int32ArrayOverviewPart06TestMindmapTest085
     * @tc.desc Verify slice byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30, 40);
      let r: Int32Array = a.slice(1, 3);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0860
     * @tc.name int32ArrayOverviewPart06TestMindmapTest086
     * @tc.desc Verify slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      a.slice(1, 3);
      expect(a.length).assertEqual(4);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0870
     * @tc.name int32ArrayOverviewPart06TestMindmapTest087
     * @tc.desc Verify sort this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(3, 1, 2);
      let r: Int32Array = a.sort();
      expect(r).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0880
     * @tc.name int32ArrayOverviewPart06TestMindmapTest088
     * @tc.desc Verify sort length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(3, 1, 2);
      a.sort();
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0890
     * @tc.name int32ArrayOverviewPart06TestMindmapTest089
     * @tc.desc Verify subarray shares the selected values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: Int32Array = a.subarray(1, 3);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(2);
      expect(r.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0900
     * @tc.name int32ArrayOverviewPart06TestMindmapTest090
     * @tc.desc Verify subarray(1,3) length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: Int32Array = a.subarray(1, 3);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0910
     * @tc.name int32ArrayOverviewPart06TestMindmapTest091
     * @tc.desc Verify subarray begin>=end length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = a.subarray(2, 1);
      expect(r.length).assertEqual(0);
      expect(r.buffer).assertEqual(a.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0920
     * @tc.name int32ArrayOverviewPart06TestMindmapTest092
     * @tc.desc Verify subarray end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: Int32Array = a.subarray(2);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(3);
      expect(r.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0930
     * @tc.name int32ArrayOverviewPart06TestMindmapTest093
     * @tc.desc Verify subarray(1,3) byteOffset 4 byteLength 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: Int32Array = a.subarray(1, 3);
      expect(r.byteOffset).assertEqual(4);
      expect(r.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0940
     * @tc.name int32ArrayOverviewPart06TestMindmapTest094
     * @tc.desc Verify toReversed returns values in reverse order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = a.toReversed();
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(3);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0950
     * @tc.name int32ArrayOverviewPart06TestMindmapTest095
     * @tc.desc Verify toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      a.toReversed();
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0960
     * @tc.name int32ArrayOverviewPart06TestMindmapTest096
     * @tc.desc Verify toReversed buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = a.toReversed();
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0970
     * @tc.name int32ArrayOverviewPart06TestMindmapTest097
     * @tc.desc Verify toReversed byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = a.toReversed();
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0980
     * @tc.name int32ArrayOverviewPart06TestMindmapTest098
     * @tc.desc Verify toSorted byteLength byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(3, 1, 2, 4);
      let r: Int32Array = a.toSorted();
      expect(r.byteLength).assertEqual(a.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_0990
     * @tc.name int32ArrayOverviewPart06TestMindmapTest099
     * @tc.desc Verify toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(3, 1, 2);
      a.toSorted();
      expect(a.$_get(0)).assertEqual(3);
      expect(a.$_get(1)).assertEqual(1);
      expect(a.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_1000
     * @tc.name int32ArrayOverviewPart06TestMindmapTest100
     * @tc.desc Verify with(index,value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = a.with(1, 99);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(99);
      expect(r.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_1010
     * @tc.name int32ArrayOverviewPart06TestMindmapTest101
     * @tc.desc Verify with length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let r: Int32Array = a.with(1, 99);
      expect(r.length).assertEqual(a.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_1020
     * @tc.name int32ArrayOverviewPart06TestMindmapTest102
     * @tc.desc Verify with buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let r: Int32Array = a.with(1, 99);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_1030
     * @tc.name int32ArrayOverviewPart06TestMindmapTest103
     * @tc.desc Verify with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      a.with(1, 99);
      expect(a.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_1040
     * @tc.name int32ArrayOverviewPart06TestMindmapTest104
     * @tc.desc Verify toString string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1);
      let s: string = a.toString();
      expect(s).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_1050
     * @tc.name int32ArrayOverviewPart06TestMindmapTest105
     * @tc.desc Verify toLocaleString string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let s: string = a.toLocaleString();
      expect(s.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_1060
     * @tc.name int32ArrayOverviewPart06TestMindmapTest106
     * @tc.desc Verify length BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let b: Int32Array = new Int32Array(100);
      expect(a.BYTES_PER_ELEMENT).assertEqual(4);
      expect(b.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_1070
     * @tc.name int32ArrayOverviewPart06TestMindmapTest107
     * @tc.desc Verify ArrayBuffer Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 4);
      let b: Int32Array = new Int32Array(buf, 0, 4);
      a.$_set(0, 111);
      expect(b.$_get(0)).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_1080
     * @tc.name int32ArrayOverviewPart06TestMindmapTest108
     * @tc.desc Verify byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 4);
      let c: Int32Array = new Int32Array(buf, 8, 2);
      a.$_set(2, 77);
      expect(c.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_1090
     * @tc.name int32ArrayOverviewPart06TestMindmapTest109
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sub: Int32Array = a.subarray(1, 3);
      sub.$_set(1, 55);
      expect(a.$_get(2)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_1100
     * @tc.name int32ArrayOverviewPart06TestMindmapTest110
     * @tc.desc Verify slice buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30, 40);
      let b: Int32Array = a.slice(1, 3);
      b.$_set(0, 888);
      expect(a.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_1110
     * @tc.name int32ArrayOverviewPart06TestMindmapTest111
     * @tc.desc Verify reverse().reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = a.reverse().reverse();
      expect(r).assertEqual(a);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_1120
     * @tc.name int32ArrayOverviewPart06TestMindmapTest112
     * @tc.desc Verify fill().sort().reverse() this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let r1: Int32Array = a.fill(1);
      let r2: Int32Array = r1.sort();
      let r3: Int32Array = r2.reverse();
      expect(r1).assertEqual(a);
      expect(r2).assertEqual(a);
      expect(r3).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_1130
     * @tc.name int32ArrayOverviewPart06TestMindmapTest113
     * @tc.desc Verify copyWithin this $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      let v: number = a.copyWithin(0, 2).$_get(0);
      expect(v).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART06_TEST_MINDMAP_1140
     * @tc.name int32ArrayOverviewPart06TestMindmapTest114
     * @tc.desc Verify toReversed reverse / toReversed buffer reverse buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart06TestMindmapTest114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let origBuf: ArrayBuffer = a.buffer;
      a.toReversed();
      expect(a.buffer).assertEqual(origBuf);
    });
  });
}
