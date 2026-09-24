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

export default function Int32ArrayReducePart02Test(): void {
  describe('Int32ArrayReducePart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_0100
     * @tc.name int32ArrayReducePart02Test001
     * @tc.desc Verify arity=1 (callbackfn only) on [10,20] sums to 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20);
      let sum: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(sum).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_0200
     * @tc.name int32ArrayReducePart02Test002
     * @tc.desc Verify arity=1 callback four params all received correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 4);
      let gotLen: int = -1;
      arr.reduce((p: number, c: number, i: int, a: Int32Array): number => {
        gotLen = a.length;
        return p + c;
      });
      expect(gotLen).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_0300
     * @tc.name int32ArrayReducePart02Test003
     * @tc.desc Verify arity=1 callback with only two params still executes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8);
      let r: number = arr.reduce((p: number, c: number): number => p + c);
      expect(r).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_0400
     * @tc.name int32ArrayReducePart02Test004
     * @tc.desc Verify named top-level function as callbackfn sums correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(4, 5, 6);
      let r: number = arr.reduce((p: number, c: number): number => p + c);
      expect(r).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_0500
     * @tc.name int32ArrayReducePart02Test005
     * @tc.desc Verify arrow function as callbackfn sums three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_0600
     * @tc.name int32ArrayReducePart02Test006
     * @tc.desc Verify callback always returns constant 0, final result is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9);
      let r: number = arr.reduce((_p: number, _c: number, _i: int, _a: Int32Array): number => 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_0700
     * @tc.name int32ArrayReducePart02Test007
     * @tc.desc Verify callback returns prev (identity accumulator), result equals first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9);
      let r: number = arr.reduce((p: number, _c: number, _i: int, _a: Int32Array): number => p);
      expect(r).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_0800
     * @tc.name int32ArrayReducePart02Test008
     * @tc.desc Verify callback returns curr (take-last), result equals last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: number = arr.reduce((_p: number, c: number, _i: int, _a: Int32Array): number => c);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_0900
     * @tc.name int32ArrayReducePart02Test009
     * @tc.desc Verify callback always returns fixed positive 42, final result 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: number = arr.reduce((_p: number, _c: number, _i: int, _a: Int32Array): number => 42);
      expect(r).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_1000
     * @tc.name int32ArrayReducePart02Test010
     * @tc.desc Verify callback always returns fixed negative -7, final result -7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: number = arr.reduce((_p: number, _c: number, _i: int, _a: Int32Array): number => -7);
      expect(r).assertEqual(-7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_1100
     * @tc.name int32ArrayReducePart02Test011
     * @tc.desc Verify callback records call count via closure (N elements calls N-1 times)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let count: int = 0;
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        count = count + 1;
        return p + c;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_1200
     * @tc.name int32ArrayReducePart02Test012
     * @tc.desc Verify empty Int32Array (new Int32Array(0)) throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      try {
        arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_1300
     * @tc.name int32ArrayReducePart02Test013
     * @tc.desc Verify empty array error name is strictly TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let errName: string = '';
      try {
        arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
        expect().assertFail();
      } catch (e) {
        errName = e.name;
        expect(e.name).assertEqual('TypeError');
      }
      expect(errName).assertEqual('TypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_1400
     * @tc.name int32ArrayReducePart02Test014
     * @tc.desc Verify empty array callback is never invoked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let called: boolean = false;
      try {
        arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
          called = true;
          return p + c;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_1500
     * @tc.name int32ArrayReducePart02Test015
     * @tc.desc Verify Int32Array.from empty array also throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [];
      let arr: Int32Array = Int32Array.from(src);
      try {
        arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_1600
     * @tc.name int32ArrayReducePart02Test016
     * @tc.desc Verify subarray empty view throws TypeError on reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let empty: Int32Array = arr.subarray(5, 10);
      try {
        empty.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_1700
     * @tc.name int32ArrayReducePart02Test017
     * @tc.desc Verify single positive element 42 returns 42 directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_1800
     * @tc.name int32ArrayReducePart02Test018
     * @tc.desc Verify single element 0 returns 0 directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0);
      expect(arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_1900
     * @tc.name int32ArrayReducePart02Test019
     * @tc.desc Verify single element -1 returns -1 directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1);
      expect(arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_2000
     * @tc.name int32ArrayReducePart02Test020
     * @tc.desc Verify single element INT_MAX returns INT_MAX directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647);
      expect(arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_2100
     * @tc.name int32ArrayReducePart02Test021
     * @tc.desc Verify single element INT_MIN returns INT_MIN directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648);
      expect(arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_2200
     * @tc.name int32ArrayReducePart02Test022
     * @tc.desc Verify single element 1 returns 1 directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      expect(arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_2300
     * @tc.name int32ArrayReducePart02Test023
     * @tc.desc Verify single element array callback call count is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(99);
      let calls: int = 0;
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        calls = calls + 1;
        return p + c;
      });
      expect(calls).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_2400
     * @tc.name int32ArrayReducePart02Test024
     * @tc.desc Verify single element array callback not triggered even if it throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        throw new Error('should not run');
      });
      expect(r).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_2500
     * @tc.name int32ArrayReducePart02Test025
     * @tc.desc Verify single element -2 returns -2 directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2);
      expect(arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c)).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_2600
     * @tc.name int32ArrayReducePart02Test026
     * @tc.desc Verify single element callback array param length is 1, reduce returns element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(77);
      expect(arr.length).assertEqual(1);
      expect(arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_2700
     * @tc.name int32ArrayReducePart02Test027
     * @tc.desc Verify two-element first callback prev equals first element 10; Also verify verify two-element first callback curr equals second element 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20);
      let firstPrev: number = 0;
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        firstPrev = p;
        return p + c;
      });
      expect(firstPrev).assertEqual(10);

      {
      let arr: Int32Array = Int32Array.of(10, 20);
      let firstCurr: number = 0;
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        firstCurr = c;
        return p + c;
      });
      expect(firstCurr).assertEqual(20);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_2800
     * @tc.name int32ArrayReducePart02Test028
     * @tc.desc Verify two-element first callback currentIndex is 1 (no initialValue starts from idx=1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20);
      let firstIdx: int = -1;
      arr.reduce((p: number, c: number, i: int, _a: Int32Array): number => {
        firstIdx = i;
        return p + c;
      });
      expect(firstIdx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_2900
     * @tc.name int32ArrayReducePart02Test029
     * @tc.desc Verify three-element second callback prev=first return, curr=third element, idx=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let call: int = 0;
      let secPrev: number = 0;
      let secCurr: number = 0;
      let secIdx: int = -1;
      arr.reduce((p: number, c: number, i: int, _a: Int32Array): number => {
        call = call + 1;
        if (call === 2) {
          secPrev = p;
          secCurr = c;
          secIdx = i;
        }
        return p + c;
      });
      expect(secPrev).assertEqual(30);
      expect(secCurr).assertEqual(30);
      expect(secIdx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_3000
     * @tc.name int32ArrayReducePart02Test030
     * @tc.desc Verify first callback array param is reference equal to source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let sameRef: boolean = false;
      arr.reduce((p: number, c: number, _i: int, a: Int32Array): number => {
        sameRef = (a === arr);
        return p + c;
      });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_3100
     * @tc.name int32ArrayReducePart02Test031
     * @tc.desc Verify 5-element array callback idx sequence is 1,2,3,4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let idxs: int[] = [];
      arr.reduce((p: number, c: number, i: int, _a: Int32Array): number => {
        idxs.push(i);
        return p + c;
      });
      expect(idxs.length).assertEqual(4);
      expect(idxs[0]).assertEqual(1);
      expect(idxs[1]).assertEqual(2);
      expect(idxs[2]).assertEqual(3);
      expect(idxs[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_3200
     * @tc.name int32ArrayReducePart02Test032
     * @tc.desc Verify callback array.length matches source array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let seenLen: int = 0;
      arr.reduce((p: number, c: number, _i: int, a: Int32Array): number => {
        seenLen = a.length;
        return p + c;
      });
      expect(seenLen).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_3300
     * @tc.name int32ArrayReducePart02Test033
     * @tc.desc Verify first element negative, initial prev is that negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-5, 7);
      let firstPrev: number = 0;
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        firstPrev = p;
        return p + c;
      });
      expect(firstPrev).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_3400
     * @tc.name int32ArrayReducePart02Test034
     * @tc.desc Verify first element 0, initial prev is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 7);
      let firstPrev: number = 99;
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        firstPrev = p;
        return p + c;
      });
      expect(firstPrev).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_3500
     * @tc.name int32ArrayReducePart02Test035
     * @tc.desc Verify [1,2,3,4] sum is 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      expect(arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_3600
     * @tc.name int32ArrayReducePart02Test036
     * @tc.desc Verify [3,4] product is 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 4);
      expect(arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p * c)).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_3700
     * @tc.name int32ArrayReducePart02Test037
     * @tc.desc Verify [5,3,9,1] max returns 9; Also verify verify [5,3,9,1] min returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 3, 9, 1);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p > c ? p : c);
      expect(r).assertEqual(9);

      {
      let arr: Int32Array = Int32Array.of(5, 3, 9, 1);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p < c ? p : c);
      expect(r).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_3800
     * @tc.name int32ArrayReducePart02Test038
     * @tc.desc Verify all-zero [0,0,0] sum is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0);
      expect(arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_3900
     * @tc.name int32ArrayReducePart02Test039
     * @tc.desc Verify all-negative [-1,-2,-3] sum is -6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, -2, -3);
      expect(arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c)).assertEqual(-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_4000
     * @tc.name int32ArrayReducePart02Test040
     * @tc.desc Verify [INT_MAX, INT_MIN] sum is -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, -2147483648);
      expect(arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_4100
     * @tc.name int32ArrayReducePart02Test041
     * @tc.desc Verify [1,-1,1,-1] alternating sign sum is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, -1, 1, -1);
      expect(arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_4200
     * @tc.name int32ArrayReducePart02Test042
     * @tc.desc Verify subtraction left-fold [10,3,2] result ((10-3)-2)=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 3, 2);
      expect(arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p - c)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_4300
     * @tc.name int32ArrayReducePart02Test043
     * @tc.desc Verify division left-fold [100,2,5] result ((100/2)/5)=10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(100, 2, 5);
      expect(arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p / c)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_4400
     * @tc.name int32ArrayReducePart02Test044
     * @tc.desc Verify 16-element array 1..16 sum is 136 (batch iteration path)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
      let arr: Int32Array = Int32Array.from(data);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r).assertEqual(136);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_4500
     * @tc.name int32ArrayReducePart02Test045
     * @tc.desc Verify currentValue 0 callback receives 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 0);
      let got: number = 99;
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        got = c;
        return p + c;
      });
      expect(got).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_4600
     * @tc.name int32ArrayReducePart02Test046
     * @tc.desc Verify currentValue -1 callback receives -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, -1);
      let got: number = 0;
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        got = c;
        return p + c;
      });
      expect(got).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_4700
     * @tc.name int32ArrayReducePart02Test047
     * @tc.desc Verify currentValue INT_MAX 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 2147483647);
      let got: number = 0;
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        got = c;
        return p + c;
      });
      expect(got).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_4800
     * @tc.name int32ArrayReducePart02Test048
     * @tc.desc Verify currentValue INT_MIN -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, -2147483648);
      let got: number = 0;
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        got = c;
        return p + c;
      });
      expect(got).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_4900
     * @tc.name int32ArrayReducePart02Test049
     * @tc.desc Verify $_set writes 3, currentValue reads 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, 0);
      arr.$_set(1, 3);
      let got: number = 0;
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        got = c;
        return p + c;
      });
      expect(got).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_5000
     * @tc.name int32ArrayReducePart02Test050
     * @tc.desc Verify $_set writes -3, currentValue reads -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, 0);
      arr.$_set(1, -3);
      let got: number = 0;
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        got = c;
        return p + c;
      });
      expect(got).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_5100
     * @tc.name int32ArrayReducePart02Test051
     * @tc.desc Verify currentValue 1 callback receives 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1);
      let got: number = 0;
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        got = c;
        return p + c;
      });
      expect(got).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_5200
     * @tc.name int32ArrayReducePart02Test052
     * @tc.desc Verify currentValue 50 callback receives 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 50);
      let got: number = 0;
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        got = c;
        return p + c;
      });
      expect(got).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_5300
     * @tc.name int32ArrayReducePart02Test053
     * @tc.desc Verify callback first call throws Error, message preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let msg: string = '';
      try {
        arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
          expect(c).assertEqual(2);
          throw new Error('first boom');
        });
        expect().assertFail();
      } catch (e) {
        msg = e.message;
        expect(e.name).assertEqual('Error');
      }
      expect(msg).assertEqual('first boom');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_5400
     * @tc.name int32ArrayReducePart02Test054
     * @tc.desc Verify callback second call throws, 2 calls executed then stopped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let calls: int = 0;
      try {
        arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
          calls = calls + 1;
          if (calls === 2) {
            expect(c).assertEqual(3);
            throw new Error('mid boom');
          }
          return p + c;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(calls).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_5500
     * @tc.name int32ArrayReducePart02Test055
     * @tc.desc Verify callback throws RangeError, e.name preserved as RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      try {
        arr.reduce((p: number, c: number): number => {
          expect(c).assertEqual(2);
          throw new RangeError('reduce range error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_5600
     * @tc.name int32ArrayReducePart02Test056
     * @tc.desc Verify callback throws TypeError, e.name preserved as TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      try {
        arr.reduce((p: number, c: number): number => {
          expect(c).assertEqual(2);
          throw new TypeError('reduce type error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_5700
     * @tc.name int32ArrayReducePart02Test057
     * @tc.desc Verify after throw subsequent elements not iterated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let afterThrow: boolean = false;
      let calls: int = 0;
      try {
        arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
          calls = calls + 1;
          if (calls === 2) {
            expect(c).assertEqual(3);
            throw new Error('stop');
          }
          afterThrow = true;
          return p + c;
        });
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(afterThrow).assertTrue();
      expect(calls).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_5800
     * @tc.name int32ArrayReducePart02Test058
     * @tc.desc Verify first callback throw idx is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let capturedIdx: int = -1;
      try {
        arr.reduce((p: number, c: number, idx: int, _a: Int32Array): number => {
          capturedIdx = idx;
          throw new Error('first');
        });
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(capturedIdx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_5900
     * @tc.name int32ArrayReducePart02Test059
     * @tc.desc Verify callback returns float 3.7, final result is 3.7 (not truncated to int)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => 3.7);
      expect(r).assertEqual(3.7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_6000
     * @tc.name int32ArrayReducePart02Test060
     * @tc.desc Verify callback returns NaN, next round prev is NaN and final returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let calls: int = 0;
      let sawNaN: boolean = false;
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        calls = calls + 1;
        if (calls === 2) {
          sawNaN = isNaN(p);
        }
        return Number.NaN;
      });
      expect(sawNaN).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_6100
     * @tc.name int32ArrayReducePart02Test061
     * @tc.desc Verify callback returns Infinity, next round prev is Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let calls: int = 0;
      let sawInf: boolean = false;
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        calls = calls + 1;
        if (calls === 2) {
          sawInf = (p === Number.POSITIVE_INFINITY);
        }
        return Number.POSITIVE_INFINITY;
      });
      expect(sawInf).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_6200
     * @tc.name int32ArrayReducePart02Test062
     * @tc.desc Verify callback returns -Infinity, next round prev is -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let calls: int = 0;
      let sawNeg: boolean = false;
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        calls = calls + 1;
        if (calls === 2) {
          sawNeg = (p === Number.NEGATIVE_INFINITY);
        }
        return Number.NEGATIVE_INFINITY;
      });
      expect(sawNeg).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_6300
     * @tc.name int32ArrayReducePart02Test063
     * @tc.desc Verify callback mid-iteration returns NaN, final result is NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: number = arr.reduce((p: number, _c: number, _i: int, _a: Int32Array): number => {
        if (isNaN(p)) {
          return p;
        }
        return Number.NaN;
      });
      expect(isNaN(r)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_6400
     * @tc.name int32ArrayReducePart02Test064
     * @tc.desc Verify callback returns -0.5, final result is -0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => -0.5);
      expect(r).assertEqual(-0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_6500
     * @tc.name int32ArrayReducePart02Test065
     * @tc.desc Verify callback returns MAX_SAFE_INTEGER not truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let big: number = 9007199254740991.0;
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => big);
      expect(r).assertEqual(big);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_6600
     * @tc.name int32ArrayReducePart02Test066
     * @tc.desc Verify callback returns 0.0 float preserves float precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 7);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => 0.0);
      expect(r).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_6700
     * @tc.name int32ArrayReducePart02Test067
     * @tc.desc Verify reduce sum does not modify original array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_6800
     * @tc.name int32ArrayReducePart02Test068
     * @tc.desc Verify callback $_set modifies unvisited element, subsequent callback reads new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let secondCurr: number = 0;
      let calls: int = 0;
      arr.reduce((p: number, c: number, _i: int, a: Int32Array): number => {
        calls = calls + 1;
        if (calls === 1) {
          a.$_set(2, 99);
        }
        if (calls === 2) {
          secondCurr = c;
        }
        return p + c;
      });
      expect(secondCurr).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_6900
     * @tc.name int32ArrayReducePart02Test069
     * @tc.desc Verify callback $_set modifies already-visited element does not affect completed iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let firstCurr: number = 0;
      let calls: int = 0;
      arr.reduce((p: number, c: number, _i: int, a: Int32Array): number => {
        calls = calls + 1;
        if (calls === 1) {
          firstCurr = c;
          a.$_set(0, 999);
        }
        return p + c;
      });
      expect(firstCurr).assertEqual(2);
      expect(arr.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_7000
     * @tc.name int32ArrayReducePart02Test070
     * @tc.desc Verify callback throw, $_set writes preserved (no rollback)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      try {
        arr.reduce((p: number, c: number, _i: int, a: Int32Array): number => {
          a.$_set(1, 77);
          throw new Error('boom mid');
        });
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.$_get(1)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_7100
     * @tc.name int32ArrayReducePart02Test071
     * @tc.desc Verify reduce does not change array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let before: int = arr.length;
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_7200
     * @tc.name int32ArrayReducePart02Test072
     * @tc.desc Verify subarray view reduce first element is view[0] not original[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(10, 20, 30, 40);
      let sub: Int32Array = base.subarray(1, 4);
      let firstPrev: number = 0;
      sub.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        firstPrev = p;
        return p + c;
      });
      expect(firstPrev).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_7300
     * @tc.name int32ArrayReducePart02Test073
     * @tc.desc Verify subarray view reduce sum correct (20+30+40=90)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(10, 20, 30, 40);
      let sub: Int32Array = base.subarray(1, 4);
      let r: number = sub.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r).assertEqual(90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_7400
     * @tc.name int32ArrayReducePart02Test074
     * @tc.desc Verify ArrayBuffer constructed view reduce product correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let view: Int32Array = new Int32Array(buf, 0, 3);
      view.$_set(0, 2);
      view.$_set(1, 3);
      view.$_set(2, 4);
      let r: number = view.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p * c);
      expect(r).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_7500
     * @tc.name int32ArrayReducePart02Test075
     * @tc.desc Verify subarray length=1 returns element directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(10, 20, 30);
      let sub: Int32Array = base.subarray(1, 2);
      let r: number = sub.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_7600
     * @tc.name int32ArrayReducePart02Test076
     * @tc.desc Verify subarray reduce array param points to subarray not original (length=2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sub: Int32Array = base.subarray(1, 3);
      let gotLen: int = 0;
      sub.reduce((p: number, c: number, _i: int, a: Int32Array): number => {
        gotLen = a.length;
        return p + c;
      });
      expect(gotLen).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_7700
     * @tc.name int32ArrayReducePart02Test077
     * @tc.desc Verify Int32Array.of sum correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6, 7);
      expect(arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c)).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_7800
     * @tc.name int32ArrayReducePart02Test078
     * @tc.desc Verify three-element final return equals last callback return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let lastRet: number = 0;
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        lastRet = p * 10 + c;
        return lastRet;
      });
      expect(r).assertEqual(lastRet);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_7900
     * @tc.name int32ArrayReducePart02Test079
     * @tc.desc Verify two-element [7,9] reduce returns callback(7,9,1,arr)=709
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 9);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p * 100 + c);
      expect(r).assertEqual(709);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_8000
     * @tc.name int32ArrayReducePart02Test080
     * @tc.desc Verify multiplication [2,3,4] result is 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2, 3, 4);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p * c);
      expect(r).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_8100
     * @tc.name int32ArrayReducePart02Test081
     * @tc.desc Verify four-element [1,2,3,4] accumulator prev sequence is [1,3,6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let prevs: number[] = [];
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        prevs.push(p);
        return p + c;
      });
      expect(prevs.length).assertEqual(3);
      expect(prevs[0]).assertEqual(1);
      expect(prevs[1]).assertEqual(3);
      expect(prevs[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_8200
     * @tc.name int32ArrayReducePart02Test082
     * @tc.desc Verify second callback via array.$_get(0) still reads first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let sawFirst: number = 0;
      let calls: int = 0;
      arr.reduce((p: number, c: number, _i: int, a: Int32Array): number => {
        calls = calls + 1;
        if (calls === 2) {
          sawFirst = a.$_get(0);
        }
        return p + c;
      });
      expect(sawFirst).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_8300
     * @tc.name int32ArrayReducePart02Test083
     * @tc.desc Verify four-element array callback call count is 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 1, 1, 1);
      let calls: int = 0;
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        calls = calls + 1;
        return p + c;
      });
      expect(calls).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_8400
     * @tc.name int32ArrayReducePart02Test084
     * @tc.desc Verify first callback curr is arr[1] not arr[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(100, 200);
      let gotCurr: number = 0;
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        gotCurr = c;
        return p + c;
      });
      expect(gotCurr).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_8500
     * @tc.name int32ArrayReducePart02Test085
     * @tc.desc Verify [10,20,30,40] callback curr sequence is [20,30,40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let currs: number[] = [];
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        currs.push(c);
        return p + c;
      });
      expect(currs.length).assertEqual(3);
      expect(currs[0]).assertEqual(20);
      expect(currs[1]).assertEqual(30);
      expect(currs[2]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART02_8600
     * @tc.name int32ArrayReducePart02Test086
     * @tc.desc Verify left-fold parenthesization (((1+2)+3)) structure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart02Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let steps: string[] = [];
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        steps.push('(' + p.toString() + '+' + c.toString() + ')');
        return p + c;
      });
      expect(steps[0]).assertEqual('(1+2)');
      expect(steps[1]).assertEqual('(3+3)');
    });
  });
}
