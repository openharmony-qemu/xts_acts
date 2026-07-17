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

export default function uint16ArrayForEach01Test(): void {
  describe('Uint16ArrayForEach01Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_0100
     * @tc.name testUint16ArrayForEachOne001
     * @tc.desc Verify forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = new Uint16Array();
        let called = false;
        arr.forEach(() => {
          called = true;
        });
        expect(called).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_0200
     * @tc.name testUint16ArrayForEachOne002
     * @tc.desc Verify 0 value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(0);
        let received: number = -1;
        arr.forEach((value: number) => {
          received = value;
        });
        expect(received).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_0300
     * @tc.name testUint16ArrayForEachOne003
     * @tc.desc Verify 3.14 3 value 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(3.14);
        let received: number = -1;
        arr.forEach((value: number) => {
          received = value;
        });
        expect(received).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_0400
     * @tc.name testUint16ArrayForEachOne004
     * @tc.desc Verify NaN 0 value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(Number.NaN);
        let received: number = -1;
        arr.forEach((value: number) => {
          received = value;
        });
        expect(received).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_0500
     * @tc.name testUint16ArrayForEachOne005
     * @tc.desc Verify index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(42);
        let receivedIndex = -1;
        arr.forEach((value: number, index: int) => {
          receivedIndex = index;
        });
        expect(receivedIndex).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_0600
     * @tc.name testUint16ArrayForEachOne006
     * @tc.desc Verify 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(42);
        let count = 0;
        arr.forEach(() => {
          count++;
        });
        expect(count).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_0700
     * @tc.name testUint16ArrayForEachOne007
     * @tc.desc Verify array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(42);
        let receivedArray: Uint16Array | undefined = undefined;
        arr.forEach((value: number, index: int, array: Uint16Array) => {
          receivedArray = array;
        });
        expect(receivedArray).assertEqual(arr);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_0800
     * @tc.name testUint16ArrayForEachOne008
     * @tc.desc Verify array.length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(42);
        let arrLen = -1;
        arr.forEach((value: number, index: int, array: Uint16Array) => {
          arrLen = array.length;
        });
        expect(arrLen).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_0900
     * @tc.name testUint16ArrayForEachOne009
     * @tc.desc Verify array[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(99);
        let readBack: number = -1;
        arr.forEach((value: number, index: int, array: Uint16Array) => {
          readBack = array[0];
        });
        expect(readBack).assertEqual(99);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_1000
     * @tc.name testUint16ArrayForEachOne010
     * @tc.desc Verify 2 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(10, 20);
        const arrays: Array<Uint16Array> = [];
        arr.forEach((value: number, index: int, array: Uint16Array) => {
          arrays.push(array);
        });
        expect(arrays.at(0)).assertEqual(arrays[1]);
        expect(arrays.at(0)).assertEqual(arr);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_1100
     * @tc.name testUint16ArrayForEachOne011
     * @tc.desc Verify 3 value 1,2,3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(1, 2, 3);
        const collected: Array<number> = [];
        arr.forEach((value: number) => {
          collected.push(value);
        });
        expect(collected.at(0)).assertEqual(1);
        expect(collected.at(1)).assertEqual(2);
        expect(collected.at(2)).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_1200
     * @tc.name testUint16ArrayForEachOne012
     * @tc.desc Verify 3 index 0,1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(1, 2, 3);
        const indices: Array<int> = [];
        arr.forEach((value: number, index: int) => {
          indices.push(index);
        });
        expect(indices.at(0)).assertEqual(0);
        expect(indices.at(1)).assertEqual(1);
        expect(indices.at(2)).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_1300
     * @tc.name testUint16ArrayForEachOne013
     * @tc.desc Verify 10 0 9 45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = new Uint16Array(10);
        for (let i = 0; i < 10; i++) {
          arr[i] = i;
        }
        let sum = 0;
        arr.forEach((value: number) => {
          sum += value;
        });
        expect(sum).assertEqual(45);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_1400
     * @tc.name testUint16ArrayForEachOne014
     * @tc.desc Verify 100 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = new Uint16Array(100);
        for (let i = 0; i < 100; i++) {
          arr[i] = 1;
        }
        let count = 0;
        arr.forEach(() => {
          count++;
        });
        expect(count).assertEqual(100);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_1500
     * @tc.name testUint16ArrayForEachOne015
     * @tc.desc Verify 0 forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(0, 100);
        let first: number = -1;
        arr.forEach((value: number, index: int) => {
          if (index === 0) {
            first = value;
          }
        });
        expect(first).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_1600
     * @tc.name testUint16ArrayForEachOne016
     * @tc.desc Verify 65536 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(65536, 100);
        let first: number = -1;
        arr.forEach((value: number, index: int) => {
          if (index === 0) {
            first = value;
          }
        });
        expect(first).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_1700
     * @tc.name testUint16ArrayForEachOne017
     * @tc.desc Verify NaN 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(Number.NaN, 100);
        let first: number = -1;
        arr.forEach((value: number, index: int) => {
          if (index === 0) {
            first = value;
          }
        });
        expect(first).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_1800
     * @tc.name testUint16ArrayForEachOne018
     * @tc.desc Verify forEach accepts a reusable callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(1, 2, 3);
        let sum = 0;
        const cb = (value: number) => {
          sum += value;
        };
        arr.forEach(cb);
        expect(sum).assertEqual(6);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_1900
     * @tc.name testUint16ArrayForEachOne019
     * @tc.desc Verify value/index/array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(1, 2, 3);
        const results: Array<string> = [];
        arr.forEach((value: number, index: int, array: Uint16Array) => {
          results.push(value.toString() + index.toString() + array.length.toString());
        });
        expect(results.at(0)).assertEqual("103");
        expect(results.at(1)).assertEqual("213");
        expect(results.at(2)).assertEqual("323");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_2000
     * @tc.name testUint16ArrayForEachOne020
     * @tc.desc Verify new Uint16Array(5) forEach 5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = new Uint16Array(5);
        let count = 0;
        let allZero = true;
        arr.forEach((value: number) => {
          count++;
          if (value !== 0) {
            allZero = false;
          }
        });
        expect(count).assertEqual(5);
        expect(allZero).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_2100
     * @tc.name testUint16ArrayForEachOne021
     * @tc.desc Verify Uint16Array.from(FixedArray) forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: FixedArray<int> = [5, 10, 15];
        const arr = Uint16Array.from(src);
        let sum = 0;
        arr.forEach((value: number) => {
          sum += value;
        });
        expect(sum).assertEqual(30);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_2200
     * @tc.name testUint16ArrayForEachOne022
     * @tc.desc Verify new Uint16Array(other) forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src = Uint16Array.of(2, 4, 6);
        const arr = new Uint16Array(src);
        let sum = 0;
        arr.forEach((value: number) => {
          sum += value;
        });
        expect(sum).assertEqual(12);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_2300
     * @tc.name testUint16ArrayForEachOne023
     * @tc.desc Verify new Uint16Array(ArrayBuffer) forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf = new ArrayBuffer(6);
        const arr = new Uint16Array(buf);
        arr[0] = 1;
        arr[1] = 2;
        arr[2] = 3;
        let sum = 0;
        arr.forEach((value: number) => {
          sum += value;
        });
        expect(sum).assertEqual(6);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_2400
     * @tc.name testUint16ArrayForEachOne024
     * @tc.desc Verify subarray forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(1, 2, 3, 4, 5);
        const sub = arr.subarray(1, 4);
        const collected: Array<number> = [];
        sub.forEach((value: number) => {
          collected.push(value);
        });
        expect(collected.length).assertEqual(3);
        expect(collected.at(0)).assertEqual(2);
        expect(collected.at(2)).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_2500
     * @tc.name testUint16ArrayForEachOne025
     * @tc.desc Verify new Uint16Array(length:number) forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const len: number = 4.0;
        const arr = new Uint16Array(len);
        arr[0] = 7;
        arr[3] = 7;
        let sum = 0;
        arr.forEach((value: number) => {
          sum += value;
        });
        expect(sum).assertEqual(14);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_2600
     * @tc.name testUint16ArrayForEachOne026
     * @tc.desc Verify Uint16Array.from with mapfn forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<number> = [1, 2, 3];
        const arr = Uint16Array.from(src, (v: number, k: number): number => v * 10);
        const collected: Array<number> = [];
        arr.forEach((value: number) => {
          collected.push(value);
        });
        expect(collected.at(0)).assertEqual(10);
        expect(collected.at(1)).assertEqual(20);
        expect(collected.at(2)).assertEqual(30);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_2700
     * @tc.name testUint16ArrayForEachOne027
     * @tc.desc Verify forEach undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(1, 2);
        const result = arr.forEach(() => {});
        expect(result).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_2800
     * @tc.name testUint16ArrayForEachOne028
     * @tc.desc Verify Error forEach catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(1, 2, 3);
        let threw = false;
        try {
          
          arr.forEach((value: number, index: int) => {
            if (index === 1) {
              throw new Error("cb error");
            }
          });
        } catch (e) {
          expect(e.name).assertEqual('Error');
          threw = true;
        }
        expect(threw).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_2900
     * @tc.name testUint16ArrayForEachOne029
     * @tc.desc Verify forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(1, 2, 3);
        let visitedSecond = false;
        try {
          arr.forEach((value: number, index: int) => {
            if (index === 0) {
              throw new Error("stop");
            }
            visitedSecond = true;
          });
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(visitedSecond).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_3000
     * @tc.name testUint16ArrayForEachOne030
     * @tc.desc Verify forEach stops after a callback throws at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(1, 2, 3, 4, 5);
        let visitedCount = 0;
        try {
          arr.forEach((value: number, index: int) => {
            visitedCount++;
            if (index === 2) {
              throw new Error("stop");
            }
          });
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(visitedCount).assertEqual(3);
      }
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_3100
     * @tc.name testUint16ArrayForEachOne031
     * @tc.desc Verify forEach callback can update each array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(1, 2, 3);
        arr.forEach((value: number, index: int) => {
          arr[index] = value * 10;
        });
        expect(arr.at(0)).assertEqual(10);
        expect(arr.at(1)).assertEqual(20);
        expect(arr.at(2)).assertEqual(30);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_3200
     * @tc.name testUint16ArrayForEachOne032
     * @tc.desc Verify set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(1, 2, 3);
        arr.forEach((value: number, index: int) => {
          arr[index] = value + 1;
        });
        expect(arr.at(0)).assertEqual(2);
        expect(arr.at(1)).assertEqual(3);
        expect(arr.at(2)).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_3300
     * @tc.name testUint16ArrayForEachOne033
     * @tc.desc Verify forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(1, 2, 3);
        let count1 = 0;
        let count2 = 0;
        arr.forEach(() => {
          count1++;
        });
        arr.forEach(() => {
          count2++;
        });
        expect(count1).assertEqual(3);
        expect(count2).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_3400
     * @tc.name testUint16ArrayForEachOne034
     * @tc.desc Verify index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(5, 10, 15, 20);
        const threshold: Array<number> = [8, 12, 18, 25];
        const results: Array<boolean> = [];
        arr.forEach((value: number, index: int) => {
          results.push(value < threshold[index]);
        });
        expect(results.at(0)).assertTrue();
        expect(results.at(1)).assertTrue();
        expect(results.at(2)).assertTrue();
        expect(results.at(3)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_3500
     * @tc.name testUint16ArrayForEachOne035
     * @tc.desc Verify forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(1, 2, 3);
        const snapshot = Uint16Array.of(1, 2, 3);
        arr.forEach((value: number) => {
          let x = value * 2;
        });
        expect(arr.at(0)).assertEqual(snapshot[0]);
        expect(arr.at(1)).assertEqual(snapshot[1]);
        expect(arr.at(2)).assertEqual(snapshot[2]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_3600
     * @tc.name testUint16ArrayForEachOne036
     * @tc.desc Verify forEach length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(1, 2, 3);
        const beforeLen = arr.length;
        arr.forEach((value: number) => {
        });
        expect(arr.length).assertEqual(beforeLen);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_3700
     * @tc.name testUint16ArrayForEachOne037
     * @tc.desc Verify forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(1, 2, 3);
        arr[0] = 100;
        arr[1] = 200;
        let sum = 0;
        arr.forEach((value: number) => {
          sum += value;
        });
        expect(sum).assertEqual(303);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_3800
     * @tc.name testUint16ArrayForEachOne038
     * @tc.desc Verify forEach forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const outer = Uint16Array.of(1, 2);
        const inner = Uint16Array.of(10, 20);
        const results: Array<number> = [];
        outer.forEach((v1: number) => {
          inner.forEach((v2: number) => {
            results.push(v1 + v2);
          });
        });
        expect(results.length).assertEqual(4);
        expect(results.at(0)).assertEqual(11);
        expect(results.at(3)).assertEqual(22);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_3900
     * @tc.name testUint16ArrayForEachOne039
     * @tc.desc Verify sort forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(3, 1, 2);
        arr.sort();
        const collected: Array<number> = [];
        arr.forEach((value: number) => {
          collected.push(value);
        });
        expect(collected.at(0)).assertEqual(1);
        expect(collected.at(1)).assertEqual(2);
        expect(collected.at(2)).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_4000
     * @tc.name testUint16ArrayForEachOne040
     * @tc.desc Verify reverse forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(1, 2, 3);
        arr.reverse();
        const collected: Array<number> = [];
        arr.forEach((value: number) => {
          collected.push(value);
        });
        expect(collected.at(0)).assertEqual(3);
        expect(collected.at(1)).assertEqual(2);
        expect(collected.at(2)).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_4100
     * @tc.name testUint16ArrayForEachOne041
     * @tc.desc Verify fill forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = new Uint16Array(4);
        arr.fill(42);
        let allSame = true;
        arr.forEach((value: number) => {
          if (value !== 42) {
            allSame = false;
          }
        });
        expect(allSame).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_4200
     * @tc.name testUint16ArrayForEachOne042
     * @tc.desc Verify set forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = new Uint16Array(3);
        const src: FixedArray<int> = [7, 8, 9];
        arr.set(src);
        const collected: Array<number> = [];
        arr.forEach((value: number) => {
          collected.push(value);
        });
        expect(collected.at(0)).assertEqual(7);
        expect(collected.at(1)).assertEqual(8);
        expect(collected.at(2)).assertEqual(9);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_4300
     * @tc.name testUint16ArrayForEachOne043
     * @tc.desc Verify copyWithin forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(1, 2, 3, 4);
        arr.copyWithin(0, 2);
        const collected: Array<number> = [];
        arr.forEach((value: number) => {
          collected.push(value);
        });
        expect(collected.at(0)).assertEqual(3);
        expect(collected.at(1)).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_4400
     * @tc.name testUint16ArrayForEachOne044
     * @tc.desc Verify filter forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(1, 2, 3, 4, 5);
        const filtered = arr.filter((v: number): boolean => v > 2);
        const collected: Array<number> = [];
        filtered.forEach((value: number) => {
          collected.push(value);
        });
        expect(collected.length).assertEqual(3);
        expect(collected.at(0)).assertEqual(3);
        expect(collected.at(2)).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_4500
     * @tc.name testUint16ArrayForEachOne045
     * @tc.desc Verify map forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(1, 2, 3);
        const mapped = arr.map((v: number): number => v * 10);
        const collected: Array<number> = [];
        mapped.forEach((value: number) => {
          collected.push(value);
        });
        expect(collected.at(0)).assertEqual(10);
        expect(collected.at(1)).assertEqual(20);
        expect(collected.at(2)).assertEqual(30);
      }
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_4700
     * @tc.name testUint16ArrayForEachOne047
     * @tc.desc Verify subarray forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(10, 20, 30, 40, 50);
        const sub = arr.subarray(2, 5);
        const collected: Array<number> = [];
        sub.forEach((value: number) => {
          collected.push(value);
        });
        expect(collected.length).assertEqual(3);
        expect(collected.at(0)).assertEqual(30);
        expect(collected.at(2)).assertEqual(50);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_4800
     * @tc.name testUint16ArrayForEachOne048
     * @tc.desc Verify forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(1, 2, 3, 4);
        const sub = arr.subarray(1, 3);
        arr[1] = 99;
        arr[2] = 88;
        const collected: Array<number> = [];
        sub.forEach((value: number) => {
          collected.push(value);
        });
        expect(collected.at(0)).assertEqual(99);
        expect(collected.at(1)).assertEqual(88);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_4900
     * @tc.name testUint16ArrayForEachOne049
     * @tc.desc Verify forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(1, 2, 3, 4);
        const sub = arr.subarray(1, 3);
        sub[0] = 77;
        sub[1] = 66;
        const collected: Array<number> = [];
        arr.forEach((value: number) => {
          collected.push(value);
        });
        expect(collected.at(1)).assertEqual(77);
        expect(collected.at(2)).assertEqual(66);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_5000
     * @tc.name testUint16ArrayForEachOne050
     * @tc.desc Verify byteOffset forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf = new ArrayBuffer(8);
        const view1 = new Uint16Array(buf, 0, 2);
        const view2 = new Uint16Array(buf, 4, 2);
        view1[0] = 10;
        view1[1] = 20;
        view2[0] = 30;
        view2[1] = 40;
        const collected1: Array<number> = [];
        const collected2: Array<number> = [];
        view1.forEach((value: number) => {
          collected1.push(value);
        });
        view2.forEach((value: number) => {
          collected2.push(value);
        });
        expect(collected1.at(0)).assertEqual(10);
        expect(collected1.at(1)).assertEqual(20);
        expect(collected2.at(0)).assertEqual(30);
        expect(collected2.at(1)).assertEqual(40);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_5100
     * @tc.name testUint16ArrayForEachOne051
     * @tc.desc Verify buffer forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf = new ArrayBuffer(6);
        const viewA = new Uint16Array(buf);
        viewA[0] = 5;
        viewA[1] = 10;
        viewA[2] = 15;
        const viewB = new Uint16Array(buf);
        const collected: Array<number> = [];
        viewA.forEach((value: number) => {
          collected.push(value);
        });
        expect(collected.at(0)).assertEqual(viewB[0]);
        expect(collected.at(1)).assertEqual(viewB[1]);
        expect(collected.at(2)).assertEqual(viewB[2]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_5200
     * @tc.name testUint16ArrayForEachOne052
     * @tc.desc Verify buffer forEach buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf = new ArrayBuffer(6);
        const arr = new Uint16Array(buf);
        arr[0] = 100;
        arr[1] = 200;
        arr[2] = 300;
        const collected: Array<number> = [];
        arr.forEach((value: number) => {
          collected.push(value);
        });
        expect(collected.at(0)).assertEqual(100);
        expect(collected.at(1)).assertEqual(200);
        expect(collected.at(2)).assertEqual(300);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_5300
     * @tc.name testUint16ArrayForEachOne053
     * @tc.desc Verify value number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(42);
        let valueType = "";
        arr.forEach((value: number) => {
          valueType = typeof value;
        });
        expect(valueType).assertEqual("number");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_5400
     * @tc.name testUint16ArrayForEachOne054
     * @tc.desc Verify array.buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf = new ArrayBuffer(4);
        const arr = new Uint16Array(buf);
        arr[0] = 10;
        arr[1] = 20;
        let sameBuffer = false;
        arr.forEach((value: number, index: int, array: Uint16Array) => {
          if (index === 0) {
            sameBuffer = array.buffer === buf;
          }
        });
        expect(sameBuffer).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_5500
     * @tc.name testUint16ArrayForEachOne055
     * @tc.desc Verify array.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(1, 2, 3, 4, 5);
        let arrLen = -1;
        arr.forEach((value: number, index: int, array: Uint16Array) => {
          if (index === 0) {
            arrLen = array.length;
          }
        });
        expect(arrLen).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_5600
     * @tc.name testUint16ArrayForEachOne056
     * @tc.desc Verify forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr1 = Uint16Array.of(1, 2);
        const arr2 = Uint16Array.of(10, 20);
        const collected1: Array<number> = [];
        const collected2: Array<number> = [];
        arr1.forEach((value: number) => {
          collected1.push(value);
        });
        arr2.forEach((value: number) => {
          collected2.push(value);
        });
        expect(collected1.at(0)).assertEqual(1);
        expect(collected1.at(1)).assertEqual(2);
        expect(collected2.at(0)).assertEqual(10);
        expect(collected2.at(1)).assertEqual(20);
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FOR_EACH_ONE_5700
     * @tc.name testUint16ArrayForEachOne057
     * @tc.desc Verify forEach order on sorted array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayForEachOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr = Uint16Array.of(5, 3, 1, 4, 2);
        arr.sort();
        const indices: Array<int> = [];
        arr.forEach((value: number, index: int): void => {
          indices.push(index);
        });
        expect(indices.at(0)).assertEqual(0);
        expect(indices.at(4)).assertEqual(4);
      }
    });

  });
}
