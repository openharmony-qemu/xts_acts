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

export default function int32ArrayIndexGetPart02Test(): void {
  describe('Int32ArrayIndexGetPart02Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_0100
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest001
     * @tc.desc Verify $_get returns the expected element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([123]);
      let v: number = a.$_get(0);
      expect(v).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_0200
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest002
     * @tc.desc Verify $_get returns the expected element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let v: number = a.$_get(0);
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_0300
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest003
     * @tc.desc Verify $_get returns the expected element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-100]);
      let v: number = a.$_get(0);
      expect(v).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_0400
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest004
     * @tc.desc Verify $_get() INT_MAX returns 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 2147483647);
      let v: number = a.$_get(0);
      expect(v).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_0500
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest005
     * @tc.desc Verify $_get() INT_MIN returns -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, -2147483648);
      let v: number = a.$_get(0);
      expect(v).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_0600
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest006
     * @tc.desc Verify $_get() -1 -1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, -1);
      let v: number = a.$_get(0);
      expect(v).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_0700
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest007
     * @tc.desc Verify $_get() 2 index=0 index=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([11, 22]);
      let firstVal: number = a.$_get(0);
      let secondVal: number = a.$_get(1);
      expect(firstVal).assertEqual(11);
      expect(secondVal).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_0800
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest008
     * @tc.desc Verify $_get returns the same value for three repeated accesses at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([777]);
      let r1: number = a.$_get(0);
      let r2: number = a.$_get(0);
      let r3: number = a.$_get(0);
      expect(r1).assertEqual(777);
      expect(r2).assertEqual(777);
      expect(r3).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_0900
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest009
     * @tc.desc Verify $_get returns the same value when accessed twice at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20]);
      let first0: number = a.$_get(0);
      let _m1: number = a.$_get(1);
      let again0: number = a.$_get(0);
      expect(first0).assertEqual(10);
      expect(_m1).assertEqual(20);
      expect(again0).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_1000
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest010
     * @tc.desc Verify $_get() of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(100, 200, 300);
      expect(a.$_get(0)).assertEqual(100);
      {
        let a: Int32Array = Int32Array.of(100, 200, 300);
        expect(a.$_get(2)).assertEqual(300);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_1100
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest011
     * @tc.desc Verify $_get() from([...])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [-50, 0, 50];
      let a: Int32Array = Int32Array.from(src);
      expect(a.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_1200
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest012
     * @tc.desc Verify ArrayBuffer $_get 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let a: Int32Array = new Int32Array(buf);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_1300
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest013
     * @tc.desc Verify $_get() new Int32Array(3) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_1400
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest014
     * @tc.desc Verify 255 $_get 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 255);
      expect(a.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_1500
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest015
     * @tc.desc Verify -255 $_get -255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, -255);
      expect(a.$_get(0)).assertEqual(-255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_1600
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest016
     * @tc.desc Verify 32767 int16 MAX $_get 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 32767);
      expect(a.$_get(0)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_1700
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest017
     * @tc.desc Verify -32768 int16 MIN $_get -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, -32768);
      expect(a.$_get(0)).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_1800
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest018
     * @tc.desc Verify 65535 uint16 MAX $_get 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 65535);
      expect(a.$_get(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_1900
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest019
     * @tc.desc Verify $_get() +1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([41]);
      let v: number = a.$_get(0) + 1;
      expect(v).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_2000
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest020
     * @tc.desc Verify $_get length length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let _v: number = a.$_get(1);
      expect(_v).assertEqual(2);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_2100
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest021
     * @tc.desc Verify $_get byteLength length=4 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let _v: number = a.$_get(0);
      expect(_v).assertEqual(0);
      expect(a.byteLength).assertEqual(16);
      {
        let a: Int32Array = new Int32Array(4);
        let _v: number = a.$_get(2);
        expect(_v).assertEqual(0);
        expect(a.byteOffset).assertEqual(0);
      }
      {
        let a: Int32Array = new Int32Array(2);
        let _v: number = a.$_get(0);
        expect(_v).assertEqual(0);
        expect(a.BYTES_PER_ELEMENT).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_2200
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest022
     * @tc.desc Verify byteOffset=4 $_get byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 4, 3);
      let _v: number = a.$_get(0);
      expect(_v).assertEqual(0);
      expect(a.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_2300
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest023
     * @tc.desc Verify byteOffset=8 length=2 $_get length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let a: Int32Array = new Int32Array(buf, 8, 2);
      let _v: number = a.$_get(1);
      expect(_v).assertEqual(0);
      expect(a.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_2400
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest024
     * @tc.desc Verify $_get returns consistent value on repeated access at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([55]);
      let _v: number = a.$_get(0);
      expect(_v).assertEqual(55);
      expect(a.$_get(0)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_2500
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest025
     * @tc.desc Verify $_get index=1 index=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20]);
      let _v: number = a.$_get(1);
      expect(_v).assertEqual(20);
      expect(a.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_2600
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest026
     * @tc.desc Verify $_get index=0 index=length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let _v: number = a.$_get(0);
      expect(_v).assertEqual(10);
      expect(a.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_2700
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest027
     * @tc.desc Verify $_get ArrayBuffer DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let dv: DataView = new DataView(buf);
      dv.setInt32(0, 12345, true);
      let a: Int32Array = new Int32Array(buf);
      let _v: number = a.$_get(0);
      expect(_v).assertEqual(12345);
      expect(dv.getInt32(0, true)).assertEqual(12345);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_2800
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest028
     * @tc.desc Verify $_get toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let before: string = a.toString();
      let _v: number = a.$_get(0);
      expect(_v).assertEqual(1);
      let after: string = a.toString();
      expect(before).assertEqual(after);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_2900
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest029
     * @tc.desc Verify $_get join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let before: string = a.join(',');
      let _v: number = a.$_get(2);
      expect(_v).assertEqual(30);
      let after: string = a.join(',');
      expect(before).assertEqual(after);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_3000
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest030
     * @tc.desc Verify ArrayBuffer Int32Array $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a1: Int32Array = new Int32Array(buf, 0, 2);
      let a2: Int32Array = new Int32Array(buf, 0, 2);
      a1.$_set(0, 111);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_3100
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest031
     * @tc.desc Verify $_set $_get offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf, 0, 3);
      let b: Int32Array = new Int32Array(buf, 0, 3);
      a.$_set(1, 222);
      expect(b.$_get(1)).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_3200
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest032
     * @tc.desc Verify byteOffset=0 index=1 byteOffset=4 $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf, 0, 3);
      let b: Int32Array = new Int32Array(buf, 4, 2);
      a.$_set(1, 333);
      expect(b.$_get(0)).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_3300
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest033
     * @tc.desc Verify byteOffset=4 index=1 byteOffset=0 $_get(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 4);
      let b: Int32Array = new Int32Array(buf, 4, 2);
      b.$_set(1, 444);
      expect(a.$_get(2)).assertEqual(444);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_3400
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest034
     * @tc.desc Verify buffer $_get copy $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = new Int32Array(buf);
      let r1: number = b.$_get(0);
      a.$_set(0, 999);
      let r2: number = b.$_get(0);
      expect(r1).assertEqual(0);
      expect(r2).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_3500
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest035
     * @tc.desc Verify subarray $_get(0) $_get(begin)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let child: Int32Array = parent.subarray(2, 4);
      expect(child.$_get(0)).assertEqual(parent.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_3600
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest036
     * @tc.desc Verify subarray $_get(length-1) $_get(end-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let child: Int32Array = parent.subarray(2, 4);
      expect(child.$_get(child.length - 1)).assertEqual(parent.$_get(3));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_3700
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest037
     * @tc.desc Verify subarray $_get reflects parent mutation through shared underlying buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3]);
      let child: Int32Array = parent.subarray(0, 3);
      parent.$_set(1, 99);
      expect(child.$_get(1)).assertEqual(99);
      {
        let parent: Int32Array = new Int32Array([1, 2, 3]);
        let child: Int32Array = parent.subarray(1, 3);
        child.$_set(0, 88);
        expect(parent.$_get(1)).assertEqual(88);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_3800
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest038
     * @tc.desc Verify slice buffer $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let s: Int32Array = a.slice();
      s.$_set(0, 777);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_3900
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest039
     * @tc.desc Verify DataView Int32Array $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let dv: DataView = new DataView(buf);
      dv.setUint32(0, 0x12345678, true);
      let a: Int32Array = new Int32Array(buf);
      expect(a.$_get(0)).assertEqual(0x12345678);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_4000
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest040
     * @tc.desc Verify $_get(0) [0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([42]);
      expect(a.$_get(0)).assertEqual(a[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_4100
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest041
     * @tc.desc Verify $_get(length-1) [length-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      expect(a.$_get(a.length - 1)).assertEqual(a[a.length - 1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_4200
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest042
     * @tc.desc Verify $_get(0) at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([5]);
      expect(a.$_get(0)).assertEqual(a.at(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_4300
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest043
     * @tc.desc Verify $_get(length-1) at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      expect(a.$_get(a.length - 1)).assertEqual(a.at(-1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_4400
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest044
     * @tc.desc Verify forEach $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      a.forEach((v: number, i: int) => {
        expect(v).assertEqual(a.$_get(i));
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_4500
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest045
     * @tc.desc Verify for-of.$_get(i)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([5, 15, 25]);
      let i: int = 0;
      for (let v of a) {
        expect(v).assertEqual(a.$_get(i));
        i += 1;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_4600
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest046
     * @tc.desc Verify map.$_get(i) v
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([3, 6, 9]);
      a.map((v: number, i: int) => {
        expect(v).assertEqual(a.$_get(i));
        return v;
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_4700
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest047
     * @tc.desc Verify reduce 0.$_get(i)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4]);
      let sum: number = a.reduce((acc: number, v: number, i: int) => acc + a.$_get(i), 0);
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_4800
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest048
     * @tc.desc Verify 0x0000007F 127 $_get 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 0x0000007F);
      expect(a.$_get(0)).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_4900
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest049
     * @tc.desc Verify 0x00000080 128 $_get 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 0x00000080);
      expect(a.$_get(0)).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_5000
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest050
     * @tc.desc Verify 0x00008000 32768 $_get 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 0x00008000);
      expect(a.$_get(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_5100
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest051
     * @tc.desc Verify 0x7FFFFFFE MAX-1 $_get 2147483646
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 0x7FFFFFFE);
      expect(a.$_get(0)).assertEqual(2147483646);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_5200
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest052
     * @tc.desc Verify 0x80000001 MIN+1=-2147483647 $_get -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 0x80000001);
      expect(a.$_get(0)).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_5300
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest053
     * @tc.desc Verify $_get fill number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([42]);
      let snap: number = a.$_get(0);
      a.fill(0);
      expect(snap).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_5400
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest054
     * @tc.desc Verify $_get $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([100]);
      let old: number = a.$_get(0);
      a.$_set(0, 200);
      expect(old).assertEqual(100);
      expect(a.$_get(0)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART02_TEST_MINDMAP_5500
     * @tc.name int32ArrayIndexGetPart02TestMindmapTest055
     * @tc.desc Verify $_get -1 if truthy -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart02TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-1]);
      let v: number = a.$_get(0);
      expect(v).assertEqual(-1);
    });


  });
}
