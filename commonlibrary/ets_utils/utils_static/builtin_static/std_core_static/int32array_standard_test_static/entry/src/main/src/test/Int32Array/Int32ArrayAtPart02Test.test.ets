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
export default function int32ArrayAtPart02TestMindmapTestTest(): void {
  describe('Int32ArrayAtPart02TestMindmapTestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_0100
     * @tc.name int32ArrayAtPart02TestMindmapTest001
     * @tc.desc Verify at(0) returns stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(42);
      let v = a.at(0)!;
      expect(v).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_0200
     * @tc.name int32ArrayAtPart02TestMindmapTest002
     * @tc.desc Verify at(99) out-of-bounds undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      expect(a.at(99)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_0300
     * @tc.name int32ArrayAtPart02TestMindmapTest003
     * @tc.desc Verify at + 1 + 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10);
      let n = a.at(0)!;
      let sum: number = n + 1;
      expect(sum).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_0400
     * @tc.name int32ArrayAtPart02TestMindmapTest004
     * @tc.desc Verify at 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let n = a.at(0)!;
      expect(n).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_0500
     * @tc.name int32ArrayAtPart02TestMindmapTest005
     * @tc.desc Verify at results convert to string for positive, negative, and zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(123, -456, 0);
      expect(a.at(0)!.toString()).assertEqual('123');
      expect(a.at(1)!.toString()).assertEqual('-456');
      expect(a.at(2)!.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_0600
     * @tc.name int32ArrayAtPart02TestMindmapTest006
     * @tc.desc Verify at valueOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(77);
      let n = a.at(0)!;
      expect(n.valueOf()).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_0700
     * @tc.name int32ArrayAtPart02TestMindmapTest007
     * @tc.desc Verify at(0) returns same value on repeated call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(77);
      let n1 = a.at(0)!;
      let n2 = a.at(0)!;
      expect(n1).assertEqual(n2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_0800
     * @tc.name int32ArrayAtPart02TestMindmapTest008
     * @tc.desc Verify at(0) INT_MAX(2147483647) 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(2147483647);
      expect(a.at(0)!).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_0900
     * @tc.name int32ArrayAtPart02TestMindmapTest009
     * @tc.desc Verify at(0) INT_MIN(-2147483648) -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-2147483648);
      expect(a.at(0)!).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_1000
     * @tc.name int32ArrayAtPart02TestMindmapTest010
     * @tc.desc Verify at(0) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1);
      expect(a.at(0)!).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_1100
     * @tc.name int32ArrayAtPart02TestMindmapTest011
     * @tc.desc Verify at(0) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-1);
      expect(a.at(0)!).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_1200
     * @tc.name int32ArrayAtPart02TestMindmapTest012
     * @tc.desc Verify at(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      expect(a.at(0)!).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_1300
     * @tc.name int32ArrayAtPart02TestMindmapTest013
     * @tc.desc Verify fill converts NaN and infinities to zero when read by at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.fill(Double.NaN);
      expect(a.at(0)!).assertEqual(0);
      a.fill(Double.POSITIVE_INFINITY);
      expect(a.at(0)!).assertEqual(0);
      a.fill(Double.NEGATIVE_INFINITY);
      expect(a.at(0)!).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_1400
     * @tc.name int32ArrayAtPart02TestMindmapTest014
     * @tc.desc Verify INT_MAX at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 2147483647);
      expect(a.at(0)!).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_1500
     * @tc.name int32ArrayAtPart02TestMindmapTest015
     * @tc.desc Verify INT_MIN at -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, -2147483648);
      expect(a.at(0)!).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_1600
     * @tc.name int32ArrayAtPart02TestMindmapTest016
     * @tc.desc Verify at(0) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 0);
      expect(a.at(0)!).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_1700
     * @tc.name int32ArrayAtPart02TestMindmapTest017
     * @tc.desc Verify at byteLength length * 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      a.at(2);
      expect(a.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_1800
     * @tc.name int32ArrayAtPart02TestMindmapTest018
     * @tc.desc Verify byteOffset=4 at byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 4, 2);
      a.at(0)!;
      expect(a.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_1900
     * @tc.name int32ArrayAtPart02TestMindmapTest019
     * @tc.desc Verify at BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      a.at(0)!;
      expect(a.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_2000
     * @tc.name int32ArrayAtPart02TestMindmapTest020
     * @tc.desc Verify at access does not change length for normal, boundary, and out-of-bounds indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      a.at(0)!;
      a.at(2);
      a.at(-1);
      a.at(5);
      a.at(999);
      a.at(-999);
      expect(a.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_2100
     * @tc.name int32ArrayAtPart02TestMindmapTest021
     * @tc.desc Verify at length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      a.at(0);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_2200
     * @tc.name int32ArrayAtPart02TestMindmapTest022
     * @tc.desc Verify at ArrayBuffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf);
      a.at(3);
      expect(buf.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_2300
     * @tc.name int32ArrayAtPart02TestMindmapTest023
     * @tc.desc Verify ArrayBuffer at length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let a: Int32Array = new Int32Array(buf);
      a.at(0);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_2400
     * @tc.name int32ArrayAtPart02TestMindmapTest024
     * @tc.desc Verify at reads selected elements without changing other Int32Array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(11, 22, 33);
      expect(a.at(0)).assertEqual(11);
      expect(a.at(1)).assertEqual(22);
      expect(a.$_get(0)).assertEqual(11);
      expect(a.$_get(1)).assertEqual(22);
      expect(a.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_2500
     * @tc.name int32ArrayAtPart02TestMindmapTest025
     * @tc.desc Verify at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-10, -20);
      let r: number | undefined = a.at(-1);
      expect(r).assertEqual(-20);
      expect(a.$_get(0)).assertEqual(-10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_2600
     * @tc.name int32ArrayAtPart02TestMindmapTest026
     * @tc.desc Verify at(999)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let r: number | undefined = a.at(999);
      expect(r).assertEqual(undefined);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_2700
     * @tc.name int32ArrayAtPart02TestMindmapTest027
     * @tc.desc Verify at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(50);
      let r: number | undefined = a.at(0);
      expect(r).assertEqual(50);
      expect(a.$_get(0)).assertEqual(50);
      let returned = a.at(0)!;
      returned = returned * 100;
      expect(a.$_get(0)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_2800
     * @tc.name int32ArrayAtPart02TestMindmapTest028
     * @tc.desc Verify at(-2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30, 40);
      let r: number | undefined = a.at(-2);
      expect(r).assertEqual(30);
      expect(a.$_get(3)).assertEqual(40);
      expect(a.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_2900
     * @tc.name int32ArrayAtPart02TestMindmapTest029
     * @tc.desc Verify at Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let v: number | undefined = a.at(0)!;
      let isArr: boolean = (v as Object) instanceof Int32Array;
      expect(isArr).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_3000
     * @tc.name int32ArrayAtPart02TestMindmapTest030
     * @tc.desc Verify at undefined Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1);
      let v: number | undefined = a.at(5);
      expect(v).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_3100
     * @tc.name int32ArrayAtPart02TestMindmapTest031
     * @tc.desc Verify at reads both positive endpoint elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      expect(a.at(0)!).assertEqual(10);
      expect(a.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_3200
     * @tc.name int32ArrayAtPart02TestMindmapTest032
     * @tc.desc Verify index at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(99);
      let valFirst = a.at(0)!;
      let valSecond = a.at(0)!;
      expect(valFirst).assertEqual(99);
      expect(valSecond).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_3300
     * @tc.name int32ArrayAtPart02TestMindmapTest033
     * @tc.desc Verify at returns the expected numeric value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1);
       let result: number = a.at(0)!;
       expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_3400
     * @tc.name int32ArrayAtPart02TestMindmapTest034
     * @tc.desc Verify positive and negative out-of-bounds access on an empty Int32Array returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      expect(a.at(0)).assertEqual(undefined);
      expect(a.at(-1)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_3500
     * @tc.name int32ArrayAtPart02TestMindmapTest035
     * @tc.desc Verify at(length) undefined 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0, 0, 0);
      expect(a.at(3)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_3600
     * @tc.name int32ArrayAtPart02TestMindmapTest036
     * @tc.desc Verify at === undefined true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let v: number | undefined = a.at(100);
      let isUndef: boolean = v === undefined;
      expect(isUndef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_3700
     * @tc.name int32ArrayAtPart02TestMindmapTest037
     * @tc.desc Verify at undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(5);
      let v: number | undefined = a.at(0)!;
      let isUndef: boolean = v === undefined;
      expect(isUndef).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_3800
     * @tc.name int32ArrayAtPart02TestMindmapTest038
     * @tc.desc Verify at(1) undefined at(-2) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(42);
      expect(a.at(1)).assertEqual(undefined);
      expect(a.at(-2)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_3900
     * @tc.name int32ArrayAtPart02TestMindmapTest039
     * @tc.desc Verify undefined null at undefined null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1);
      let v: number | undefined = a.at(99);
      expect(v).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_4000
     * @tc.name int32ArrayAtPart02TestMindmapTest040
     * @tc.desc Verify new Int32Array(3) at(0)/at(1)/at(2) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      expect(a.at(0)!).assertEqual(0);
      expect(a.at(1)).assertEqual(0);
      expect(a.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_4100
     * @tc.name int32ArrayAtPart02TestMindmapTest041
     * @tc.desc Verify new Int32Array([-1,-2]) at(1) -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-1, -2]);
      expect(a.at(1)).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_4200
     * @tc.name int32ArrayAtPart02TestMindmapTest042
     * @tc.desc Verify Int32Array.from([10,20]) at(-1) 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([10, 20]);
      expect(a.at(-1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_4300
     * @tc.name int32ArrayAtPart02TestMindmapTest043
     * @tc.desc Verify Int32Array.from mapfn (v,_i)=>v+1 at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([10, 20], (v, _i) => v + 1);
      expect(a.at(0)!).assertEqual(11);
      expect(a.at(1)).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_4400
     * @tc.name int32ArrayAtPart02TestMindmapTest044
     * @tc.desc Verify ArrayBuffer at(0)/at(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(buf);
      expect(a.at(0)!).assertEqual(0);
      expect(a.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_4500
     * @tc.name int32ArrayAtPart02TestMindmapTest045
     * @tc.desc Verify ArrayBuffer byteOffset=4 at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf);
      parent.$_set(1, 777);
      let child: Int32Array = new Int32Array(buf, 4, 3);
      expect(child.at(0)!).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_4600
     * @tc.name int32ArrayAtPart02TestMindmapTest046
     * @tc.desc Verify byteOffset=8 at(0)/at(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let parent: Int32Array = new Int32Array(buf);
      parent.$_set(2, 111);
      parent.$_set(3, 222);
      let child: Int32Array = new Int32Array(buf, 8, 2);
      expect(child.at(0)!).assertEqual(111);
      expect(child.at(1)).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_4700
     * @tc.name int32ArrayAtPart02TestMindmapTest047
     * @tc.desc Verify fill(9) at 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.fill(9);
      expect(a.at(1)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_4800
     * @tc.name int32ArrayAtPart02TestMindmapTest048
     * @tc.desc Verify set([11,22,33],0) at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.set([11, 22, 33], 0);
      expect(a.at(0)!).assertEqual(11);
      expect(a.at(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_4900
     * @tc.name int32ArrayAtPart02TestMindmapTest049
     * @tc.desc Verify $_set(2,555) at(2) 555
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      a.$_set(2, 555);
      expect(a.at(2)).assertEqual(555);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_5000
     * @tc.name int32ArrayAtPart02TestMindmapTest050
     * @tc.desc Verify reverse() at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      a.reverse();
      expect(a.at(0)!).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_5100
     * @tc.name int32ArrayAtPart02TestMindmapTest051
     * @tc.desc Verify sort() at(0) at(length-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(30, 10, 20);
      a.sort();
      expect(a.at(0)!).assertEqual(10);
      expect(a.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_5200
     * @tc.name int32ArrayAtPart02TestMindmapTest052
     * @tc.desc Verify copyWithin(2,0,2) at(2)/at(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30, 40);
      a.copyWithin(2, 0, 2);
      expect(a.at(2)).assertEqual(10);
      expect(a.at(3)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_5300
     * @tc.name int32ArrayAtPart02TestMindmapTest053
     * @tc.desc Verify fill fill(7,1,3) at(0)/at(1)/at(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      a.fill(7, 1, 3);
      expect(a.at(0)!).assertEqual(0);
      expect(a.at(1)).assertEqual(7);
      expect(a.at(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_5400
     * @tc.name int32ArrayAtPart02TestMindmapTest054
     * @tc.desc Verify buffer set at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf);
      let child: Int32Array = new Int32Array(buf, 0, 4);
      parent.$_set(0, 111);
      expect(child.at(0)!).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_5500
     * @tc.name int32ArrayAtPart02TestMindmapTest055
     * @tc.desc Verify byteOffset=8 at(0) at(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf);
      let child: Int32Array = new Int32Array(buf, 8, 2);
      parent.$_set(2, 222);
      expect(child.at(0)!).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_5600
     * @tc.name int32ArrayAtPart02TestMindmapTest056
     * @tc.desc Verify subarray(1,3) at(0) at(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = Int32Array.of(10, 20, 30, 40);
      let sub: Int32Array = parent.subarray(1, 3);
      expect(sub.at(0)!).assertEqual(parent.at(1));
      expect(sub.at(1)!).assertEqual(parent.at(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_5700
     * @tc.name int32ArrayAtPart02TestMindmapTest057
     * @tc.desc Verify subarray $_set at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = Int32Array.of(1, 2, 3);
      let sub: Int32Array = parent.subarray(1, 3);
      sub.$_set(0, 999);
      expect(parent.at(1)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_5800
     * @tc.name int32ArrayAtPart02TestMindmapTest058
     * @tc.desc Verify set(array,offset) subarray at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array(4);
      let sub: Int32Array = parent.subarray(1, 4);
      parent.set([7, 8], 1);
      expect(sub.at(0)!).assertEqual(7);
      expect(sub.at(1)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_5900
     * @tc.name int32ArrayAtPart02TestMindmapTest059
     * @tc.desc Verify subarray fill at fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array(5);
      let sub: Int32Array = parent.subarray(2, 4);
      sub.fill(123);
      expect(parent.at(2)).assertEqual(123);
      expect(parent.at(3)).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_6000
     * @tc.name int32ArrayAtPart02TestMindmapTest060
     * @tc.desc Verify subarray reverse at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = Int32Array.of(0, 1, 2, 3, 4);
      let sub: Int32Array = parent.subarray(1, 4);
      sub.reverse();
      expect(parent.at(1)).assertEqual(3);
      expect(parent.at(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_6100
     * @tc.name int32ArrayAtPart02TestMindmapTest061
     * @tc.desc Verify Uint8Array Int32Array at int32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let u8: Uint8Array = new Uint8Array(buf);
      u8.$_set(0, 0xFF);
      u8.$_set(1, 0xFF);
      u8.$_set(2, 0xFF);
      u8.$_set(3, 0x7F);
      let i32: Int32Array = new Int32Array(buf);
      expect(i32.at(0)!).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_6200
     * @tc.name int32ArrayAtPart02TestMindmapTest062
     * @tc.desc Verify Uint8Array INT_MIN 0x00,0x00,0x00,0x80 Int32Array at -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let u8: Uint8Array = new Uint8Array(buf);
      u8.$_set(0, 0x00);
      u8.$_set(1, 0x00);
      u8.$_set(2, 0x00);
      u8.$_set(3, 0x80);
      let i32: Int32Array = new Int32Array(buf);
      expect(i32.at(0)!).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_6300
     * @tc.name int32ArrayAtPart02TestMindmapTest063
     * @tc.desc Verify slice at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let s: Int32Array = a.slice();
      expect(s.at(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_6400
     * @tc.name int32ArrayAtPart02TestMindmapTest064
     * @tc.desc Verify slice(1,3) at(0)/at(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30, 40);
      let s: Int32Array = a.slice(1, 3);
      expect(s.at(0)!).assertEqual(20);
      expect(s.at(1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_6500
     * @tc.name int32ArrayAtPart02TestMindmapTest065
     * @tc.desc Verify slice at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let s: Int32Array = a.slice();
      s.$_set(0, 999);
      expect(a.at(0)!).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_6600
     * @tc.name int32ArrayAtPart02TestMindmapTest066
     * @tc.desc Verify map at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let m: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v * 2);
      expect(m.at(0)!).assertEqual(2);
      expect(m.at(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_6700
     * @tc.name int32ArrayAtPart02TestMindmapTest067
     * @tc.desc Verify filter at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      let f: Int32Array = a.filter((v: number, _i: int, _arr: Int32Array): boolean => v > 2);
      expect(f.at(0)!).assertEqual(3);
      expect(f.at(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_6800
     * @tc.name int32ArrayAtPart02TestMindmapTest068
     * @tc.desc Verify at map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(5, 10);
      let first = a.at(0)!;
      let doubled: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v + first);
      expect(doubled.at(0)!).assertEqual(10);
      expect(doubled.at(1)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_6900
     * @tc.name int32ArrayAtPart02TestMindmapTest069
     * @tc.desc Verify for at(i) $_get(i)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30, 40);
      for (let i = 0; i < a.length; i++) {
        expect(a.at(i)).assertEqual(a.$_get(i));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_7000
     * @tc.name int32ArrayAtPart02TestMindmapTest070
     * @tc.desc Verify for -length..-1 at(-i) $_get(length-i)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(11, 22, 33);
      expect(a.at(-3)).assertEqual(a.$_get(0));
      expect(a.at(-2)).assertEqual(a.$_get(1));
      expect(a.at(-1)).assertEqual(a.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_7100
     * @tc.name int32ArrayAtPart02TestMindmapTest071
     * @tc.desc Verify for at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let count: int = 0;
      for (let i = 0; i < a.length; i++) {
        a.at(i);
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_7200
     * @tc.name int32ArrayAtPart02TestMindmapTest072
     * @tc.desc Verify for-of at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(100, 200, 300);
      let idx: int = 0;
      for (const v of a) {
        expect(a.at(Double.toInt(idx))).assertEqual(v);
        idx++;
      }
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART02_TEST_MINDMAP_7300
     * @tc.name int32ArrayAtPart02TestMindmapTest073
     * @tc.desc Verify for at $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart02TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-1, -2147483648, 2147483647, 0);
      for (let i = 0; i < a.length; i++) {
        expect(a.at(i)).assertEqual(a.$_get(i));
      }
    });

  });
}
