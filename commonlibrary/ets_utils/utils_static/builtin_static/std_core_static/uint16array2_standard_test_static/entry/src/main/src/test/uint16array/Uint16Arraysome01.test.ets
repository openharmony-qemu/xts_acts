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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint16ArraySomePart1Test(): void {
  describe('Uint16ArraySomePart1Test', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_0100
     * @tc.name testUint16ArraySomePart1001
       * @tc.desc Verify some finds a value greater than one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([0, 2, 3]);
        const result: boolean = arr.some((e: number): boolean => e > 1);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_0200
     * @tc.name testUint16ArraySomePart1002
       * @tc.desc Verify some matches the inclusive upper-bound value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([0, 20]);
        const result: boolean = arr.some((e: number): boolean => e >= 20);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_0300
     * @tc.name testUint16ArraySomePart1003
      * @tc.desc Verify an always-true predicate returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([5, 10, 15]);
        const result: boolean = arr.some((): boolean => true);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_0400
     * @tc.name testUint16ArraySomePart1004
      * @tc.desc Verify an always-false predicate returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([5, 10, 15]);
        const result: boolean = arr.some((): boolean => false);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_0500
     * @tc.name testUint16ArraySomePart1005
      * @tc.desc Verify some skips zero values to find a positive value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([0, 0, 5]);
        const result: boolean = arr.some((e: number): boolean => e > 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_0600
     * @tc.name testUint16ArraySomePart1006
      * @tc.desc Verify some finds zero between boundary values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([65535, 0, 1]);
        const result: boolean = arr.some((e: number): boolean => e === 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_0700
     * @tc.name testUint16ArraySomePart1007
      * @tc.desc Verify some finds the Uint16 maximum value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([0, 32768, 65535]);
        const result: boolean = arr.some((e: number): boolean => e === 65535);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_0800
     * @tc.name testUint16ArraySomePart1008
      * @tc.desc Verify some matches the Uint16 midpoint threshold
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([0, 1, 32768]);
        const result: boolean = arr.some((e: number): boolean => e >= 32768);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_0900
     * @tc.name testUint16ArraySomePart1009
      * @tc.desc Verify some identifies an even element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 3, 4]);
        const result: boolean = arr.some((e: number): boolean => e % 2 === 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_1000
     * @tc.name testUint16ArraySomePart1010
      * @tc.desc Verify some identifies an odd element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([2, 4, 5]);
        const result: boolean = arr.some((e: number): boolean => e % 2 !== 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_1100
     * @tc.name testUint16ArraySomePart1011
      * @tc.desc Verify some finds an element below one hundred
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([200, 300, 50]);
        const result: boolean = arr.some((e: number): boolean => e < 100);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_1200
     * @tc.name testUint16ArraySomePart1012
      * @tc.desc Verify some finds an element at least sixty thousand
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([100, 60000, 200]);
        const result: boolean = arr.some((e: number): boolean => e >= 60000);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_1300
     * @tc.name testUint16ArraySomePart1013
      * @tc.desc Verify some rejects values above the Uint16 range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([0, 1, 65535]);
        const result: boolean = arr.some((e: number): boolean => e > 65535);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_1400
     * @tc.name testUint16ArraySomePart1014
      * @tc.desc Verify some rejects a negative-value predicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([0, 1, 65535]);
        const result: boolean = arr.some((e: number): boolean => e < 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_1500
     * @tc.name testUint16ArraySomePart1015
      * @tc.desc Verify some returns false for an absent large value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([0, 32768, 65535]);
        const result: boolean = arr.some((e: number): boolean => e === 99999);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_1600
     * @tc.name testUint16ArraySomePart1016
      * @tc.desc Verify some returns false for an all-zero array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([0, 0, 0]);
        const result: boolean = arr.some((e: number): boolean => e < 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_1700
     * @tc.name testUint16ArraySomePart1017
      * @tc.desc Verify some rejects an unreachable negative index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([5, 10, 15]);
        const result: boolean = arr.some((e: number, i: int): boolean => i < 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_1800
     * @tc.name testUint16ArraySomePart1018
      * @tc.desc Verify some finds the final value above twenty-five
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([10, 20, 30]);
        const result: boolean = arr.some((e: number): boolean => e > 25);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_1900
     * @tc.name testUint16ArraySomePart1019
      * @tc.desc Verify some matches callback index two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([10, 20, 30]);
        const result: boolean = arr.some((e: number, i: int): boolean => i === 2);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_2000
     * @tc.name testUint16ArraySomePart1020
      * @tc.desc Verify callback receives first value and original array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([10, 20, 30]);
        let callCount: int = 0;
        const result: boolean = arr.some((e: number, i: int, a: Uint16Array): boolean => {
          callCount++;
          expect(e).assertEqual(10);
          expect(i).assertEqual(0);
          expect(a).assertEqual(arr);
          return true;
        });
        expect(result).assertTrue();
        expect(callCount).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_2100
     * @tc.name testUint16ArraySomePart1021
      * @tc.desc Verify some matches value fifteen at index one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([5, 15, 25]);
        const result: boolean = arr.some((e: number, i: int): boolean => e === 15 && i === 1);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_2200
     * @tc.name testUint16ArraySomePart1022
      * @tc.desc Verify callback matches value, index, and array together
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([5, 15, 25]);
        let callCount: int = 0;
        let matchedIndex: int = -1;
        const result: boolean = arr.some((e: number, i: int, a: Uint16Array): boolean => {
          callCount++;
          if (e === 15 && i === 1 && a === arr) {
            matchedIndex = i;
            return true;
          }
          return false;
        });
        expect(result).assertTrue();
        expect(matchedIndex).assertEqual(1);
        expect(callCount).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_2300
     * @tc.name testUint16ArraySomePart1023
      * @tc.desc Verify callback array argument is the source array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3]);
        let isSame: boolean = false;
        const result: boolean = arr.some((e: number, i: int, a: Uint16Array): boolean => {
          if (i === 0) {
            isSame = a === arr;
          }
          return false;
        });
        expect(isSame).assertTrue();
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_2400
     * @tc.name testUint16ArraySomePart1024
      * @tc.desc Verify callback array retains source length throughout traversal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3]);
        let lenMatch: boolean = true;
        let callCount: int = 0;
        let lastIndex: int = -1;
        arr.some((e: number, i: int, a: Uint16Array): boolean => {
          callCount++;
          lastIndex = i;
          if (a.length !== 3) {
            lenMatch = false;
          }
          return false;
        });
        expect(lenMatch).assertTrue();
        expect(callCount).assertEqual(3);
        expect(lastIndex).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_2500
     * @tc.name testUint16ArraySomePart1025
      * @tc.desc Verify callback array exposes Uint16Array values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3]);
        let callbackCalled: boolean = false;
        arr.some((e: number, i: int, a: Uint16Array): boolean => {
          if (i === 0) {
            callbackCalled = true;
            expect(a.length).assertEqual(3);
            expect(a[0]).assertEqual(1);
          }
          return false;
        });
        expect(callbackCalled).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_2600
     * @tc.name testUint16ArraySomePart1026
      * @tc.desc Verify some short-circuits on a first-element match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let callCount: number = 0;
        const result: boolean = arr.some((e: number): boolean => {
          callCount++;
          return e === 1;
        });
        expect(result).assertTrue();
        expect(callCount).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_2700
     * @tc.name testUint16ArraySomePart1027
      * @tc.desc Verify some stops after a middle-element match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
        let callCount: number = 0;
        const result: boolean = arr.some((e: number): boolean => {
          callCount++;
          return e === 30;
        });
        expect(result).assertTrue();
        expect(callCount).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_2800
     * @tc.name testUint16ArraySomePart1028
      * @tc.desc Verify some visits all elements for a final-element match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let callCount: number = 0;
        const result: boolean = arr.some((e: number): boolean => {
          callCount++;
          return e === 5;
        });
        expect(result).assertTrue();
        expect(callCount).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_2900
     * @tc.name testUint16ArraySomePart1029
      * @tc.desc Verify some visits every element when no match exists
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3]);
        let callCount: number = 0;
        const result: boolean = arr.some((e: number): boolean => {
          callCount++;
          return false;
        });
        expect(result).assertFalse();
        expect(callCount).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_3000
     * @tc.name testUint16ArraySomePart1030
      * @tc.desc Verify some short-circuits in a large array at index zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array(10000);
        arr[0] = 1;
        let callCount: number = 0;
        const result: boolean = arr.some((e: number): boolean => {
          callCount++;
          return e === 1;
        });
        expect(result).assertTrue();
        expect(callCount).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_3100
     * @tc.name testUint16ArraySomePart1031
      * @tc.desc Verify some reaches the final index in a large array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array(5000);
        arr[4999] = 99;
        let callCount: number = 0;
        const result: boolean = arr.some((e: number): boolean => {
          callCount++;
          return e === 99;
        });
        expect(result).assertTrue();
        expect(callCount).assertEqual(5000);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_3200
     * @tc.name testUint16ArraySomePart1032
      * @tc.desc Verify some reports every index before a final match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([0, 0, 0, 1]);
        let indices: number[] = [];
        const result: boolean = arr.some((e: number, i: int): boolean => {
          indices.push(i);
          return e === 1;
        });
        expect(result).assertTrue();
        expect(indices.length).assertEqual(4);
        expect(indices[0]).assertEqual(0);
        expect(indices[1]).assertEqual(1);
        expect(indices[2]).assertEqual(2);
        expect(indices[3]).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_3300
     * @tc.name testUint16ArraySomePart1033
      * @tc.desc Verify some reaches the sixth element before matching
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([0, 0, 0, 0, 0, 1]);
        let callCount: number = 0;
        const result: boolean = arr.some((e: number): boolean => {
          callCount++;
          return e === 1;
        });
        expect(result).assertTrue();
        expect(callCount).assertEqual(6);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_3400
     * @tc.name testUint16ArraySomePart1034
      * @tc.desc Verify some returns false for an empty Uint16Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array();
        const result: boolean = arr.some((e: number): boolean => true);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_3500
     * @tc.name testUint16ArraySomePart1035
      * @tc.desc Verify some matches a single equal element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([42]);
        const result: boolean = arr.some((e: number): boolean => e === 42);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_3600
     * @tc.name testUint16ArraySomePart1036
      * @tc.desc Verify some rejects a nonmatching single element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([42]);
        const result: boolean = arr.some((e: number): boolean => e === 99);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_3700
     * @tc.name testUint16ArraySomePart1037
      * @tc.desc Verify some matches zero in a single-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([0]);
        const result: boolean = arr.some((e: number): boolean => e === 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_3800
     * @tc.name testUint16ArraySomePart1038
      * @tc.desc Verify some matches Uint16 maximum in a single-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([65535]);
        const result: boolean = arr.some((e: number): boolean => e === 65535);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_3900
     * @tc.name testUint16ArraySomePart1039
      * @tc.desc Verify some matches either duplicate zero element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([0, 0]);
        const result: boolean = arr.some((e: number): boolean => e === 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_4000
     * @tc.name testUint16ArraySomePart1040
      * @tc.desc Verify some matches either duplicate Uint16 maximum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([65535, 65535]);
        const result: boolean = arr.some((e: number): boolean => e === 65535);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_4100
     * @tc.name testUint16ArraySomePart1041
      * @tc.desc Verify some finds a value above thirty thousand
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([0, 32768, 65535]);
        const result: boolean = arr.some((e: number): boolean => e > 30000);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_4200
     * @tc.name testUint16ArraySomePart1042
      * @tc.desc Verify Uint16Array truncates fractional constructor values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([3.14, 2.71, 1.618]);
        const result: boolean = arr.some((e: number): boolean => e === 3);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_4300
     * @tc.name testUint16ArraySomePart1043
      * @tc.desc Verify some rejects positive values in a zero-filled length-one-hundred array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array(100);
        const result: boolean = arr.some((e: number): boolean => e > 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_4400
     * @tc.name testUint16ArraySomePart1044
      * @tc.desc Verify some finds a value stored at index five hundred
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array(1000);
        arr[500] = 1;
        const result: boolean = arr.some((e: number): boolean => e === 1);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_4500
     * @tc.name testUint16ArraySomePart1045
      * @tc.desc Verify some finds a final value in a length-fifty-thousand array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array(50000);
        arr[49999] = 7;
        const result: boolean = arr.some((e: number): boolean => e === 7);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_4600
     * @tc.name testUint16ArraySomePart1046
      * @tc.desc Verify negative assignments wrap to Uint16 maximum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array(3);
        arr[0] = -1;
        arr[1] = -2;
        arr[2] = -3;
        const result: boolean = arr.some((e: number): boolean => e === 65535);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_4700
     * @tc.name testUint16ArraySomePart1047
      * @tc.desc Verify oversized assignments wrap to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array(3);
        arr[0] = 65536;
        arr[1] = 0x10000;
        arr[2] = 65536 * 3;
        const result: boolean = arr.some((e: number): boolean => e === 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_4800
     * @tc.name testUint16ArraySomePart1048
       * @tc.desc Verify some matches a positive single element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1]);
        const result: boolean = arr.some((e: number): boolean => e > 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_4900
     * @tc.name testUint16ArraySomePart1049
       * @tc.desc Verify some rejects a single value below the threshold
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1]);
        const result: boolean = arr.some((e: number): boolean => e > 99);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_5000
     * @tc.name testUint16ArraySomePart1050
      * @tc.desc Verify some finds the middle value in an ordered array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3]);
        const result: boolean = arr.some((e: number): boolean => e === 2);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_5100
     * @tc.name testUint16ArraySomePart1051
      * @tc.desc Verify some returns false when target ninety-nine is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3]);
        const result: boolean = arr.some((e: number): boolean => e === 99);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_5200
     * @tc.name testUint16ArraySomePart1052
      * @tc.desc Verify some preserves the array byte offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3]);
        const beforeOffset: number = arr.byteOffset;
        arr.some((e: number): boolean => e > 0);
        expect(arr.byteOffset).assertEqual(beforeOffset);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_5300
     * @tc.name testUint16ArraySomePart1053
      * @tc.desc Verify some does not modify source elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3]);
        const before: Uint16Array = new Uint16Array(arr);
        arr.some((e: number): boolean => e > 0);
        expect(arr[0]).assertEqual(before[0]);
        expect(arr[1]).assertEqual(before[1]);
        expect(arr[2]).assertEqual(before[2]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_5400
     * @tc.name testUint16ArraySomePart1054
      * @tc.desc Verify some preserves the source buffer identity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3]);
        const beforeBuf: ArrayBuffer = arr.buffer;
        arr.some((e: number): boolean => e > 0);
        expect(arr.buffer).assertEqual(beforeBuf);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_5500
     * @tc.name testUint16ArraySomePart1055
      * @tc.desc Verify repeated some calls consistently return true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([10, 20, 30]);
        const r1: boolean = arr.some((e: number): boolean => e > 15);
        const r2: boolean = arr.some((e: number): boolean => e > 15);
        expect(r1).assertTrue();
        expect(r2).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_5600
     * @tc.name testUint16ArraySomePart1056
      * @tc.desc Verify repeated some calls consistently return false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([10, 20, 30]);
        const r1: boolean = arr.some((e: number): boolean => e > 100);
        const r2: boolean = arr.some((e: number): boolean => e > 100);
        expect(r1).assertFalse();
        expect(r2).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_5700
     * @tc.name testUint16ArraySomePart1057
      * @tc.desc Verify some rejects a null callback with NullPointerError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3]);
        let cb: ((e: number) => boolean) | null = null;
        try {
          arr.some(cb!);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('NullPointerError');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_5800
     * @tc.name testUint16ArraySomePart1058
      * @tc.desc Verify some propagates callback Error and message
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3]);
        try {
          arr.some((e: number): boolean => {
            throw new Error('cb error');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.message).assertEqual('cb error');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_5900
     * @tc.name testUint16ArraySomePart1059
      * @tc.desc Verify some propagates callback TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3]);
        try {
          arr.some((e: number): boolean => {
            throw new TypeError('type error from cb');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_6000
     * @tc.name testUint16ArraySomePart1060
      * @tc.desc Verify some propagates callback RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([1, 2, 3]);
      try {
        arr.some((e: number): boolean => {
          throw new RangeError('range error from callback');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_6100
     * @tc.name testUint16ArraySomePart1061
       * @tc.desc Verify some propagates a callback string Error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3]);
        try {
          arr.some((e: number): boolean => {
            throw new Error('string error');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.message).assertEqual('string error');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_6200
     * @tc.name testUint16ArraySomePart1062
      * @tc.desc Verify some preserves a callback Error with numeric message
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3]);
        try {
          arr.some((e: number): boolean => {
            throw new Error('404');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.message).assertEqual('404');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_6300
     * @tc.name testUint16ArraySomePart1063
      * @tc.desc Verify zero-length construction yields false from some
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array(0);
        const result: boolean = arr.some((e: number): boolean => true);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_6400
     * @tc.name testUint16ArraySomePart1064
     * @tc.desc Verify some stops at the first matching value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(3, 6, 9, 12);
       let calls: int = 0;
       const r: boolean = a.some((v: number): boolean => {
         calls++;
         return v === 9;
       });
      expect(r).assertTrue();
      expect(calls).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_6500
     * @tc.name testUint16ArraySomePart1065
     * @tc.desc Verify some visits every value when no match exists
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(2, 4, 6, 8);
       let calls: int = 0;
       const r: boolean = a.some((v: number): boolean => {
         calls++;
         return v === 5;
       });
      expect(r).assertFalse();
      expect(calls).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_6600
     * @tc.name testUint16ArraySomePart1066
     * @tc.desc Verify some short-circuits on the first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(5, 10, 15);
       let last: int = -1;
       const r: boolean = a.some((v: number, i: int): boolean => {
         last = i;
         return v > 0;
       });
      expect(r).assertTrue();
      expect(last).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_6700
     * @tc.name testUint16ArraySomePart1067
     * @tc.desc Verify some can match only the final element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(2, 3, 5, 8);
       let index: int = -1;
       const r: boolean = a.some((v: number, i: int): boolean => {
         if (v === 8) {
           index = i;
         }
         return v === 8;
       });
      expect(r).assertTrue();
      expect(index).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_6800
     * @tc.name testUint16ArraySomePart1068
     * @tc.desc Verify some supplies ascending callback indexes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(10, 20, 30);
       let order: int = 0;
       const r: boolean = a.some((v: number, i: int): boolean => {
         order = order * 10 + i;
         return false;
       });
      expect(r).assertFalse();
      expect(order).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_6900
     * @tc.name testUint16ArraySomePart1069
     * @tc.desc Verify some supplies the original array argument
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(1, 2, 3);
       let same: int = 0;
       const r: boolean = a.some((v: number, i: int, x: Uint16Array): boolean => {
         if (x === a) {
           same++;
         }
         return v === 3;
       });
      expect(r).assertTrue();
      expect(same).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_7000
     * @tc.name testUint16ArraySomePart1070
     * @tc.desc Verify some matches by callback index independently of value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(9, 9, 9, 9);
       const r: boolean = a.some((v: number, i: int): boolean => i === 3);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_7100
     * @tc.name testUint16ArraySomePart1071
     * @tc.desc Verify some evaluates a single element exactly once
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(65535);
       let calls: int = 0;
       const r: boolean = a.some((v: number): boolean => {
         calls++;
         return v === 65535;
       });
      expect(r).assertTrue();
      expect(calls).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_7200
     * @tc.name testUint16ArraySomePart1072
     * @tc.desc Verify some does not call the predicate for an empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = new Uint16Array();
       let calls: int = 0;
       const r: boolean = a.some((v: number): boolean => {
         calls++;
         return true;
       });
      expect(r).assertFalse();
      expect(calls).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_7300
     * @tc.name testUint16ArraySomePart1073
     * @tc.desc Verify some evaluates a compound boundary predicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(0, 32767, 32768, 65535);
       const r: boolean = a.some((v: number): boolean => v > 32767 && v < 65535);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_7400
     * @tc.name testUint16ArraySomePart1074
     * @tc.desc Verify some can require both value and index conditions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(5, 10, 15, 20);
       const r: boolean = a.some((v: number, i: int): boolean => v === 15 && i === 2);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_7500
     * @tc.name testUint16ArraySomePart1075
     * @tc.desc Verify some returns false when only the index condition matches
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(5, 10, 15);
       const r: boolean = a.some((v: number, i: int): boolean => v === 99 && i === 1);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_7600
     * @tc.name testUint16ArraySomePart1076
     * @tc.desc Verify some pure predicate leaves source unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(7, 11, 13);
       const r: boolean = a.some((v: number): boolean => v % 2 === 0);
      expect(r).assertFalse();
      expect(a.join(',')).assertEqual('7,11,13');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_7700
     * @tc.name testUint16ArraySomePart1077
     * @tc.desc Verify some distinguishes zero from nonzero elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(4, 0, 6);
       const r: boolean = a.some((v: number): boolean => v === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_7800
     * @tc.name testUint16ArraySomePart1078
     * @tc.desc Verify some predicate may compare against Uint16 maximum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(1, 65535, 2);
       const r: boolean = a.some((v: number): boolean => v === 65535);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_7900
     * @tc.name testUint16ArraySomePart1079
     * @tc.desc Verify some no-match callback reaches the last index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(1, 2, 3);
       let last: int = -1;
       const r: boolean = a.some((v: number, i: int): boolean => {
         last = i;
         return false;
       });
      expect(r).assertFalse();
      expect(last).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART1_8000
     * @tc.name testUint16ArraySomePart1080
     * @tc.desc Verify some match callback does not visit later indexes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(1, 2, 3, 4);
       let last: int = -1;
       const r: boolean = a.some((v: number, i: int): boolean => {
         last = i;
         return v === 2;
       });
      expect(r).assertTrue();
      expect(last).assertEqual(1);
    });

  });
}
