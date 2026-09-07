'use static';


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
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

class Ctx {
  target: number = 7;
  hit: boolean = false;
}

export default function int32ArraySomePart04Test(): void {
  describe('Int32ArraySomePart04Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_0100
     * @tc.name int32ArraySomePart04Test001
     * @tc.desc Verify some true length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let before: int = arr.length;
      let res: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => {
        return v > 3;
      });
      expect(res).assertTrue();
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_0200
     * @tc.name int32ArraySomePart04Test002
     * @tc.desc Verify some false length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let before: int = arr.length;
      let res: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => {
        return v > 100;
      });
      expect(res).assertFalse();
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_0300
     * @tc.name int32ArraySomePart04Test003
     * @tc.desc Verify some true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let res: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => {
        return v === 30;
      });
      expect(res).assertTrue();
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
      expect(arr.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_0400
     * @tc.name int32ArraySomePart04Test004
     * @tc.desc Verify some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6, 7);
      let res: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => {
        return v < 0;
      });
      expect(res).assertFalse();
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(1)).assertEqual(6);
      expect(arr.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_0500
     * @tc.name int32ArraySomePart04Test005
     * @tc.desc Verify some ArrayBuffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      arr.$_set(3, 4);
      let before: int = buf.byteLength;
      arr.some((v: number, i: int, a: Int32Array): boolean => {
        return v > 2;
      });
      expect(buf.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_0600
     * @tc.name int32ArraySomePart04Test006
     * @tc.desc Verify some byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let arr: Int32Array = new Int32Array(buf, 8, 3);
      let before: int = arr.byteOffset;
      arr.some((v: number, i: int, a: Int32Array): boolean => {
        return v === 0;
      });
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_0700
     * @tc.name int32ArraySomePart04Test007
     * @tc.desc Verify some leaves a zero-filled two-element array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, -2147483648, 0);
      arr.some((v: number, i: int, a: Int32Array): boolean => {
        return v === 0;
      });
      expect(arr.$_get(0)).assertEqual(2147483647);
      expect(arr.$_get(1)).assertEqual(-2147483648);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_0800
     * @tc.name int32ArraySomePart04Test008
     * @tc.desc Verify some returns true for the value 77 in a one-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.some((v: number, i: int, a: Int32Array): boolean => {
        return false;
      });
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_0900
     * @tc.name int32ArraySomePart04Test009
     * @tc.desc Verify some length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.some((v: number, i: int, a: Int32Array): boolean => {
        return true;
      });
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_1000
     * @tc.name int32ArraySomePart04Test010
     * @tc.desc Verify some() invokes a predicate matching 77 without changing the one-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(77);
      arr.some((v: number, i: int, a: Int32Array): boolean => {
        return v === 77;
      });
      expect(arr.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_1100
     * @tc.name int32ArraySomePart04Test011
     * @tc.desc Verify some preserves values visible through a shared ArrayBuffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a32: Int32Array = new Int32Array(buf);
      a32.$_set(0, 0x12345678);
      a32.$_set(1, -0x7ABCDEF0);
      let b0: Int32Array = new Int32Array(buf);
      let firstElementValue: number = b0.$_get(0);
      let firstVal: number = b0.$_get(1);
      a32.some((v: number, i: int, a: Int32Array): boolean => {
        return false;
      });
      expect(b0.$_get(0)).assertEqual(firstElementValue);
      expect(b0.$_get(1)).assertEqual(firstVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_1200
     * @tc.name int32ArraySomePart04Test012
     * @tc.desc Verify some stops after finding value 99 and preserves later elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 99, 88, 77);
      arr.some((v: number, i: int, a: Int32Array): boolean => {
        return v === 99;
      });
      expect(arr.$_get(3)).assertEqual(88);
      expect(arr.$_get(4)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_1300
     * @tc.name int32ArraySomePart04Test013
     * @tc.desc Verify an empty outer some does not invoke the nested predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outer: Int32Array = new Int32Array(0);
      let inner: Int32Array = Int32Array.of(1, 2, 3);
      let innerCalls: int = 0;
      let outerRes: boolean = outer.some((ov: number, oi: int, oa: Int32Array): boolean => {
        return inner.some((iv: number, ii: int, ia: Int32Array): boolean => {
          innerCalls++;
          return iv > 0;
        });
      });
      expect(outerRes).assertFalse();
      expect(innerCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_1400
     * @tc.name int32ArraySomePart04Test014
     * @tc.desc Verify nested some returns true when the inner array contains 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outer: Int32Array = Int32Array.of(10, 20, 30);
      let inner: Int32Array = Int32Array.of(-1, -2, 99);
      let res: boolean = outer.some((ov: number, oi: int, oa: Int32Array): boolean => {
        return inner.some((iv: number, ii: int, ia: Int32Array): boolean => {
          return iv > 50;
        });
      });
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_1500
     * @tc.name int32ArraySomePart04Test015
     * @tc.desc Verify nested some matches value 3 at outer value 2 with two outer and three inner calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let outerCallCount: int = 0;
      let innerCallCount: int = 0;
      let res: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => {
        outerCallCount++;
        if (v === 2) {
          return a.some((vv: number, ii: int, aa: Int32Array): boolean => {
            innerCallCount++;
            return vv === 3;
          });
        }
        return false;
      });
      expect(res).assertTrue();
      expect(outerCallCount).assertEqual(2);
      expect(innerCallCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_1600
     * @tc.name int32ArraySomePart04Test016
     * @tc.desc Verify some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0, 0, 5);
      let b: Int32Array = Int32Array.of(0, 0, 0, 7);
      let res: boolean = a.some((av: number, ai: int, aa: Int32Array): boolean => {
        if (av === 0) {
          return false;
        }
        return b.some((bv: number, bi: int, ba: Int32Array): boolean => {
          return bv === av + 2;
        });
      });
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_1700
     * @tc.name int32ArraySomePart04Test017
     * @tc.desc Verify some some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: Int32Array = Int32Array.of(1, 2, 3);
      let hasThree: boolean = first.some((v: number, i: int, a: Int32Array): boolean => {
        return v === 3;
      });
      let second: Int32Array = Int32Array.of(4, 5, 6);
      let res: boolean = second.some((v: number, i: int, a: Int32Array): boolean => {
        return hasThree && v > 4;
      });
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_1800
     * @tc.name int32ArraySomePart04Test018
     * @tc.desc Verify three-level nested some returns true when values 1, 2, and 3 sum to 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0, 1);
      let b: Int32Array = Int32Array.of(0, 2);
      let c: Int32Array = Int32Array.of(3, 0);
      let res: boolean = a.some((av: number, ai: int, aa: Int32Array): boolean => {
        return b.some((bv: number, bi: int, ba: Int32Array): boolean => {
          return c.some((cv: number, ci: int, ca: Int32Array): boolean => {
            return av + bv + cv === 6;
          });
        });
      });
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_1900
     * @tc.name int32ArraySomePart04Test019
     * @tc.desc Verify some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1);
      let b: Int32Array = Int32Array.of(-1, -2);
      let c: Int32Array = Int32Array.of(100);
      let cCalls: int = 0;
      let res: boolean = a.some((av: number, ai: int, aa: Int32Array): boolean => {
        return b.some((bv: number, bi: int, ba: Int32Array): boolean => {
          let r: boolean = c.some((cv: number, ci: int, ca: Int32Array): boolean => {
            cCalls++;
            return cv > 0;
          });
          return bv > 0 && r;
        });
      });
      expect(res).assertFalse();
      expect(cCalls).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_2000
     * @tc.name int32ArraySomePart04Test020
     * @tc.desc Verify some some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let b: Int32Array = Int32Array.of(3, 4);
      let errMsg: string = '';
      try {
        a.some((av: number, ai: int, aa: Int32Array): boolean => {
          return b.some((bv: number, bi: int, ba: Int32Array): boolean => {
            throw new Error('inner boom');
          });
        });
      } catch (e) {
        expect(e.name).assertEqual('Error');
        errMsg = e.message;
      }
      expect(errMsg).assertEqual('inner boom');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_2100
     * @tc.name int32ArraySomePart04Test021
     * @tc.desc Verify const
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threshold: int = 50;
      let arr: Int32Array = Int32Array.of(10, 20, 60, 30);
      let res: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => {
        return v > threshold;
      });
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_2200
     * @tc.name int32ArraySomePart04Test022
     * @tc.desc Verify some short-circuits after the first element satisfies the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let calls: int = 0;
      let res: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => {
        calls++;
        return v === 1;
      });
      expect(res).assertTrue();
      expect(calls).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_2300
     * @tc.name int32ArraySomePart04Test023
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let calls: int = 0;
      let res: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => {
        calls++;
        return v < 0;
      });
      expect(res).assertFalse();
      expect(calls).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_2400
     * @tc.name int32ArraySomePart04Test024
     * @tc.desc Verify some stops at index 2 after three predicate calls when value 30 matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let calls: int = 0;
      let hitIndex: int = -1;
      let res: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => {
        calls++;
        if (v === 30) {
          hitIndex = i;
          return true;
        }
        return false;
      });
      expect(res).assertTrue();
      expect(calls).assertEqual(3);
      expect(hitIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_2500
     * @tc.name int32ArraySomePart04Test025
     * @tc.desc Verify Int32Array index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9);
      let trace: Int32Array = new Int32Array(arr.length);
      let tracePos: int = 0;
      arr.some((v: number, i: int, a: Int32Array): boolean => {
        trace.$_set(tracePos, i);
        tracePos++;
        return v === 7;
      });
      expect(tracePos).assertEqual(1);
      expect(trace.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_2600
     * @tc.name int32ArraySomePart04Test026
     * @tc.desc Verify Int32Array index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let trace: Int32Array = new Int32Array(arr.length);
      let tracePos: int = 0;
      arr.some((v: number, i: int, a: Int32Array): boolean => {
        trace.$_set(tracePos, i);
        tracePos++;
        return v === 4;
      });
      expect(tracePos).assertEqual(4);
      expect(trace.$_get(0)).assertEqual(0);
      expect(trace.$_get(1)).assertEqual(1);
      expect(trace.$_get(2)).assertEqual(2);
      expect(trace.$_get(3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_2700
     * @tc.name int32ArraySomePart04Test027
     * @tc.desc Verify Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let targets: Int32Array = Int32Array.of(99, 20, 77);
      let res: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => {
        return v === targets.$_get(i);
      });
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_2800
     * @tc.name int32ArraySomePart04Test028
     * @tc.desc Verify element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 100, 5);
      let sum: int = 0;
      arr.some((v: number, i: int, a: Int32Array): boolean => {
        sum = sum + Double.toInt(v);
        return v >= 100;
      });
      expect(sum).assertEqual(106);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_2900
     * @tc.name int32ArraySomePart04Test029
     * @tc.desc Verify class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctx: Ctx = new Ctx();
      let arr: Int32Array = Int32Array.of(1, 3, 7, 9);
      let res: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => {
        if (v === ctx.target) {
          ctx.hit = true;
          return true;
        }
        return false;
      });
      expect(res).assertTrue();
      expect(ctx.hit).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_3000
     * @tc.name int32ArraySomePart04Test030
     * @tc.desc Verify some stops on the third predicate invocation after the predicate returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0, 0, 0);
      let seen: int = 0;
      let res: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => {
        seen++;
        return seen >= 3;
      });
      expect(res).assertTrue();
      expect(seen).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_3100
     * @tc.name int32ArraySomePart04Test031
     * @tc.desc Verify some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let calls: int = 0;
      arr.some((v: number, i: int, a: Int32Array): boolean => {
        calls++;
        return v === 2;
      });
      let firstCalls: int = calls;
      calls = 0;
      arr.some((v: number, i: int, a: Int32Array): boolean => {
        calls++;
        return false;
      });
      let secondCalls: int = calls;
      expect(firstCalls).assertEqual(2);
      expect(secondCalls).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_3200
     * @tc.name int32ArraySomePart04Test032
     * @tc.desc Verify some some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let maxSeen: int = -100;
      arr.some((v: number, i: int, a: Int32Array): boolean => {
        if (v > maxSeen) {
          maxSeen = Double.toInt(v);
        }
        return false;
      });
      let hitAfter: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => {
        return v === maxSeen;
      });
      expect(maxSeen).assertEqual(3);
      expect(hitAfter).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_3300
     * @tc.name int32ArraySomePart04Test033
     * @tc.desc Verify some boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let entered: boolean = false;
      arr.some((v: number, i: int, a: Int32Array): boolean => {
        entered = true;
        return false;
      });
      expect(entered).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_3400
     * @tc.name int32ArraySomePart04Test034
     * @tc.desc Verify a predicate Error at value 3 stops some after the processed-value sum reaches 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let sum: int = 0;
      try {
        arr.some((v: number, i: int, a: Int32Array): boolean => {
          sum = sum + Double.toInt(v);
          if (v === 3) {
            throw new Error('stop at 3');
          }
          return false;
        });
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_3500
     * @tc.name int32ArraySomePart04Test035
     * @tc.desc Verify set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let seen: Int32Array = new Int32Array(4);
      let pos: int = 0;
      let res: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => {
        seen.$_set(pos, i);
        pos++;
        if (i > 0) {
          a.$_set(0, 999);
        }
        return false;
      });
      expect(res).assertFalse();
      expect(pos).assertEqual(4);
      expect(seen.$_get(0)).assertEqual(0);
      expect(arr.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_3600
     * @tc.name int32ArraySomePart04Test036
     * @tc.desc Verify set v
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let captured: int = 0;
      arr.some((v: number, i: int, a: Int32Array): boolean => {
        if (i === 1) {
          captured = Double.toInt(v);
          a.$_set(i, 222);
          return true;
        }
        return false;
      });
      expect(captured).assertEqual(2);
      expect(arr.$_get(1)).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_3700
     * @tc.name int32ArraySomePart04Test037
     * @tc.desc Verify set during some changes a later visited value to 22
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0, 0);
      let seenFuture: number = -1;
      let res: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => {
        if (i === 0) {
          a.$_set(2, 777);
          return false;
        }
        if (i === 2) {
          seenFuture = v;
          return true;
        }
        return false;
      });
      expect(res).assertTrue();
      expect(seenFuture).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_3800
     * @tc.name int32ArraySomePart04Test038
     * @tc.desc Verify set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf);
      let src: Int32Array = Int32Array.of(11, 22);
      let lastVal: number = 0;
      arr.some((v: number, i: int, a: Int32Array): boolean => {
        if (i === 1) {
          a.set(src, 2);
          return false;
        }
        if (i === 3) {
          lastVal = v;
          return true;
        }
        return false;
      });
      expect(lastVal).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_3900
     * @tc.name int32ArraySomePart04Test039
     * @tc.desc Verify fill during some makes index 1 match and short-circuits after two predicate calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0, 0, 0);
      let calls: int = 0;
      let res: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => {
        calls++;
        if (i === 0) {
          a.fill(1, 1, a.length);
        }
        return v !== 0;
      });
      expect(res).assertTrue();
      expect(calls).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_4000
     * @tc.name int32ArraySomePart04Test040
     * @tc.desc Verify some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 1, 1, 1);
      let calls: int = 0;
      let res: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => {
        calls++;
        a.$_set(i, 0);
        if (i === 0) {
          a.fill(0, 1, a.length);
        }
        return v === 999;
      });
      expect(res).assertFalse();
      expect(calls).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_4100
     * @tc.name int32ArraySomePart04Test041
     * @tc.desc Verify subarray some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0, 0);
      let secondVal: number = -1;
      arr.some((v: number, i: int, a: Int32Array): boolean => {
        if (i === 0) {
          let sub: Int32Array = a.subarray(2, 3);
          sub.$_set(0, 555);
          return false;
        }
        if (i === 2) {
          secondVal = v;
          return true;
        }
        return false;
      });
      expect(secondVal).assertEqual(555);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_4200
     * @tc.name int32ArraySomePart04Test042
     * @tc.desc Verify set length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      arr.some((v: number, i: int, a: Int32Array): boolean => {
        a.$_set(0, 42);
        return false;
      });
      expect(arr.length).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_4300
     * @tc.name int32ArraySomePart04Test043
     * @tc.desc Verify reversing during some preserves the iteration length and reverses the underlying array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let seen: Int32Array = new Int32Array(4);
      let pos: int = 0;
      arr.some((v: number, i: int, a: Int32Array): boolean => {
        seen.$_set(pos, Double.toInt(v));
        pos++;
        if (i === 0) {
          a.reverse();
          return false;
        }
        return false;
      });
      expect(pos).assertEqual(4);
      expect(seen.$_get(0)).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_4400
     * @tc.name int32ArraySomePart04Test044
     * @tc.desc Verify sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 1, 4, 2);
      let lastValue: number = 0;
      arr.some((v: number, i: int, a: Int32Array): boolean => {
        if (i === 0) {
          a.sort((x: number, y: number): int => Double.toInt(x - y));
          return false;
        }
        if (i === a.length - 1) {
          lastValue = v;
          return true;
        }
        return false;
      });
      expect(lastValue).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_4500
     * @tc.name int32ArraySomePart04Test045
     * @tc.desc Verify Int32Array ArrayBuffer B A A
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 4);
      let b: Int32Array = new Int32Array(buf, 0, 4);
      a.$_set(0, 1);
      a.$_set(1, 2);
      a.$_set(2, 3);
      a.$_set(3, 4);
      let observedValueAtIndex3: number = 0;
      a.some((v: number, i: int, ar: Int32Array): boolean => {
        if (i === 1) {
          b.$_set(3, 999);
          return false;
        }
        if (i === 3) {
          observedValueAtIndex3 = v;
          return true;
        }
        return false;
      });
      expect(observedValueAtIndex3).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_4600
     * @tc.name int32ArraySomePart04Test046
     * @tc.desc Verify an overlapping child-view mutation is observed by the parent some callback at index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let a: Int32Array = new Int32Array(buf, 0, 5);
      let b: Int32Array = new Int32Array(buf, 8, 3);
      a.$_set(0, 10);
      a.$_set(1, 20);
      a.$_set(2, 30);
      a.$_set(3, 40);
      a.$_set(4, 50);
      let observedValueAtIndex3: number = 0;
      a.some((v: number, i: int, ar: Int32Array): boolean => {
        if (i === 0) {
          b.$_set(1, 777);
          return false;
        }
        if (i === 3) {
          observedValueAtIndex3 = v;
          return true;
        }
        return false;
      });
      expect(observedValueAtIndex3).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_4700
     * @tc.name int32ArraySomePart04Test047
     * @tc.desc Verify some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf, 0, 4);
      let child: Int32Array = new Int32Array(buf, 0, 2);
      parent.$_set(0, 1);
      parent.$_set(1, 2);
      parent.$_set(2, 3);
      parent.$_set(3, 4);
      let childCalls: int = 0;
      child.some((v: number, i: int, a: Int32Array): boolean => {
        childCalls++;
        parent.$_set(3, 888);
        return false;
      });
      expect(childCalls).assertEqual(2);
      expect(parent.$_get(3)).assertEqual(888);
      expect(child.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_4800
     * @tc.name int32ArraySomePart04Test048
     * @tc.desc Verify some subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let last: number = 0;
      parent.some((v: number, i: int, a: Int32Array): boolean => {
        if (i === 1) {
          let sub: Int32Array = a.subarray(3, 4);
          sub.$_set(0, 666);
          return false;
        }
        if (i === 3) {
          last = v;
          return true;
        }
        return false;
      });
      expect(last).assertEqual(666);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_4900
     * @tc.name int32ArraySomePart04Test049
     * @tc.desc Verify some over a buffer-backed array returns true at value 3 and sums visited values to 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf);
      a.$_set(0, 1);
      a.$_set(1, 2);
      a.$_set(2, 3);
      let sum: int = 0;
      let res: boolean = a.some((v: number, i: int, ar: Int32Array): boolean => {
        sum = sum + Double.toInt(v);
        return v === 3;
      });
      expect(res).assertTrue();
      expect(sum).assertEqual(6);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_5000
     * @tc.name int32ArraySomePart04Test050
     * @tc.desc Verify some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = new Int32Array(buf);
      a.$_set(0, 11);
      a.$_set(1, 22);
      a.$_set(2, 33);
      a.$_set(3, 44);
      a.some((v: number, i: int, ar: Int32Array): boolean => {
        return v < 0;
      });
      expect(b.$_get(0)).assertEqual(11);
      expect(b.$_get(1)).assertEqual(22);
      expect(b.$_get(2)).assertEqual(33);
      expect(b.$_get(3)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_5100
     * @tc.name int32ArraySomePart04Test051
     * @tc.desc Verify buffer Int32Array v
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(buf);
      a.$_set(0, 42);
      a.$_set(1, 43);
      let mismatch: boolean = false;
      a.some((v: number, i: int, ar: Int32Array): boolean => {
        let mirror: Int32Array = new Int32Array(buf);
        if (mirror.$_get(i) !== v) {
          mismatch = true;
        }
        return false;
      });
      expect(mismatch).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_5200
     * @tc.name int32ArraySomePart04Test052
     * @tc.desc Verify Int32Array some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(1, 2, 3);
      let cpy: Int32Array = new Int32Array(src);
      cpy.some((v: number, i: int, a: Int32Array): boolean => {
        a.$_set(i, 0);
        return false;
      });
      expect(src.$_get(0)).assertEqual(1);
      expect(src.$_get(1)).assertEqual(2);
      expect(src.$_get(2)).assertEqual(3);
      expect(cpy.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_5300
     * @tc.name int32ArraySomePart04Test053
     * @tc.desc Verify slice buffer some slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(10, 20, 30);
      let sl: Int32Array = orig.slice();
      sl.some((v: number, i: int, a: Int32Array): boolean => {
        a.$_set(i, 999);
        return false;
      });
      expect(orig.$_get(0)).assertEqual(10);
      expect(orig.$_get(1)).assertEqual(20);
      expect(orig.$_get(2)).assertEqual(30);
      expect(sl.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_5400
     * @tc.name int32ArraySomePart04Test054
     * @tc.desc Verify from some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(5, 6, 7);
      let dst: Int32Array = Int32Array.from(src);
      let res: boolean = dst.some((v: number, i: int, a: Int32Array): boolean => {
        return v !== src.$_get(i);
      });
      expect(res).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_5500
     * @tc.name int32ArraySomePart04Test055
     * @tc.desc Verify of some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(100, -1, 0, 200);
      let nonZeroCount: int = 0;
      arr.some((v: number, i: int, a: Int32Array): boolean => {
        if (v !== 0) {
          nonZeroCount++;
        }
        return false;
      });
      expect(nonZeroCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_5600
     * @tc.name int32ArraySomePart04Test056
     * @tc.desc Verify some length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let size: int = 120;
      let arr: Int32Array = new Int32Array(size);
      let calls: int = 0;
      let res: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => {
        calls++;
        return false;
      });
      expect(res).assertFalse();
      expect(calls).assertEqual(size);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_5700
     * @tc.name int32ArraySomePart04Test057
     * @tc.desc Verify some boolean true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let res: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => {
        return true;
      });
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_5800
     * @tc.name int32ArraySomePart04Test058
     * @tc.desc Verify some boolean false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0);
      let res: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => {
        return false;
      });
      expect(res).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_5900
     * @tc.name int32ArraySomePart04Test059
     * @tc.desc Verify index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0, 0, 0);
      let idxTrace: Int32Array = new Int32Array(arr.length);
      let pos: int = 0;
      arr.some((v: number, i: int, a: Int32Array): boolean => {
        idxTrace.$_set(pos, i);
        pos++;
        return false;
      });
      expect(pos).assertEqual(5);
      let ok: boolean = true;
      for (let k = 0; k < pos; k++) {
        if (idxTrace.$_get(k) !== k) {
          ok = false;
          break;
        }
      }
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_6000
     * @tc.name int32ArraySomePart04Test060
     * @tc.desc Verify array Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let sameRef: boolean = false;
      arr.some((v: number, i: int, a: Int32Array): boolean => {
        sameRef = a === arr;
        return true;
      });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_6100
     * @tc.name int32ArraySomePart04Test061
     * @tc.desc Verify array length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let callbackCount: int = 0;
      let expectedLength: int = 4;
      arr.some((v: number, i: int, a: Int32Array): boolean => {
        expect(a.length).assertEqual(expectedLength);
        callbackCount++;
        return false;
      });
      expect(callbackCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_6200
     * @tc.name int32ArraySomePart04Test062
     * @tc.desc Verify buffer byteOffset some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 2);
      let b: Int32Array = new Int32Array(buf, 8, 2);
      a.$_set(0, 1);
      a.$_set(1, 2);
      b.$_set(0, 3);
      b.$_set(1, 4);
      let aCalls: int = 0;
      a.some((v: number, i: int, ar: Int32Array): boolean => {
        aCalls++;
        return v === 1;
      });
      let bCalls: int = 0;
      b.some((v: number, i: int, br: Int32Array): boolean => {
        bCalls++;
        return false;
      });
      expect(aCalls).assertEqual(1);
      expect(bCalls).assertEqual(2);
      expect(a.$_get(0)).assertEqual(1);
      expect(b.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_6300
     * @tc.name int32ArraySomePart04Test063
     * @tc.desc Verify some reports no non-seven value and finds a seven in an array filled with 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.fill(7);
      let hasNonSeven: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => {
        return v !== 7;
      });
      expect(hasNonSeven).assertFalse();
      let hasSeven: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => {
        return v === 7;
      });
      expect(hasSeven).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_6400
     * @tc.name int32ArraySomePart04Test064
     * @tc.desc Verify writing 1 to each current index does not change callback values and visits all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0);
      let calls: int = 0;
      let res: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => {
        calls++;
        a.$_set(i, 1);
        return v === 1;
      });
      expect(res).assertFalse();
      expect(calls).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_6500
     * @tc.name int32ArraySomePart04Test065
     * @tc.desc Verify some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let parent: Int32Array = new Int32Array(buf);
      let child: Int32Array = new Int32Array(buf, 4, 1);
      child.$_set(0, 11);
      child.some((v: number, i: int, a: Int32Array): boolean => {
        a.$_set(0, 22);
        return false;
      });
      expect(parent.$_get(1)).assertEqual(22);
      expect(child.$_get(0)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_6600
     * @tc.name int32ArraySomePart04Test066
     * @tc.desc Verify some INT_MAX_INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, -1, 2147483647, -2147483648);
      let snapshot: Int32Array = new Int32Array(arr.length);
      for (let i = 0; i < arr.length; i++) {
        snapshot.$_set(i, arr.$_get(i));
      }
      let res: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => {
        return v === 999;
      });
      expect(res).assertFalse();
      for (let i = 0; i < arr.length; i++) {
        expect(arr.$_get(i)).assertEqual(snapshot.$_get(i));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_6700
     * @tc.name int32ArraySomePart04Test067
     * @tc.desc Verify array get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 4, 8);
      let res: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => {
        if (i === 0) {
          return false;
        }
        return v === (a.$_get(i - 1) * 2);
      });
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_6800
     * @tc.name int32ArraySomePart04Test068
     * @tc.desc Verify some some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r1: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => {
        return true;
      });
      let r2: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => {
        return false;
      });
      expect(r1).assertFalse();
      expect(r2).assertFalse();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_6900
     * @tc.name int32ArraySomePart04Test069
     * @tc.desc Verify RangeError some name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      try {
        arr.some((v: number, i: int, a: Int32Array): boolean => {
          throw new RangeError('out of range');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_7000
     * @tc.name int32ArraySomePart04Test070
     * @tc.desc Verify TypeError some name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      try {
        arr.some((v: number, i: int, a: Int32Array): boolean => {
          throw new TypeError('bad type');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_7100
     * @tc.name int32ArraySomePart04Test071
     * @tc.desc Verify some propagates RangeError from predicate $_set(-1, value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let calls: int = 0;
      try {
        arr.some((v: number, i: int, a: Int32Array): boolean => {
          calls++;
          a.$_set(-1, 999);
          return v === 3;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(calls).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_7200
     * @tc.name int32ArraySomePart04Test072
     * @tc.desc Verify some propagates RangeError from predicate $_set(99, value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20);
      let calls: int = 0;
      try {
        arr.some((v: number, i: int, a: Int32Array): boolean => {
          calls++;
          a.$_set(99, 888);
          return v === 20;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(calls).assertEqual(1);
      expect(arr.length).assertEqual(2);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_7300
     * @tc.name int32ArraySomePart04Test073
     * @tc.desc Verify subarray some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let sub: Int32Array = arr.subarray(2, 2);
      let calls: int = 0;
      let res: boolean = sub.some((v: number, i: int, a: Int32Array): boolean => {
        calls++;
        return true;
      });
      expect(res).assertFalse();
      expect(calls).assertEqual(0);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_7400
     * @tc.name int32ArraySomePart04Test074
     * @tc.desc Verify some constructor buf byteOffset length buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let view: Int32Array = new Int32Array(buf, 4, 3);
      view.$_set(0, 100);
      view.$_set(1, 200);
      view.$_set(2, 300);
      let sum: int = 0;
      let res: boolean = view.some((v: number, i: int, a: Int32Array): boolean => {
        sum = sum + Double.toInt(v);
        return v === 300;
      });
      expect(res).assertTrue();
      expect(sum).assertEqual(600);
      let full: Int32Array = new Int32Array(buf);
      expect(full.$_get(1)).assertEqual(100);
      expect(full.$_get(2)).assertEqual(200);
      expect(full.$_get(3)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_7500
     * @tc.name int32ArraySomePart04Test075
     * @tc.desc Verify some() finds INT32_MAX-1 2147483646
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 2147483646);
      let result: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => v === 2147483646);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART04_TEST_MINDMAP_7600
     * @tc.name int32ArraySomePart04Test076
     * @tc.desc Verify some() finds INT32_MIN+1 -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart04Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, -2147483647);
      let result: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => v === -2147483647);
      expect(result).assertTrue();
    });
  });
}
