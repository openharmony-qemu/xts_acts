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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint32ArrayConstructorTest5(): void {
  describe('Uint32ArrayConstructorTest5', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0010
     * @tc.name testUint32ArrayConstructorFive001
     * @tc.desc Verify 3 length array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const byLen = new Uint32Array(3);
      const byArr: Array<number> = [3];
      const fromArr = new Uint32Array(byArr);
      expect(byLen.length).assertEqual(3);
      expect(fromArr.length).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0020
     * @tc.name testUint32ArrayConstructorFive002
     * @tc.desc Verify 3 length copy(Uint32Array) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const byLen = new Uint32Array(3);
      const byCopy = new Uint32Array(Uint32Array.of(3));
      expect(byLen.length).assertEqual(3);
      expect(byCopy.length).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0030
     * @tc.name testUint32ArrayConstructorFive003
     * @tc.desc Verify 3 array copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Array<number> = [3];
      const byArr = new Uint32Array(s);
      const byCopy = new Uint32Array(Uint32Array.of(3));
      expect(byArr.length).assertEqual(byCopy.length);
      expect(byArr[0]).assertEqual(byCopy[0]);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0040
     * @tc.name testUint32ArrayConstructorFive004
     * @tc.desc Verify 0 length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Uint32Array();
      const a2 = new Uint32Array(0);
      const s: Array<number> = [];
      const a3 = new Uint32Array(s);
      const a4 = new Uint32Array(new Uint32Array());
      const a5 = new Uint32Array(new ArrayBuffer(0));
      expect(a1.length).assertEqual(0);
      expect(a2.length).assertEqual(0);
      expect(a3.length).assertEqual(0);
      expect(a4.length).assertEqual(0);
      expect(a5.length).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0050
     * @tc.name testUint32ArrayConstructorFive005
     * @tc.desc Verify 1 length ( 0 1) array ([1])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const byLen = new Uint32Array(1);
      const s: Array<number> = [1];
      const byArr = new Uint32Array(s);
      expect(byLen[0]).assertEqual(0);
      expect(byArr[0]).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0060
     * @tc.name testUint32ArrayConstructorFive006
     * @tc.desc Verify number length 4 length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i: number = 4;
      const ai = new Uint32Array(i);
      expect(ai.length).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0070
     * @tc.name testUint32ArrayConstructorFive007
     * @tc.desc Verify number length 4 byteLength 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n: number = 4;
      const an = new Uint32Array(n);
      expect(an.byteLength).assertEqual(16);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0080
     * @tc.name testUint32ArrayConstructorFive008
     * @tc.desc Verify ArrayBuffer(overload13) (buf,0) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a1 = new Uint32Array(buf);
      const a2 = new Uint32Array(buf, 0);
      expect(a1.length).assertEqual(a2.length);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0090
     * @tc.name testUint32ArrayConstructorFive009
     * @tc.desc Verify length array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const byLen = new Uint32Array(4);
      const s: Array<number> = [0, 0, 0, 0];
      const byArr = new Uint32Array(s);
      expect(byLen.length).assertEqual(byArr.length);
      expect(byLen[3]).assertEqual(byArr[3]);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0100
     * @tc.name testUint32ArrayConstructorFive010
     * @tc.desc Verify (buf,0) byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const arr = new Uint32Array(buf, 0);
      expect(arr.byteOffset).assertEqual(0);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0110
     * @tc.name testUint32ArrayConstructorFive011
     * @tc.desc Verify undefined length length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Uint32Array(buf, 0, undefined);
      const b = new Uint32Array(buf, 0, 4);
      expect(a.length).assertEqual(b.length);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0120
     * @tc.name testUint32ArrayConstructorFive012
     * @tc.desc Verify undefined byteOffset(overload12) byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint32Array(buf, undefined, 2);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.length).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0130
     * @tc.name testUint32ArrayConstructorFive013
     * @tc.desc Verify undefined length byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Uint32Array(buf, undefined, undefined);
      const b = new Uint32Array(buf, 0, 4);
      expect(a.length).assertEqual(b.length);
      expect(a.byteOffset).assertEqual(b.byteOffset);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0140
     * @tc.name testUint32ArrayConstructorFive014
     * @tc.desc Verify constructor(other) constructor(FixedArray)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const other = Uint32Array.of(8, 9);
      const f: Array<number> = [8, 9];
      const ao = new Uint32Array(other);
      const af = new Uint32Array(f);
      expect(ao.length).assertEqual(af.length);
      expect(ao[0]).assertEqual(af[0]);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0150
     * @tc.name testUint32ArrayConstructorFive015
     * @tc.desc Verify Array<number> Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Array<number> = [5, 6, 7];
      const a: Array<number> = [5, 6, 7];
      const af = new Uint32Array(f);
      const aa = new Uint32Array(a);
      expect(af.length).assertEqual(aa.length);
      expect(af[2]).assertEqual(aa[2]);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0160
     * @tc.name testUint32ArrayConstructorFive016
     * @tc.desc Verify 2 length ( 0 2) array ([2,2])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const byLen = new Uint32Array(2);
      const s: Array<number> = [2, 2];
      const byArr = new Uint32Array(s);
      expect(byLen[0]).assertEqual(0);
      expect(byArr[0]).assertEqual(2);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0170
     * @tc.name testUint32ArrayConstructorFive017
     * @tc.desc Verify constructor(buf,4) byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint32Array(buf, 4);
      expect(arr.byteOffset).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0180
     * @tc.name testUint32ArrayConstructorFive018
     * @tc.desc Verify constructor(buf,4,2) byteOffset 4 length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint32Array(buf, 4, 2);
      expect(arr.byteOffset).assertEqual(4);
      expect(arr.length).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0190
     * @tc.name testUint32ArrayConstructorFive019
     * @tc.desc Verify constructor(buf,0) length = byteLength/4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint32Array(buf, 0);
      expect(arr.length).assertEqual(4);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0200
     * @tc.name testUint32ArrayConstructorFive020
     * @tc.desc Verify constructor(buf,undefined,undefined) byteOffset length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint32Array(buf, undefined, undefined);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.length).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0210
     * @tc.name testUint32ArrayConstructorFive021
     * @tc.desc Verify constructor() BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array();
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0220
     * @tc.name testUint32ArrayConstructorFive022
     * @tc.desc Verify constructor() length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array();
      expect(arr.length).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0230
     * @tc.name testUint32ArrayConstructorFive023
     * @tc.desc Verify constructor(buf,0) byteLength 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint32Array(buf, 0);
      expect(arr.byteLength).assertEqual(8);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0240
     * @tc.name testUint32ArrayConstructorFive024
     * @tc.desc Verify constructor(other) length 2 and arr[0] 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2);
      const arr = new Uint32Array(src);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0250
     * @tc.name testUint32ArrayConstructorFive025
     * @tc.desc Verify constructor(number length) buffer.byteLength = length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(5);
      expect(arr.buffer.byteLength).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0260
     * @tc.name testUint32ArrayConstructorFive026
     * @tc.desc Verify byteOffset=1 not multiple of 4 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0270
     * @tc.name testUint32ArrayConstructorFive027
     * @tc.desc Verify byteOffset=2 not multiple of 4 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0280
     * @tc.name testUint32ArrayConstructorFive028
     * @tc.desc Verify byteOffset=3 not multiple of 4 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0290
     * @tc.name testUint32ArrayConstructorFive029
     * @tc.desc Verify length(number -1) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint32Array(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0300
     * @tc.name testUint32ArrayConstructorFive030
     * @tc.desc Verify length(number -1) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n: number = -1;
      try {
        new Uint32Array(n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0310
     * @tc.name testUint32ArrayConstructorFive031
     * @tc.desc Verify byteOffset(-1) ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0320
     * @tc.name testUint32ArrayConstructorFive032
     * @tc.desc Verify ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const pre = new Uint32Array(buf, 0, 2);
      pre[0] = 111;
      pre[1] = 222;
      try {
        new Uint32Array(buf, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(pre[0]).assertEqual(111);
      expect(pre[1]).assertEqual(222);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0330
     * @tc.name testUint32ArrayConstructorFive033
     * @tc.desc Verify off=0 len=2 length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint32Array(buf, 0, 2);
      expect(arr.length).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0340
     * @tc.name testUint32ArrayConstructorFive034
     * @tc.desc Verify off=4 len=1 (4+4=8)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint32Array(buf, 4, 1);
      expect(arr.length).assertEqual(1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0350
     * @tc.name testUint32ArrayConstructorFive035
     * @tc.desc Verify constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const ok = new Uint32Array(buf, 0, 2);
      expect(ok.length).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0360
     * @tc.name testUint32ArrayConstructorFive036
     * @tc.desc Verify byteOffset=buf.byteLength len=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint32Array(buf, 8, 0);
      expect(arr.length).assertEqual(0);
      expect(arr.byteOffset).assertEqual(8);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0370
     * @tc.name testUint32ArrayConstructorFive037
     * @tc.desc Verify constructor() toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array();
      expect(arr.toString()).assertEqual('');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0380
     * @tc.name testUint32ArrayConstructorFive038
     * @tc.desc Verify constructor(number length) toString 0,0,0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(3);
      expect(arr.toString()).assertEqual('0,0,0');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0390
     * @tc.name testUint32ArrayConstructorFive039
     * @tc.desc Verify constructor(Array<number>) toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Array<number> = [1, 2, 3];
      const arr = new Uint32Array(s);
      expect(arr.toString()).assertEqual('1,2,3');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0400
     * @tc.name testUint32ArrayConstructorFive040
     * @tc.desc Verify constructor(other) toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4, 5, 6);
      const arr = new Uint32Array(src);
      expect(arr.toString()).assertEqual('4,5,6');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0410
     * @tc.name testUint32ArrayConstructorFive041
     * @tc.desc Verify constructor(buf,0,2) toString 0,0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint32Array(buf, 0, 2);
      expect(arr.toString()).assertEqual('0,0');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0420
     * @tc.name testUint32ArrayConstructorFive042
     * @tc.desc Verify constructor() join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array();
      expect(arr.join(',')).assertEqual('');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0430
     * @tc.name testUint32ArrayConstructorFive043
     * @tc.desc Verify constructor(number length) join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(2);
      expect(arr.join('|')).assertEqual('0|0');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0440
     * @tc.name testUint32ArrayConstructorFive044
     * @tc.desc Verify constructor(Array<number>) join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Array<number> = [7];
      const arr = new Uint32Array(s);
      expect(arr.join('')).assertEqual('7');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0450
     * @tc.name testUint32ArrayConstructorFive045
     * @tc.desc Verify constructor(number length) length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(3);
      expect(arr.length).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0460
     * @tc.name testUint32ArrayConstructorFive046
     * @tc.desc Verify constructor(other) length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(7, 8, 9);
      const arr = new Uint32Array(src);
      expect(arr.length).assertEqual(src.length);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0470
     * @tc.name testUint32ArrayConstructorFive047
     * @tc.desc Verify constructor(number length) $_set $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(2);
      arr[0] = 4242;
      expect(arr[0]).assertEqual(4242);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0480
     * @tc.name testUint32ArrayConstructorFive048
     * @tc.desc Verify constructor(buf,0,1) $_set $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint32Array(buf, 0, 1);
      arr[0] = 7777;
      expect(arr[0]).assertEqual(7777);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0490
     * @tc.name testUint32ArrayConstructorFive049
     * @tc.desc Verify constructor(Array<number>) $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Array<number> = [5];
      const arr = new Uint32Array(s);
      arr[0] = 9;
      expect(arr[0]).assertEqual(9);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0500
     * @tc.name testUint32ArrayConstructorFive050
     * @tc.desc Verify constructor(number length=0) byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      expect(arr.byteLength).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0510
     * @tc.name testUint32ArrayConstructorFive051
     * @tc.desc Verify constructor(Array<number> 3 ) byteLength 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Array<number> = [1, 2, 3];
      const arr = new Uint32Array(s);
      expect(arr.byteLength).assertEqual(12);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0520
     * @tc.name testUint32ArrayConstructorFive052
     * @tc.desc Verify constructor(other) byteLength byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2);
      const arr = new Uint32Array(src);
      expect(arr.byteLength).assertEqual(src.byteLength);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0530
     * @tc.name testUint32ArrayConstructorFive053
     * @tc.desc Verify constructor(other) $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const copy = new Uint32Array(src);
      src[0] = 999;
      expect(copy[0]).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0540
     * @tc.name testUint32ArrayConstructorFive054
     * @tc.desc Verify constructor(other) $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const copy = new Uint32Array(src);
      copy[0] = 888;
      expect(src[0]).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0550
     * @tc.name testUint32ArrayConstructorFive055
     * @tc.desc Verify constructor(other)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2);
      const c1 = new Uint32Array(src);
      const c2 = new Uint32Array(src);
      c1[0] = 555;
      expect(c2[0]).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0560
     * @tc.name testUint32ArrayConstructorFive056
     * @tc.desc Verify constructor(Array<number>)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20];
      const arr = new Uint32Array(src);
      src[0] = 999;
      expect(arr[0]).assertEqual(10);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0570
     * @tc.name testUint32ArrayConstructorFive057
     * @tc.desc Verify constructor(Array<number>) $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20];
      const arr = new Uint32Array(src);
      arr[0] = 777;
      expect(src[0]).assertEqual(10);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0580
     * @tc.name testUint32ArrayConstructorFive058
     * @tc.desc Verify constructor(other) [1] = X) [1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const copy = new Uint32Array(src);
      copy[1] = 444;
      expect(src[1]).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0590
     * @tc.name testUint32ArrayConstructorFive059
     * @tc.desc Verify constructor(other) BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2);
      const copy = new Uint32Array(src);
      expect(copy.BYTES_PER_ELEMENT).assertEqual(src.BYTES_PER_ELEMENT);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0600
     * @tc.name testUint32ArrayConstructorFive060
     * @tc.desc Verify constructor(other) (3 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30);
      const copy = new Uint32Array(src);
      expect(copy[0]).assertEqual(10);
      expect(copy[1]).assertEqual(20);
      expect(copy[2]).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0610
     * @tc.name testUint32ArrayConstructorFive061
     * @tc.desc Verify constructor(other 6 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4, 5, 6);
      const copy = new Uint32Array(src);
      src[5] = 999;
      expect(copy[5]).assertEqual(6);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0620
     * @tc.name testUint32ArrayConstructorFive062
     * @tc.desc Verify constructor(other) [0] = X) [0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2);
      const copy = new Uint32Array(src);
      copy[0] = 333;
      expect(src[0]).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0630
     * @tc.name testUint32ArrayConstructorFive063
     * @tc.desc Verify constructor(Array<number>) $_set ( fresh )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20];
      const arr = new Uint32Array(src);
      arr[0] = 777;
      const fresh = new Uint32Array(src);
      expect(fresh[0]).assertEqual(10);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0640
     * @tc.name testUint32ArrayConstructorFive064
     * @tc.desc Verify constructor(Array<number>) [1] = X) [1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20];
      const arr = new Uint32Array(src);
      arr[1] = 777;
      expect(src[1]).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0650
     * @tc.name testUint32ArrayConstructorFive065
     * @tc.desc Verify constructor(buf,4,1) [0] = X) buf offset4 X
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const v = new Uint32Array(buf, 4, 1);
      v[0] = 7;
      const r = new Uint32Array(buf, 0, 2);
      expect(r[1]).assertEqual(7);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0660
     * @tc.name testUint32ArrayConstructorFive066
     * @tc.desc Verify constructor(other) [2] = X) [2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const copy = new Uint32Array(src);
      copy[2] = 999;
      expect(src[2]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0670
     * @tc.name testUint32ArrayConstructorFive067
     * @tc.desc Verify constructor(other) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2);
      const view = new Uint32Array(src.buffer, 0, 2);
      const copy = new Uint32Array(src);
      copy[0] = 333;
      expect(view[0]).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0680
     * @tc.name testUint32ArrayConstructorFive068
     * @tc.desc Verify -1 Array<number> Array<number> 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sa: Array<number> = [-1];
      const a = new Uint32Array(sa);
      const sf: Array<number> = [-1];
      const b = new Uint32Array(sf);
      expect(a[0]).assertEqual(b[0]);
      expect(a[0]).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0690
     * @tc.name testUint32ArrayConstructorFive069
     * @tc.desc Verify 4294967295 copy Array<number> 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(Uint32Array.of(4294967295));
      const sf: Array<number> = [4294967295];
      const b = new Uint32Array(sf);
      expect(a[0]).assertEqual(b[0]);
      expect(b[0]).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0700
     * @tc.name testUint32ArrayConstructorFive070
     * @tc.desc Verify 4294967296 copy Array<number> 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(Uint32Array.of(4294967296));
      const sf: Array<number> = [4294967296];
      const b = new Uint32Array(sf);
      expect(a[0]).assertEqual(b[0]);
      expect(b[0]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0710
     * @tc.name testUint32ArrayConstructorFive071
     * @tc.desc Verify 2147483647 Array<number> Array<number> 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sa: Array<number> = [2147483647];
      const a = new Uint32Array(sa);
      const sf: Array<number> = [2147483647];
      const b = new Uint32Array(sf);
      expect(a[0]).assertEqual(b[0]);
      expect(a[0]).assertEqual(2147483647);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0720
     * @tc.name testUint32ArrayConstructorFive072
     * @tc.desc Verify -2147483648 Array<number> Array<number> 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sa: Array<number> = [-2147483648];
      const a = new Uint32Array(sa);
      const sf: Array<number> = [-2147483648];
      const b = new Uint32Array(sf);
      expect(a[0]).assertEqual(b[0]);
      expect(a[0]).assertEqual(2147483648);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0730
     * @tc.name testUint32ArrayConstructorFive073
     * @tc.desc Verify 3.14 copy Array<number> 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(Uint32Array.of(3.14));
      const sf: Array<number> = [3.14];
      const b = new Uint32Array(sf);
      expect(a[0]).assertEqual(b[0]);
      expect(b[0]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0740
     * @tc.name testUint32ArrayConstructorFive074
     * @tc.desc Verify 9007199254740991 copy Array<number> 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(Uint32Array.of(9007199254740991));
      const sf: Array<number> = [9007199254740991];
      const b = new Uint32Array(sf);
      expect(a[0]).assertEqual(b[0]);
      expect(b[0]).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0750
     * @tc.name testUint32ArrayConstructorFive075
     * @tc.desc Verify 0 Array<number> Array<number> 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sa: Array<number> = [0];
      const a = new Uint32Array(sa);
      const sf: Array<number> = [0];
      const b = new Uint32Array(sf);
      expect(a[0]).assertEqual(b[0]);
      expect(a[0]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0760
     * @tc.name testUint32ArrayConstructorFive076
     * @tc.desc Verify -2 Array<number> Array<number> 4294967294
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sa: Array<number> = [-2];
      const a = new Uint32Array(sa);
      const sf: Array<number> = [-2];
      const b = new Uint32Array(sf);
      expect(a[0]).assertEqual(b[0]);
      expect(a[0]).assertEqual(4294967294);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0770
     * @tc.name testUint32ArrayConstructorFive077
     * @tc.desc Verify 4294967294 copy Array<number> 4294967294
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(Uint32Array.of(4294967294));
      const sf: Array<number> = [4294967294];
      const b = new Uint32Array(sf);
      expect(a[0]).assertEqual(b[0]);
      expect(b[0]).assertEqual(4294967294);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0780
     * @tc.name testUint32ArrayConstructorFive078
     * @tc.desc Verify 1e10 copy Array<number> 1410065408
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(Uint32Array.of(1e10));
      const sf: Array<number> = [1e10];
      const b = new Uint32Array(sf);
      expect(a[0]).assertEqual(b[0]);
      expect(b[0]).assertEqual(1410065408);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0790
     * @tc.name testUint32ArrayConstructorFive079
     * @tc.desc Verify constructor(buf) constructor(buf,0) buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const a = new Uint32Array(buf);
      const b = new Uint32Array(buf, 0);
      a[1] = 55;
      expect(b[1]).assertEqual(55);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0800
     * @tc.name testUint32ArrayConstructorFive080
     * @tc.desc Verify view1[1] view2[0] buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const offset0View = new Uint32Array(buf, 0, 3);
      const offset4View = new Uint32Array(buf, 4, 2);
      offset0View[1] = 123;
      expect(offset4View[0]).assertEqual(123);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0810
     * @tc.name testUint32ArrayConstructorFive081
     * @tc.desc Verify constructor(buf,0,2) byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const v = new Uint32Array(buf, 0, 2);
      expect(v.byteOffset).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0820
     * @tc.name testUint32ArrayConstructorFive082
     * @tc.desc Verify constructor(buf,4,2) byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const v = new Uint32Array(buf, 4, 2);
      expect(v.byteOffset).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0830
     * @tc.name testUint32ArrayConstructorFive083
     * @tc.desc Verify constructor(buf,4,2) buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const filler = new Uint32Array(buf, 0, 4);
      filler[0] = 1;
      filler[1] = 2;
      filler[2] = 3;
      filler[3] = 4;
      const v = new Uint32Array(buf, 4, 2);
      expect(v[0]).assertEqual(2);
      expect(v[1]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0840
     * @tc.name testUint32ArrayConstructorFive084
     * @tc.desc Verify buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const a = new Uint32Array(buf, 0, 1);
      const b = new Uint32Array(buf, 0, 1);
      const c = new Uint32Array(buf, 0, 1);
      a[0] = 7;
      b[0] = b[0] + 1;
      expect(c[0]).assertEqual(8);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0850
     * @tc.name testUint32ArrayConstructorFive085
     * @tc.desc Verify constructor(buf,0) $_set buf.byteLength ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const v = new Uint32Array(buf, 0, 2);
      v[0] = 123456;
      expect(buf.byteLength).assertEqual(8);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0860
     * @tc.name testUint32ArrayConstructorFive086
     * @tc.desc Verify constructor(buf,4,1) $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const filler = new Uint32Array(buf, 0, 2);
      filler[1] = 42;
      const v = new Uint32Array(buf, 4, 1);
      expect(v[0]).assertEqual(42);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FIVE_0870
     * @tc.name testUint32ArrayConstructorFive087
     * @tc.desc Verify constructor(buf,0) constructor(buf,0,2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFive087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const a = new Uint32Array(buf, 0);
      const b = new Uint32Array(buf, 0, 2);
      a[0] = 333;
      expect(b[0]).assertEqual(333);
    });

  });
}
