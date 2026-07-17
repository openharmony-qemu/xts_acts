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
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int8ArrayConstructorPart10TestTest(): void {
  describe('Int8ArrayConstructorPart10TestTest', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;
    const INT8_MIN: byte = -128;


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_0100
     * @tc.name int8ArrayConstructorPart10Test001
     * @tc.desc Verify arity=2 number byteOffset=0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_0200
     * @tc.name int8ArrayConstructorPart10Test002
     * @tc.desc Verify arity=2 number byteOffset>0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 3;
      let view = new Int8Array(buf, off);
      expect(view.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_0300
     * @tc.name int8ArrayConstructorPart10Test003
     * @tc.desc Verify buf ArrayBuffer(byteLength=0) off=0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(0);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_0400
     * @tc.name int8ArrayConstructorPart10Test004
     * @tc.desc Verify buf 1 ( ) off=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_0500
     * @tc.name int8ArrayConstructorPart10Test005
     * @tc.desc Verify buf 1000 off=0 =1000( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1000);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_0600
     * @tc.name int8ArrayConstructorPart10Test006
     * @tc.desc Verify byteOffset=byteLength-1( ) =1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 7;
      let view = new Int8Array(buf, off);
      expect(view.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_0700
     * @tc.name int8ArrayConstructorPart10Test007
     * @tc.desc Verify byteOffset=byteLength( ) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 8;
      let view = new Int8Array(buf, off);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_0800
     * @tc.name int8ArrayConstructorPart10Test008
     * @tc.desc Verify byteOffset=byteLength+1( 1 ) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 9;
      try {
        new Int8Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_0900
     * @tc.name int8ArrayConstructorPart10Test009
     * @tc.desc Verify byteOffset=byteLength*2( ) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 16;
      try {
        new Int8Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_1000
     * @tc.name int8ArrayConstructorPart10Test010
     * @tc.desc Verify byteOffset=-1( ) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = -1;
      try {
        new Int8Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_1100
     * @tc.name int8ArrayConstructorPart10Test011
     * @tc.desc Verify byteOffset=-byteLength( ) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = -8;
      try {
        new Int8Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_1200
     * @tc.name int8ArrayConstructorPart10Test012
     * @tc.desc Verify byteOffset=-1.5( ) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = -1.5;
      try {
        new Int8Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_1300
     * @tc.name int8ArrayConstructorPart10Test013
     * @tc.desc Verify byteOffset=-0.0( ) 0 byteOffset ===0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = -0.0;
      let view = new Int8Array(buf, off);
      expect(view.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_1400
     * @tc.name int8ArrayConstructorPart10Test014
     * @tc.desc Verify byteOffset=0.5( 1 ) number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 0.5;
      try {
        let v = new Int8Array(buf, off);
        expect(v).not().assertEqual(null);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_1500
     * @tc.name int8ArrayConstructorPart10Test015
     * @tc.desc Verify byteOffset=1.5( 1 ) number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 1.5;
      try {
        let v = new Int8Array(buf, off);
        expect(v).not().assertEqual(null);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_1600
     * @tc.name int8ArrayConstructorPart10Test016
     * @tc.desc Verify byteOffset=Number.NaN number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = Number.NaN;
      try {
        let v = new Int8Array(buf, off);
        expect(v).not().assertEqual(null);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_1700
     * @tc.name int8ArrayConstructorPart10Test017
     * @tc.desc Verify byteOffset=Number.POSITIVE_INFINITY( ) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = Number.POSITIVE_INFINITY;
      try {
        new Int8Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_1800
     * @tc.name int8ArrayConstructorPart10Test018
     * @tc.desc Verify byteOffset=Number.NEGATIVE_INFINITY( ) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = Number.NEGATIVE_INFINITY;
      try {
        new Int8Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_1900
     * @tc.name int8ArrayConstructorPart10Test019
     * @tc.desc Verify byteOffset=Number.MAX_SAFE_INTEGER( ) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 1000000;
      try {
        new Int8Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_2000
     * @tc.name int8ArrayConstructorPart10Test020
     * @tc.desc Verify instanceof Int8Array( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.length).assertEqual(buf.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_2100
     * @tc.name int8ArrayConstructorPart10Test021
     * @tc.desc Verify byteLength === ( 1 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 2;
      let view = new Int8Array(buf, off);
      expect(view.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_2200
     * @tc.name int8ArrayConstructorPart10Test022
     * @tc.desc Verify byteOffset === number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 5;
      let view = new Int8Array(buf, off);
      expect(view.byteOffset).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_2300
     * @tc.name int8ArrayConstructorPart10Test023
     * @tc.desc Verify buffer === buf( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_2400
     * @tc.name int8ArrayConstructorPart10Test024
     * @tc.desc Verify BYTES_PER_ELEMENT === 1(int8 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect((new Int8Array(1)).BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_2500
     * @tc.name int8ArrayConstructorPart10Test025
     * @tc.desc Verify length === buf.byteLength - byteOffset( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 7;
      let view = new Int8Array(buf, off);
      expect(view.length).assertEqual(buf.byteLength - off);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_2600
     * @tc.name int8ArrayConstructorPart10Test026
     * @tc.desc Verify buf buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let dv = new DataView(buf);
      dv.setInt8(0, 42);
      dv.setInt8(1, -128);
      dv.setInt8(2, INT8_MAX);
      dv.setInt8(3, 0);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_2700
     * @tc.name int8ArrayConstructorPart10Test027
     * @tc.desc Verify buf int8 127 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1);
      let dv = new DataView(buf);
      dv.setInt8(0, INT8_MAX);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_2800
     * @tc.name int8ArrayConstructorPart10Test028
     * @tc.desc Verify buf int8 -128 -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1);
      let dv = new DataView(buf);
      dv.setInt8(0, -128);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_2900
     * @tc.name int8ArrayConstructorPart10Test029
     * @tc.desc Verify buf 0 0( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1);
      let dv = new DataView(buf);
      dv.setInt8(0, 0);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_3000
     * @tc.name int8ArrayConstructorPart10Test030
     * @tc.desc Verify buf 0xFF -1( 1 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1);
      let dv = new DataView(buf);
      dv.setInt8(0, 0xFF);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_3100
     * @tc.name int8ArrayConstructorPart10Test031
     * @tc.desc Verify byteOffset=0 byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_3200
     * @tc.name int8ArrayConstructorPart10Test032
     * @tc.desc Verify byteOffset=byteLength( ) byteOffset byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 8;
      let view = new Int8Array(buf, off);
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_3300
     * @tc.name int8ArrayConstructorPart10Test033
     * @tc.desc Verify buf [10,20,30,40] byteOffset=2 buf[2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let dv = new DataView(buf);
      dv.setInt8(0, 10);
      dv.setInt8(1, 20);
      dv.setInt8(2, 30);
      dv.setInt8(3, 40);
      let off: number = 2;
      let view = new Int8Array(buf, off);
      expect(view.$_get(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_3400
     * @tc.name int8ArrayConstructorPart10Test034
     * @tc.desc Verify DataView buf $_get ( buf )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let dv = new DataView(buf);
      dv.setInt8(2, 66);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.$_get(2)).assertEqual(66);
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_3500
       * @tc.name int8ArrayConstructorPart10Test035
       * @tc.desc Verify $_set (index>=length) no-op buf
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayConstructorPart10Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(4);
        let dv = new DataView(buf);
        dv.setInt8(0, 22);
        let off: number = 0;
        let view = new Int8Array(buf, off);
        try {
          view.$_set(10, 99);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_3600
     * @tc.name int8ArrayConstructorPart10Test036
     * @tc.desc Verify fill buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      view.fill(7, 1, 3);
      let dv = new DataView(buf);
      expect(dv.getInt8(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_3700
     * @tc.name int8ArrayConstructorPart10Test037
     * @tc.desc Verify reverse buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let dv = new DataView(buf);
      dv.setInt8(0, 1);
      dv.setInt8(1, 2);
      dv.setInt8(2, 3);
      dv.setInt8(3, 4);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      view.reverse();
      expect(dv.getInt8(0)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_3800
     * @tc.name int8ArrayConstructorPart10Test038
     * @tc.desc Verify sort buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let dv = new DataView(buf);
      dv.setInt8(0, 40);
      dv.setInt8(1, 10);
      dv.setInt8(2, 30);
      dv.setInt8(3, 20);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      view.sort();
      expect(dv.getInt8(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_3900
     * @tc.name int8ArrayConstructorPart10Test039
     * @tc.desc Verify copyWithin buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let dv = new DataView(buf);
      dv.setInt8(0, 1);
      dv.setInt8(1, 2);
      dv.setInt8(2, 3);
      dv.setInt8(3, 4);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      view.copyWithin(0, 2, 4);
      expect(dv.getInt8(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_4000
     * @tc.name int8ArrayConstructorPart10Test040
     * @tc.desc Verify at(-1) buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let dv = new DataView(buf);
      dv.setInt8(3, 123);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.at(-1)).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_4100
     * @tc.name int8ArrayConstructorPart10Test041
     * @tc.desc Verify with() buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let dv = new DataView(buf);
      dv.setInt8(0, 5);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      let newArr: Int8Array = view.with(0, 99);
      expect(dv.getInt8(0)).assertEqual(5);
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_4200
       * @tc.name int8ArrayConstructorPart10Test042
       * @tc.desc Verify $_set (index<-length) no-op buf
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayConstructorPart10Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(4);
        let dv = new DataView(buf);
        dv.setInt8(0, 33);
        let off: number = 0;
        let view = new Int8Array(buf, off);
        try {
          view.$_set(-10, 99);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_4300
     * @tc.name int8ArrayConstructorPart10Test043
     * @tc.desc Verify buf off=0 byteLength===0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(0);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_4400
     * @tc.name int8ArrayConstructorPart10Test044
     * @tc.desc Verify buf off=0 forEach ( 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(0);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      let count: int = 0;
      view.forEach((v: number) => { count = count + 1; });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_4500
     * @tc.name int8ArrayConstructorPart10Test045
     * @tc.desc Verify buf off=0 at(0) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(0);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.at(0)).assertUndefined();
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_4600
       * @tc.name int8ArrayConstructorPart10Test046
       * @tc.desc Verify buf off=0 $_set(0,1)
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayConstructorPart10Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(0);
        let off: number = 0;
        let view = new Int8Array(buf, off);
        try {
          view.$_set(0, 1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_4700
     * @tc.name int8ArrayConstructorPart10Test047
     * @tc.desc Verify buf off=1( buffer) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(0);
      let off: number = 1;
      try {
        new Int8Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_4800
     * @tc.name int8ArrayConstructorPart10Test048
     * @tc.desc Verify off=byteLength forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 8;
      let view = new Int8Array(buf, off);
      let count: int = 0;
      view.forEach((v: number) => { count = count + 1; });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_4900
     * @tc.name int8ArrayConstructorPart10Test049
     * @tc.desc Verify 1000 buf off=1001( ) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1000);
      let off: number = 1001;
      try {
        new Int8Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_5000
     * @tc.name int8ArrayConstructorPart10Test050
     * @tc.desc Verify forEach buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(3);
      let dv = new DataView(buf);
      dv.setInt8(0, 11);
      dv.setInt8(1, 22);
      dv.setInt8(2, 33);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      let first: number = 0;
      view.forEach((v: number) => {
        if (first === 0) { first = v; }
      });
      expect(first).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_5100
     * @tc.name int8ArrayConstructorPart10Test051
     * @tc.desc Verify forEach 0..length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      let lastIdx: number = -1;
      let cnt: number = 0;
      view.forEach((v: number): void => {
        lastIdx = cnt;
        cnt = cnt + 1;
      });
      expect(lastIdx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_5200
     * @tc.name int8ArrayConstructorPart10Test052
     * @tc.desc Verify toString() buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(3);
      let dv = new DataView(buf);
      dv.setInt8(0, 1);
      dv.setInt8(1, 2);
      dv.setInt8(2, 3);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.toString()).assertEqual('1,2,3');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_5300
     * @tc.name int8ArrayConstructorPart10Test053
     * @tc.desc Verify fill(v, start, end) start>=end buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let dv = new DataView(buf);
      dv.setInt8(1, 50);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      view.fill(99, 3, 1);
      expect(dv.getInt8(1)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_5400
     * @tc.name int8ArrayConstructorPart10Test054
     * @tc.desc Verify set(src, offset) offset+src.length>length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      let src = new Int8Array(3);
      src.$_set(0, 1);
      src.$_set(1, 2);
      src.$_set(2, 3);
      try {
        view.set(src, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_5500
     * @tc.name int8ArrayConstructorPart10Test055
     * @tc.desc Verify sort ( ) buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let dv = new DataView(buf);
      dv.setInt8(0, 40);
      dv.setInt8(1, 10);
      dv.setInt8(2, 30);
      dv.setInt8(3, 20);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      view.sort();
      expect(dv.getInt8(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_5600
     * @tc.name int8ArrayConstructorPart10Test056
     * @tc.desc Verify at(0) buf[byteOffset]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let dv = new DataView(buf);
      dv.setInt8(3, 77);
      let off: number = 3;
      let view = new Int8Array(buf, off);
      expect(view.at(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_5700
     * @tc.name int8ArrayConstructorPart10Test057
     * @tc.desc Verify at(length-1) buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let dv = new DataView(buf);
      dv.setInt8(7, 88);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.at(7)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_5800
     * @tc.name int8ArrayConstructorPart10Test058
     * @tc.desc Verify fill buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      view.fill(7);
      let dv = new DataView(buf);
      expect(dv.getInt8(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_5900
     * @tc.name int8ArrayConstructorPart10Test059
     * @tc.desc Verify copyWithin buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let dv = new DataView(buf);
      dv.setInt8(0, 1);
      dv.setInt8(1, 2);
      dv.setInt8(2, 3);
      dv.setInt8(3, 4);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      view.copyWithin(1, 0, 3);
      expect(dv.getInt8(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_6000
     * @tc.name int8ArrayConstructorPart10Test060
     * @tc.desc Verify buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let dv = new DataView(buf);
      dv.setInt8(0, 5);
      dv.setInt8(1, 5);
      dv.setInt8(2, 5);
      dv.setInt8(3, 5);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.at(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_6100
     * @tc.name int8ArrayConstructorPart10Test061
     * @tc.desc Verify (off=byteLength) sort() buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let dv = new DataView(buf);
      dv.setInt8(0, 9);
      let off: number = 4;
      let view = new Int8Array(buf, off);
      view.sort();
      expect(dv.getInt8(0)).assertEqual(9);
    });

      /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_6200
       * @tc.name int8ArrayConstructorPart10Test062
       * @tc.desc Verify $_set(0, Number.MAX_VALUE) max buf[0]=127
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayConstructorPart10Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(2);
        let off: number = 0;
        let view = new Int8Array(buf, off);
        view.$_set(0, 1000000);
        let dv = new DataView(buf);
        expect(dv.getInt8(0)).assertEqual(64);
      });

      /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_6300
       * @tc.name int8ArrayConstructorPart10Test063
       * @tc.desc Verify off=byteLength $_set(0,1) buf, throws RangeError for out-of-bounds index
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayConstructorPart10Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(8);
        let dv = new DataView(buf);
        dv.setInt8(0, 42);
        let off: number = 8;
        let view = new Int8Array(buf, off);
        let threwSet: boolean = false;
        try {
          view.$_set(0, 99);
        } catch (e) {
          threwSet = true;
          expect(e.name).assertEqual('RangeError');
        }
        expect(threwSet).assertTrue();
        expect(dv.getInt8(0)).assertEqual(42);
      });

});
}
