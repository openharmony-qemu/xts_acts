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

export default function Int32ArrayReducePart05Test(): void {
  describe('Int32ArrayReducePart05Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_0100
     * @tc.name int32ArrayReducePart05Test001
     * @tc.desc Verify arity=1 (no initialValue) dispatches to non-generic overload, returns number sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_0200
     * @tc.name int32ArrayReducePart05Test002
     * @tc.desc Verify callback+boolean initialValue dispatches to generic overload U=boolean, all-even detection; Also verify verify U=boolean some semantic (exists negative), array with negative returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2, 4, 6);
      let r: boolean = arr.reduce((p: boolean, c: number, _i: int, _a: Int32Array): boolean => p && c % 2 === 0, true);
      expect(r).assertTrue();

      {
      let arr: Int32Array = Int32Array.of(1, -2, 3);
      let r: boolean = arr.reduce((p: boolean, c: number, _i: int, _a: Int32Array): boolean => p || c < 0, false);
      expect(r).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_0300
     * @tc.name int32ArrayReducePart05Test003
     * @tc.desc Verify two overloads on same non-empty array produce equal numeric sum (dispatch equivalence)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let noInitResult: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      let rg: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(noInitResult).assertEqual(100);
      expect(rg).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_0400
     * @tc.name int32ArrayReducePart05Test004
     * @tc.desc Verify no-init first prev=arr[0], first index=1 (verify dispatch starting point)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9);
      let firstPrev: number = 999;
      let firstIdx: int = -1;
      let hit: boolean = false;
      arr.reduce((p: number, c: number, i: int, _a: Int32Array): number => {
        if (!hit) {
          firstPrev = p;
          firstIdx = i;
          hit = true;
        }
        return p + c;
      });
      expect(firstPrev).assertEqual(7);
      expect(firstIdx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_0500
     * @tc.name int32ArrayReducePart05Test005
     * @tc.desc Verify with-init=0 first prev=0, first index=0 (contrast with no-init)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9);
      let firstPrev: number = 999;
      let firstIdx: int = -1;
      let hit: boolean = false;
      arr.reduce((p: number, c: number, i: int, _a: Int32Array): number => {
        if (!hit) {
          firstPrev = p;
          firstIdx = i;
          hit = true;
        }
        return p + c;
      }, 0);
      expect(firstPrev).assertEqual(0);
      expect(firstIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_0600
     * @tc.name int32ArrayReducePart05Test006
     * @tc.desc Verify two overloads callback call counts differ by 1 (no-init: length-1, with-init: length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let cn: int = 0;
      let cg: int = 0;
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        cn = cn + 1;
        return p + c;
      });
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        cg = cg + 1;
        return p + c;
      }, 0);
      expect(cn).assertEqual(3);
      expect(cg).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_0700
     * @tc.name int32ArrayReducePart05Test007
     * @tc.desc Verify U=string explicit generic with empty initial returns string not any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(4, 5);
      let r: string = arr.reduce((p: string, c: number, _i: int, _a: Int32Array): string => p + '-' + c.toString(), '');
      expect(r).assertEqual('-4-5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_0800
     * @tc.name int32ArrayReducePart05Test008
     * @tc.desc Verify U=boolean all-odd array every semantic returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 3, 4);
      let r: boolean = arr.reduce((p: boolean, c: number, _i: int, _a: Int32Array): boolean => p && c % 2 === 1, true);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_0900
     * @tc.name int32ArrayReducePart05Test009
     * @tc.desc Verify with-init empty array (initialValue='hi') returns init directly, no callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let called: boolean = false;
      let r: string = arr.reduce((p: string, c: number, _i: int, _a: Int32Array): string => {
        called = true;
        return p;
      }, 'hi');
      expect(r).assertEqual('hi');
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_1000
     * @tc.name int32ArrayReducePart05Test010
     * @tc.desc Verify with-init empty array (initialValue=true) returns true, no callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let called: boolean = false;
      let r: boolean = arr.reduce((p: boolean, c: number, _i: int, _a: Int32Array): boolean => {
        called = true;
        return p;
      }, true);
      expect(r).assertTrue();
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_1100
     * @tc.name int32ArrayReducePart05Test011
     * @tc.desc Verify with-init empty array (initialValue=0) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_1200
     * @tc.name int32ArrayReducePart05Test012
     * @tc.desc Verify single element no-init returns element directly, no callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let called: boolean = false;
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        called = true;
        return p + c;
      });
      expect(r).assertEqual(42);
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_1300
     * @tc.name int32ArrayReducePart05Test013
     * @tc.desc Verify single element with-init=100 triggers callback once, prev=100, curr=42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let calls: int = 0;
      let seenPrev: number = 0;
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        calls = calls + 1;
        seenPrev = p;
        return p + c;
      }, 100);
      expect(calls).assertEqual(1);
      expect(seenPrev).assertEqual(100);
      expect(r).assertEqual(142);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_1400
     * @tc.name int32ArrayReducePart05Test014
     * @tc.desc Verify no-init single element INT_MIN returns INT_MIN directly, no callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648);
      let called: boolean = false;
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        called = true;
        return p + c;
      });
      expect(r).assertEqual(-2147483648);
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_1500
     * @tc.name int32ArrayReducePart05Test015
     * @tc.desc Verify no-init single element 0 returns 0 directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_1600
     * @tc.name int32ArrayReducePart05Test016
     * @tc.desc Verify no-init two-element array first element negative, prev captures that negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-7, 3);
      let capturedPrev: number = 0;
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        capturedPrev = p;
        return p + c;
      });
      expect(capturedPrev).assertEqual(-7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_1700
     * @tc.name int32ArrayReducePart05Test017
     * @tc.desc Verify two overloads product on 3-element array results consistent; Also verify verify with-init=0 max on all-negative array results in 0 (seed affects result)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2, 3, 4);
      let pn: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p * c);
      let pg: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p * c, 1);
      expect(pn).assertEqual(24);
      expect(pg).assertEqual(24);

      {
      let arr: Int32Array = Int32Array.of(-3, -7, -2);
      let mxNo: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p > c ? p : c);
      let mxWith: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p > c ? p : c, 0);
      expect(mxNo).assertEqual(-2);
      expect(mxWith).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_1800
     * @tc.name int32ArrayReducePart05Test018
     * @tc.desc Verify with-init=INT_MAX+1 (2147483648.0 number), add 1, prev operates as number without truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 2147483648.0);
      expect(r).assertEqual(2147483649.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_1900
     * @tc.name int32ArrayReducePart05Test019
     * @tc.desc Verify callback mid-element throws transparently, original array length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let len0: int = arr.length;
      try {
        arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
          if (c === 3) {
            throw new Error('stop');
          }
          return p + c;
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.length).assertEqual(len0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_2000
     * @tc.name int32ArrayReducePart05Test020
     * @tc.desc Verify callback throw, all original array elements remain unmodified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      try {
        arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
          if (c === 30) {
            throw new Error('boom');
          }
          return p + c;
        }, 0);
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_2100
     * @tc.name int32ArrayReducePart05Test021
     * @tc.desc Verify callback throw, ArrayBuffer reference identity unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      arr.$_set(3, 4);
      try {
        arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
          if (c === 3) {
            throw new Error('x');
          }
          return p + c;
        }, 0);
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_2200
     * @tc.name int32ArrayReducePart05Test022
     * @tc.desc Verify callback throw, byteOffset preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let arr: Int32Array = new Int32Array(buf, 4, 3);
      try {
        arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
          expect(c).assertEqual(0);
          throw new Error('y');
        }, 0);
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_2300
     * @tc.name int32ArrayReducePart05Test023
     * @tc.desc Verify callback throw, byteLength preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      try {
        arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
          expect(c).assertEqual(2);
          throw new Error('z');
        });
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_2400
     * @tc.name int32ArrayReducePart05Test024
     * @tc.desc Verify callback throw, error message transparently propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      try {
        arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
          expect(c).assertEqual(1);
          throw new Error('marker-xyz');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_2500
     * @tc.name int32ArrayReducePart05Test025
     * @tc.desc Verify after callback throw, calling reduce again still works (instance not destroyed)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      try {
        arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
          expect(c).assertEqual(1);
          throw new Error('e1');
        }, 0);
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      let sum: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_2600
     * @tc.name int32ArrayReducePart05Test026
     * @tc.desc Verify callback first step (with-init i=0) throws, original first element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6, 7);
      try {
        arr.reduce((p: number, c: number, i: int, _a: Int32Array): number => {
          if (i === 0) {
            throw new Error('first');
          }
          return p + c;
        }, 100);
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_2700
     * @tc.name int32ArrayReducePart05Test027
     * @tc.desc Verify no-init empty array throws TypeError but instance still usable afterwards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      try {
        arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_2800
     * @tc.name int32ArrayReducePart05Test028
     * @tc.desc Verify callback writes via array param then throws, catch can read written value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      try {
        arr.reduce((p: number, c: number, i: int, a: Int32Array): number => {
          a.$_set(i, 99);
          throw new Error('after-write');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_2900
     * @tc.name int32ArrayReducePart05Test029
     * @tc.desc Verify callback throw, closure-recorded iterated index stops at throw position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let seenIdx: int = -1;
      try {
        arr.reduce((p: number, c: number, i: int, _a: Int32Array): number => {
          seenIdx = i;
          if (i === 2) {
            throw new Error('stop');
          }
          return p + c;
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(seenIdx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_3000
     * @tc.name int32ArrayReducePart05Test030
     * @tc.desc Verify with-init(string) return value typeof is string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r: string = arr.reduce((p: string, c: number, _i: int, _a: Int32Array): string => p + c.toString(), '');
      expect(r).assertEqual('12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_3100
     * @tc.name int32ArrayReducePart05Test031
     * @tc.desc Verify reduce number result toString() is correct decimal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r.toString()).assertEqual('60');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_3200
     * @tc.name int32ArrayReducePart05Test032
     * @tc.desc Verify both overloads do not return Int32Array instance (aggregation returns scalar)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let noInitResult: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      let rs: string = arr.reduce((p: string, c: number, _i: int, _a: Int32Array): string => p + c.toString(), '');
      expect(noInitResult).assertEqual(3);
      expect(rs).assertEqual('12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_3300
     * @tc.name int32ArrayReducePart05Test033
     * @tc.desc Verify after reduce call, original array still writable ($_set/$_get works)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let sum: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(sum).assertEqual(6);
      arr.$_set(0, 100);
      expect(arr.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_3400
     * @tc.name int32ArrayReducePart05Test034
     * @tc.desc Verify after reduce call, length/byteLength/byteOffset remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let arr: Int32Array = new Int32Array(buf, 8, 2);
      let len0: int = arr.length;
      let bl0: int = arr.byteLength;
      let bo0: int = arr.byteOffset;
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(arr.length).assertEqual(len0);
      expect(arr.byteLength).assertEqual(bl0);
      expect(arr.byteOffset).assertEqual(bo0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_3500
     * @tc.name int32ArrayReducePart05Test035
     * @tc.desc Verify reduce does not modify array (pure read aggregation), join result unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 1, 2);
      let before: string = arr.join(',');
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      let after: string = arr.join(',');
      expect(before).assertEqual(after);
      expect(after).assertEqual('3,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_3600
     * @tc.name int32ArrayReducePart05Test036
     * @tc.desc Verify return string result length property is string length (concat 4 single digits)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let s: string = arr.reduce((p: string, c: number, _i: int, _a: Int32Array): string => p + c.toString(), '');
      expect(s.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_3700
     * @tc.name int32ArrayReducePart05Test037
     * @tc.desc Verify same array two consecutive reduce same callback+init, results idempotent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9);
      let r1: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      let r2: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_3800
     * @tc.name int32ArrayReducePart05Test038
     * @tc.desc Verify sum exceeding int32 range returns number (2147483647+1=2147483648.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, 1);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r).assertEqual(2147483648.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_3900
     * @tc.name int32ArrayReducePart05Test039
     * @tc.desc Verify INT_MAX+INT_MIN sum is -1 (number arithmetic, not truncated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, -2147483648);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_4000
     * @tc.name int32ArrayReducePart05Test040
     * @tc.desc Verify empty array with-init returns init with identity consistency (===)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let seed: string = 'sentinel-v';
      let r: string = arr.reduce((p: string, c: number, _i: int, _a: Int32Array): string => p + c.toString(), seed);
      expect(r).assertEqual(seed);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_4100
     * @tc.name int32ArrayReducePart05Test041
     * @tc.desc Verify with-init callback array param identical reference to original (===)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let same: boolean = false;
      arr.reduce((p: number, c: number, i: int, a: Int32Array): number => {
        if (i === 0) {
          same = a === arr;
        }
        return p + c;
      }, 0);
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_4200
     * @tc.name int32ArrayReducePart05Test042
     * @tc.desc Verify no-init callback array param identical reference to original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6);
      let same: boolean = false;
      arr.reduce((p: number, c: number, _i: int, a: Int32Array): number => {
        same = a === arr;
        return p + c;
      });
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_4300
     * @tc.name int32ArrayReducePart05Test043
     * @tc.desc Verify callback array param across multiple rounds always points to same object (stable reference)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let firstRef: Object | undefined = undefined;
      let sameAll: boolean = true;
      arr.reduce((p: number, c: number, _i: int, a: Int32Array): number => {
        if (firstRef === undefined) {
          firstRef = a;
        } else {
          sameAll = sameAll && (a === firstRef);
        }
        return p + c;
      }, 0);
      expect(sameAll).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_4400
     * @tc.name int32ArrayReducePart05Test044
     * @tc.desc Verify callback array.$_set modifies subsequent element, later iterations read modified value (no snapshot)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 1, 1, 1);
      let seen: number[] = [];
      arr.reduce((p: number, c: number, i: int, a: Int32Array): number => {
        seen.push(c);
        if (i + 1 < a.length) {
          a.$_set(i + 1, c + 10);
        }
        return p + c;
      }, 0);
      expect(seen[0]).assertEqual(1);
      expect(seen[1]).assertEqual(11);
      expect(seen[2]).assertEqual(21);
      expect(seen[3]).assertEqual(31);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_4500
     * @tc.name int32ArrayReducePart05Test045
     * @tc.desc Verify same ArrayBuffer two views, reduce callback writing via one view visible through other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a1: Int32Array = new Int32Array(buf, 0, 4);
      let a2: Int32Array = new Int32Array(buf, 0, 4);
      a1.$_set(0, 0);
      a1.$_set(1, 0);
      a1.$_set(2, 0);
      a1.$_set(3, 0);
      a1.reduce((p: number, c: number, i: int, _a: Int32Array): number => {
        a2.$_set(i, c + 100);
        return p + c;
      }, 0);
      expect(a1.$_get(0)).assertEqual(100);
      expect(a1.$_get(1)).assertEqual(100);
      expect(a1.$_get(2)).assertEqual(100);
      expect(a1.$_get(3)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_4600
     * @tc.name int32ArrayReducePart05Test046
     * @tc.desc Verify subarray view reduce, callback array param points to subarray itself (not parent)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let sub: Int32Array = arr.subarray(1, 3);
      let seenLen: int = -1;
      let sameAsSub: boolean = false;
      sub.reduce((p: number, c: number, _i: int, a: Int32Array): number => {
        if (seenLen === -1) {
          seenLen = a.length;
          sameAsSub = a === sub;
        }
        return p + c;
      }, 0);
      expect(seenLen).assertEqual(2);
      expect(sameAsSub).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_4700
     * @tc.name int32ArrayReducePart05Test047
     * @tc.desc Verify subarray view reduce with array.$_set modifies element, parent visible (shared buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let sub: Int32Array = arr.subarray(1, 4);
      sub.reduce((p: number, c: number, i: int, a: Int32Array): number => {
        a.$_set(i, c * 10);
        return p + c;
      }, 0);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
      expect(arr.$_get(3)).assertEqual(40);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_4800
     * @tc.name int32ArrayReducePart05Test048
     * @tc.desc Verify non-zero byteOffset view reduce, callback array.byteOffset preserves construction offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let view: Int32Array = new Int32Array(buf, 8, 2);
      view.$_set(0, 77);
      view.$_set(1, 88);
      let off: int = -1;
      view.reduce((p: number, c: number, _i: int, a: Int32Array): number => {
        if (off === -1) {
          off = a.byteOffset;
        }
        return p + c;
      }, 0);
      expect(off).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_4900
     * @tc.name int32ArrayReducePart05Test049
     * @tc.desc Verify two views on same buffer, buffer property reference equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = new Int32Array(buf);
      a.$_set(0, 1);
      a.$_set(1, 2);
      a.reduce((p: number, c: number, _i: int, ar: Int32Array): number => p + c, 0);
      expect(a.buffer).assertEqual(b.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_5000
     * @tc.name int32ArrayReducePart05Test050
     * @tc.desc Verify reduce iteration closure external array shared modification (all iterations share closure state)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let acc: number[] = [];
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        acc.push(c + p);
        return p + c;
      }, 0);
      expect(acc.length).assertEqual(3);
      expect(acc[0]).assertEqual(1);
      expect(acc[1]).assertEqual(3);
      expect(acc[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_5100
     * @tc.name int32ArrayReducePart05Test051
     * @tc.desc Verify no-init callback receives values 10 and 20 in order with index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20);
      let prev: number = 0;
      let curr: number = 0;
      let seenIndex: int = -1;
      let seenLength: int = 0;
      arr.reduce((p: number, c: number, i: int, a: Int32Array): number => {
        prev = p;
        curr = c;
        seenIndex = i;
        seenLength = a.length;
        return p + c;
      });
      expect(prev).assertEqual(10);
      expect(curr).assertEqual(20);
      expect(seenIndex).assertEqual(1);
      expect(seenLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_5200
     * @tc.name int32ArrayReducePart05Test052
     * @tc.desc Verify with-init callback receives initial value 0 and element 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10);
      let prev: number = -1;
      let curr: number = -1;
      let seenIndex: int = -1;
      let seenLength: int = 0;
      arr.reduce((p: number, c: number, _i: int, a: Int32Array): number => {
        prev = p;
        curr = c;
        seenIndex = _i;
        seenLength = a.length;
        return p + c;
      }, 0);
      expect(prev).assertEqual(0);
      expect(curr).assertEqual(10);
      expect(seenIndex).assertEqual(0);
      expect(seenLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_5300
     * @tc.name int32ArrayReducePart05Test053
     * @tc.desc Verify with-init string callback receives '' and element 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let prev: string = 'unset';
      let curr: number = -1;
      arr.reduce((p: string, c: number, _i: int, _a: Int32Array): string => {
        prev = p;
        curr = c;
        return p + c.toString();
      }, '');
      expect(prev).assertEqual('');
      expect(curr).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_5400
     * @tc.name int32ArrayReducePart05Test054
     * @tc.desc Verify callback returns decimal (prev as number), subsequent prev preserves decimal (no ToInt32 truncation)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 1, 1);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c + 0.5, 0);
      expect(r).assertEqual(4.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_5500
     * @tc.name int32ArrayReducePart05Test055
     * @tc.desc Verify callback returns NaN, subsequent prev stays NaN (NaN propagation)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: number = arr.reduce((p: number, c: number, i: int, _a: Int32Array): number => {
        if (i === 1) {
          return Number.NaN;
        }
        return p + c;
      }, 0);
      expect(isNaN(r)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_5600
     * @tc.name int32ArrayReducePart05Test056
     * @tc.desc Verify callback array.length stable across all iterations (even if elements written)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let lens: number[] = [];
      arr.reduce((p: number, c: number, _i: int, a: Int32Array): number => {
        lens.push(a.length);
        a.$_set(0, 99);
        return p + c;
      }, 0);
      expect(lens[0]).assertEqual(4);
      expect(lens[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_5700
     * @tc.name int32ArrayReducePart05Test057
     * @tc.desc Verify no-init multi-element first prev=curr[idx-1], curr=arr[idx], idx=1 triple consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(77, 88, 99);
      let fP: number = 0;
      let fC: number = 0;
      let fI: int = -1;
      let hit: boolean = false;
      arr.reduce((p: number, c: number, i: int, _a: Int32Array): number => {
        if (!hit) {
          fP = p;
          fC = c;
          fI = i;
          hit = true;
        }
        return p + c;
      });
      expect(fP).assertEqual(77);
      expect(fC).assertEqual(88);
      expect(fI).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_5800
     * @tc.name int32ArrayReducePart05Test058
     * @tc.desc Verify with-init multi-element first prev=init, curr=arr[0], idx=0 triple consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(77, 88, 99);
      let fP: number = 0;
      let fC: number = 0;
      let fI: int = -1;
      let hit: boolean = false;
      arr.reduce((p: number, c: number, i: int, _a: Int32Array): number => {
        if (!hit) {
          fP = p;
          fC = c;
          fI = i;
          hit = true;
        }
        return p + c;
      }, 55);
      expect(fP).assertEqual(55);
      expect(fC).assertEqual(77);
      expect(fI).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_5900
     * @tc.name int32ArrayReducePart05Test059
     * @tc.desc Verify two overloads sum (no-init vs init=0) on array with both signs, results consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, -3, 9, 0);
      let r1: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      let r2: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r1).assertEqual(13);
      expect(r2).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_6000
     * @tc.name int32ArrayReducePart05Test060
     * @tc.desc Verify two overloads max (positive array) results consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 7, 2, 9, 5);
      let r1: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p > c ? p : c);
      let r2: number =
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p > c ? p : c, -2147483648);
      expect(r1).assertEqual(9);
      expect(r2).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_6100
     * @tc.name int32ArrayReducePart05Test061
     * @tc.desc Verify two overloads min (including negatives) results consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-5, 2, -9, 0, 3);
      let r1: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p < c ? p : c);
      let r2: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p < c ? p : c, 2147483647);
      expect(r1).assertEqual(-9);
      expect(r2).assertEqual(-9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_6200
     * @tc.name int32ArrayReducePart05Test062
     * @tc.desc Verify U=number sum of squares aggregation (initialValue=0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c * c, 0);
      expect(r).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_6300
     * @tc.name int32ArrayReducePart05Test063
     * @tc.desc Verify U=number count evens (initialValue=0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6);
      let r: number =
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + (c % 2 === 0 ? 1 : 0), 0);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_6400
     * @tc.name int32ArrayReducePart05Test064
     * @tc.desc Verify U=string comma-separated join (no leading/trailing comma)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: string = arr.reduce((p: string, c: number, i: int, _a: Int32Array): string => {
        if (i === 0) {
          return c.toString();
        }
        return p + ',' + c.toString();
      }, '');
      expect(r).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_6500
     * @tc.name int32ArrayReducePart05Test065
     * @tc.desc Verify array with NaN via ToInt32 becomes 0, no-init sum includes 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(0, 10);
      arr.$_set(1, Number.NaN as number);
      arr.$_set(2, 20);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_6600
     * @tc.name int32ArrayReducePart05Test066
     * @tc.desc Verify initialValue=1.5 decimal accumulates, prev transparent not ToInt32 truncated (prev not TypedArray element)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 1.5);
      expect(r).assertEqual(4.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_6700
     * @tc.name int32ArrayReducePart05Test067
     * @tc.desc Verify initialValue=-Infinity max correctly picks max element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 7, 2);
      let r: number =
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p > c ? p : c, Number.NEGATIVE_INFINITY);
      expect(r).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_6800
     * @tc.name int32ArrayReducePart05Test068
     * @tc.desc Verify initialValue=NaN result always NaN (NaN contamination)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, Number.NaN);
      expect(isNaN(r)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_6900
     * @tc.name int32ArrayReducePart05Test069
     * @tc.desc Verify chain call: first reduce result as second reduce initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Int32Array = Int32Array.of(1, 2, 3);
      let a2: Int32Array = Int32Array.of(10, 20);
      let s1: number = a1.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      let s2: number = a2.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, s1);
      expect(s1).assertEqual(6);
      expect(s2).assertEqual(36);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_7000
     * @tc.name int32ArrayReducePart05Test070
     * @tc.desc Verify chain U=string: first reduce concat string, second continues on top
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let b: Int32Array = Int32Array.of(3, 4);
      let sa: string = a.reduce((p: string, c: number, _i: int, _a: Int32Array): string => p + c.toString(), '');
      let sb: string = b.reduce((p: string, c: number, _i: int, _a: Int32Array): string => p + c.toString(), sa);
      expect(sa).assertEqual('12');
      expect(sb).assertEqual('1234');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_7100
     * @tc.name int32ArrayReducePart05Test071
     * @tc.desc Verify after reduce array still traversable via indexed for loop, element values correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6, 7);
      let sum: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      let collected: number[] = [];
      for (let i: int = 0; i < arr.length; i = i + 1) {
        collected.push(arr.$_get(i));
      }
      expect(sum).assertEqual(18);
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(5);
      expect(collected[2]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART05_7200
     * @tc.name int32ArrayReducePart05Test072
     * @tc.desc Verify large array (1024 elements) reduce sum result correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart05Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: int = 1024;
      let arr: Int32Array = new Int32Array(n);
      let expected: number = 0;
      for (let i: int = 0; i < n; i = i + 1) {
        let v: int = i % 7;
        arr.$_set(i, v);
        expected = expected + v;
      }
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(expected);
    });
  });
}
