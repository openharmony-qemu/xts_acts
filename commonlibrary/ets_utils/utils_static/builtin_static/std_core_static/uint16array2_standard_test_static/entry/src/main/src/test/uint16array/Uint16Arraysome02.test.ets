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

export default function uint16ArraySomePart2Test(): void {
  describe('Uint16ArraySomePart2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_0100
     * @tc.name testUint16ArraySomePart2001
     * @tc.desc Verify some visits all elements to accumulate their sum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3]);
        let sum: number = 0;
        arr.some((e: number): boolean => {
          sum = sum + e;
          return false;
        });
        expect(sum).assertEqual(6);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_0200
     * @tc.name testUint16ArraySomePart2002
     * @tc.desc Verify callback can multiply every source element in place
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3]);
        arr.some((e: number, i: int): boolean => {
          arr[i] = e * 10;
          return false;
        });
        expect(arr[0]).assertEqual(10);
        expect(arr[1]).assertEqual(20);
        expect(arr[2]).assertEqual(30);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_0300
     * @tc.name testUint16ArraySomePart2003
     * @tc.desc Verify nested some calls can produce an outer match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3]);
        const outerResult: boolean = arr.some((e: number): boolean => {
          if (e > 1) {
            const inner: boolean = arr.some((x: number): boolean => x === 3);
            return inner;
          }
          return false;
        });
        expect(outerResult).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_0400
     * @tc.name testUint16ArraySomePart2004
     * @tc.desc Verify some captures and applies an external threshold
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        const threshold: number = 3;
        const result: boolean = arr.some((e: number): boolean => e > threshold);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_0500
     * @tc.name testUint16ArraySomePart2005
     * @tc.desc Verify some returns false when every callback result is false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3]);
        const result: boolean = arr.some((e: number): boolean => {
          return false;
        });
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_0600
     * @tc.name testUint16ArraySomePart2006
     * @tc.desc Verify a caught callback Error produces a some match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3]);
        const result: boolean = arr.some((e: number): boolean => {
          try {
            if (e === 2) {
              throw new Error('caught');
            }
            return false;
          } catch (inner) {
            expect(inner.name).assertEqual('Error');
            return true;
          }
        });
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_0700
     * @tc.name testUint16ArraySomePart2007
     * @tc.desc Verify some matches a value by its square root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([4, 9, 16, 25]);
        const result: boolean = arr.some((e: number): boolean => {
          const sqrt: number = Math.sqrt(e);
          return sqrt === 5;
        });
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_0800
     * @tc.name testUint16ArraySomePart2008
     * @tc.desc Verify some finds a value greater than fifteen
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([10, 20, 30]);
        const result: boolean = arr.some((e: number): boolean => e > 15);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_0900
     * @tc.name testUint16ArraySomePart2009
     * @tc.desc Verify nested target lookup finds a shared value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([10, 20, 30]);
        const targets: Uint16Array = new Uint16Array([5, 15, 25, 30]);
        const result: boolean = arr.some((e: number): boolean => {
          return targets.some((t: number): boolean => t === e);
        });
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_1000
     * @tc.name testUint16ArraySomePart2010
     * @tc.desc Verify callback side effect records the matched value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([5, 10, 15, 20]);
        let found: boolean = false;
        const result: boolean = arr.some((e: number): boolean => {
          if (e === 15) {
            found = true;
          }
          return e === 15;
        });
        expect(found).assertTrue();
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_1100
     * @tc.name testUint16ArraySomePart2011
     * @tc.desc Verify some compares values with a Map-provided target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3]);
        const config: Map<string, number> = new Map<string, number>();
        config.set("target", 2);
        const result: boolean = arr.some((e: number): boolean => e === config.get("target")!);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_1200
     * @tc.name testUint16ArraySomePart2012
     * @tc.desc Verify callback can increment every source element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        arr.some((e: number, i: int): boolean => {
          arr[i] = e + 1;
          return false;
        });
        expect(arr[0]).assertEqual(2);
        expect(arr[1]).assertEqual(3);
        expect(arr[2]).assertEqual(4);
        expect(arr[3]).assertEqual(5);
        expect(arr[4]).assertEqual(6);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_1300
     * @tc.name testUint16ArraySomePart2013
     * @tc.desc Verify some short-circuits after cumulative product reaches twenty-four
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let product: number = 1;
        const result: boolean = arr.some((e: number): boolean => {
          product = product * e;
          return product >= 24;
        });
        expect(result).assertTrue();
        expect(product).assertEqual(24);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_1400
     * @tc.name testUint16ArraySomePart2014
     * @tc.desc Verify some finds a value in an ArrayBuffer-backed view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(8);
        const arr: Uint16Array = new Uint16Array(buf);
        arr[0] = 1;
        arr[1] = 2;
        arr[2] = 3;
        arr[3] = 4;
        const result: boolean = arr.some((e: number): boolean => e === 3);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_1500
     * @tc.name testUint16ArraySomePart2015
     * @tc.desc Verify some finds a value copied from Uint8Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const src: Uint8Array = new Uint8Array([10, 20, 30]);
        const arr: Uint16Array = new Uint16Array(src);
        const result: boolean = arr.some((e: number): boolean => e === 20);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_1600
     * @tc.name testUint16ArraySomePart2016
     * @tc.desc Verify some finds a value copied from Int32Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const src: Int32Array = new Int32Array([100, 200, 300]);
        const arr: Uint16Array = new Uint16Array(src);
        const result: boolean = arr.some((e: number): boolean => e === 200);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_1700
     * @tc.name testUint16ArraySomePart2017
     * @tc.desc Verify some finds a truncated Float64Array value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const src: Float64Array = new Float64Array([3.9, 5.1, 7.8]);
        const arr: Uint16Array = new Uint16Array(src);
        const result: boolean = arr.some((e: number): boolean => e === 5);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_1800
     * @tc.name testUint16ArraySomePart2018
     * @tc.desc Verify some finds the final Uint16Array.of value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = Uint16Array.of(10, 20, 30, 40);
        const result: boolean = arr.some((e: number): boolean => e === 40);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_1900
     * @tc.name testUint16ArraySomePart2019
     * @tc.desc Verify some finds a value above fifteen from Uint16Array.from
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = Uint16Array.from([5, 10, 15, 20]);
        const result: boolean = arr.some((e: number): boolean => e > 15);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_2000
     * @tc.name testUint16ArraySomePart2020
     * @tc.desc Verify some finds a value within a subarray view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        const sub: Uint16Array = arr.subarray(1, 4);
        const result: boolean = sub.some((e: number): boolean => e === 3);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_2100
     * @tc.name testUint16ArraySomePart2021
     * @tc.desc Verify some finds a value within a sliced copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
        const sliced: Uint16Array = arr.slice(1, 4);
        const result: boolean = sliced.some((e: number): boolean => e === 30);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_2200
     * @tc.name testUint16ArraySomePart2022
     * @tc.desc Verify some finds the preserved positive Int8Array value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const src: Int8Array = new Int8Array([-1, -2, 127]);
        const arr: Uint16Array = new Uint16Array(src);
        const result: boolean = arr.some((e: number): boolean => e === 127);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_2300
     * @tc.name testUint16ArraySomePart2023
     * @tc.desc Verify some finds a truncated Float32Array value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const src: Float32Array = new Float32Array([1.1, 2.9, 3.5]);
        const arr: Uint16Array = new Uint16Array(src);
        const result: boolean = arr.some((e: number): boolean => e === 2);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_2400
     * @tc.name testUint16ArraySomePart2024
     * @tc.desc Verify callback reports each zero-based index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([5, 10, 15]);
        let idx0: number = -1;
        let idx1: number = -1;
        let idx2: number = -1;
        arr.some((e: number, i: int): boolean => {
          if (i === 0) {
            idx0 = i;
          }
          if (i === 1) {
            idx1 = i;
          }
          if (i === 2) {
            idx2 = i;
          }
          return false;
        });
        expect(idx0).assertEqual(0);
        expect(idx1).assertEqual(1);
        expect(idx2).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_2500
     * @tc.name testUint16ArraySomePart2025
     * @tc.desc Verify some short-circuits on index zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([100, 200, 300]);
        let callCount: int = 0;
        let matchedIndex: int = -1;
        const result: boolean = arr.some((e: number, i: int): boolean => {
          callCount++;
          if (i === 0) {
            matchedIndex = i;
            return true;
          }
          return false;
        });
        expect(result).assertTrue();
        expect(matchedIndex).assertEqual(0);
        expect(callCount).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_2600
     * @tc.name testUint16ArraySomePart2026
     * @tc.desc Verify some reaches the final index before matching
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let callCount: int = 0;
        let matchedIndex: int = -1;
        const result: boolean = arr.some((e: number, i: int): boolean => {
          callCount++;
          if (i === 4) {
            matchedIndex = i;
            return true;
          }
          return false;
        });
        expect(result).assertTrue();
        expect(matchedIndex).assertEqual(4);
        expect(callCount).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_2700
     * @tc.name testUint16ArraySomePart2027
     * @tc.desc Verify some matches the first even index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let callCount: int = 0;
        let matchedIndex: int = -1;
        const result: boolean = arr.some((e: number, i: int): boolean => {
          callCount++;
          if (i % 2 === 0) {
            matchedIndex = i;
            return true;
          }
          return false;
        });
        expect(result).assertTrue();
        expect(matchedIndex).assertEqual(0);
        expect(callCount).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_2800
     * @tc.name testUint16ArraySomePart2028
     * @tc.desc Verify some rejects indexes beyond array bounds
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3]);
        let callCount: int = 0;
        let matchedIndex: int = -1;
        const result: boolean = arr.some((e: number, i: int): boolean => {
          callCount++;
          if (i >= 3) {
            matchedIndex = i;
            return true;
          }
          return false;
        });
        expect(result).assertFalse();
        expect(matchedIndex).assertEqual(-1);
        expect(callCount).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_2900
     * @tc.name testUint16ArraySomePart2029
     * @tc.desc Verify some matches the first odd index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([10, 20, 30, 40]);
        let callCount: int = 0;
        let matchedIndex: int = -1;
        const result: boolean = arr.some((e: number, i: int): boolean => {
          callCount++;
          if (i % 2 !== 0) {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_3000
     * @tc.name testUint16ArraySomePart2030
     * @tc.desc Verify some matches the lower bound of an index range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5, 6, 7]);
        let callCount: int = 0;
        let matchedIndex: int = -1;
        const result: boolean = arr.some((e: number, i: int): boolean => {
          callCount++;
          if (i >= 2 && i <= 4) {
            matchedIndex = i;
            return true;
          }
          return false;
        });
        expect(result).assertTrue();
        expect(matchedIndex).assertEqual(2);
        expect(callCount).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_3100
     * @tc.name testUint16ArraySomePart2031
     * @tc.desc Verify callback index has the int runtime type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3]);
        let idxType: string = '';
        arr.some((e: number, i: int): boolean => {
          if (i === 0) {
            idxType = typeof i;
          }
          return false;
        });
        expect(idxType).assertEqual('int');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_3200
     * @tc.name testUint16ArraySomePart2032
     * @tc.desc Verify some matches the default zero-filled value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array(5);
        const result: boolean = arr.some((e: number): boolean => e === 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_3300
     * @tc.name testUint16ArraySomePart2033
     * @tc.desc Verify some finds Uint16 maximum above sixty thousand
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([65535, 65535, 65535]);
        const result: boolean = arr.some((e: number): boolean => e > 60000);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_3400
     * @tc.name testUint16ArraySomePart2034
     * @tc.desc Verify some rejects positive values in a zero-filled array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array(5);
        const result: boolean = arr.some((e: number): boolean => e > 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_3500
     * @tc.name testUint16ArraySomePart2035
     * @tc.desc Verify some recognizes hexadecimal Uint16 maximum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([0xFFFF, 0x0, 0x8000]);
        const result: boolean = arr.some((e: number): boolean => e === 65535);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_3600
     * @tc.name testUint16ArraySomePart2036
     * @tc.desc Verify some recognizes hexadecimal Uint16 midpoint
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([0x0, 0x8000, 0xFFFF]);
        const result: boolean = arr.some((e: number): boolean => e === 32768);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_3700
     * @tc.name testUint16ArraySomePart2037
     * @tc.desc Verify some recognizes octal Uint16 maximum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([0o177777, 0o0]);
        const result: boolean = arr.some((e: number): boolean => e === 65535);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_3800
     * @tc.name testUint16ArraySomePart2038
     * @tc.desc Verify some recognizes binary Uint16 maximum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([0b1111111111111111, 0b0]);
        const result: boolean = arr.some((e: number): boolean => e === 65535);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_3900
     * @tc.name testUint16ArraySomePart2039
     * @tc.desc Verify some recognizes an exponential literal value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1e4, 2e4, 3e4]);
        const result: boolean = arr.some((e: number): boolean => e === 10000);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_4000
     * @tc.name testUint16ArraySomePart2040
     * @tc.desc Verify some finds a value assigned at a sparse index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array(7);
        arr[3] = 42;
        const result: boolean = arr.some((e: number): boolean => e === 42);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_4100
     * @tc.name testUint16ArraySomePart2041
     * @tc.desc Verify some matches repeated Uint16 midpoint values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([32768, 32768, 32768, 32768]);
        const result: boolean = arr.some((e: number): boolean => e === 32768);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_4200
     * @tc.name testUint16ArraySomePart2042
     * @tc.desc Verify some rejects a threshold above repeated midpoint values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([32768, 32768, 32768]);
        const result: boolean = arr.some((e: number): boolean => e > 50000);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_4300
     * @tc.name testUint16ArraySomePart2043
     * @tc.desc Verify a multiple of 65536 wraps to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array(2);
        arr[0] = 65536 * 2;
        arr[1] = 1;
        const result: boolean = arr.some((e: number): boolean => e === 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_4400
     * @tc.name testUint16ArraySomePart2044
    * @tc.desc Verify fractional negative assignment converts to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array(1);
        arr[0] = -0.5;
        const result: boolean = arr.some((e: number): boolean => e === 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_4500
     * @tc.name testUint16ArraySomePart2045
     * @tc.desc Verify fractional maximum assignment truncates to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array(1);
        arr[0] = 65535.9;
        const result: boolean = arr.some((e: number): boolean => e === 65535);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_4600
     * @tc.name testUint16ArraySomePart2046
     * @tc.desc Verify NaN assignment converts to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array(1);
        arr[0] = Number.NaN;
        const result: boolean = arr.some((e: number): boolean => e === 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_4700
     * @tc.name testUint16ArraySomePart2047
     * @tc.desc Verify positive infinity assignment converts to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array(1);
        arr[0] = Number.POSITIVE_INFINITY;
        const result: boolean = arr.some((e: number): boolean => e === 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_4800
     * @tc.name testUint16ArraySomePart2048
     * @tc.desc Verify negative infinity assignment converts to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array(1);
        arr[0] = -Number.POSITIVE_INFINITY;
        const result: boolean = arr.some((e: number): boolean => e === 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_4900
     * @tc.name testUint16ArraySomePart2049
     * @tc.desc Verify hexadecimal value 0x10000 wraps to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array(1);
        arr[0] = 0x10000;
        const result: boolean = arr.some((e: number): boolean => e === 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_5000
     * @tc.name testUint16ArraySomePart2050
     * @tc.desc Verify hexadecimal 0xFFFFFFFF wraps to Uint16 maximum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array(1);
        arr[0] = 0xFFFFFFFF;
        const result: boolean = arr.some((e: number): boolean => e === 65535);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_5100
     * @tc.name testUint16ArraySomePart2051
     * @tc.desc Verify every predicate returns false for an empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([]);
        const r1: boolean = arr.some((e: number): boolean => e === 0);
        const r2: boolean = arr.some((e: number): boolean => e !== 0);
        const r3: boolean = arr.some((): boolean => true);
        const r4: boolean = arr.some((): boolean => false);
        expect(r1).assertFalse();
        expect(r2).assertFalse();
        expect(r3).assertFalse();
        expect(r4).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_5200
     * @tc.name testUint16ArraySomePart2052
     * @tc.desc Verify empty some never invokes its callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array(0);
        let called: boolean = false;
        const result: boolean = arr.some((e: number): boolean => {
          called = true;
          return false;
        });
        expect(result).assertFalse();
        expect(called).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_5300
     * @tc.name testUint16ArraySomePart2053
     * @tc.desc Verify some finds a value greater than three
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        const result: boolean = arr.some((e: number): boolean => e > 3);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_5400
     * @tc.name testUint16ArraySomePart2054
     * @tc.desc Verify some rejects a threshold above every value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        const result: boolean = arr.some((e: number): boolean => e > 10);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_5500
     * @tc.name testUint16ArraySomePart2055
     * @tc.desc Verify some finds no value divisible by seven
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([100, 200, 300]);
        const result: boolean = arr.some((e: number): boolean => e % 7 === 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_5600
     * @tc.name testUint16ArraySomePart2056
     * @tc.desc Verify some finds a value divisible by seven
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([7, 14, 21]);
        const result: boolean = arr.some((e: number): boolean => e % 7 === 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_5700
     * @tc.name testUint16ArraySomePart2057
     * @tc.desc Verify some identifies a prime value in the array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([5, 10, 15, 20]);
        const result: boolean = arr.some((e: number): boolean => {
          if (e < 2) {
            return false;
          }
          let isPrime: boolean = true;
          for (let d: number = 2; d * d <= e; d++) {
            if (e % d === 0) {
              isPrime = false;
              break;
            }
          }
          return isPrime;
        });
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_5800
     * @tc.name testUint16ArraySomePart2058
     * @tc.desc Verify some satisfies a conjunction range predicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        const result: boolean = arr.some((e: number): boolean => e > 2 && e < 5);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_5900
     * @tc.name testUint16ArraySomePart2059
     * @tc.desc Verify some satisfies a disjunction predicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3]);
        const result: boolean = arr.some((e: number): boolean => e === 0 || e === 3);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_6000
     * @tc.name testUint16ArraySomePart2060
     * @tc.desc Verify some satisfies combined conjunction and disjunction conditions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([10, 20, 30, 40]);
        const result: boolean = arr.some((e: number): boolean => (e > 15 && e < 35) || e === 40);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_6100
     * @tc.name testUint16ArraySomePart2061
     * @tc.desc Verify some rejects an impossible bounded range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([10, 20, 30]);
        const result: boolean = arr.some((e: number): boolean => e > 100 && e < 200);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_6200
     * @tc.name testUint16ArraySomePart2062
     * @tc.desc Verify some recognizes an exponential literal of two hundred
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([1e2, 2e2, 3e2]);
        const result: boolean = arr.some((e: number): boolean => e === 200);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_6300
     * @tc.name testUint16ArraySomePart2063
     * @tc.desc Verify some recognizes hexadecimal eleven
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([0xA, 0xB, 0xC]);
        const result: boolean = arr.some((e: number): boolean => e === 11);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_6400
     * @tc.name testUint16ArraySomePart2064
     * @tc.desc Verify some recognizes hexadecimal 255
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([0xFF, 0x100, 0x101]);
        const result: boolean = arr.some((e: number): boolean => e === 255);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_6500
     * @tc.name testUint16ArraySomePart2065
     * @tc.desc Verify some recognizes hexadecimal Uint16 maximum in a range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array([0x0000, 0x7FFF, 0xFFFF]);
        const result: boolean = arr.some((e: number): boolean => e === 0xFFFF);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_6600
     * @tc.name testUint16ArraySomePart2066
     * @tc.desc Verify some short-circuits in a length-one-hundred-thousand array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array(100000);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_6700
     * @tc.name testUint16ArraySomePart2067
     * @tc.desc Verify some rejects positive values in a large zero-filled array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr: Uint16Array = new Uint16Array(65536);
        const result: boolean = arr.some((e: number): boolean => e > 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_6800
     * @tc.name testUint16ArraySomePart2068
     * @tc.desc Verify some observes mutation of an element not yet visited
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(1, 2, 3);
       const r: boolean = a.some((v: number, i: int, x: Uint16Array): boolean => {
         if (i === 0) {
           x[2] = 30;
         }
         return v === 30;
       });
      expect(r).assertTrue();
      expect(a[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_6900
     * @tc.name testUint16ArraySomePart2069
     * @tc.desc Verify some callback can update the current element before short-circuiting
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(1, 2, 3);
       const r: boolean = a.some((v: number, i: int, x: Uint16Array): boolean => {
         x[i] = v.toInt() * 10;
         return v === 2;
       });
      expect(r).assertTrue();
      expect(a.join(',')).assertEqual('10,20,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_7000
     * @tc.name testUint16ArraySomePart2070
     * @tc.desc Verify some processes only a nonzero buffer view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const b: ArrayBuffer = new ArrayBuffer(10);
       const all: Uint16Array = new Uint16Array(b);
       all.set(Uint16Array.of(99, 2, 4, 6, 99));
       const v: Uint16Array = new Uint16Array(b, 2, 3);
       const r: boolean = v.some((n: number): boolean => n === 99);
      expect(r).assertFalse();
      expect(v.join(',')).assertEqual('2,4,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_7100
     * @tc.name testUint16ArraySomePart2071
     * @tc.desc Verify some uses zero-based indexes for a subarray
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(10, 20, 30, 40);
       const v: Uint16Array = a.subarray(1, 3);
       let found: int = -1;
       const r: boolean = v.some((n: number, i: int): boolean => {
         if (n === 30) {
           found = i;
         }
         return n === 30;
       });
      expect(r).assertTrue();
      expect(found).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_7200
     * @tc.name testUint16ArraySomePart2072
     * @tc.desc Verify some evaluates converted Uint16 values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = new Uint16Array([-1, 65536, 65537]);
       const r: boolean = a.some((n: number, i: int): boolean => i === 2 && n === 1);
      expect(a.join(',')).assertEqual('65535,0,1');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_7300
     * @tc.name testUint16ArraySomePart2073
     * @tc.desc Verify some propagates callback Error and stops iteration
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(1, 2, 3, 4);
       let calls: int = 0;
       try {
         a.some((n: number): boolean => {
           calls++;
           if (n === 2) {
             throw new Error('some stop');
           }
           return false;
         });
         expect().assertFail();
       } catch (e) {
         expect(e.name).assertEqual('Error');
         expect(e.message).assertEqual('some stop');
         expect(calls).assertEqual(2);
       }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_7400
     * @tc.name testUint16ArraySomePart2074
     * @tc.desc Verify some observes writes through a shared alias before reading them
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const b: ArrayBuffer = new ArrayBuffer(6);
       const a: Uint16Array = new Uint16Array(b);
       const alias: Uint16Array = new Uint16Array(b);
       a.set(Uint16Array.of(1, 2, 3));
       const r: boolean = a.some((n: number, i: int): boolean => {
         if (i === 0) {
           alias[2] = 33;
         }
         return n === 33;
       });
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_7500
     * @tc.name testUint16ArraySomePart2075
     * @tc.desc Verify some mutation after a match does not occur for unvisited elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(1, 2, 3);
       const r: boolean = a.some((n: number, i: int, x: Uint16Array): boolean => {
         if (i === 2) {
           x[2] = 30;
         }
         return n === 1;
       });
      expect(r).assertTrue();
      expect(a.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_7600
     * @tc.name testUint16ArraySomePart2076
     * @tc.desc Verify some callback Error from a view preserves backing content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(9, 1, 2, 3, 8);
       const v: Uint16Array = a.subarray(1, 4);
       try {
         v.some((n: number): boolean => {
           throw new Error('view error');
         });
         expect().assertFail();
       } catch (e) {
         expect(e.name).assertEqual('Error');
         expect(e.message).assertEqual('view error');
         expect(a.join(',')).assertEqual('9,1,2,3,8');
       }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_7700
     * @tc.name testUint16ArraySomePart2077
     * @tc.desc Verify some handles a large zero-filled array with a final match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = new Uint16Array(128);
       a[127] = 1;
       let calls: int = 0;
       const r: boolean = a.some((n: number): boolean => {
         calls++;
         return n === 1;
       });
      expect(r).assertTrue();
      expect(calls).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_7800
     * @tc.name testUint16ArraySomePart2078
     * @tc.desc Verify some handles a large array match at the first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = new Uint16Array(128);
       a[0] = 1;
       let calls: int = 0;
       const r: boolean = a.some((n: number): boolean => {
         calls++;
         return n === 1;
       });
      expect(r).assertTrue();
      expect(calls).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_7900
     * @tc.name testUint16ArraySomePart2079
     * @tc.desc Verify some mutation can remove a future match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(1, 2, 3);
       const r: boolean = a.some((n: number, i: int, x: Uint16Array): boolean => {
         if (i === 0) {
           x[2] = 0;
         }
         return n === 3;
       });
      expect(r).assertFalse();
      expect(a.join(',')).assertEqual('1,2,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SOME_PART2_8000
     * @tc.name testUint16ArraySomePart2080
     * @tc.desc Verify some on a copied array is unaffected by source mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySomePart2080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const src: Uint16Array = Uint16Array.of(1, 2, 3);
       const copy: Uint16Array = new Uint16Array(src);
       src[2] = 30;
       const r: boolean = copy.some((n: number): boolean => n === 30);
      expect(r).assertFalse();
      expect(copy.join(',')).assertEqual('1,2,3');
    });

  });
}
