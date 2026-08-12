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

export default function int32ArrayReduceRightPart03Test(): void {
  describe('Int32ArrayReduceRightPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_0100
     * @tc.name int32ArrayReduceRightPart03Test001
     * @tc.desc Verify reduceRight sums values from right to left with an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 7, 9]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 10);
      expect(r).assertEqual(31);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_0200
     * @tc.name int32ArrayReduceRightPart03Test002
     * @tc.desc Verify slice reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([100, 1, 2, 3]);
      let r: number = arr.slice(1).reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_0300
     * @tc.name int32ArrayReduceRightPart03Test003
     * @tc.desc Verify reduceRight initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2]);
      let b: Int32Array = new Int32Array([3, 4]);
      let seed: number = b.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p * c, 1);
      let r: number = a.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, seed);
      expect(r).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_0400
     * @tc.name int32ArrayReduceRightPart03Test004
     * @tc.desc Verify initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([4, 5, 6]);
      let init: number = 100;
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, init);
      expect(r).assertEqual(115);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_0500
     * @tc.name int32ArrayReduceRightPart03Test005
     * @tc.desc Verify callbackfn currentIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 1, 1, 1]);
      let r: number = arr.reduceRight((p: number, c: number, i: int, _a: Int32Array): number => {
        if (i % 2 === 1) {
          return p + c * 2;
        }
        return p + c;
      }, 0);
      expect(r).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_0600
     * @tc.name int32ArrayReduceRightPart03Test006
     * @tc.desc Verify callbackfn idx length-2 idx=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let r: number = arr.reduceRight((p: number, c: number, i: int, _a: Int32Array): number => {
        if (i === 2) {
          return -500;
        }
        return p + c;
      }, 0);
      expect(r).assertEqual(-470);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_0700
     * @tc.name int32ArrayReduceRightPart03Test007
     * @tc.desc Verify callbackfn currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      let r: number = arr.reduceRight((_p: number, c: number, _i: int, _a: Int32Array): number => c + 7, 0);
      expect(r).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_0800
     * @tc.name int32ArrayReduceRightPart03Test008
     * @tc.desc Verify callbackfn previousValue currentIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: number = arr.reduceRight((p: number, _c: number, i: int, _a: Int32Array): number => p + i, 0);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_0900
     * @tc.name int32ArrayReduceRightPart03Test009
     * @tc.desc Verify callbackfn currentValue previousValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([8, 1, 22, 5, 13]);
      let r: number =
      arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => c > p ? c : p, -2147483648);
      expect(r).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_1000
     * @tc.name int32ArrayReduceRightPart03Test010
     * @tc.desc Verify callbackfn currentValue previousValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([8, 1, 22, -5, 13]);
      let r: number =
      arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => c < p ? c : p, 2147483647);
      expect(r).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_1100
     * @tc.name int32ArrayReduceRightPart03Test011
     * @tc.desc Verify callbackfn << [1,2,3] init=1 (((1<<3)<<2)<<1)=64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => (p << c), 1);
      expect(r).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_1200
     * @tc.name int32ArrayReduceRightPart03Test012
     * @tc.desc Verify callbackfn >>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => (p >> c), -64);
      expect(r).assertEqual(-8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_1300
     * @tc.name int32ArrayReduceRightPart03Test013
     * @tc.desc Verify callbackfn array.$_get(currentIndex) currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 6, 9, 12]);
      let ok: boolean = true;
      arr.reduceRight((_p: number, c: number, i: int, a: Int32Array): number => {
        let v = a.$_get(i);
        if (v !== c) {
          ok = false;
        }
        return 0;
      }, 0);
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_1400
     * @tc.name int32ArrayReduceRightPart03Test014
     * @tc.desc Verify callbackfn array.byteLength 4*length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let bl: int = -1;
      arr.reduceRight((_p: number, _c: number, _i: int, a: Int32Array): number => {
        bl = a.byteLength;
        return 0;
      }, 0);
      expect(bl).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_1500
     * @tc.name int32ArrayReduceRightPart03Test015
     * @tc.desc Verify callbackfn array.byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let bo: int = -1;
      arr.reduceRight((_p: number, _c: number, _i: int, a: Int32Array): number => {
        bo = a.byteOffset;
        return 0;
      }, 0);
      expect(bo).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_1600
     * @tc.name int32ArrayReduceRightPart03Test016
     * @tc.desc Verify callback receives the original array with length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let callbackLength: int = 0;
      let callbackValue: number = 0;
      arr.reduceRight((_p: number, _c: number, _i: int, a: Int32Array): number => {
        callbackLength = a.length;
        callbackValue = a.$_get(0);
        return 0;
      }, 0);
      expect(callbackLength).assertEqual(1);
      expect(callbackValue).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_1700
     * @tc.name int32ArrayReduceRightPart03Test017
     * @tc.desc Verify callbackfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 1, 1, 1, 1, 1, 1]);
      let cnt: int = 0;
      arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => {
        cnt++;
        return p + c;
      }, 0);
      expect(cnt).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_1800
     * @tc.name int32ArrayReduceRightPart03Test018
     * @tc.desc Verify callbackfn currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c * c, 0);
      expect(r).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_1900
     * @tc.name int32ArrayReduceRightPart03Test019
     * @tc.desc Verify callbackfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: string = arr.reduceRight((p: string, c: number, _i: int, _a: Int32Array): string => {
        return '(' + c.toString() + '+' + p + ')';
      }, '0');
      expect(r).assertEqual('(1+(2+(3+0)))');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_2000
     * @tc.name int32ArrayReduceRightPart03Test020
     * @tc.desc Verify U=boolean && 0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 3, 0, 8]);
      let r: boolean = arr.reduceRight((p: boolean, c: number, _i: int, _a: Int32Array): boolean => p && c > 0, true);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_2100
     * @tc.name int32ArrayReduceRightPart03Test021
     * @tc.desc Verify U=boolean || false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2, 4, 6, 8]);
      let r: boolean =
      arr.reduceRight((p: boolean, c: number, _i: int, _a: Int32Array): boolean => p || c % 2 !== 0, false);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_2200
     * @tc.name int32ArrayReduceRightPart03Test022
     * @tc.desc Verify callbackfn number[] push index index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let r: number[] = arr.reduceRight((p: number[], _c: number, i: int, _a: Int32Array): number[] => {
        p.push(i);
        return p;
      }, []);
      expect(r.length).assertEqual(4);
      expect(r.$_get(0)).assertEqual(3);
      expect(r.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_2300
     * @tc.name int32ArrayReduceRightPart03Test023
     * @tc.desc Verify callbackfn currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2, 4]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p * c, 0.5);
      expect(r).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_2400
     * @tc.name int32ArrayReduceRightPart03Test024
     * @tc.desc Verify callbackfn NaN prev NaN NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let hit: boolean = false;
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => {
        if (!hit) {
          hit = true;
          return Number.NaN;
        }
        return p + c;
      }, 0);
      expect(isNaN(r)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_2500
     * @tc.name int32ArrayReduceRightPart03Test025
     * @tc.desc Verify callbackfn Infinity Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let step: int = 0;
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => {
        step++;
        if (step === 1) {
          return Number.POSITIVE_INFINITY;
        }
        return p + c;
      }, 0);
      expect(r).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_2600
     * @tc.name int32ArrayReduceRightPart03Test026
     * @tc.desc Verify callback receives current values 10 and 5 in right-to-left order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 10]);
      let first: number = -1;
      let second: number = -1;
      let count: int = 0;
      arr.reduceRight((_p: number, c: number, _i: int, _a: Int32Array): number => {
        if (count === 0) {
          first = c;
        } else {
          second = c;
        }
        count++;
        return 0;
      }, 0);
      expect(first).assertEqual(10);
      expect(second).assertEqual(5);
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_2700
     * @tc.name int32ArrayReduceRightPart03Test027
     * @tc.desc Verify callback receives right-to-left index 0 for a one-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let index: int = -1;
      arr.reduceRight((_p: number, _c: number, i: int, _a: Int32Array): number => {
        index = i;
        return 0;
      }, 0);
      expect(index).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_2800
     * @tc.name int32ArrayReduceRightPart03Test028
     * @tc.desc Verify callbackfn prev curr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([100, 200, 300]);
      let log: string[] = [];
      arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => {
        log.push(p.toString() + '+' + c.toString());
        return p + c;
      }, 0);
      expect(log.length).assertEqual(3);
      expect(log[0]).assertEqual('0+300');
      expect(log[1]).assertEqual('300+200');
      expect(log[2]).assertEqual('500+100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_2900
     * @tc.name int32ArrayReduceRightPart03Test029
     * @tc.desc Verify callbackfn number %
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 10]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p % c, 100);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_3000
     * @tc.name int32ArrayReduceRightPart03Test030
     * @tc.desc Verify callbackfn currentIndex array prev curr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 8, 9]);
      let r: number = arr.reduceRight((p: number, c: number): number => p + c, 0);
      expect(r).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_3100
     * @tc.name int32ArrayReduceRightPart03Test031
     * @tc.desc Verify initialValue Number.MIN_VALUE 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      let r: number =
      arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, Number.MIN_VALUE);
      expect(r).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_3200
     * @tc.name int32ArrayReduceRightPart03Test032
     * @tc.desc Verify initialValue 2147483649.0 (MAX+2) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 2147483649.0);
      expect(r).assertEqual(2147483649.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_3300
     * @tc.name int32ArrayReduceRightPart03Test033
     * @tc.desc Verify initialValue -2147483649.0 (MIN-1) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, -2147483649.0);
      expect(r).assertEqual(-2147483649.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_3400
     * @tc.name int32ArrayReduceRightPart03Test034
     * @tc.desc Verify initialValue 0.0 [1,2] 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0.0);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_3500
     * @tc.name int32ArrayReduceRightPart03Test035
     * @tc.desc Verify initialValue false boolean || true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, -4, 5]);
      let r: boolean = arr.reduceRight((p: boolean, c: number, _i: int, _a: Int32Array): boolean => p || c < 0, false);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_3600
     * @tc.name int32ArrayReduceRightPart03Test036
     * @tc.desc Verify initialValue true boolean && 0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 0, 5]);
      let r: boolean = arr.reduceRight((p: boolean, c: number, _i: int, _a: Int32Array): boolean => p && c > 0, true);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_3700
     * @tc.name int32ArrayReduceRightPart03Test037
     * @tc.desc Verify initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-10, 20]);
      let r: string = arr.reduceRight((p: string, c: number, _i: int, _a: Int32Array): string => p + c.toString(), '');
      expect(r).assertEqual('20-10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_3800
     * @tc.name int32ArrayReduceRightPart03Test038
     * @tc.desc Verify initialValue '|'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: string =
      arr.reduceRight((p: string, c: number, _i: int, _a: Int32Array): string => p + '|' + c.toString(), '');
      expect(r).assertEqual('|3|2|1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_3900
     * @tc.name int32ArrayReduceRightPart03Test039
     * @tc.desc Verify initialValue number[] push index length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20]);
      let r: number[] = arr.reduceRight((p: number[], c: number, _i: int, _a: Int32Array): number[] => {
        p.push(c);
        return p;
      }, []);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(20);
      expect(r.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_4000
     * @tc.name int32ArrayReduceRightPart03Test040
     * @tc.desc Verify initialValue number[] [7] 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let seed: number[] = [7];
      let r: number[] = arr.reduceRight((p: number[], c: number, _i: int, _a: Int32Array): number[] => {
        p.push(c);
        return p;
      }, seed);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_4100
     * @tc.name int32ArrayReduceRightPart03Test041
     * @tc.desc Verify initialValue string[] toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      let r: string[] = arr.reduceRight((p: string[], c: number, _i: int, _a: Int32Array): string[] => {
        p.push(c.toString());
        return p;
      }, []);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual('33');
      expect(r.$_get(2)).assertEqual('11');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_4200
     * @tc.name int32ArrayReduceRightPart03Test042
     * @tc.desc Verify initialValue number 3 [5] 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 3);
      expect(r).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_4300
     * @tc.name int32ArrayReduceRightPart03Test043
     * @tc.desc Verify initialValue 0 [0] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_4400
     * @tc.name int32ArrayReduceRightPart03Test044
     * @tc.desc Verify initialValue -0 +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, -0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_4500
     * @tc.name int32ArrayReduceRightPart03Test045
     * @tc.desc Verify 1 8 initialValue=0 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 1, 1, 1, 1, 1, 1, 1]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_4600
     * @tc.name int32ArrayReduceRightPart03Test046
     * @tc.desc Verify -1 4 initialValue=10 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -1, -1, -1]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 10);
      expect(r).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_4700
     * @tc.name int32ArrayReduceRightPart03Test047
     * @tc.desc Verify [1,3,5,3,1] 13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 3, 5, 3, 1]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_4800
     * @tc.name int32ArrayReduceRightPart03Test048
     * @tc.desc Verify [5,4,3,2,1] initialValue=0 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 4, 3, 2, 1]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_4900
     * @tc.name int32ArrayReduceRightPart03Test049
     * @tc.desc Verify MAX 0 MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, 0, 0, 0]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_5000
     * @tc.name int32ArrayReduceRightPart03Test050
     * @tc.desc Verify MIN initialValue=0 curr=MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, -2147483648]);
      let firstC: number = 0;
      let hit: boolean = false;
      arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => {
        if (!hit) {
          firstC = c;
          hit = true;
        }
        return p + c;
      }, 0);
      expect(firstC).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_5100
     * @tc.name int32ArrayReduceRightPart03Test051
     * @tc.desc Verify Int32Array.of reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let r: string =
      arr.reduceRight((p: string, c: number, _i: int, _a: Int32Array): string => p + c.toString(), 'v=');
      expect(r).assertEqual('v=42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_5200
     * @tc.name int32ArrayReduceRightPart03Test052
     * @tc.desc Verify ArrayBuffer byteOffset=4 length=2 reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let view: Int32Array = new Int32Array(buf, 4, 2);
      view.$_set(0, 11);
      view.$_set(1, 22);
      let r: number = view.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_5300
     * @tc.name int32ArrayReduceRightPart03Test053
     * @tc.desc Verify subarray(begin>=end) reduceRight initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let empty: Int32Array = arr.subarray(5, 3);
      let r: number = empty.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 777);
      expect(r).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_5400
     * @tc.name int32ArrayReduceRightPart03Test054
     * @tc.desc Verify fill 7 5 35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      arr.fill(7);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(35);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_5500
     * @tc.name int32ArrayReduceRightPart03Test055
     * @tc.desc Verify $_set 3 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: int = 8;
      let arr: Int32Array = new Int32Array(n);
      let exp: number = 0;
      for (let i: int = 0; i < n; i++) {
        let v: number = i * 3;
        arr.$_set(i, v);
        exp += v;
      }
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(exp);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_5600
     * @tc.name int32ArrayReduceRightPart03Test056
     * @tc.desc Verify ToInt32 2147483648 -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2147483648]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_5700
     * @tc.name int32ArrayReduceRightPart03Test057
     * @tc.desc Verify -0.9 ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-0.9, 5]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_5800
     * @tc.name int32ArrayReduceRightPart03Test058
     * @tc.desc Verify -Infinity ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-Number.POSITIVE_INFINITY, 10]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_5900
     * @tc.name int32ArrayReduceRightPart03Test059
     * @tc.desc Verify number accumulator with initial value 0 returns 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 4]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_6000
     * @tc.name int32ArrayReduceRightPart03Test060
     * @tc.desc Verify string accumulator with initial value '' returns '5'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5]);
      let r: string = arr.reduceRight((p: string, c: number, _i: int, _a: Int32Array): string => p + c.toString(), '');
      expect(r).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_6100
     * @tc.name int32ArrayReduceRightPart03Test061
     * @tc.desc Verify boolean accumulator with initial value true returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let r: boolean = arr.reduceRight((p: boolean, c: number, _i: int, _a: Int32Array): boolean => p && c > 0, true);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_6200
     * @tc.name int32ArrayReduceRightPart03Test062
     * @tc.desc Verify U=number[] initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let seed: number[] = [];
      let r: number[] = arr.reduceRight((p: number[], c: number, _i: int, _a: Int32Array): number[] => {
        p.push(c);
        return p;
      }, seed);
      expect(r).assertEqual(seed);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_6300
     * @tc.name int32ArrayReduceRightPart03Test063
     * @tc.desc Verify reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-3, 0, 7]);
      arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 50);
      expect(arr.$_get(0)).assertEqual(-3);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_6400
     * @tc.name int32ArrayReduceRightPart03Test064
     * @tc.desc Verify reduceRight length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_6500
     * @tc.name int32ArrayReduceRightPart03Test065
     * @tc.desc Verify initialValue=0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_6600
     * @tc.name int32ArrayReduceRightPart03Test066
     * @tc.desc Verify initialValue='abc' 'abc'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: string =
      arr.reduceRight((p: string, c: number, _i: int, _a: Int32Array): string => p + c.toString(), 'abc');
      expect(r).assertEqual('abc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_6700
     * @tc.name int32ArrayReduceRightPart03Test067
     * @tc.desc Verify [MAX_VAL] initialValue=1 number MAX+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 1);
      expect(r).assertEqual(2147483648.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_6800
     * @tc.name int32ArrayReduceRightPart03Test068
     * @tc.desc Verify reduceRight byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_6900
     * @tc.name int32ArrayReduceRightPart03Test069
     * @tc.desc Verify callbackfn Error 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let cnt: int = 0;
      try {
        arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => {
          cnt++;
          throw new Error('first-boom');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(cnt).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_7000
     * @tc.name int32ArrayReduceRightPart03Test070
     * @tc.desc Verify callbackfn index=0 Error length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let cnt: int = 0;
      try {
        arr.reduceRight((p: number, c: number, i: int, _a: Int32Array): number => {
          cnt++;
          if (i === 0) {
            throw new Error('last-boom');
          }
          return p + c;
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(cnt).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_7100
     * @tc.name int32ArrayReduceRightPart03Test071
     * @tc.desc Verify callbackfn Error message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let msg: string = '';
      try {
        arr.reduceRight((_p: number, _c: number, _i: int, _a: Int32Array): number => {
          throw new Error('marker-msg');
        }, 0);
        expect().assertFail();
      } catch (e) {
        msg = e.message;
        expect(e.name).assertEqual('Error');
      }
      expect(msg).assertEqual('marker-msg');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_7200
     * @tc.name int32ArrayReduceRightPart03Test072
     * @tc.desc Verify callback callback initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let called: boolean = false;
      let r: number = arr.reduceRight((_p: number, _c: number, _i: int, _a: Int32Array): number => {
        called = true;
        throw new Error('never');
      }, 999);
      expect(called).assertFalse();
      expect(r).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_7300
     * @tc.name int32ArrayReduceRightPart03Test073
     * @tc.desc Verify callbackfn RangeError e.name 'RangeError'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      try {
        arr.reduceRight((_p: number, _c: number, _i: int, _a: Int32Array): number => {
          throw new RangeError('r-err');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_7400
     * @tc.name int32ArrayReduceRightPart03Test074
     * @tc.desc Verify callbackfn TypeError e.name 'TypeError'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      try {
        arr.reduceRight((_p: number, _c: number, _i: int, _a: Int32Array): number => {
          throw new TypeError('t-err');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_7500
     * @tc.name int32ArrayReduceRightPart03Test075
     * @tc.desc Verify callbackfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let gotResult: boolean = false;
      try {
        arr.reduceRight((p: number, c: number, i: int, _a: Int32Array): number => {
          if (i === 1) {
            throw new Error('mid');
          }
          return p + c;
        }, 0);
        gotResult = true;
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(gotResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_7600
     * @tc.name int32ArrayReduceRightPart03Test076
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let viewA: Int32Array = new Int32Array(buf, 0, 4);
      viewA.$_set(0, 1);
      viewA.$_set(1, 2);
      viewA.$_set(2, 3);
      viewA.$_set(3, 4);
      let viewB: Int32Array = new Int32Array(buf, 0, 4);
      let seen: number[] = [];
      viewA.reduceRight((p: number, c: number, i: int, _a: Int32Array): number => {
        seen.push(c);
        if (i === 3) {
          viewB.$_set(2, 99);
        }
        return p + c;
      }, 0);
      expect(seen.$_get(0)).assertEqual(4);
      expect(seen.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_7700
     * @tc.name int32ArrayReduceRightPart03Test077
     * @tc.desc Verify array.$_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let last: number = 0;
      arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => {
        if (i === 0) {
          last = c;
        }
        if (i === 3) {
          a.$_set(0, 777);
        }
        return p + c;
      }, 0);
      expect(last).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_7800
     * @tc.name int32ArrayReduceRightPart03Test078
     * @tc.desc Verify subarray reduceRight array subarray ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(1, 4);
      let same: boolean = false;
      sub.reduceRight((_p: number, _c: number, _i: int, a: Int32Array): number => {
        same = (a === sub);
        return 0;
      }, 0);
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_7900
     * @tc.name int32ArrayReduceRightPart03Test079
     * @tc.desc Verify byteOffset=8 reduceRight array.byteOffset 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let view: Int32Array = new Int32Array(buf, 8, 3);
      view.$_set(0, 100);
      view.$_set(1, 200);
      view.$_set(2, 300);
      let captured: int = -1;
      view.reduceRight((_p: number, _c: number, _i: int, a: Int32Array): number => {
        captured = a.byteOffset;
        return 0;
      }, 0);
      expect(captured).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART03_TEST_MINDMAP_8000
     * @tc.name int32ArrayReduceRightPart03Test080
     * @tc.desc Verify reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart03Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      arr.$_set(0, 999);
      expect(r).assertEqual(6);
    });



  });
}
