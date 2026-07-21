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

function forEachThrowTest(value: number): void {
  throw new Error('test');
}

export default function Uint8ArrayForEachTest(): void {
  describe('Uint8ArrayForEachTest', () => {
    beforeAll(() => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_0100
     * @tc.name testUint8ArrayForEach001
     * @tc.desc Verify forEach with one required parameter callbackfn executes normally
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount: int = 0;
      const arr: Uint8Array = Uint8Array.of(42, 84);
      arr.forEach((value: number): void => { callCount++; });
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_0200
     * @tc.name testUint8ArrayForEach002
     * @tc.desc Verify callbackfn receives correct value parameter for single element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let captured: number = 0;
      const arr: Uint8Array = Uint8Array.of(42);
      arr.forEach((value: number): void => { captured = value; });
      expect(captured).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_0300
     * @tc.name testUint8ArrayForEach003
     * @tc.desc Verify callbackfn receives correct value parameter sequence for multi-element sum
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: number = 0;
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      arr.forEach((value: number): void => { sum += value; });
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_0400
     * @tc.name testUint8ArrayForEach004
     * @tc.desc Verify callbackfn receives correct index parameter sequence for sum
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let indexSum: int = 0;
      const arr: Uint8Array = Uint8Array.of(5, 10, 15, 20);
      arr.forEach((value: number, index: int): void => { indexSum += index; });
      expect(indexSum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_0500
     * @tc.name testUint8ArrayForEach005
     * @tc.desc Verify callbackfn first call index is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstIndex: int = -1;
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      arr.forEach((value: number, index: int): void => {
        if (firstIndex === -1) { firstIndex = index; }
      });
      expect(firstIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_0600
     * @tc.name testUint8ArrayForEach006
     * @tc.desc Verify callbackfn last call index is length-1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lastIndex: int = -1;
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      arr.forEach((value: number, index: int): void => { lastIndex = index; });
      expect(lastIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_0700
     * @tc.name testUint8ArrayForEach007
     * @tc.desc Verify callbackfn third parameter array reference is same as original array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sameRef: boolean = true;
      const arr: Uint8Array = Uint8Array.of(1, 2);
      arr.forEach((value: number, index: int, array: Uint8Array): void => {
        if (array !== arr) { sameRef = false; }
      });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_0800
     * @tc.name testUint8ArrayForEach008
     * @tc.desc Verify callbackfn call count equals array length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      const arr: Uint8Array = Uint8Array.of(7, 14, 21, 28, 35);
      arr.forEach((value: number): void => { count++; });
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_0900
     * @tc.name testUint8ArrayForEach009
     * @tc.desc Verify callbackfn is called in ascending index order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let prev: int = -1;
      let ordered: boolean = true;
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4);
      arr.forEach((value: number, index: int): void => {
        if (index <= prev) { ordered = false; }
        prev = index;
      });
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_1000
     * @tc.name testUint8ArrayForEach010
     * @tc.desc Verify callbackfn declares 3 parameters and receives all
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let paramCount: int = 0;
      const arr: Uint8Array = Uint8Array.of(1);
      arr.forEach((value: number, index: int, array: Uint8Array): void => {
        paramCount = 3;
      });
      expect(paramCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_1100
     * @tc.name testUint8ArrayForEach011
     * @tc.desc Verify callbackfn declares only 2 parameters (value, index)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sumVal: number = 0;
      let sumIdx: int = 0;
      const arr: Uint8Array = Uint8Array.of(3, 6, 9);
      arr.forEach((value: number, index: int): void => {
        sumVal += value;
        sumIdx += index;
      });
      expect(sumVal + sumIdx).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_1200
     * @tc.name testUint8ArrayForEach012
     * @tc.desc Verify callbackfn declares only 1 parameter (value)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let total: number = 0;
      const arr: Uint8Array = Uint8Array.of(4, 8, 12);
      arr.forEach((value: number): void => { total += value; });
      expect(total).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_1300
     * @tc.name testUint8ArrayForEach013
     * @tc.desc Verify callbackfn declares no parameters but is still called
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false;
      const arr: Uint8Array = Uint8Array.of(1);
      arr.forEach((): void => { called = true; });
      expect(called).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_1400
     * @tc.name testUint8ArrayForEach014
     * @tc.desc Verify callbackfn uses arrow function syntax
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let acc: number = 0;
      const arr: Uint8Array = Uint8Array.of(2, 4, 6);
      arr.forEach((value: number): void => { acc += value; });
      expect(acc).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_1500
     * @tc.name testUint8ArrayForEach015
     * @tc.desc Verify callbackfn uses named function reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let accum: number = 0;
      const addValue = (val: number): void => { accum += val; };
      const arr: Uint8Array = Uint8Array.of(1, 3, 5);
      arr.forEach(addValue);
      expect(accum).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_1600
     * @tc.name testUint8ArrayForEach016
     * @tc.desc Verify callbackfn uses inline function expression
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      const arr: Uint8Array = Uint8Array.of(10, 20);
      arr.forEach((value: number): void => { res += value; });
      expect(res).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_1700
     * @tc.name testUint8ArrayForEach017
     * @tc.desc Verify callbackfn receives value as minimum value 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number = 255;
      const arr: Uint8Array = new Uint8Array(1);
      arr[0] = 0;
      arr.forEach((value: number): void => { val = value; });
      expect(val).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_1800
     * @tc.name testUint8ArrayForEach018
     * @tc.desc Verify callbackfn receives value as maximum value 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number = 0;
      const arr: Uint8Array = new Uint8Array(1);
      arr[0] = 255;
      arr.forEach((value: number): void => { val = value; });
      expect(val).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_1900
     * @tc.name testUint8ArrayForEach019
     * @tc.desc Verify callbackfn receives value as middle value 127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number = 0;
      const arr: Uint8Array = Uint8Array.of(127);
      arr.forEach((value: number): void => { val = value; });
      expect(val).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_2000
     * @tc.name testUint8ArrayForEach020
     * @tc.desc Verify callbackfn receives value as middle value 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number = 0;
      const arr: Uint8Array = Uint8Array.of(128);
      arr.forEach((value: number): void => { val = value; });
      expect(val).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_2100
     * @tc.name testUint8ArrayForEach021
     * @tc.desc Verify callbackfn receives value from 0x00 literal construction
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number = 255;
      const arr: Uint8Array = Uint8Array.of(0x00);
      arr.forEach((value: number): void => { val = value; });
      expect(val).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_2200
     * @tc.name testUint8ArrayForEach022
     * @tc.desc Verify callbackfn receives value from 0xFF literal construction
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number = 0;
      const arr: Uint8Array = Uint8Array.of(0xFF);
      arr.forEach((value: number): void => { val = value; });
      expect(val).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_2300
     * @tc.name testUint8ArrayForEach023
     * @tc.desc Verify callbackfn receives value from 0x80 literal construction
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number = 0;
      const arr: Uint8Array = Uint8Array.of(0x80);
      arr.forEach((value: number): void => { val = value; });
      expect(val).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_2400
     * @tc.name testUint8ArrayForEach024
     * @tc.desc Verify callbackfn receives value from 0x7F literal construction
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number = 0;
      const arr: Uint8Array = Uint8Array.of(0x7F);
      arr.forEach((value: number): void => { val = value; });
      expect(val).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_2500
     * @tc.name testUint8ArrayForEach025
     * @tc.desc Verify callbackfn receives value as minimum positive value 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number = 0;
      const arr: Uint8Array = Uint8Array.of(1);
      arr.forEach((value: number): void => { val = value; });
      expect(val).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_2600
     * @tc.name testUint8ArrayForEach026
     * @tc.desc Verify callbackfn receives multiple boundary values [0,255,127,128] in correct sequence
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: string = '';
      const arr: Uint8Array = Uint8Array.of(0, 255, 127, 128);
      arr.forEach((value: number): void => { vals += value.toString() + ','; });
      expect(vals).assertEqual('0,255,127,128,');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_2700
     * @tc.name testUint8ArrayForEach027
     * @tc.desc Verify empty array new Uint8Array() callbackfn is not called
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false;
      const arr: Uint8Array = new Uint8Array();
      arr.forEach((value: number): void => { called = true; });
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_2800
     * @tc.name testUint8ArrayForEach028
     * @tc.desc Verify single element array callbackfn is called once
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cnt: int = 0;
      const arr: Uint8Array = Uint8Array.of(99);
      arr.forEach((value: number): void => { cnt++; });
      expect(cnt).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_2900
     * @tc.name testUint8ArrayForEach029
     * @tc.desc Verify two element array callbackfn is called twice
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cnt: int = 0;
      const arr: Uint8Array = Uint8Array.of(11, 22);
      arr.forEach((value: number): void => { cnt++; });
      expect(cnt).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_3000
     * @tc.name testUint8ArrayForEach030
     * @tc.desc Verify three element array callbackfn is called three times
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cnt: int = 0;
      const arr: Uint8Array = Uint8Array.of(33, 44, 55);
      arr.forEach((value: number): void => { cnt++; });
      expect(cnt).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_3100
     * @tc.name testUint8ArrayForEach031
     * @tc.desc Verify five element array callbackfn is called five times
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cnt: int = 0;
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      arr.forEach((value: number): void => { cnt++; });
      expect(cnt).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_3200
     * @tc.name testUint8ArrayForEach032
     * @tc.desc Verify ten element array callbackfn is called ten times
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cnt: int = 0;
      const arr: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
      arr.forEach((value: number): void => { cnt++; });
      expect(cnt).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_3300
     * @tc.name testUint8ArrayForEach033
     * @tc.desc Verify 100 element array callbackfn is called 100 times
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cnt: int = 0;
      const arr: Uint8Array = new Uint8Array(100);
      arr.forEach((value: number): void => { cnt++; });
      expect(cnt).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_3400
     * @tc.name testUint8ArrayForEach034
     * @tc.desc Verify 256 element array callbackfn is called 256 times
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cnt: int = 0;
      const arr: Uint8Array = new Uint8Array(256);
      arr.forEach((value: number): void => { cnt++; });
      expect(cnt).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_3500
     * @tc.name testUint8ArrayForEach035
     * @tc.desc Verify callbackfn receives index 0 for first element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstIdx: int = -1;
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      arr.forEach((value: number, index: int): void => {
        if (firstIdx === -1) { firstIdx = index; }
      });
      expect(firstIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_3600
     * @tc.name testUint8ArrayForEach036
     * @tc.desc Verify callbackfn receives index 1 for second element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let secondIdx: int = -1;
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      arr.forEach((value: number, index: int): void => {
        if (index === 1) { secondIdx = index; }
      });
      expect(secondIdx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_3700
     * @tc.name testUint8ArrayForEach037
     * @tc.desc Verify callbackfn receives index 2 for third element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thirdIdx: int = -1;
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      arr.forEach((value: number, index: int): void => {
        if (index === 2) { thirdIdx = index; }
      });
      expect(thirdIdx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_3800
     * @tc.name testUint8ArrayForEach038
     * @tc.desc Verify callbackfn receives index 9 for tenth element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tenthIdx: int = -1;
      const arr: Uint8Array = new Uint8Array(10);
      arr.forEach((value: number, index: int): void => {
        if (index === 9) { tenthIdx = index; }
      });
      expect(tenthIdx).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_3900
     * @tc.name testUint8ArrayForEach039
     * @tc.desc Verify callbackfn receives index 99 for hundredth element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hundredthIdx: int = -1;
      const arr: Uint8Array = new Uint8Array(100);
      arr.forEach((value: number, index: int): void => {
        if (index === 99) { hundredthIdx = index; }
      });
      expect(hundredthIdx).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_4000
     * @tc.name testUint8ArrayForEach040
     * @tc.desc Verify callbackfn receives index 255 for 256th element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lastIdx: int = -1;
      const arr: Uint8Array = new Uint8Array(256);
      arr.forEach((value: number, index: int): void => {
        if (index === 255) { lastIdx = index; }
      });
      expect(lastIdx).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_4100
     * @tc.name testUint8ArrayForEach041
     * @tc.desc Verify callbackfn receives index 0 for single element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let idx: int = -1;
      const arr: Uint8Array = Uint8Array.of(42);
      arr.forEach((value: number, index: int): void => { idx = index; });
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_4200
     * @tc.name testUint8ArrayForEach042
     * @tc.desc Verify callbackfn receives index 1 for two element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lastIdx: int = -1;
      const arr: Uint8Array = Uint8Array.of(1, 2);
      arr.forEach((value: number, index: int): void => { lastIdx = index; });
      expect(lastIdx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_4300
     * @tc.name testUint8ArrayForEach043
     * @tc.desc Verify callbackfn receives index 4 for five element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lastIdx: int = -1;
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      arr.forEach((value: number, index: int): void => { lastIdx = index; });
      expect(lastIdx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_4400
     * @tc.name testUint8ArrayForEach044
     * @tc.desc Verify callbackfn receives array parameter as Uint8Array type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isUint8Array: boolean = false;
      const arr: Uint8Array = Uint8Array.of(1, 2);
      arr.forEach((value: number, index: int, array: Uint8Array): void => {
        if (array instanceof Uint8Array) { isUint8Array = true; }
      });
      expect(isUint8Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_4500
     * @tc.name testUint8ArrayForEach045
     * @tc.desc Verify callbackfn receives array parameter with same length as original
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sameLength: boolean = false;
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      arr.forEach((value: number, index: int, array: Uint8Array): void => {
        if (array.length === arr.length) { sameLength = true; }
      });
      expect(sameLength).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_4600
     * @tc.name testUint8ArrayForEach046
     * @tc.desc Verify callbackfn receives array parameter with same elements as original
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sameElements: boolean = true;
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      arr.forEach((value: number, index: int, array: Uint8Array): void => {
        if (array[index] !== arr[index]) { sameElements = false; }
      });
      expect(sameElements).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_4700
     * @tc.name testUint8ArrayForEach047
     * @tc.desc Verify callbackfn receives array parameter with same buffer as original
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sameBuffer: boolean = false;
      const arr: Uint8Array = Uint8Array.of(1, 2);
      arr.forEach((value: number, index: int, array: Uint8Array): void => {
        if (array.buffer === arr.buffer) { sameBuffer = true; }
      });
      expect(sameBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_4800
     * @tc.name testUint8ArrayForEach048
     * @tc.desc Verify callbackfn receives array parameter with same byteOffset as original
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sameOffset: boolean = false;
      const arr: Uint8Array = Uint8Array.of(1, 2);
      arr.forEach((value: number, index: int, array: Uint8Array): void => {
        if (array.byteOffset === arr.byteOffset) { sameOffset = true; }
      });
      expect(sameOffset).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_4900
     * @tc.name testUint8ArrayForEach049
     * @tc.desc Verify forEach returns undefined (void)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: void = arr.forEach((value: number): void => {});
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_5000
     * @tc.name testUint8ArrayForEach050
     * @tc.desc Verify forEach returns undefined for empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(0);
      const result: void = arr.forEach((value: number): void => {});
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_5100
     * @tc.name testUint8ArrayForEach051
     * @tc.desc Verify forEach returns undefined for single element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(42);
      const result: void = arr.forEach((value: number): void => {});
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_5200
     * @tc.name testUint8ArrayForEach052
     * @tc.desc Verify forEach returns undefined for large array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(1000);
      const result: void = arr.forEach((value: number): void => {});
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_5300
     * @tc.name testUint8ArrayForEach053
     * @tc.desc Verify forEach propagates exception when callbackfn throws, result variable remains undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: void = undefined;
      const arr: Uint8Array = Uint8Array.of(1);
      try {
        result = arr.forEach(forEachThrowTest);
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_5400
     * @tc.name testUint8ArrayForEach054
     * @tc.desc Verify forEach returns undefined when callbackfn modifies array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: void = arr.forEach((value: number, index: int): void => {
        arr[index] = value * 2;
      });
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_5500
     * @tc.name testUint8ArrayForEach055
     * @tc.desc Verify forEach returns undefined when callbackfn modifies existing elements in place
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2);
      const result: void = arr.forEach((value: number, index: int): void => {
        arr[index] = value + 10;
      });
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FOR_EACH_5600
     * @tc.name testUint8ArrayForEach056
     * @tc.desc Verify forEach returns undefined when callbackfn assigns current value unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayForEach056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const result: void = arr.forEach((value: number, index: int): void => {
        arr[index] = value;
      });
      expect(result).assertEqual(undefined);
    });
  });
}