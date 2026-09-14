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

export default function int32ArrayOfPart04Test(): void {
  describe('Int32ArrayOfPart04Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_0100
     * @tc.name int32ArrayOfPart04TestMindmapTest001
     * @tc.desc Pure int literals [1,2,3] vs explicit float literals [1.0,2.0,3.0] both length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let aInt: Int32Array = Int32Array.of(1, 2, 3);
      let aNum: Int32Array = Int32Array.of(1.0, 2.0, 3.0);
      expect(aInt.length).assertEqual(3);
      expect(aNum.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_0200
     * @tc.name int32ArrayOfPart04TestMindmapTest002
     * @tc.desc Pure int path vs pure number path single element 5 reads same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let aInt: Int32Array = Int32Array.of(5);
      let aNum: Int32Array = Int32Array.of(5.0);
      expect(aInt.$_get(0)).assertEqual(aNum.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_0300
     * @tc.name int32ArrayOfPart04TestMindmapTest003
     * @tc.desc Mixed int and float literals (1, 2.0, 3) dispatches number overload, length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2.0, 3);
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_0400
     * @tc.name int32ArrayOfPart04TestMindmapTest004
     * @tc.desc Empty of() no type info dispatchable, returns length=0 equivalent to FixedArray []
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a0: Int32Array = Int32Array.of();
      let aEmpty: Int32Array = Int32Array.of();
      expect(a0.length).assertEqual(0);
      expect(aEmpty.length).assertEqual(0);
      expect(a0.byteLength).assertEqual(aEmpty.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_0500
     * @tc.name int32ArrayOfPart04TestMindmapTest005
     * @tc.desc NaN variadic forces FixedArray<number> overload, position 0 is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(Number.NaN);
      expect(a.length).assertEqual(1);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_0600
     * @tc.name int32ArrayOfPart04TestMindmapTest006
     * @tc.desc Infinity variadic goes number overload, position 0 is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(Number.POSITIVE_INFINITY);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_0700
     * @tc.name int32ArrayOfPart04TestMindmapTest007
     * @tc.desc -Infinity variadic goes number overload, position 0 is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(Number.NEGATIVE_INFINITY);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_0800
     * @tc.name int32ArrayOfPart04TestMindmapTest008
     * @tc.desc 3.9 float truncation via number overload, truncates toward zero to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(3.9);
      expect(a.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_0900
     * @tc.name int32ArrayOfPart04TestMindmapTest009
     * @tc.desc Mixed int boundary 2147483647 with float 2.5 both paths produce valid Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let aInt: Int32Array = Int32Array.of(2147483647);
      Int32Array.of(2147483647, 2.5);
      expect(aInt.length).assertEqual(1);
      expect(aInt.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_1000
     * @tc.name int32ArrayOfPart04TestMindmapTest010
     * @tc.desc Both overload return values are instances of Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let aInt: Int32Array = Int32Array.of(1, 2);
      let aNum: Int32Array = Int32Array.of(1.0, 2.0);
      expect(aInt.length).assertEqual(2);
      expect(aNum.$_get(0)).assertEqual(1);
      expect(aNum.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_1100
     * @tc.name int32ArrayOfPart04TestMindmapTest011
     * @tc.desc Pure int multi-arg (0,-1,2147483647,-2147483648) vs same-value number variadic element-wise equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let aInt: Int32Array = Int32Array.of(0, -1, 2147483647, -2147483648);
      let aNum: Int32Array = Int32Array.of(0.0, -1.0, 2147483647.0, -2147483648.0);
      expect(aInt.length).assertEqual(aNum.length);
      expect(aInt.$_get(0)).assertEqual(aNum.$_get(0));
      expect(aInt.$_get(1)).assertEqual(aNum.$_get(1));
      expect(aInt.$_get(2)).assertEqual(aNum.$_get(2));
      expect(aInt.$_get(3)).assertEqual(aNum.$_get(3));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_1200
     * @tc.name int32ArrayOfPart04TestMindmapTest012
     * @tc.desc No-arg of() vs of(1.0) both byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a0: Int32Array = Int32Array.of();
      let a1: Int32Array = Int32Array.of(1.0);
      expect(a0.byteOffset).assertEqual(0);
      expect(a1.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_1300
     * @tc.name int32ArrayOfPart04TestMindmapTest013
     * @tc.desc int path 3-element vs number path 3-element BYTES_PER_ELEMENT always 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int32Array.of(1, 2, 3).BYTES_PER_ELEMENT).assertEqual(4);
      expect(Int32Array.of(1.0, 2.0, 3.0).BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_1400
     * @tc.name int32ArrayOfPart04TestMindmapTest014
     * @tc.desc int path 4-element (1,2,3,4) vs number path 4-element byteLength=16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int32Array.of(1, 2, 3, 4).byteLength).assertEqual(16);
      expect(Int32Array.of(1.0, 2.0, 3.0, 4.0).byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_1500
     * @tc.name int32ArrayOfPart04TestMindmapTest015
     * @tc.desc Empty of() returns byteLength=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int32Array.of().byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_1600
     * @tc.name int32ArrayOfPart04TestMindmapTest016
     * @tc.desc Both overload returned buffers are independent ArrayBuffer instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let aInt: Int32Array = Int32Array.of(1, 2);
      let aNum: Int32Array = Int32Array.of(1.0, 2.0);
      expect(aInt.buffer.byteLength).assertEqual(8);
      expect(aNum.buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_1700
     * @tc.name int32ArrayOfPart04TestMindmapTest017
     * @tc.desc NaN-containing number path byteOffset default 0; Also verify of(NaN,1) includes(NaN) is true (SameValueZero detects NaN); Also verify of(NaN,1) indexOf(NaN) is -1 (strict equality does not match NaN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(Number.NaN, 1);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(8);

      {
      let a: Int32Array = Int32Array.of(Number.NaN, 1);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.includes(Number.NaN)).assertFalse();
      }

      {
      let a: Int32Array = Int32Array.of(Number.NaN, 1);
      expect(a.indexOf(Number.NaN)).assertEqual(-1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_1800
     * @tc.name int32ArrayOfPart04TestMindmapTest018
     * @tc.desc Negative float -3.7 number path BYTES_PER_ELEMENT is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-3.7);
      expect(a.BYTES_PER_ELEMENT).assertEqual(4);
      expect(a.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_1900
     * @tc.name int32ArrayOfPart04TestMindmapTest019
     * @tc.desc int path single element of(7) toString is "7"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int32Array.of(7).toString()).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_2000
     * @tc.name int32ArrayOfPart04TestMindmapTest020
     * @tc.desc number path single element of(7.0) toString is "7" (consistent with int path)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int32Array.of(7.0).toString()).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_2100
     * @tc.name int32ArrayOfPart04TestMindmapTest021
     * @tc.desc int path multi-element of(1,2,3) toString is "1,2,3"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int32Array.of(1, 2, 3).toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_2200
     * @tc.name int32ArrayOfPart04TestMindmapTest022
     * @tc.desc number path with float truncation of(1.5,2.3,3.9) toString outputs truncated integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int32Array.of(1.5, 2.3, 3.9).toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_2300
     * @tc.name int32ArrayOfPart04TestMindmapTest023
     * @tc.desc Empty of() toString is empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int32Array.of().toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_2400
     * @tc.name int32ArrayOfPart04TestMindmapTest024
     * @tc.desc NaN-containing of(NaN,1) toString position 0 outputs "0" (NaN->0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int32Array.of(Number.NaN, 1).toString()).assertEqual('0,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_2500
     * @tc.name int32ArrayOfPart04TestMindmapTest025
     * @tc.desc -0 and +0 of(-0,0) toString is "0,0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int32Array.of(-0, 0).toString()).assertEqual('0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_2600
     * @tc.name int32ArrayOfPart04TestMindmapTest026
     * @tc.desc Negative values of(-1,-2) int and number paths toString consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int32Array.of(-1, -2).toString()).assertEqual('-1,-2');
      expect(Int32Array.of(-1.0, -2.0).toString()).assertEqual('-1,-2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_2700
     * @tc.name int32ArrayOfPart04TestMindmapTest027
     * @tc.desc Both overload results have Int32Array length and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let aInt: Int32Array = Int32Array.of(1);
      let aNum: Int32Array = Int32Array.of(1.0);
      let aNan: Int32Array = Int32Array.of(Number.NaN);
      expect(aInt.length).assertEqual(1);
      expect(aInt.$_get(0)).assertEqual(1);
      expect(aNum.$_get(0)).assertEqual(1);
      expect(aNan.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_2800
     * @tc.name int32ArrayOfPart04TestMindmapTest028
     * @tc.desc int path of(100,200) toLocaleString is non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = Int32Array.of(100, 200).toLocaleString();
      expect(s.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_2900
     * @tc.name int32ArrayOfPart04TestMindmapTest029
     * @tc.desc number path of(100.0,200.0) toLocaleString equals int path output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sInt: string = Int32Array.of(100, 200).toLocaleString();
      let sNum: string = Int32Array.of(100.0, 200.0).toLocaleString();
      expect(sInt).assertEqual(sNum);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_3000
     * @tc.name int32ArrayOfPart04TestMindmapTest030
     * @tc.desc Normal of() constructs an instance whose fields are readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(11, 22, 33);
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(11);
      expect(a.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_3100
     * @tc.name int32ArrayOfPart04TestMindmapTest031
     * @tc.desc Successful of constructs an instance whose fields remain intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let good: Int32Array = Int32Array.of(4, 5, 6);
      expect(good.length).assertEqual(3);
      expect(good.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_3200
     * @tc.name int32ArrayOfPart04TestMindmapTest032
     * @tc.desc Two of calls with unrelated throw in between, before/after results independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let before: Int32Array = Int32Array.of(100);
      try {
        throw new Error('mid');
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      let after: Int32Array = Int32Array.of(200);
      expect(before.$_get(0)).assertEqual(100);
      expect(after.$_get(0)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_3300
     * @tc.name int32ArrayOfPart04TestMindmapTest033
     * @tc.desc number overload of(NaN,Infinity,-Infinity,3.7) constructs expected Int32 values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(Number.NaN, Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY, 3.7);
      expect(a.length).assertEqual(4);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(0);
      expect(a.$_get(3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_3400
     * @tc.name int32ArrayOfPart04TestMindmapTest034
     * @tc.desc of() and of(1) construct independent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: Int32Array = Int32Array.of();
      let res: Int32Array = Int32Array.of(77);
      expect(empty.length).assertEqual(0);
      expect(res.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_3500
     * @tc.name int32ArrayOfPart04TestMindmapTest035
     * @tc.desc After catch, previously constructed of() result buffer independent data intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20);
      try {
        throw new Error('x');
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(a.$_get(0)).assertEqual(10);
      expect(a.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_3600
     * @tc.name int32ArrayOfPart04TestMindmapTest036
     * @tc.desc of() empty and of(1) in same try block consecutive construction length 0 and 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ok: boolean = false;
      try {
        let a0: Int32Array = Int32Array.of();
        let a1: Int32Array = Int32Array.of(1);
        expect(a0.length).assertEqual(0);
        expect(a1.length).assertEqual(1);
        ok = true;
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_3700
     * @tc.name int32ArrayOfPart04TestMindmapTest037
     * @tc.desc Two of(1,2,3) produce two independent instances (reference unequal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let b: Int32Array = Int32Array.of(1, 2, 3);
      expect(a.length).assertEqual(3);
      expect(b.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_3800
     * @tc.name int32ArrayOfPart04TestMindmapTest038
     * @tc.desc Two of(1,2,3) element values identical
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let b: Int32Array = Int32Array.of(1, 2, 3);
      expect(a.$_get(0)).assertEqual(b.$_get(0));
      expect(a.$_get(1)).assertEqual(b.$_get(1));
      expect(a.$_get(2)).assertEqual(b.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_3900
     * @tc.name int32ArrayOfPart04TestMindmapTest039
     * @tc.desc Modifying of() returned instance does not affect another same-arg instance (independent buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let b: Int32Array = Int32Array.of(1, 2);
      a.$_set(0, 999);
      expect(b.$_get(0)).assertEqual(1);
      expect(a.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_4000
     * @tc.name int32ArrayOfPart04TestMindmapTest040
     * @tc.desc int path of(1,2) vs number path of(1.0,2.0) buffers do not share
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let aInt: Int32Array = Int32Array.of(1, 2);
      let aNum: Int32Array = Int32Array.of(1.0, 2.0);
      aInt.$_set(0, 111);
      expect(aNum.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_4100
     * @tc.name int32ArrayOfPart04TestMindmapTest041
     * @tc.desc of() instance $_set later buffer reference unchanged (writes to same buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let bufBefore: ArrayBuffer = a.buffer;
      a.$_set(1, 77);
      expect(a.buffer).assertEqual(bufBefore);
      expect(a.$_get(1)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_4200
     * @tc.name int32ArrayOfPart04TestMindmapTest042
     * @tc.desc of(NaN,1) modify NaN->0 position to 5 reads 5 (NaN position writable)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(Number.NaN, 1);
      a.$_set(0, 5);
      expect(a.$_get(0)).assertEqual(5);
      expect(a.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_4300
     * @tc.name int32ArrayOfPart04TestMindmapTest043
     * @tc.desc of() empty instance $_set(0, x) throws RangeError, length still 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of();
      try {
        a.$_set(0, 42);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_4400
     * @tc.name int32ArrayOfPart04TestMindmapTest044
     * @tc.desc of chain nested with of result element constructing new of, buffer independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Int32Array = Int32Array.of(42);
      let outer: Int32Array = Int32Array.of(inner.$_get(0));
      expect(outer.length).assertEqual(1);
      expect(outer.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_4500
     * @tc.name int32ArrayOfPart04TestMindmapTest045
     * @tc.desc Multiple of same elements each result byteLength independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(7, 8, 9);
      let b: Int32Array = Int32Array.of(7, 8, 9);
      let c: Int32Array = Int32Array.of(7, 8, 9);
      expect(a.byteLength).assertEqual(12);
      expect(b.byteLength).assertEqual(12);
      expect(c.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_4600
     * @tc.name int32ArrayOfPart04TestMindmapTest046
     * @tc.desc of instance $_get out-of-bounds throws RangeError, does not affect other instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let b: Int32Array = Int32Array.of(3, 4);
      try {
        a.$_get(99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(b.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_4700
     * @tc.name int32ArrayOfPart04TestMindmapTest047
     * @tc.desc INT_MAX 2147483647 via int literal and number literal both paths read same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let aInt: Int32Array = Int32Array.of(2147483647);
      let aNum: Int32Array = Int32Array.of(2147483647.0);
      expect(aInt.$_get(0)).assertEqual(2147483647);
      expect(aNum.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_4800
     * @tc.name int32ArrayOfPart04TestMindmapTest048
     * @tc.desc INT_MIN -2147483648 via int and number paths read same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let aInt: Int32Array = Int32Array.of(-2147483648);
      let aNum: Int32Array = Int32Array.of(-2147483648.0);
      expect(aInt.$_get(0)).assertEqual(-2147483648);
      expect(aNum.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_4900
     * @tc.name int32ArrayOfPart04TestMindmapTest049
     * @tc.desc 0 and -0 via both paths read as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int32Array.of(0).$_get(0)).assertEqual(0);
      expect(Int32Array.of(-0).$_get(0)).assertEqual(0);
      expect(Int32Array.of(0.0).$_get(0)).assertEqual(0);
      expect(Int32Array.of(-0.0).$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_5000
     * @tc.name int32ArrayOfPart04TestMindmapTest050
     * @tc.desc NaN via number path is 0; same value as int path of(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int32Array.of(Number.NaN).$_get(0)).assertEqual(Int32Array.of(0).$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_5100
     * @tc.name int32ArrayOfPart04TestMindmapTest051
     * @tc.desc Infinity/-Infinity via number path both are 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int32Array.of(Number.POSITIVE_INFINITY).$_get(0)).assertEqual(0);
      expect(Int32Array.of(Number.NEGATIVE_INFINITY).$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_5200
     * @tc.name int32ArrayOfPart04TestMindmapTest052
     * @tc.desc 2147483648 overflow via number path wraps to -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(2147483648.0);
      expect(a.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_5300
     * @tc.name int32ArrayOfPart04TestMindmapTest053
     * @tc.desc -2147483649 via number path wraps to 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-2147483649.0);
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_5400
     * @tc.name int32ArrayOfPart04TestMindmapTest054
     * @tc.desc 4294967296 (2^32) via number path wraps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(4294967296.0);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_5500
     * @tc.name int32ArrayOfPart04TestMindmapTest055
     * @tc.desc Float -0.9 truncates toward zero to 0; consistent with int path 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-0.9);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_5600
     * @tc.name int32ArrayOfPart04TestMindmapTest056
     * @tc.desc Float 0.5 via number path is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0.5);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_5700
     * @tc.name int32ArrayOfPart04TestMindmapTest057
     * @tc.desc Float -2147483648.9 truncates toward zero to -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-2147483648.9);
      expect(a.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_5800
     * @tc.name int32ArrayOfPart04TestMindmapTest058
     * @tc.desc of() empty length=0 byteLength=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of();
      expect(a.length).assertEqual(0);
      expect(a.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_5900
     * @tc.name int32ArrayOfPart04TestMindmapTest059
     * @tc.desc of(1) single element length=1 byteLength=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1);
      expect(a.length).assertEqual(1);
      expect(a.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_6000
     * @tc.name int32ArrayOfPart04TestMindmapTest060
     * @tc.desc of(1.0,2.0) 2-element number path length=2 byteLength=8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1.0, 2.0);
      expect(a.length).assertEqual(2);
      expect(a.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_6100
     * @tc.name int32ArrayOfPart04TestMindmapTest061
     * @tc.desc of(NaN,Infinity,-Infinity,0.5,-0.9) 5-element length=5 byteLength=20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(Number.NaN, Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY, 0.5, -0.9);
      expect(a.length).assertEqual(5);
      expect(a.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_6200
     * @tc.name int32ArrayOfPart04TestMindmapTest062
     * @tc.desc of() result byteLength===length*BYTES_PER_ELEMENT holds under empty/pure int/mixed paths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a0: Int32Array = Int32Array.of();
      let a3: Int32Array = Int32Array.of(1, 2, 3);
      let aMix: Int32Array = Int32Array.of(1.5, Number.NaN, -2.5);
      expect(a0.byteLength).assertEqual(a0.length * a0.BYTES_PER_ELEMENT);
      expect(a3.byteLength).assertEqual(a3.length * a3.BYTES_PER_ELEMENT);
      expect(aMix.byteLength).assertEqual(aMix.length * aMix.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_6300
     * @tc.name int32ArrayOfPart04TestMindmapTest063
     * @tc.desc int path of(1,2) $_set then $_get reads new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      a.$_set(0, 111);
      a.$_set(1, 222);
      expect(a.$_get(0)).assertEqual(111);
      expect(a.$_get(1)).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_6400
     * @tc.name int32ArrayOfPart04TestMindmapTest064
     * @tc.desc number path of(1.5, 2.5) $_set then $_get reads new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1.5, 2.5);
      a.$_set(0, 888);
      a.$_set(1, 999);
      expect(a.$_get(0)).assertEqual(888);
      expect(a.$_get(1)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_6500
     * @tc.name int32ArrayOfPart04TestMindmapTest065
     * @tc.desc NaN-containing number path $_set out-of-bounds index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(Number.NaN, 1);
      try {
        a.$_set(5, 999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_6600
     * @tc.name int32ArrayOfPart04TestMindmapTest066
     * @tc.desc int path $_get out-of-bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1);
      try {
        a.$_get(99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      try {
        a.$_get(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_6700
     * @tc.name int32ArrayOfPart04TestMindmapTest067
     * @tc.desc Empty of() instance at(0) out-of-bounds returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of();
      expect(a.at(0)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_6800
     * @tc.name int32ArrayOfPart04TestMindmapTest068
     * @tc.desc number path of(10.5,20.5,30.5) at(1) after truncation is 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10.5, 20.5, 30.5);
      expect(a.at(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_6900
     * @tc.name int32ArrayOfPart04TestMindmapTest069
     * @tc.desc Using of result elements as new of variadic, buffer independent and elements preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Int32Array = Int32Array.of(1, 2);
      let outer: Int32Array = Int32Array.of(inner.$_get(0), inner.$_get(1));
      expect(outer.length).assertEqual(2);
      expect(outer.$_get(0)).assertEqual(1);
      expect(outer.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_7000
     * @tc.name int32ArrayOfPart04TestMindmapTest070
     * @tc.desc Three-layer of nesting single value final is 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(Int32Array.of(Int32Array.of(5).$_get(0)).$_get(0));
      expect(a.length).assertEqual(1);
      expect(a.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_7100
     * @tc.name int32ArrayOfPart04TestMindmapTest071
     * @tc.desc Two consecutive of() empty instances buffers do not share
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Int32Array = Int32Array.of();
      let outer: Int32Array = Int32Array.of();
      expect(inner.length).assertEqual(0);
      expect(outer.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_7200
     * @tc.name int32ArrayOfPart04TestMindmapTest072
     * @tc.desc Same source value 7 via int and number paths placed in same of both positions equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(7, 7.0);
      expect(a.length).assertEqual(2);
      expect(a.$_get(0)).assertEqual(a.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_7300
     * @tc.name int32ArrayOfPart04TestMindmapTest073
     * @tc.desc int path of(1,2,3) via for-of sum is 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let sum: number = 0;
      for (let v of a) {
        sum = sum + v;
      }
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_7400
     * @tc.name int32ArrayOfPart04TestMindmapTest074
     * @tc.desc number path of(1.5,2.5,3.5) via for-of truncated sum is 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1.5, 2.5, 3.5);
      let sum: number = 0;
      for (let v of a) {
        sum = sum + v;
      }
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_7500
     * @tc.name int32ArrayOfPart04TestMindmapTest075
     * @tc.desc for-of early break both overloads can terminate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let aInt: Int32Array = Int32Array.of(1, 2, 3, 4);
      let count1: number = 0;
      for (let v of aInt) {
        count1 = count1 + 1;
        if (v === 2) {
          break;
        }
      }
      expect(count1).assertEqual(2);
      let aNum: Int32Array = Int32Array.of(1.0, 2.0, 3.0, 4.0);
      let count2: number = 0;
      for (let v of aNum) {
        count2 = count2 + 1;
        if (v === 2) {
          break;
        }
      }
      expect(count2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_7600
     * @tc.name int32ArrayOfPart04TestMindmapTest076
     * @tc.desc of(NaN,-0,Infinity) for-of actual iterated values are [0,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(Number.NaN, -0, Number.POSITIVE_INFINITY);
      let seen: Array<number> = [];
      for (let v of a) {
        seen.pushOne(v);
      }
      expect(seen.length).assertEqual(3);
      expect(seen.$_get(0)).assertEqual(0);
      expect(seen.$_get(1)).assertEqual(0);
      expect(seen.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_7700
     * @tc.name int32ArrayOfPart04TestMindmapTest077
     * @tc.desc int path of(1,2,3) indexOf(2) is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      expect(a.indexOf(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_7800
     * @tc.name int32ArrayOfPart04TestMindmapTest078
     * @tc.desc number path of(1.0,2.0,3.0) indexOf(2) also is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1.0, 2.0, 3.0);
      expect(a.indexOf(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART04_TEST_MINDMAP_7900
     * @tc.name int32ArrayOfPart04TestMindmapTest079
     * @tc.desc of(-0,0) includes(0) and includes(-0) both true (SameValueZero equivalence)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart04TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-0, 0);
      expect(a.includes(0)).assertTrue();
      expect(a.includes(-0)).assertTrue();
    });
  });
}
