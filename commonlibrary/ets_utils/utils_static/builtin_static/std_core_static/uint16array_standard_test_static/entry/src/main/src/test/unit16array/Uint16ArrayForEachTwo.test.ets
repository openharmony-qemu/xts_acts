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

export default function uint16ArrayForEach02Test(): void {
  describe('Uint16ArrayForEach02Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_TWO_0100
     * @tc.name testUint16ArrayForEachTwo001
     * @tc.desc Verify array.$_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(100, 200);
        let readVal: number = -1;
        arr.forEach((value: number, index: int, array: Uint16Array) => {
          if (index === 1) {
            readVal = array.$_get(0);
          }
        });
        expect(readVal).assertEqual(100);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_TWO_0200
     * @tc.name testUint16ArrayForEachTwo002
     * @tc.desc Verify 65535 forEach value 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = new Uint16Array(4);
        arr.fill(65535);
        let allMax = true;
        let callCount: int = 0;
        arr.forEach((value: number) => {
          if (value !== 65535) {
            allMax = false;
          }
          callCount++;
        });
        expect(callCount).assertEqual(4);
        expect(allMax).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_TWO_0300
     * @tc.name testUint16ArrayForEachTwo003
     * @tc.desc Verify 0 65535 forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(0, 65535, 0, 65535);
        const collected: Array<number> = [];
        arr.forEach((value: number) => {
          collected.push(value);
        });
        expect(collected.at(0)).assertEqual(0);
        expect(collected.at(1)).assertEqual(65535);
        expect(collected.at(2)).assertEqual(0);
        expect(collected.at(3)).assertEqual(65535);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_TWO_0400
     * @tc.name testUint16ArrayForEachTwo004
     * @tc.desc Verify 4,3,2,1,0 forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(4, 3, 2, 1, 0);
        const collected: Array<number> = [];
        arr.forEach((value: number) => {
          collected.push(value);
        });
        expect(collected.at(0)).assertEqual(4);
        expect(collected.at(4)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_TWO_0500
     * @tc.name testUint16ArrayForEachTwo005
     * @tc.desc Verify forEach 0,65535,32768,1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(0, 65535, 32768, 1);
        const collected: Array<number> = [];
        arr.forEach((value: number) => {
          collected.push(value);
        });
        expect(collected.at(0)).assertEqual(0);
        expect(collected.at(1)).assertEqual(65535);
        expect(collected.at(2)).assertEqual(32768);
        expect(collected.at(3)).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_TWO_0600
     * @tc.name testUint16ArrayForEachTwo006
     * @tc.desc Verify forEach 65536,-1,NaN,Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(65536, -1, Number.NaN, Number.POSITIVE_INFINITY);
        const collected: Array<number> = [];
        arr.forEach((value: number) => {
          collected.push(value);
        });
        expect(collected.at(0)).assertEqual(0);
        expect(collected.at(1)).assertEqual(65535);
        expect(collected.at(2)).assertEqual(0);
        expect(collected.at(3)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_TWO_0700
     * @tc.name testUint16ArrayForEachTwo007
     * @tc.desc Verify 0 65535 forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(0, 65535);
        const collected: Array<number> = [];
        arr.forEach((value: number) => {
          collected.push(value);
        });
        expect(collected.at(0)).assertEqual(0);
        expect(collected.at(1)).assertEqual(65535);
      }
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_TWO_0800
     * @tc.name testUint16ArrayForEachTwo008
     * @tc.desc Verify forEach forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const empty = new Uint16Array();
        const arr = Uint16Array.of(5, 10);
        let emptyCalled = false;
        let arrSum = 0;
        empty.forEach(() => {
          emptyCalled = true;
        });
        arr.forEach((value: number) => {
          arrSum += value;
        });
        expect(emptyCalled).assertFalse();
        expect(arrSum).assertEqual(15);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_TWO_0900
     * @tc.name testUint16ArrayForEachTwo009
     * @tc.desc Verify forEach fill(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = new Uint16Array(6);
        arr.fill(0);
        let count = 0;
        arr.forEach((value: number) => {
          count++;
        });
        expect(count).assertEqual(6);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_TWO_1000
     * @tc.name testUint16ArrayForEachTwo010
     * @tc.desc Verify forEach indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(1, 2, 3, 4, 5);
        arr.forEach((value: number) => {
          let x = value * 2;
        });
        expect(arr.indexOf(1)).assertEqual(0);
        expect(arr.indexOf(5)).assertEqual(4);
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_TWO_1100
     * @tc.name testUint16ArrayForEachTwo011
     * @tc.desc Verify forEach on map result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(1, 2, 3);
        const mapped = arr.map((v: number): number => v * 5);
        let product = 1;
        mapped.forEach((value: number): void => {
          product *= value;
        });
        expect(product).assertEqual(750);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_TWO_1200
     * @tc.name testUint16ArrayForEachTwo012
     * @tc.desc Verify forEach empty receiver invokes no callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
            new Uint16Array().forEach((value: number): void => { count++; });
            expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_TWO_1300
     * @tc.name testUint16ArrayForEachTwo013
     * @tc.desc Verify forEach callback receives the original receiver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2);
            let same: boolean = false;
            let callCount: int = 0;
            arr.forEach((value: number, index: int, array: Uint16Array): void => { same = array === arr; callCount++; });
            expect(callCount).assertEqual(2);
            expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_TWO_1400
     * @tc.name testUint16ArrayForEachTwo014
     * @tc.desc Verify forEach callback indices increase from zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 4, 5);
            let expected: int = 0;
            arr.forEach((value: number, index: int): void => { expect(index).assertEqual(expected); expected++; });
            expect(expected).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_TWO_1500
     * @tc.name testUint16ArrayForEachTwo015
     * @tc.desc Verify forEach mutation of a later element is observed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
            let seen: Array<number> = [];
            arr.forEach((value: number, index: int, array: Uint16Array): void => { seen.push(value); if (index === 0) { array[1] = 20; } });
            expect(seen.at(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_TWO_1600
     * @tc.name testUint16ArrayForEachTwo016
     * @tc.desc Verify forEach mutation of an earlier element does not revisit it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
            let count: int = 0;
            arr.forEach((value: number, index: int, array: Uint16Array): void => { count++; if (index === 1) { array[0] = 99; } });
            expect(count).assertEqual(3);
            expect(arr.at(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_TWO_1700
     * @tc.name testUint16ArrayForEachTwo017
     * @tc.desc Verify forEach callback sees mutation through an alias view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(6);
            let arr: Uint16Array = new Uint16Array(buffer);
            arr.set([1, 2, 3]);
            let alias: Uint16Array = new Uint16Array(buffer);
            let seen: int = 0;
            arr.forEach((value: number, index: int): void => { if (index === 0) { alias[1] = 44; } if (index === 1) { seen = value.toInt(); } });
            expect(seen).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_TWO_1800
     * @tc.name testUint16ArrayForEachTwo018
     * @tc.desc Verify forEach offset view visits only its own elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(10);
            let all: Uint16Array = new Uint16Array(buffer);
            all.set([1, 2, 3, 4, 5]);
            let view: Uint16Array = new Uint16Array(buffer, 4, 2);
            let sum: number = 0;
            view.forEach((value: number): void => { sum += value; });
            expect(sum).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_TWO_1900
     * @tc.name testUint16ArrayForEachTwo019
     * @tc.desc Verify forEach callback-thrown Error propagates with its message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1);
            try { arr.forEach((value: number): void => { throw new Error('forEach marker'); }); expect().assertFail(); } catch (e) { expect(e.name).assertEqual('Error'); expect(e.message).assertEqual('forEach marker'); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_TWO_2000
     * @tc.name testUint16ArrayForEachTwo020
     * @tc.desc Verify forEach callback can accumulate Uint16 maximum values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65535, 65535);
            let sum: number = 0;
            arr.forEach((value: number): void => { sum += value; });
            expect(sum).assertEqual(131070);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_TWO_2100
     * @tc.name testUint16ArrayForEachTwo021
     * @tc.desc Verify forEach callback can read the receiver last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(2, 4, 8);
            let total: number = 0;
            arr.forEach((value: number, index: int, array: Uint16Array): void => { total += array[array.length - 1]; });
            expect(total).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_TWO_2200
     * @tc.name testUint16ArrayForEachTwo022
     * @tc.desc Verify forEach fill before forEach changes every visited value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(3);
            arr.fill(7);
            let sum: number = 0;
            arr.forEach((value: number): void => { sum += value; });
            expect(sum).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_TWO_2300
     * @tc.name testUint16ArrayForEachTwo023
     * @tc.desc Verify forEach copyWithin before forEach preserves iteration length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4);
            arr.copyWithin(1, 2);
            let count: int = 0;
            arr.forEach((value: number): void => { count++; });
            expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_TWO_2400
     * @tc.name testUint16ArrayForEachTwo024
     * @tc.desc Verify forEach nested read from the same receiver is deterministic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(2, 3, 4);
            let total: number = 0;
            arr.forEach((value: number, index: int, array: Uint16Array): void => { total += value * array[index]; });
            expect(total).assertEqual(29);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_TWO_2500
     * @tc.name testUint16ArrayForEachTwo025
     * @tc.desc Verify forEach single-element receiver supplies index zero once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(9);
            let indexSum: int = -1;
            arr.forEach((value: number, index: int): void => { indexSum = index; });
            expect(indexSum).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_TWO_2600
     * @tc.name testUint16ArrayForEachTwo026
     * @tc.desc Verify a callback exception at a middle index prevents later forEach callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Uint16Array = Uint16Array.of(1, 2, 3);
      let count: int = 0;
      try {
        source.forEach((value: number, index: int): void => {
          count++;
          if (index === 1) {
            throw new Error('forEach middle');
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('forEach middle');
      }
      expect(count).assertEqual(2);
    });

  });
}
