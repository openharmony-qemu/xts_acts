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

export default function uint16ArrayConstructor09Test(): void {
  describe('Uint16ArrayConstructor09Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0001
     * @tc.name testUint16ArrayConstructorNine001
     * @tc.desc Verify int 0 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array();
        let b: Uint16Array = new Uint16Array(0);
        expect(a.length).assertEqual(0);
        expect(b.length).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0002
     * @tc.name testUint16ArrayConstructorNine002
     * @tc.desc Verify int 3 [0,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(3);
        expect(a.at(0)).assertEqual(0);
        expect(a.at(1)).assertEqual(0);
        expect(a.at(2)).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0003
     * @tc.name testUint16ArrayConstructorNine003
     * @tc.desc Verify Array<int> Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let src: Uint16Array = new Uint16Array([10, 20, 30]);
        let b: Uint16Array = new Uint16Array(src);
        expect(b.at(0)).assertEqual(10);
        expect(b.at(1)).assertEqual(20);
        expect(b.at(2)).assertEqual(30);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0004
     * @tc.name testUint16ArrayConstructorNine004
     * @tc.desc Verify int 5 float 5.0 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(5);
        let b: Uint16Array = new Uint16Array(5.0);
        expect(a.length).assertEqual(5);
        expect(b.length).assertEqual(5);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0005
     * @tc.name testUint16ArrayConstructorNine005
     * @tc.desc Verify float 5.5 int 5 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(5);
        let b: Uint16Array = new Uint16Array(5.5);
        expect(a.length).assertEqual(5);
        expect(b.length).assertEqual(5);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0006
     * @tc.name testUint16ArrayConstructorNine006
     * @tc.desc Verify ArrayBuffer ArrayBuffer+offset byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf);
        let b: Uint16Array = new Uint16Array(buf, 0);
        expect(a.byteOffset).assertEqual(0);
        expect(b.byteOffset).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0007
     * @tc.name testUint16ArrayConstructorNine007
     * @tc.desc Verify Array<int> length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array();
        let b: Uint16Array = new Uint16Array([]);
        expect(a.length).assertEqual(0);
        expect(b.length).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0008
     * @tc.name testUint16ArrayConstructorNine008
     * @tc.desc Verify int 0 byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(0);
        let b: Uint16Array = new Uint16Array([]);
        expect(a.byteLength).assertEqual(0);
        expect(b.byteLength).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0009
     * @tc.name testUint16ArrayConstructorNine009
     * @tc.desc Verify ArrayBuffer+offset int ArrayBuffer+offset number byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 2);
        let b: Uint16Array = new Uint16Array(buf, 2.0);
        expect(a.byteOffset).assertEqual(2);
        expect(b.byteOffset).assertEqual(2);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0010
     * @tc.name testUint16ArrayConstructorNine010
     * @tc.desc Verify ArrayBuffer+offset+length ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 0, 4);
        let b: Uint16Array = new Uint16Array(buf);
        expect(a.buffer).assertEqual(b.buffer);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0011
     * @tc.name testUint16ArrayConstructorNine011
     * @tc.desc Verify Array<int> [65535] Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let src: Uint16Array = new Uint16Array([65535]);
        let a: Uint16Array = new Uint16Array([65535]);
        let b: Uint16Array = new Uint16Array(src);
        expect(a.at(0)).assertEqual(65535);
        expect(b.at(0)).assertEqual(65535);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0012
     * @tc.name testUint16ArrayConstructorNine012
     * @tc.desc Verify FixedArray<number> Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let fa: FixedArray<number> = new FixedArray<number>(3, 0);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0013
     * @tc.name testUint16ArrayConstructorNine013
     * @tc.desc Verify ArrayBuffer+offset+length ArrayBuffer+offset length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 0, 3);
        let b: Uint16Array = new Uint16Array(buf, 0);
        expect(a.length).assertEqual(3);
        expect(b.length).assertEqual(8);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0014
     * @tc.name testUint16ArrayConstructorNine014
     * @tc.desc Verify int 3 FixedArray<int> length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(3);
        let fa: FixedArray<int> = new FixedArray<int>(3, 0);
        fa[0] = 0;
        fa[1] = 0;
        fa[2] = 0;
        let b: Uint16Array = new Uint16Array(fa);
        expect(a.length).assertEqual(3);
        expect(b.length).assertEqual(3);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0015
     * @tc.name testUint16ArrayConstructorNine015
     * @tc.desc Verify ArrayBuffer buffer null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array();
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let b: Uint16Array = new Uint16Array(buf, 0);
        expect(a.buffer.byteLength).assertEqual(0);
        expect(b.buffer.byteLength).assertEqual(8);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0016
     * @tc.name testUint16ArrayConstructorNine016
     * @tc.desc Verify Array<int> int 1 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(1);
        let b: Uint16Array = new Uint16Array([0]);
        expect(a.length).assertEqual(1);
        expect(b.length).assertEqual(1);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0017
     * @tc.name testUint16ArrayConstructorNine017
     * @tc.desc Verify ArrayBuffer Uint16Array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0018
     * @tc.name testUint16ArrayConstructorNine018
     * @tc.desc Verify int 7 Array<int> [0,0,0,0,0,0,0] byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(7);
        let b: Uint16Array = new Uint16Array([0, 0, 0, 0, 0, 0, 0]);
        expect(a.byteLength).assertEqual(14);
        expect(b.byteLength).assertEqual(14);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0019
     * @tc.name testUint16ArrayConstructorNine019
     * @tc.desc Verify byteOffset int 0 byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array();
        let b: Uint16Array = new Uint16Array(0);
        expect(a.byteOffset).assertEqual(0);
        expect(b.byteOffset).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0020
     * @tc.name testUint16ArrayConstructorNine020
     * @tc.desc Verify ArrayBuffer+byteOffset ArrayBuffer+byteOffset+length byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 4);
        let b: Uint16Array = new Uint16Array(buf, 4, 3);
        expect(a.byteOffset).assertEqual(4);
        expect(b.byteOffset).assertEqual(4);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0021
     * @tc.name testUint16ArrayConstructorNine021
     * @tc.desc Verify Set<number> Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0022
     * @tc.name testUint16ArrayConstructorNine022
     * @tc.desc Verify Array<int> 3.14 int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array([3.14]);
        let b: Uint16Array = new Uint16Array([3]);
        expect(a.at(0)).assertEqual(3);
        expect(b.at(0)).assertEqual(3);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0023
     * @tc.name testUint16ArrayConstructorNine023
     * @tc.desc Verify ArrayBuffer byteOffset=6 byteOffset=2 byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 2);
        let b: Uint16Array = new Uint16Array(buf, 6);
        expect(a.byteOffset).assertEqual(2);
        expect(b.byteOffset).assertEqual(6);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0024
     * @tc.name testUint16ArrayConstructorNine024
     * @tc.desc Verify int 8 ArrayBuffer+length=8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(8);
        let b: Uint16Array = new Uint16Array(buf, 0, 8);
        expect(a.length).assertEqual(8);
        expect(b.length).assertEqual(8);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0025
     * @tc.name testUint16ArrayConstructorNine025
     * @tc.desc Verify FixedArray<int> Array<int> length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let fa: FixedArray<int> = new FixedArray<int>(2, 0);
        fa[0] = 42;
        fa[1] = 84;
        let a: Uint16Array = new Uint16Array(fa);
        let b: Uint16Array = new Uint16Array([42, 84]);
        expect(a.length).assertEqual(2);
        expect(b.length).assertEqual(2);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0026
     * @tc.name testUint16ArrayConstructorNine026
     * @tc.desc Verify buffer byteLength int 0 buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array();
        let b: Uint16Array = new Uint16Array(0);
        expect(a.buffer.byteLength).assertEqual(0);
        expect(b.buffer.byteLength).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0027
     * @tc.name testUint16ArrayConstructorNine027
     * @tc.desc Verify ArrayBuffer+offset+length ArrayBuffer+offset buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(24);
        let a: Uint16Array = new Uint16Array(buf, 4, 5);
        let b: Uint16Array = new Uint16Array(buf, 4);
        expect(a.buffer.byteLength).assertEqual(24);
        expect(b.buffer.byteLength).assertEqual(24);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0028
     * @tc.name testUint16ArrayConstructorNine028
     * @tc.desc Verify int 65536 Array<int> length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(65536);
        let b: Uint16Array = new Uint16Array([]);
        expect(a.length).assertEqual(65536);
        expect(b.length).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0029
     * @tc.name testUint16ArrayConstructorNine029
     * @tc.desc Verify int 3 Array<int> [0,0,0] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0030
     * @tc.name testUint16ArrayConstructorNine030
     * @tc.desc Verify FixedArray<number> Array<int> length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let fa: FixedArray<number> = new FixedArray<number>(0, 0);
        let a: Uint16Array = new Uint16Array(fa);
        let b: Uint16Array = new Uint16Array([]);
        expect(a.length).assertEqual(0);
        expect(b.length).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0031
     * @tc.name testUint16ArrayConstructorNine031
     * @tc.desc Verify byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0032
     * @tc.name testUint16ArrayConstructorNine032
     * @tc.desc Verify ArrayBuffer+offset+length ArrayBuffer byteLength *2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 0, 5);
        let b: Uint16Array = new Uint16Array(buf);
        expect(a.byteLength).assertEqual(10);
        expect(b.byteLength).assertEqual(16);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0033
     * @tc.name testUint16ArrayConstructorNine033
     * @tc.desc Verify int 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(10);
        for (let i: int = 0; i < 10; i++) {
          expect(a[i]).assertEqual(0);
        }
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0034
     * @tc.name testUint16ArrayConstructorNine034
     * @tc.desc Verify Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array([100, 200, 300, 400]);
        expect(a.at(0)).assertEqual(100);
        expect(a.at(1)).assertEqual(200);
        expect(a.at(2)).assertEqual(300);
        expect(a.at(3)).assertEqual(400);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0035
     * @tc.name testUint16ArrayConstructorNine035
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let src: Uint16Array = new Uint16Array([99, 88, 77]);
        let a: Uint16Array = new Uint16Array(src);
        expect(a.at(0)).assertEqual(99);
        expect(a.at(1)).assertEqual(88);
        expect(a.at(2)).assertEqual(77);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0036
     * @tc.name testUint16ArrayConstructorNine036
     * @tc.desc Verify ArrayBuffer+offset byteLength buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(20);
        let a: Uint16Array = new Uint16Array(buf, 4);
        expect(a.byteLength).assertEqual(16);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0037
     * @tc.name testUint16ArrayConstructorNine037
     * @tc.desc Verify ArrayBuffer+offset+length byteLength length*2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(20);
        let a: Uint16Array = new Uint16Array(buf, 4, 6);
        expect(a.byteLength).assertEqual(12);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0038
     * @tc.name testUint16ArrayConstructorNine038
     * @tc.desc Verify int buffer byteLength length*2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(7);
        expect(a.buffer.byteLength).assertEqual(14);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0039
     * @tc.name testUint16ArrayConstructorNine039
     * @tc.desc Verify Array<int> buffer byteLength *2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        expect(a.buffer.byteLength).assertEqual(10);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0040
     * @tc.name testUint16ArrayConstructorNine040
     * @tc.desc Verify int 1 byteLength 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(1);
        expect(a.byteLength).assertEqual(2);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0041
     * @tc.name testUint16ArrayConstructorNine041
     * @tc.desc Verify FixedArray<number> byteLength 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let fa: FixedArray<number> = new FixedArray<number>(1, 0);
        fa[0] = 42;
        let a: Uint16Array = new Uint16Array(fa);
        expect(a.byteLength).assertEqual(2);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0042
     * @tc.name testUint16ArrayConstructorNine042
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0043
     * @tc.name testUint16ArrayConstructorNine043
     * @tc.desc Verify ArrayBuffer+offset=0 byteLength buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(12);
        let a: Uint16Array = new Uint16Array(buf, 0);
        expect(a.byteLength).assertEqual(12);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0044
     * @tc.name testUint16ArrayConstructorNine044
     * @tc.desc Verify buffer null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0045
     * @tc.name testUint16ArrayConstructorNine045
     * @tc.desc Verify ArrayBuffer buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 0, 5);
        expect(a.buffer).assertEqual(buf);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0046
     * @tc.name testUint16ArrayConstructorNine046
     * @tc.desc Verify array and length constructors create buffers with expected byte lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array([1, 2]);
        let b: Uint16Array = new Uint16Array(2);
        expect(a.buffer.byteLength).assertEqual(4);
        expect(b.buffer.byteLength).assertEqual(4);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0047
     * @tc.name testUint16ArrayConstructorNine047
     * @tc.desc Verify ArrayBuffer offset RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0048
     * @tc.name testUint16ArrayConstructorNine048
     * @tc.desc Verify ArrayBuffer+length buffer RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0049
     * @tc.name testUint16ArrayConstructorNine049
     * @tc.desc Verify byteOffset RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0050
     * @tc.name testUint16ArrayConstructorNine050
     * @tc.desc Verify length RangeError int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0051
     * @tc.name testUint16ArrayConstructorNine051
     * @tc.desc Verify negative number -1 wraps to 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array([-1]);
        let b: Uint16Array = new Uint16Array([65535]);
        expect(a.at(0)).assertEqual(65535);
        expect(b.at(0)).assertEqual(65535);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0052
     * @tc.name testUint16ArrayConstructorNine052
     * @tc.desc Verify overflow number 65536 wraps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array([65536]);
        let b: Uint16Array = new Uint16Array([0]);
        expect(a.at(0)).assertEqual(0);
        expect(b.at(0)).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0053
     * @tc.name testUint16ArrayConstructorNine053
     * @tc.desc Verify NaN length 0 Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(Number.NaN);
        let b: Uint16Array = new Uint16Array([1]);
        expect(a.length).assertEqual(0);
        expect(b.at(0)).assertEqual(1);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0054
     * @tc.name testUint16ArrayConstructorNine054
     * @tc.desc Verify byteOffset+length buffer RangeError byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0055
     * @tc.name testUint16ArrayConstructorNine055
     * @tc.desc Verify ArrayBuffer Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0056
     * @tc.name testUint16ArrayConstructorNine056
     * @tc.desc Verify offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0057
     * @tc.name testUint16ArrayConstructorNine057
     * @tc.desc Verify buffer FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(0);
        let fa: FixedArray<number> = new FixedArray<number>(2, 0);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0058
     * @tc.name testUint16ArrayConstructorNine058
     * @tc.desc Verify offset+length buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(10);
        let a: Uint16Array = new Uint16Array(buf, 2, 4);
        expect(a.byteLength).assertEqual(8);
        expect(a.length).assertEqual(4);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0059
     * @tc.name testUint16ArrayConstructorNine059
     * @tc.desc Verify int 0 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array();
        let b: Uint16Array = new Uint16Array(0);
        expect(a.toString()).assertEqual("");
        expect(b.toString()).assertEqual("");
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0060
     * @tc.name testUint16ArrayConstructorNine060
     * @tc.desc Verify Array<int> Uint16Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let src: Uint16Array = new Uint16Array([10, 20]);
        let b: Uint16Array = new Uint16Array(src);
        expect(b.toString()).assertEqual("10,20");
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0061
     * @tc.name testUint16ArrayConstructorNine061
     * @tc.desc Verify int 5 toString 5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(5);
        let s: string = a.toString();
        expect(s).assertEqual("0,0,0,0,0");
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0062
     * @tc.name testUint16ArrayConstructorNine062
     * @tc.desc Verify Array<int> [1,2,3] toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array([1, 2, 3]);
        expect(a.toString()).assertEqual("1,2,3");
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0063
     * @tc.name testUint16ArrayConstructorNine063
     * @tc.desc Verify ArrayBuffer+offset toString int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 0, 3);
        expect(a.toString()).assertEqual("0,0,0");
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0064
     * @tc.name testUint16ArrayConstructorNine064
     * @tc.desc Verify valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0065
     * @tc.name testUint16ArrayConstructorNine065
     * @tc.desc Verify int Array<int> length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(8);
        let b: Uint16Array = new Uint16Array([9, 8, 7]);
        expect(a.length).assertEqual(8);
        expect(b.length).assertEqual(3);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0066
     * @tc.name testUint16ArrayConstructorNine066
     * @tc.desc Verify ArrayBuffer and array constructors produce expected lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 0, 4);
        let b: Uint16Array = new Uint16Array([1]);
        expect(a.length).assertEqual(4);
        expect(b.length).assertEqual(1);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0067
     * @tc.name testUint16ArrayConstructorNine067
     * @tc.desc Verify byteLength for empty, length, and array constructors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0068
     * @tc.name testUint16ArrayConstructorNine068
     * @tc.desc Verify default and length constructors use zero byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array();
        let b: Uint16Array = new Uint16Array(3);
        expect(a.byteOffset).assertEqual(0);
        expect(b.byteOffset).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0069
     * @tc.name testUint16ArrayConstructorNine069
     * @tc.desc Verify buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0070
     * @tc.name testUint16ArrayConstructorNine070
     * @tc.desc Verify ArrayBuffer int buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(20);
        let a: Uint16Array = new Uint16Array(buf, 0, 5);
        let b: Uint16Array = new Uint16Array(5);
        expect(a.buffer.byteLength).assertEqual(20);
        expect(b.buffer.byteLength).assertEqual(10);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0071
     * @tc.name testUint16ArrayConstructorNine071
     * @tc.desc Verify toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array();
        let b: Uint16Array = new Uint16Array([]);
        expect(a.toString()).assertEqual("");
        expect(b.toString()).assertEqual("");
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0072
     * @tc.name testUint16ArrayConstructorNine072
     * @tc.desc Verify Uint16Array toString toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let src: Uint16Array = new Uint16Array([255, 512, 1024]);
        let a: Uint16Array = new Uint16Array(src);
        expect(a.toString()).assertEqual("255,512,1024");
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0073
     * @tc.name testUint16ArrayConstructorNine073
     * @tc.desc Verify Array<int> toString 65535 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array([0, 65535, 32768]);
        expect(a.toString()).assertEqual("0,65535,32768");
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0074
     * @tc.name testUint16ArrayConstructorNine074
     * @tc.desc Verify FixedArray<number> toString Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let fa: FixedArray<number> = new FixedArray<number>(3, 0);
        fa[0] = 1000;
        fa[1] = 2000;
        fa[2] = 3000;
        let a: Uint16Array = new Uint16Array(fa);
        expect(a.toString()).assertEqual("1000,2000,3000");
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0075
     * @tc.name testUint16ArrayConstructorNine075
     * @tc.desc Verify ArrayBuffer+offset toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0076
     * @tc.name testUint16ArrayConstructorNine076
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array(5);
        let b: Uint16Array = new Uint16Array([1, 2]);
        expect(a.length).assertEqual(5);
        expect(b.length).assertEqual(2);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0077
     * @tc.name testUint16ArrayConstructorNine077
     * @tc.desc Verify ArrayBuffer Uint16Array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 0, 4);
        let b: Uint16Array = new Uint16Array(buf, 8, 4);
        expect(a.buffer).assertEqual(b.buffer);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0078
     * @tc.name testUint16ArrayConstructorNine078
     * @tc.desc Verify Uint16Array buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 0, 3);
        let b: Uint16Array = new Uint16Array(buf, 0, 3);
        a[0] = 12345;
        expect(b.at(0)).assertEqual(12345);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0079
     * @tc.name testUint16ArrayConstructorNine079
     * @tc.desc Verify Uint16Array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let src: Uint16Array = new Uint16Array([1, 2, 3]);
        let copy: Uint16Array = new Uint16Array(src);
        copy[0] = 99;
        expect(src.at(0)).assertEqual(1);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0080
     * @tc.name testUint16ArrayConstructorNine080
     * @tc.desc Verify modifying the source does not affect the copied Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let src: Uint16Array = new Uint16Array([10, 20, 30]);
        let copy: Uint16Array = new Uint16Array(src);
        src[0] = 999;
        expect(copy.at(0)).assertEqual(10);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0081
     * @tc.name testUint16ArrayConstructorNine081
     * @tc.desc Verify modifying the copy does not affect the source Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let src: Uint16Array = new Uint16Array([10, 20, 30]);
        let copy: Uint16Array = new Uint16Array(src);
        copy[1] = 888;
        expect(src.at(1)).assertEqual(20);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0082
     * @tc.name testUint16ArrayConstructorNine082
     * @tc.desc Verify ArrayBuffer+offset ArrayBuffer+offset+length buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 0, 4);
        let b: Uint16Array = new Uint16Array(buf, 0);
        a[0] = 54321;
        expect(b.at(0)).assertEqual(54321);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0083
     * @tc.name testUint16ArrayConstructorNine083
     * @tc.desc Verify ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0084
     * @tc.name testUint16ArrayConstructorNine084
     * @tc.desc Verify Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let src: Array<int> = [1, 2, 3];
        let a: Uint16Array = new Uint16Array(src);
        src[0] = 999;
        expect(a.at(0)).assertEqual(1);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0085
     * @tc.name testUint16ArrayConstructorNine085
     * @tc.desc Verify ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 0, 4);
        a[2] = 60000;
        let b: Uint16Array = new Uint16Array(buf, 0, 4);
        expect(b.at(2)).assertEqual(60000);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0086
     * @tc.name testUint16ArrayConstructorNine086
     * @tc.desc Verify independently constructed Uint16Arrays retain their own assigned values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0087
     * @tc.name testUint16ArrayConstructorNine087
     * @tc.desc Verify ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 0, 3);
        let b: Uint16Array = new Uint16Array(3);
        a[0] = 99;
        expect(b.at(0)).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0088
     * @tc.name testUint16ArrayConstructorNine088
     * @tc.desc Verify Uint16Array ArrayBuffer buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0089
     * @tc.name testUint16ArrayConstructorNine089
     * @tc.desc Verify ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a: Uint16Array = new Uint16Array(buf, 4, 2);
        let b: Uint16Array = new Uint16Array(buf, 4, 2);
        a[1] = 65000;
        expect(b.at(1)).assertEqual(65000);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0090
     * @tc.name testUint16ArrayConstructorNine090
     * @tc.desc Verify byteOffset buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0091
     * @tc.name testUint16ArrayConstructorNine091
     * @tc.desc Verify octal literal [0o177777, 0o100000]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array([0o177777, 0o100000]);
        expect(a.at(0)).assertEqual(65535);
        expect(a.at(1)).assertEqual(32768);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0092
     * @tc.name testUint16ArrayConstructorNine092
     * @tc.desc Verify binary literal [0b1111111111111111]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let a: Uint16Array = new Uint16Array([0b1111111111111111]);
        expect(a.at(0)).assertEqual(65535);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0093
     * @tc.name testUint16ArrayConstructorNine093
     * @tc.desc Verify ArrayBuffer byteOffset equal to buffer.byteLength with length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(10);
        let a: Uint16Array = new Uint16Array(buf, 10, 0);
        expect(a.length).assertEqual(0);
        expect(a.byteOffset).assertEqual(10);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_NINE_0094
     * @tc.name testUint16ArrayConstructorNine094
     * @tc.desc Verify boundary values together [0, 1, 32767, 32768, 65534, 65535]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorNine094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
