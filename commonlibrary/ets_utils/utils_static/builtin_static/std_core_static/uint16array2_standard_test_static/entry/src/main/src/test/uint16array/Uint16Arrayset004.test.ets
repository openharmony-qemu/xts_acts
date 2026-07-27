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

export default function uint16Arrayset004Test(): void {
  describe('Uint16Arrayset004', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_0100
     * @tc.name testUint16Arrayset004001
       * @tc.desc Verify index zero stores integer variable 10 identically to literal 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(3);
        const b: Uint16Array = new Uint16Array(3);
        const v: int = 10;
        a.set(0, v);
        b.set(0, 10);
        expect(a[0]).assertEqual(10);
        expect(a[0]).assertEqual(b[0]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_0200
     * @tc.name testUint16Arrayset004002
       * @tc.desc Verify index one stores integer variable 255 identically to literal 255
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(3);
        const b: Uint16Array = new Uint16Array(3);
        const v: int = 255;
        a.set(1, v);
        b.set(1, 255);
        expect(a[1]).assertEqual(255);
        expect(a[1]).assertEqual(b[1]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_0300
     * @tc.name testUint16Arrayset004003
      * @tc.desc Verify set with int variable and numeric literal produces the same maximum element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(3);
        const b: Uint16Array = new Uint16Array(3);
        const v: int = 65535;
        a.set(2, v);
        b.set(2, 65535);
        expect(a[2]).assertEqual(65535);
        expect(a[2]).assertEqual(b[2]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_0400
     * @tc.name testUint16Arrayset004004
      * @tc.desc Verify set with int variable and numeric literal zero produces the same element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(3);
        const b: Uint16Array = new Uint16Array(3);
        const v: int = 0;
        a.set(0, v);
        b.set(0, 0);
        expect(a[0]).assertEqual(0);
        expect(a[0]).assertEqual(b[0]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_0500
     * @tc.name testUint16Arrayset004005
      * @tc.desc Verify set with int variable and numeric literal produces the same midpoint element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(3);
        const b: Uint16Array = new Uint16Array(3);
        const v: int = 32768;
        a.set(1, v);
        b.set(1, 32768);
        expect(a[1]).assertEqual(32768);
        expect(a[1]).assertEqual(b[1]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_0600
     * @tc.name testUint16Arrayset004006
     * @tc.desc Verify set(FixedArray<int> source) and set(FixedArray<number> source) with same integer values produce same
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(3);
        const b: Uint16Array = new Uint16Array(3);
        const si: number[] =[1, 2, 3];
        const sn: number[] = [1.0, 2.0, 3.0];
        a.set(si);
        b.set(sn);
        expect(a[0]).assertEqual(1);
        expect(a[0]).assertEqual(b[0]);
        expect(a[1]).assertEqual(2);
        expect(a[1]).assertEqual(b[1]);
        expect(a[2]).assertEqual(3);
        expect(a[2]).assertEqual(b[2]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_0700
     * @tc.name testUint16Arrayset004007
     * @tc.desc Verify set(FixedArray<int> source) and set(FixedArray<number> source) with max value 65535 produce same res
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(2);
        const b: Uint16Array = new Uint16Array(2);
        const si: number[] =[65535, 0];
        const sn: number[] = [65535.0, 0.0];
        a.set(si);
        b.set(sn);
        expect(a[0]).assertEqual(65535);
        expect(a[0]).assertEqual(b[0]);
        expect(a[1]).assertEqual(0);
        expect(a[1]).assertEqual(b[1]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_0800
     * @tc.name testUint16Arrayset004008
     * @tc.desc Verify set(FixedArray<int> source, offset) and set(FixedArray<number> source, offset) with same values at s
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(4);
        const b: Uint16Array = new Uint16Array(4);
        const si: number[] =[10, 20];
        const sn: number[] = [10.0, 20.0];
        a.set(si, 1);
        b.set(sn, 1);
        expect(a[1]).assertEqual(10);
        expect(a[1]).assertEqual(b[1]);
        expect(a[2]).assertEqual(20);
        expect(a[2]).assertEqual(b[2]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_0900
     * @tc.name testUint16Arrayset004009
     * @tc.desc Verify set(Uint16Array) and set(FixedArray<int>) with same content produce identical target state
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(3);
        const b: Uint16Array = new Uint16Array(3);
        const src: Uint16Array = Uint16Array.of(153, 253, 353);
        const arr: number[] =[100, 200, 300];
        a.set(src);
        b.set(arr);
        expect(a[0]).assertEqual(100);
        expect(b[0]).assertEqual(100);
        expect(a[1]).assertEqual(200);
        expect(a[1]).assertEqual(b[1]);
        expect(a[2]).assertEqual(300);
        expect(a[2]).assertEqual(b[2]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_1000
     * @tc.name testUint16Arrayset004010
     * @tc.desc Verify set(Uint16Array, offset) and set(FixedArray<int>, offset) with same content and offset produce ident
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(4);
        const b: Uint16Array = new Uint16Array(4);
        const src: Uint16Array = Uint16Array.of(103, 113);
        const arr: number[] =[50, 60];
        a.set(src, 1);
        b.set(arr, 1);
        expect(a[1]).assertEqual(50);
        expect(a[1]).assertEqual(b[1]);
        expect(a[2]).assertEqual(60);
        expect(a[2]).assertEqual(b[2]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_1100
     * @tc.name testUint16Arrayset004011
     * @tc.desc Verify set(FixedArray<int>, offset) and set(ArrayLike, offset) with same content and offset produce identic
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(4);
        const b: Uint16Array = new Uint16Array(4);
        const si: number[] =[7, 8, 9];
        a.set(si, 0);
        b.set([7, 8, 9], 0);
        expect(a[0]).assertEqual(7);
        expect(b[0]).assertEqual(7);
        expect(a[1]).assertEqual(8);
        expect(a[1]).assertEqual(b[1]);
        expect(a[2]).assertEqual(9);
        expect(a[2]).assertEqual(b[2]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_1200
     * @tc.name testUint16Arrayset004012
     * @tc.desc Verify set(0, 0x100) via (int, number) hex literal and set(0, 256) via (int, E) produce same element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(3);
        const b: Uint16Array = new Uint16Array(3);
        const v: int = 256;
        a.set(0, 0x100);
        b.set(0, v);
        expect(a[0]).assertEqual(256);
        expect(b[0]).assertEqual(256);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_1300
     * @tc.name testUint16Arrayset004013
     * @tc.desc Verify set(0, 0b10) via (int, number) binary literal and set(0, 2) via (int, E) produce same element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(3);
        const b: Uint16Array = new Uint16Array(3);
        const v: int = 2;
        a.set(0, 0b10);
        b.set(0, v);
        expect(a[0]).assertEqual(2);
        expect(b[0]).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_1400
     * @tc.name testUint16Arrayset004014
     * @tc.desc Verify set(0, 0o10) via (int, number) octal literal and set(0, 8) via (int, E) produce same element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(3);
        const b: Uint16Array = new Uint16Array(3);
        const v: int = 8;
        a.set(0, 0o10);
        b.set(0, v);
        expect(a[0]).assertEqual(8);
        expect(b[0]).assertEqual(8);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_1500
     * @tc.name testUint16Arrayset004015
     * @tc.desc Verify set([3.14]) via ArrayLike truncation vs set([3]) via FixedArray<int> produce same element 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(1);
        const b: Uint16Array = new Uint16Array(1);
        const si: number[] =[3];
        a.set([3.14]);
        b.set(si);
        expect(a[0]).assertEqual(3);
        expect(a[0]).assertEqual(b[0]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_1600
     * @tc.name testUint16Arrayset004016
     * @tc.desc Verify set([1e4]) via ArrayLike scientific notation vs set([10000]) via FixedArray<int> produce same elemen
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(1);
        const b: Uint16Array = new Uint16Array(1);
        const si: number[] =[10000];
        a.set([1e4]);
        b.set(si);
        expect(a[0]).assertEqual(10000);
        expect(b[0]).assertEqual(10000);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_1700
     * @tc.name testUint16Arrayset004017
     * @tc.desc Verify set(0, 65536) via (int, number) overflow wrap vs set(0, 0) via (int, E) produce same element (both 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(3);
        const b: Uint16Array = new Uint16Array(3);
        const v: int = 0;
        a.set(0, 65536);
        b.set(0, v);
        expect(a[0]).assertEqual(0);
        expect(b[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_1800
     * @tc.name testUint16Arrayset004018
     * @tc.desc Verify set(0, -1) via (int, number) negative wrap vs set(0, 65535) via (int, E) produce same element (65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(3);
        const b: Uint16Array = new Uint16Array(3);
        const v: int = 65535;
        a.set(0, -1);
        b.set(0, v);
        expect(a[0]).assertEqual(65535);
        expect(b[0]).assertEqual(65535);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_1900
     * @tc.name testUint16Arrayset004019
     * @tc.desc Verify set([65536]) via ArrayLike overflow wraps to [0] vs set([0]) via FixedArray<int> produce same elemen
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(1);
        const b: Uint16Array = new Uint16Array(1);
        const si: number[] =[0];
        a.set([65536]);
        b.set(si);
        expect(a[0]).assertEqual(0);
        expect(b[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_2000
     * @tc.name testUint16Arrayset004020
     * @tc.desc Verify set([-1]) via ArrayLike negative wraps to [65535] vs set([65535]) via FixedArray<int> produce same e
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(1);
        const b: Uint16Array = new Uint16Array(1);
        const si: number[] =[65535];
        a.set([-1]);
        b.set(si);
        expect(a[0]).assertEqual(65535);
        expect(b[0]).assertEqual(65535);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_2100
     * @tc.name testUint16Arrayset004021
     * @tc.desc Verify set(FixedArray<int> source) default offset vs set(FixedArray<int> source, 0) produce same target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(3);
        const b: Uint16Array = new Uint16Array(3);
        const src: number[] =[10, 20, 30];
        a.set(src);
        b.set(src, 0);
        expect(a.join(',')).assertEqual('10,20,30');
        expect(b.join(',')).assertEqual('10,20,30');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_2200
     * @tc.name testUint16Arrayset004022
     * @tc.desc Verify set(FixedArray<number> source) default offset vs set(FixedArray<number> source, 0) produce same targ
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(3);
        const b: Uint16Array = new Uint16Array(3);
        const src: number[] = [1.5, 2.5, 3.5];
        a.set(src);
        b.set(src, 0);
        expect(a.join(',')).assertEqual('1,2,3');
        expect(b.join(',')).assertEqual('1,2,3');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_2300
     * @tc.name testUint16Arrayset004023
     * @tc.desc Verify set(Uint16Array source) default offset vs set(Uint16Array source, 0) produce same target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(3);
        const b: Uint16Array = new Uint16Array(3);
        const src: Uint16Array = Uint16Array.of(153, 253, 353);
        a.set(src);
        b.set(src, 0);
        expect(a.join(',')).assertEqual('100,200,300');
        expect(b.join(',')).assertEqual('100,200,300');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_2400
     * @tc.name testUint16Arrayset004024
     * @tc.desc Verify set(ArrayLike) default offset vs set(ArrayLike, 0) produce same target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(3);
        const b: Uint16Array = new Uint16Array(3);
        a.set([5, 6, 7]);
        b.set([5, 6, 7], 0);
        expect(a.join(',')).assertEqual('5,6,7');
        expect(b.join(',')).assertEqual('5,6,7');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_2500
     * @tc.name testUint16Arrayset004025
     * @tc.desc Verify set(empty FixedArray<int>) default offset vs set(empty, 0) both no-op
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(3);
        const b: Uint16Array = new Uint16Array(3);
        const empty: number[] =[];
        a.set(empty);
        b.set(empty, 0);
        expect(a[0]).assertEqual(0);
        expect(b[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_2600
     * @tc.name testUint16Arrayset004026
     * @tc.desc Verify set(single element FixedArray<int>) default offset vs set(single, 0) produce same element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(3);
        const b: Uint16Array = new Uint16Array(3);
        const src: number[] =[42];
        a.set(src);
        b.set(src, 0);
        expect(a[0]).assertEqual(42);
        expect(b[0]).assertEqual(42);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_2700
     * @tc.name testUint16Arrayset004027
     * @tc.desc Verify Chain set([1]) then set([2], 1) vs single set([1, 2]) produce same target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(2);
        const b: Uint16Array = new Uint16Array(2);
        a.set([1]);
        a.set([2], 1);
        b.set([1, 2]);
        expect(a.join(',')).assertEqual('1,2');
        expect(b.join(',')).assertEqual('1,2');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_2800
     * @tc.name testUint16Arrayset004028
     * @tc.desc Verify Chain set(Uint16Array.of(63)) then set(Uint16Array.of(73), 1) vs single set(Uint16Array.of(63, 73))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(2);
        const b: Uint16Array = new Uint16Array(2);
        a.set(Uint16Array.of(63));
        a.set(Uint16Array.of(73), 1);
        b.set(Uint16Array.of(63, 73));
        expect(a.join(',')).assertEqual('10,20');
        expect(b.join(',')).assertEqual('10,20');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_2900
     * @tc.name testUint16Arrayset004029
     * @tc.desc Verify set default offset on pre-filled target leaves existing elements outside range unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(5);
        t[0] = 99;
        t[4] = 88;
        t.set([1, 2, 3]);
        expect(t[0]).assertEqual(1);
        expect(t[4]).assertEqual(88);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_3000
     * @tc.name testUint16Arrayset004030
     * @tc.desc Verify set(FixedArray<int> source, 0) on pre-filled target vs set(source) default offset produce identical
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = Uint16Array.of(62, 62, 62);
        const b: Uint16Array = Uint16Array.of(62, 62, 62);
        const src: number[] =[4, 5];
        a.set(src);
        b.set(src, 0);
        expect(a.join(',')).assertEqual('4,5,9');
        expect(b.join(',')).assertEqual('4,5,9');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_3100
     * @tc.name testUint16Arrayset004031
     * @tc.desc Verify set(empty Uint16Array) default offset no-op on pre-filled target vs set(empty, 0) no-op
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = Uint16Array.of(54, 55, 56);
        const b: Uint16Array = Uint16Array.of(54, 55, 56);
        const empty: Uint16Array = new Uint16Array(0);
        a.set(empty);
        b.set(empty, 0);
        expect(a[0]).assertEqual(1);
        expect(b[0]).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_3200
     * @tc.name testUint16Arrayset004032
     * @tc.desc Verify set(0, val) via (int, E) returns void (undefined)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        const v: int = 5;
        const r = t.set(0, v);
        expect(r).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_3300
     * @tc.name testUint16Arrayset004033
     * @tc.desc Verify set(0, 5) via (int, number) returns void (undefined)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        const r = t.set(0, 5);
        expect(r).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_3400
     * @tc.name testUint16Arrayset004034
     * @tc.desc Verify set(FixedArray<int>) returns void (undefined)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        const src: number[] =[1, 2, 3];
        const r = t.set(src);
        expect(r).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_3500
     * @tc.name testUint16Arrayset004035
     * @tc.desc Verify set(FixedArray<number>) returns void (undefined)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        const src: number[] = [1.0, 2.0, 3.0];
        const r = t.set(src);
        expect(r).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_3600
     * @tc.name testUint16Arrayset004036
     * @tc.desc Verify set(Uint16Array) returns void (undefined)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        const src: Uint16Array = Uint16Array.of(54, 55, 56);
        const r = t.set(src);
        expect(r).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_3700
     * @tc.name testUint16Arrayset004037
     * @tc.desc Verify set(ArrayLike) returns void (undefined)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        const r = t.set([1, 2, 3]);
        expect(r).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_3800
     * @tc.name testUint16Arrayset004038
     * @tc.desc Verify toString after set via (int, E) shows correct values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        const v: int = 7;
        t.set(0, v);
        t.set(1, 8);
        t.set(2, 9);
        expect(t.toString()).assertEqual("7,8,9");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_3900
     * @tc.name testUint16Arrayset004039
     * @tc.desc Verify toString after set via FixedArray<E> shows correct values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        const src: number[] =[10, 20, 30];
        t.set(src);
        expect(t.toString()).assertEqual("10,20,30");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_4000
     * @tc.name testUint16Arrayset004040
     * @tc.desc Verify toString after set via Uint16Array shows correct values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        t.set(Uint16Array.of(64, 75, 86));
        expect(t.toString()).assertEqual("11,22,33");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_4100
     * @tc.name testUint16Arrayset004041
     * @tc.desc Verify toString after set via ArrayLike shows correct values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        t.set([44, 55, 66]);
        expect(t.toString()).assertEqual("44,55,66");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_4200
     * @tc.name testUint16Arrayset004042
     * @tc.desc Verify length unchanged after set via any overload
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(5);
        const src: number[] =[1, 2, 3];
        t.set(src);
        expect(t.length).assertEqual(5);
        expect(t.join(',')).assertEqual('1,2,3,0,0');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_4300
     * @tc.name testUint16Arrayset004043
     * @tc.desc Verify byteLength unchanged after set via any overload
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(5);
        const bl: int = t.byteLength;
        t.set([1, 2, 3]);
        expect(t.byteLength).assertEqual(bl);
        expect(t.join(',')).assertEqual('1,2,3,0,0');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_4400
     * @tc.name testUint16Arrayset004044
      * @tc.desc Verify set writes source elements and preserves the next position
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(5);
        t.set(Uint16Array.of(54, 55));
        expect(t[0]).assertEqual(1);
        expect(t[1]).assertEqual(2);
        expect(t[2]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_4500
     * @tc.name testUint16Arrayset004045
     * @tc.desc Verify buffer reference unchanged after set via any overload
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(5);
        const buf = t.buffer;
        const src: number[] =[1, 2, 3];
        t.set(src);
        expect(t.buffer).assertEqual(buf);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_4600
     * @tc.name testUint16Arrayset004046
     * @tc.desc Verify byteOffset unchanged after set via any overload
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(5);
        const bo: int = t.byteOffset;
        t.set([10, 20]);
        expect(t.byteOffset).assertEqual(bo);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_4700
     * @tc.name testUint16Arrayset004047
     * @tc.desc Verify join(',') after set via different overloads with same content shows identical string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(3);
        const b: Uint16Array = new Uint16Array(3);
        const src: number[] =[5, 6, 7];
        a.set(src);
        b.set([5, 6, 7]);
        expect(a.join(",")).assertEqual('5,6,7');
        expect(b.join(",")).assertEqual('5,6,7');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_4800
     * @tc.name testUint16Arrayset004048
     * @tc.desc Verify Non-overwritten elements preserved after set(FixedArray<int>, offset)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(5);
        t[0] = 11;
        t[4] = 55;
        const src: number[] =[22, 33, 44];
        t.set(src, 1);
        expect(t[0]).assertEqual(11);
        expect(t[1]).assertEqual(22);
        expect(t[2]).assertEqual(33);
        expect(t[3]).assertEqual(44);
        expect(t[4]).assertEqual(55);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_4900
     * @tc.name testUint16Arrayset004049
     * @tc.desc Verify Non-overwritten elements preserved after set(Uint16Array, offset)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(4);
        t[0] = 99;
        t[3] = 88;
        t.set(Uint16Array.of(63, 73), 1);
        expect(t[0]).assertEqual(99);
        expect(t[1]).assertEqual(10);
        expect(t[2]).assertEqual(20);
        expect(t[3]).assertEqual(88);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_5000
     * @tc.name testUint16Arrayset004050
     * @tc.desc Verify set(FixedArray<int> source, -1) throws RangeError, target length unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        const src: number[] =[1, 2];
        const len: int = t.length;
        try {
          t.set(src, -1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
        expect(t.length).assertEqual(len);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_5100
     * @tc.name testUint16Arrayset004051
     * @tc.desc Verify set(FixedArray<number> source, -1) throws RangeError, target byteLength unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        const src: number[] = [1.0, 2.0];
        const bl: int = t.byteLength;
        try {
          t.set(src, -1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
        expect(t.byteLength).assertEqual(bl);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_5200
     * @tc.name testUint16Arrayset004052
     * @tc.desc Verify set(Uint16Array source, -1) throws RangeError, target length unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        const src: Uint16Array = Uint16Array.of(54, 55);
        const len: int = t.length;
        try {
          t.set(src, -1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
        expect(t.length).assertEqual(len);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_5300
     * @tc.name testUint16Arrayset004053
     * @tc.desc Verify set(ArrayLike, -1) throws RangeError, target byteOffset unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        const bo: int = t.byteOffset;
        try {
          t.set([1, 2], -1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
        expect(t.byteOffset).assertEqual(bo);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_5400
     * @tc.name testUint16Arrayset004054
     * @tc.desc Verify set(FixedArray<int> source, 100) huge offset throws RangeError, target unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        const src: number[] =[1];
        const len: int = t.length;
        try {
          t.set(src, 100);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
        expect(t.length).assertEqual(len);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_5500
     * @tc.name testUint16Arrayset004055
     * @tc.desc Verify set(source too large, 0) throws RangeError when source exceeds target length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = Uint16Array.of(62, 61);
        const src: number[] =[1, 2, 3];
        try {
          t.set(src);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
        expect(t.join(',')).assertEqual('9,8');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_5600
     * @tc.name testUint16Arrayset004056
     * @tc.desc Verify set(source, offset) throws RangeError when source at offset exceeds target remaining space
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        const src: number[] =[1, 2];
        const len: int = t.length;
        try {
          t.set(src, 2);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
        expect(t.length).assertEqual(len);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_5700
     * @tc.name testUint16Arrayset004057
     * @tc.desc Verify set(Uint16Array source, offset) throws RangeError when source at offset exceeds target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        const src: Uint16Array = Uint16Array.of(54, 55);
        const len: int = t.length;
        try {
          t.set(src, 2);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
        expect(t.length).assertEqual(len);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_5800
     * @tc.name testUint16Arrayset004058
     * @tc.desc Verify After catching RangeError from set with bad offset, target still usable for valid set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        const src: number[] =[1, 2];
        try {
          t.set(src, -1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
        t.set(src, 0);
        expect(t[0]).assertEqual(1);
        expect(t[1]).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_5900
     * @tc.name testUint16Arrayset004059
     * @tc.desc Verify After catching RangeError, target buffer reference unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        const buf = t.buffer;
        try {
          t.set([1, 2, 3, 4], 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
        expect(t.buffer).assertEqual(buf);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_6000
     * @tc.name testUint16Arrayset004060
     * @tc.desc Verify Multiple catches in sequence, instance still functional
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(4);
        let caught: int = 0;
        try {
          t.set([1, 2, 3, 4, 5]);
          expect().assertFail();
        } catch (e) {
          caught++;
          expect(e.name).assertEqual('RangeError');
        }
        try {
          t.set([1, 2, 3], -1);
          expect().assertFail();
        } catch (e) {
          caught++;
          expect(e.name).assertEqual('RangeError');
        }
        try {
          t.set([1, 2, 3, 4, 5], 0);
          expect().assertFail();
        } catch (e) {
          caught++;
          expect(e.name).assertEqual('RangeError');
        }
        expect(caught).assertEqual(3);
        t.set([10, 20], 0);
        expect(t[0]).assertEqual(10);
        expect(t[1]).assertEqual(20);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_6100
     * @tc.name testUint16Arrayset004061
     * @tc.desc Verify set(empty source, offset=length) succeeds at boundary (no-op)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        const empty: number[] =[];
        t.set(empty, 3);
        expect(t[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_6200
     * @tc.name testUint16Arrayset004062
     * @tc.desc Verify set(empty Uint16Array, offset=length) succeeds at boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        const empty: Uint16Array = new Uint16Array(0);
        t.set(empty, 3);
        expect(t.length).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_6300
     * @tc.name testUint16Arrayset004063
     * @tc.desc Verify set(ArrayLike, -5) large negative offset throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        try {
          t.set([1], -5);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_6400
     * @tc.name testUint16Arrayset004064
     * @tc.desc Verify set(FixedArray<number> source too large) throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(2);
        const src: number[] = [1.0, 2.0, 3.0];
        try {
          t.set(src);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_6500
     * @tc.name testUint16Arrayset004065
     * @tc.desc Verify set(Uint16Array source too large for remaining space at offset) throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        const src: Uint16Array = Uint16Array.of(54, 55);
        try {
          t.set(src, 2);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_6600
     * @tc.name testUint16Arrayset004066
     * @tc.desc Verify set(0, 65536) via (int, number) overflow wraps to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set(0, 65536);
        expect(t[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_6700
     * @tc.name testUint16Arrayset004067
     * @tc.desc Verify set(0, -1) via (int, number) negative wraps to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set(0, -1);
        expect(t[0]).assertEqual(65535);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_6800
     * @tc.name testUint16Arrayset004068
     * @tc.desc Verify set(0, 3.14) via (int, number) truncates to 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set(0, 3.14);
        expect(t[0]).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_6900
     * @tc.name testUint16Arrayset004069
     * @tc.desc Verify set(0, 65535.9) via (int, number) truncates to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set(0, 65535.9);
        expect(t[0]).assertEqual(65535);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_7000
     * @tc.name testUint16Arrayset004070
      * @tc.desc Verify set(0, -0.5) via (int, number) truncates to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set(0, -0.5);
        expect(t[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_7100
     * @tc.name testUint16Arrayset004071
     * @tc.desc Verify set(0, Infinity) via (int, number) truncates to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set(0, Number.POSITIVE_INFINITY);
        expect(t[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_7200
     * @tc.name testUint16Arrayset004072
     * @tc.desc Verify set(0, -Infinity) via (int, number) truncates to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set(0, -Number.POSITIVE_INFINITY);
        expect(t[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_7300
     * @tc.name testUint16Arrayset004073
     * @tc.desc Verify set(0, NaN) via (int, number) truncates to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set(0, Number.NaN);
        expect(t[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_7400
     * @tc.name testUint16Arrayset004074
     * @tc.desc Verify set([65536]) via ArrayLike overflow wraps to [0]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set([65536]);
        expect(t[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_7500
     * @tc.name testUint16Arrayset004075
     * @tc.desc Verify set([-1]) via ArrayLike negative wraps to [65535]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set([-1]);
        expect(t[0]).assertEqual(65535);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_7600
     * @tc.name testUint16Arrayset004076
     * @tc.desc Verify set([3.14, 2.7]) via ArrayLike truncates to [3, 2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(2);
        t.set([3.14, 2.7]);
        expect(t[0]).assertEqual(3);
        expect(t[1]).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_7700
     * @tc.name testUint16Arrayset004077
     * @tc.desc Verify set([65535.9]) via ArrayLike truncates to [65535]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set([65535.9]);
        expect(t[0]).assertEqual(65535);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_7800
     * @tc.name testUint16Arrayset004078
      * @tc.desc Verify set([-0.5]) via ArrayLike truncates to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set([-0.5]);
        expect(t[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_7900
     * @tc.name testUint16Arrayset004079
     * @tc.desc Verify set([Infinity]) via ArrayLike truncates to [0]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set([Number.POSITIVE_INFINITY]);
        expect(t[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_8000
     * @tc.name testUint16Arrayset004080
     * @tc.desc Verify set([-Infinity]) via ArrayLike truncates to [0]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set([-Number.POSITIVE_INFINITY]);
        expect(t[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_8100
     * @tc.name testUint16Arrayset004081
     * @tc.desc Verify set([NaN]) via ArrayLike truncates to [0]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set([Number.NaN]);
        expect(t[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_8200
     * @tc.name testUint16Arrayset004082
     * @tc.desc Verify set([0x10000]) via ArrayLike hex overflow wraps to [0]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set([0x10000]);
        expect(t[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_8300
     * @tc.name testUint16Arrayset004083
     * @tc.desc Verify set([1e5]) via ArrayLike scientific notation overflow wraps to 34464 (100000 % 65536)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set([1e5]);
        expect(t[0]).assertEqual(34464);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_8400
     * @tc.name testUint16Arrayset004084
     * @tc.desc Verify set([65536, -1, 3.14]) via ArrayLike multiple overflow values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        t.set([65536, -1, 3.14]);
        expect(t[0]).assertEqual(0);
        expect(t[1]).assertEqual(65535);
        expect(t[2]).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_8500
     * @tc.name testUint16Arrayset004085
     * @tc.desc Verify set([-65536]) via ArrayLike wraps to [0]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set([-65536]);
        expect(t[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_8600
     * @tc.name testUint16Arrayset004086
     * @tc.desc Verify set([0xFFFF]) via ArrayLike hex max value 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set([0xFFFF]);
        expect(t[0]).assertEqual(65535);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_8700
     * @tc.name testUint16Arrayset004087
     * @tc.desc Verify set(FixedArray<number> source with floats) truncation produces same as set(FixedArray<int> truncated
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(3);
        const b: Uint16Array = new Uint16Array(3);
        const fn: number[] = [1.9, 2.1, 3.99];
        const ii: number[] =[1, 2, 3];
        a.set(fn);
        b.set(ii);
        expect(a[0]).assertEqual(b[0]);
        expect(a[1]).assertEqual(b[1]);
        expect(a[2]).assertEqual(b[2]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_8800
     * @tc.name testUint16Arrayset004088
     * @tc.desc Verify set(FixedArray<number> with overflow floats) vs set(FixedArray<int> with wrapped) same result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(2);
        const b: Uint16Array = new Uint16Array(2);
        const fn: number[] = [65536.9, -1.5];
        const ii: number[] =[0, 65535];
        a.set(fn);
        b.set(ii);
        expect(a[0]).assertEqual(b[0]);
        expect(a[1]).assertEqual(b[1]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_8900
     * @tc.name testUint16Arrayset004089
     * @tc.desc Verify set from Uint16Array: modifying source after set does not affect target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const src: Uint16Array = Uint16Array.of(63, 73, 83);
        const t: Uint16Array = new Uint16Array(3);
        t.set(src);
        src[0] = 99;
        expect(t[0]).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_9000
     * @tc.name testUint16Arrayset004090
     * @tc.desc Verify set from Uint16Array: modifying target after set does not affect source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const src: Uint16Array = Uint16Array.of(63, 73, 83);
        const t: Uint16Array = new Uint16Array(3);
        t.set(src);
        t[0] = 99;
        expect(src[0]).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_9100
     * @tc.name testUint16Arrayset004091
     * @tc.desc Verify set from ArrayLike: source array unchanged after set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const src: number[] =[5, 6, 7];
        const t: Uint16Array = new Uint16Array(3);
        t.set(src);
        t[0] = 99;
        expect(src[0]).assertEqual(5);
        expect(src[1]).assertEqual(6);
        expect(src[2]).assertEqual(7);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_9200
     * @tc.name testUint16Arrayset004092
     * @tc.desc Verify set from FixedArray<int>: source unchanged after set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const src: number[] =[100, 200];
        const t: Uint16Array = new Uint16Array(3);
        t.set(src);
        t[1] = 99;
        expect(src[0]).assertEqual(100);
        expect(src[1]).assertEqual(200);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_9300
     * @tc.name testUint16Arrayset004093
     * @tc.desc Verify set from FixedArray<number>: source unchanged after set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const src: number[] = [1.5, 2.5];
        const t: Uint16Array = new Uint16Array(3);
        t.set(src);
        t[0] = 99;
        expect(src[0]).assertEqual(1.5);
        expect(src[1]).assertEqual(2.5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_9400
     * @tc.name testUint16Arrayset004094
     * @tc.desc Verify Multiple targets set from same Uint16Array source are independent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const src: Uint16Array = Uint16Array.of(60, 61, 62);
        const a: Uint16Array = new Uint16Array(3);
        const b: Uint16Array = new Uint16Array(3);
        a.set(src);
        b.set(src);
        a[0] = 0;
        expect(b[0]).assertEqual(7);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_9500
     * @tc.name testUint16Arrayset004095
     * @tc.desc Verify set from Uint16Array: target.buffer !== source.buffer (separate buffers)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const src: Uint16Array = Uint16Array.of(54, 55);
        const t: Uint16Array = new Uint16Array(2);
        t.set(src);
        expect(t.buffer).not().assertEqual(src.buffer);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_9600
     * @tc.name testUint16Arrayset004096
     * @tc.desc Verify Multiple targets set from same FixedArray<int> are independent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const src: number[] =[3, 4];
        const a: Uint16Array = new Uint16Array(2);
        const b: Uint16Array = new Uint16Array(2);
        a.set(src);
        b.set(src);
        a[0] = 99;
        expect(b[0]).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_9700
     * @tc.name testUint16Arrayset004097
     * @tc.desc Verify set overwrites previous values at target indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = Uint16Array.of(54, 55, 56);
        t.set([10, 20]);
        expect(t[0]).assertEqual(10);
        expect(t[1]).assertEqual(20);
        expect(t[2]).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_9800
     * @tc.name testUint16Arrayset004098
     * @tc.desc Verify set only modifies indices in range, leaves others unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(5);
        t[0] = 11;
        t[4] = 55;
        t.set([22, 33], 1);
        expect(t[0]).assertEqual(11);
        expect(t[1]).assertEqual(22);
        expect(t[2]).assertEqual(33);
        expect(t[3]).assertEqual(0);
        expect(t[4]).assertEqual(55);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_9900
     * @tc.name testUint16Arrayset004099
     * @tc.desc Verify set from Uint16Array.of() - elements are copied, not referenced
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(2);
        const src: Uint16Array = Uint16Array.of(95, 96);
        t.set(src);
        src[0] = 0;
        src[1] = 0;
        expect(t[0]).assertEqual(42);
        expect(t[1]).assertEqual(43);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_10000
     * @tc.name testUint16Arrayset004100
     * @tc.desc Verify Cross-check target[i] after set equals source[i] for each element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const src: number[] =[10, 20, 30, 40, 50];
        const t: Uint16Array = new Uint16Array(5);
        t.set(src);
        for (let i: int = 0; i < 5; i++) {
          expect(t[i]).assertEqual(src[i]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_10100
     * @tc.name testUint16Arrayset004101
     * @tc.desc Verify Cross-check target[i+offset] after set(offset) equals source[i] for each element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const src: number[] =[100, 200];
        const t: Uint16Array = new Uint16Array(4);
        t[0] = 1;
        t.set(src, 2);
        expect(t[2]).assertEqual(100);
        expect(t[3]).assertEqual(200);
        expect(t[0]).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_10200
     * @tc.name testUint16Arrayset004102
     * @tc.desc Verify set from Uint16Array subarray: elements copied, not buffer-shared
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const full: Uint16Array = Uint16Array.of(54, 55, 56, 57, 58);
        const sub: Uint16Array = full.subarray(1, 3);
        const t: Uint16Array = new Uint16Array(2);
        t.set(sub);
        full[1] = 99;
        full[2] = 88;
        expect(t[0]).assertEqual(2);
        expect(t[1]).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_10300
     * @tc.name testUint16Arrayset004103
     * @tc.desc Verify set from same FixedArray<int> to multiple targets produces independent copies
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const src: number[] =[5, 5, 5];
        const a: Uint16Array = new Uint16Array(3);
        const b: Uint16Array = new Uint16Array(3);
        a.set(src);
        b.set(src);
        a[0] = 1;
        b[1] = 2;
        expect(a[1]).assertEqual(5);
        expect(b[0]).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET004_10400
     * @tc.name testUint16Arrayset004104
     * @tc.desc Verify set from Uint16Array then verify source's buffer identity differs from target's buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset004104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const src: Uint16Array = new Uint16Array(3);
        src[0] = 1;
        const t: Uint16Array = new Uint16Array(3);
        t.set(src);
        expect(t.buffer).not().assertEqual(src.buffer);
      }
    });

  });
}
