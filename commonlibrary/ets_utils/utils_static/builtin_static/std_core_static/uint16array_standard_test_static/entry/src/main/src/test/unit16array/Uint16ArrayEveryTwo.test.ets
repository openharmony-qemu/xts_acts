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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint16ArrayEvery02Test(): void {
  describe('Uint16ArrayEvery02Test', () => {
    beforeAll(() => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY02_0100
     * @tc.name testUint16ArrayEvery02_001
     * @tc.desc Verify undefined false every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery02_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let arr = Uint16Array.of(4, 5, 6);
        let callCount = 0;
        let result = arr.every((v) => {
          callCount++;
          return v !== 5;
        });
        expect(result).assertFalse();
        expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY02_0200
     * @tc.name testUint16ArrayEvery02_002
     * @tc.desc Verify every observes source-array mutation during callback iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery02_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 2, 3);
        let result: boolean = arr.every((v: number, i: int, a: Uint16Array): boolean => {
          if (i === 0) {
            a[2] = 0;
          }
          return v > 0;
        });
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY02_0300
     * @tc.name testUint16ArrayEvery02_003
     * @tc.desc Verify every iterates all elements when all satisfy, returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery02_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(2, 4, 6, 8);
        let callCount: int = 0;
        let result: boolean = arr.every((v: number): boolean => {
          callCount = callCount + 1;
          return v % 2 === 0;
        });
        expect(result).assertTrue();
        expect(callCount).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY02_0400
     * @tc.name testUint16ArrayEvery02_004
     * @tc.desc Verify every propagates an Error thrown by the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery02_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(4, 5, 6);
        try {
          arr.every((v: number): boolean => {
            throw new Error('callback error');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY02_0500
     * @tc.name testUint16ArrayEvery02_005
     * @tc.desc Verify every propagates an Error thrown for the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery02_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0, 1, 2);
        try {
          arr.every((v: number): boolean => {
            if (v === 0) {
              throw new Error('first element error');
            }
            return true;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY02_0600
     * @tc.name testUint16ArrayEvery02_006
     * @tc.desc Verify every returns true without invoking the callback for an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery02_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = new Uint16Array();
        let called: boolean = false;
        let result: boolean = arr.every((v: number): boolean => {
          called = true;
          throw new Error('should not be called');
        });
        expect(result).assertTrue();
        expect(called).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY02_0700
     * @tc.name testUint16ArrayEvery02_007
     * @tc.desc Verify every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery02_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let origLen: int = arr.length;
        arr.every((v: number): boolean => v > 0);
        expect(arr.length).assertEqual(origLen);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY02_0800
     * @tc.name testUint16ArrayEvery02_008
     * @tc.desc Verify every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery02_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        arr.every((v: number): boolean => v > 0);
        expect(arr.at(0)).assertEqual(10);
        expect(arr.at(1)).assertEqual(20);
        expect(arr.at(2)).assertEqual(30);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY02_0900
     * @tc.name testUint16ArrayEvery02_009
     * @tc.desc Verify every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery02_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 0, 2);
        arr.every((v: number): boolean => v > 0);
        expect(arr.at(0)).assertEqual(1);
        expect(arr.at(1)).assertEqual(0);
        expect(arr.at(2)).assertEqual(2);
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY02_1000
     * @tc.name testUint16ArrayEvery02_010
     * @tc.desc Verify every on slice() result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery02_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
        let sliced: Uint16Array = arr.slice(1, 4);
        let result: boolean = sliced.every((v: number): boolean => v >= 2 && v <= 4);
        expect(result).assertTrue();
        expect(sliced.length).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY02_1100
     * @tc.name testUint16ArrayEvery02_011
     * @tc.desc Verify every on reversed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery02_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(3, 2, 1);
        arr.reverse();
        let result: boolean = arr.every((v: number, i: int): boolean => v === i + 1);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY02_1200
     * @tc.name testUint16ArrayEvery02_012
     * @tc.desc Verify every on sorted array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery02_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(5, 3, 1, 4, 2);
        arr.sort();
        let result: boolean = arr.every((v: number, i: int): boolean => v === i + 1);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY02_1300
     * @tc.name testUint16ArrayEvery02_013
     * @tc.desc Verify every on array created from Uint16Array.from()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery02_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.from([10, 20, 30, 40]);
        let result: boolean = arr.every((v: number): boolean => v % 10 === 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY02_1400
     * @tc.name testUint16ArrayEvery02_014
     * @tc.desc Verify every on array after copyWithin()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery02_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
        arr.copyWithin(3, 0, 2);
        let result: boolean = arr.every((v: number, i: int): boolean => {
          if (i < 3) return v === i + 1;
          return v === i - 2;
        });
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY02_1500

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY02_1600

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY02_1500
     * @tc.name testUint16ArrayEvery02_015
     * @tc.desc Verify every first callback false invokes callback once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery02_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
            Uint16Array.of(1, 2, 3).every((value: number): boolean => { count++; return false; });
            expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY02_1800

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY02_1600
     * @tc.name testUint16ArrayEvery02_016
     * @tc.desc Verify every callback receives increasing indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery02_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let expected: int = 0;
            Uint16Array.of(1, 2, 3).every((value: number, index: int): boolean => { expect(index).assertEqual(expected); expected++; return true; });
            expect(expected).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY02_1700
     * @tc.name testUint16ArrayEvery02_017
     * @tc.desc Verify every callback receives the original receiver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery02_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Uint16Array = Uint16Array.of(1, 2);
            let same: boolean = source.every((value: number, index: int, array: Uint16Array): boolean => array === source);
            expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY02_2100

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY02_1800
     * @tc.name testUint16ArrayEvery02_018
     * @tc.desc Verify every mutation of an earlier element does not revisit it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery02_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Uint16Array = Uint16Array.of(1, 2);
            let count: int = 0;
            let result: boolean = source.every((value: number, index: int, array: Uint16Array): boolean => {
              count++; if (index === 1) { array[0] = 0; } return value > 0;
            });
            expect(result).assertTrue();
            expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY02_1900
     * @tc.name testUint16ArrayEvery02_019
     * @tc.desc Verify every alias mutation affects an unvisited element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery02_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(6);
            let source: Uint16Array = new Uint16Array(buffer);
            source.set([1, 2, 3]);
            let alias: Uint16Array = new Uint16Array(buffer);
            let result: boolean = source.every((value: number, index: int): boolean => {
              if (index === 0) { alias[1] = 0; } return value > 0;
            });
            expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY02_2000
     * @tc.name testUint16ArrayEvery02_020
     * @tc.desc Verify every offset view excludes values outside its range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery02_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let all: Uint16Array = Uint16Array.of(0, 2, 4, 0);
            let view: Uint16Array = new Uint16Array(all.buffer, 2, 2);
            expect(view.every((value: number): boolean => value > 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY02_2100
     * @tc.name testUint16ArrayEvery02_021
     * @tc.desc Verify every callback-thrown Error propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery02_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try { Uint16Array.of(1).every((value: number): boolean => { throw new Error('every marker'); }); expect().assertFail(); } catch (e) { expect(e.message).assertEqual('every marker'); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY02_2200
     * @tc.name testUint16ArrayEvery02_022
     * @tc.desc Verify every maximum Uint16 value satisfies an inclusive predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery02_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint16Array.of(65535).every((value: number): boolean => value <= 65535)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY02_2300
     * @tc.name testUint16ArrayEvery02_023
     * @tc.desc Verify every predicate can compare each value with receiver first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery02_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Uint16Array = Uint16Array.of(2, 4, 6);
            expect(source.every((value: number, index: int, array: Uint16Array): boolean => value >= array[0])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY02_2400
     * @tc.name testUint16ArrayEvery02_024
     * @tc.desc Verify every predicate failure at last element visits full length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery02_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
            let result: boolean = Uint16Array.of(1, 2, 0).every((value: number): boolean => { count++; return value > 0; });
            expect(result).assertFalse();
            expect(count).assertEqual(3);
    });

  });
  }
