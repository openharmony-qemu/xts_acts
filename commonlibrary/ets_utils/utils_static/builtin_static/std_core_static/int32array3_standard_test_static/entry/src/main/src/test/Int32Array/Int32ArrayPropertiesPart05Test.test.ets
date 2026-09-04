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
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int32ArrayPropertiesPart05Test(): void {
  describe('Int32ArrayPropertiesPart05Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_0100
     * @tc.name int32ArrayPropertiesPart05Test001
     * @tc.desc Verify arity=1 length=0 arity=0 length/byteLength/byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a0: Int32Array = new Int32Array();
      let a1: Int32Array = new Int32Array(0);
      expect(a1.length).assertEqual(a0.length);
      expect(a1.byteLength).assertEqual(a0.byteLength);
      expect(a1.byteOffset).assertEqual(a0.byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_0200
     * @tc.name int32ArrayPropertiesPart05Test002
     * @tc.desc Verify arity=1 length=1 byteOffset===0 buffer buffer.byteLength===4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_0300
     * @tc.name int32ArrayPropertiesPart05Test003
     * @tc.desc Verify arity=1 length=0.5 #10 ToInteger(0.5)=0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0.5);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_0400
     * @tc.name int32ArrayPropertiesPart05Test004
     * @tc.desc Verify arity=1 Number 0.9 ToInteger 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0.9);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_0500
     * @tc.name int32ArrayPropertiesPart05Test005
     * @tc.desc Verify arity=1 NaN ToIndex(NaN)=0 length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(Number.NaN);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_0600
     * @tc.name int32ArrayPropertiesPart05Test006
     * @tc.desc Verify arity=2 (new ArrayBuffer(8), 4) #25 byteOffset=4 byteOffset===4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int32Array = new Int32Array(buf, 4);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_0700
     * @tc.name int32ArrayPropertiesPart05Test007
     * @tc.desc Verify arity=2 (buf, 4) buf 8 length 1 4 / 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int32Array = new Int32Array(buf, 4);
      expect(arr.length).assertEqual(1);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_0800
     * @tc.name int32ArrayPropertiesPart05Test008
     * @tc.desc Verify arity=2 (buf, 4) buffer buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int32Array = new Int32Array(buf, 4);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_0900
     * @tc.name int32ArrayPropertiesPart05Test009
     * @tc.desc Verify arity=2 (buf, -4) #30 byteOffset RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      try {
        new Int32Array(buf, -4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_1000
     * @tc.name int32ArrayPropertiesPart05Test010
     * @tc.desc Verify arity=2 (buf, 1) 4 byteOffset RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      try {
        new Int32Array(buf, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_1100
     * @tc.name int32ArrayPropertiesPart05Test011
     * @tc.desc Verify arity=2 (buf, 8) buffer length 0 byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int32Array = new Int32Array(buf, 8);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_1200
     * @tc.name int32ArrayPropertiesPart05Test012
     * @tc.desc Verify arity=2 byteOffset byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let aFull: Int32Array = new Int32Array(buf);
      let aZero: Int32Array = new Int32Array(buf, 0);
      expect(aFull.byteOffset).assertEqual(aZero.byteOffset);
      expect(aFull.length).assertEqual(aZero.length);
      expect(aFull.byteLength).assertEqual(aZero.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_1300
     * @tc.name int32ArrayPropertiesPart05Test013
     * @tc.desc Verify arity=3 (buf, 0, 0) byteLength===0 byteOffset===0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int32Array = new Int32Array(buf, 0, 0);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_1400
     * @tc.name int32ArrayPropertiesPart05Test014
     * @tc.desc Verify arity=3 (buf, 4, 1) #25 byteOffset=4 #40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int32Array = new Int32Array(buf, 4, 1);
      expect(arr.length).assertEqual(1);
      expect(arr.byteLength).assertEqual(4);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_1500
     * @tc.name int32ArrayPropertiesPart05Test015
     * @tc.desc Verify arity=3 (7 buf, 4, 1) byteOffset=4 + 4 = 8 > 7 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(7);
      try {
        new Int32Array(buf, 4, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_1600
     * @tc.name int32ArrayPropertiesPart05Test016
     * @tc.desc Verify arity=3 length=-1 #5 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      try {
        new Int32Array(buf, 0, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_1700
     * @tc.name int32ArrayPropertiesPart05Test017
     * @tc.desc Verify arity=3 length=0.5 #10 ToInteger 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int32Array = new Int32Array(buf, 0, 0.5);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_1800
     * @tc.name int32ArrayPropertiesPart05Test018
     * @tc.desc Verify arity=3 (buf, 4, 0) byteOffset===4 byteLength===0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int32Array = new Int32Array(buf, 4, 0);
      expect(arr.length).assertEqual(0);
      expect(arr.byteOffset).assertEqual(4);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_1900
     * @tc.name int32ArrayPropertiesPart05Test019
     * @tc.desc Verify arity=3 length buf=8 byteOffset=4 length=1.9 ToInteger 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int32Array = new Int32Array(buf, 4, 1.9);
      expect(arr.length).assertEqual(1);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_2000
     * @tc.name int32ArrayPropertiesPart05Test020
     * @tc.desc Verify length=2147483647 8589934588
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Int32Array(2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_2100
     * @tc.name int32ArrayPropertiesPart05Test021
     * @tc.desc Verify length -2147483649 #15 INT_MIN RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Int32Array(-2147483649);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_2200
     * @tc.name int32ArrayPropertiesPart05Test022
     * @tc.desc Verify length 4294967297 2^32+1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Int32Array(4294967297);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_2300
     * @tc.name int32ArrayPropertiesPart05Test023
     * @tc.desc Verify length Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Int32Array(Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_2400
     * @tc.name int32ArrayPropertiesPart05Test024
     * @tc.desc Verify length -0 +0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(-0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_2500
     * @tc.name int32ArrayPropertiesPart05Test025
     * @tc.desc Verify length 3 byteLength===12 length===3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      expect(arr.length).assertEqual(3);
      expect(arr.byteLength).assertEqual(12);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_2600
     * @tc.name int32ArrayPropertiesPart05Test026
     * @tc.desc Verify byteOffset=8 buf 16 length=2 byteOffset===8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 8, 2);
      expect(arr.byteOffset).assertEqual(8);
      expect(arr.length).assertEqual(2);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_2700
     * @tc.name int32ArrayPropertiesPart05Test027
     * @tc.desc Verify byteOffset=5 4 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      try {
        new Int32Array(buf, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_2800
     * @tc.name int32ArrayPropertiesPart05Test028
     * @tc.desc Verify byteOffset 4.9 ToInteger 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4.9);
      expect(arr.byteOffset).assertEqual(4);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_2900
     * @tc.name int32ArrayPropertiesPart05Test029
     * @tc.desc Verify byteOffset 4.1 ToInteger 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4.1);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_3000
     * @tc.name int32ArrayPropertiesPart05Test030
     * @tc.desc Verify byteOffset=NaN ToIndex(NaN)=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int32Array = new Int32Array(buf, Number.NaN);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_3100
     * @tc.name int32ArrayPropertiesPart05Test031
     * @tc.desc Verify buffer 8 ArrayBuffer arity=1 buffer length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int32Array = new Int32Array(buf);
      expect(arr.length).assertEqual(2);
      expect(arr.byteLength).assertEqual(8);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_3200
     * @tc.name int32ArrayPropertiesPart05Test032
     * @tc.desc Verify buffer 7 ArrayBuffer #45 4 arity=1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(7);
      try {
        new Int32Array(buf);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_3300
     * @tc.name int32ArrayPropertiesPart05Test033
     * @tc.desc Verify buffer 5 ArrayBuffer arity=1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      try {
        new Int32Array(buf);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_3400
     * @tc.name int32ArrayPropertiesPart05Test034
     * @tc.desc Verify buffer 0 ArrayBuffer arity=1 length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let arr: Int32Array = new Int32Array(buf);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_3500
     * @tc.name int32ArrayPropertiesPart05Test035
     * @tc.desc Verify TypedArray arity=1 length length buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(-1, 0, 1);
      let dst: Int32Array = new Int32Array(src);
      expect(dst.length).assertEqual(src.length);
      expect(dst.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_3600
     * @tc.name int32ArrayPropertiesPart05Test036
     * @tc.desc Verify int [-1] #5 arity=1 length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [-1];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.length).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_3700
     * @tc.name int32ArrayPropertiesPart05Test037
     * @tc.desc Verify int [] arity=1 length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_3800
     * @tc.name int32ArrayPropertiesPart05Test038
     * @tc.desc Verify of(-1) #5 length/byteLength/BYTES_PER_ELEMENT/name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1);
      expect(arr.length).assertEqual(1);
      expect(arr.byteLength).assertEqual(4);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
      expect(arr.name).assertEqual('Int32Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_3900
     * @tc.name int32ArrayPropertiesPart05Test039
     * @tc.desc Verify from 0.5 #10 ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [0.5];
      let arr: Int32Array = Int32Array.from(src);
      expect(arr.length).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_4000
     * @tc.name int32ArrayPropertiesPart05Test040
     * @tc.desc Verify from -2147483649 #15 ToInt32 2147483647 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [-2147483649.0];
      let arr: Int32Array = Int32Array.from(src);
      expect(arr.length).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_4100
     * @tc.name int32ArrayPropertiesPart05Test041
     * @tc.desc Verify of(-0) -0 +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-0);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_4200
     * @tc.name int32ArrayPropertiesPart05Test042
     * @tc.desc Verify BYTES_PER_ELEMENT number 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      let bpe: number = arr.BYTES_PER_ELEMENT;
      expect(bpe).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_4300
     * @tc.name int32ArrayPropertiesPart05Test043
     * @tc.desc Verify Int32Array.BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      expect(Int32Array.BYTES_PER_ELEMENT).assertEqual(4);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(Int32Array.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_4400
     * @tc.name int32ArrayPropertiesPart05Test044
     * @tc.desc Verify name string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array();
      let n: string = arr.name;
      expect(n).assertEqual('Int32Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_4500
     * @tc.name int32ArrayPropertiesPart05Test045
     * @tc.desc Verify buffer ArrayBuffer null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      let buf: ArrayBuffer = arr.buffer;
      expect(buf).not().assertNull();
      expect(buf.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_4600
     * @tc.name int32ArrayPropertiesPart05Test046
     * @tc.desc Verify byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 8);
      let off: number = arr.byteOffset;
      expect(off).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_4700
     * @tc.name int32ArrayPropertiesPart05Test047
     * @tc.desc Verify byteLength length * 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(6);
      expect(arr.byteLength).assertEqual(arr.length * 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_4800
     * @tc.name int32ArrayPropertiesPart05Test048
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(6);
      let len: number = arr.length;
      expect(len).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_4900
     * @tc.name int32ArrayPropertiesPart05Test049
     * @tc.desc Verify of(-1,0,1) #5 length=3 byteLength=12 byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, 0, 1);
      expect(arr.length).assertEqual(3);
      expect(arr.byteLength).assertEqual(12);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_5000
     * @tc.name int32ArrayPropertiesPart05Test050
     * @tc.desc Verify from([-1]) #40+#5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [-1];
      let arr: Int32Array = Int32Array.from(src);
      expect(arr.length).assertEqual(1);
      expect(arr.byteLength).assertEqual(4);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_5100
     * @tc.name int32ArrayPropertiesPart05Test051
     * @tc.desc Verify constructor(buf,4,1) #25+#40 subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(buf, 4, 1);
      let base: Int32Array = new Int32Array(buf);
      let b: Int32Array = base.subarray(1, 2);
      expect(a.length).assertEqual(b.length);
      expect(a.byteLength).assertEqual(b.byteLength);
      expect(a.byteOffset).assertEqual(b.byteOffset);
      expect(a.buffer).assertEqual(b.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_5200
     * @tc.name int32ArrayPropertiesPart05Test052
     * @tc.desc Verify new buffer byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a0: Int32Array = new Int32Array(buf, 0, 1);
      let a4: Int32Array = new Int32Array(buf, 4, 1);
      let a8: Int32Array = new Int32Array(buf, 8, 1);
      let a12: Int32Array = new Int32Array(buf, 12, 1);
      expect(a0.byteOffset).assertEqual(0);
      expect(a4.byteOffset).assertEqual(4);
      expect(a8.byteOffset).assertEqual(8);
      expect(a12.byteOffset).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_5300
     * @tc.name int32ArrayPropertiesPart05Test053
     * @tc.desc Verify subarray() length/byteOffset/byteLength/buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      let sub: Int32Array = arr.subarray();
      expect(sub.length).assertEqual(arr.length);
      expect(sub.byteOffset).assertEqual(arr.byteOffset);
      expect(sub.byteLength).assertEqual(arr.byteLength);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_5400
     * @tc.name int32ArrayPropertiesPart05Test054
     * @tc.desc Verify subarray(1) begin=1 4 buf byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 3);
      let sub: Int32Array = arr.subarray(1);
      expect(sub.length).assertEqual(2);
      expect(sub.byteOffset).assertEqual(8);
      expect(sub.byteLength).assertEqual(8);
      expect(sub.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_5500
     * @tc.name int32ArrayPropertiesPart05Test055
     * @tc.desc Verify subarray(-1) length=1 byteOffset= offset+4*(length-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 3);
      let sub: Int32Array = arr.subarray(-1);
      expect(sub.length).assertEqual(1);
      expect(sub.byteOffset).assertEqual(12);
      expect(sub.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_5600
     * @tc.name int32ArrayPropertiesPart05Test056
     * @tc.desc Verify subarray(1,1) byteLength=0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 3);
      let sub: Int32Array = arr.subarray(1, 1);
      expect(sub.length).assertEqual(0);
      expect(sub.byteLength).assertEqual(0);
      expect(sub.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_5700
     * @tc.name int32ArrayPropertiesPart05Test057
     * @tc.desc Verify subarray(length) #20 begin=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int32Array = new Int32Array(buf);
      let sub: Int32Array = arr.subarray(2);
      expect(sub.length).assertEqual(0);
      expect(sub.byteOffset).assertEqual(8);
      expect(sub.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_5800
     * @tc.name int32ArrayPropertiesPart05Test058
     * @tc.desc Verify subarray(2,1) begin>end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      let sub: Int32Array = arr.subarray(2, 1);
      expect(sub.length).assertEqual(0);
      expect(sub.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_5900
     * @tc.name int32ArrayPropertiesPart05Test059
     * @tc.desc Verify length length TypedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      expect(arr.length).assertEqual(2);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_6000
     * @tc.name int32ArrayPropertiesPart05Test060
     * @tc.desc Verify BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_6100
     * @tc.name int32ArrayPropertiesPart05Test061
     * @tc.desc Verify buffer buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int32Array = new Int32Array(buf);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_6200
     * @tc.name int32ArrayPropertiesPart05Test062
     * @tc.desc Verify byteOffset=-4 #30 arity=2 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let created: boolean = false;
      try {
        new Int32Array(buf, -4);
        created = true;
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(created).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_6300
     * @tc.name int32ArrayPropertiesPart05Test063
     * @tc.desc Verify null ArrayBuffer number TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Int32Array(null as Object as ArrayBuffer);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_6400
     * @tc.name int32ArrayPropertiesPart05Test064
     * @tc.desc Verify undefined arity=1 arity=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Int32Array(undefined as Object as number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_6500
     * @tc.name int32ArrayPropertiesPart05Test065
     * @tc.desc Verify constructor(buf,0,2)+(buf,4,1) a[1] b[0] buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(buf, 0, 2);
      let b: Int32Array = new Int32Array(buf, 4, 1);
      a.$_set(1, -1);
      expect(b.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_6600
     * @tc.name int32ArrayPropertiesPart05Test066
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf);
      let child: Int32Array = parent.subarray(2, 3);
      child.$_set(0, -1);
      expect(parent.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_6700
     * @tc.name int32ArrayPropertiesPart05Test067
     * @tc.desc Verify multi subarray views write parent positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf);
      let view0: Int32Array = parent.subarray(0, 1);
      let view1: Int32Array = parent.subarray(1, 2);
      let view2: Int32Array = parent.subarray(2, 3);
      let view3: Int32Array = parent.subarray(3, 4);
      view0.$_set(0, -1);
      view1.$_set(0, 0);
      view2.$_set(0, 1);
      view3.$_set(0, 2147483647);
      expect(parent.$_get(0)).assertEqual(-1);
      expect(parent.$_get(1)).assertEqual(0);
      expect(parent.$_get(2)).assertEqual(1);
      expect(parent.$_get(3)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_6800
     * @tc.name int32ArrayPropertiesPart05Test068
     * @tc.desc Verify slice buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, 0, 1);
      let cp: Int32Array = arr.slice();
      expect(cp.length).assertEqual(arr.length);
      cp.$_set(0, 99);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_6900
     * @tc.name int32ArrayPropertiesPart05Test069
     * @tc.desc Verify BYTES_PER_ELEMENT/name/buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
      expect(arr.name).assertEqual('Int32Array');
      expect(arr.buffer).not().assertNull();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_7000
     * @tc.name int32ArrayPropertiesPart05Test070
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let b: Int32Array = new Int32Array(arr.buffer);
      expect(b.length).assertEqual(0);
      expect(b.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_7100
     * @tc.name int32ArrayPropertiesPart05Test071
     * @tc.desc Verify #40 length/byteLength/BYTES_PER_ELEMENT 1:4:4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      expect(arr.length).assertEqual(1);
      expect(arr.byteLength).assertEqual(4);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
      expect(arr.byteLength).assertEqual(arr.length * arr.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_7200
     * @tc.name int32ArrayPropertiesPart05Test072
     * @tc.desc Verify length*BYTES_PER_ELEMENT===byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(7);
      expect(arr.byteLength).assertEqual(arr.length * arr.BYTES_PER_ELEMENT);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_7300
     * @tc.name int32ArrayPropertiesPart05Test073
     * @tc.desc Verify length 0x4 =4 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0x4);
      expect(arr.length).assertEqual(4);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART05_7400
     * @tc.name int32ArrayPropertiesPart05Test074
     * @tc.desc Verify byteOffset 0x4 #25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart05Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 0x4, 2);
      expect(arr.byteOffset).assertEqual(4);
      expect(arr.length).assertEqual(2);
    });
  });
}
