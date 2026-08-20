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

export default function Int32ArrayReducePart03Test(): void {
  describe('Int32ArrayReducePart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_0100
     * @tc.name int32ArrayReducePart03Test001
     * @tc.desc Verify arity=1 callbackfn multiplication on three-element array returns correct product
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2, 3, 5);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p * c);
      expect(r).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_0200
     * @tc.name int32ArrayReducePart03Test002
     * @tc.desc Verify arity=1 callback only (prev) single param, ignores curr, returns repeated prev chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9);
      let r: number = arr.reduce((p: number): number => p + 1);
      expect(r).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_0300
     * @tc.name int32ArrayReducePart03Test003
     * @tc.desc Verify arity=0 (no args) throws on non-empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      try {
        arr.reduce(0 as Object as (p: number, c: number, i: int, a: Int32Array) => number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_0400
     * @tc.name int32ArrayReducePart03Test004
     * @tc.desc Verify arity=1 callbackfn via variable assignment works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(11, 22, 33);
      let r: number = arr.reduce((p: number, c: number): number => p + c);
      expect(r).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_0500
     * @tc.name int32ArrayReducePart03Test005
     * @tc.desc Verify four-param order prev/curr/i/a binding correct on second round for length=4 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(100, 200, 300, 400);
      let call: int = 0;
      let sawP: number = 0;
      let sawC: number = 0;
      let sawI: int = -1;
      let sawLen: int = 0;
      arr.reduce((p: number, c: number, i: int, a: Int32Array): number => {
        call = call + 1;
        if (call === 2) {
          sawP = p;
          sawC = c;
          sawI = i;
          sawLen = a.length;
        }
        return p + c;
      });
      expect(sawP).assertEqual(300);
      expect(sawC).assertEqual(300);
      expect(sawI).assertEqual(2);
      expect(sawLen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_0600
     * @tc.name int32ArrayReducePart03Test006
     * @tc.desc Verify callback a[i] strictly equals curr for all rounds (5 elements)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(11, 22, 33, 44, 55);
      let ok: boolean = true;
      arr.reduce((p: number, c: number, i: int, a: Int32Array): number => {
        if (a.$_get(i) !== c) {
          ok = false;
        }
        return p + c;
      });
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_0700
     * @tc.name int32ArrayReducePart03Test007
     * @tc.desc Verify first round prev is arr[0] and arr[0] not consumed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(123, 456);
      let firstPrev: number = 0;
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        firstPrev = p;
        return p + c;
      });
      expect(firstPrev).assertEqual(123);
      expect(arr.$_get(0)).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_0800
     * @tc.name int32ArrayReducePart03Test008
     * @tc.desc Verify first round i is strictly 1 for 5-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let firstI: int = -1;
      let done: boolean = false;
      arr.reduce((p: number, c: number, i: int, _a: Int32Array): number => {
        if (!done) {
          firstI = i;
          done = true;
        }
        return p + c;
      });
      expect(firstI).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_0900
     * @tc.name int32ArrayReducePart03Test009
     * @tc.desc Verify last round i is length-1 for 6-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6);
      let lastI: int = -1;
      arr.reduce((p: number, c: number, i: int, _a: Int32Array): number => {
        lastI = i;
        return p + c;
      });
      expect(lastI).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_1000
     * @tc.name int32ArrayReducePart03Test010
     * @tc.desc Verify callback always returns current index i, final result is length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0, 0, 0);
      let r: number = arr.reduce((_p: number, _c: number, i: int, _a: Int32Array): number => i);
      expect(r).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_1100
     * @tc.name int32ArrayReducePart03Test011
     * @tc.desc Verify callback returns prev + 10, result is first + 10*(length-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 0, 0, 0);
      let r: number = arr.reduce((p: number, _c: number, _i: int, _a: Int32Array): number => p + 10);
      expect(r).assertEqual(37);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_1200
     * @tc.name int32ArrayReducePart03Test012
     * @tc.desc Verify callback returns curr - prev (reverse subtraction)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 3, 2);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => c - p);
      expect(r).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_1300
     * @tc.name int32ArrayReducePart03Test013
     * @tc.desc Verify callback returns -prev, result is first * (-1)^(length-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 0, 0);
      let r: number = arr.reduce((p: number, _c: number, _i: int, _a: Int32Array): number => -p);
      expect(r).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_1400
     * @tc.name int32ArrayReducePart03Test014
     * @tc.desc Verify callback returns prev % curr (modulo aggregation)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(100, 7, 3);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p % c);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_1500
     * @tc.name int32ArrayReducePart03Test015
     * @tc.desc Verify callback returns (p + c) / 2 sliding average (float)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(4, 8, 16);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => (p + c) / 2.0);
      expect(r).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_1600
     * @tc.name int32ArrayReducePart03Test016
     * @tc.desc Verify callback returns p + c*c (sum of squares)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c * c);
      expect(r).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_1700
     * @tc.name int32ArrayReducePart03Test017
     * @tc.desc Verify callback returns p | (1 << c) bit flag aggregation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 2, 4);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p | (1 << c));
      expect(r).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_1800
     * @tc.name int32ArrayReducePart03Test018
     * @tc.desc Verify callback returns p ^ c XOR aggregation 5 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(15, 7, 3, 7, 15);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p ^ c);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_1900
     * @tc.name int32ArrayReducePart03Test019
     * @tc.desc Verify callback counts positive elements with initial value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2, 3, 0, 5, -7, 8);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + (c > 0 ? 1 : 0), 0);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_2000
     * @tc.name int32ArrayReducePart03Test020
     * @tc.desc Verify callback counts negative elements with initial value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2, 3, 0, 5, -7, 8);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + (c < 0 ? 1 : 0), 0);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_2100
     * @tc.name int32ArrayReducePart03Test021
     * @tc.desc Verify callback counts zero elements with initial value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1, 0, -3, 0);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + (c === 0 ? 1 : 0), 0);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_2200
     * @tc.name int32ArrayReducePart03Test022
     * @tc.desc Verify callback counts even elements with initial value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + (c % 2 === 0 ? 1 : 0), 0);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_2300
     * @tc.name int32ArrayReducePart03Test023
     * @tc.desc Verify callback uses if-else returns larger value (max)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(13, 5, 27, 9, 21);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        if (p > c) {
          return p;
        } else {
          return c;
        }
      });
      expect(r).assertEqual(27);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_2400
     * @tc.name int32ArrayReducePart03Test024
     * @tc.desc Verify callback uses if-else returns smaller value (min)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(13, -5, 27, 9, -21);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        if (p < c) {
          return p;
        } else {
          return c;
        }
      });
      expect(r).assertEqual(-21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_2500
     * @tc.name int32ArrayReducePart03Test025
     * @tc.desc Verify callback first round throws Error, callCount strictly 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let count: int = 0;
      try {
        arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
          count = count + 1;
          expect(c).assertEqual(2);
          throw new Error('boom first');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_2600
     * @tc.name int32ArrayReducePart03Test026
     * @tc.desc Verify after throw unvisited elements preserve original values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let count: int = 0;
      try {
        arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
          count = count + 1;
          if (count === 2) {
            expect(c).assertEqual(3);
            throw new Error('stop');
          }
          return p + c;
        });
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(4);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_2700
     * @tc.name int32ArrayReducePart03Test027
     * @tc.desc Verify pre-throw a.$_set writes preserved (no rollback)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      try {
        arr.reduce((p: number, c: number, i: int, a: Int32Array): number => {
          a.$_set(i, c + 100);
          throw new Error('boom after write');
        });
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.$_get(1)).assertEqual(102);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_2800
     * @tc.name int32ArrayReducePart03Test028
     * @tc.desc Verify callback throws URIError, name transparently propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let errName: string = '';
      try {
        arr.reduce((_p: number, _c: number, _i: int, _a: Int32Array): number => {
          expect(_c).assertEqual(2);
          throw new URIError('uri err');
        });
      } catch (e) {
        errName = e.name;
        expect(e.name).assertEqual('URIError');
      }
      expect(errName).assertEqual('URIError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_2900
     * @tc.name int32ArrayReducePart03Test029
     * @tc.desc Verify callback throws EvalError, name transparently propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let errName: string = '';
      try {
        arr.reduce((_p: number, _c: number, _i: int, _a: Int32Array): number => {
          expect(_c).assertEqual(2);
          throw new EvalError('eval err');
        });
      } catch (e) {
        errName = e.name;
        expect(e.name).assertEqual('EvalError');
      }
      expect(errName).assertEqual('EvalError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_3000
     * @tc.name int32ArrayReducePart03Test030
     * @tc.desc Verify constructor input 2147483648 (ToInt32=MIN) + 1 sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, 2147483648 as number);
      arr.$_set(1, 1);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_3100
     * @tc.name int32ArrayReducePart03Test031
     * @tc.desc Verify constructor input -2147483649 (ToInt32=MAX) + 1 sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, -2147483649 as number);
      arr.$_set(1, 1);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_3200
     * @tc.name int32ArrayReducePart03Test032
     * @tc.desc Verify constructor input 4294967295 (2^32-1, ToInt32=-1) + 1 sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, 4294967295 as number);
      arr.$_set(1, 1);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_3300
     * @tc.name int32ArrayReducePart03Test033
     * @tc.desc Verify constructor input 4294967296 (2^32, ToInt32=0) + 7 sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, 4294967296 as number);
      arr.$_set(1, 7);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_3400
     * @tc.name int32ArrayReducePart03Test034
     * @tc.desc Verify constructor input 0x80000000 (2^31=MIN) product
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, 0x80000000 as number);
      arr.$_set(1, 1);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p * c);
      expect(r).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_3500
     * @tc.name int32ArrayReducePart03Test035
     * @tc.desc Verify constructor input 0xFFFFFFFF (-1) product with 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, 0xFFFFFFFF as number);
      arr.$_set(1, 9);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p * c);
      expect(r).assertEqual(-9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_3600
     * @tc.name int32ArrayReducePart03Test036
     * @tc.desc Verify constructor input 0.9 (truncate to 0) sum with 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, 0.9 as number);
      arr.$_set(1, 5);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_3700
     * @tc.name int32ArrayReducePart03Test037
     * @tc.desc Verify constructor input -0.9 (truncate to 0) sum with 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, -0.9 as number);
      arr.$_set(1, 5);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_3800
     * @tc.name int32ArrayReducePart03Test038
     * @tc.desc Verify constructor input 2147483647.9 (truncate to MAX) product with 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, 2147483647.9 as number);
      arr.$_set(1, 2);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p * c);
      expect(r).assertEqual(4294967294);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_3900
     * @tc.name int32ArrayReducePart03Test039
     * @tc.desc Verify constructor input NaN (ToInt32=0) sum with 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, Number.NaN as number);
      arr.$_set(1, 6);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_4000
     * @tc.name int32ArrayReducePart03Test040
     * @tc.desc Verify constructor input Infinity (ToInt32=0) sum with 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, Number.POSITIVE_INFINITY);
      arr.$_set(1, 11);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_4100
     * @tc.name int32ArrayReducePart03Test041
     * @tc.desc Verify constructor input -Infinity (ToInt32=0) sum with 13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, Number.NEGATIVE_INFINITY);
      arr.$_set(1, 13);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_4200
     * @tc.name int32ArrayReducePart03Test042
     * @tc.desc Verify first element MAX, rest 0, max aggregation returns MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, 0, 0, 0);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p > c ? p : c);
      expect(r).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_4300
     * @tc.name int32ArrayReducePart03Test043
     * @tc.desc Verify first element MIN, rest 0, min aggregation returns MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648, 0, 0);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p < c ? p : c);
      expect(r).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_4400
     * @tc.name int32ArrayReducePart03Test044
     * @tc.desc Verify first element 0, rest negative, min aggregation returns most negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, -5, -3, -9);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p < c ? p : c);
      expect(r).assertEqual(-9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_4500
     * @tc.name int32ArrayReducePart03Test045
     * @tc.desc Verify first element -1, rest [MIN, 1], first prev is -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, -2147483648, 1);
      let firstPrev: number = 0;
      let done: boolean = false;
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        if (!done) {
          firstPrev = p;
          done = true;
        }
        return p + c;
      });
      expect(firstPrev).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_4600
     * @tc.name int32ArrayReducePart03Test046
     * @tc.desc Verify length 6 array sequential sum is element sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50, 60);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r).assertEqual(210);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_4700
     * @tc.name int32ArrayReducePart03Test047
     * @tc.desc Verify length 7 (odd) array max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 1, 4, 1, 5, 9, 2);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p > c ? p : c);
      expect(r).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_4800
     * @tc.name int32ArrayReducePart03Test048
     * @tc.desc Verify all same non-zero [8,8,8,8] product
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(8, 8, 8, 8);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p * c);
      expect(r).assertEqual(4096);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_4900
     * @tc.name int32ArrayReducePart03Test049
     * @tc.desc Verify new Int32Array(4) all zero sum is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_5000
     * @tc.name int32ArrayReducePart03Test050
     * @tc.desc Verify alternating [1,-1,1,-1,1] sum is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, -1, 1, -1, 1);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_5100
     * @tc.name int32ArrayReducePart03Test051
     * @tc.desc Verify all-zero [0,0,0,0] product is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0, 0);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p * c);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_5200
     * @tc.name int32ArrayReducePart03Test052
     * @tc.desc Verify Int32Array.from with mapfn constructing then reduce sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1, 2, 3, 4];
      let arr: Int32Array = Int32Array.from(src, (v: number, _k: number) => v * 2);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_5300
     * @tc.name int32ArrayReducePart03Test053
     * @tc.desc Verify copy from another Int32Array reduce sum equals original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(7, 8, 9);
      let cpy: Int32Array = new Int32Array(src);
      let r1: number = src.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      let r2: number = cpy.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_5400
     * @tc.name int32ArrayReducePart03Test054
     * @tc.desc Verify ArrayBuffer with byteOffset=4 non-zero aligned view reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let view: Int32Array = new Int32Array(buf, 4, 4);
      view.$_set(0, 1);
      view.$_set(1, 2);
      view.$_set(2, 3);
      view.$_set(3, 4);
      let r: number = view.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_5500
     * @tc.name int32ArrayReducePart03Test055
     * @tc.desc Verify subarray single param (begin) view reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let sub: Int32Array = base.subarray(2);
      let r: number = sub.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r).assertEqual(120);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_5600
     * @tc.name int32ArrayReducePart03Test056
     * @tc.desc Verify subarray negative begin view reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let sub: Int32Array = base.subarray(-3);
      let r: number = sub.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_5700
     * @tc.name int32ArrayReducePart03Test057
     * @tc.desc Verify subarray(begin,end) with begin>=end empty view throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(1, 2, 3);
      let empty: Int32Array = base.subarray(3, 2);
      try {
        empty.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_5800
     * @tc.name int32ArrayReducePart03Test058
     * @tc.desc Verify ArrayBuffer(0) zero-length view throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let view: Int32Array = new Int32Array(buf);
      try {
        view.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_5900
     * @tc.name int32ArrayReducePart03Test059
     * @tc.desc Verify Int32Array.of with MAX and MIN sum is -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, -2147483648);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_6000
     * @tc.name int32ArrayReducePart03Test060
     * @tc.desc Verify callback pushes each round curr into external array, verify curr sequence for 5 elements (idx 1..4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let currs: number[] = [];
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        currs.push(c);
        return p + c;
      });
      expect(currs.length).assertEqual(4);
      expect(currs[0]).assertEqual(20);
      expect(currs[1]).assertEqual(30);
      expect(currs[2]).assertEqual(40);
      expect(currs[3]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_6100
     * @tc.name int32ArrayReducePart03Test061
     * @tc.desc Verify callback pushes each round prev into external array, verify prev chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2, 3, 4, 5);
      let prevs: number[] = [];
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        prevs.push(p);
        return p + c;
      });
      expect(prevs.length).assertEqual(3);
      expect(prevs[0]).assertEqual(2);
      expect(prevs[1]).assertEqual(5);
      expect(prevs[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_6200
     * @tc.name int32ArrayReducePart03Test062
     * @tc.desc Verify callback first round a.$_set modifies i+1, subsequent rounds read new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let secondC: number = 0;
      let thirdC: number = 0;
      let call: int = 0;
      arr.reduce((p: number, c: number, i: int, a: Int32Array): number => {
        call = call + 1;
        if (call === 1) {
          a.$_set(i + 1, 22);
          a.$_set(i + 2, 33);
        }
        if (call === 2) {
          secondC = c;
        }
        if (call === 3) {
          thirdC = c;
        }
        return p + c;
      });
      expect(secondC).assertEqual(22);
      expect(thirdC).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_6300
     * @tc.name int32ArrayReducePart03Test063
     * @tc.desc Verify callback modifies a[i] (already visited index) does not affect current round curr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let firstC: number = 0;
      let call: int = 0;
      arr.reduce((p: number, c: number, i: int, a: Int32Array): number => {
        call = call + 1;
        if (call === 1) {
          firstC = c;
          a.$_set(i, 999);
        }
        return p + c;
      });
      expect(firstC).assertEqual(2);
      expect(arr.$_get(1)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_6400
     * @tc.name int32ArrayReducePart03Test064
     * @tc.desc Verify callback reads external toggle state for alternating sign sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sign: number = 1;
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        sign = -sign;
        return p + sign * c;
      });
      expect(r).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_6500
     * @tc.name int32ArrayReducePart03Test065
     * @tc.desc Verify callback sums all elements via loop on array param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let total: number = 0;
      arr.reduce((p: number, c: number, _i: int, a: Int32Array): number => {
        total = 0;
        for (let k: int = 0; k < a.length; k = k + 1) {
          total = total + a.$_get(k);
        }
        return p + c;
      });
      expect(total).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_6600
     * @tc.name int32ArrayReducePart03Test066
     * @tc.desc Verify external counter on length=1 array stays 0 (callback not invoked)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(77);
      let n: int = 0;
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        n = n + 1;
        return p + c;
      });
      expect(n).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_6700
     * @tc.name int32ArrayReducePart03Test067
     * @tc.desc Verify callback on length=2 array external counter is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let n: int = 0;
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        n = n + 1;
        return p + c;
      });
      expect(n).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_6800
     * @tc.name int32ArrayReducePart03Test068
     * @tc.desc Verify return value strictly equals last callback return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let lastReturned: number = 0;
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        lastReturned = p * 2 + c;
        return lastReturned;
      });
      expect(r).assertEqual(lastReturned);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_6900
     * @tc.name int32ArrayReducePart03Test069
     * @tc.desc Verify single element array return equals element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(31337);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r).assertEqual(31337);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_7000
     * @tc.name int32ArrayReducePart03Test070
     * @tc.desc Verify callback returns float 0.25, final returns 0.25 preserving decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r: number = arr.reduce((_p: number, _c: number, _i: int, _a: Int32Array): number => 0.25);
      expect(r).assertEqual(0.25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_7100
     * @tc.name int32ArrayReducePart03Test071
     * @tc.desc Verify callback returns 1.0/3.0 preserving float precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 1);
      let r: number = arr.reduce((p: number, _c: number, _i: int, _a: Int32Array): number => p / 3.0);
      let expected: number = 1.0 / 3.0;
      expect(Math.round(r * 1e10)).assertEqual(Math.round(expected * 1e10));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_7200
     * @tc.name int32ArrayReducePart03Test072
     * @tc.desc Verify callback returns -0, asserted as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r: number = arr.reduce((_p: number, _c: number, _i: int, _a: Int32Array): number => -0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_7300
     * @tc.name int32ArrayReducePart03Test073
     * @tc.desc Verify callback returns Infinity, final returns Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r: number = arr.reduce((_p: number, _c: number, _i: int, _a: Int32Array): number => Number.POSITIVE_INFINITY);
      expect(r).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_7400
     * @tc.name int32ArrayReducePart03Test074
     * @tc.desc Verify reduce does not change original array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_7500
     * @tc.name int32ArrayReducePart03Test075
     * @tc.desc Verify reduce does not modify original array elements (read-only traversal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(11, 22, 33, 44);
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(arr.$_get(0)).assertEqual(11);
      expect(arr.$_get(1)).assertEqual(22);
      expect(arr.$_get(2)).assertEqual(33);
      expect(arr.$_get(3)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_7600
     * @tc.name int32ArrayReducePart03Test076
     * @tc.desc Verify two consecutive calls with different callbacks return different results (not cached)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let rSum: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      let rProd: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p * c);
      expect(rSum).assertEqual(6);
      expect(rProd).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_7700
     * @tc.name int32ArrayReducePart03Test077
     * @tc.desc Verify multiply-by-zero [4,5,0,7] result is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(4, 5, 0, 7);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p * c);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_7800
     * @tc.name int32ArrayReducePart03Test078
     * @tc.desc Verify find last non-zero element (returns curr when c!=0, else prev)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 0, 3, 0, 4);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => c !== 0 ? c : p);
      expect(r).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_7900
     * @tc.name int32ArrayReducePart03Test079
     * @tc.desc Verify successive division with initial value 10000 yields 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2, 5, 10);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p / c, 10000);
      expect(r).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_8000
     * @tc.name int32ArrayReducePart03Test080
     * @tc.desc Verify callbackfn cast from number literal throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      try {
        let notFn: Object = 123 as Object;
        arr.reduce(notFn as (p: number, c: number, i: int, a: Int32Array) => number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_8100
     * @tc.name int32ArrayReducePart03Test081
     * @tc.desc Verify callbackfn cast from string literal throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      try {
        let notFn: Object = 'hello' as Object;
        arr.reduce(notFn as (p: number, c: number, i: int, a: Int32Array) => number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_8200
     * @tc.name int32ArrayReducePart03Test082
     * @tc.desc Verify empty Int32Array default constructor throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array();
      try {
        arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_8300
     * @tc.name int32ArrayReducePart03Test083
     * @tc.desc Verify thrown Error is Error instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let isInstance: boolean = false;
      try {
        arr.reduce((_p: number, _c: number, _i: int, _a: Int32Array): number => {
          expect(_c).assertEqual(2);
          throw new Error('x');
        });
      } catch (e) {
        isInstance = true;
        expect(e.name).assertEqual('Error');
      }
      expect(isInstance).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_8400
     * @tc.name int32ArrayReducePart03Test084
     * @tc.desc Verify length=1 array callback that throws is never invoked, returns element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(55);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        throw new Error('never');
      });
      expect(r).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_8500
     * @tc.name int32ArrayReducePart03Test085
     * @tc.desc Verify ArrayBuffer constructed view reduce reads consistent data from sibling view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let viewA: Int32Array = new Int32Array(buf, 0, 4);
      let viewB: Int32Array = new Int32Array(buf, 0, 4);
      viewA.$_set(0, 1);
      viewA.$_set(1, 2);
      viewA.$_set(2, 3);
      viewA.$_set(3, 4);
      let ok: boolean = true;
      viewA.reduce((p: number, c: number, i: int, _a: Int32Array): number => {
        if (viewB.$_get(i) !== c) {
          ok = false;
        }
        return p + c;
      });
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_8600
     * @tc.name int32ArrayReducePart03Test086
     * @tc.desc Verify callback sibling view write to buffer, reduce next round curr reads new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let viewA: Int32Array = new Int32Array(buf, 0, 4);
      let viewB: Int32Array = new Int32Array(buf, 0, 4);
      viewA.$_set(0, 1);
      viewA.$_set(1, 2);
      viewA.$_set(2, 3);
      viewA.$_set(3, 4);
      let thirdC: number = 0;
      let calls: int = 0;
      viewA.reduce((p: number, c: number, i: int, _a: Int32Array): number => {
        calls = calls + 1;
        if (calls === 1) {
          viewB.$_set(i + 1, 99);
        }
        if (calls === 2) {
          thirdC = c;
        }
        return p + c;
      });
      expect(thirdC).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART03_8700
     * @tc.name int32ArrayReducePart03Test087
     * @tc.desc Verify non-zero byteOffset view reduce result matches standalone array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart03Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let view: Int32Array = new Int32Array(buf, 8, 3);
      view.$_set(0, 6);
      view.$_set(1, 7);
      view.$_set(2, 8);
      let standalone: Int32Array = Int32Array.of(6, 7, 8);
      let r1: number = view.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      let r2: number = standalone.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(21);
    });



  });
}
