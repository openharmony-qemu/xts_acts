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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

function isMatchInt16SomePart01(element: number, index: int, array: Int16Array): boolean {
  return element === 9;
}

export default function Int16ArraySomeTest02(): void {
  describe('Int16ArraySomeTest02', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_0100
     * @tc.name testInt16ArraySomeTestTwo001
     * @tc.desc Verify some() matches with greater-than predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 50, 4]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element > 30;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_0200
     * @tc.name testInt16ArraySomeTestTwo002
     * @tc.desc Verify some() short-circuits after first match callCount 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let callCount: int = 0;
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        callCount++;
        return element === 1;
      });
      expect(result).assertTrue();
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_0300
     * @tc.name testInt16ArraySomeTestTwo003
     * @tc.desc Verify some() visits only index 0 on first-element match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let visitedIndices: number[] = [];
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        visitedIndices.push(index);
        return element === 1;
      });
      let r1: int = visitedIndices.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = visitedIndices[0];
      let e2: int = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_0400
     * @tc.name testInt16ArraySomeTestTwo004
     * @tc.desc Verify some() callCount is 2 when match at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40]);
      let callCount: int = 0;
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        callCount++;
        return element === 20;
      });
      expect(result).assertTrue();
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_0500
     * @tc.name testInt16ArraySomeTestTwo005
     * @tc.desc Verify some() callCount is length when match is last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 9]);
      let callCount: int = 0;
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        callCount++;
        return element === 9;
      });
      expect(result).assertTrue();
      expect(callCount).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_0600
     * @tc.name testInt16ArraySomeTestTwo006
     * @tc.desc Verify some() does not call predicate on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([]);
      let callCount: int = 0;
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        callCount++;
        return true;
      });
      expect(result).assertFalse();
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_0700
     * @tc.name testInt16ArraySomeTestTwo007
     * @tc.desc Verify some() returns false when no element exceeds threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element > 999;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_0800
     * @tc.name testInt16ArraySomeTestTwo008
     * @tc.desc Verify some() returns false when all equal non-target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([8, 8, 8, 8]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 5;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_0900
     * @tc.name testInt16ArraySomeTestTwo009
     * @tc.desc Verify some() visits all elements when no match callCount length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let callCount: int = 0;
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        callCount++;
        return element > 999;
      });
      expect(result).assertFalse();
      expect(callCount).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_1000
     * @tc.name testInt16ArraySomeTestTwo010
     * @tc.desc Verify some() does not change length after true match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let lenBefore: int = arr.length;
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 3;
      });
      let r1: int = arr.length;
      let e1: int = lenBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_1100
     * @tc.name testInt16ArraySomeTestTwo011
     * @tc.desc Verify some() does not change length after false match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let lenBefore: int = arr.length;
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element < 0;
      });
      let r1: int = arr.length;
      let e1: int = lenBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_1200
     * @tc.name testInt16ArraySomeTestTwo012
     * @tc.desc Verify some() keeps empty array length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([]);
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 0;
      });
      let r1: int = arr.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_1300
     * @tc.name testInt16ArraySomeTestTwo013
     * @tc.desc Verify some() keeps length when predicate always false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 10, 15, 20, 25]);
      let lenBefore: int = arr.length;
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        return false;
      });
      let r1: int = arr.length;
      let e1: int = lenBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_1400
     * @tc.name testInt16ArraySomeTestTwo014
     * @tc.desc Verify some() leaves length typeof as int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element > 0;
      });
      let r1: string = typeof arr.length;
      let e1: string = 'int';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_1500
     * @tc.name testInt16ArraySomeTestTwo015
     * @tc.desc Verify some() leaves length non-negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element > 0;
      });
      let r1: boolean = arr.length >= 0;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_1600
     * @tc.name testInt16ArraySomeTestTwo016
     * @tc.desc Verify some() keeps single-element length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([42]);
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 42;
      });
      let r1: int = arr.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_1700
     * @tc.name testInt16ArraySomeTestTwo017
     * @tc.desc Verify some() does not change byteLength after match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
      let byteLenBefore: int = arr.byteLength;
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 2;
      });
      let r1: int = arr.byteLength;
      let e1: int = byteLenBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_1800
     * @tc.name testInt16ArraySomeTestTwo018
     * @tc.desc Verify some() does not change byteLength after no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
      let byteLenBefore: int = arr.byteLength;
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element < 0;
      });
      let r1: int = arr.byteLength;
      let e1: int = byteLenBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_1900
     * @tc.name testInt16ArraySomeTestTwo019
     * @tc.desc Verify some() keeps empty array byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([]);
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 0;
      });
      let r1: int = arr.byteLength;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_2000
     * @tc.name testInt16ArraySomeTestTwo020
     * @tc.desc Verify some() keeps byteLength equal to length * BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element > 0;
      });
      let r1: int = arr.byteLength;
      let e1: int = arr.length * Int16Array.BYTES_PER_ELEMENT;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_2100
     * @tc.name testInt16ArraySomeTestTwo021
     * @tc.desc Verify some() leaves byteLength non-negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element < 0;
      });
      let r1: boolean = arr.byteLength >= 0;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_2200
     * @tc.name testInt16ArraySomeTestTwo022
     * @tc.desc Verify some() keeps byteLength multiple of 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 10;
      });
      let r1: int = arr.byteLength % 2;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_2300
     * @tc.name testInt16ArraySomeTestTwo023
     * @tc.desc Verify some() keeps byteLength after early match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let byteLenBefore: int = arr.byteLength;
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 1;
      });
      let r1: int = arr.byteLength;
      let e1: int = byteLenBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_2400
     * @tc.name testInt16ArraySomeTestTwo024
     * @tc.desc Verify some() does not mutate $_get(0) after match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40]);
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 20;
      });
      let r1: number = arr.$_get(0);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_2500
     * @tc.name testInt16ArraySomeTestTwo025
     * @tc.desc Verify some() does not mutate matched element via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 25, 30, 40]);
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 25;
      });
      let r1: number = arr.$_get(1);
      let e1: int = 25;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_2600
     * @tc.name testInt16ArraySomeTestTwo026
     * @tc.desc Verify some() preserves all elements after no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 15, 25]);
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element > 999;
      });
      let r1: number = arr.$_get(0);
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 15;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: int = 25;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_2700
     * @tc.name testInt16ArraySomeTestTwo027
     * @tc.desc Verify some() preserves remaining elements after early match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7, 8, 9, 10]);
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 7;
      });
      let r1: number = arr.$_get(1);
      let e1: int = 8;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(2);
      let e2: int = 9;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(3);
      let e3: int = 10;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_2800
     * @tc.name testInt16ArraySomeTestTwo028
     * @tc.desc Verify some() keeps same object reference after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let ref: Int16Array = arr;
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 2;
      });
      let r1: boolean = ref === arr;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_2900
     * @tc.name testInt16ArraySomeTestTwo029
     * @tc.desc Verify some() keeps length after all-match predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
      let lenBefore: int = arr.length;
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element > 0;
      });
      let r1: int = arr.length;
      let e1: int = lenBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_3000
     * @tc.name testInt16ArraySomeTestTwo030
     * @tc.desc Verify some() keeps same buffer reference after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let buf: ArrayBuffer = arr.buffer;
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 2;
      });
      let r1: boolean = arr.buffer === buf;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_3100
     * @tc.name testInt16ArraySomeTestTwo031
     * @tc.desc Verify some() keeps buffer.byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
      let bufByteLen: int = arr.buffer.byteLength;
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element > 0;
      });
      let r1: int = arr.buffer.byteLength;
      let e1: int = bufByteLen;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_3200
     * @tc.name testInt16ArraySomeTestTwo032
     * @tc.desc Verify some() keeps byteOffset unchanged on offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 2, 2);
      let offsetBefore: int = arr.byteOffset;
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 0;
      });
      let r1: int = arr.byteOffset;
      let e1: int = offsetBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_3300
     * @tc.name testInt16ArraySomeTestTwo033
     * @tc.desc Verify some() does not change BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element > 0;
      });
      let r1: int = Int16Array.BYTES_PER_ELEMENT;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_3400
     * @tc.name testInt16ArraySomeTestTwo034
     * @tc.desc Verify some() on parent keeps subarray buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      let sub: Int16Array = parent.subarray(1, 4);
      let subBuf: ArrayBuffer = sub.buffer;
      parent.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 30;
      });
      let r1: boolean = sub.buffer === subBuf;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_3500
     * @tc.name testInt16ArraySomeTestTwo035
     * @tc.desc Verify some() on parent keeps subarray byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      let sub: Int16Array = parent.subarray(1, 4);
      let subOffset: int = sub.byteOffset;
      parent.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 30;
      });
      let r1: int = sub.byteOffset;
      let e1: int = subOffset;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_3600
     * @tc.name testInt16ArraySomeTestTwo036
     * @tc.desc Verify some() on parent keeps subarray length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      let sub: Int16Array = parent.subarray(1, 4);
      let subLen: int = sub.length;
      parent.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 30;
      });
      let r1: int = sub.length;
      let e1: int = subLen;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_3700
     * @tc.name testInt16ArraySomeTestTwo037
     * @tc.desc Verify some() on shared buffer view1 keeps view2 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let view1: Int16Array = new Int16Array(buf, 0, 3);
      let view2: Int16Array = new Int16Array(buf, 2, 3);
      let view2Len: int = view2.length;
      view1.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 0;
      });
      let r1: int = view2.length;
      let e1: int = view2Len;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_3800
     * @tc.name testInt16ArraySomeTestTwo038
     * @tc.desc Verify some() on shared buffer view1 keeps view2 byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let view1: Int16Array = new Int16Array(buf, 0, 3);
      let view2: Int16Array = new Int16Array(buf, 2, 3);
      let view2Offset: int = view2.byteOffset;
      view1.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 0;
      });
      let r1: int = view2.byteOffset;
      let e1: int = view2Offset;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_3900
     * @tc.name testInt16ArraySomeTestTwo039
     * @tc.desc Verify some() on shared buffer view1 keeps view2 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let view1: Int16Array = new Int16Array(buf, 0, 3);
      let view2: Int16Array = new Int16Array(buf, 2, 3);
      let view2Buf: ArrayBuffer = view2.buffer;
      view1.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 0;
      });
      let r1: boolean = view2.buffer === view2Buf;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_4000
     * @tc.name testInt16ArraySomeTestTwo040
     * @tc.desc Verify some() on shared buffer does not mutate sibling view values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view1: Int16Array = new Int16Array(buf, 0, 4);
      view1.$_set(0, 100);
      view1.$_set(1, 200);
      view1.$_set(2, 300);
      view1.$_set(3, 400);
      let view2: Int16Array = new Int16Array(buf, 2, 2);
      let v2e0: number = view2.$_get(0);
      let v2e1: number = view2.$_get(1);
      view1.some((element: number, index: int, array: Int16Array): boolean => {
        return element > 500;
      });
      let r1: number = view2.$_get(0);
      let e1: number = v2e0;
      expect(r1).assertEqual(e1);
      let r2: number = view2.$_get(1);
      let e2: number = v2e1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_4100
     * @tc.name testInt16ArraySomeTestTwo041
     * @tc.desc Verify some() predicate can compare element with array.$_get(index)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === array.$_get(index);
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_4200
     * @tc.name testInt16ArraySomeTestTwo042
     * @tc.desc Verify some() predicate can use index and element together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return index === 1 && element === 20;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_4300
     * @tc.name testInt16ArraySomeTestTwo043
     * @tc.desc Verify some() third argument array is original array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 10, 15]);
      let ref: Int16Array = arr;
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return array === ref;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_4400
     * @tc.name testInt16ArraySomeTestTwo044
     * @tc.desc Verify some() supports compound predicate with index parity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([3, 7, 11, 14]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element > 5 && element < 15 && index % 2 === 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_4500
     * @tc.name testInt16ArraySomeTestTwo045
     * @tc.desc Verify some() can match element equal to array.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === array.length;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_4600
     * @tc.name testInt16ArraySomeTestTwo046
     * @tc.desc Verify some() works on Int16Array.of constructed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 20;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_4700
     * @tc.name testInt16ArraySomeTestTwo047
     * @tc.desc Verify some() finds zero on new Int16Array(length) zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(5);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_4800
     * @tc.name testInt16ArraySomeTestTwo048
     * @tc.desc Verify some() works on ArrayBuffer-backed partial view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let full: Int16Array = new Int16Array(buf, 0, 6);
      full.$_set(0, 1);
      full.$_set(1, 2);
      full.$_set(2, 3);
      full.$_set(3, 4);
      full.$_set(4, 5);
      full.$_set(5, 6);
      let view: Int16Array = new Int16Array(buf, 4, 2);
      let result: boolean = view.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 4;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_4900
     * @tc.name testInt16ArraySomeTestTwo049
     * @tc.desc Verify some() works on subarray and finds first sub element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int16Array = new Int16Array([100, 200, 300, 400, 500]);
      let sub: Int16Array = parent.subarray(1, 4);
      let result: boolean = sub.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 200;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_5000
     * @tc.name testInt16ArraySomeTestTwo050
     * @tc.desc Verify some() on subarray visits only sub length elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let sub: Int16Array = parent.subarray(0, 2);
      let callCount: int = 0;
      let result: boolean = sub.some((element: number, index: int, array: Int16Array): boolean => {
        callCount++;
        return element === 999;
      });
      expect(result).assertFalse();
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_5100
     * @tc.name testInt16ArraySomeTestTwo051
     * @tc.desc Verify some() repeated calls return equal results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let result1: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element > 3;
      });
      let result2: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element > 3;
      });
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_5200
     * @tc.name testInt16ArraySomeTestTwo052
     * @tc.desc Verify some() true result is usable in if branch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 2;
      });
      let entered: boolean = false;
      if (result) {
        entered = true;
      }
      expect(entered).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_5300
     * @tc.name testInt16ArraySomeTestTwo053
     * @tc.desc Verify some() false result is usable in if-not branch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element > 999;
      });
      let entered: boolean = false;
      if (!result) {
        entered = true;
      }
      expect(entered).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_5400
     * @tc.name testInt16ArraySomeTestTwo054
     * @tc.desc Verify some() false result negates to true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element > 999;
      });
      let r1: boolean = !result;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_5500
     * @tc.name testInt16ArraySomeTestTwo055
     * @tc.desc Verify some() can combine two some() results with and
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let hasTwo: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 2;
      });
      let hasThree: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 3;
      });
      let r1: boolean = hasTwo && hasThree;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_5600
     * @tc.name testInt16ArraySomeTestTwo056
     * @tc.desc Verify some() with single predicate returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element > 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_5700
     * @tc.name testInt16ArraySomeTestTwo057
     * @tc.desc Verify some() predicate throw is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      try {
        arr.some((element: number, index: int, array: Int16Array): boolean => {
          throw new Error('predicate error at index 0');
        });
        expect().assertFail();
      } catch (e) {
        let r1: string = e.name;
        let e1: string = 'Error';
        expect(r1).assertEqual(e1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_5800
     * @tc.name testInt16ArraySomeTestTwo058
     * @tc.desc Verify some() predicate throw TypeError is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      try {
        arr.some((element: number, index: int, array: Int16Array): boolean => {
          throw new TypeError('type error in predicate');
        });
        expect().assertFail();
      } catch (e) {
        let r2: string = e.name;
        let e2: string = 'TypeError';
        expect(r2).assertEqual(e2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_5900
     * @tc.name testInt16ArraySomeTestTwo059
     * @tc.desc Verify some() predicate throw RangeError is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      try {
        arr.some((element: number, index: int, array: Int16Array): boolean => {
          throw new RangeError('range error in predicate');
        });
        expect().assertFail();
      } catch (e) {
        let r3: string = e.name;
        let e3: string = 'RangeError';
        expect(r3).assertEqual(e3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_6000
     * @tc.name testInt16ArraySomeTestTwo060
     * @tc.desc Verify some() predicate throws Error at middle index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      try {
        arr.some((element: number, index: int, array: Int16Array): boolean => {
          if (index === 2) {
            throw new Error('throw at middle element');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        let r4: string = e.name;
        let e4: string = 'Error';
        expect(r4).assertEqual(e4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_6100
     * @tc.name testInt16ArraySomeTestTwo061
     * @tc.desc Verify some() predicate throws Error at last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7, 8, 9]);
      let callCount: int = 0;
      try {
        arr.some((element: number, index: int, array: Int16Array): boolean => {
          callCount++;
          if (index === arr.length - 1) {
            throw new Error('throw at last element');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        let r5: string = e.name;
        let e5: string = 'Error';
        expect(r5).assertEqual(e5);
        expect(callCount).assertEqual(arr.length);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_6200
     * @tc.name testInt16ArraySomeTestTwo062
     * @tc.desc Verify some() predicate conditional throw by element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 10, 15, 20, 25]);
      try {
        arr.some((element: number, index: int, array: Int16Array): boolean => {
          if (element === 15) {
            throw new Error('throw when element is 15');
          }
          return element > 30;
        });
        expect().assertFail();
      } catch (e) {
        let r6: string = e.name;
        let e6: string = 'Error';
        expect(r6).assertEqual(e6);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_6300
     * @tc.name testInt16ArraySomeTestTwo063
     * @tc.desc Verify some() stops visiting elements after predicate throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let visitedCount: int = 0;
      try {
        arr.some((element: number, index: int, array: Int16Array): boolean => {
          visitedCount++;
          if (index === 1) {
            throw new Error('stop at index 1');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(visitedCount).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_6400
     * @tc.name testInt16ArraySomeTestTwo064
     * @tc.desc Verify some() array contents unchanged after predicate throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40]);
      try {
        arr.some((element: number, index: int, array: Int16Array): boolean => {
          if (index === 1) {
            throw new Error('break');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        let r1: number = arr.$_get(0);
        let e1: int = 10;
        expect(r1).assertEqual(e1);
        let r2: number = arr.$_get(1);
        let e2: int = 20;
        expect(r2).assertEqual(e2);
        let r3: number = arr.$_get(2);
        let e3: int = 30;
        expect(r3).assertEqual(e3);
        let r4: number = arr.$_get(3);
        let e4: int = 40;
        expect(r4).assertEqual(e4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_6500
     * @tc.name testInt16ArraySomeTestTwo065
     * @tc.desc Verify some() external side effects remain after predicate throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([2, 4, 6]);
      let sideEffect: number = 0;
      try {
        arr.some((element: number, index: int, array: Int16Array): boolean => {
          sideEffect = element;
          if (index === 1) {
            throw new Error('throw after side effect');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(sideEffect).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_6600
     * @tc.name testInt16ArraySomeTestTwo066
     * @tc.desc Verify some() nested helper throw propagates outside
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let helper: () => boolean = (): boolean => {
        throw new Error('nested throw');
      };
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      try {
        arr.some((element: number, index: int, array: Int16Array): boolean => {
          return helper();
        });
        expect().assertFail();
      } catch (e) {
        let r8: string = e.name;
        let e8: string = 'Error';
        expect(r8).assertEqual(e8);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_6700
     * @tc.name testInt16ArraySomeTestTwo067
     * @tc.desc Verify some() predicate Error message is accessible outside
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([99]);
      let errMsg: string = 'custom-message-xyz';
      try {
        arr.some((element: number, index: int, array: Int16Array): boolean => {
          throw new Error(errMsg);
        });
        expect().assertFail();
      } catch (e) {
        let r1: string = e.message;
        let e1: string = errMsg;
        expect(r1).assertEqual(e1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_6800
     * @tc.name testInt16ArraySomeTestTwo068
     * @tc.desc Verify some() only first predicate throw propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
      try {
        arr.some((element: number, index: int, array: Int16Array): boolean => {
          if (index >= 1) {
            throw new Error('throw from index ' + index.toString());
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        let r9: string = e.name;
        let e9: string = 'Error';
        expect(r9).assertEqual(e9);
        let r10: string = e.message;
        let e10: string = 'throw from index 1';
        expect(r10).assertEqual(e10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_6900
     * @tc.name testInt16ArraySomeTestTwo069
     * @tc.desc Verify some() predicate throw RangeError is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([50]);
      try {
        arr.some((element: number, index: int, array: Int16Array): boolean => {
          throw new RangeError('out of some range');
        });
        expect().assertFail();
      } catch (e) {
        let r11: string = e.name;
        let e11: string = 'RangeError';
        expect(r11).assertEqual(e11);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_7000
     * @tc.name testInt16ArraySomeTestTwo070
     * @tc.desc Verify empty some() never calls predicate so throw path is unreachable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let called: boolean = false;
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        called = true;
        throw new Error('should never reach');
      });
      expect(result).assertFalse();
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_7100
     * @tc.name testInt16ArraySomeTestTwo071
     * @tc.desc Verify some() $_set current element does not change element arg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 10, 15]);
      let capturedElement: number = 0;
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        capturedElement = element;
        array.$_set(index, 999);
        return element > 100;
      });
      expect(capturedElement).assertEqual(15);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_7200
     * @tc.name testInt16ArraySomeTestTwo072
     * @tc.desc Verify some() $_set future element is seen on later visit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
      let futureElement: number = 0;
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.$_set(2, 999);
          return false;
        }
        if (index === 2) {
          futureElement = element;
        }
        return element === 999;
      });
      expect(futureElement).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_TWO_7300
     * @tc.name testInt16ArraySomeTestTwo073
     * @tc.desc Verify some() $_set past element does not rewrite visited snapshot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([3, 6, 9, 12]);
      let visited: Array<number> = [];
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        visited.push(element);
        if (index === 2) {
          array.$_set(0, 777);
        }
        return false;
      });
      expect(result).assertFalse();
      let r1: number = visited[0];
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });
  });
}
