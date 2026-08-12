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

export default function int32ArrayReduceRightPart04Test(): void {
  describe('Int32ArrayReduceRightPart04Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_0100
     * @tc.name int32ArrayReduceRightPart04Test001
     * @tc.desc Verify callbackfn 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([4, 5, 6]);
      let r: number = arr.reduceRight(() => 99, 0);
      expect(r).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_0200
     * @tc.name int32ArrayReduceRightPart04Test002
     * @tc.desc Verify callbackfn previousValue +1 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 40, 80]);
      let r: number = arr.reduceRight((p: number): number => p + 1, 0);
      expect(r).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_0300
     * @tc.name int32ArrayReduceRightPart04Test003
     * @tc.desc Verify callbackfn (previousValue, currentValue)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([8, 9]);
      let r: number = arr.reduceRight((p: number, c: number): number => p + c, 13);
      expect(r).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_0400
     * @tc.name int32ArrayReduceRightPart04Test004
     * @tc.desc Verify callbackfn (prev,cur,idx) array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2, 3, 5]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int): number => p + c, 0);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_0500
     * @tc.name int32ArrayReduceRightPart04Test005
     * @tc.desc Verify callbackfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn = (p: number, c: number, _i: int, _a: Int32Array): number => p + c;
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      let r: number = arr.reduceRight(fn, 0);
      expect(r).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_0600
     * @tc.name int32ArrayReduceRightPart04Test006
     * @tc.desc Verify 5 callbackfn length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let n: int = 0;
      arr.reduceRight((p: number, _c: number, _i: int, _a: Int32Array): number => {
        n++;
        return p;
      }, 0);
      expect(n).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_0700
     * @tc.name int32ArrayReduceRightPart04Test007
     * @tc.desc Verify + initialValue callbackfn 0 initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let n: int = 0;
      let r: number = arr.reduceRight((p: number, _c: number, _i: int, _a: Int32Array): number => {
        n++;
        return p + 1;
      }, 77);
      expect(n).assertEqual(0);
      expect(r).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_0800
     * @tc.name int32ArrayReduceRightPart04Test008
     * @tc.desc Verify + initialValue callbackfn 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let n: int = 0;
      arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => {
        n++;
        return p + c;
      }, 8);
      expect(n).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_0900
     * @tc.name int32ArrayReduceRightPart04Test009
     * @tc.desc Verify 4 currentIndex [3,2,1,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let seq: number[] = [];
      arr.reduceRight((p: number, _c: number, i: int, _a: Int32Array): number => {
        seq.push(i);
        return p;
      }, 0);
      expect(seq.length).assertEqual(4);
      expect(seq[0]).assertEqual(3);
      expect(seq[1]).assertEqual(2);
      expect(seq[2]).assertEqual(1);
      expect(seq[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_1000
     * @tc.name int32ArrayReduceRightPart04Test010
     * @tc.desc Verify 4 currentValue [40,30,20,10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let cs: number[] = [];
      arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => {
        cs.push(c);
        return p + c;
      }, 0);
      expect(cs.length).assertEqual(4);
      expect(cs[0]).assertEqual(40);
      expect(cs[1]).assertEqual(30);
      expect(cs[2]).assertEqual(20);
      expect(cs[3]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_1100
     * @tc.name int32ArrayReduceRightPart04Test011
     * @tc.desc Verify previousValue initialValue=55
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let firstPrev: number = Number.NaN;
      let hit: boolean = false;
      arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => {
        if (!hit) {
          firstPrev = p;
          hit = true;
        }
        return p + c;
      }, 55);
      expect(firstPrev).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_1200
     * @tc.name int32ArrayReduceRightPart04Test012
     * @tc.desc Verify callback receives the original array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let callbackLength: int = 0;
      let firstValue: number = 0;
      arr.reduceRight((_p: number, _c: number, _i: int, a: Int32Array): number => {
        callbackLength = a.length;
        firstValue = a.$_get(0);
        return 0;
      }, 0);
      expect(callbackLength).assertEqual(2);
      expect(firstValue).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_1300
     * @tc.name int32ArrayReduceRightPart04Test013
     * @tc.desc Verify array arr ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 4, 5]);
      let same: boolean = false;
      arr.reduceRight((_p: number, _c: number, _i: int, a: Int32Array): number => {
        same = (a === arr);
        return 0;
      }, 0);
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_1400
     * @tc.name int32ArrayReduceRightPart04Test014
     * @tc.desc Verify a.$_get(i) currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33, 44, 55, 66, 77]);
      let ok: boolean = true;
      arr.reduceRight((_p: number, c: number, i: int, a: Int32Array): number => {
        if (a.$_get(i) !== c) {
          ok = false;
        }
        return 0;
      }, 0);
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_1500
     * @tc.name int32ArrayReduceRightPart04Test015
     * @tc.desc Verify a.length 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
      let ok: boolean = true;
      arr.reduceRight((_p: number, _c: number, _i: int, a: Int32Array): number => {
        if (a.length !== 6) {
          ok = false;
        }
        return 0;
      }, 0);
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_1600
     * @tc.name int32ArrayReduceRightPart04Test016
     * @tc.desc Verify current values are 2 and 1 in right-to-left order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
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
      expect(first).assertEqual(2);
      expect(second).assertEqual(1);
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_1700
     * @tc.name int32ArrayReduceRightPart04Test017
     * @tc.desc Verify callbackfn 100 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-5, 0, 5]);
      let r: number = arr.reduceRight((_p: number, _c: number, _i: int, _a: Int32Array): number => 100, -20);
      expect(r).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_1800
     * @tc.name int32ArrayReduceRightPart04Test018
     * @tc.desc Verify callbackfn previousValue initialValue=31
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([9, 8, 7, 6]);
      let r: number = arr.reduceRight((p: number, _c: number, _i: int, _a: Int32Array): number => p, 31);
      expect(r).assertEqual(31);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_1900
     * @tc.name int32ArrayReduceRightPart04Test019
     * @tc.desc Verify callbackfn currentValue 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      let r: number = arr.reduceRight((_p: number, c: number, _i: int, _a: Int32Array): number => c, 999);
      expect(r).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_2000
     * @tc.name int32ArrayReduceRightPart04Test020
     * @tc.desc Verify callbackfn [7,8] init=''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 8]);
      let r: string = arr.reduceRight((p: string, c: number, _i: int, _a: Int32Array): string => {
        return '(' + c.toString() + '+' + p + ')';
      }, '');
      expect(r).assertEqual('(7+(8+))');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_2100
     * @tc.name int32ArrayReduceRightPart04Test021
     * @tc.desc Verify callbackfn init=1 [2,3,4] 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2, 3, 4]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p * c, 1);
      expect(r).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_2200
     * @tc.name int32ArrayReduceRightPart04Test022
     * @tc.desc Verify callbackfn init=0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2, 3, 4]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p * c, 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_2300
     * @tc.name int32ArrayReduceRightPart04Test023
     * @tc.desc Verify callbackfn c*c [1,2,3] 14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c * c, 0);
      expect(r).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_2400
     * @tc.name int32ArrayReduceRightPart04Test024
     * @tc.desc Verify callbackfn [1,2,3,4] 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => {
        return p + (c % 2 === 0 ? c : 0);
      }, 0);
      expect(r).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_2500
     * @tc.name int32ArrayReduceRightPart04Test025
     * @tc.desc Verify callbackfn [-2,3,-4] 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2, 3, -4]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => {
        return p + (c < 0 ? -c : c);
      }, 0);
      expect(r).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_2600
     * @tc.name int32ArrayReduceRightPart04Test026
     * @tc.desc Verify callbackfn [-1,2,-3,-4] 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 2, -3, -4]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => {
        return p + (c < 0 ? 1 : 0);
      }, 0);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_2700
     * @tc.name int32ArrayReduceRightPart04Test027
     * @tc.desc Verify callbackfn c<<i [1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let r: number = arr.reduceRight((p: number, c: number, i: int, _a: Int32Array): number => p + (c << i), 0);
      expect(r).assertEqual((2 << 1) + (1 << 0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_2800
     * @tc.name int32ArrayReduceRightPart04Test028
     * @tc.desc Verify callbackfn p|(1<<i) 3 0b111
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: number = arr.reduceRight((p: number, _c: number, i: int, _a: Int32Array): number => p | (1 << i), 0);
      expect(r).assertEqual(0b111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_2900
     * @tc.name int32ArrayReduceRightPart04Test029
     * @tc.desc Verify callbackfn a.$_get(0) 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([100, 200, 300]);
      let ok: boolean = true;
      arr.reduceRight((p: number, _c: number, _i: int, a: Int32Array): number => {
        if (a.$_get(0) !== 100) {
          ok = false;
        }
        return p;
      }, 0);
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_3000
     * @tc.name int32ArrayReduceRightPart04Test030
     * @tc.desc Verify callbackfn $_set(i-1, c*10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: number = arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => {
        if (i > 0) {
          a.$_set(i - 1, c * 10);
        }
        return p + c;
      }, 0);
      expect(r).assertEqual(4 + 40 + 400 + 4000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_3100
     * @tc.name int32ArrayReduceRightPart04Test031
     * @tc.desc Verify callbackfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, -7, 9, 5, 2]);
      let r: number =
      arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => c > p ? c : p, -2147483648);
      expect(r).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_3200
     * @tc.name int32ArrayReduceRightPart04Test032
     * @tc.desc Verify callbackfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, -7, 9, 5, 2]);
      let r: number =
      arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => c < p ? c : p, 2147483647);
      expect(r).assertEqual(-7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_3300
     * @tc.name int32ArrayReduceRightPart04Test033
     * @tc.desc Verify callbackfn [1,2,3] init=0 0-3-2-1=-6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p - c, 0);
      expect(r).assertEqual(-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_3400
     * @tc.name int32ArrayReduceRightPart04Test034
     * @tc.desc Verify callbackfn [2,3,4] init=24 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2, 3, 4]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p / c, 24);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_3500
     * @tc.name int32ArrayReduceRightPart04Test035
     * @tc.desc Verify callbackfn [1,2,3] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p ^ c, 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_3600
     * @tc.name int32ArrayReduceRightPart04Test036
     * @tc.desc Verify initialValue=NaN NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, Number.NaN);
      expect(isNaN(r)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_3700
     * @tc.name int32ArrayReduceRightPart04Test037
     * @tc.desc Verify initialValue=Infinity Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: number =
      arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, Number.POSITIVE_INFINITY);
      expect(r).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_3800
     * @tc.name int32ArrayReduceRightPart04Test038
     * @tc.desc Verify initialValue=-Infinity -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-5, -6]);
      let r: number =
      arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, -Number.POSITIVE_INFINITY);
      expect(r).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_3900
     * @tc.name int32ArrayReduceRightPart04Test039
     * @tc.desc Verify initialValue=true boolean && true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: boolean = arr.reduceRight((p: boolean, c: number, _i: int, _a: Int32Array): boolean => p && c !== 0, true);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_4000
     * @tc.name int32ArrayReduceRightPart04Test040
     * @tc.desc Verify initialValue=false boolean || true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -2, 3]);
      let r: boolean = arr.reduceRight((p: boolean, c: number, _i: int, _a: Int32Array): boolean => p || c < 0, false);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_4100
     * @tc.name int32ArrayReduceRightPart04Test041
     * @tc.desc Verify initialValue='Z' 'Z321'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: string = arr.reduceRight((p: string, c: number, _i: int, _a: Int32Array): string => p + c.toString(), 'Z');
      expect(r).assertEqual('Z321');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_4200
     * @tc.name int32ArrayReduceRightPart04Test042
     * @tc.desc Verify initialValue=Number.MAX_VALUE 0 MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      let r: number =
      arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, Number.MAX_VALUE);
      expect(r).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_4300
     * @tc.name int32ArrayReduceRightPart04Test043
     * @tc.desc Verify initialValue=0x7FFFFFFF 0 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0x7FFFFFFF);
      expect(r).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_4400
     * @tc.name int32ArrayReduceRightPart04Test044
     * @tc.desc Verify initialValue=-0x80000000 0 -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, -0x80000000);
      expect(r).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_4500
     * @tc.name int32ArrayReduceRightPart04Test045
     * @tc.desc Verify initialValue=-1.5 1+2+(-1.5)=1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, -1.5);
      expect(r).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_4600
     * @tc.name int32ArrayReduceRightPart04Test046
     * @tc.desc Verify initialValue=null U=number|null null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: number | null =
      arr.reduceRight((p: number | null, _c: number, _i: int, _a: Int32Array): number | null => p, null);
      expect(r).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_4700
     * @tc.name int32ArrayReduceRightPart04Test047
     * @tc.desc Verify initialValue=null U=number|null prev=null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 7]);
      let r: number | null = arr.reduceRight((p: number | null, c: number, _i: int, _a: Int32Array): number | null => {
        if (p === null) {
          return c;
        }
        return p + c;
      }, null);
      expect(r).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_4800
     * @tc.name int32ArrayReduceRightPart04Test048
     * @tc.desc Verify initialValue=[] number[] [1,2,3,4,5,6] [6,4,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
      let r: number[] = arr.reduceRight((p: number[], c: number, _i: int, _a: Int32Array): number[] => {
        if (c % 2 === 0) {
          p.push(c);
        }
        return p;
      }, []);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(6);
      expect(r.$_get(1)).assertEqual(4);
      expect(r.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_4900
     * @tc.name int32ArrayReduceRightPart04Test049
     * @tc.desc Verify initialValue=[] string[] toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: string[] = arr.reduceRight((p: string[], c: number, _i: int, _a: Int32Array): string[] => {
        p.push(c.toString());
        return p;
      }, []);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual('30');
      expect(r.$_get(2)).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_5000
     * @tc.name int32ArrayReduceRightPart04Test050
     * @tc.desc Verify initialValue=[0] push length+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let init: number[] = [0];
      let r: number[] = arr.reduceRight((p: number[], c: number, _i: int, _a: Int32Array): number[] => {
        p.push(c);
        return p;
      }, init);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_5100
     * @tc.name int32ArrayReduceRightPart04Test051
     * @tc.desc Verify Int32Array.from([1..4]) reduceRight 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.from([1, 2, 3, 4]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_5200
     * @tc.name int32ArrayReduceRightPart04Test052
     * @tc.desc Verify Int32Array.of(7,8,9) reduceRight 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_5300
     * @tc.name int32ArrayReduceRightPart04Test053
     * @tc.desc Verify Int32Array.from Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([5, 6, 7]);
      let arr: Int32Array = Int32Array.from(src);
      src.$_set(0, 999);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_5400
     * @tc.name int32ArrayReduceRightPart04Test054
     * @tc.desc Verify subarray(1,3) [20,30] 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let sub: Int32Array = arr.subarray(1, 3);
      let r: number = sub.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_5500
     * @tc.name int32ArrayReduceRightPart04Test055
     * @tc.desc Verify subarray(length-1) 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 99]);
      let sub: Int32Array = arr.subarray(arr.length - 1);
      let r: number = sub.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_5600
     * @tc.name int32ArrayReduceRightPart04Test056
     * @tc.desc Verify ArrayBuffer byteOffset=4 length=2 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let view: Int32Array = new Int32Array(buf, 4, 2);
      view.$_set(0, 7);
      view.$_set(1, 8);
      let r: number = view.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_5700
     * @tc.name int32ArrayReduceRightPart04Test057
     * @tc.desc Verify ArrayBuffer byteOffset=12 length=1 -55
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let view: Int32Array = new Int32Array(buf, 12, 1);
      view.$_set(0, -55);
      let r: number = view.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(-55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_5800
     * @tc.name int32ArrayReduceRightPart04Test058
     * @tc.desc Verify [INT_MIN] init=1 -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 1);
      expect(r).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_5900
     * @tc.name int32ArrayReduceRightPart04Test059
     * @tc.desc Verify [INT_MAX] init=1 2147483648 number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 1);
      expect(r).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_6000
     * @tc.name int32ArrayReduceRightPart04Test060
     * @tc.desc Verify [INT_MAX, 1] 2147483648 number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, 1]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_6100
     * @tc.name int32ArrayReduceRightPart04Test061
     * @tc.desc Verify [-2147483648, -1] -2147483649 number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, -1]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(-2147483649);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_6200
     * @tc.name int32ArrayReduceRightPart04Test062
     * @tc.desc Verify 7 init=1 343
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 7, 7]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p * c, 1);
      expect(r).assertEqual(343);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_6300
     * @tc.name int32ArrayReduceRightPart04Test063
     * @tc.desc Verify 1/-1 5 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -1, 1, -1, 1]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_6400
     * @tc.name int32ArrayReduceRightPart04Test064
     * @tc.desc Verify [1,0,0,0,0] init=1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 0, 0, 0, 0]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p * c, 1);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_6500
     * @tc.name int32ArrayReduceRightPart04Test065
     * @tc.desc Verify [-3,-5,-7] -15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-3, -5, -7]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_6600
     * @tc.name int32ArrayReduceRightPart04Test066
     * @tc.desc Verify 7 1..7 28
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: int = 7;
      let arr: Int32Array = new Int32Array(n);
      for (let i: int = 0; i < n; i++) {
        arr.$_set(i, i + 1);
      }
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(28);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_6700
     * @tc.name int32ArrayReduceRightPart04Test067
     * @tc.desc Verify fill(-1) 4 -4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.fill(-1);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(-4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_6800
     * @tc.name int32ArrayReduceRightPart04Test068
     * @tc.desc Verify 0 [0,0,0,0] init=1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 1);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_6900
     * @tc.name int32ArrayReduceRightPart04Test069
     * @tc.desc Verify slice() reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let cp: Int32Array = arr.slice();
      let r: number = cp.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(10);
      expect(arr.$_get(0)).assertEqual(1);
      expect(cp.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_7000
     * @tc.name int32ArrayReduceRightPart04Test070
     * @tc.desc Verify number accumulator with initial value 0 returns -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -2]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_7100
     * @tc.name int32ArrayReduceRightPart04Test071
     * @tc.desc Verify string accumulator with initial value 'X' returns 'X5'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5]);
      let r: string = arr.reduceRight((p: string, c: number, _i: int, _a: Int32Array): string => p + c.toString(), 'X');
      expect(r).assertEqual('X5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_7200
     * @tc.name int32ArrayReduceRightPart04Test072
     * @tc.desc Verify initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let init: number[] = [];
      let r: number[] = arr.reduceRight((p: number[], _c: number, _i: int, _a: Int32Array): number[] => p, init);
      expect(r).assertEqual(init);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_7300
     * @tc.name int32ArrayReduceRightPart04Test073
     * @tc.desc Verify reduceRight returns the initial result without mutating the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-3, 0, 3]);
      arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 10);
      expect(arr.$_get(0)).assertEqual(-3);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_7400
     * @tc.name int32ArrayReduceRightPart04Test074
     * @tc.desc Verify byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_7500
     * @tc.name int32ArrayReduceRightPart04Test075
     * @tc.desc Verify + initialValue undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_7600
     * @tc.name int32ArrayReduceRightPart04Test076
     * @tc.desc Verify [25] init=75 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([25]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 75);
      expect(r).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_7700
     * @tc.name int32ArrayReduceRightPart04Test077
     * @tc.desc Verify callbackfn index=1 length=3 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let n: int = 0;
      try {
        arr.reduceRight((p: number, c: number, i: int, _a: Int32Array): number => {
          n++;
          if (i === 1) {
            throw new Error('mid');
          }
          return p + c;
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(n).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_7800
     * @tc.name int32ArrayReduceRightPart04Test078
     * @tc.desc Verify callbackfn RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      try {
        arr.reduceRight((_p: number, _c: number, _i: int, _a: Int32Array): number => {
          throw new RangeError('r');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_7900
     * @tc.name int32ArrayReduceRightPart04Test079
     * @tc.desc Verify callbackfn TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      try {
        arr.reduceRight((_p: number, _c: number, _i: int, _a: Int32Array): number => {
          throw new TypeError('t');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_8000
     * @tc.name int32ArrayReduceRightPart04Test080
     * @tc.desc Verify callbackfn NaN NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 6]);
      let step: int = 0;
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => {
        step++;
        if (step === 1) {
          return Number.NaN;
        }
        return p + c;
      }, 0);
      expect(isNaN(r)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_8100
     * @tc.name int32ArrayReduceRightPart04Test081
     * @tc.desc Verify callbackfn -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let step: int = 0;
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => {
        step++;
        if (step === 2) {
          return -Number.POSITIVE_INFINITY;
        }
        return p + c;
      }, 0);
      expect(isFinite(r)).assertFalse();
      expect(r < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_8200
     * @tc.name int32ArrayReduceRightPart04Test082
     * @tc.desc Verify INT_MIN=-2147483648 currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648]);
      let seen: number = 0;
      arr.reduceRight((_p: number, c: number, _i: int, _a: Int32Array): number => {
        seen = c;
        return 0;
      }, 0);
      expect(seen).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_8300
     * @tc.name int32ArrayReduceRightPart04Test083
     * @tc.desc Verify callbackfn Error message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let msg: string = '';
      try {
        arr.reduceRight((_p: number, _c: number, _i: int, _a: Int32Array): number => {
          throw new Error('err-msg-42');
        }, 0);
        expect().assertFail();
      } catch (e) {
        msg = e.message;
        expect(e.name).assertEqual('Error');
      }
      expect(msg).assertEqual('err-msg-42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_8400
     * @tc.name int32ArrayReduceRightPart04Test084
     * @tc.desc Verify + initialValue callbackfn initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: number = arr.reduceRight((_p: number, _c: number, _i: int, _a: Int32Array): number => {
        throw new Error('never-called');
      }, 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_8500
     * @tc.name int32ArrayReduceRightPart04Test085
     * @tc.desc Verify ArrayBuffer reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 4);
      let b: Int32Array = new Int32Array(buf, 0, 4);
      a.$_set(0, 1);
      a.$_set(1, 2);
      a.$_set(2, 3);
      a.$_set(3, 4);
      let seen: number[] = [];
      a.reduceRight((p: number, c: number, i: int, _arr: Int32Array): number => {
        seen.push(c);
        if (i === 3) {
          b.$_set(0, 1000);
        }
        return p + c;
      }, 0);
      expect(seen.$_get(0)).assertEqual(4);
      expect(seen.length).assertEqual(4);
      expect(seen.$_get(3)).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_8600
     * @tc.name int32ArrayReduceRightPart04Test086
     * @tc.desc Verify callbackfn (i=0) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let n: int = 0;
      try {
        arr.reduceRight((p: number, c: number, i: int, _a: Int32Array): number => {
          n++;
          if (i === 0) {
            throw new Error('last');
          }
          return p + c;
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(n).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_8700
     * @tc.name int32ArrayReduceRightPart04Test087
     * @tc.desc Verify fill(4) reduceRight 3 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      let r: number = arr.fill(4).reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_8800
     * @tc.name int32ArrayReduceRightPart04Test088
     * @tc.desc Verify callbackfn c*0.5 [1,2,3] 3.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c * 0.5, 0);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART04_TEST_MINDMAP_8900
     * @tc.name int32ArrayReduceRightPart04Test089
     * @tc.desc Verify callbackfn boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart04Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let entered: boolean = false;
      arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => {
        entered = true;
        return p + c;
      }, 0);
      expect(entered).assertTrue();
    });



  });
}
