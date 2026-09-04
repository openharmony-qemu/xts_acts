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

export default function uint16ArrayConstructor10Test(): void {
  describe('Uint16ArrayConstructor10Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TEN_0001
     * @tc.name testUint16ArrayConstructorTen001
     * @tc.desc Verify Array<int> FixedArray Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTen001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let fa: FixedArray<number> = new FixedArray<number>(2, 0);
        fa[0] = 777;
        fa[1] = 888;
        let a: Uint16Array = new Uint16Array(fa);
        fa[0] = 999;
        expect(a.at(0)).assertEqual(777);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TEN_0002
     * @tc.name testUint16ArrayConstructorTen002
     * @tc.desc Verify Uint16Array byteLength buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTen002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let src: Uint16Array = new Uint16Array([5, 10, 15, 20]);
        let copy: Uint16Array = new Uint16Array(src);
        expect(src.byteLength).assertEqual(copy.byteLength);
        copy[0] = 99;
        expect(src.at(0)).assertEqual(5);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TEN_0003
     * @tc.name testUint16ArrayConstructorTen003
     * @tc.desc Verify int buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTen003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(4);
        let b: Uint16Array = new Uint16Array(4);
        a[0] = 99;
        expect(b.at(0)).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TEN_0004
     * @tc.name testUint16ArrayConstructorTen004
     * @tc.desc Verify Array<int> buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTen004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array([1, 2]);
        let b: Uint16Array = new Uint16Array([1, 2]);
        a[0] = 99;
        expect(b.at(0)).assertEqual(1);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TEN_0005
     * @tc.name testUint16ArrayConstructorTen005
     * @tc.desc Verify ArrayBuffer buffer DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTen005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let a: Uint16Array = new Uint16Array(buf, 0, 4);
        a[0] = 0xABCD;
        let dv: DataView = new DataView(buf);
        expect(dv.getUint16(0, true)).assertEqual(0xABCD);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TEN_0006
     * @tc.name testUint16ArrayConstructorTen006
     * @tc.desc Verify ArrayBuffer+offset buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTen006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TEN_0007
     * @tc.name testUint16ArrayConstructorTen007
     * @tc.desc Verify buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTen007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let src: Uint16Array = new Uint16Array([1, 2, 3]);
        let copy: Uint16Array = new Uint16Array(src);
        copy[0] = 999;
        expect(src.buffer.byteLength).assertEqual(6);
        expect(copy.buffer.byteLength).assertEqual(6);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TEN_0008
     * @tc.name testUint16ArrayConstructorTen008
     * @tc.desc Verify ArrayBuffer byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTen008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(32);
        let a: Uint16Array = new Uint16Array(buf, 6, 5);
        expect(a.byteOffset).assertEqual(6);
        expect(a.length).assertEqual(5);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TEN_0009
     * @tc.name testUint16ArrayConstructorTen009
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTen009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TEN_0010
     * @tc.name testUint16ArrayConstructorTen010
     * @tc.desc Verify Array<int> Uint16Array byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTen010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let src: Uint16Array = new Uint16Array([100, 200, 300, 400]);
        let a: Uint16Array = new Uint16Array([100, 200, 300, 400]);
        let b: Uint16Array = new Uint16Array(src);
        expect(a.byteLength).assertEqual(8);
        expect(b.byteLength).assertEqual(8);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TEN_0011
     * @tc.name testUint16ArrayConstructorTen011
     * @tc.desc Verify ArrayBuffer+offset byteOffset int byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTen011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(20);
        let a: Uint16Array = new Uint16Array(buf, 6);
        let b: Uint16Array = new Uint16Array(7);
        expect(a.byteOffset).assertEqual(6);
        expect(b.byteOffset).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TEN_0012
     * @tc.name testUint16ArrayConstructorTen012
     * @tc.desc Verify NaN length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTen012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array();
        let b: Uint16Array = new Uint16Array(Number.NaN);
        expect(a.length).assertEqual(0);
        expect(b.length).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TEN_0013
     * @tc.name testUint16ArrayConstructorTen013
     * @tc.desc Verify Array<int> 0x int toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTen013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array([0x00, 0x00, 0x00]);
        let b: Uint16Array = new Uint16Array(3);
        expect(a.toString()).assertEqual(b.toString());
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TEN_0014
     * @tc.name testUint16ArrayConstructorTen014
     * @tc.desc Verify Array<int> toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTen014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array([0o10, 0o20, 0o30]);
        let b: Uint16Array = new Uint16Array([8, 16, 24]);
        expect(a.toString()).assertEqual(b.toString());
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TEN_0015
     * @tc.name testUint16ArrayConstructorTen015
     * @tc.desc Verify Array<int> toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTen015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array([0b1111, 0b1010]);
        let b: Uint16Array = new Uint16Array([15, 10]);
        expect(a.toString()).assertEqual(b.toString());
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TEN_0016
     * @tc.name testUint16ArrayConstructorTen016
     * @tc.desc Verify ArrayBuffer+offset ArrayBuffer+offset+length buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTen016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 4, 2);
        let b: Uint16Array = new Uint16Array(buf, 4);
        a[0] = 48879;
        expect(b.at(0)).assertEqual(48879);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TEN_0017
     * @tc.name testUint16ArrayConstructorTen017
     * @tc.desc Verify ArrayBuffer+offset DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTen017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TEN_0018
     * @tc.name testUint16ArrayConstructorTen018
     * @tc.desc Verify ArrayBuffer with undefined offset and length covers whole buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTen018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let arr: Uint16Array = new Uint16Array(buf, undefined, undefined);
        expect(arr.length).assertEqual(4);
        expect(arr.byteOffset).assertEqual(0);
        expect(arr.byteLength).assertEqual(8);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TEN_0019
     * @tc.name testUint16ArrayConstructorTen019
     * @tc.desc Verify FixedArray<int> Array<int> -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTen019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let fa: FixedArray<int> = new FixedArray<int>(2, 0);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TEN_0020
     * @tc.name testUint16ArrayConstructorTen020
     * @tc.desc Verify ArrayBuffer byteOffset as hex 0x4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTen020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 0x4, 3);
        expect(a.byteOffset).assertEqual(4);
        expect(a.length).assertEqual(3);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TEN_0021
     * @tc.name testUint16ArrayConstructorTen021
     * @tc.desc Verify ArrayBuffer with offset undefined (default 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTen021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(12);
        let a: Uint16Array = new Uint16Array(buf, undefined, 4);
        expect(a.byteOffset).assertEqual(0);
        expect(a.length).assertEqual(4);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TEN_0022
     * @tc.name testUint16ArrayConstructorTen022
     * @tc.desc Verify boundary values together in ArrayBuffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTen022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TEN_0023
     * @tc.name testUint16ArrayConstructorTen023
     * @tc.desc Verify Set with mixed number types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTen023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
