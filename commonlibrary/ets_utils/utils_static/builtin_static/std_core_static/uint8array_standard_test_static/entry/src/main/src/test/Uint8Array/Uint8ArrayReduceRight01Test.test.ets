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

class SumCount {
  sum: number;
  count: int;
  constructor(sum: number, count: int) {
    this.sum = sum;
    this.count = count;
  }
}

class Result {
  sum: number;
  count: int;
  constructor(sum: number, count: int) {
    this.sum = sum;
    this.count = count;
  }
}

export default function Uint8ArrayReduceRight01Test(): void {
  describe('Uint8ArrayReduceRight01Test', () => {
    beforeAll(() => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_0100
     * @tc.name testUint8ArrayReduceRight001
     * @tc.desc Verify reduceRight with 2 parameters (callbackfn + initialValue) using addition accumulation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 0);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_0200
     * @tc.name testUint8ArrayReduceRight002
     * @tc.desc Verify reduceRight with callbackfn performing addition accumulation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_0300
     * @tc.name testUint8ArrayReduceRight003
     * @tc.desc Verify reduceRight with callbackfn performing multiplication accumulation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(3, 5, 7);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev * cur, 1);
      expect(result).assertEqual(105);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_0400
     * @tc.name testUint8ArrayReduceRight004
     * @tc.desc Verify reduceRight with subtraction to validate right-to-left order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev - cur, 0);
      expect(result).assertEqual(-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_0500
     * @tc.name testUint8ArrayReduceRight005
     * @tc.desc Verify reduceRight with string concatenation using U=string generic
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const result: string = arr.reduceRight<string>((prev: string, cur: number): string => prev + cur.toString(), '');
      expect(result).assertEqual('302010');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_0600
     * @tc.name testUint8ArrayReduceRight006
     * @tc.desc Verify reduceRight with string concatenation validating right-to-left index order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: string = arr.reduceRight<string>((prev: string, cur: number, idx: int): string => prev + idx.toString(), '');
      expect(result).assertEqual('210');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_0700
     * @tc.name testUint8ArrayReduceRight007
     * @tc.desc Verify reduceRight callbackfn with all 4 parameters and array equality
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(5, 10, 15);
      arr.reduceRight((prev: number, cur: number, idx: int, array: Uint8Array): number => {
        expect(array).assertEqual(arr);
        return prev + cur;
      }, 0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_0800
     * @tc.name testUint8ArrayReduceRight008
     * @tc.desc Verify reduceRight callbackfn index decrements from right to left
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4);
      let prevIdx: int = 3;
      arr.reduceRight((prev: number, cur: number, idx: int): number => {
        expect(idx).assertEqual(prevIdx);
        prevIdx--;
        return prev + cur;
      }, 0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_0900
     * @tc.name testUint8ArrayReduceRight009
     * @tc.desc Verify reduceRight callbackfn external counter increments with each iteration
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      let count: int = 0;
      const result: number = arr.reduceRight((prev: number, cur: number): number => {
        count++;
        return prev + cur;
      }, 0);
      expect(result).assertEqual(60);
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_1000
     * @tc.name testUint8ArrayReduceRight010
     * @tc.desc Verify reduceRight callbackfn returns constant value ignoring input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(100, 200, 300);
      const result: number = arr.reduceRight((prev: number, cur: number): number => 42, 0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_1100
     * @tc.name testUint8ArrayReduceRight011
     * @tc.desc Verify reduceRight callbackfn reads array element via index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(2, 4, 6);
      const result: number = arr.reduceRight((prev: number, cur: number, idx: int, array: Uint8Array): number => prev + array[idx], 0);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_1200
     * @tc.name testUint8ArrayReduceRight012
     * @tc.desc Verify reduceRight callbackfn with multi-statement code block
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(3, 6, 9);
      const result: number = arr.reduceRight((prev: number, cur: number): number => {
        const tmp: number = prev + cur;
        return tmp;
      }, 0);
      expect(result).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_1300
     * @tc.name testUint8ArrayReduceRight013
     * @tc.desc Verify reduceRight callbackfn reads external scope variable
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const base: number = 10;
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur + base, 0);
      expect(result).assertEqual(36);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_1400
     * @tc.name testUint8ArrayReduceRight014
     * @tc.desc Verify reduceRight callbackfn with bitwise OR operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 4);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev | cur, 0);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_1500
     * @tc.name testUint8ArrayReduceRight015
     * @tc.desc Verify reduceRight callbackfn calling Math.max method
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(2, 4, 6);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + Math.max(cur, 3), 0);
      expect(result).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_1600
     * @tc.name testUint8ArrayReduceRight016
     * @tc.desc Verify reduceRight on single element array executes callback once
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(42);
      let callCount: int = 0;
      const result: number = arr.reduceRight((prev: number, cur: number): number => {
        callCount++;
        return prev + cur;
      }, 0);
      expect(result).assertEqual(42);
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_1700
     * @tc.name testUint8ArrayReduceRight017
     * @tc.desc Verify reduceRight on empty array returns initialValue without executing callback
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array();
      let callCount: int = 0;
      const result: number = arr.reduceRight((prev: number, cur: number): number => {
        callCount++;
        return prev + cur;
      }, 99);
      expect(result).assertEqual(99);
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_1800
     * @tc.name testUint8ArrayReduceRight018
     * @tc.desc Verify reduceRight callbackfn handling array with all identical values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(5, 5, 5);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 0);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_1900
     * @tc.name testUint8ArrayReduceRight019
     * @tc.desc Verify reduceRight callbackfn validates cur is within 0-255 range
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 128, 255);
      arr.reduceRight((prev: number, cur: number): number => {
        expect(cur >= 0).assertTrue();
        expect(cur <= 255).assertTrue();
        return prev + cur;
      }, 0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_2000
     * @tc.name testUint8ArrayReduceRight020
     * @tc.desc Verify reduceRight callbackfn returns negative number
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev - cur, 0);
      expect(result < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_2100
     * @tc.name testUint8ArrayReduceRight021
     * @tc.desc Verify reduceRight callbackfn using ternary operator
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + (cur > 1 ? cur : 0), 0);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_2200
     * @tc.name testUint8ArrayReduceRight022
     * @tc.desc Verify reduceRight callbackfn using division calculation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur / 10, 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_2300
     * @tc.name testUint8ArrayReduceRight023
     * @tc.desc Verify reduceRight with interface type U generic accumulation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const initVal: SumCount = new SumCount(0, 0);
      const result: SumCount = arr.reduceRight<SumCount>((prev: SumCount, cur: number): SumCount => {
        return new SumCount(prev.sum + cur, prev.count + 1);
      }, initVal);
      expect(result.sum).assertEqual(60);
      expect(result.count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_2400
     * @tc.name testUint8ArrayReduceRight024
     * @tc.desc Verify reduceRight with initialValue equal to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_2500
     * @tc.name testUint8ArrayReduceRight025
     * @tc.desc Verify reduceRight with initialValue equal to 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 1);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_2600
     * @tc.name testUint8ArrayReduceRight026
     * @tc.desc Verify reduceRight with initialValue equal to -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, -1);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_2700
     * @tc.name testUint8ArrayReduceRight027
     * @tc.desc Verify reduceRight with initialValue equal to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 255);
      expect(result).assertEqual(261);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_2800
     * @tc.name testUint8ArrayReduceRight028
     * @tc.desc Verify reduceRight with initialValue equal to 256
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 256);
      expect(result).assertEqual(262);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_2900
     * @tc.name testUint8ArrayReduceRight029
     * @tc.desc Verify reduceRight with initialValue equal to -255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, -255);
      expect(result).assertEqual(-249);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_3000
     * @tc.name testUint8ArrayReduceRight030
     * @tc.desc Verify reduceRight with initialValue equal to 127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 127);
      expect(result).assertEqual(133);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_3100
     * @tc.name testUint8ArrayReduceRight031
     * @tc.desc Verify reduceRight with initialValue equal to 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 128);
      expect(result).assertEqual(134);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_3200
     * @tc.name testUint8ArrayReduceRight032
     * @tc.desc Verify reduceRight with initialValue equal to 0.5
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 0.5);
      expect(result).assertEqual(6.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_3300
     * @tc.name testUint8ArrayReduceRight033
     * @tc.desc Verify reduceRight with initialValue equal to -0.5
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, -0.5);
      expect(result).assertEqual(5.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_3400
     * @tc.name testUint8ArrayReduceRight034
     * @tc.desc Verify reduceRight with initialValue equal to NaN
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, Number.NaN);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_3500
     * @tc.name testUint8ArrayReduceRight035
     * @tc.desc Verify reduceRight with initialValue equal to Infinity
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, Number.POSITIVE_INFINITY);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_3600
     * @tc.name testUint8ArrayReduceRight036
     * @tc.desc Verify reduceRight with initialValue equal to -Infinity
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, Number.NEGATIVE_INFINITY);
      expect(result).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_3700
     * @tc.name testUint8ArrayReduceRight037
     * @tc.desc Verify reduceRight with initialValue equal to 0x80 (hexadecimal 128)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 0x80);
      expect(result).assertEqual(134);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_3800
     * @tc.name testUint8ArrayReduceRight038
     * @tc.desc Verify reduceRight with initialValue equal to 0xFF (hexadecimal 255)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 0xFF);
      expect(result).assertEqual(261);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_3900
     * @tc.name testUint8ArrayReduceRight039
     * @tc.desc Verify reduceRight with initialValue equal to 0x100 (hexadecimal 256)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 0x100);
      expect(result).assertEqual(262);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_4000
     * @tc.name testUint8ArrayReduceRight040
     * @tc.desc Verify reduceRight with initialValue equal to 0b11111111 (binary 255)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 0b11111111);
      expect(result).assertEqual(261);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_4100
     * @tc.name testUint8ArrayReduceRight041
     * @tc.desc Verify reduceRight with initialValue equal to 0o377 (octal 255)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 0o377);
      expect(result).assertEqual(261);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_4200
     * @tc.name testUint8ArrayReduceRight042
     * @tc.desc Verify reduceRight with initialValue equal to 1e2 (scientific notation 100)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 1e2);
      expect(result).assertEqual(106);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_4300
     * @tc.name testUint8ArrayReduceRight043
     * @tc.desc Verify reduceRight with initialValue equal to 1e-2 (scientific notation 0.01)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 1e-2);
      expect(result).assertEqual(6.01);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_4400
     * @tc.name testUint8ArrayReduceRight044
     * @tc.desc Verify reduceRight with initialValue equal to empty string U=string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: string = arr.reduceRight<string>((prev: string, cur: number): string => prev + cur.toString(), '');
      expect(result).assertEqual('321');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_4500
     * @tc.name testUint8ArrayReduceRight045
     * @tc.desc Verify reduceRight with initialValue equal to single character X string U=string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: string = arr.reduceRight<string>((prev: string, cur: number): string => prev + cur.toString(), 'X');
      expect(result).assertEqual('X321');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_4600
     * @tc.name testUint8ArrayReduceRight046
     * @tc.desc Verify reduceRight with initialValue equal to numeric string 0 U=string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: string = arr.reduceRight<string>((prev: string, cur: number): string => prev + cur.toString(), '0');
      expect(result).assertEqual('0321');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_4700
     * @tc.name testUint8ArrayReduceRight047
     * @tc.desc Verify reduceRight with initialValue equal to prefix string "init:" U=string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20);
      const result: string = arr.reduceRight<string>((prev: string, cur: number): string => prev + cur.toString(), 'init:');
      expect(result).assertEqual('init:2010');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_4800
     * @tc.name testUint8ArrayReduceRight048
     * @tc.desc Verify reduceRight with initialValue equal to 0x7F (hexadecimal 127)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 0x7F);
      expect(result).assertEqual(133);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_4900
     * @tc.name testUint8ArrayReduceRight049
     * @tc.desc Verify reduceRight with initialValue equal to 0b0 (binary 0)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 0b0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_5000
     * @tc.name testUint8ArrayReduceRight050
     * @tc.desc Verify reduceRight with initialValue equal to 0o0 (octal 0)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 0o0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_5100
     * @tc.name testUint8ArrayReduceRight051
     * @tc.desc Verify reduceRight with initialValue equal to 0.001 (very small positive number)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 0.001);
      const diff: number = result - 6.001;
      expect(diff < 1e-10 && diff > -1e-10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_5200
     * @tc.name testUint8ArrayReduceRight052
     * @tc.desc Verify reduceRight with initialValue equal to 1000000 (very large positive)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 1000000);
      expect(result).assertEqual(1000006);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_5300
     * @tc.name testUint8ArrayReduceRight053
     * @tc.desc Verify reduceRight on empty array with initialValue returns initialValue
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array();
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 42);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_5400
     * @tc.name testUint8ArrayReduceRight054
     * @tc.desc Verify reduceRight on single element array with initialValue
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 10);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_5500
     * @tc.name testUint8ArrayReduceRight055
     * @tc.desc Verify reduceRight on single element array with element 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(255);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 0);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_5600
     * @tc.name testUint8ArrayReduceRight056
     * @tc.desc Verify reduceRight on single element array with element 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(128);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 0);
      expect(result).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_5700
     * @tc.name testUint8ArrayReduceRight057
     * @tc.desc Verify reduceRight on single element array with element 127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(127);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 0);
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_5800
     * @tc.name testUint8ArrayReduceRight058
     * @tc.desc Verify reduceRight on three-element array with all zeros
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 0, 0);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_5900
     * @tc.name testUint8ArrayReduceRight059
     * @tc.desc Verify reduceRight on three-element array with boundary values 255 and 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(255, 0, 255);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 0);
      expect(result).assertEqual(510);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_6000
     * @tc.name testUint8ArrayReduceRight060
     * @tc.desc Verify reduceRight on three-element array with increasing values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 127, 255);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 0);
      expect(result).assertEqual(382);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_6100
     * @tc.name testUint8ArrayReduceRight061
     * @tc.desc Verify reduceRight on five-element increasing array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 0);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_6200
     * @tc.name testUint8ArrayReduceRight062
     * @tc.desc Verify reduceRight on length 100 array with all ones
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr[i] = 1;
      }
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 0);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_6300
     * @tc.name testUint8ArrayReduceRight063
     * @tc.desc Verify reduceRight on array with hexadecimal literal elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(3);
      arr[0] = 0x0A;
      arr[1] = 0x10;
      arr[2] = 0xFF;
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 0);
      expect(result).assertEqual(0x0A + 0x10 + 0xFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_6400
     * @tc.name testUint8ArrayReduceRight064
     * @tc.desc Verify reduceRight on array with all 42
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(42, 42, 42);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 0);
      expect(result).assertEqual(126);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_6500
     * @tc.name testUint8ArrayReduceRight065
     * @tc.desc Verify reduceRight on constructor-created array with index assignment
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(4);
      arr[0] = 1;
      arr[1] = 3;
      arr[2] = 5;
      arr[3] = 7;
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 0);
      expect(result).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_6600
     * @tc.name testUint8ArrayReduceRight066
     * @tc.desc Verify reduceRight on array with overflow value truncated to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(2);
      arr[0] = 0;
      arr[1] = 256;
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_6700
     * @tc.name testUint8ArrayReduceRight067
     * @tc.desc Verify reduceRight on array with negative value -1 wrapped to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(2);
      arr[0] = -1;
      arr[1] = 1;
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + cur, 0);
      expect(result).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_6800
     * @tc.name testUint8ArrayReduceRight068
     * @tc.desc Verify reduceRight with multiplication for array [2, 3, 4]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(2, 3, 4);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev * cur, 1);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_6900
     * @tc.name testUint8ArrayReduceRight069
     * @tc.desc Verify reduceRight with max selection for array [5, 10, 15]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(5, 10, 15);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev > cur ? prev : cur, 0);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_7000
     * @tc.name testUint8ArrayReduceRight070
     * @tc.desc Verify reduceRight with min selection for array [5, 10, 15]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(5, 10, 15);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev < cur ? prev : cur, 255);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_7100
     * @tc.name testUint8ArrayReduceRight071
     * @tc.desc Verify reduceRight with count-only callback for array [1, 2, 3]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev + 1, 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_7200
     * @tc.name testUint8ArrayReduceRight072
     * @tc.desc Verify reduceRight with XOR for array [1, 2, 3]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((prev: number, cur: number): number => prev ^ cur, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_7300
     * @tc.name testUint8ArrayReduceRight073
     * @tc.desc Verify reduceRight with string concatenation length for array [10, 20, 30]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const result: string = arr.reduceRight<string>((prev: string, cur: number): string => prev + cur.toString(), '');
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_7400
     * @tc.name testUint8ArrayReduceRight074
     * @tc.desc Verify reduceRight with boolean result for array [1, 2, 3]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: boolean = arr.reduceRight<boolean>((prev: boolean, cur: number): boolean => prev && cur > 0, true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_7500
     * @tc.name testUint8ArrayReduceRight075
     * @tc.desc Verify reduceRight with Result class generic type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: Result = arr.reduceRight<Result>((prev: Result, cur: number): Result => {
        return new Result(prev.sum + cur, prev.count + 1);
      }, new Result(0, 0));
      expect(result.sum).assertEqual(6);
      expect(result.count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_7600
     * @tc.name testUint8ArrayReduceRight076
     * @tc.desc Verify reduceRight with array reconstruction preserving original order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number[] = arr.reduceRight<number[]>((prev: number[], cur: number): number[] => {
        return [cur, ...prev];
      }, []);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_7700
     * @tc.name testUint8ArrayReduceRight077
     * @tc.desc Verify reduceRight throws ClassCastError when callbackfn is undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      try {
        arr.reduceRight(undefined as (p1: number, p2: number, p3: int, p4: Uint8Array) => number);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_7800
     * @tc.name testUint8ArrayReduceRight078
     * @tc.desc Verify reduceRight throws ClassCastError when callbackfn is null
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      try {
        arr.reduceRight(null as (p1: number, p2: number, p3: int, p4: Uint8Array) => number);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_7900
     * @tc.name testUint8ArrayReduceRight079
     * @tc.desc Verify reduceRight throws ClassCastError when callbackfn is not a function (string)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      try {
        const invalidCallback: string = 'not a function';
        const cb: ESObject = invalidCallback as Object as ESObject;
        arr.reduceRight(cb as (p1: number, p2: number, p3: int, p4: Uint8Array) => number);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_8000
     * @tc.name testUint8ArrayReduceRight080
     * @tc.desc Verify reduceRight throws ClassCastError when callbackfn is number
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      try {
        const invalidCallback: number = 123;
        const cb: Object = invalidCallback;
        arr.reduceRight(cb as (p1: number, p2: number, p3: int, p4: Uint8Array) => number);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_8100
     * @tc.name testUint8ArrayReduceRight081
     * @tc.desc Verify reduceRight throws ClassCastError when callbackfn is boolean
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      try {
        const invalidCallback: boolean = true;
        arr.reduceRight(invalidCallback as (p1: number, p2: number, p3: int, p4: Uint8Array) => number);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_8200
     * @tc.name testUint8ArrayReduceRight082
     * @tc.desc Verify reduceRight throws ClassCastError when callbackfn is object
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      try {
        const invalidCallback: ESObject = new Uint8Array(0) as ESObject;
        arr.reduceRight(invalidCallback as (p1: number, p2: number, p3: int, p4: Uint8Array) => number);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_8300
     * @tc.name testUint8ArrayReduceRight083
     * @tc.desc Verify reduceRight throws ClassCastError when callbackfn is array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      try {
        const invalidCallback: Array<number> = [];
        arr.reduceRight(invalidCallback as (p1: number, p2: number, p3: int, p4: Uint8Array) => number);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT01_8400
     * @tc.name testUint8ArrayReduceRight084
     * @tc.desc Verify reduceRight throws ClassCastError when callbackfn is a symbol string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      try {
        const invalidCallback: string = 'symbol';
        const cb: ESObject = invalidCallback as Object as ESObject;
        arr.reduceRight(cb as (p1: number, p2: number, p3: int, p4: Uint8Array) => number);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    });
  });
}