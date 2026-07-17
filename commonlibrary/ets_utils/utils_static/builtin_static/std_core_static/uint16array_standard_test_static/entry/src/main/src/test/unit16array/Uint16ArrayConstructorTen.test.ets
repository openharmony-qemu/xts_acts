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

export default function uint16ArrayConstructor502Test(): void {
  describe('Uint16ArrayConstructor502Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR502_0100
     * @tc.name testUint16ArrayConstructor502_001
     * @tc.desc Verify Array<int> FixedArray Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor502_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let fa: FixedArray<number> = new FixedArray<number>(2);
        fa[0] = 777;
        fa[1] = 888;
        let a: Uint16Array = new Uint16Array(fa);
        fa[0] = 999;
        expect(a.at(0)).assertEqual(777);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR502_0200
     * @tc.name testUint16ArrayConstructor502_002
     * @tc.desc Verify Uint16Array byteLength buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor502_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let src: Uint16Array = new Uint16Array([5, 10, 15, 20]);
        let copy: Uint16Array = new Uint16Array(src);
        expect(src.byteLength).assertEqual(copy.byteLength);
        copy[0] = 99;
        expect(src.at(0)).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR502_0300
     * @tc.name testUint16ArrayConstructor502_003
     * @tc.desc Verify int buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor502_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(4);
        let b: Uint16Array = new Uint16Array(4);
        a[0] = 99;
        expect(b.at(0)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR502_0400
     * @tc.name testUint16ArrayConstructor502_004
     * @tc.desc Verify Array<int> buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor502_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array([1, 2]);
        let b: Uint16Array = new Uint16Array([1, 2]);
        a[0] = 99;
        expect(b.at(0)).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR502_0500
     * @tc.name testUint16ArrayConstructor502_005
     * @tc.desc Verify ArrayBuffer buffer DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor502_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let a: Uint16Array = new Uint16Array(buf, 0, 4);
        a[0] = 0xABCD;
        let dv: DataView = new DataView(buf);
        expect(dv.getUint16(0, true)).assertEqual(0xABCD);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR502_0600
     * @tc.name testUint16ArrayConstructor502_006
     * @tc.desc Verify ArrayBuffer+offset buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor502_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(12);
        let dv: DataView = new DataView(buf);
        dv.setUint16(0, 1000, true);
        dv.setUint16(2, 2000, true);
        dv.setUint16(4, 3000, true);
        let a: Uint16Array = new Uint16Array(buf, 0, 3);
        expect(a.at(0)).assertEqual(1000);
        expect(a.at(1)).assertEqual(2000);
        expect(a.at(2)).assertEqual(3000);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR502_0700
     * @tc.name testUint16ArrayConstructor502_007
     * @tc.desc Verify buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor502_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let src: Uint16Array = new Uint16Array([1, 2, 3]);
        let copy: Uint16Array = new Uint16Array(src);
        copy[0] = 999;
        expect(src.buffer.byteLength).assertEqual(6);
        expect(copy.buffer.byteLength).assertEqual(6);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR502_0800
     * @tc.name testUint16ArrayConstructor502_008
     * @tc.desc Verify ArrayBuffer byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor502_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(32);
        let a: Uint16Array = new Uint16Array(buf, 6, 5);
        expect(a.byteOffset).assertEqual(6);
        expect(a.length).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR502_0900
     * @tc.name testUint16ArrayConstructor502_009
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor502_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(2);
        let b: Uint16Array = new Uint16Array([0, 0]);
        let c: Uint16Array = new Uint16Array(new Uint16Array([0, 0]));
        a[0] = 1;
        b[0] = 2;
        c[0] = 3;
        expect(a.at(0)).assertEqual(1);
        expect(b.at(0)).assertEqual(2);
        expect(c.at(0)).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR502_1000
     * @tc.name testUint16ArrayConstructor502_010
     * @tc.desc Verify Array<int> Uint16Array byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor502_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let src: Uint16Array = new Uint16Array([100, 200, 300, 400]);
        let a: Uint16Array = new Uint16Array([100, 200, 300, 400]);
        let b: Uint16Array = new Uint16Array(src);
        expect(a.byteLength).assertEqual(8);
        expect(b.byteLength).assertEqual(8);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR502_1100
     * @tc.name testUint16ArrayConstructor502_011
     * @tc.desc Verify ArrayBuffer+offset byteOffset int byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor502_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(20);
        let a: Uint16Array = new Uint16Array(buf, 6);
        let b: Uint16Array = new Uint16Array(7);
        expect(a.byteOffset).assertEqual(6);
        expect(b.byteOffset).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR502_1200
     * @tc.name testUint16ArrayConstructor502_012
     * @tc.desc Verify NaN length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor502_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array();
        let b: Uint16Array = new Uint16Array(Number.NaN);
        expect(a.length).assertEqual(0);
        expect(b.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR502_1300
     * @tc.name testUint16ArrayConstructor502_013
     * @tc.desc Verify Infinity length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor502_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        try {
          let b: Uint16Array = new Uint16Array(Number.POSITIVE_INFINITY);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("RangeError");
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR502_1400
     * @tc.name testUint16ArrayConstructor502_014
     * @tc.desc Verify -Infinity length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor502_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        try {
          let b: Uint16Array = new Uint16Array(-Number.POSITIVE_INFINITY);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("RangeError");
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR502_1500
     * @tc.name testUint16ArrayConstructor502_015
     * @tc.desc Verify Array<int> 0x int toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor502_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array([0x00, 0x00, 0x00]);
        let b: Uint16Array = new Uint16Array(3);
        expect(a.toString()).assertEqual(b.toString());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR502_1600
     * @tc.name testUint16ArrayConstructor502_016
     * @tc.desc Verify Array<int> toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor502_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array([0o10, 0o20, 0o30]);
        let b: Uint16Array = new Uint16Array([8, 16, 24]);
        expect(a.toString()).assertEqual(b.toString());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR502_1700
     * @tc.name testUint16ArrayConstructor502_017
     * @tc.desc Verify Array<int> toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor502_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array([0b1111, 0b1010]);
        let b: Uint16Array = new Uint16Array([15, 10]);
        expect(a.toString()).assertEqual(b.toString());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR502_1800
     * @tc.name testUint16ArrayConstructor502_018
     * @tc.desc Verify ArrayBuffer+offset ArrayBuffer+offset+length buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor502_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 4, 2);
        let b: Uint16Array = new Uint16Array(buf, 4);
        a[0] = 48879;
        expect(b.at(0)).assertEqual(48879);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR502_1900
     * @tc.name testUint16ArrayConstructor502_019
     * @tc.desc Verify ArrayBuffer+offset DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor502_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 2, 3);
        a[0] = 0xCAFE;
        let dv: DataView = new DataView(buf);
        let res=dv.getUint16(2, true)
        expect(res).assertEqual(0xCAFE);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR502_2000
     * @tc.name testUint16ArrayConstructor502_020
     * @tc.desc Verify ArrayBuffer with undefined offset and length covers whole buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor502_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let arr: Uint16Array = new Uint16Array(buf, undefined, undefined);
        expect(arr.length).assertEqual(4);
        expect(arr.byteOffset).assertEqual(0);
        expect(arr.byteLength).assertEqual(8);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR502_2100
     * @tc.name testUint16ArrayConstructor502_021
     * @tc.desc Verify FixedArray<int> Array<int> -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor502_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let fa: FixedArray<int> = new FixedArray<int>(2);
        fa[0] = -1;
        fa[1] = -32768;
        let a: Uint16Array = new Uint16Array(fa);
        let b: Uint16Array = new Uint16Array([-1, -32768]);
        expect(a.at(0)).assertEqual(65535);
        expect(b.at(0)).assertEqual(65535);
        expect(a.at(1)).assertEqual(32768);
        expect(b.at(1)).assertEqual(32768);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR502_2200
     * @tc.name testUint16ArrayConstructor502_022
     * @tc.desc Verify ArrayBuffer byteOffset as hex 0x4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor502_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 0x4, 3);
        expect(a.byteOffset).assertEqual(4);
        expect(a.length).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR502_2300
     * @tc.name testUint16ArrayConstructor502_023
     * @tc.desc Verify ArrayBuffer with offset undefined (default 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor502_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(12);
        let a: Uint16Array = new Uint16Array(buf, undefined, 4);
        expect(a.byteOffset).assertEqual(0);
        expect(a.length).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR502_2400
     * @tc.name testUint16ArrayConstructor502_024
     * @tc.desc Verify boundary values together in ArrayBuffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor502_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(12);
        let a: Uint16Array = new Uint16Array(buf, 0, 6);
        a[0] = 0;
        a[1] = 1;
        a[2] = 32767;
        a[3] = 32768;
        a[4] = 65534;
        a[5] = 65535;
        let b: Uint16Array = new Uint16Array(buf, 0, 6);
        expect(b.at(0)).assertEqual(0);
        expect(b.at(1)).assertEqual(1);
        expect(b.at(2)).assertEqual(32767);
        expect(b.at(3)).assertEqual(32768);
        expect(b.at(4)).assertEqual(65534);
        expect(b.at(5)).assertEqual(65535);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR502_2500
     * @tc.name testUint16ArrayConstructor502_025
     * @tc.desc Verify Set with mixed number types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor502_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let s: Set<number> = new Set<number>();
        s.add(0xFFFF);
        s.add(0o100000);
        s.add(0b1111111111111111);
        let a: Uint16Array = new Uint16Array(s);
        expect(a.length).assertEqual(2);
        expect(a.at(0)).assertEqual(65535);
      }
    });

  });
}
