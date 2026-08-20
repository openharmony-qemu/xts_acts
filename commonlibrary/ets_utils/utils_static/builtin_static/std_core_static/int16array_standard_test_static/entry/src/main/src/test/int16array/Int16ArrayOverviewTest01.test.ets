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
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Int16ArrayOverviewTest01(): void {
  describe('Int16ArrayOverviewTest01', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0010
     * @tc.name testInt16ArrayOverviewTestOne001
     * @tc.desc Verify new Int16Array() with 0 args creates empty array length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      let resultValue: int = arr.length;
      let expectedValue: int = 0;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0020
     * @tc.name testInt16ArrayOverviewTestOne002
     * @tc.desc Verify new Int16Array(other Int16Array) copy constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array(2 as int);
      src.$_set(0, 10);
      src.$_set(1, 20);
      let arr: Int16Array = new Int16Array(src);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = 10;
      expect(resultValue).assertEqual(expectedValue);
      let resultValue2: number = arr.$_get(1);
      let expectedValue2: int = 20;
      expect(resultValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0030
     * @tc.name testInt16ArrayOverviewTestOne003
     * @tc.desc Verify new Int16Array(buf, byteOffset, length) with three int args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 0 as int, 2 as int);
      let resultValue: int = arr.length;
      let expectedValue: int = 2;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0040
     * @tc.name testInt16ArrayOverviewTestOne004
     * @tc.desc Verify new Int16Array(-1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Int16Array = new Int16Array(-1 as int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0050
     * @tc.name testInt16ArrayOverviewTestOne005
     * @tc.desc Verify new Int16Array(-32768) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Int16Array = new Int16Array(-32768 as int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0060
     * @tc.name testInt16ArrayOverviewTestOne006
     * @tc.desc Verify new Int16Array(Infinity) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Int16Array = new Int16Array(Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0070
     * @tc.name testInt16ArrayOverviewTestOne007
     * @tc.desc Verify new Int16Array(Array<int> [-32768]) stores -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [-32768];
      let arr: Int16Array = new Int16Array(src);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = -32768;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0080
     * @tc.name testInt16ArrayOverviewTestOne008
     * @tc.desc Verify new Int16Array(Array<int> [32768]) wraps to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [32768];
      let arr: Int16Array = new Int16Array(src);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = -32768;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0090
     * @tc.name testInt16ArrayOverviewTestOne009
     * @tc.desc Verify new Int16Array(Array<int> [-32769]) wraps to 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [-32769];
      let arr: Int16Array = new Int16Array(src);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = 32767;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0100
     * @tc.name testInt16ArrayOverviewTestOne010
     * @tc.desc Verify new Int16Array(buf, byteOffset=1) unaligned throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let arr: Int16Array = new Int16Array(buf, 1 as int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0110
     * @tc.name testInt16ArrayOverviewTestOne011
     * @tc.desc Verify new Int16Array(buf, byteOffset=-1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let arr: Int16Array = new Int16Array(buf, -1 as int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0120
     * @tc.name testInt16ArrayOverviewTestOne012
     * @tc.desc Verify new Int16Array(buf,0,3) length exceeds buffer throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let arr: Int16Array = new Int16Array(buf, 0 as int, 3 as int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0130
     * @tc.name testInt16ArrayOverviewTestOne013
     * @tc.desc Verify new Int16Array(buf,0,-1) negative length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let arr: Int16Array = new Int16Array(buf, 0 as int, -1 as int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0140
     * @tc.name testInt16ArrayOverviewTestOne014
     * @tc.desc Verify new Int16Array(Set<Number> Iterable) creates array length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<Number> = new Set<Number>();
      src.add(1);
      src.add(2);
      let arr: Int16Array = new Int16Array(src);
      let resultValue: int = arr.length;
      let expectedValue: int = 2;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0150
     * @tc.name testInt16ArrayOverviewTestOne015
     * @tc.desc Verify Int16Array.of() with 0 args creates empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of();
      let resultValue: int = arr.length;
      let expectedValue: int = 0;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0160
     * @tc.name testInt16ArrayOverviewTestOne016
     * @tc.desc Verify Int16Array.of(0) with 1 arg creates single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 0;
      let arr: Int16Array = Int16Array.of(val);
      let resultValue: int = arr.length;
      let expectedValue: int = 1;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0170
     * @tc.name testInt16ArrayOverviewTestOne017
     * @tc.desc Verify Int16Array.of(-32768) stores -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -32768;
      let arr: Int16Array = Int16Array.of(val);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = -32768;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0180
     * @tc.name testInt16ArrayOverviewTestOne018
     * @tc.desc Verify Int16Array.of(32768) wraps to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 32768;
      let arr: Int16Array = Int16Array.of(val);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = -32768;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0190
     * @tc.name testInt16ArrayOverviewTestOne019
     * @tc.desc Verify Int16Array.of(NaN) coerces to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(Number.NaN);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = 0;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0200
     * @tc.name testInt16ArrayOverviewTestOne020
     * @tc.desc Verify Int16Array.of(-3.7) truncates to -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-3.7);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = -3;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0210
     * @tc.name testInt16ArrayOverviewTestOne021
     * @tc.desc Verify Int16Array.from([]) empty source creates empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.from([]);
      let resultValue: int = arr.length;
      let expectedValue: int = 0;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0220
     * @tc.name testInt16ArrayOverviewTestOne022
     * @tc.desc Verify Int16Array.from([42]) single-element source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.from([42]);
      let resultValue: int = arr.length;
      let expectedValue: int = 1;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0230
     * @tc.name testInt16ArrayOverviewTestOne023
     * @tc.desc Verify Int16Array.from(other Int16Array) source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(5, 10, 15);
      let arr: Int16Array = Int16Array.from(src);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = 5;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0240
     * @tc.name testInt16ArrayOverviewTestOne024
     * @tc.desc Verify Int16Array.from(Set<int>) source length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<int> = new Set<int>();
      src.add(7);
      src.add(8);
      let arr: Int16Array = Int16Array.from(src);
      let resultValue: int = arr.length;
      let expectedValue: int = 2;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0250
     * @tc.name testInt16ArrayOverviewTestOne025
     * @tc.desc Verify Int16Array.from([-32768]) stores -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.from([-32768]);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = -32768;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0260
     * @tc.name testInt16ArrayOverviewTestOne026
     * @tc.desc Verify $_get(index) with 1 arg reads element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 9;
      let arr: Int16Array = Int16Array.of(val);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = 9;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0270
     * @tc.name testInt16ArrayOverviewTestOne027
     * @tc.desc Verify $_get(-1) out of range throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 10;
      let arr: Int16Array = Int16Array.of(val);
      try {
        arr.$_get(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0280
     * @tc.name testInt16ArrayOverviewTestOne028
     * @tc.desc Verify $_get(length) out of range throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20);
      try {
        arr.$_get(2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0290
     * @tc.name testInt16ArrayOverviewTestOne029
     * @tc.desc Verify $_get(length+1) out of range throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 10;
      let arr: Int16Array = Int16Array.of(val);
      try {
        arr.$_get(2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0300
     * @tc.name testInt16ArrayOverviewTestOne030
     * @tc.desc Verify $_set(index,value) with 2 args writes element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 0;
      let arr: Int16Array = Int16Array.of(val);
      arr.$_set(0, 99);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = 99;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0310
     * @tc.name testInt16ArrayOverviewTestOne031
     * @tc.desc Verify $_set(-1,value) out of range throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 10;
      let arr: Int16Array = Int16Array.of(val);
      try {
        arr.$_set(-1, 999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = 10;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0320
     * @tc.name testInt16ArrayOverviewTestOne032
     * @tc.desc Verify $_set value -32768 stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 0;
      let arr: Int16Array = Int16Array.of(val);
      arr.$_set(0, -32768);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = -32768;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0330
     * @tc.name testInt16ArrayOverviewTestOne033
     * @tc.desc Verify $_set value 32768 wraps to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 0;
      let arr: Int16Array = Int16Array.of(val);
      arr.$_set(0, 32768);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = -32768;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0340
     * @tc.name testInt16ArrayOverviewTestOne034
     * @tc.desc Verify $_set value -32769 wraps to 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 0;
      let arr: Int16Array = Int16Array.of(val);
      arr.$_set(0, -32769);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = 32767;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0350
     * @tc.name testInt16ArrayOverviewTestOne035
     * @tc.desc Verify at(0) with 1 arg reads element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 10, 15);
      let result: number | undefined = arr.at(0);
      let resultValue: number | undefined = result;
      let expectedValue: int = 5;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0360
     * @tc.name testInt16ArrayOverviewTestOne036
     * @tc.desc Verify at(length) out of range returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20);
      let result: number | undefined = arr.at(2);
      let resultValue: number | undefined = result;
      expect(resultValue).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0370
     * @tc.name testInt16ArrayOverviewTestOne037
     * @tc.desc Verify with(index,value) with 2 args returns new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let result: Int16Array = arr.with(0, 99);
      let resultValue: number = result.$_get(0);
      let expectedValue: int = 99;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0380
     * @tc.name testInt16ArrayOverviewTestOne038
     * @tc.desc Verify with(-1,value) negative index replaces last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 10;
      let arr: Int16Array = Int16Array.of(val);
      let result: Int16Array = arr.with(-1, 99);
      let resultValue: number = result.$_get(0);
      let expectedValue: int = 99;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0390
     * @tc.name testInt16ArrayOverviewTestOne039
     * @tc.desc Verify with(length,value) out of range throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 10;
      let arr: Int16Array = Int16Array.of(val);
      try {
        let result: Int16Array = arr.with(1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0400
     * @tc.name testInt16ArrayOverviewTestOne040
     * @tc.desc Verify set(source) with 1 arg overwrites from start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let src: Int16Array = Int16Array.of(9, 9);
      arr.set(src);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = 9;
      expect(resultValue).assertEqual(expectedValue);
      let resultValue2: number = arr.$_get(1);
      let expectedValue2: int = 9;
      expect(resultValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0410
     * @tc.name testInt16ArrayOverviewTestOne041
     * @tc.desc Verify set(source, offset) with 2 args writes at offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let val: int = 9;
      let src: Int16Array = Int16Array.of(val);
      arr.set(src, 1);
      let resultValue: number = arr.$_get(1);
      let expectedValue: int = 9;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0420
     * @tc.name testInt16ArrayOverviewTestOne042
     * @tc.desc Verify set(source, -1) negative offset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let val: int = 9;
      let src: Int16Array = Int16Array.of(val);
      try {
        arr.set(src, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0430
     * @tc.name testInt16ArrayOverviewTestOne043
     * @tc.desc Verify set(source) exceeding target length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2);
      let src: Int16Array = Int16Array.of(9, 9, 9);
      try {
        arr.set(src, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0440
     * @tc.name testInt16ArrayOverviewTestOne044
     * @tc.desc Verify subarray() with 0 args returns full view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let view: Int16Array = arr.subarray();
      let resultValue: int = view.length;
      let expectedValue: int = 3;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0450
     * @tc.name testInt16ArrayOverviewTestOne045
     * @tc.desc Verify subarray(begin=-1) starts from relative end returns last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let view: Int16Array = arr.subarray(-1);
      let actual: int = view.length;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actualFirstElement: number = view.$_get(0);
      let expectedFirstElement: int = 3;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0460
     * @tc.name testInt16ArrayOverviewTestOne046
     * @tc.desc Verify subarray(end>length) clamps to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2);
      let view: Int16Array = arr.subarray(0, 3);
      let actual: int = view.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0470
     * @tc.name testInt16ArrayOverviewTestOne047
     * @tc.desc Verify slice() with 0 args returns full copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let copy: Int16Array = arr.slice();
      let actual: int = copy.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0480
     * @tc.name testInt16ArrayOverviewTestOne048
     * @tc.desc Verify slice(negative start) counts from end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let copy: Int16Array = arr.slice(-1);
      let actual: int = copy.length;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0490
     * @tc.name testInt16ArrayOverviewTestOne049
     * @tc.desc Verify copyWithin(target=-1, start) clamps target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      arr.copyWithin(-1, 0);
      let actual: number = arr.$_get(0);
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0500
     * @tc.name testInt16ArrayOverviewTestOne050
     * @tc.desc Verify fill(value) with 1 arg fills all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      arr.fill(0);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0510
     * @tc.name testInt16ArrayOverviewTestOne051
     * @tc.desc Verify fill(value, start) with 2 args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      arr.fill(9, 1);
      let actual: number = arr.$_get(0);
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actualValue: number = arr.$_get(1);
      let expectedValue: int = 9;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0520
     * @tc.name testInt16ArrayOverviewTestOne052
     * @tc.desc Verify fill(32768) wraps to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 0;
      let arr: Int16Array = Int16Array.of(val);
      arr.fill(32768);
      let actual: number = arr.$_get(0);
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0530
     * @tc.name testInt16ArrayOverviewTestOne053
     * @tc.desc Verify includes(searchElement) with 1 arg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let found: boolean = arr.includes(2);
      let actual: boolean = found;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0540
     * @tc.name testInt16ArrayOverviewTestOne054
     * @tc.desc Verify indexOf(searchElement) with 1 arg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 10, 15);
      let idx: int = arr.indexOf(10);
      let actual: int = idx;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0550
     * @tc.name testInt16ArrayOverviewTestOne055
     * @tc.desc Verify lastIndexOf(searchElement) with 1 arg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 1);
      let idx: int = arr.lastIndexOf(1);
      let actual: int = idx;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0560
     * @tc.name testInt16ArrayOverviewTestOne056
     * @tc.desc Verify includes(NaN) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 0;
      let arr: Int16Array = Int16Array.of(val);
      let found: boolean = arr.includes(Number.NaN);
      let actual: boolean = found;
      expect(actual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0570
     * @tc.name testInt16ArrayOverviewTestOne057
     * @tc.desc Verify includes(-0) matches 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 0;
      let arr: Int16Array = Int16Array.of(val);
      let found: boolean = arr.includes(-0);
      let actual: boolean = found;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0580
     * @tc.name testInt16ArrayOverviewTestOne058
     * @tc.desc Verify sort(compareFn) with custom comparator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 3, 2);
      arr.sort((a: number, b: number): int => {
        return (b - a).toInt();
      });
      let actual: number = arr.$_get(0);
      let expected: int = 3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0590
     * @tc.name testInt16ArrayOverviewTestOne059
     * @tc.desc Verify Int16Array.BYTES_PER_ELEMENT static value is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: int = Int16Array.BYTES_PER_ELEMENT;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0600
     * @tc.name testInt16ArrayOverviewTestOne060
     * @tc.desc Verify entries() on empty array done is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0 as int);
      let it: IterableIterator<[int, Number]> = arr.entries();
      let nxt: IteratorResult<[int, Number]> = it.next();
      let actual: boolean = nxt.done;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0610
     * @tc.name testInt16ArrayOverviewTestOne061
     * @tc.desc Verify entries() on single-element array done is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 42;
      let arr: Int16Array = Int16Array.of(val);
      let it: IterableIterator<[int, Number]> = arr.entries();
      let nxt: IteratorResult<[int, Number]> = it.next();
      let actual: boolean = nxt.done;
      expect(actual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0620
     * @tc.name testInt16ArrayOverviewTestOne062
     * @tc.desc Verify keys() returns index sequence starting at 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20);
      let it: IterableIterator<int> = arr.keys();
      let nxt: IteratorResult<int> = it.next();
      let actual: int | undefined = nxt.value;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0630
     * @tc.name testInt16ArrayOverviewTestOne063
     * @tc.desc Verify $_iterator() returns first element -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-1, 0, 1);
      let it: IterableIterator<Number> = arr.$_iterator();
      let nxt: IteratorResult<Number> = it.next();
      let actual: number = nxt.value!;
      let expected: int = -1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0640
     * @tc.name testInt16ArrayOverviewTestOne064
     * @tc.desc Verify toString() returns comma-separated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2);
      let result: string = arr.toString();
      let actual: string = result;
      let expected: string = '1,2';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0650
     * @tc.name testInt16ArrayOverviewTestOne065
     * @tc.desc Verify toLocaleString() returns the complete comma-separated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(100, 200);
      let result: string = arr.toLocaleString();
      let expected: string = '100,200';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0660
     * @tc.name testInt16ArrayOverviewTestOne066
     * @tc.desc Verify join(separator) with 1 arg joins with separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 6);
      let result: string = arr.join('-');
      let actual: string = result;
      let expected: string = '5-6';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0670
     * @tc.name testInt16ArrayOverviewTestOne067
     * @tc.desc Verify findIndex(predicate) with 1 arg finds index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 5, 10);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => {
        return value > 3;
      });
      let actual: int = result;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0680
     * @tc.name testInt16ArrayOverviewTestOne068
     * @tc.desc Verify forEach(callbackfn) with 1 arg iterates elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let sum: number = 0;
      arr.forEach((value: number, _index: int, _array: Int16Array): void => {
        sum = sum + value;
      });
      let actual: number = sum;
      let expected: int = 6;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0690
     * @tc.name testInt16ArrayOverviewTestOne069
     * @tc.desc Verify filter(callbackfn) with 1 arg returns expected elements in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 5, 2, 8);
      let result: Int16Array = arr.filter((value: number, _index: int, _array: Int16Array): boolean => {
        return value > 3;
      });
      let actual: int = result.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
      let actualFirst: number = result.$_get(0);
      let expectedFirst: int = 5;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualSecond: number = result.$_get(1);
      let expectedSecond: int = 8;
      expect(actualSecond).assertEqual(expectedSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0700
     * @tc.name testInt16ArrayOverviewTestOne070
     * @tc.desc Verify reduce(callbackfn) with 1 arg without initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let result: number = arr.reduce((acc: number, val: number, _index: int, _array: Int16Array): number => {
        return acc + val;
      });
      let actual: number = result;
      let expected: int = 6;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0710
     * @tc.name testInt16ArrayOverviewTestOne071
     * @tc.desc Verify reduce on empty array without initialValue throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0 as int);
      try {
        let result: number = arr.reduce((acc: number, val: number, _index: int, _array: Int16Array): number => {
          return acc + val;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0720
     * @tc.name testInt16ArrayOverviewTestOne072
     * @tc.desc Verify reduce on empty array with initialValue returns initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0 as int);
      let result: number = arr.reduce((acc: number, val: number, _index: int, _array: Int16Array): number => {
        return acc + val;
      }, 42);
      let actual: number = result;
      let expected: int = 42;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0730
     * @tc.name testInt16ArrayOverviewTestOne073
     * @tc.desc Verify reduceRight(callbackfn) with 1 arg accumulates from end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let result: number = arr.reduceRight((acc: number, val: number, _index: int, _array: Int16Array): number => {
        return acc + val;
      });
      let actual: number = result;
      let expected: int = 6;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0740
     * @tc.name testInt16ArrayOverviewTestOne074
     * @tc.desc Verify reduceRight on empty array without initialValue throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0 as int);
      try {
        let result: number = arr.reduceRight((acc: number, val: number, _index: int, _array: Int16Array): number => {
          return acc + val;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0750
     * @tc.name testInt16ArrayOverviewTestOne075
     * @tc.desc Verify some(predicate) on empty array returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0 as int);
      let result: boolean = arr.some((value: number, _index: int, _array: Int16Array): boolean => {
        return value > 0;
      });
      let actual: boolean = result;
      expect(actual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0760
     * @tc.name testInt16ArrayOverviewTestOne076
     * @tc.desc Verify valueOf() with 0 args returns object self
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2);
      let result: Object = arr.valueOf();
      let actual: Object = result;
      let expected: Object = arr;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0770
     * @tc.name testInt16ArrayOverviewTestOne077
     * @tc.desc Verify find callback error is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2);
      try {
        let result: number | undefined = arr.find((_value: number, _index: int, _array: Int16Array): boolean => {
          throw new TypeError('boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0780
     * @tc.name testInt16ArrayOverviewTestOne078
     * @tc.desc Verify map(callback) error is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2);
      try {
        let result: Int16Array = arr.map((_value: number, _index: int, _array: Int16Array): number => {
          throw new TypeError('boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0790
     * @tc.name testInt16ArrayOverviewTestOne079
     * @tc.desc Verify forEach callback error is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2);
      try {
        arr.forEach((_value: number, _index: int, _array: Int16Array): void => {
          throw new TypeError('boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0800
     * @tc.name testInt16ArrayOverviewTestOne080
     * @tc.desc Verify filter callback error is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2);
      try {
        let result: Int16Array = arr.filter((_value: number, _index: int, _array: Int16Array): boolean => {
          throw new TypeError('boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0810
     * @tc.name testInt16ArrayOverviewTestOne081
     * @tc.desc Verify sort(compareFn) error is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2);
      try {
        arr.sort((_a: number, _b: number): int => {
          throw new TypeError('boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0820
     * @tc.name testInt16ArrayOverviewTestOne082
     * @tc.desc Verify new Int16Array from existing array copies length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Int16Array.of(10, 32767);
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: number = src.length;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0830
     * @tc.name testInt16ArrayOverviewTestOne083
     * @tc.desc Verify Int16Array.from(src) length equals src length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Int16Array.of(5, 32767);
      const arr = Int16Array.from(src);
      let actual: int = arr.length;
      let expected: number = src.length;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0840
     * @tc.name testInt16ArrayOverviewTestOne084
     * @tc.desc Verify $_get(0) returns element value 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 32767;
      const arr: Int16Array = Int16Array.of(val);
      const v = arr.$_get(0);
      let actual: number = v;
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0850
     * @tc.name testInt16ArrayOverviewTestOne085
     * @tc.desc Verify at(-length-1) returns undefined when index out of range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20);
      const idx: int = -arr.length - 1;
      expect(arr.at(idx)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0860
     * @tc.name testInt16ArrayOverviewTestOne086
     * @tc.desc Verify with(0, 99) replaces index 0 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 32767);
      const result = arr.with(0, 99);
      let actual: number = result.$_get(0);
      let expected: int = 99;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0870
     * @tc.name testInt16ArrayOverviewTestOne087
     * @tc.desc Verify with(0, 99) keeps array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 32767);
      const result = arr.with(0, 99);
      let actual: int = result.length;
      let expected: number = arr.length;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0880
     * @tc.name testInt16ArrayOverviewTestOne088
     * @tc.desc Verify with(0, 99) returns independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 32767);
      const result = arr.with(0, 99);
      expect(result.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0890
     * @tc.name testInt16ArrayOverviewTestOne089
     * @tc.desc Verify copyWithin(0, 1) keeps array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 32767, 50);
      const result = arr.copyWithin(0, 1);
      let actual: int = result.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0900
     * @tc.name testInt16ArrayOverviewTestOne090
     * @tc.desc Verify fill(32767) sets all elements to the value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      arr.fill(32767);
      let actual: number = arr.$_get(0);
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
      let actualSecond: number = arr.$_get(1);
      let expectedSecond: int = 32767;
      expect(actualSecond).assertEqual(expectedSecond);
      let actualThird: number = arr.$_get(2);
      let expectedThird: int = 32767;
      expect(actualThird).assertEqual(expectedThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0910
     * @tc.name testInt16ArrayOverviewTestOne091
     * @tc.desc Verify reverse() reverses element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 32767, 50);
      const result = arr.reverse();
      let actual: number = result.$_get(0);
      let expected: int = 50;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0920
     * @tc.name testInt16ArrayOverviewTestOne092
     * @tc.desc Verify toReversed() reorders elements in reverse order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 32767, 50);
      const result = arr.toReversed();
      let actual: number = result.$_get(0);
      let expected: int = 50;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0930
     * @tc.name testInt16ArrayOverviewTestOne093
     * @tc.desc Verify toReversed() length equals original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 32767, 50);
      const result = arr.toReversed();
      let actual: int = result.length;
      let expected: number = arr.length;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0940
     * @tc.name testInt16ArrayOverviewTestOne094
     * @tc.desc Verify sort() returns same this reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(32767, 10, 50);
      const result = arr.sort();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0950
     * @tc.name testInt16ArrayOverviewTestOne095
     * @tc.desc Verify sort() sorts in place so original array becomes [10, 50, 32767]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(32767, 10, 50);
      arr.sort();
      let actual: number = arr.$_get(0);
      let expected: int = 10;
      expect(actual).assertEqual(expected);
      let actualSecond: number = arr.$_get(1);
      let expectedSecond: int = 50;
      expect(actualSecond).assertEqual(expectedSecond);
      let actualThird: number = arr.$_get(2);
      let expectedThird: int = 32767;
      expect(actualThird).assertEqual(expectedThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0960
     * @tc.name testInt16ArrayOverviewTestOne096
     * @tc.desc Verify toSorted() returns the complete sequence with original length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(32767, 10, 50);
      const result = arr.toSorted();
      let actual: int = result.length;
      let expected: number = arr.length;
      expect(actual).assertEqual(expected);
      let r_1: string = result.toString();
      let e_1: string = '10,50,32767';
      expect(r_1).assertEqual(e_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0970
     * @tc.name testInt16ArrayOverviewTestOne097
     * @tc.desc Verify toSorted() returns a sorted copy and keeps original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(32767, 10, 50);
      const result = arr.toSorted();
      let r_1: string = result.toString();
      let e_1: string = '10,50,32767';
      expect(r_1).assertEqual(e_1);
      let actual: number = arr.$_get(0);
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
      let r_2: string = arr.toString();
      let e_2: string = '32767,10,50';
      expect(r_2).assertEqual(e_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0980
     * @tc.name testInt16ArrayOverviewTestOne098
     * @tc.desc Verify slice(0, 1) returns length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 32767, 50);
      const result = arr.slice(0, 1);
      let actual: int = result.length;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_0990
     * @tc.name testInt16ArrayOverviewTestOne099
     * @tc.desc Verify subarray(0, 1) returns an Int16Array view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 32767, 50);
      const result = arr.subarray(0, 1);
      let actual: number = result.$_get(0);
      let expected: int = 10;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_1000
     * @tc.name testInt16ArrayOverviewTestOne100
     * @tc.desc Verify subarray(0, 1) returns length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 32767, 50);
      const result = arr.subarray(0, 1);
      let actual: int = result.length;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_1010
     * @tc.name testInt16ArrayOverviewTestOne101
     * @tc.desc Verify subarray shares buffer mutation visibility
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 32767, 50);
      const sub = arr.subarray(0, 1);
      arr.$_set(0, 99);
      let actual: number = sub.$_get(0);
      let expected: int = 99;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_ONE_1020
     * @tc.name testInt16ArrayOverviewTestOne102
     * @tc.desc Verify map(fn) returns a new Int16Array with transformed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestOne102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 32767);
      const result = arr.map((v: number, _i: int, _a: Int16Array) => v + 1);
      let actual: number = result.$_get(0);
      let expected: int = 11;
      expect(actual).assertEqual(expected);
    });
  });
}
