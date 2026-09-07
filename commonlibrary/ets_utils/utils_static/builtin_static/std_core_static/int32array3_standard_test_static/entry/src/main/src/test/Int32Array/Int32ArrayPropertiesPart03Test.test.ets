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

export default function int32ArrayPropertiesPart03Test(): void {
  describe('Int32ArrayPropertiesPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_0100
     * @tc.name int32ArrayPropertiesPart03Test001
     * @tc.desc Verify byteOffset=1 4 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        new Int32Array(buf, 1, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_0200
     * @tc.name int32ArrayPropertiesPart03Test002
     * @tc.desc Verify byteOffset=2 4 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        new Int32Array(buf, 2, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_0300
     * @tc.name int32ArrayPropertiesPart03Test003
     * @tc.desc Verify byteOffset=3 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        new Int32Array(buf, 3, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_0400
     * @tc.name int32ArrayPropertiesPart03Test004
     * @tc.desc Verify byteOffset=-4 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        new Int32Array(buf, -4, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_0500
     * @tc.name int32ArrayPropertiesPart03Test005
     * @tc.desc Verify byteOffset=-1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        new Int32Array(buf, -1, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_0600
     * @tc.name int32ArrayPropertiesPart03Test006
     * @tc.desc Verify length=-1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        new Int32Array(buf, 0, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_0700
     * @tc.name int32ArrayPropertiesPart03Test007
     * @tc.desc Verify length buffer byteOffset+4*length > buf.byteLength RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        new Int32Array(buf, 0, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_0800
     * @tc.name int32ArrayPropertiesPart03Test008
     * @tc.desc Verify byteOffset=4 length=2 8 buffer RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        new Int32Array(buf, 4, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_0900
     * @tc.name int32ArrayPropertiesPart03Test009
     * @tc.desc Verify 0 ArrayBuffer byteOffset=0 length=1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf: ArrayBuffer = new ArrayBuffer(0);
        new Int32Array(buf, 0, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_1000
     * @tc.name int32ArrayPropertiesPart03Test010
     * @tc.desc Verify byteOffset buffer.byteLength offset length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 16, 0);
      expect(a.length).assertEqual(0);
      expect(a.byteOffset).assertEqual(16);
      expect(a.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_1100
     * @tc.name int32ArrayPropertiesPart03Test011
     * @tc.desc Verify byteOffset buffer.byteLength offset length>0 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        new Int32Array(buf, 20, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_1200
     * @tc.name int32ArrayPropertiesPart03Test012
     * @tc.desc Verify constructing an Int32Array from a misaligned 5-byte buffer throws RangeError; Also verify verify constructing an Int32Array from 3 remaining bytes throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      try {
        new Int32Array(buf, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }

      {
      let buf: ArrayBuffer = new ArrayBuffer(7);
      try {
        new Int32Array(buf, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_1300
     * @tc.name int32ArrayPropertiesPart03Test013
     * @tc.desc Verify name==='Int32Array'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array();
      expect(a.name).assertEqual('Int32Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_1400
     * @tc.name int32ArrayPropertiesPart03Test014
     * @tc.desc Verify new Int32Array([]) length===0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: number[] = [];
      let a: Int32Array = new Int32Array(empty);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_1500
     * @tc.name int32ArrayPropertiesPart03Test015
     * @tc.desc Verify new Int32Array(buf, 0, 0) byteLength===0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 0);
      expect(a.length).assertEqual(0);
      expect(a.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_1600
     * @tc.name int32ArrayPropertiesPart03Test016
     * @tc.desc Verify at(0) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array();
      let v: Number | undefined = a.at(0);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_1700
     * @tc.name int32ArrayPropertiesPart03Test017
     * @tc.desc Verify at(-1) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array();
      let v: Number | undefined = a.at(-1);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_1800
     * @tc.name int32ArrayPropertiesPart03Test018
     * @tc.desc Verify $_get(0) on an empty array throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array();
      try {
        a.$_get(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_1900
     * @tc.name int32ArrayPropertiesPart03Test019
     * @tc.desc Verify set(emptySrc, 0) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array();
      let src: Int32Array = new Int32Array();
      a.set(src, 0);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_2000
     * @tc.name int32ArrayPropertiesPart03Test020
     * @tc.desc Verify new Int32Array(1) byteOffset===0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      expect(a.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_2100
     * @tc.name int32ArrayPropertiesPart03Test021
     * @tc.desc Verify at(0) at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([42]);
      expect(a.at(0)).assertEqual(42);
      expect(a.at(-1)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_2200
     * @tc.name int32ArrayPropertiesPart03Test022
     * @tc.desc Verify at(1) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([42]);
      let v: Number | undefined = a.at(1);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_2300
     * @tc.name int32ArrayPropertiesPart03Test023
     * @tc.desc Verify at(-2) undefined -length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([42]);
      let v: Number | undefined = a.at(-2);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_2400
     * @tc.name int32ArrayPropertiesPart03Test024
     * @tc.desc Verify $_get(1) out of range throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([42]);
      try {
        a.$_get(1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_2500
     * @tc.name int32ArrayPropertiesPart03Test025
     * @tc.desc Verify $_set(-1, 99) negative index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([42]);
      try {
        a.$_set(-1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_2600
     * @tc.name int32ArrayPropertiesPart03Test026
     * @tc.desc Verify fill(0) 0 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      a.fill(0);
      expect(a.length).assertEqual(4);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_2700
     * @tc.name int32ArrayPropertiesPart03Test027
     * @tc.desc Verify fill(Infinity 0) ToInt32 0 byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.fill(Number.POSITIVE_INFINITY);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_2800
     * @tc.name int32ArrayPropertiesPart03Test028
     * @tc.desc Verify fill(-Infinity 0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.fill(-Number.POSITIVE_INFINITY);
      expect(a.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_2900
     * @tc.name int32ArrayPropertiesPart03Test029
     * @tc.desc Verify NaN from([NaN,NaN,NaN]) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [Number.NaN, Number.NaN, Number.NaN];
      let a: Int32Array = Int32Array.from(src);
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_3000
     * @tc.name int32ArrayPropertiesPart03Test030
     * @tc.desc Verify -1 length/byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-1, -1, -1, -1]);
      expect(a.length).assertEqual(4);
      expect(a.byteLength).assertEqual(16);
      expect(a.$_get(0)).assertEqual(-1);
      expect(a.$_get(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_3100
     * @tc.name int32ArrayPropertiesPart03Test031
     * @tc.desc Verify INT_MAX $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([2147483647, 2147483647]);
      expect(a.length).assertEqual(2);
      expect(a.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_3200
     * @tc.name int32ArrayPropertiesPart03Test032
     * @tc.desc Verify 2147483649 ToInt32 -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.$_set(0, 2147483649);
      a.$_set(1, 2147483649);
      a.$_set(2, 2147483649);
      expect(a.$_get(0)).assertEqual(-2147483647);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_3300
     * @tc.name int32ArrayPropertiesPart03Test033
     * @tc.desc Verify fill(INT_MAX) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = new Int32Array(buf);
      a.fill(2147483647);
      expect(b.$_get(0)).assertEqual(2147483647);
      expect(b.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_3400
     * @tc.name int32ArrayPropertiesPart03Test034
     * @tc.desc Verify $_get(length) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      try {
        a.$_get(3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_3500
     * @tc.name int32ArrayPropertiesPart03Test035
     * @tc.desc Verify $_get(length+1) out of range throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      try {
        a.$_get(4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_3600
     * @tc.name int32ArrayPropertiesPart03Test036
     * @tc.desc Verify $_get(1000000) out of range throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      try {
        a.$_get(1000000);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_3700
     * @tc.name int32ArrayPropertiesPart03Test037
     * @tc.desc Verify $_get(-1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      try {
        a.$_get(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_3800
     * @tc.name int32ArrayPropertiesPart03Test038
     * @tc.desc Verify at(length) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let v: Number | undefined = a.at(3);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_3900
     * @tc.name int32ArrayPropertiesPart03Test039
     * @tc.desc Verify at(length+1) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let v: Number | undefined = a.at(4);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_4000
     * @tc.name int32ArrayPropertiesPart03Test040
     * @tc.desc Verify at(-length-1) = -4 length=3 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let v: Number | undefined = a.at(-4);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_4100
     * @tc.name int32ArrayPropertiesPart03Test041
     * @tc.desc Verify at( 999999) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let v: Number | undefined = a.at(999999);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_4200
     * @tc.name int32ArrayPropertiesPart03Test042
     * @tc.desc Verify at(-999999) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let v: Number | undefined = a.at(-999999);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_4300
     * @tc.name int32ArrayPropertiesPart03Test043
     * @tc.desc Verify at(-length) = -3 length=3 index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let v: Number | undefined = a.at(-3);
      expect(v).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_4400
     * @tc.name int32ArrayPropertiesPart03Test044
     * @tc.desc Verify $_set(length, v) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      try {
        a.$_set(3, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_4500
     * @tc.name int32ArrayPropertiesPart03Test045
     * @tc.desc Verify $_set(length+1, v) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      try {
        a.$_set(4, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_4600
     * @tc.name int32ArrayPropertiesPart03Test046
     * @tc.desc Verify $_set(100000, v) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      try {
        a.$_set(100000, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_4700
     * @tc.name int32ArrayPropertiesPart03Test047
     * @tc.desc Verify $_set(-1, 99) negative index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      try {
        a.$_set(-1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_4800
     * @tc.name int32ArrayPropertiesPart03Test048
     * @tc.desc Verify $_set(-length-1, v) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      try {
        a.$_set(-4, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_4900
     * @tc.name int32ArrayPropertiesPart03Test049
     * @tc.desc Verify set(src, length) src offset+src.length>length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let a: Int32Array = new Int32Array(3);
        let src: Int32Array = new Int32Array([1, 2]);
        a.set(src, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_5000
     * @tc.name int32ArrayPropertiesPart03Test050
     * @tc.desc Verify set(src, offset=-1) offset RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let a: Int32Array = new Int32Array(3);
        let src: Int32Array = new Int32Array([1]);
        a.set(src, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_5100
     * @tc.name int32ArrayPropertiesPart03Test051
     * @tc.desc Verify set(emptySrc, length) offset==length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let src: Int32Array = new Int32Array();
      a.set(src, 3);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_5200
     * @tc.name int32ArrayPropertiesPart03Test052
     * @tc.desc Verify set(src, 1) src 3 length=4 offset+src.length=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let src: Int32Array = new Int32Array([7, 8, 9]);
      a.set(src, 1);
      expect(a.$_get(1)).assertEqual(7);
      expect(a.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_5300
     * @tc.name int32ArrayPropertiesPart03Test053
     * @tc.desc Verify set(src, 1) src 4 length=4 offset+src.length=5>4 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let a: Int32Array = new Int32Array(4);
        let src: Int32Array = new Int32Array([1, 2, 3, 4]);
        a.set(src, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_5400
     * @tc.name int32ArrayPropertiesPart03Test054
     * @tc.desc Verify set(self-subarray, offset) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf);
      a.$_set(0, 1);
      a.$_set(1, 2);
      a.$_set(2, 3);
      a.$_set(3, 4);
      let sub: Int32Array = a.subarray(0, 2);
      a.set(sub, 2);
      expect(a.buffer).assertEqual(buf);
      expect(a.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_5500
     * @tc.name int32ArrayPropertiesPart03Test055
     * @tc.desc Verify with(-1, v) length=0 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let a: Int32Array = new Int32Array();
        a.with(-1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_5600
     * @tc.name int32ArrayPropertiesPart03Test056
     * @tc.desc Verify with(length, v) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let a: Int32Array = new Int32Array([1, 2, 3]);
        a.with(3, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_5700
     * @tc.name int32ArrayPropertiesPart03Test057
     * @tc.desc Verify with(-length-1, v) RangeError length=3, index=-4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let a: Int32Array = new Int32Array([1, 2, 3]);
        a.with(-4, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_5800
     * @tc.name int32ArrayPropertiesPart03Test058
     * @tc.desc Verify with index buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = a.with(1, 99);
      expect(a.$_get(1)).assertEqual(2);
      expect(r.$_get(1)).assertEqual(99);
      expect(a.length).assertEqual(3);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_5900
     * @tc.name int32ArrayPropertiesPart03Test059
     * @tc.desc Verify with index buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = a.with(0, 99);
      let _d: boolean = r.buffer !== a.buffer;
      expect(_d).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_6000
     * @tc.name int32ArrayPropertiesPart03Test060
     * @tc.desc Verify subarray(0) end buffer byteOffset byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf);
      let s: Int32Array = a.subarray(0);
      expect(s.buffer).assertEqual(a.buffer);
      expect(s.byteOffset).assertEqual(a.byteOffset);
      expect(s.byteLength).assertEqual(a.byteLength);
      expect(s.length).assertEqual(a.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_6100
     * @tc.name int32ArrayPropertiesPart03Test061
     * @tc.desc Verify subarray(begin, end) begin>=end buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf);
      let s: Int32Array = a.subarray(2, 2);
      expect(s.length).assertEqual(0);
      expect(s.byteLength).assertEqual(0);
      expect(s.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_6200
     * @tc.name int32ArrayPropertiesPart03Test062
     * @tc.desc Verify subarray(3,2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf);
      let s: Int32Array = a.subarray(3, 2);
      expect(s.length).assertEqual(0);
      expect(s.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_6300
     * @tc.name int32ArrayPropertiesPart03Test063
     * @tc.desc Verify subarray(-1) begin length-1 length=1 byteOffset=12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf);
      let s: Int32Array = a.subarray(-1);
      expect(s.length).assertEqual(1);
      expect(s.byteOffset).assertEqual(12);
      expect(s.byteLength).assertEqual(4);
      expect(s.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_6400
     * @tc.name int32ArrayPropertiesPart03Test064
     * @tc.desc Verify subarray(-length) -4 length=4 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf);
      let s: Int32Array = a.subarray(-4);
      expect(s.length).assertEqual(4);
      expect(s.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_6500
     * @tc.name int32ArrayPropertiesPart03Test065
     * @tc.desc Verify subarray(begin ) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf);
      let s: Int32Array = a.subarray(999);
      expect(s.length).assertEqual(0);
      expect(s.byteLength).assertEqual(0);
      expect(s.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_6600
     * @tc.name int32ArrayPropertiesPart03Test066
     * @tc.desc Verify subarray(end ) end length clamp length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf);
      let s: Int32Array = a.subarray(1, 999);
      expect(s.length).assertEqual(3);
      expect(s.byteOffset).assertEqual(4);
      expect(s.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_6700
     * @tc.name int32ArrayPropertiesPart03Test067
     * @tc.desc Verify subarray byteOffset buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let a: Int32Array = new Int32Array(buf, 8, 4);
      let s: Int32Array = a.subarray(1, 3);
      expect(s.buffer).assertEqual(buf);
      expect(s.byteOffset).assertEqual(12);
      expect(s.length).assertEqual(2);
      expect(s.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_6800
     * @tc.name int32ArrayPropertiesPart03Test068
     * @tc.desc Verify constructor(buf, off, len) buffer=== buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let a: Int32Array = new Int32Array(buf, 8, 3);
      expect(a.buffer).assertEqual(buf);
      expect(a.byteOffset).assertEqual(8);
      expect(a.length).assertEqual(3);
      expect(a.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_6900
     * @tc.name int32ArrayPropertiesPart03Test069
     * @tc.desc Verify constructor(buf, off) length length = floor((buf.byteLength-off)/4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let a: Int32Array = new Int32Array(buf, 8);
      expect(a.length).assertEqual(3);
      expect(a.byteLength).assertEqual(12);
      expect(a.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_7000
     * @tc.name int32ArrayPropertiesPart03Test070
     * @tc.desc Verify a b buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(buf, 0, 2);
      let b: Int32Array = new Int32Array(buf, 0, 2);
      a.$_set(0, 123);
      expect(b.$_get(0)).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_7100
     * @tc.name int32ArrayPropertiesPart03Test071
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 4);
      let b: Int32Array = new Int32Array(buf, 8, 2);
      b.$_set(0, 77);
      expect(a.$_get(2)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_7200
     * @tc.name int32ArrayPropertiesPart03Test072
     * @tc.desc Verify slice buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4]);
      let s: Int32Array = a.slice(0);
      let _d: boolean = s.buffer !== a.buffer;
      expect(_d).assertTrue();
      s.$_set(0, 99);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_7300
     * @tc.name int32ArrayPropertiesPart03Test073
     * @tc.desc Verify slice length byteLength===length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4]);
      let s: Int32Array = a.slice(1, 3);
      expect(s.length).assertEqual(2);
      expect(s.byteLength).assertEqual(8);
      expect(s.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_7400
     * @tc.name int32ArrayPropertiesPart03Test074
     * @tc.desc Verify of() name==='Int32Array'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      expect(a.name).assertEqual('Int32Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_7500
     * @tc.name int32ArrayPropertiesPart03Test075
     * @tc.desc Verify from(arrayLike) name==='Int32Array'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1, 2, 3];
      let a: Int32Array = Int32Array.from(src);
      expect(a.name).assertEqual('Int32Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_7600
     * @tc.name int32ArrayPropertiesPart03Test076
     * @tc.desc Verify subarray name==='Int32Array'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let s: Int32Array = a.subarray(1, 3);
      expect(s.name).assertEqual('Int32Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_7700
     * @tc.name int32ArrayPropertiesPart03Test077
     * @tc.desc Verify slice name==='Int32Array'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let s: Int32Array = a.slice(0);
      expect(s.name).assertEqual('Int32Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_7800
     * @tc.name int32ArrayPropertiesPart03Test078
     * @tc.desc Verify with name==='Int32Array'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2]);
      let r: Int32Array = a.with(0, 99);
      expect(r.name).assertEqual('Int32Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_7900
     * @tc.name int32ArrayPropertiesPart03Test079
     * @tc.desc Verify map name==='Int32Array'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v * 2);
      expect(r.name).assertEqual('Int32Array');
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_8000
     * @tc.name int32ArrayPropertiesPart03Test080
     * @tc.desc Verify filter name==='Int32Array'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = a.filter((v: number, _i: int, _arr: Int32Array): boolean => v > 1);
      expect(r.name).assertEqual('Int32Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_8100
     * @tc.name int32ArrayPropertiesPart03Test081
     * @tc.desc Verify reverse length name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = a.reverse();
      expect(r).assertEqual(a);
      expect(r.length).assertEqual(3);
      expect(r.name).assertEqual('Int32Array');
      expect(r.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_8200
     * @tc.name int32ArrayPropertiesPart03Test082
     * @tc.desc Verify fill this length buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf);
      let r: Int32Array = a.fill(7);
      expect(r).assertEqual(a);
      expect(r.buffer).assertEqual(buf);
      expect(r.length).assertEqual(4);
      expect(r.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_8300
     * @tc.name int32ArrayPropertiesPart03Test083
     * @tc.desc Verify sort this name/length/byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([3, 1, 2]);
      let r: Int32Array = a.sort();
      expect(r).assertEqual(a);
      expect(r.length).assertEqual(3);
      expect(r.name).assertEqual('Int32Array');
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_8400
     * @tc.name int32ArrayPropertiesPart03Test084
     * @tc.desc Verify $_set INT_MAX+1 = 2147483648 INT_MIN length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 2147483648);
      expect(a.$_get(0)).assertEqual(-2147483648);
      expect(a.length).assertEqual(1);
      expect(a.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_8500
     * @tc.name int32ArrayPropertiesPart03Test085
     * @tc.desc Verify $_set 2147483649 -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 2147483649);
      expect(a.$_get(0)).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_8600
     * @tc.name int32ArrayPropertiesPart03Test086
     * @tc.desc Verify $_set -2147483649 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, -2147483649);
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_8700
     * @tc.name int32ArrayPropertiesPart03Test087
     * @tc.desc Verify $_set 4294967296 (2^32) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 4294967296);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_8800
     * @tc.name int32ArrayPropertiesPart03Test088
     * @tc.desc Verify $_set 4294967297 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 4294967297);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_8900
     * @tc.name int32ArrayPropertiesPart03Test089
     * @tc.desc Verify $_set 0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 0.5);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_9000
     * @tc.name int32ArrayPropertiesPart03Test090
     * @tc.desc Verify $_set -0.9 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, -0.9);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART03_9100
     * @tc.name int32ArrayPropertiesPart03Test091
     * @tc.desc Verify $_set NaN 0 buffer 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart03Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = new Int32Array(buf);
      a.$_set(0, Number.NaN);
      expect(b.$_get(0)).assertEqual(0);
      expect(b.length).assertEqual(1);
    });

  });
}
