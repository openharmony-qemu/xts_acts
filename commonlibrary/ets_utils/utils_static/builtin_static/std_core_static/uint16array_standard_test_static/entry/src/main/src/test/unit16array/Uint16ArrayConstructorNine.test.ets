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

export default function uint16ArrayConstructor501Test(): void {
  describe('Uint16ArrayConstructor501Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_0100
     * @tc.name testUint16ArrayConstructor501_001
     * @tc.desc Verify int 0 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array();
        let b: Uint16Array = new Uint16Array(0);
        expect(a.length).assertEqual(0);
        expect(b.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_0200
     * @tc.name testUint16ArrayConstructor501_002
     * @tc.desc Verify int 3 [0,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(3);
        expect(a.at(0)).assertEqual(0);
        expect(a.at(1)).assertEqual(0);
        expect(a.at(2)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_0300
     * @tc.name testUint16ArrayConstructor501_003
     * @tc.desc Verify Array<int> Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let src: Uint16Array = new Uint16Array([10, 20, 30]);
        let b: Uint16Array = new Uint16Array(src);
        expect(b.at(0)).assertEqual(10);
        expect(b.at(1)).assertEqual(20);
        expect(b.at(2)).assertEqual(30);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_0400
     * @tc.name testUint16ArrayConstructor501_004
     * @tc.desc Verify int 5 float 5.0 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(5);
        let b: Uint16Array = new Uint16Array(5.0);
        expect(a.length).assertEqual(5);
        expect(b.length).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_0500
     * @tc.name testUint16ArrayConstructor501_005
     * @tc.desc Verify float 5.5 int 5 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(5);
        let b: Uint16Array = new Uint16Array(5.5);
        expect(a.length).assertEqual(5);
        expect(b.length).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_0600
     * @tc.name testUint16ArrayConstructor501_006
     * @tc.desc Verify ArrayBuffer ArrayBuffer+offset byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf);
        let b: Uint16Array = new Uint16Array(buf, 0);
        expect(a.byteOffset).assertEqual(0);
        expect(b.byteOffset).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_0700
     * @tc.name testUint16ArrayConstructor501_007
     * @tc.desc Verify Array<int> length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array();
        let b: Uint16Array = new Uint16Array([]);
        expect(a.length).assertEqual(0);
        expect(b.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_0800
     * @tc.name testUint16ArrayConstructor501_008
     * @tc.desc Verify int 0 byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(0);
        let b: Uint16Array = new Uint16Array([]);
        expect(a.byteLength).assertEqual(0);
        expect(b.byteLength).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_0900
     * @tc.name testUint16ArrayConstructor501_009
     * @tc.desc Verify ArrayBuffer+offset int ArrayBuffer+offset number byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 2);
        let b: Uint16Array = new Uint16Array(buf, 2.0);
        expect(a.byteOffset).assertEqual(2);
        expect(b.byteOffset).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_1000
     * @tc.name testUint16ArrayConstructor501_010
     * @tc.desc Verify ArrayBuffer+offset+length ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 0, 4);
        let b: Uint16Array = new Uint16Array(buf);
        expect(a.buffer).assertEqual(b.buffer);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_1100
     * @tc.name testUint16ArrayConstructor501_011
     * @tc.desc Verify Array<int> [65535] Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let src: Uint16Array = new Uint16Array([65535]);
        let a: Uint16Array = new Uint16Array([65535]);
        let b: Uint16Array = new Uint16Array(src);
        expect(a.at(0)).assertEqual(65535);
        expect(b.at(0)).assertEqual(65535);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_1200
     * @tc.name testUint16ArrayConstructor501_012
     * @tc.desc Verify FixedArray<number> Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let fa: FixedArray<number> = new FixedArray<number>(3);
        fa[0] = 100;
        fa[1] = 200;
        fa[2] = 300;
        let a: Uint16Array = new Uint16Array(fa);
        expect(a.at(0)).assertEqual(100);
        expect(a.at(1)).assertEqual(200);
        expect(a.at(2)).assertEqual(300);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_1300
     * @tc.name testUint16ArrayConstructor501_013
     * @tc.desc Verify ArrayBuffer+offset+length ArrayBuffer+offset length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 0, 3);
        let b: Uint16Array = new Uint16Array(buf, 0);
        expect(a.length).assertEqual(3);
        expect(b.length).assertEqual(8);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_1400
     * @tc.name testUint16ArrayConstructor501_014
     * @tc.desc Verify int 3 FixedArray<int> length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(3);
        let fa: FixedArray<int> = new FixedArray<int>(3);
        fa[0] = 0;
        fa[1] = 0;
        fa[2] = 0;
        let b: Uint16Array = new Uint16Array(fa);
        expect(a.length).assertEqual(3);
        expect(b.length).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_1500
     * @tc.name testUint16ArrayConstructor501_015
     * @tc.desc Verify ArrayBuffer buffer null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array();
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let b: Uint16Array = new Uint16Array(buf, 0);
        expect(a.buffer.byteLength).assertEqual(0);
        expect(b.buffer.byteLength).assertEqual(8);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_1600
     * @tc.name testUint16ArrayConstructor501_016
     * @tc.desc Verify Array<int> int 1 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(1);
        let b: Uint16Array = new Uint16Array([0]);
        expect(a.length).assertEqual(1);
        expect(b.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_1700
     * @tc.name testUint16ArrayConstructor501_017
     * @tc.desc Verify ArrayBuffer Uint16Array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let view: Uint16Array = new Uint16Array(buf, 0, 4);
        let copy: Uint16Array = new Uint16Array(view);
        expect(view.buffer).assertEqual(buf);
        copy[0] = 99;
        expect(view.at(0)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_1800
     * @tc.name testUint16ArrayConstructor501_018
     * @tc.desc Verify int 7 Array<int> [0,0,0,0,0,0,0] byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(7);
        let b: Uint16Array = new Uint16Array([0, 0, 0, 0, 0, 0, 0]);
        expect(a.byteLength).assertEqual(14);
        expect(b.byteLength).assertEqual(14);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_1900
     * @tc.name testUint16ArrayConstructor501_019
     * @tc.desc Verify byteOffset int 0 byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array();
        let b: Uint16Array = new Uint16Array(0);
        expect(a.byteOffset).assertEqual(0);
        expect(b.byteOffset).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_2000
     * @tc.name testUint16ArrayConstructor501_020
     * @tc.desc Verify ArrayBuffer+byteOffset ArrayBuffer+byteOffset+length byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 4);
        let b: Uint16Array = new Uint16Array(buf, 4, 3);
        expect(a.byteOffset).assertEqual(4);
        expect(b.byteOffset).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_2100
     * @tc.name testUint16ArrayConstructor501_021
     * @tc.desc Verify Set<number> Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let s: Set<number> = new Set<number>();
        s.add(5);
        s.add(10);
        s.add(15);
        let a: Uint16Array = new Uint16Array(s);
        expect(a.at(0)).assertEqual(5);
        expect(a.at(1)).assertEqual(10);
        expect(a.at(2)).assertEqual(15);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_2200
     * @tc.name testUint16ArrayConstructor501_022
     * @tc.desc Verify Array<int> 3.14 int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array([3.14]);
        let b: Uint16Array = new Uint16Array([3]);
        expect(a.at(0)).assertEqual(3);
        expect(b.at(0)).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_2300
     * @tc.name testUint16ArrayConstructor501_023
     * @tc.desc Verify ArrayBuffer byteOffset=6 byteOffset=2 byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 2);
        let b: Uint16Array = new Uint16Array(buf, 6);
        expect(a.byteOffset).assertEqual(2);
        expect(b.byteOffset).assertEqual(6);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_2400
     * @tc.name testUint16ArrayConstructor501_024
     * @tc.desc Verify int 8 ArrayBuffer+length=8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(8);
        let b: Uint16Array = new Uint16Array(buf, 0, 8);
        expect(a.length).assertEqual(8);
        expect(b.length).assertEqual(8);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_2500
     * @tc.name testUint16ArrayConstructor501_025
     * @tc.desc Verify FixedArray<int> Array<int> length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let fa: FixedArray<int> = new FixedArray<int>(2);
        fa[0] = 42;
        fa[1] = 84;
        let a: Uint16Array = new Uint16Array(fa);
        let b: Uint16Array = new Uint16Array([42, 84]);
        expect(a.length).assertEqual(2);
        expect(b.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_2600
     * @tc.name testUint16ArrayConstructor501_026
     * @tc.desc Verify buffer byteLength int 0 buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array();
        let b: Uint16Array = new Uint16Array(0);
        expect(a.buffer.byteLength).assertEqual(0);
        expect(b.buffer.byteLength).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_2700
     * @tc.name testUint16ArrayConstructor501_027
     * @tc.desc Verify ArrayBuffer+offset+length ArrayBuffer+offset buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(24);
        let a: Uint16Array = new Uint16Array(buf, 4, 5);
        let b: Uint16Array = new Uint16Array(buf, 4);
        expect(a.buffer.byteLength).assertEqual(24);
        expect(b.buffer.byteLength).assertEqual(24);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_2800
     * @tc.name testUint16ArrayConstructor501_028
     * @tc.desc Verify int 65536 Array<int> length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(65536);
        let b: Uint16Array = new Uint16Array([]);
        expect(a.length).assertEqual(65536);
        expect(b.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_2900
     * @tc.name testUint16ArrayConstructor501_029
     * @tc.desc Verify int 3 Array<int> [0,0,0] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(3);
        let b: Uint16Array = new Uint16Array([0, 0, 0]);
        expect(a.at(0)).assertEqual(0);
        expect(a.at(1)).assertEqual(0);
        expect(a.at(2)).assertEqual(0);
        expect(b.at(0)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_3000
     * @tc.name testUint16ArrayConstructor501_030
     * @tc.desc Verify FixedArray<number> Array<int> length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let fa: FixedArray<number> = new FixedArray<number>(0);
        let a: Uint16Array = new Uint16Array(fa);
        let b: Uint16Array = new Uint16Array([]);
        expect(a.length).assertEqual(0);
        expect(b.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_3100
     * @tc.name testUint16ArrayConstructor501_031
     * @tc.desc Verify byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array();
        let b: Uint16Array = new Uint16Array(5);
        let c: Uint16Array = new Uint16Array([1, 2]);
        let d: Uint16Array = new Uint16Array(new Uint16Array(3));
        expect(a.byteOffset).assertEqual(0);
        expect(b.byteOffset).assertEqual(0);
        expect(c.byteOffset).assertEqual(0);
        expect(d.byteOffset).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_3200
     * @tc.name testUint16ArrayConstructor501_032
     * @tc.desc Verify ArrayBuffer+offset+length ArrayBuffer byteLength *2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 0, 5);
        let b: Uint16Array = new Uint16Array(buf);
        expect(a.byteLength).assertEqual(10);
        expect(b.byteLength).assertEqual(16);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_3300
     * @tc.name testUint16ArrayConstructor501_033
     * @tc.desc Verify int 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(10);
        for (let i: int = 0; i < 10; i++) {
          expect(a[i]).assertEqual(0);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_3400
     * @tc.name testUint16ArrayConstructor501_034
     * @tc.desc Verify Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array([100, 200, 300, 400]);
        expect(a.at(0)).assertEqual(100);
        expect(a.at(1)).assertEqual(200);
        expect(a.at(2)).assertEqual(300);
        expect(a.at(3)).assertEqual(400);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_3500
     * @tc.name testUint16ArrayConstructor501_035
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let src: Uint16Array = new Uint16Array([99, 88, 77]);
        let a: Uint16Array = new Uint16Array(src);
        expect(a.at(0)).assertEqual(99);
        expect(a.at(1)).assertEqual(88);
        expect(a.at(2)).assertEqual(77);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_3600
     * @tc.name testUint16ArrayConstructor501_036
     * @tc.desc Verify ArrayBuffer+offset byteLength buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(20);
        let a: Uint16Array = new Uint16Array(buf, 4);
        expect(a.byteLength).assertEqual(16);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_3700
     * @tc.name testUint16ArrayConstructor501_037
     * @tc.desc Verify ArrayBuffer+offset+length byteLength length*2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(20);
        let a: Uint16Array = new Uint16Array(buf, 4, 6);
        expect(a.byteLength).assertEqual(12);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_3800
     * @tc.name testUint16ArrayConstructor501_038
     * @tc.desc Verify int buffer byteLength length*2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(7);
        expect(a.buffer.byteLength).assertEqual(14);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_3900
     * @tc.name testUint16ArrayConstructor501_039
     * @tc.desc Verify Array<int> buffer byteLength *2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        expect(a.buffer.byteLength).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_4000
     * @tc.name testUint16ArrayConstructor501_040
     * @tc.desc Verify int 1 byteLength 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(1);
        expect(a.byteLength).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_4100
     * @tc.name testUint16ArrayConstructor501_041
     * @tc.desc Verify FixedArray<number> byteLength 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let fa: FixedArray<number> = new FixedArray<number>(1);
        fa[0] = 42;
        let a: Uint16Array = new Uint16Array(fa);
        expect(a.byteLength).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_4200
     * @tc.name testUint16ArrayConstructor501_042
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(4);
        let b: Uint16Array = new Uint16Array([10, 20, 30]);
        let c: Uint16Array = new Uint16Array(new Uint16Array([1]));
        expect(a.length).assertEqual(4);
        expect(b.length).assertEqual(3);
        expect(c.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_4300
     * @tc.name testUint16ArrayConstructor501_043
     * @tc.desc Verify ArrayBuffer+offset=0 byteLength buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(12);
        let a: Uint16Array = new Uint16Array(buf, 0);
        expect(a.byteLength).assertEqual(12);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_4400
     * @tc.name testUint16ArrayConstructor501_044
     * @tc.desc Verify buffer null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array();
        let b: Uint16Array = new Uint16Array(3);
        let c: Uint16Array = new Uint16Array([1]);
        let d: Uint16Array = new Uint16Array(new Uint16Array(2));
        expect(a.buffer.byteLength).assertEqual(0);
        expect(b.buffer.byteLength).assertEqual(6);
        expect(c.buffer.byteLength).assertEqual(2);
        expect(d.buffer.byteLength).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_4500
     * @tc.name testUint16ArrayConstructor501_045
     * @tc.desc Verify ArrayBuffer buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 0, 5);
        expect(a.buffer).assertEqual(buf);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_4600
     * @tc.name testUint16ArrayConstructor501_046
     * @tc.desc Verify array and length constructors create buffers with expected byte lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array([1, 2]);
        let b: Uint16Array = new Uint16Array(2);
        expect(a.buffer.byteLength).assertEqual(4);
        expect(b.buffer.byteLength).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_4700
     * @tc.name testUint16ArrayConstructor501_047
     * @tc.desc Verify ArrayBuffer offset RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let valid: Uint16Array = new Uint16Array(3);
        try {
          let a: Uint16Array = new Uint16Array(buf, 8);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
        expect(valid.length).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_4800
     * @tc.name testUint16ArrayConstructor501_048
     * @tc.desc Verify ArrayBuffer+length buffer RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let valid: Uint16Array = new Uint16Array([100]);
        try {
          let a: Uint16Array = new Uint16Array(buf, 0, 10);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
        expect(valid.at(0)).assertEqual(100);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_4900
     * @tc.name testUint16ArrayConstructor501_049
     * @tc.desc Verify byteOffset RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(10);
        let valid: Uint16Array = new Uint16Array();
        try {
          let a: Uint16Array = new Uint16Array(buf, -2);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
        expect(valid.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_5000
     * @tc.name testUint16ArrayConstructor501_050
     * @tc.desc Verify length RangeError int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(10);
        try {
          let a: Uint16Array = new Uint16Array(buf, 0, -1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
        let valid: Uint16Array = new Uint16Array(5);
        expect(valid.length).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_5100
     * @tc.name testUint16ArrayConstructor501_051
     * @tc.desc Verify negative number -1 wraps to 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array([-1]);
        let b: Uint16Array = new Uint16Array([65535]);
        expect(a.at(0)).assertEqual(65535);
        expect(b.at(0)).assertEqual(65535);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_5200
     * @tc.name testUint16ArrayConstructor501_052
     * @tc.desc Verify overflow number 65536 wraps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array([65536]);
        let b: Uint16Array = new Uint16Array([0]);
        expect(a.at(0)).assertEqual(0);
        expect(b.at(0)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_5300
     * @tc.name testUint16ArrayConstructor501_053
     * @tc.desc Verify NaN length 0 Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(Number.NaN);
        let b: Uint16Array = new Uint16Array([1]);
        expect(a.length).assertEqual(0);
        expect(b.at(0)).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_5400
     * @tc.name testUint16ArrayConstructor501_054
     * @tc.desc Verify byteOffset+length buffer RangeError byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let valid: Uint16Array = new Uint16Array(buf, 0);
        try {
          let a: Uint16Array = new Uint16Array(buf, 4, 10);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
        expect(valid.length).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_5500
     * @tc.name testUint16ArrayConstructor501_055
     * @tc.desc Verify ArrayBuffer Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let src: Uint16Array = new Uint16Array([5, 10]);
        let bad: Uint16Array = new (Uint16Array);
        expect(bad.length).assertEqual(0);
        let copy: Uint16Array = new Uint16Array(src);
        expect(copy.at(0)).assertEqual(5);
        expect(copy.at(1)).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_5600
     * @tc.name testUint16ArrayConstructor501_056
     * @tc.desc Verify offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(12);
        let errCount: number = 0;
        try {
          let a: Uint16Array = new Uint16Array(buf, 3);
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
          errCount++;
        }
        try {
          let a: Uint16Array = new Uint16Array(buf, 5);
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
          errCount++;
        }
        let valid: Uint16Array = new Uint16Array(buf, 4);
        expect(errCount).assertEqual(2);
        expect(valid.byteOffset).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_5700
     * @tc.name testUint16ArrayConstructor501_057
     * @tc.desc Verify constructing with positive Infinity throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        try {
          let a: Uint16Array = new Uint16Array(Number.POSITIVE_INFINITY);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("RangeError");
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_5800
     * @tc.name testUint16ArrayConstructor501_058
     * @tc.desc Verify buffer FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(0);
        let fa: FixedArray<number> = new FixedArray<number>(2);
        fa[0] = 11;
        fa[1] = 22;
        try {
          let a: Uint16Array = new Uint16Array(buf, 0, 3);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
        let valid: Uint16Array = new Uint16Array(fa);
        expect(valid.at(0)).assertEqual(11);
        expect(valid.at(1)).assertEqual(22);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_5900
     * @tc.name testUint16ArrayConstructor501_059
     * @tc.desc Verify offset+length buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(10);
        let a: Uint16Array = new Uint16Array(buf, 2, 4);
        expect(a.byteLength).assertEqual(8);
        expect(a.length).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_6000
     * @tc.name testUint16ArrayConstructor501_060
     * @tc.desc Verify int 0 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array();
        let b: Uint16Array = new Uint16Array(0);
        expect(a.toString()).assertEqual("");
        expect(b.toString()).assertEqual("");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_6100
     * @tc.name testUint16ArrayConstructor501_061
     * @tc.desc Verify Array<int> Uint16Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let src: Uint16Array = new Uint16Array([10, 20]);
        let b: Uint16Array = new Uint16Array(src);
        expect(b.toString()).assertEqual("10,20");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_6200
     * @tc.name testUint16ArrayConstructor501_062
     * @tc.desc Verify int 5 toString 5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(5);
        let s: string = a.toString();
        expect(s).assertEqual("0,0,0,0,0");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_6300
     * @tc.name testUint16ArrayConstructor501_063
     * @tc.desc Verify Array<int> [1,2,3] toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array([1, 2, 3]);
        expect(a.toString()).assertEqual("1,2,3");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_6400
     * @tc.name testUint16ArrayConstructor501_064
     * @tc.desc Verify ArrayBuffer+offset toString int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 0, 3);
        expect(a.toString()).assertEqual("0,0,0");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_6500
     * @tc.name testUint16ArrayConstructor501_065
     * @tc.desc Verify valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array();
        let b: Uint16Array = new Uint16Array(3);
        let c: Uint16Array = new Uint16Array([1]);
        expect(a.valueOf()).assertEqual(a);
        expect(b.valueOf()).assertEqual(b);
        expect(c.valueOf()).assertEqual(c);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_6600
     * @tc.name testUint16ArrayConstructor501_066
     * @tc.desc Verify int Array<int> length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(8);
        let b: Uint16Array = new Uint16Array([9, 8, 7]);
        expect(a.length).assertEqual(8);
        expect(b.length).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_6700
     * @tc.name testUint16ArrayConstructor501_067
     * @tc.desc Verify ArrayBuffer and array constructors produce expected lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 0, 4);
        let b: Uint16Array = new Uint16Array([1]);
        expect(a.length).assertEqual(4);
        expect(b.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_6800
     * @tc.name testUint16ArrayConstructor501_068
     * @tc.desc Verify byteLength for empty, length, and array constructors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array();
        let b: Uint16Array = new Uint16Array(5);
        let c: Uint16Array = new Uint16Array([1, 2]);
        expect(a.byteLength).assertEqual(0);
        expect(b.byteLength).assertEqual(10);
        expect(c.byteLength).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_6900
     * @tc.name testUint16ArrayConstructor501_069
     * @tc.desc Verify default and length constructors use zero byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array();
        let b: Uint16Array = new Uint16Array(3);
        expect(a.byteOffset).assertEqual(0);
        expect(b.byteOffset).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_7000
     * @tc.name testUint16ArrayConstructor501_070
     * @tc.desc Verify buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array();
        let b: Uint16Array = new Uint16Array(3);
        let c: Uint16Array = new Uint16Array([1]);
        expect(a.buffer.byteLength).assertEqual(0);
        expect(b.buffer.byteLength).assertEqual(6);
        expect(c.buffer.byteLength).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_7100
     * @tc.name testUint16ArrayConstructor501_071
     * @tc.desc Verify ArrayBuffer int buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(20);
        let a: Uint16Array = new Uint16Array(buf, 0, 5);
        let b: Uint16Array = new Uint16Array(5);
        expect(a.buffer.byteLength).assertEqual(20);
        expect(b.buffer.byteLength).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_7200
     * @tc.name testUint16ArrayConstructor501_072
     * @tc.desc Verify toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array();
        let b: Uint16Array = new Uint16Array([]);
        expect(a.toString()).assertEqual("");
        expect(b.toString()).assertEqual("");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_7300
     * @tc.name testUint16ArrayConstructor501_073
     * @tc.desc Verify Uint16Array toString toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let src: Uint16Array = new Uint16Array([255, 512, 1024]);
        let a: Uint16Array = new Uint16Array(src);
        expect(a.toString()).assertEqual("255,512,1024");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_7400
     * @tc.name testUint16ArrayConstructor501_074
     * @tc.desc Verify Array<int> toString 65535 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array([0, 65535, 32768]);
        expect(a.toString()).assertEqual("0,65535,32768");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_7500
     * @tc.name testUint16ArrayConstructor501_075
     * @tc.desc Verify FixedArray<number> toString Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let fa: FixedArray<number> = new FixedArray<number>(3);
        fa[0] = 1000;
        fa[1] = 2000;
        fa[2] = 3000;
        let a: Uint16Array = new Uint16Array(fa);
        expect(a.toString()).assertEqual("1000,2000,3000");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_7600
     * @tc.name testUint16ArrayConstructor501_076
     * @tc.desc Verify ArrayBuffer+offset toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(12);
        let a: Uint16Array = new Uint16Array(buf, 0, 3);
        a[0] = 77;
        a[1] = 88;
        a[2] = 99;
        expect(a.toString()).assertEqual("77,88,99");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_7700
     * @tc.name testUint16ArrayConstructor501_077
     * @tc.desc Verify int Array<int> BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(3);
        let b: Uint16Array = new Uint16Array([1, 2]);
        expect(a.BYTES_PER_ELEMENT).assertEqual(2);
        expect(b.BYTES_PER_ELEMENT).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_7800
     * @tc.name testUint16ArrayConstructor501_078
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(5);
        let b: Uint16Array = new Uint16Array([1, 2]);
        expect(a.length).assertEqual(5);
        expect(b.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_7900
     * @tc.name testUint16ArrayConstructor501_079
     * @tc.desc Verify ArrayBuffer Uint16Array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 0, 4);
        let b: Uint16Array = new Uint16Array(buf, 8, 4);
        expect(a.buffer).assertEqual(b.buffer);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_8000
     * @tc.name testUint16ArrayConstructor501_080
     * @tc.desc Verify Uint16Array buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 0, 3);
        let b: Uint16Array = new Uint16Array(buf, 0, 3);
        a[0] = 12345;
        expect(b.at(0)).assertEqual(12345);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_8100
     * @tc.name testUint16ArrayConstructor501_081
     * @tc.desc Verify Uint16Array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let src: Uint16Array = new Uint16Array([1, 2, 3]);
        let copy: Uint16Array = new Uint16Array(src);
        copy[0] = 99;
        expect(src.at(0)).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_8200
     * @tc.name testUint16ArrayConstructor501_082
     * @tc.desc Verify modifying the source does not affect the copied Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let src: Uint16Array = new Uint16Array([10, 20, 30]);
        let copy: Uint16Array = new Uint16Array(src);
        src[0] = 999;
        expect(copy.at(0)).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_8300
     * @tc.name testUint16ArrayConstructor501_083
     * @tc.desc Verify modifying the copy does not affect the source Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let src: Uint16Array = new Uint16Array([10, 20, 30]);
        let copy: Uint16Array = new Uint16Array(src);
        copy[1] = 888;
        expect(src.at(1)).assertEqual(20);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_8400
     * @tc.name testUint16ArrayConstructor501_084
     * @tc.desc Verify ArrayBuffer+offset ArrayBuffer+offset+length buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 0, 4);
        let b: Uint16Array = new Uint16Array(buf, 0);
        a[0] = 54321;
        expect(b.at(0)).assertEqual(54321);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_8500
     * @tc.name testUint16ArrayConstructor501_085
     * @tc.desc Verify ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 0, 3);
        let b: Uint16Array = new Uint16Array(buf, 8, 3);
        a[0] = 111;
        b[0] = 222;
        expect(a.at(0)).assertEqual(111);
        expect(b.at(0)).assertEqual(222);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_8600
     * @tc.name testUint16ArrayConstructor501_086
     * @tc.desc Verify Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let src: Array<int> = [1, 2, 3];
        let a: Uint16Array = new Uint16Array(src);
        src[0] = 999;
        expect(a.at(0)).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_8700
     * @tc.name testUint16ArrayConstructor501_087
     * @tc.desc Verify ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 0, 4);
        a[2] = 60000;
        let b: Uint16Array = new Uint16Array(buf, 0, 4);
        expect(b.at(2)).assertEqual(60000);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_8800
     * @tc.name testUint16ArrayConstructor501_088
     * @tc.desc Verify independently constructed Uint16Arrays retain their own assigned values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(3);
        let b: Uint16Array = new Uint16Array([0, 0, 0]);
        a[0] = 111;
        b[0] = 222;
        expect(a.at(0)).assertEqual(111);
        expect(b.at(0)).assertEqual(222);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_8900
     * @tc.name testUint16ArrayConstructor501_089
     * @tc.desc Verify ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 0, 3);
        let b: Uint16Array = new Uint16Array(3);
        a[0] = 99;
        expect(b.at(0)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_9000
     * @tc.name testUint16ArrayConstructor501_090
     * @tc.desc Verify Uint16Array ArrayBuffer buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(32);
        let src: Uint16Array = new Uint16Array([1, 2, 3]);
        let a: Uint16Array = new Uint16Array(src);
        let b: Uint16Array = new Uint16Array(buf, 0, 3);
        expect(a.buffer.byteLength).assertEqual(6);
        expect(b.buffer.byteLength).assertEqual(32);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_9100
     * @tc.name testUint16ArrayConstructor501_091
     * @tc.desc Verify ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 4, 2);
        let b: Uint16Array = new Uint16Array(buf, 4, 2);
        a[1] = 65000;
        expect(b.at(1)).assertEqual(65000);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_9200
     * @tc.name testUint16ArrayConstructor501_092
     * @tc.desc Verify byteOffset buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(24);
        let a: Uint16Array = new Uint16Array(buf, 0, 4);
        let b: Uint16Array = new Uint16Array(buf, 8, 4);
        expect(a.buffer).assertEqual(b.buffer);
        expect(a.byteOffset).assertEqual(0);
        expect(b.byteOffset).assertEqual(8);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_9300
     * @tc.name testUint16ArrayConstructor501_093
     * @tc.desc Verify octal literal [0o177777, 0o100000]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array([0o177777, 0o100000]);
        expect(a.at(0)).assertEqual(65535);
        expect(a.at(1)).assertEqual(32768);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_9400
     * @tc.name testUint16ArrayConstructor501_094
     * @tc.desc Verify binary literal [0b1111111111111111]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array([0b1111111111111111]);
        expect(a.at(0)).assertEqual(65535);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_9500
     * @tc.name testUint16ArrayConstructor501_095
     * @tc.desc Verify ArrayBuffer byteOffset equal to buffer.byteLength with length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(10);
        let a: Uint16Array = new Uint16Array(buf, 10, 0);
        expect(a.length).assertEqual(0);
        expect(a.byteOffset).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR501_9600
     * @tc.name testUint16ArrayConstructor501_096
     * @tc.desc Verify boundary values together [0, 1, 32767, 32768, 65534, 65535]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor501_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array([0, 1, 32767, 32768, 65534, 65535]);
        expect(a.at(0)).assertEqual(0);
        expect(a.at(1)).assertEqual(1);
        expect(a.at(2)).assertEqual(32767);
        expect(a.at(3)).assertEqual(32768);
        expect(a.at(4)).assertEqual(65534);
        expect(a.at(5)).assertEqual(65535);
      }
    });

  });
}
