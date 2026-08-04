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

export default function uint16ArraySetPart4Test(): void {
  describe('Uint16ArraySetPart4Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0010
     * @tc.name testUint16ArraySetPart4001
       * @tc.desc Verify index zero stores integer variable 10 identically to literal 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0020
     * @tc.name testUint16ArraySetPart4002
       * @tc.desc Verify index one stores integer variable 255 identically to literal 255
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0030
     * @tc.name testUint16ArraySetPart4003
      * @tc.desc Verify set with int variable and numeric literal produces the same maximum element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0040
     * @tc.name testUint16ArraySetPart4004
      * @tc.desc Verify set with int variable and numeric literal zero produces the same element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0050
     * @tc.name testUint16ArraySetPart4005
      * @tc.desc Verify set with int variable and numeric literal produces the same midpoint element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0060
     * @tc.name testUint16ArraySetPart4006
     * @tc.desc Verify set(FixedArray<int> source) and set(FixedArray<number> source) with same integer values produce same
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0070
     * @tc.name testUint16ArraySetPart4007
     * @tc.desc Verify set(FixedArray<int> source) and set(FixedArray<number> source) with max value 65535 produce same res
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0080
     * @tc.name testUint16ArraySetPart4008
     * @tc.desc Verify set(FixedArray<int> source, offset) and set(FixedArray<number> source, offset) with same values at s
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0090
     * @tc.name testUint16ArraySetPart4009
     * @tc.desc Verify set(Uint16Array) and set(FixedArray<int>) with same content produce identical target state
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(3);
        const b: Uint16Array = new Uint16Array(3);
        const src: Uint16Array = Uint16Array.of(100, 200, 300);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0100
     * @tc.name testUint16ArraySetPart4010
     * @tc.desc Verify set(Uint16Array, offset) and set(FixedArray<int>, offset) with same content and offset produce ident
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(4);
        const b: Uint16Array = new Uint16Array(4);
        const src: Uint16Array = Uint16Array.of(50, 60);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0110
     * @tc.name testUint16ArraySetPart4011
     * @tc.desc Verify set(FixedArray<int>, offset) and set(ArrayLike, offset) with same content and offset produce identic
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0120
     * @tc.name testUint16ArraySetPart4012
     * @tc.desc Verify set(0, 0x100) via (int, number) hex literal and set(0, 256) via (int, E) produce same element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0130
     * @tc.name testUint16ArraySetPart4013
     * @tc.desc Verify set(0, 0b10) via (int, number) binary literal and set(0, 2) via (int, E) produce same element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0140
     * @tc.name testUint16ArraySetPart4014
     * @tc.desc Verify set(0, 0o10) via (int, number) octal literal and set(0, 8) via (int, E) produce same element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0150
     * @tc.name testUint16ArraySetPart4015
     * @tc.desc Verify set([3.14]) via ArrayLike truncation vs set([3]) via FixedArray<int> produce same element 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0160
     * @tc.name testUint16ArraySetPart4016
     * @tc.desc Verify set([1e4]) via ArrayLike scientific notation vs set([10000]) via FixedArray<int> produce same elemen
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0170
     * @tc.name testUint16ArraySetPart4017
     * @tc.desc Verify set(0, 65536) via (int, number) overflow wrap vs set(0, 0) via (int, E) produce same element (both 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0180
     * @tc.name testUint16ArraySetPart4018
     * @tc.desc Verify set(0, -1) via (int, number) negative wrap vs set(0, 65535) via (int, E) produce same element (65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0190
     * @tc.name testUint16ArraySetPart4019
     * @tc.desc Verify set([65536]) via ArrayLike overflow wraps to [0] vs set([0]) via FixedArray<int> produce same elemen
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0200
     * @tc.name testUint16ArraySetPart4020
     * @tc.desc Verify set([-1]) via ArrayLike negative wraps to [65535] vs set([65535]) via FixedArray<int> produce same e
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0210
     * @tc.name testUint16ArraySetPart4021
     * @tc.desc Verify set(FixedArray<int> source) default offset vs set(FixedArray<int> source, 0) produce same target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0220
     * @tc.name testUint16ArraySetPart4022
     * @tc.desc Verify set(FixedArray<number> source) default offset vs set(FixedArray<number> source, 0) produce same targ
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0230
     * @tc.name testUint16ArraySetPart4023
     * @tc.desc Verify set(Uint16Array source) default offset vs set(Uint16Array source, 0) produce same target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(3);
        const b: Uint16Array = new Uint16Array(3);
        const src: Uint16Array = Uint16Array.of(100, 200, 300);
        a.set(src);
        b.set(src, 0);
        expect(a.join(',')).assertEqual('100,200,300');
        expect(b.join(',')).assertEqual('100,200,300');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0240
     * @tc.name testUint16ArraySetPart4024
     * @tc.desc Verify set(ArrayLike) default offset vs set(ArrayLike, 0) produce same target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0250
     * @tc.name testUint16ArraySetPart4025
     * @tc.desc Verify set(empty FixedArray<int>) default offset vs set(empty, 0) both no-op
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0260
     * @tc.name testUint16ArraySetPart4026
     * @tc.desc Verify set(single element FixedArray<int>) default offset vs set(single, 0) produce same element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0270
     * @tc.name testUint16ArraySetPart4027
     * @tc.desc Verify Chain set([1]) then set([2], 1) vs single set([1, 2]) produce same target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0280
     * @tc.name testUint16ArraySetPart4028
     * @tc.desc Verify Chain set(Uint16Array.of(10)) then set(Uint16Array.of(20), 1) vs single set(Uint16Array.of(10, 20))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = new Uint16Array(2);
        const b: Uint16Array = new Uint16Array(2);
        a.set(Uint16Array.of(10));
        a.set(Uint16Array.of(20), 1);
        b.set(Uint16Array.of(10, 20));
        expect(a.join(',')).assertEqual('10,20');
        expect(b.join(',')).assertEqual('10,20');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0290
     * @tc.name testUint16ArraySetPart4029
     * @tc.desc Verify set default offset on pre-filled target leaves existing elements outside range unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0300
     * @tc.name testUint16ArraySetPart4030
     * @tc.desc Verify set(FixedArray<int> source, 0) on pre-filled target vs set(source) default offset produce identical
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = Uint16Array.of(9, 9, 9);
        const b: Uint16Array = Uint16Array.of(9, 9, 9);
        const src: number[] =[4, 5];
        a.set(src);
        b.set(src, 0);
        expect(a.join(',')).assertEqual('4,5,9');
        expect(b.join(',')).assertEqual('4,5,9');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0310
     * @tc.name testUint16ArraySetPart4031
     * @tc.desc Verify set(empty Uint16Array) default offset no-op on pre-filled target vs set(empty, 0) no-op
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Uint16Array = Uint16Array.of(1, 2, 3);
        const b: Uint16Array = Uint16Array.of(1, 2, 3);
        const empty: Uint16Array = new Uint16Array(0);
        a.set(empty);
        b.set(empty, 0);
        expect(a[0]).assertEqual(1);
        expect(b[0]).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0320
     * @tc.name testUint16ArraySetPart4032
     * @tc.desc Verify set(0, val) via (int, E) returns void (undefined)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        const v: int = 5;
        const r = t.set(0, v);
        expect(r).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0330
     * @tc.name testUint16ArraySetPart4033
     * @tc.desc Verify set(0, 5) via (int, number) returns void (undefined)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        const r = t.set(0, 5);
        expect(r).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0340
     * @tc.name testUint16ArraySetPart4034
     * @tc.desc Verify set(FixedArray<int>) returns void (undefined)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        const src: number[] =[1, 2, 3];
        const r = t.set(src);
        expect(r).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0350
     * @tc.name testUint16ArraySetPart4035
     * @tc.desc Verify set(FixedArray<number>) returns void (undefined)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        const src: number[] = [1.0, 2.0, 3.0];
        const r = t.set(src);
        expect(r).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0360
     * @tc.name testUint16ArraySetPart4036
     * @tc.desc Verify set(Uint16Array) returns void (undefined)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        const src: Uint16Array = Uint16Array.of(1, 2, 3);
        const r = t.set(src);
        expect(r).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0370
     * @tc.name testUint16ArraySetPart4037
     * @tc.desc Verify set(ArrayLike) returns void (undefined)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        const r = t.set([1, 2, 3]);
        expect(r).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0380
     * @tc.name testUint16ArraySetPart4038
     * @tc.desc Verify toString after set via (int, E) shows correct values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0390
     * @tc.name testUint16ArraySetPart4039
     * @tc.desc Verify toString after set via FixedArray<E> shows correct values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        const src: number[] =[10, 20, 30];
        t.set(src);
        expect(t.toString()).assertEqual("10,20,30");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0400
     * @tc.name testUint16ArraySetPart4040
     * @tc.desc Verify toString after set via Uint16Array shows correct values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        t.set(Uint16Array.of(11, 22, 33));
        expect(t.toString()).assertEqual("11,22,33");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0410
     * @tc.name testUint16ArraySetPart4041
     * @tc.desc Verify toString after set via ArrayLike shows correct values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        t.set([44, 55, 66]);
        expect(t.toString()).assertEqual("44,55,66");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0420
     * @tc.name testUint16ArraySetPart4042
     * @tc.desc Verify length unchanged after set via any overload
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(5);
        const src: number[] =[1, 2, 3];
        t.set(src);
        expect(t.length).assertEqual(5);
        expect(t.join(',')).assertEqual('1,2,3,0,0');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0430
     * @tc.name testUint16ArraySetPart4043
     * @tc.desc Verify byteLength unchanged after set via any overload
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(5);
        const bl: int = t.byteLength;
        t.set([1, 2, 3]);
        expect(t.byteLength).assertEqual(bl);
        expect(t.join(',')).assertEqual('1,2,3,0,0');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0440
     * @tc.name testUint16ArraySetPart4044
      * @tc.desc Verify set writes source elements and preserves the next position
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(5);
        t.set(Uint16Array.of(1, 2));
        expect(t[0]).assertEqual(1);
        expect(t[1]).assertEqual(2);
        expect(t[2]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0450
     * @tc.name testUint16ArraySetPart4045
     * @tc.desc Verify buffer reference unchanged after set via any overload
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(5);
        const buf = t.buffer;
        const src: number[] =[1, 2, 3];
        t.set(src);
        expect(t.buffer).assertEqual(buf);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0460
     * @tc.name testUint16ArraySetPart4046
     * @tc.desc Verify byteOffset unchanged after set via any overload
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(5);
        const bo: int = t.byteOffset;
        t.set([10, 20]);
        expect(t.byteOffset).assertEqual(bo);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0470
     * @tc.name testUint16ArraySetPart4047
     * @tc.desc Verify join(',') after set via different overloads with same content shows identical string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0480
     * @tc.name testUint16ArraySetPart4048
     * @tc.desc Verify Non-overwritten elements preserved after set(FixedArray<int>, offset)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0490
     * @tc.name testUint16ArraySetPart4049
     * @tc.desc Verify Non-overwritten elements preserved after set(Uint16Array, offset)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(4);
        t[0] = 99;
        t[3] = 88;
        t.set(Uint16Array.of(10, 20), 1);
        expect(t[0]).assertEqual(99);
        expect(t[1]).assertEqual(10);
        expect(t[2]).assertEqual(20);
        expect(t[3]).assertEqual(88);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0500
     * @tc.name testUint16ArraySetPart4050
     * @tc.desc Verify set(FixedArray<int> source, -1) throws RangeError, target length unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0510
     * @tc.name testUint16ArraySetPart4051
     * @tc.desc Verify set(FixedArray<number> source, -1) throws RangeError, target byteLength unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0520
     * @tc.name testUint16ArraySetPart4052
     * @tc.desc Verify set(Uint16Array source, -1) throws RangeError, target length unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        const src: Uint16Array = Uint16Array.of(1, 2);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0530
     * @tc.name testUint16ArraySetPart4053
     * @tc.desc Verify set(ArrayLike, -1) throws RangeError, target byteOffset unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0540
     * @tc.name testUint16ArraySetPart4054
     * @tc.desc Verify set(FixedArray<int> source, 100) huge offset throws RangeError, target unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0550
     * @tc.name testUint16ArraySetPart4055
     * @tc.desc Verify set(source too large, 0) throws RangeError when source exceeds target length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = Uint16Array.of(9, 8);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0560
     * @tc.name testUint16ArraySetPart4056
     * @tc.desc Verify set(source, offset) throws RangeError when source at offset exceeds target remaining space
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0570
     * @tc.name testUint16ArraySetPart4057
     * @tc.desc Verify set(Uint16Array source, offset) throws RangeError when source at offset exceeds target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        const src: Uint16Array = Uint16Array.of(1, 2);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0580
     * @tc.name testUint16ArraySetPart4058
     * @tc.desc Verify After catching RangeError from set with bad offset, target still usable for valid set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0590
     * @tc.name testUint16ArraySetPart4059
     * @tc.desc Verify After catching RangeError, target buffer reference unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0600
     * @tc.name testUint16ArraySetPart4060
     * @tc.desc Verify Multiple catches in sequence, instance still functional
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0610
     * @tc.name testUint16ArraySetPart4061
     * @tc.desc Verify set(empty source, offset=length) succeeds at boundary (no-op)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        const empty: number[] =[];
        t.set(empty, 3);
        expect(t[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0620
     * @tc.name testUint16ArraySetPart4062
     * @tc.desc Verify set(empty Uint16Array, offset=length) succeeds at boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        const empty: Uint16Array = new Uint16Array(0);
        t.set(empty, 3);
        expect(t.length).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0630
     * @tc.name testUint16ArraySetPart4063
     * @tc.desc Verify set(ArrayLike, -5) large negative offset throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0640
     * @tc.name testUint16ArraySetPart4064
     * @tc.desc Verify set(FixedArray<number> source too large) throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0650
     * @tc.name testUint16ArraySetPart4065
     * @tc.desc Verify set(Uint16Array source too large for remaining space at offset) throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        const src: Uint16Array = Uint16Array.of(1, 2);
        try {
          t.set(src, 2);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0660
     * @tc.name testUint16ArraySetPart4066
     * @tc.desc Verify set(0, 65536) via (int, number) overflow wraps to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set(0, 65536);
        expect(t[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0670
     * @tc.name testUint16ArraySetPart4067
     * @tc.desc Verify set(0, -1) via (int, number) negative wraps to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set(0, -1);
        expect(t[0]).assertEqual(65535);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0680
     * @tc.name testUint16ArraySetPart4068
     * @tc.desc Verify set(0, 3.14) via (int, number) truncates to 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set(0, 3.14);
        expect(t[0]).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0690
     * @tc.name testUint16ArraySetPart4069
     * @tc.desc Verify set(0, 65535.9) via (int, number) truncates to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set(0, 65535.9);
        expect(t[0]).assertEqual(65535);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0700
     * @tc.name testUint16ArraySetPart4070
      * @tc.desc Verify set(0, -0.5) via (int, number) truncates to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set(0, -0.5);
        expect(t[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0710
     * @tc.name testUint16ArraySetPart4071
     * @tc.desc Verify set(0, Infinity) via (int, number) truncates to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set(0, Number.POSITIVE_INFINITY);
        expect(t[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0720
     * @tc.name testUint16ArraySetPart4072
     * @tc.desc Verify set(0, -Infinity) via (int, number) truncates to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set(0, -Number.POSITIVE_INFINITY);
        expect(t[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0730
     * @tc.name testUint16ArraySetPart4073
     * @tc.desc Verify set(0, NaN) via (int, number) truncates to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set(0, Number.NaN);
        expect(t[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0740
     * @tc.name testUint16ArraySetPart4074
     * @tc.desc Verify set([65536]) via ArrayLike overflow wraps to [0]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set([65536]);
        expect(t[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0750
     * @tc.name testUint16ArraySetPart4075
     * @tc.desc Verify set([-1]) via ArrayLike negative wraps to [65535]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set([-1]);
        expect(t[0]).assertEqual(65535);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0760
     * @tc.name testUint16ArraySetPart4076
     * @tc.desc Verify set([3.14, 2.7]) via ArrayLike truncates to [3, 2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(2);
        t.set([3.14, 2.7]);
        expect(t[0]).assertEqual(3);
        expect(t[1]).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0770
     * @tc.name testUint16ArraySetPart4077
     * @tc.desc Verify set([65535.9]) via ArrayLike truncates to [65535]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set([65535.9]);
        expect(t[0]).assertEqual(65535);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0780
     * @tc.name testUint16ArraySetPart4078
      * @tc.desc Verify set([-0.5]) via ArrayLike truncates to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set([-0.5]);
        expect(t[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0790
     * @tc.name testUint16ArraySetPart4079
     * @tc.desc Verify set([Infinity]) via ArrayLike truncates to [0]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set([Number.POSITIVE_INFINITY]);
        expect(t[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0800
     * @tc.name testUint16ArraySetPart4080
     * @tc.desc Verify set([-Infinity]) via ArrayLike truncates to [0]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set([-Number.POSITIVE_INFINITY]);
        expect(t[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0810
     * @tc.name testUint16ArraySetPart4081
     * @tc.desc Verify set([NaN]) via ArrayLike truncates to [0]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set([Number.NaN]);
        expect(t[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0820
     * @tc.name testUint16ArraySetPart4082
     * @tc.desc Verify set([0x10000]) via ArrayLike hex overflow wraps to [0]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set([0x10000]);
        expect(t[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0830
     * @tc.name testUint16ArraySetPart4083
     * @tc.desc Verify set([1e5]) via ArrayLike scientific notation overflow wraps to 34464 (100000 % 65536)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set([1e5]);
        expect(t[0]).assertEqual(34464);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0840
     * @tc.name testUint16ArraySetPart4084
     * @tc.desc Verify set([65536, -1, 3.14]) via ArrayLike multiple overflow values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(3);
        t.set([65536, -1, 3.14]);
        expect(t[0]).assertEqual(0);
        expect(t[1]).assertEqual(65535);
        expect(t[2]).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0850
     * @tc.name testUint16ArraySetPart4085
     * @tc.desc Verify set([-65536]) via ArrayLike wraps to [0]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set([-65536]);
        expect(t[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0860
     * @tc.name testUint16ArraySetPart4086
     * @tc.desc Verify set([0xFFFF]) via ArrayLike hex max value 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(1);
        t.set([0xFFFF]);
        expect(t[0]).assertEqual(65535);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0870
     * @tc.name testUint16ArraySetPart4087
     * @tc.desc Verify set(FixedArray<number> source with floats) truncation produces same as set(FixedArray<int> truncated
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0880
     * @tc.name testUint16ArraySetPart4088
     * @tc.desc Verify set(FixedArray<number> with overflow floats) vs set(FixedArray<int> with wrapped) same result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0890
     * @tc.name testUint16ArraySetPart4089
     * @tc.desc Verify set from Uint16Array: modifying source after set does not affect target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const src: Uint16Array = Uint16Array.of(10, 20, 30);
        const t: Uint16Array = new Uint16Array(3);
        t.set(src);
        src[0] = 99;
        expect(t[0]).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0900
     * @tc.name testUint16ArraySetPart4090
     * @tc.desc Verify set from Uint16Array: modifying target after set does not affect source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const src: Uint16Array = Uint16Array.of(10, 20, 30);
        const t: Uint16Array = new Uint16Array(3);
        t.set(src);
        t[0] = 99;
        expect(src[0]).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0910
     * @tc.name testUint16ArraySetPart4091
     * @tc.desc Verify set from ArrayLike: source array unchanged after set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0920
     * @tc.name testUint16ArraySetPart4092
     * @tc.desc Verify set from FixedArray<int>: source unchanged after set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0930
     * @tc.name testUint16ArraySetPart4093
     * @tc.desc Verify set from FixedArray<number>: source unchanged after set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0940
     * @tc.name testUint16ArraySetPart4094
     * @tc.desc Verify Multiple targets set from same Uint16Array source are independent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const src: Uint16Array = Uint16Array.of(7, 8, 9);
        const a: Uint16Array = new Uint16Array(3);
        const b: Uint16Array = new Uint16Array(3);
        a.set(src);
        b.set(src);
        a[0] = 0;
        expect(b[0]).assertEqual(7);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0950
     * @tc.name testUint16ArraySetPart4095
     * @tc.desc Verify set from Uint16Array: target.buffer !== source.buffer (separate buffers)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const src: Uint16Array = Uint16Array.of(1, 2);
        const t: Uint16Array = new Uint16Array(2);
        t.set(src);
        expect(t.buffer).not().assertEqual(src.buffer);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0960
     * @tc.name testUint16ArraySetPart4096
     * @tc.desc Verify Multiple targets set from same FixedArray<int> are independent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0970
     * @tc.name testUint16ArraySetPart4097
     * @tc.desc Verify set overwrites previous values at target indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = Uint16Array.of(1, 2, 3);
        t.set([10, 20]);
        expect(t[0]).assertEqual(10);
        expect(t[1]).assertEqual(20);
        expect(t[2]).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0980
     * @tc.name testUint16ArraySetPart4098
     * @tc.desc Verify set only modifies indices in range, leaves others unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_0990
     * @tc.name testUint16ArraySetPart4099
     * @tc.desc Verify set from Uint16Array.of() - elements are copied, not referenced
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const t: Uint16Array = new Uint16Array(2);
        const src: Uint16Array = Uint16Array.of(42, 43);
        t.set(src);
        src[0] = 0;
        src[1] = 0;
        expect(t[0]).assertEqual(42);
        expect(t[1]).assertEqual(43);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_1000
     * @tc.name testUint16ArraySetPart4100
     * @tc.desc Verify Cross-check target[i] after set equals source[i] for each element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_1010
     * @tc.name testUint16ArraySetPart4101
     * @tc.desc Verify Cross-check target[i+offset] after set(offset) equals source[i] for each element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_1020
     * @tc.name testUint16ArraySetPart4102
     * @tc.desc Verify set from Uint16Array subarray: elements copied, not buffer-shared
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const full: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_1030
     * @tc.name testUint16ArraySetPart4103
     * @tc.desc Verify set from same FixedArray<int> to multiple targets produces independent copies
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART4_1040
     * @tc.name testUint16ArraySetPart4104
     * @tc.desc Verify set from Uint16Array then verify source's buffer identity differs from target's buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart4104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
