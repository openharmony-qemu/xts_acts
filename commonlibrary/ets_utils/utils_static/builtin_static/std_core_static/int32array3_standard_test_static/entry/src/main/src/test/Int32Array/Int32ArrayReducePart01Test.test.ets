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
import Utils from './../Util.test';

interface IndexMapR1 {
  keys: string;
}

class IM001R1 implements IndexMapR1 {
  keys: string = '';
}

export default function Int32ArrayReducePart01Test(): void {
  describe('Int32ArrayReducePart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_0100
     * @tc.name int32ArrayReducePart01Test001
     * @tc.desc Verify callbackfn and initialValue two parameters execute normally (arity=2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let sum: number = arr.reduce((prev: number, curr: number, idx: int, a: Int32Array): number => prev + curr, 0);
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_0200
     * @tc.name int32ArrayReducePart01Test002
     * @tc.desc Verify initialValue as seed participates in first iteration with arity=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let result: number = arr.reduce((p: number, c: number): number => p + c, 5);
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_0300
     * @tc.name int32ArrayReducePart01Test003
     * @tc.desc Verify arrow function as callbackfn invokes normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 4);
      let sum: number = arr.reduce((p: number, c: number): number => p + c, 0);
      expect(sum).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_0400
     * @tc.name int32ArrayReducePart01Test004
     * @tc.desc Verify first call previousValue equals initialValue (index=0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9);
      let firstPrev: number = 999;
      arr.reduce((p: number, c: number, idx: int): number => {
        if (idx === 0) {
          firstPrev = p;
        }
        return p + c;
      }, 100);
      expect(firstPrev).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_0500
     * @tc.name int32ArrayReducePart01Test005
     * @tc.desc Verify first call currentValue is element at index 0 (with initialValue starts from index=0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42, 43, 44);
      let firstCurr: number = -1;
      arr.reduce((p: number, c: number, idx: int): number => {
        if (idx === 0) {
          firstCurr = c;
        }
        return p + c;
      }, 0);
      expect(firstCurr).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_0600
     * @tc.name int32ArrayReducePart01Test006
     * @tc.desc Verify currentIndex increments sequentially 0,1,2 (with initialValue index sequence)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let idxs: int[] = [];
      arr.reduce((p: number, c: number, idx: int): number => {
        idxs.push(idx);
        return p + c;
      }, 0);
      expect(idxs.length).assertEqual(3);
      expect(idxs[0]).assertEqual(0);
      expect(idxs[1]).assertEqual(1);
      expect(idxs[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_0700
     * @tc.name int32ArrayReducePart01Test007
     * @tc.desc Verify callback array parameter points to original Int32Array (reference equality)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let captured: Int32Array | null = null;
      arr.reduce((p: number, c: number, idx: int, a: Int32Array): number => {
        if (captured === null) {
          captured = a;
        }
        return p + c;
      }, 0);
      expect((captured as Int32Array).length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_0800
     * @tc.name int32ArrayReducePart01Test008
     * @tc.desc Verify callback array.length equals original array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let seenLen: int = -1;
      arr.reduce((p: number, c: number, idx: int, a: Int32Array): number => {
        seenLen = a.length;
        return p + c;
      }, 0);
      expect(seenLen).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_0900
     * @tc.name int32ArrayReducePart01Test009
     * @tc.desc Verify callback return value passed as next previousValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 1, 1);
      let trace: number[] = [];
      arr.reduce((p: number, c: number): number => {
        trace.push(p);
        return p + 10;
      }, 5);
      expect(trace[0]).assertEqual(5);
      expect(trace[1]).assertEqual(15);
      expect(trace[2]).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_1000
     * @tc.name int32ArrayReducePart01Test010
     * @tc.desc Verify callbackfn first call throws error and reduce immediately propagates exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      try {
        arr.reduce((p: number, c: number): number => {
          expect(c).assertEqual(1);
          throw new Error('callback boom');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_1100
     * @tc.name int32ArrayReducePart01Test011
     * @tc.desc Verify callback second call throws exception after 2 iterations and stops
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let callCount: int = 0;
      try {
        arr.reduce((p: number, c: number): number => {
          callCount = callCount + 1;
          if (callCount === 2) {
            expect(c).assertEqual(2);
            throw new Error('stop');
          }
          return p + c;
        }, 0);
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_1200
     * @tc.name int32ArrayReducePart01Test012
     * @tc.desc Verify initialValue 0 multi-element sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: number = arr.reduce((p: number, c: number): number => p + c, 0);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_1300
     * @tc.name int32ArrayReducePart01Test013
     * @tc.desc Verify initialValue 1 multi-element product
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: number = arr.reduce((p: number, c: number): number => p * c, 1);
      expect(r).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_1400
     * @tc.name int32ArrayReducePart01Test014
     * @tc.desc Verify initialValue -1 (negative seed) sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let r: number = arr.reduce((p: number, c: number): number => p + c, -1);
      expect(r).assertEqual(59);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_1500
     * @tc.name int32ArrayReducePart01Test015
     * @tc.desc Verify reduce preserves number arithmetic above INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r: number = arr.reduce((p: number, c: number): number => p + c, 2147483647);
      expect(r).assertEqual(2147483650);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_1600
     * @tc.name int32ArrayReducePart01Test016
     * @tc.desc Verify initialValue INT_MIN accumulate positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 100);
      let r: number = arr.reduce((p: number, c: number): number => p + c, -2147483648);
      expect(r).assertEqual(-2147483548);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_1700
     * @tc.name int32ArrayReducePart01Test017
     * @tc.desc Verify initialValue NaN propagates NaN result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: number = arr.reduce((p: number, c: number): number => p + c, Number.NaN);
      expect(isNaN(r)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_1800
     * @tc.name int32ArrayReducePart01Test018
     * @tc.desc Verify initialValue Infinity accumulate keeps Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: number = arr.reduce((p: number, c: number): number => p + c, Number.POSITIVE_INFINITY);
      expect(isFinite(r)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_1900
     * @tc.name int32ArrayReducePart01Test019
     * @tc.desc Verify initialValue -Infinity accumulate negative keeps negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, -2);
      let r: number = arr.reduce((p: number, c: number): number => p + c, Number.NEGATIVE_INFINITY);
      expect(r < 0).assertTrue();
      expect(isNaN(r)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_2000
     * @tc.name int32ArrayReducePart01Test020
     * @tc.desc Verify initialValue positive float 0.5 accumulates as float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r: number = arr.reduce((p: number, c: number): number => p + c, 0.5);
      expect(r).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_2100
     * @tc.name int32ArrayReducePart01Test021
     * @tc.desc Verify initialValue negative float -0.5 accumulates as float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r: number = arr.reduce((p: number, c: number): number => p + c, -0.5);
      expect(r).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_2200
     * @tc.name int32ArrayReducePart01Test022
     * @tc.desc Verify initialValue 1.0 explicit float product
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2, 3);
      let r: number = arr.reduce((p: number, c: number): number => p * c, 1.0);
      expect(r).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_2300
     * @tc.name int32ArrayReducePart01Test023
     * @tc.desc Verify U=string string concatenation accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: string = arr.reduce((p: string, c: number): string => p + c.toString(), '');
      expect(r).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_2400
     * @tc.name int32ArrayReducePart01Test024
     * @tc.desc Verify U=string non-empty initialValue acts as prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20);
      let r: string = arr.reduce((p: string, c: number): string => p + '-' + c.toString(), 'start');
      expect(r).assertEqual('start-10-20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_2500
     * @tc.name int32ArrayReducePart01Test025
     * @tc.desc Verify U=string empty array returns initialValue directly without triggering callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let called: boolean = false;
      let r: string = arr.reduce((p: string, c: number): string => {
        called = true;
        return p + c.toString();
      }, 'emptySeed');
      expect(r).assertEqual('emptySeed');
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_2600
     * @tc.name int32ArrayReducePart01Test026
     * @tc.desc Verify U=string single element callback once, prev=initialValue, idx=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7);
      let callCount: int = 0;
      let r: string = arr.reduce((p: string, c: number, idx: int): string => {
        callCount = callCount + 1;
        expect(p).assertEqual('seed');
        expect(idx).assertEqual(0);
        return p + c.toString();
      }, 'seed');
      expect(r).assertEqual('seed7');
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_2700
     * @tc.name int32ArrayReducePart01Test027
     * @tc.desc Verify U=string callback currentValue correctly receives negative element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-5);
      let captured: number = 0;
      arr.reduce((p: string, c: number): string => {
        captured = c;
        return p;
      }, 'x');
      expect(captured).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_2800
     * @tc.name int32ArrayReducePart01Test028
     * @tc.desc Verify U=string multi-element left-fold order verification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: string = arr.reduce((p: string, c: number): string => '(' + p + '+' + c.toString() + ')', '0');
      expect(r).assertEqual('((((0+1)+2)+3)+4)');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_2900
     * @tc.name int32ArrayReducePart01Test029
     * @tc.desc Verify U=boolean every-style accumulation with all even returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2, 4, 6);
      let r: boolean = arr.reduce((p: boolean, c: number): boolean => p && (c % 2 === 0), true);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_3000
     * @tc.name int32ArrayReducePart01Test030
     * @tc.desc Verify U=boolean every-style accumulation with odd returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2, 3, 6);
      let r: boolean = arr.reduce((p: boolean, c: number): boolean => p && (c % 2 === 0), true);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_3100
     * @tc.name int32ArrayReducePart01Test031
     * @tc.desc Verify U=boolean some-style accumulation all odd returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 3, 5);
      let r: boolean = arr.reduce((p: boolean, c: number): boolean => p || (c % 2 === 0), false);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_3200
     * @tc.name int32ArrayReducePart01Test032
     * @tc.desc Verify U=boolean some-style accumulation with even returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 4, 5);
      let r: boolean = arr.reduce((p: boolean, c: number): boolean => p || (c % 2 === 0), false);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_3300
     * @tc.name int32ArrayReducePart01Test033
     * @tc.desc Verify empty array with initialValue returns initialValue directly, no callback (U=number)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let called: boolean = false;
      let r: number = arr.reduce((p: number, c: number): number => {
        called = true;
        return p + c;
      }, 42);
      expect(r).assertEqual(42);
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_3400
     * @tc.name int32ArrayReducePart01Test034
     * @tc.desc Verify single element array with initialValue calls once, prev/curr/idx correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(99);
      let callCount: int = 0;
      let r: number = arr.reduce((p: number, c: number, idx: int): number => {
        callCount = callCount + 1;
        expect(p).assertEqual(10);
        expect(c).assertEqual(99);
        expect(idx).assertEqual(0);
        return p + c;
      }, 10);
      expect(r).assertEqual(109);
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_3500
     * @tc.name int32ArrayReducePart01Test035
     * @tc.desc Verify two-element array calls callback twice with idx sequence 0,1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20);
      let idxs: int[] = [];
      arr.reduce((p: number, c: number, idx: int): number => {
        idxs.push(idx);
        return p + c;
      }, 0);
      expect(idxs.length).assertEqual(2);
      expect(idxs[0]).assertEqual(0);
      expect(idxs[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_3600
     * @tc.name int32ArrayReducePart01Test036
     * @tc.desc Verify array with INT_MAX element sum does not overflow (initialValue=0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, 0);
      let r: number = arr.reduce((p: number, c: number): number => p + c, 0);
      expect(r).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_3700
     * @tc.name int32ArrayReducePart01Test037
     * @tc.desc Verify array with INT_MIN element sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648, 0);
      let r: number = arr.reduce((p: number, c: number): number => p + c, 0);
      expect(r).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_3800
     * @tc.name int32ArrayReducePart01Test038
     * @tc.desc Verify all-zero elements accumulate initialValue unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0);
      let r: number = arr.reduce((p: number, c: number): number => p + c, 5);
      expect(r).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_3900
     * @tc.name int32ArrayReducePart01Test039
     * @tc.desc Verify all negative array sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, -2, -3);
      let r: number = arr.reduce((p: number, c: number): number => p + c, 0);
      expect(r).assertEqual(-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_4000
     * @tc.name int32ArrayReducePart01Test040
     * @tc.desc Verify mixed positive-negative sum equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, -1, 2, -2);
      let r: number = arr.reduce((p: number, c: number): number => p + c, 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_4100
     * @tc.name int32ArrayReducePart01Test041
     * @tc.desc Verify all elements same sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 7, 7, 7);
      let r: number = arr.reduce((p: number, c: number): number => p + c, 0);
      expect(r).assertEqual(28);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_4200
     * @tc.name int32ArrayReducePart01Test042
     * @tc.desc Verify 16-element large array sum covering batch iteration path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
      let arr: Int32Array = Int32Array.from(data);
      let r: number = arr.reduce((p: number, c: number): number => p + c, 0);
      expect(r).assertEqual(136);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_4300
     * @tc.name int32ArrayReducePart01Test043
     * @tc.desc Verify return value type is number (U=number)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: number = arr.reduce((p: number, c: number): number => p + c, 0);
      expect(r).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_4400
     * @tc.name int32ArrayReducePart01Test044
     * @tc.desc Verify return value type is string (U=string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r: string = arr.reduce((p: string, c: number): string => p + c.toString(), '');
      expect(r).assertEqual('12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_4500
     * @tc.name int32ArrayReducePart01Test045
     * @tc.desc Verify return value type is boolean (U=boolean)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2, 4);
      let r: boolean = arr.reduce((p: boolean, c: number): boolean => p && c % 2 === 0, true);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_4600
     * @tc.name int32ArrayReducePart01Test046
     * @tc.desc Verify positive integer sum result value correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let r: number = arr.reduce((p: number, c: number): number => p + c, 0);
      expect(r).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_4700
     * @tc.name int32ArrayReducePart01Test047
     * @tc.desc Verify integer product result value correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2, 3, 4);
      let r: number = arr.reduce((p: number, c: number): number => p * c, 1);
      expect(r).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_4800
     * @tc.name int32ArrayReducePart01Test048
     * @tc.desc Verify max aggregation result correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 7, 2, 9, 4);
      let r: number = arr.reduce((p: number, c: number): number => p > c ? p : c, -2147483648);
      expect(r).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_4900
     * @tc.name int32ArrayReducePart01Test049
     * @tc.desc Verify min aggregation result correct (with negatives)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, -7, 2, 9, 4);
      let r: number = arr.reduce((p: number, c: number): number => p < c ? p : c, 2147483647);
      expect(r).assertEqual(-7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_5000
     * @tc.name int32ArrayReducePart01Test050
     * @tc.desc Verify empty array returns initialValue string reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: string = arr.reduce((p: string, c: number): string => p, 'hello');
      expect(r).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_5100
     * @tc.name int32ArrayReducePart01Test051
     * @tc.desc Verify reduce does not modify original array element values; Also verify verify reduce does not modify original array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.reduce((p: number, c: number): number => p + c, 0);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);

      {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.reduce((p: number, c: number): number => p + c, 0);
      expect(arr.length).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_5200
     * @tc.name int32ArrayReducePart01Test052
     * @tc.desc Verify ArrayBuffer-based view reduce does not corrupt underlying buffer bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf);
      a.$_set(0, 11);
      a.$_set(1, 22);
      a.$_set(2, 33);
      a.reduce((p: number, c: number): number => p + c, 0);
      let b: Int32Array = new Int32Array(buf);
      expect(b.$_get(0)).assertEqual(11);
      expect(b.$_get(1)).assertEqual(22);
      expect(b.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_5300
     * @tc.name int32ArrayReducePart01Test053
     * @tc.desc Verify empty array with initialValue does not throw (positive control)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: number = arr.reduce((p: number, c: number): number => p + c, 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_5400
     * @tc.name int32ArrayReducePart01Test054
     * @tc.desc Verify callbackfn throws Error with message transparently propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let msg: string = '';
      try {
        arr.reduce((p: number, c: number): number => {
          expect(c).assertEqual(1);
          throw new Error('reduceFail');
        }, 0);
        expect().assertFail();
      } catch (e) {
        msg = e.message;
        expect(e.name).assertEqual('Error');
      }
      expect(msg).assertEqual('reduceFail');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_5500
     * @tc.name int32ArrayReducePart01Test055
     * @tc.desc Verify first element throw has currentIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let capturedIdx: int = -1;
      try {
        arr.reduce((p: number, c: number, idx: int): number => {
          capturedIdx = idx;
          throw new Error('first');
        }, 0);
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(capturedIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_5600
     * @tc.name int32ArrayReducePart01Test056
     * @tc.desc Verify empty array initialValue null returns null directly without triggering callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let called: boolean = false;
      let r: string | null = arr.reduce((p: string | null, c: number): string | null => {
        called = true;
        return p;
      }, null);
      expect(r).assertNull();
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_5700
     * @tc.name int32ArrayReducePart01Test057
     * @tc.desc Verify left-fold parenthesized order (((0+1)+2)+3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let steps: string[] = [];
      arr.reduce((p: string, c: number, idx: int): string => {
        let next: string = '(' + p + '+' + c.toString() + ')';
        steps.push(next);
        return next;
      }, '0');
      expect(steps[0]).assertEqual('(0+1)');
      expect(steps[1]).assertEqual('((0+1)+2)');
      expect(steps[2]).assertEqual('(((0+1)+2)+3)');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_5800
     * @tc.name int32ArrayReducePart01Test058
     * @tc.desc Verify comma-separated join using reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let r: string = arr.reduce((p: string, c: number, idx: int): string => {
        if (idx === 0) {
          return c.toString();
        }
        return p + ',' + c.toString();
      }, '');
      expect(r).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_5900
     * @tc.name int32ArrayReducePart01Test059
     * @tc.desc Verify count elements using reduce (length equivalent aggregation)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9, 10);
      let count: number = arr.reduce((p: number, c: number): number => p + 1, 0);
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_6000
     * @tc.name int32ArrayReducePart01Test060
     * @tc.desc Verify count even numbers using reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6);
      let even: number = arr.reduce((p: number, c: number): number => p + (c % 2 === 0 ? 1 : 0), 0);
      expect(even).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_6100
     * @tc.name int32ArrayReducePart01Test061
     * @tc.desc Verify build index-to-value mapping string using object accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let seed: IM001R1 = new IM001R1();
      let r: IM001R1 = arr.reduce((p: IM001R1, c: number, idx: int): IM001R1 => {
        p.keys = p.keys + idx.toString() + ':' + c.toString() + ';';
        return p;
      }, seed);
      expect(r.keys).assertEqual('0:10;1:20;2:30;');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_6200
     * @tc.name int32ArrayReducePart01Test062
     * @tc.desc Verify callback accesses next element through array parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: number = arr.reduce((p: number, c: number, idx: int, a: Int32Array): number => {
        let next: number = 0;
        if (idx + 1 < a.length) {
          next = a.$_get(idx + 1);
        }
        return p + c + next;
      }, 0);
      expect(r).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_6300
     * @tc.name int32ArrayReducePart01Test063
     * @tc.desc Verify INT_MAX initialValue plus 1 remains an untruncated number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let r: number = arr.reduce((p: number, c: number): number => p + c, 2147483647);
      expect(r).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_6400
     * @tc.name int32ArrayReducePart01Test064
     * @tc.desc Verify INT_MIN initialValue minus 1 remains an untruncated number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1);
      let r: number = arr.reduce((p: number, c: number): number => p + c, -2147483648);
      expect(r).assertEqual(-2147483649);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_6500
     * @tc.name int32ArrayReducePart01Test065
     * @tc.desc Verify float initialValue with int elements keeps float result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: number = arr.reduce((p: number, c: number): number => p + c, 0.1);
      expect(r).assertClose(6.1, 1e-9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_6600
     * @tc.name int32ArrayReducePart01Test066
     * @tc.desc Verify callback return value doubles plus 1 forms integer sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0);
      let r: number = arr.reduce((p: number, c: number): number => p * 2 + 1, 1);
      expect(r).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_6700
     * @tc.name int32ArrayReducePart01Test067
     * @tc.desc Verify callback ignores currentValue only counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let r: number = arr.reduce((p: number, _c: number): number => p + 1, 0);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_6800
     * @tc.name int32ArrayReducePart01Test068
     * @tc.desc Verify ArrayBuffer subarray view reduce only iterates sub-view elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let full: Int32Array = new Int32Array(buf);
      full.$_set(0, 100);
      full.$_set(1, 200);
      full.$_set(2, 300);
      full.$_set(3, 400);
      full.$_set(4, 500);
      let sub: Int32Array = new Int32Array(buf, 4, 3);
      let r: number = sub.reduce((p: number, c: number): number => p + c, 0);
      expect(r).assertEqual(900);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_6900
     * @tc.name int32ArrayReducePart01Test069
     * @tc.desc Verify callback $_set modifies subsequent element, later iteration reads modified value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: number = arr.reduce((p: number, c: number, idx: int, a: Int32Array): number => {
        if (idx + 1 < a.length) {
          a.$_set(idx + 1, a.$_get(idx + 1) + 1);
        }
        return p + c;
      }, 0);
      expect(r).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_7000
     * @tc.name int32ArrayReducePart01Test070
     * @tc.desc Verify initialValue 0 all negative elements sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-10, -20, -30);
      let r: number = arr.reduce((p: number, c: number): number => p + c, 0);
      expect(r).assertEqual(-60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_7100
     * @tc.name int32ArrayReducePart01Test071
     * @tc.desc Verify initialValue -0 accumulates integer result normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: number = arr.reduce((p: number, c: number): number => p + c, -0.0);
      expect(r).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_7200
     * @tc.name int32ArrayReducePart01Test072
     * @tc.desc Verify last callback call idx equals length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let lastIdx: int = -1;
      arr.reduce((p: number, c: number, idx: int): number => {
        lastIdx = idx;
        return p + c;
      }, 0);
      expect(lastIdx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART01_7300
     * @tc.name int32ArrayReducePart01Test073
     * @tc.desc Verify sum of all currentValue equals total minus initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart01Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 7, 9);
      let sumOfCurr: number = 0;
      let init: number = 100;
      let r: number = arr.reduce((p: number, c: number): number => {
        sumOfCurr = sumOfCurr + c;
        return p + c;
      }, init);
      expect(r - init).assertEqual(sumOfCurr);
    });
  });
}
