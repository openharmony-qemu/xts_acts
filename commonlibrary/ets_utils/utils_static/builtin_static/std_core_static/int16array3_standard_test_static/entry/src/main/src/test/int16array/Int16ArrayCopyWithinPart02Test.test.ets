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
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int16ArrayCopyWithinPart02Test(): void {
  describe('Int16ArrayCopyWithinPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART02_0100
     * @tc.name int16ArrayCopyWithinPart02Test001
     * @tc.desc Merged batch (5 tests): views and shared buffers: parent observation, buffer identity, sibling-view visibility and offset-view copies.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify subarray copyWithin makes parent array observe changes ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(12);
        let arr: Int16Array = new Int16Array(buf);
        arr.$_set(0, 32767 as short);
        arr.$_set(1, -1 as short);
        arr.$_set(2, 3 as short);
        arr.$_set(3, -3 as short);
        arr.$_set(4, 100 as short);
        arr.$_set(5, 200 as short);
        let sub: Int16Array = arr.subarray(1, 4);
        sub.copyWithin(0, 1);
        expect(arr.$_get(1)).assertEqual(3);
      }

      // --- [2] Verify ArrayBuffer-backed copyWithin keeps same buffer reference ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let arr: Int16Array = new Int16Array(buf);
        arr.$_set(0, 32767 as short);
        arr.$_set(1, -1 as short);
        arr.$_set(2, 3 as short);
        arr.$_set(3, -3 as short);
        let ret: Int16Array = arr.copyWithin(0, 2);
        expect(ret.buffer).assertEqual(buf);
      }

      // --- [3] Verify subarray copyWithin is observed by a sibling view at the modified positions ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let arr: Int16Array = new Int16Array(buf);
        arr.$_set(0, 32767 as short);
        arr.$_set(1, -1 as short);
        arr.$_set(2, 3 as short);
        arr.$_set(3, -3 as short);
        arr.$_set(4, 100 as short);
        arr.$_set(5, 200 as short);
        arr.$_set(6, 300 as short);
        arr.$_set(7, 400 as short);
        let sub1: Int16Array = arr.subarray(0, 4);
        let sub2: Int16Array = arr.subarray(0, 2);
        sub1.copyWithin(0, 2);
        expect(sub2.$_get(0)).assertEqual(3);
        expect(sub2.$_get(1)).assertEqual(-3);
        expect(arr.$_get(2)).assertEqual(3);
        expect(arr.$_get(3)).assertEqual(-3);
        expect(arr.$_get(4)).assertEqual(100);
      }

      // --- [4] Verify non-zero-offset view copyWithin(0,2) copies the trailing pair to the front ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let arr: Int16Array = new Int16Array(buf, 4, 4);
        arr.$_set(0, 32767);
        arr.$_set(1, -1);
        arr.$_set(2, 3);
        arr.$_set(3, -3);
        arr.copyWithin(0, 2);
        expect(arr.join(',')).assertEqual('3,-3,3,-3');
      }

      // --- [5] Verify non-zero-offset view copyWithin(0,1) shifts the remaining elements to the front ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(12);
        let view: Int16Array = new Int16Array(buf, 6, 3);
        view.$_set(0, 4);
        view.$_set(1, 5);
        view.$_set(2, 6);
        view.copyWithin(0, 1);
        let exp: int[] = [5, 6, 6];
        for (let i: int = 0; i < exp.length; i++) {
          expect(view.$_get(i)).assertEqual(exp[i]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART02_0200
     * @tc.name int16ArrayCopyWithinPart02Test002
     * @tc.desc Merged batch (4 tests): boundary values and truncation: $_set overflow, mixed float truncation, large-array transfer and MAX/MIN refill.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify $_set overflow truncation to int16 range is passed through copyWithin ---
      {
        let cases: int[][] = [[32768, -32768], [-32769, 32767]];
        for (let i: int = 0; i < cases.length; i++) {
          let arr: Int16Array = new Int16Array(4);
          arr.$_set(0, 100);
          arr.$_set(1, 200);
          arr.$_set(2, cases[i][0]);
          arr.$_set(3, 300);
          let ret: Int16Array = arr.copyWithin(0, 2);
          expect(ret.$_get(0)).assertEqual(cases[i][1]);
        }
      }

      // --- [2] Verify float truncation mixed array is preserved by copyWithin ---
      {
        let arr: Int16Array = Int16Array.of(3.7, -3.7, 0.5, -0.5, 32767, -1);
        let ret: Int16Array = arr.copyWithin(0, 4);
        expect(ret.$_get(0)).assertEqual(32767);
        expect(ret.$_get(1)).assertEqual(-1);
      }

      // --- [3] Verify large-array copyWithin transfers truncated values correctly ---
      {
        let arr: Int16Array = new Int16Array(10);
        arr.$_set(0, 1);
        arr.$_set(1, 2);
        arr.$_set(2, 3);
        arr.$_set(3, 4);
        arr.$_set(4, 5);
        arr.$_set(5, 32767);
        arr.$_set(6, -1);
        arr.$_set(7, 32768);
        arr.$_set(8, -32769);
        arr.$_set(9, 0);
        let ret: Int16Array = arr.copyWithin(0, 5);
        expect(ret.$_get(0)).assertEqual(32767);
        expect(ret.$_get(1)).assertEqual(-1);
        expect(ret.$_get(2)).assertEqual(-32768);
        expect(ret.$_get(3)).assertEqual(32767);
        expect(ret.$_get(4)).assertEqual(0);
      }

      // --- [4] Verify two-arg copyWithin(0,1) on uniform int16.MAX keeps all three elements then a three-arg copyWithin(1,0,2) on the same array refilled with int16.MIN keeps all three ---
      {
        let arr: Int16Array = Int16Array.of(32767, 32767, 32767);
        arr.copyWithin(0, 1);
        let count: int = 0;
        arr.forEach((value: number): void => {
          if (value === 32767) {
            count = count + 1;
          }
        });
        expect(count).assertEqual(3);
        arr.fill(-32768);
        arr.copyWithin(1, 0, 2);
        expect(arr.$_get(0)).assertEqual(-32768);
        expect(arr.$_get(1)).assertEqual(-32768);
        expect(arr.$_get(2)).assertEqual(-32768);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART02_0300
     * @tc.name int16ArrayCopyWithinPart02Test003
     * @tc.desc Merged batch (5 tests): return value and chaining: reverse chain, reference identity, double chain, fill/reverse composition and $_get.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify copyWithin() returns this Int16Array and a chained reverse() reorders the copied elements ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50, 60, 70, 80);
        expect(arr.copyWithin(0, 2, 4)).assertEqual(arr);

        let arr7: Int16Array = Int16Array.of(10, 20, 30, 40, 50, 60, 70, 80);
        arr7.copyWithin(0, 6, 8).reverse();
        expect(arr7.$_get(0)).assertEqual(80);
        expect(arr7.$_get(1)).assertEqual(70);
      }

      // --- [2] Verify copyWithin return value is the same object reference as original array ---
      {
        let arr: Int16Array = Int16Array.of(32767 as short, -1 as short, 3 as short);
        let ret: Int16Array = arr.copyWithin(0, 1);
        expect(ret).assertEqual(arr);
        expect(ret.buffer).assertEqual(arr.buffer);

        let r_3: boolean = ArrayBuffer.isView(ret);
        expect(r_3).assertTrue();
      }

      // --- [3] Verify chained copyWithin(0,2).copyWithin(1,0) applies both copies on the same array ---
      {
        let arr: Int16Array = Int16Array.of(32767, -1, 3, -3, 100);
        arr.copyWithin(0, 2).copyWithin(1, 0);
        expect(arr.join(',')).assertEqual('3,3,-3,100,-3');
      }

      // --- [4] Verify copyWithin(0,1) chained with copyWithin(0,2), fill(7,3,4) or reverse() each composes on the same array ---
      {
        let arr1: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        arr1.copyWithin(0, 1).copyWithin(0, 2);
        expect(arr1.join(',')).assertEqual('4,5,5,5,5');

        let arr2: Int16Array = Int16Array.of(10, 20, 30, 40);
        arr2.copyWithin(0, 1).fill(7, 3, 4);
        expect(arr2.join(',')).assertEqual('20,30,40,7');

        let arr3: Int16Array = Int16Array.of(5, 6, 7, 8);
        arr3.copyWithin(0, 1).reverse();
        expect(arr3.join(',')).assertEqual('8,8,7,6');
      }

      // --- [5] Verify chained copyWithin(0,1).$_get(0) returns element value ---
      {
        let arr: Int16Array = Int16Array.of(100 as short, 32767 as short, -1 as short);
        expect(arr.copyWithin(0, 1).$_get(0)).assertEqual(32767);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART02_0400
     * @tc.name int16ArrayCopyWithinPart02Test004
     * @tc.desc Merged batch (3 tests): overlap and snapshot semantics: shifts in both directions read the pre-copy snapshot, and a window taken from preceding elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify copyWithin() copies a snapshot for both left-shifting and right-shifting overlaps ---
      {
        let right: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        right.copyWithin(1, 0, 4);
        let left: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        left.copyWithin(0, 1, 4);
        expect(right.join(',')).assertEqual('1,1,2,3,4');
        expect(left.join(',')).assertEqual('2,3,4,4,5');
      }

      // --- [2] Verify overlapping copyWithin() where the source window precedes the target copies correctly ---
      {
        let arr: Int16Array = Int16Array.of(-100, -200, -300, -400, -500);
        arr.copyWithin(1, 0, 3);
        expect(arr.$_get(1)).assertEqual(-100);
        expect(arr.$_get(2)).assertEqual(-200);
        expect(arr.$_get(3)).assertEqual(-300);
      }

      // --- [3] Verify copyWithin(1,0,3) on an overlapping from(Map.values()) array copies the head into the following slots ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 3);
        m.set('b', 6);
        m.set('c', 9);
        m.set('d', 12);
        let arr: Int16Array = Int16Array.from(m.values());
        arr.copyWithin(1, 0, 3);
        let exp: int[] = [3, 3, 6, 9];
        for (let i: int = 0; i < exp.length; i++) {
          expect(arr.$_get(i)).assertEqual(exp[i]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART02_0500
     * @tc.name int16ArrayCopyWithinPart02Test005
     * @tc.desc Merged batch (5 tests): post-copy reads and derived consumers: indexOf, filter, reduce, findIndex and toReversed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify indexOf(100) is 0 and indexOf(200) is 1 on the copyWithin(2,0,2) result ---
      {
        let arr: Int16Array = Int16Array.of(100, 200, 300, 400);
        arr.copyWithin(2, 0, 2);
        expect(arr.indexOf(100)).assertEqual(0);
        expect(arr.indexOf(200)).assertEqual(1);
        expect(arr.$_get(2)).assertEqual(100);
        expect(arr.$_get(3)).assertEqual(200);
      }

      // --- [2] Verify filter(v<=20) over the copyWithin(2,0,2) result keeps four elements ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
        arr.copyWithin(2, 0, 2);
        let filtered: Int16Array = arr.filter((v: number, _idx: int, _src: Int16Array): boolean => {
          return v <= 20;
        });
        expect(filtered.length).assertEqual(4);
        expect(arr.$_get(2)).assertEqual(10);
      }

      // --- [3] Verify reduce summing the copyWithin(0,2,4) result from initial 0 yields 14 ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        arr.copyWithin(0, 2, 4);
        let sum: number = arr.reduce((acc: number, v: number, _idx: int, _src: Int16Array): number => {
          return acc + v;
        }, 0);
        expect(sum).assertEqual(14);
      }

      // --- [4] Verify findIndex(v===66) over the copyWithin(1,3,4) result returns 1 ---
      {
        let arr: Int16Array = Int16Array.of(99, 88, 77, 66);
        arr.copyWithin(1, 3, 4);
        let pos: int = arr.findIndex((v: number, _idx: int, _src: Int16Array): boolean => {
          return v === 66;
        });
        expect(pos).assertEqual(1);
        expect(arr.$_get(1)).assertEqual(66);
      }

      // --- [5] Verify copyWithin(1,3,5) then toReversed() reverses the copied array leaving the source unmutated ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5, 6);
        arr.copyWithin(1, 3, 5);
        let rev: Int16Array = arr.toReversed();
        expect(rev.$_get(0)).assertEqual(6);
        expect(rev.$_get(5)).assertEqual(1);
        expect(arr.$_get(3)).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART02_0600
     * @tc.name int16ArrayCopyWithinPart02Test006
     * @tc.desc Merged batch (5 tests): post-copy reads and derived consumers: some(), at(-2), findLastIndex, Map frequency count and findLast.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify some() on a copyWithin(0,1,3) result of a from(Map.values()) array confirms the copied front value ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 5);
        m.set('b', 6);
        m.set('c', 7);
        m.set('d', 8);
        let arr: Int16Array = Int16Array.from(m.values());
        arr.copyWithin(0, 1, 3);
        let hasSix: boolean = arr.some((v: number, _idx: int, _src: Int16Array): boolean => {
          return v === 6;
        });
        expect(hasSix).assertTrue();
        expect(arr.$_get(0)).assertEqual(6);
        expect(arr.$_get(2)).assertEqual(7);
      }

      // --- [2] Verify at(-2) on a copyWithin(1,2,4) result of an array built from an Array literal reads the third element ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
        arr.copyWithin(1, 2, 4);
        expect(arr.at(-2)).assertEqual(4);
        expect(arr.$_get(1)).assertEqual(3);
      }

      // --- [3] Verify findLastIndex on a copyWithin(1,3,5) result of a from(Map.values()) array finds the last matching index ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 2);
        m.set('b', 7);
        m.set('c', 4);
        m.set('d', 7);
        m.set('e', 1);
        m.set('f', 6);
        let arr: Int16Array = Int16Array.from(m.values());
        arr.copyWithin(1, 3, 5);
        expect(arr.findLastIndex((v: number, i: int, a2: Int16Array): boolean => v === 7)).assertEqual(3);
      }

      // --- [4] Verify a Map frequency count of a copyWithin(0,2) result yields two distinct values each seen twice ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        arr.copyWithin(0, 2);
        let counts: Map<int, int> = new Map<int, int>();
        for (let i: int = 0; i < arr.length; i++) {
          let v: int = arr.$_get(i).toInt();
          let c: int | undefined = counts.get(v);
          counts.set(v, c === undefined ? 1 : c + 1);
        }
        expect(counts.size).assertEqual(2);
        expect(counts.get(3)).assertEqual(2);
      }

      // --- [5] Verify findLast on a copyWithin(0,1,3) result of a from(Map.keys()) array returns the last key below a threshold ---
      {
        let m: Map<number, string> = new Map<number, string>();
        m.set(2, 'a');
        m.set(5, 'b');
        m.set(8, 'c');
        m.set(11, 'd');
        let arr: Int16Array = Int16Array.from(m.keys());
        arr.copyWithin(0, 1, 3);
        expect(arr.findLast((v: number, i: int, a2: Int16Array): boolean => v < 8)).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART02_0700
     * @tc.name int16ArrayCopyWithinPart02Test007
     * @tc.desc Merged batch (2 tests): construction sources: a negative target over a $_set-filled array, and Set-held int16 boundaries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify copyWithin(-2,0,2) on a length-constructed array filled via $_set copies the source window into the last two slots ---
      {
        let arr: Int16Array = new Int16Array(5);
        for (let i: int = 0; i < 5; i++) {
          arr.$_set(i, i + 1);
        }
        arr.copyWithin(-2, 0, 2);
        let exp: int[] = [1, 2, 3, 1, 2];
        for (let i: int = 0; i < exp.length; i++) {
          expect(arr.$_get(i)).assertEqual(exp[i]);
        }
      }

      // --- [2] Verify copyWithin(1,0,2) on an array built by from(Set) holding the int16 boundaries duplicates the boundary element into index 1 ---
      {
        let s: Set<int> = new Set<int>();
        s.add(32767);
        s.add(-32768);
        s.add(0);
        let arr: Int16Array = Int16Array.from(s);
        arr.copyWithin(1, 0, 2);
        expect(arr.join(',')).assertEqual('32767,32767,-32768');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART02_0800
     * @tc.name int16ArrayCopyWithinPart02Test008
     * @tc.desc Merged batch (5 tests): clamping, negative and no-op forms: target at/over length, end clamp, reversed start/end and empty range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify copyWithin three-arg, omitted-end and negative-target forms, and no-op when target equals length ---
      {
        let arr1: Int16Array = Int16Array.of(9, 18, 27, 36, 45);
        arr1.copyWithin(0, 3, 5);
        expect(arr1.join(',')).assertEqual('36,45,27,36,45');

        let arr2: Int16Array = Int16Array.of(2, 4, 6, 8);
        arr2.copyWithin(1, 2);
        expect(arr2.join(',')).assertEqual('2,6,8,8');

        let arr3: Int16Array = Int16Array.of(11, 22, 33, 44);
        arr3.copyWithin(-1, 0, 2);
        expect(arr3.join(',')).assertEqual('11,22,33,11');

        let arr4: Int16Array = Int16Array.of(50, 100, 150, 200);
        arr4.copyWithin(10, 0, 3);
        expect(arr4.join(',')).assertEqual('50,100,150,200');

        let arr5: Int16Array = Int16Array.of(99);
        arr5.copyWithin(0, 0, 1);
        expect(arr5.join(',')).assertEqual('99');
      }

      // --- [2] Verify target>=length copyWithin leaves all elements unchanged ---
      {
        let arr: Int16Array = Int16Array.of(44, 55, 66, 77);
        let before: number[] = Array.from(arr);
        arr.copyWithin(4, 0, 3);
        let after: number[] = Array.from(arr);
        expect(after).assertDeepEquals(before);
      }

      // --- [3] Verify end beyond length is clamped and copyWithin copies to end ---
      {
        let arr: Int16Array = Int16Array.of(17, 34, 51, 68);
        arr.copyWithin(0, 2, 100);
        expect(arr.length).assertEqual(4);
        expect(arr.$_get(0)).assertEqual(51);
        expect(arr.$_get(1)).assertEqual(68);
      }

      // --- [4] Verify copyWithin normal, omitted-end, negative-index and reversed start/end forms, and no-op for empty ranges ---
      {
        let arr1: Int16Array = Int16Array.of(1, 2, 3, 4, 5, 6);
        arr1.copyWithin(1, 3, 5);
        expect(arr1.join(',')).assertEqual('1,4,5,4,5,6');

        let arr2: Int16Array = Int16Array.of(6, 12, 18, 24, 30);
        arr2.copyWithin(2, 4);
        expect(arr2.join(',')).assertEqual('6,12,30,24,30');

        let arr3: Int16Array = Int16Array.of(8, 16, 24, 32, 40);
        arr3.copyWithin(-4, -5, -2);
        expect(arr3.join(',')).assertEqual('8,8,16,24,40');

        let arr4: Int16Array = Int16Array.of(3, 6, 9, 12);
        arr4.copyWithin(4, 0, 3);
        expect(arr4.join(',')).assertEqual('3,6,9,12');

        let arr5: Int16Array = Int16Array.of(10, 20, 30, 40);
        arr5.copyWithin(0, 3, 1);
        expect(arr5.join(',')).assertEqual('10,20,30,40');

        let arr6: Int16Array = Int16Array.of(Number.NaN, 2, 4, 6);
        arr6.copyWithin(1, 0, 2);
        expect(arr6.join(',')).assertEqual('0,0,2,6');

        let arr7: Int16Array = Int16Array.of(77);
        arr7.copyWithin(0, 0, 1);
        expect(arr7.join(',')).assertEqual('77');
      }

      // --- [5] Verify copyWithin copies the expected elements for omitted-end and clamped argument forms ---
      {
        let arr1: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        arr1.copyWithin(1, 2, 4);
        expect(arr1.join(',')).assertEqual('1,3,4,4,5');

        let arr2: Int16Array = Int16Array.of(7, 14, 21, 28);
        arr2.copyWithin(1, 3);
        expect(arr2.join(',')).assertEqual('7,28,21,28');

        let arr3: Int16Array = Int16Array.of(9, 18, 27, 36, 45);
        arr3.copyWithin(-2, -5, -3);
        expect(arr3.join(',')).assertEqual('9,18,27,9,18');

        let arr4: Int16Array = Int16Array.of(5, 10, 15);
        arr4.copyWithin(3, 0, 1);
        expect(arr4.join(',')).assertEqual('5,10,15');

        let arr5: Int16Array = Int16Array.of(2, 4, 6, 8, 10);
        arr5.copyWithin(0, 4, 1);
        expect(arr5.join(',')).assertEqual('2,4,6,8,10');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART02_0900
     * @tc.name int16ArrayCopyWithinPart02Test009
     * @tc.desc Merged batch (5 tests): copyWithin argument matrix: trailing pair, sort composition, fill/reverse sequence, partial-fit and middle pair.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify copyWithin(1,3,5) copies the trailing pair onto index 1 and the result exposes the moved tail ---
      {
        let arr: Int16Array = Int16Array.of(3, 6, 9, 12, 15);
        let moved: Int16Array = arr.copyWithin(1, 3, 5);
        expect(moved.join(':')).assertEqual('3:12:15:12:15');
        expect(moved.at(-1)).assertEqual(15);
      }

      // --- [2] Verify sort() applied after copyWithin(1,0,2) sorts the rearranged array into ascending order ---
      {
        let arr: Int16Array = Int16Array.of(30, 10, 40, 20, 50);
        arr.copyWithin(1, 0, 2).sort();
        expect(arr.$_get(0)).assertEqual(10);
        expect(arr.$_get(1)).assertEqual(20);
        expect(arr.$_get(2)).assertEqual(30);
        expect(arr.$_get(3)).assertEqual(30);
        expect(arr.$_get(4)).assertEqual(50);
      }

      // --- [3] Verify copyWithin(0,2,4), fill(99,3,5) and reverse() compose in sequence to the expected element order ---
      {
        let arr: Int16Array = Int16Array.of(5, 15, 25, 35, 45);
        let ret: Int16Array = arr.copyWithin(0, 2, 4);
        ret.fill(99, 3, 5);
        ret.reverse();
        expect(arr.$_get(4)).assertEqual(25);
        expect(arr.$_get(3)).assertEqual(35);
        expect(arr.$_get(2)).assertEqual(25);
        expect(arr.$_get(1)).assertEqual(99);
        expect(arr.$_get(0)).assertEqual(99);
      }

      // --- [4] Verify copyWithin(4,0,6) copies only the elements that fit and leaves the front slots intact ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5, 6);
        arr.copyWithin(4, 0, 6);
        expect(arr.join(',')).assertEqual('1,2,3,4,1,2');
        expect(arr.$_get(0)).assertEqual(1);
        expect(arr.$_get(4)).assertEqual(1);
        expect(arr.$_get(5)).assertEqual(2);
      }

      // --- [5] Verify copyWithin(1,2,4) copies the trailing pair onto the middle slots ---
      {
        let arr: Int16Array = Int16Array.of(5, 10, 15, 20);
        arr.copyWithin(1, 2, 4);
        let got: number[] = Array.from(arr);
        let want: number[] = [5, 15, 20, 20];
        expect(got).assertDeepEquals(want);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART02_1000
     * @tc.name int16ArrayCopyWithinPart02Test010
     * @tc.desc Merged batch (5 tests): views and shared buffers: buffer identity, DataView readback and sibling-view visibility of copies.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify copyWithin on an array built by from(Map.keys()) keeps the original ArrayBuffer reference ---
      {
        let m: Map<number, string> = new Map<number, string>();
        m.set(9, 'i');
        m.set(8, 'h');
        m.set(7, 'g');
        let arr: Int16Array = Int16Array.from(m.keys());
        let buf: ArrayBuffer = arr.buffer;
        arr.copyWithin(0, 1);
        expect(arr.buffer).assertEqual(buf);
        expect(arr.$_get(0)).assertEqual(8);
      }

      // --- [2] Verify DataView.getInt16 reads the element copied to the front by copyWithin(0,1,2) on a buffer-backed array ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let arr: Int16Array = new Int16Array(buf);
        arr.$_set(0, 100);
        arr.$_set(1, 200);
        arr.$_set(2, 300);
        arr.$_set(3, 400);
        arr.copyWithin(0, 1, 2);
        let dv: DataView = new DataView(buf);
        expect(dv.getInt16(0, true)).assertEqual(200);
      }

      // --- [3] Verify copyWithin moves a DataView-written element to the front, readable through both Int16Array and DataView ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let arr: Int16Array = new Int16Array(buf);
        let dv: DataView = new DataView(buf);
        dv.setInt16(2, 321, true);
        arr.copyWithin(0, 1, 3);
        expect(arr.$_get(0)).assertEqual(321);
        expect(dv.getInt16(0, true)).assertEqual(321);
      }

      // --- [4] Verify DataView.getInt16 sees the element copied by a negative-target copyWithin on a buffer-backed view ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let arr: Int16Array = new Int16Array(buf);
        arr.$_set(0, 11);
        arr.$_set(1, 22);
        arr.$_set(2, 33);
        arr.$_set(3, 44);
        arr.copyWithin(-2, 0, 2);
        let dv: DataView = new DataView(buf);
        expect(dv.getInt16(4, true)).assertEqual(11);
      }

      // --- [5] Verify copyWithin(1, 3, 5) on shared buffer updates sibling views ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(10);
        let view1: Int16Array = new Int16Array(buf, 0, 5);
        view1.set(Int16Array.of(1, 2, 3, 4, 5));
        let view2: Int16Array = new Int16Array(buf, 2, 4);
        view1.copyWithin(1, 3, 5);
        expect(view2.$_get(0)).assertEqual(4);
        expect(view2.$_get(1)).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART02_1100
     * @tc.name int16ArrayCopyWithinPart02Test011
     * @tc.desc Merged batch (5 tests): boundary values and truncation: int16 MAX/MIN preservation across explicit, negative and $_set-written forms.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify Int16Array.copyWithin(0, 1, 2) preserves int16 MAX(32767) and MIN(-32768) values ---
      {
        let cases: int[][] = [
          [32767, 32767],
          [-32768, -32768]
        ];
        for (let i: int = 0; i < cases.length; i++) {
          let arr: Int16Array = Int16Array.of(1, cases[i][0], 3, 4);
          arr.copyWithin(0, 1, 2);
          expect(arr.$_get(0)).assertEqual(cases[i][1]);
        }
      }

      // --- [2] Verify copyWithin() copies an element written via $_set preserving its int16 truncation ---
      {
        let arr: Int16Array = new Int16Array(4);
        arr.$_set(0, 32768);
        arr.$_set(1, 10);
        arr.$_set(2, 20);
        arr.$_set(3, 30);
        arr.copyWithin(1, 0, 1);
        expect(arr.$_get(1)).assertEqual(-32768);
      }

      // --- [3] Verify copyWithin(0,1,3) on a from(Map.values()) array holding the int16 boundaries copies 32767 to the front ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', -32768);
        m.set('b', 32767);
        m.set('c', 0);
        let arr: Int16Array = Int16Array.from(m.values());
        arr.copyWithin(0, 1, 3);
        let first: number = arr.$_get(0);
        let second: number = arr.$_get(1);
        expect(first).assertEqual(32767);
        expect(second).assertEqual(0);
      }

      // --- [4] Verify copyWithin() copies 32768 stored as MIN and -32769 stored as MAX between adjacent slots ---
      {
        let sources: int[][] = [[32768, 100, 200], [200, -32769, 300]];
        let targets: int[] = [1, 0];
        let starts: int[] = [0, 1];
        let ends: int[] = [1, 2];
        let checkedIndices: int[] = [1, 0];
        let expected: int[] = [-32768, 32767];
        for (let i: int = 0; i < sources.length; i++) {
          let arr: Int16Array = Int16Array.from(sources[i]);
          arr.copyWithin(targets[i], starts[i], ends[i]);
          expect(arr.$_get(checkedIndices[i])).assertEqual(expected[i]);
        }
      }

      // --- [5] Verify copyWithin(1, 2, 3) preserves int16 MAX value ---
      {
        let arr: Int16Array = Int16Array.of(0, 0, 32767, 0);
        let source: number = arr.$_get(2);
        arr.copyWithin(1, 2, 3);
        let moved: number = arr.$_get(1);
        expect(moved).assertEqual(source);
        expect(moved).assertEqual(32767);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART02_1200
     * @tc.name int16ArrayCopyWithinPart02Test012
     * @tc.desc Merged batch (5 tests): return value and chaining: fill chain, copy-constructed and length-constructed identity, and one-arg write.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify chained fill(99).copyWithin(0,1) reflects filled values ---
      {
        let arr: Int16Array = Int16Array.of(32767 as short, -1 as short, 3 as short, -3 as short);
        let ret: Int16Array = arr.fill(99 as short).copyWithin(0, 1);
        expect(ret.$_get(0)).assertEqual(99);
      }

      // --- [2] Verify copyWithin(0,1,3) on an array built by from(Set) returns the identical object reference and writes the source element to the front ---
      {
        let s: Set<int> = new Set<int>();
        s.add(3);
        s.add(6);
        s.add(9);
        let arr: Int16Array = Int16Array.from(s);
        let ref: Int16Array = arr.copyWithin(0, 1, 3);
        expect(ref).assertEqual(arr);
        expect(ref.$_get(0)).assertEqual(6);
      }

      // --- [3] Verify copyWithin(1,0,2) on a copy-constructed array returns the identical object reference and writes the source element to index 1 ---
      {
        let arr: Int16Array = new Int16Array(Int16Array.of(4, 5, 6, 7));
        expect(arr.copyWithin(1, 0, 2)).assertEqual(arr);
        expect(arr.$_get(1)).assertEqual(4);
      }

      // --- [4] Verify copyWithin() on a length-constructed array filled via $_set returns this same reference and writes to the front ---
      {
        let arr: Int16Array = new Int16Array(4);
        for (let i: int = 0; i < 4; i++) {
          arr.$_set(i, i + 1);
        }
        let ref: Int16Array = arr.copyWithin(0, 2, 4);
        expect(ref).assertEqual(arr);
        expect(arr.$_get(0)).assertEqual(3);
      }

      // --- [5] Verify one-arg copyWithin(3) returns the same reference and writes the first element to index 3 ---
      {
        let arr: Int16Array = Int16Array.of(11, 22, 33, 44, 55);
        expect(arr.copyWithin(3)).assertEqual(arr);
        expect(arr.$_get(3)).assertEqual(11);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART02_1300
     * @tc.name int16ArrayCopyWithinPart02Test013
     * @tc.desc Merged batch (5 tests): post-copy reads and derived consumers: duplicate-key indexOf/lastIndexOf, entries sum and indexes, keys and endpoint reads.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify copyWithin(1,0,2) on an array built by from(Map.keys()) duplicates the first key so indexOf and lastIndexOf diverge ---
      {
        let m: Map<number, string> = new Map<number, string>();
        m.set(2, 'b');
        m.set(4, 'd');
        m.set(6, 'f');
        let arr: Int16Array = Int16Array.from(m.keys());
        arr.copyWithin(1, 0, 2);
        let first: number = arr.indexOf(2);
        let last: number = arr.lastIndexOf(2);
        expect(first).assertEqual(0);
        expect(last).assertEqual(1);
      }

      // --- [2] Verify summing entry values of copyWithin(0,1,3) with entries() yields the copied total ---
      {
        let arr: Int16Array = Int16Array.of(3, 6, 9, 12);
        arr.copyWithin(0, 1, 3);
        let sum: number = 0;
        for (const e of arr.entries()) {
          sum = sum + e[1];
        }
        expect(sum).assertEqual(36);
      }

      // --- [3] Verify entries() on copyWithin(1,0,2) exposes contiguous indexes with the copied element at index 1 ---
      {
        let arr: Int16Array = Int16Array.of(7, 8, 9);
        arr.copyWithin(1, 0, 2);
        let idxText: string = '';
        let valText: string = '';
        for (const e of arr.entries()) {
          idxText = idxText + e[0] + ';';
          valText = valText + e[1] + ';';
        }
        expect(idxText).assertEqual('0;1;2;');
        expect(valText).assertEqual('7;7;8;');
      }

      // --- [4] Verify keys() on a copyWithin(0,2,4) result yields the contiguous index sequence starting at 0 ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
        arr.copyWithin(0, 2, 4);
        expect(arr.join(',')).assertEqual('30,40,30,40,50');
        let keys: int[] = [];
        for (const k of arr.keys()) {
          keys.push(k);
        }
        expect(keys.length).assertEqual(5);
        expect(keys[0]).assertEqual(0);
        expect(keys[4]).assertEqual(4);
      }

      // --- [5] Verify at() reads the front and last elements of a copyWithin(0,2,4) result ---
      {
        let arr: Int16Array = Int16Array.of(4, 8, 12, 16, 20);
        arr.copyWithin(0, 2, 4);
        let first: number | undefined = arr.at(0);
        let last: number | undefined = arr.at(-1);
        expect(first).assertEqual(12);
        expect(last).assertEqual(20);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART02_1400
     * @tc.name int16ArrayCopyWithinPart02Test014
     * @tc.desc Merged batch (5 tests): post-copy reads and derived consumers: toSorted, with() substitute, findLastIndex, findLast and reduceRight.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify copyWithin(0,2,4) then toSorted() yields an ascending array ---
      {
        let arr: Int16Array = Int16Array.of(9, 3, 7, 1, 5);
        arr.copyWithin(0, 2, 4);
        let sorted: Int16Array = arr.toSorted();
        expect(sorted.$_get(0)).assertEqual(1);
        expect(sorted.$_get(4)).assertEqual(7);
      }

      // --- [2] Verify with(0, a substitute value) on a copyWithin(0,1,3) result returns a modified copy while the original keeps the first element ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
        arr.copyWithin(0, 1, 3);
        let nv: number = 99;
        let copied: Int16Array = arr.with(0, nv);
        expect(copied.$_get(0)).assertEqual(99);
        expect(copied.$_get(1)).assertEqual(30);
        expect(arr.$_get(0)).assertEqual(20);
      }

      // --- [3] Verify findLastIndex matching a value on a copyWithin(1,3,5) result yields the matching index ---
      {
        let arr: Int16Array = Int16Array.of(5, 15, 25, 35, 45);
        arr.copyWithin(1, 3, 5);
        let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int16Array): boolean => {
          return v === 35;
        });
        let want: int = 3;
        expect(idx).assertEqual(want);
      }

      // --- [4] Verify findLast with a less-than predicate on a copyWithin(0,2,4) result returns the last matching element ---
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6, 8, 10);
        arr.copyWithin(0, 2, 4);
        let found: number = arr.findLast((v: number, _i: int, _a: Int16Array): boolean => {
          return v < 7;
        });
        let want: int = 6;
        expect(found).assertEqual(want);
      }

      // --- [5] Verify reduceRight summing with initial 0 on a copyWithin(1,2,4) result yields the expected total ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        arr.copyWithin(1, 2, 4);
        let acc0: number = 0;
        let total: number = arr.reduceRight((acc: number, cur: number, _i: int, _a: Int16Array): number => {
          return acc + cur;
        }, acc0);
        let want: int = 12;
        expect(total).assertEqual(want);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART02_1500
     * @tc.name int16ArrayCopyWithinPart02Test015
     * @tc.desc Single test: a from(Map.keys()) array and its copy both join to the same key text once copyWithin() has run.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify join() of a from(Map.keys()) array and of a copy of it after copyWithin() reflect the copied keys ---
      {
        let m: Map<number, string> = new Map<number, string>();
        m.set(3, 'a');
        m.set(1, 'b');
        m.set(4, 'c');
        m.set(2, 'd');
        let arr: Int16Array = Int16Array.from(m.keys());
        arr.copyWithin(0, 2, 4);
        let copy: Int16Array = Int16Array.from(arr);
        expect(arr.join(',')).assertEqual('4,2,4,2');
        expect(copy.join(',')).assertEqual('4,2,4,2');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART02_1600
     * @tc.name int16ArrayCopyWithinPart02Test016
     * @tc.desc Merged batch (5 tests): clamping, negative and no-op forms: target/start/end matrix, out-of-range no-op, empty array, negative start and negative-target clamp.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify copyWithin() target/start/end matrix: in-range windows copy while out-of-range or clamped args are no-ops ---
      {
        let src: int[] = [10, 20, 30, 40, 50, 60, 70, 80];
        let noOp: int[][] = [
          [0, 0, 8], [0, 3, 3], [8, 0, 3], [9, 0, 3], [18, 0, 3], [32767, 0, 3], [2147483647, 0, 3],
          [0, 0, 3], [0, 8, 8], [0, 9, 8], [0, -11, 8], [0, 32767, 8], [0, -2147483648, 3], [0, 5, 3],
          [2, 2, 5], [0, 5, 2], [2, 3, 0], [0, 0, -32768], [0, 4, -2147483648], [9, 2, 8], [100, 0, 3],
          [0, 100, 8], [2147483647, 2147483647, 2147483647], [0, -32768, -32768],
        ];
        let cases: int[][] = [
          [0, 5, 8, 60, 70, 80, 40, 50, 60, 70, 80],
          [1, 3, 8, 10, 40, 50, 60, 70, 80, 70, 80],
          [0, 2, 5, 30, 40, 50, 40, 50, 60, 70, 80],
          [0, 4, 6, 50, 60, 30, 40, 50, 60, 70, 80],
          [1, 5, 7, 10, 60, 70, 40, 50, 60, 70, 80],
          [2, 0, 3, 10, 20, 10, 20, 30, 60, 70, 80],
          [5, 0, 3, 10, 20, 30, 40, 50, 10, 20, 30],
          [6, 0, 3, 10, 20, 30, 40, 50, 60, 10, 20],
          [7, 0, 3, 10, 20, 30, 40, 50, 60, 70, 10],
          [-1, 0, 3, 10, 20, 30, 40, 50, 60, 70, 10],
          [-2, 0, 3, 10, 20, 30, 40, 50, 60, 10, 20],
          [-3, 0, 3, 10, 20, 30, 40, 50, 10, 20, 30],
          [-7, 4, 6, 10, 50, 60, 40, 50, 60, 70, 80],
          [-8, 4, 6, 50, 60, 30, 40, 50, 60, 70, 80],
          [-9, 4, 6, 50, 60, 30, 40, 50, 60, 70, 80],
          [-11, 4, 6, 50, 60, 30, 40, 50, 60, 70, 80],
          [-32768, 4, 6, 50, 60, 30, 40, 50, 60, 70, 80],
          [0, 3, 6, 40, 50, 60, 40, 50, 60, 70, 80],
          [3, 0, 4, 10, 20, 30, 10, 20, 30, 40, 80],
          [5, 0, 6, 10, 20, 30, 40, 50, 10, 20, 30],
          [0, 6, 8, 70, 80, 30, 40, 50, 60, 70, 80],
          [0, 4, 5, 50, 20, 30, 40, 50, 60, 70, 80],
          [0, 1, 4, 20, 30, 40, 40, 50, 60, 70, 80],
          [0, 7, 8, 80, 20, 30, 40, 50, 60, 70, 80],
          [0, -1, 8, 80, 20, 30, 40, 50, 60, 70, 80],
          [0, -2, 8, 70, 80, 30, 40, 50, 60, 70, 80],
          [0, -3, 8, 60, 70, 80, 40, 50, 60, 70, 80],
          [0, -7, 8, 20, 30, 40, 50, 60, 70, 80, 80],
          [2, -8, 8, 10, 20, 10, 20, 30, 40, 50, 60],
          [2, -9, 8, 10, 20, 10, 20, 30, 40, 50, 60],
          [2, -32768, 8, 10, 20, 10, 20, 30, 40, 50, 60],
          [0, 4, 8, 50, 60, 70, 80, 50, 60, 70, 80],
          [2, 4, 8, 10, 20, 50, 60, 70, 80, 70, 80],
          [0, 4, 9, 50, 60, 70, 80, 50, 60, 70, 80],
          [0, 4, 18, 50, 60, 70, 80, 50, 60, 70, 80],
          [0, 4, -1, 50, 60, 70, 40, 50, 60, 70, 80],
          [0, 4, -2, 50, 60, 30, 40, 50, 60, 70, 80],
          [0, -4, -2, 50, 60, 30, 40, 50, 60, 70, 80],
          [5, 0, 1, 10, 20, 30, 40, 50, 10, 70, 80],
          [0, 4, 32767, 50, 60, 70, 80, 50, 60, 70, 80],
          [0, 4, 2147483647, 50, 60, 70, 80, 50, 60, 70, 80],
          [0, 6, 100, 70, 80, 30, 40, 50, 60, 70, 80],
          [6, 0, 8, 10, 20, 30, 40, 50, 60, 10, 20],
          [4, 0, 6, 10, 20, 30, 40, 10, 20, 30, 40],
        ];
        for (let i: int = 0; i < noOp.length; i++) {
          let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50, 60, 70, 80);
          arr.copyWithin(noOp[i][0], noOp[i][1], noOp[i][2]);
          for (let j: int = 0; j < 8; j++) {
            let actualElement: number = arr.$_get(j);
            let expectedElement: int = src[j];
            expect(actualElement).assertEqual(expectedElement);
          }
        }
        for (let i: int = 0; i < cases.length; i++) {
          let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50, 60, 70, 80);
          arr.copyWithin(cases[i][0], cases[i][1], cases[i][2]);
          for (let j: int = 0; j < 8; j++) {
            let actualElement: number = arr.$_get(j);
            let expectedElement: int = cases[i][3 + j];
            expect(actualElement).assertEqual(expectedElement);
          }
        }
      }

      // --- [2] Verify copyWithin() with an out-of-range target is a no-op returning this, and length-1 self-copy is identity ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50, 60, 70, 80);
        expect(arr.copyWithin(9, 0, 3)).assertEqual(arr);
        expect(arr.$_get(0)).assertEqual(10);

        let arr10: Int16Array = Int16Array.of(99);
        arr10.copyWithin(0, 0, 1);
        expect(arr10.$_get(0)).assertEqual(99);
      }

      // --- [3] Verify empty array copyWithin is a no-op: length stays 0 and it does not throw ---
      {
        let arr: Int16Array = new Int16Array(0);
        let ret: Int16Array = arr.copyWithin(0, 0);
        expect(ret.length).assertEqual(0);

        let arr2: Int16Array = new Int16Array(0);
        arr2.copyWithin(-1, 0);
        expect(arr2.length).assertEqual(0);

        let arr3: Int16Array = new Int16Array(0);
        arr3.copyWithin(0, -1);
        expect(arr3.length).assertEqual(0);

        let arr4: Int16Array = new Int16Array(0);
        let ret4: Int16Array = arr4.copyWithin(0, 0, 0);
        expect(ret4.length).assertEqual(0);
      }

      // --- [4] Verify copyWithin(0,-2) normalizes the negative start and copies the trailing window to the front ---
      {
        let arr: Int16Array = Int16Array.of(5, 6, 7);
        arr.copyWithin(0, -2);
        expect(arr.join(',')).assertEqual('6,7,7');
      }

      // --- [5] Verify one-arg copyWithin() with a negative target clamps it relative to length ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        arr.copyWithin(-2);
        expect(arr.reduce((acc: number, v: number, i: int, a2: Int16Array): number => acc + v, 0)).assertEqual(9);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART02_1700
     * @tc.name int16ArrayCopyWithinPart02Test017
     * @tc.desc Merged batch (2 tests): clamping, negative and no-op forms: negative/out-of-range/two-arg variants, and -1/-4/-2 negative-index resolution.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify copyWithin copies the expected elements across negative, out-of-range, and two-arg forms ---
      {
        let arr1: Int16Array = Int16Array.of(11, 22, 33, 44);
        arr1.copyWithin(1, 2, 4);
        expect(arr1.join(',')).assertEqual('11,33,44,44');

        let arr2: Int16Array = Int16Array.of(3, 6, 9, 12);
        arr2.copyWithin(-2, -4, -1);
        expect(arr2.join(',')).assertEqual('3,6,3,6');

        let arr3: Int16Array = Int16Array.of(8, 16, 24);
        arr3.copyWithin(5, 0, 2);
        expect(arr3.join(',')).assertEqual('8,16,24');

        let arr4: Int16Array = Int16Array.of(100, 200, 300, 400);
        arr4.copyWithin(0, 2);
        expect(arr4.join(',')).assertEqual('300,400,300,400');
      }

      // --- [2] Verify copyWithin(-1,-4,-2) resolves negative indices and copies the leading element to the last slot ---
      {
        let arr: Int16Array = Int16Array.of(3, 6, 9, 12);
        arr.copyWithin(-1, -4, -2);
        expect(arr.join(',')).assertEqual('3,6,9,3');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART02_1800
     * @tc.name int16ArrayCopyWithinPart02Test018
     * @tc.desc Merged batch (5 tests): copyWithin argument matrix: fill-then-copy, reverse-then-copy, chained fill composition, set() overwrite and values() iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify fill(99,3,5) then copyWithin(0,3,5) spreads the filled pair back over the front ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        arr.fill(99, 3, 5);
        arr.copyWithin(0, 3, 5);
        expect(arr.$_get(0)).assertEqual(99);
        expect(arr.$_get(1)).assertEqual(99);
        expect(arr.$_get(2)).assertEqual(3);
        expect(arr.$_get(3)).assertEqual(99);
        expect(arr.$_get(4)).assertEqual(99);
      }

      // --- [2] Verify reverse() followed by copyWithin(2,0,2) duplicates the reversed head into the tail ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        arr.reverse();
        arr.copyWithin(2, 0, 2);
        expect(arr.$_get(0)).assertEqual(4);
        expect(arr.$_get(1)).assertEqual(3);
        expect(arr.$_get(2)).assertEqual(4);
        expect(arr.$_get(3)).assertEqual(3);
      }

      // --- [3] Verify copyWithin followed by fill mutates the same array for explicit, chained and omitted-end windows ---
      {
        let inputs: number[][] = [[1, 2, 3, 4, 5], [10, 20, 30, 40, 50], [5, 10, 15, 20, 25]];
        let starts: int[] = [3, 3, 3];
        let ends: int[] = [5, 5, 0];
        let omitEnd: boolean[] = [false, false, true];
        let fillStarts: int[] = [1, 0, 4];
        let fillEnds: int[] = [3, 1, 5];
        let expected: string[] = ['4,0,0,4,5', '0,50,30,40,50', '20,25,15,20,0'];
        for (let c: int = 0; c < inputs.length; c++) {
          let arr: Int16Array = Int16Array.from(inputs[c]);
          if (omitEnd[c]) {
            arr.copyWithin(0, starts[c]).fill(0, fillStarts[c], fillEnds[c]);
          } else {
            arr.copyWithin(0, starts[c], ends[c]).fill(0, fillStarts[c], fillEnds[c]);
          }
          expect(arr.join(',')).assertEqual(expected[c]);
        }
      }

      // --- [4] Verify copyWithin(2,0,2) then set([88,99],0) overwrites the front pair ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        arr.copyWithin(2, 0, 2);
        arr.set(Int16Array.of(88, 99), 0);
        expect(arr.$_get(0)).assertEqual(88);
        expect(arr.$_get(1)).assertEqual(99);
        expect(arr.$_get(2)).assertEqual(1);
        expect(arr.$_get(3)).assertEqual(2);
        expect(arr.$_get(4)).assertEqual(5);
      }

      // --- [5] Verify values() iteration after copyWithin() reflects the copied elements ---
      {
        let arr: Int16Array = Int16Array.of(9, 8, 7, 6);
        arr.copyWithin(1, 2, 4);
        let iter: IterableIterator<Number> = arr.values();
        let n1: IteratorResult<Number> = iter.next();
        let n2: IteratorResult<Number> = iter.next();
        let n3: IteratorResult<Number> = iter.next();
        let n4: IteratorResult<Number> = iter.next();
        expect(n1.value as number).assertEqual(9);
        expect(n2.value as number).assertEqual(7);
        expect(n3.value as number).assertEqual(6);
        expect(n4.value as number).assertEqual(6);
      }
    });

  });
}
