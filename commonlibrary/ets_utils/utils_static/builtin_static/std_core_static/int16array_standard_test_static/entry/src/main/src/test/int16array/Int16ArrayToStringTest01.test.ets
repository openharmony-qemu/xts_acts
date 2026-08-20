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

export default function Int16ArrayToStringTest01(): void {
  describe('Int16ArrayToStringTest01', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_0100
     * @tc.name testInt16ArrayToStringTestOne001
     * @tc.desc Verify Int16Array.from(arrayLike) toString on Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.from([7, 14, 21]);
      let actualString: string = arr.toString();
      let expectedString: string = '7,14,21';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_0200
     * @tc.name testInt16ArrayToStringTestOne002
     * @tc.desc Verify new Int16Array(buf) ArrayBuffer byteOffset=0 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Int16Array = new Int16Array(buf);
      let actualString: string = arr.toString();
      let expectedString: string = '0,0,0';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_0300
     * @tc.name testInt16ArrayToStringTestOne003
     * @tc.desc Verify new Int16Array(buf, byteOffset) ArrayBuffer toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 2);
      let actualString: string = arr.toString();
      let expectedString: string = '0,0,0';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_0400
     * @tc.name testInt16ArrayToStringTestOne004
     * @tc.desc Verify new Int16Array(buf, byteOffset, length) ArrayBuffer toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr: Int16Array = new Int16Array(buf, 2, 2);
      let actualString: string = arr.toString();
      let expectedString: string = '0,0';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_0500
     * @tc.name testInt16ArrayToStringTestOne005
     * @tc.desc Verify Int16Array.from(setObject) Set toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(100);
      s.add(200);
      let arr: Int16Array = Int16Array.from(s);
      let actualString: string = arr.toString();
      let expectedString: string = '100,200';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_0600
     * @tc.name testInt16ArrayToStringTestOne006
     * @tc.desc Verify new Int16Array(3) toString returns '0,0,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(3);
      let actualString: string = arr.toString();
      let expectedString: string = '0,0,0';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_0700
     * @tc.name testInt16ArrayToStringTestOne007
     * @tc.desc Verify Int16Array length=0 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let actualString: string = arr.toString();
      let expectedString: string = '';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_0800
     * @tc.name testInt16ArrayToStringTestOne008
     * @tc.desc Verify 0 Int16Array toString '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0]);
      let actualString: string = arr.toString();
      let expectedString: string = '0';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_0900
     * @tc.name testInt16ArrayToStringTestOne009
     * @tc.desc Verify -1 Int16Array toString '-1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-1]);
      let actualString: string = arr.toString();
      let expectedString: string = '-1';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_1000
     * @tc.name testInt16ArrayToStringTestOne010
     * @tc.desc Verify int16.MIN -32768 Int16Array toString '-32768'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-32768]);
      let actualString: string = arr.toString();
      let expectedString: string = '-32768';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_1100
     * @tc.name testInt16ArrayToStringTestOne011
     * @tc.desc Verify 32768 MAX -32768 Int16Array toString '-32768'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([32768]);
      let actualString: string = arr.toString();
      let expectedString: string = '-32768';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_1200
     * @tc.name testInt16ArrayToStringTestOne012
     * @tc.desc Verify -32769 MIN 32767 Int16Array toString '32767'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-32769]);
      let actualString: string = arr.toString();
      let expectedString: string = '32767';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_1300
     * @tc.name testInt16ArrayToStringTestOne013
     * @tc.desc Verify [3.7, -2.3, 0.9] toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([3.7, -2.3, 0.9]);
      let actualString: string = arr.toString();
      let expectedString: string = '3,-2,0';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_1400
     * @tc.name testInt16ArrayToStringTestOne014
     * @tc.desc Verify [MIN, 0, MAX] Int16Array toString '-32768,0,32767'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-32768, 0, 32767]);
      let actualString: string = arr.toString();
      let expectedString: string = '-32768,0,32767';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_1500
     * @tc.name testInt16ArrayToStringTestOne015
     * @tc.desc Verify MIN Int16Array toString MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-32768, -32768, -32768]);
      let actualString: string = arr.toString();
      let expectedString: string = '-32768,-32768,-32768';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_1600
     * @tc.name testInt16ArrayToStringTestOne016
     * @tc.desc Verify [1, -1, 0] Int16Array toString '1,-1,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, -1, 0]);
      let actualString: string = arr.toString();
      let expectedString: string = '1,-1,0';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_1700
     * @tc.name testInt16ArrayToStringTestOne017
     * @tc.desc Verify [100, -50, 200, -300, 0] Int16Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, -50, 200, -300, 0]);
      let actualString: string = arr.toString();
      let expectedString: string = '100,-50,200,-300,0';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_1800
     * @tc.name testInt16ArrayToStringTestOne018
     * @tc.desc Verify fill(0) Int16Array toString 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      arr.fill(0);
      let actualString: string = arr.toString();
      let expectedString: string = '0,0,0';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_1900
     * @tc.name testInt16ArrayToStringTestOne019
     * @tc.desc Verify reverse() Int16Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      arr.reverse();
      let actualString: string = arr.toString();
      let expectedString: string = '5,4,3,2,1';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_2000
     * @tc.name testInt16ArrayToStringTestOne020
     * @tc.desc Verify sort() Int16Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, -10, 3, 0, 8]);
      arr.sort();
      let actualString: string = arr.toString();
      let expectedString: string = '-10,0,3,5,8';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_2100
     * @tc.name testInt16ArrayToStringTestOne021
     * @tc.desc Verify set(src) Int16Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0, 0]);
      arr.set(Int16Array.of(10, 20));
      let actualString: string = arr.toString();
      let expectedString: string = '10,20,0,0';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_2200
     * @tc.name testInt16ArrayToStringTestOne022
     * @tc.desc Verify copyWithin(target, start) Int16Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.copyWithin(0, 2);
      let actualString: string = arr.toString();
      let expectedString: string = '30,40,50,40,50';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_2300
     * @tc.name testInt16ArrayToStringTestOne023
     * @tc.desc Verify $_set int16.MAX Int16Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0]);
      arr.$_set(1, 32767);
      let actualString: string = arr.toString();
      let expectedString: string = '0,32767,0';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_2400
     * @tc.name testInt16ArrayToStringTestOne024
     * @tc.desc Verify $_set int16.MIN Int16Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0]);
      arr.$_set(1, -32768);
      let actualString: string = arr.toString();
      let expectedString: string = '0,-32768,0';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_2500
     * @tc.name testInt16ArrayToStringTestOne025
     * @tc.desc Verify fill + $_set + reverse Int16Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([9, 8, 7, 6, 5]);
      arr.fill(0);
      arr.$_set(0, 100);
      arr.reverse();
      let actualString: string = arr.toString();
      let expectedString: string = '0,0,0,0,100';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_2600
     * @tc.name testInt16ArrayToStringTestOne026
     * @tc.desc Verify subarray(begin, end) toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 1, 2, 3, 4, 5]);
      let view: Int16Array = arr.subarray(1, 4);
      let actualString: string = view.toString();
      let expectedString: string = '1,2,3';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_2700
     * @tc.name testInt16ArrayToStringTestOne027
     * @tc.desc Verify toString returns '-32768,32767'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(2);
      arr.$_set(0, -32768);
      arr.$_set(1, 32767);
      let actualString: string = arr.toString();
      let expectedString: string = '-32768,32767';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_2800
     * @tc.name testInt16ArrayToStringTestOne028
     * @tc.desc Verify length=100 toString 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(100);
      arr.fill(1);
      let result: string = arr.toString();
      let expectedResult: string = '';
      for (let i: int = 0; i < 100; i++) {
        if (i > 0) {
          expectedResult += ',';
        }
        expectedResult += '1';
      }
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_2900
     * @tc.name testInt16ArrayToStringTestOne029
     * @tc.desc Verify ArrayBuffer byteLength 1 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let arr: Int16Array = new Int16Array(buf);
      arr.$_set(0, 16384);
      let actualString: string = arr.toString();
      let expectedString: string = '16384';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_3000
     * @tc.name testInt16ArrayToStringTestOne030
     * @tc.desc Verify toString equals join() on empty Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let actualString: string = arr.toString();
      let actualJoined: string = arr.join();
      expect(actualString).assertEqual(actualJoined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_3100
     * @tc.name testInt16ArrayToStringTestOne031
     * @tc.desc Verify toString() on single-element Int16Array returns '32767'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 32767;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toString();
      let actualResult: string = result;
      let expectedResult: string = '32767';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_3200
     * @tc.name testInt16ArrayToStringTestOne032
     * @tc.desc Verify toString() on subarray returns '20,30,40'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(1, 4);
      let result: string = sub.toString();
      expect(result).assertEqual('20,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_3300
     * @tc.name testInt16ArrayToStringTestOne033
     * @tc.desc Verify toString() on all MIN values returns the exact sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-32768, -32768);
      let result: string = arr.toString();
      let actualResult: string = result;
      let expectedResult: string = '-32768,-32768';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_3400
     * @tc.name testInt16ArrayToStringTestOne034
     * @tc.desc Verify toString() on Int16Array.of(-1,0,1) assertEqual '-1,0,1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-1, 0, 1);
      let result: string = arr.toString();
      let actualResult: string = result;
      let expectedResult: string = '-1,0,1';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_3500
     * @tc.name testInt16ArrayToStringTestOne035
     * @tc.desc Verify toString() on single-element negative assertEqual '-32768'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -32768;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toString();
      let actualResult: string = result;
      let expectedResult: string = '-32768';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_3600
     * @tc.name testInt16ArrayToStringTestOne036
     * @tc.desc Verify toString() on single-element zero assertEqual '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 0;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toString();
      let actualResult: string = result;
      let expectedResult: string = '0';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_3700
     * @tc.name testInt16ArrayToStringTestOne037
     * @tc.desc Verify toString() on array with negative and positive mix matches expected format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-100, 0, 100);
      let result: string = arr.toString();
      let actualResult: string = result;
      let expectedResult: string = '-100,0,100';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_3800
     * @tc.name testInt16ArrayToStringTestOne038
     * @tc.desc Verify toString() result starts with first element string and no leading comma
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 10, 15);
      let result: string = arr.toString();
      let firstChar: string = result.charAt(0).toString();
      let actualValue: string = firstChar;
      let expectedValue: string = '5';
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_3900
     * @tc.name testInt16ArrayToStringTestOne039
     * @tc.desc Verify toString() contains exactly length-1 commas for length-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let result: string = arr.toString();
      let commaCount: int = 0;
      for (let i: int = 0; i < result.length; i++) {
        if (result.charAt(i).toString() === ',') {
          commaCount = commaCount + 1;
        }
      }
      let actualValue: int = commaCount;
      let expectedValue: int = arr.length - 1;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_4000
     * @tc.name testInt16ArrayToStringTestOne040
     * @tc.desc Verify toString().length for empty array assertEqual 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let result: string = arr.toString();
      let expectedResult: string = '';
      expect(result).assertEqual(expectedResult);
      let actualLength: int = result.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_4100
     * @tc.name testInt16ArrayToStringTestOne041
     * @tc.desc Verify toString().length for single-digit element equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 7;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toString();
      let expectedResult: string = '7';
      expect(result).assertEqual(expectedResult);
      let actualLength: int = result.length;
      let expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_4200
     * @tc.name testInt16ArrayToStringTestOne042
     * @tc.desc Verify toString().length for multi-digit element matches digit count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 12345;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toString();
      let expectedResult: string = '12345';
      expect(result).assertEqual(expectedResult);
      let actualLength: int = result.length;
      let expectedLength: int = 5;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_4300
     * @tc.name testInt16ArrayToStringTestOne043
     * @tc.desc Verify toString().length for negative 2-digit element includes minus sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -55;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toString();
      let expectedResult: string = '-55';
      expect(result).assertEqual(expectedResult);
      let actualLength: int = result.length;
      let expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_4400
     * @tc.name testInt16ArrayToStringTestOne044
     * @tc.desc Verify toString().length for MIN element assertEqual 6 ('-32768')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -32768;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toString();
      let expectedResult: string = '-32768';
      expect(result).assertEqual(expectedResult);
      let actualLength: int = result.length;
      let expectedLength: int = 6;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_4500
     * @tc.name testInt16ArrayToStringTestOne045
     * @tc.desc Verify toString().length for MAX element assertEqual 5 ('32767')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 32767;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toString();
      let expectedResult: string = '32767';
      expect(result).assertEqual(expectedResult);
      let actualLength: int = result.length;
      let expectedLength: int = 5;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_4600
     * @tc.name testInt16ArrayToStringTestOne046
     * @tc.desc Verify toString().length for zero-element array assertEqual 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 0;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toString();
      let expectedResult: string = '0';
      expect(result).assertEqual(expectedResult);
      let actualLength: int = result.length;
      let expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_4700
     * @tc.name testInt16ArrayToStringTestOne047
     * @tc.desc Verify toString().length for 3-element array matches digitCount + commaCount
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 23, 456);
      let result: string = arr.toString();
      let expectedResult: string = '1,23,456';
      expect(result).assertEqual(expectedResult);
      let actualLength: int = result.length;
      let expectedLength: int = 8;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_4800
     * @tc.name testInt16ArrayToStringTestOne048
     * @tc.desc Verify toString().length for new Int16Array(4) all zeros assertEqual 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(4);
      let result: string = arr.toString();
      let expectedResult: string = '0,0,0,0';
      expect(result).assertEqual(expectedResult);
      let actualLength: int = result.length;
      let expectedLength: int = 7;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_4900
     * @tc.name testInt16ArrayToStringTestOne049
     * @tc.desc Verify After toString(), original.length unchanged on multi-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let lenBefore: int = arr.length;
      let result: string = arr.toString();
      let expectedResult: string = '1,2,3';
      expect(result).assertEqual(expectedResult);
      let actualLength: int = arr.length;
      let expectedLength: int = lenBefore;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_5000
     * @tc.name testInt16ArrayToStringTestOne050
     * @tc.desc Verify After toString(), original.$_get(0 as int) element value unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(88, 99, 111);
      let valBefore: number = arr.$_get(0);
      let result: string = arr.toString();
      let expectedResult: string = '88,99,111';
      expect(result).assertEqual(expectedResult);
      let elementAt0: number = arr.$_get(0 as int);
      let expectedElement0: number = valBefore;
      expect(elementAt0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_5100
     * @tc.name testInt16ArrayToStringTestOne051
     * @tc.desc Verify After toString() on empty array, original.length still 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let result: string = arr.toString();
      expect(result).assertEqual('');
      let actualLength: int = arr.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_5200
     * @tc.name testInt16ArrayToStringTestOne052
     * @tc.desc Verify After toString() on Int16Array.of(1,2,3,4), original.buffer.byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
      let bufLenBefore: int = arr.buffer.byteLength;
      let result: string = arr.toString();
      expect(result).assertEqual('1,2,3,4');
      let actualByteLength: int = arr.buffer.byteLength;
      let expectedByteLength: int = bufLenBefore;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_5300
     * @tc.name testInt16ArrayToStringTestOne053
     * @tc.desc Verify After toString() on subarray, original parent array element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 10, 15, 20);
      let sub: Int16Array = arr.subarray(0, 2);
      let valBefore: number = arr.$_get(0);
      let result: string = sub.toString();
      expect(result).assertEqual('5,10');
      let elementAt0: number = arr.$_get(0 as int);
      let expectedElement0: number = valBefore;
      expect(elementAt0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_5400
     * @tc.name testInt16ArrayToStringTestOne054
     * @tc.desc Verify After toString() on all MIN values, all elements still MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-32768, -32768);
      let result: string = arr.toString();
      expect(result).assertEqual('-32768,-32768');
      let elementAt0: number = arr.$_get(0 as int);
      let expectedElement0: int = -32768;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1 as int);
      let expectedElement1: int = -32768;
      expect(elementAt1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_5500
     * @tc.name testInt16ArrayToStringTestOne055
     * @tc.desc Verify toString() produces identical content on repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let r1: string = arr.toString();
      let r2: string = arr.toString();
      let actualValue: string = r1;
      let expectedValue: string = r2;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_5600
     * @tc.name testInt16ArrayToStringTestOne056
     * @tc.desc Verify Mutating array after toString() does not change previously returned string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let result: string = arr.toString();
      arr.$_set(0 as int, 99);
      let actualResult: string = result;
      let expectedResult: string = '1,2,3';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_5700
     * @tc.name testInt16ArrayToStringTestOne057
     * @tc.desc Verify Calling toString() twice with mutation between returns different strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let r1: string = arr.toString();
      arr.$_set(0 as int, 99);
      let r2: string = arr.toString();
      let actualValue: string = r2;
      let expectedValue: string = '99,2,3';
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_5800
     * @tc.name testInt16ArrayToStringTestOne058
     * @tc.desc Verify Changing original via fill(0) then toString returns updated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(7, 8, 9);
      let before: string = arr.toString();
      arr.fill(0);
      let after: string = arr.toString();
      let actualValue: string = after;
      let expectedValue: string = '0,0,0';
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_5900
     * @tc.name testInt16ArrayToStringTestOne059
     * @tc.desc Verify After mutating via subarray, parent.toString() reflects shared buffer change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let sub: Int16Array = arr.subarray(2, 5);
      sub.$_set(0 as int, 99);
      let result: string = arr.toString();
      let actualResult: string = result;
      let expectedResult: string = '1,2,99,4,5';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_6000
     * @tc.name testInt16ArrayToStringTestOne060
     * @tc.desc Verify subarray.toString() for length 0 subarray returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let sub: Int16Array = arr.subarray(0, 0);
      let result: string = sub.toString();
      let actualResult: string = result;
      let expectedResult: string = '';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_6100
     * @tc.name testInt16ArrayToStringTestOne061
     * @tc.desc Verify Int16Array.of and Int16Array.from with same values produce equal toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: Int16Array = Int16Array.of(5, 10, 15);
      let arr2: Int16Array = Int16Array.from([5, 10, 15]);
      let actualString: string = arr1.toString();
      let expectedString: string = arr2.toString();
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_6200
     * @tc.name testInt16ArrayToStringTestOne062
     * @tc.desc Verify toString() on all-negative values with varied digit counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-1, -100, -10000);
      let result: string = arr.toString();
      let actualResult: string = result;
      let expectedResult: string = '-1,-100,-10000';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_6300
     * @tc.name testInt16ArrayToStringTestOne063
     * @tc.desc Verify toString() returns the complete comma-separated element sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(100, 200, 300, 400);
      let result: string = arr.toString();
      let expectedResult: string = '100,200,300,400';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_6400
     * @tc.name testInt16ArrayToStringTestOne064
     * @tc.desc Verify $_set(-1) throws RangeError and toString remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      try {
        arr.$_set(-1 as int, 999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let result: string = arr.toString();
      let expectedValue: string = '10,20,30';
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_6500
     * @tc.name testInt16ArrayToStringTestOne065
     * @tc.desc Verify $_set(length) throws RangeError and toString remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 15, 25]);
      try {
        arr.$_set(3 as int, 888);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let result: string = arr.toString();
      let expectedValue: string = '5,15,25';
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_6600
     * @tc.name testInt16ArrayToStringTestOne066
     * @tc.desc Verify $_set(length+1) throws RangeError and toString remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
      try {
        arr.$_set(5 as int, 777);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let result: string = arr.toString();
      let expectedValue: string = '1,2,3,4';
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_6700
     * @tc.name testInt16ArrayToStringTestOne067
     * @tc.desc Verify $_set(-length) throws RangeError and toString remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      try {
        arr.$_set(-3 as int, 666);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let result: string = arr.toString();
      let expectedValue: string = '100,200,300';
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_6800
     * @tc.name testInt16ArrayToStringTestOne068
     * @tc.desc Verify $_set(-length-1) throws RangeError and toString remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7, 8, 9]);
      try {
        arr.$_set(-4 as int, 555);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let result: string = arr.toString();
      let expectedValue: string = '7,8,9';
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_6900
     * @tc.name testInt16ArrayToStringTestOne069
     * @tc.desc Verify $_set(2147483647) throws RangeError and toString remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      try {
        arr.$_set(2147483647 as int, 444);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let result: string = arr.toString();
      let expectedValue: string = '1,2,3';
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_7000
     * @tc.name testInt16ArrayToStringTestOne070
     * @tc.desc Verify $_set(-2147483647) throws RangeError and toString remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20]);
      try {
        arr.$_set(-2147483647 as int, 333);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let result: string = arr.toString();
      let expectedValue: string = '10,20';
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_7100
     * @tc.name testInt16ArrayToStringTestOne071
     * @tc.desc Verify multiple out-of-range $_set calls throw RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([50, 60, 70]);
      try {
        arr.$_set(-1 as int, 999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      try {
        arr.$_set(3 as int, 888);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      try {
        arr.$_set(-4 as int, 777);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      try {
        arr.$_set(2147483647 as int, 666);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let result: string = arr.toString();
      let expectedValue: string = '50,60,70';
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_7200
     * @tc.name testInt16ArrayToStringTestOne072
     * @tc.desc Verify out-of-range $_set calls on empty array throw RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      try {
        arr.$_set(-1 as int, 111);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      try {
        arr.$_set(0 as int, 222);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let result: string = arr.toString();
      let expectedValue: string = '';
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_7300
     * @tc.name testInt16ArrayToStringTestOne073
     * @tc.desc Verify fill(32768) -32768 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(3);
      arr.fill(32768);
      let result: string = arr.toString();
      let expectedValue: string = '-32768,-32768,-32768';
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_7400
     * @tc.name testInt16ArrayToStringTestOne074
     * @tc.desc Verify subarray buffer subarray.toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let parent: Int16Array = new Int16Array(buf, 0, 3);
      let child: Int16Array = new Int16Array(buf, 2, 2);
      parent.$_set(1 as int, 999);
      parent.$_set(2 as int, -555);
      let result: string = child.toString();
      let expectedValue: string = '999,-555';
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_7500
     * @tc.name testInt16ArrayToStringTestOne075
     * @tc.desc Verify sort constant-one compareFn keeps original order in toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, -10, 3, 0, 8]);
      arr.sort((_a: number, _b: number): int => 1);
      let result: string = arr.toString();
      let expectedValue: string = '5,-10,3,0,8';
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_7600
     * @tc.name testInt16ArrayToStringTestOne076
     * @tc.desc Verify sort ascending on all-negative Int16Array via toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-5, -1, -300, -50, -10]);
      arr.sort((a: number, b: number): int => (a - b).toInt());
      let result: string = arr.toString();
      let expectedValue: string = '-300,-50,-10,-5,-1';
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_7700
     * @tc.name testInt16ArrayToStringTestOne077
     * @tc.desc Verify sort().reverse() toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([3, 1, 4, 1, 5]);
      arr.sort().reverse();
      let result: string = arr.toString();
      let expectedValue: string = '5,4,3,1,1';
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_7800
     * @tc.name testInt16ArrayToStringTestOne078
     * @tc.desc Verify fill(MIN).$_set(0 as int, MAX).reverse() toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(4);
      arr.fill(-32768);
      arr.$_set(0 as int, 32767);
      arr.reverse();
      let result: string = arr.toString();
      let expectedValue: string = '-32768,-32768,-32768,32767';
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_7900
     * @tc.name testInt16ArrayToStringTestOne079
     * @tc.desc Verify copyWithin(1, 0).fill(0, 2) toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.copyWithin(1, 0);
      arr.fill(0, 2);
      let result: string = arr.toString();
      let expectedValue: string = '10,10,0,0,0';
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_8000
     * @tc.name testInt16ArrayToStringTestOne080
     * @tc.desc Verify set(src).sort() toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 50, 75, 25]);
      arr.set(new Int16Array([60, 10]), 1);
      arr.sort();
      let result: string = arr.toString();
      let expectedValue: string = '10,25,60,100';
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_8100
     * @tc.name testInt16ArrayToStringTestOne081
     * @tc.desc Verify fill(100).copyWithin(0, 1).$_set(0 as int, 999) toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(4);
      arr.fill(100);
      arr.copyWithin(0, 1);
      arr.$_set(0 as int, 999);
      let result: string = arr.toString();
      let expectedValue: string = '999,100,100,100';
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_8200
     * @tc.name testInt16ArrayToStringTestOne082
     * @tc.desc Verify reverse().fill(0, 1, 3) toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      arr.reverse();
      arr.fill(0, 1, 3);
      let result: string = arr.toString();
      let expectedValue: string = '5,0,0,2,1';
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_8300
     * @tc.name testInt16ArrayToStringTestOne083
     * @tc.desc Verify [MIN,-1,0,1,MAX] Int16Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-32768, -1, 0, 1, 32767]);
      let result: string = arr.toString();
      let expectedValue: string = '-32768,-1,0,1,32767';
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_8400
     * @tc.name testInt16ArrayToStringTestOne084
     * @tc.desc Verify $_get(-1 as int) undefined toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      try {
        arr.$_get(-1 as int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let result: string = arr.toString();
      let expectedValue: string = '10,20,30';
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_8500
     * @tc.name testInt16ArrayToStringTestOne085
     * @tc.desc Verify $_get(length+1 as int) undefined toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
      try {
        arr.$_get(5 as int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let result: string = arr.toString();
      let expectedValue: string = '1,2,3,4';
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_8600
     * @tc.name testInt16ArrayToStringTestOne086
     * @tc.desc Verify $_get(2147483647 as int) undefined toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200]);
      try {
        arr.$_get(2147483647 as int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let result: string = arr.toString();
      let expectedValue: string = '100,200';
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_8700
     * @tc.name testInt16ArrayToStringTestOne087
     * @tc.desc Verify set overflow source values wrap then toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(3);
      let src: Int16Array = new Int16Array([32768, -32769, 100]);
      arr.set(src);
      let result: string = arr.toString();
      let expectedValue: string = '-32768,32767,100';
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_8800
     * @tc.name testInt16ArrayToStringTestOne088
     * @tc.desc Verify all min boundary toString equals join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-32768, -32768, -32768]);
      let tsStr: string = arr.toString();
      let joinStr: string = arr.join();
      expect(tsStr).assertEqual(joinStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_8900
     * @tc.name testInt16ArrayToStringTestOne089
     * @tc.desc Verify oob $_set no-op keeps toString equal join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      try {
        arr.$_set(-1 as int, 999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      try {
        arr.$_set(5 as int, 888);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let tsStr: string = arr.toString();
      let joinStr: string = arr.join();
      expect(tsStr).assertEqual(joinStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_9000
     * @tc.name testInt16ArrayToStringTestOne090
     * @tc.desc Verify fill overflow wrap toString equals join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(3);
      arr.fill(32768);
      let tsStr: string = arr.toString();
      let joinStr: string = arr.join();
      expect(tsStr).assertEqual(joinStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_9100
     * @tc.name testInt16ArrayToStringTestOne091
     * @tc.desc Verify shared buffer view change toString equals join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view1: Int16Array = new Int16Array(buf, 0, 2);
      let view2: Int16Array = new Int16Array(buf, 0, 2);
      view1.$_set(1 as int, -500);
      let tsStr: string = view2.toString();
      let joinStr: string = view2.join();
      expect(tsStr).assertEqual(joinStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_9200
     * @tc.name testInt16ArrayToStringTestOne092
     * @tc.desc Verify $_set no-op fill sort toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([50, -20, 10, 0, -5]);
      try {
        arr.$_set(-1 as int, 999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      try {
        arr.$_set(10 as int, 888);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      arr.fill(0, 0, 2);
      arr.sort();
      let result: string = arr.toString();
      let expectedValue: string = '-5,0,0,0,10';
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_9300
     * @tc.name testInt16ArrayToStringTestOne093
     * @tc.desc Verify shared buffer alias write and fill then toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Int16Array = new Int16Array(buf, 0, 3);
      let alias: Int16Array = new Int16Array(buf, 2, 1);
      alias.$_set(0 as int, 777);
      arr.fill(99, 0, 1);
      let result: string = arr.toString();
      let expectedValue: string = '99,777,0';
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_9400
     * @tc.name testInt16ArrayToStringTestOne094
     * @tc.desc Verify fill copyWithin $_set reverse toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5, 6]);
      arr.fill(0, 0, 1);
      arr.copyWithin(2, 0, 2);
      arr.$_set(5 as int, -999);
      arr.reverse();
      let result: string = arr.toString();
      let expectedValue: string = '-999,5,2,0,2,0';
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSTRING_ONE_9500
     * @tc.name testInt16ArrayToStringTestOne095
     * @tc.desc Verify join rejects an object cast to String with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToStringTestOne095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = Int16Array.of(1, 2, 3);
      const unsupported: Object = new Object();
      try {
        const invalidSeparator: String = unsupported as object as String;
        arr.join(invalidSeparator);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

  });
}
