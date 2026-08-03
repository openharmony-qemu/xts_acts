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
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';
export default function int32ArrayConstructorPart09TestMindmapTestTest(): void {
  describe('Int32ArrayConstructorPart09TestMindmapTestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_0100
     * @tc.name int32ArrayConstructorPart09TestMindmapTest001
     * @tc.desc Verify 1 (ArrayBuffer), byteOffset (byteOffset:int ), ( , :
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new Int32Array(buf, 0);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_0200
     * @tc.name int32ArrayConstructorPart09TestMindmapTest002
     * @tc.desc Verify 2 (buf, 0),
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let arr = new Int32Array(buf, 0);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_0300
     * @tc.name int32ArrayConstructorPart09TestMindmapTest003
     * @tc.desc Verify 2 2 int 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let arr = new Int32Array(buf, 4);
      expect(arr.byteOffset).assertEqual(4);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_0400
     * @tc.name int32ArrayConstructorPart09TestMindmapTest004
     * @tc.desc Verify result properties for a zero-length buffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(0);
      let arr = new Int32Array(buf, 0);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_0500
     * @tc.name int32ArrayConstructorPart09TestMindmapTest005
     * @tc.desc Verify buf 4 ( ),byteOffset=0 length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let arr = new Int32Array(buf, 0);
      expect(arr.length).assertEqual(1);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_0600
     * @tc.name int32ArrayConstructorPart09TestMindmapTest006
     * @tc.desc Verify buf 8 ( ),byteOffset=0 length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new Int32Array(buf, 0);
      expect(arr.length).assertEqual(2);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_0700
     * @tc.name int32ArrayConstructorPart09TestMindmapTest007
     * @tc.desc Verify buf 12 ( ),byteOffset=0 length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let arr = new Int32Array(buf, 0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_0800
     * @tc.name int32ArrayConstructorPart09TestMindmapTest008
     * @tc.desc Verify buf 16 ( ),byteOffset=0 length=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr = new Int32Array(buf, 0);
      expect(arr.length).assertEqual(4);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_0900
     * @tc.name int32ArrayConstructorPart09TestMindmapTest009
     * @tc.desc Verify buf 5 bytes, byteOffset=0 truncates to 1 element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(5);
      try {
        new Int32Array(buf, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_1000
     * @tc.name int32ArrayConstructorPart09TestMindmapTest010
     * @tc.desc Verify buf 7 bytes, byteOffset=0 truncates to 1 element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(7);
      try {
        new Int32Array(buf, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_1100
     * @tc.name int32ArrayConstructorPart09TestMindmapTest011
     * @tc.desc Verify buf 9 bytes, byteOffset=0 truncates to 2 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(9);
      try {
        new Int32Array(buf, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_1200
     * @tc.name int32ArrayConstructorPart09TestMindmapTest012
     * @tc.desc Verify byteOffset=0,buffer=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let arr = new Int32Array(buf, 0);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_1300
     * @tc.name int32ArrayConstructorPart09TestMindmapTest013
     * @tc.desc Verify byteOffset=4,buffer=8 2 int32 ,length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new Int32Array(buf, 4);
      expect(arr.byteOffset).assertEqual(4);
      expect(arr.length).assertEqual(1);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_1400
     * @tc.name int32ArrayConstructorPart09TestMindmapTest014
     * @tc.desc Verify byteOffset=4,buffer=12 length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let arr = new Int32Array(buf, 4);
      expect(arr.byteOffset).assertEqual(4);
      expect(arr.length).assertEqual(2);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_1500
     * @tc.name int32ArrayConstructorPart09TestMindmapTest015
     * @tc.desc Verify byteOffset=8,buffer=12 length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let arr = new Int32Array(buf, 8);
      expect(arr.byteOffset).assertEqual(8);
      expect(arr.length).assertEqual(1);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_1600
     * @tc.name int32ArrayConstructorPart09TestMindmapTest016
     * @tc.desc Verify byteOffset=8,buffer=16 length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr = new Int32Array(buf, 8);
      expect(arr.byteOffset).assertEqual(8);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_1700
     * @tc.name int32ArrayConstructorPart09TestMindmapTest017
     * @tc.desc Verify byteOffset=12,buffer=16 length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr = new Int32Array(buf, 12);
      expect(arr.byteOffset).assertEqual(12);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_1800
     * @tc.name int32ArrayConstructorPart09TestMindmapTest018
     * @tc.desc Verify byteOffset buffer (8)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new Int32Array(buf, 8);
      expect(arr.length).assertEqual(0);
      expect(arr.byteOffset).assertEqual(8);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_1900
     * @tc.name int32ArrayConstructorPart09TestMindmapTest019
     * @tc.desc Verify byteOffset buffer (12)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let arr = new Int32Array(buf, 12);
      expect(arr.length).assertEqual(0);
      expect(arr.byteOffset).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_2000
     * @tc.name int32ArrayConstructorPart09TestMindmapTest020
     * @tc.desc Verify byteOffset=1( ),buffer=8 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      try {
        new Int32Array(buf, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_2100
     * @tc.name int32ArrayConstructorPart09TestMindmapTest021
     * @tc.desc Verify byteOffset=2( ),buffer=8 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      try {
        new Int32Array(buf, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_2200
     * @tc.name int32ArrayConstructorPart09TestMindmapTest022
     * @tc.desc Verify byteOffset=3( ),buffer=8 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      try {
        new Int32Array(buf, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_2300
     * @tc.name int32ArrayConstructorPart09TestMindmapTest023
     * @tc.desc Verify byteOffset=5( ),buffer=12 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      try {
        new Int32Array(buf, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_2400
     * @tc.name int32ArrayConstructorPart09TestMindmapTest024
     * @tc.desc Verify byteOffset=6( ),buffer=12 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      try {
        new Int32Array(buf, 6);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_2500
     * @tc.name int32ArrayConstructorPart09TestMindmapTest025
     * @tc.desc Verify byteOffset=7( ),buffer=12 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      try {
        new Int32Array(buf, 7);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_2600
     * @tc.name int32ArrayConstructorPart09TestMindmapTest026
     * @tc.desc Verify byteOffset=9( , buffer),buffer=16 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      try {
        new Int32Array(buf, 9);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_2700
     * @tc.name int32ArrayConstructorPart09TestMindmapTest027
     * @tc.desc Verify byteOffset=1,buffer=4 3 , RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      try {
        new Int32Array(buf, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_2800
     * @tc.name int32ArrayConstructorPart09TestMindmapTest028
     * @tc.desc Verify byteOffset=-1( ) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      try {
        new Int32Array(buf, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_2900
     * @tc.name int32ArrayConstructorPart09TestMindmapTest029
     * @tc.desc Verify byteOffset=-4( ) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      try {
        new Int32Array(buf, -4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_3000
     * @tc.name int32ArrayConstructorPart09TestMindmapTest030
     * @tc.desc Verify byteOffset=-8( , buffer ) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      try {
        new Int32Array(buf, -8);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_3100
     * @tc.name int32ArrayConstructorPart09TestMindmapTest031
     * @tc.desc Verify byteOffset=INT_MIN(-2147483648) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      try {
        new Int32Array(buf, -2147483648);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_3200
     * @tc.name int32ArrayConstructorPart09TestMindmapTest032
     * @tc.desc Verify byteOffset=9 buffer=8 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      try {
        new Int32Array(buf, 9);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_3300
     * @tc.name int32ArrayConstructorPart09TestMindmapTest033
     * @tc.desc Verify byteOffset=13 buffer=12 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      try {
        new Int32Array(buf, 13);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_3400
     * @tc.name int32ArrayConstructorPart09TestMindmapTest034
     * @tc.desc Verify byteOffset=INT_MAX(2147483647) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      try {
        new Int32Array(buf, 2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_3500
     * @tc.name int32ArrayConstructorPart09TestMindmapTest035
     * @tc.desc Verify byteOffset 4 :buf=12,offset=4 8 length=2( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let arr = new Int32Array(buf, 4);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_3600
     * @tc.name int32ArrayConstructorPart09TestMindmapTest036
     * @tc.desc Verify byteOffset 4 :buf=8 offset=8 ; buf=9 offset=0( ), buf=12,offset=8 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let arr = new Int32Array(buf, 8);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_3700
     * @tc.name int32ArrayConstructorPart09TestMindmapTest037
     * @tc.desc Verify buf 13 bytes, byteOffset=4 truncates to 2 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(13);
      try {
        new Int32Array(buf, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_3800
     * @tc.name int32ArrayConstructorPart09TestMindmapTest038
     * @tc.desc Verify buf 10 bytes, byteOffset=4 truncates to 1 element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(10);
      try {
        new Int32Array(buf, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_3900
     * @tc.name int32ArrayConstructorPart09TestMindmapTest039
     * @tc.desc Verify buf 11 bytes, byteOffset=8 buffer identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(11);
      try {
        new Int32Array(buf, 8);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_4000
     * @tc.name int32ArrayConstructorPart09TestMindmapTest040
     * @tc.desc Verify buf 8 bytes, byteOffset=0 length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new Int32Array(buf, 0);
      expect(arr.length).assertEqual(2);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_4100
     * @tc.name int32ArrayConstructorPart09TestMindmapTest041
     * @tc.desc Verify buffer buf ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new Int32Array(buf, 0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_4200
     * @tc.name int32ArrayConstructorPart09TestMindmapTest042
     * @tc.desc Verify byteOffset (0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new Int32Array(buf, 0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_4300
     * @tc.name int32ArrayConstructorPart09TestMindmapTest043
     * @tc.desc Verify byteOffset (4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let arr = new Int32Array(buf, 4);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_4400
     * @tc.name int32ArrayConstructorPart09TestMindmapTest044
     * @tc.desc Verify byteLength = = buffer.byteLength - byteOffset( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let arr = new Int32Array(buf, 4);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_4500
     * @tc.name int32ArrayConstructorPart09TestMindmapTest045
     * @tc.desc Verify length = byteLength / 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr = new Int32Array(buf, 4);
      expect(arr.length).assertEqual(3);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_4600
     * @tc.name int32ArrayConstructorPart09TestMindmapTest046
     * @tc.desc Verify 0(ArrayBuffer )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new Int32Array(buf, 0);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_4700
     * @tc.name int32ArrayConstructorPart09TestMindmapTest047
     * @tc.desc Verify zero-length ArrayBuffer gives length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(0);
      let arr = new Int32Array(buf, 0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_4800
     * @tc.name int32ArrayConstructorPart09TestMindmapTest048
     * @tc.desc Verify ArrayBuffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let arr = new Int32Array(buf, 4);
      expect(buf.byteLength).assertEqual(12);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_4900
     * @tc.name int32ArrayConstructorPart09TestMindmapTest049
     * @tc.desc Verify offset buffer, length/byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let a1 = new Int32Array(buf, 0);
      let a2 = new Int32Array(buf, 8);
      expect(a1.length).assertEqual(4);
      expect(a2.length).assertEqual(2);
      expect(a1.byteOffset).assertEqual(0);
      expect(a2.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_5000
     * @tc.name int32ArrayConstructorPart09TestMindmapTest050
     * @tc.desc Verify $_set(0, v), $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new Int32Array(buf, 0);
      arr.$_set(0, 42);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_5100
     * @tc.name int32ArrayConstructorPart09TestMindmapTest051
     * @tc.desc Verify offset=0 ,offset=0 ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let a1 = new Int32Array(buf, 0);
      a1.$_set(0, 100);
      let a2 = new Int32Array(buf, 0);
      expect(a2.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_5200
     * @tc.name int32ArrayConstructorPart09TestMindmapTest052
     * @tc.desc Verify offset=0 2 ,offset=4 $_get(0) ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let a1 = new Int32Array(buf, 0);
      a1.$_set(1, 200);
      let a2 = new Int32Array(buf, 4);
      expect(a2.$_get(0)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_5300
     * @tc.name int32ArrayConstructorPart09TestMindmapTest053
     * @tc.desc Verify offset=4 ,offset=0 2 ($_get(1))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let a1 = new Int32Array(buf, 0);
      let a2 = new Int32Array(buf, 4);
      a2.$_set(0, -5);
      expect(a1.$_get(1)).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_5400
     * @tc.name int32ArrayConstructorPart09TestMindmapTest054
     * @tc.desc Verify buffer offset (offset )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let a1 = new Int32Array(buf, 0);
      let a2 = new Int32Array(buf, 8);
      a1.$_set(0, 111);
      a2.$_set(0, 222);
      expect(a1.$_get(0)).assertEqual(111);
      expect(a1.$_get(2)).assertEqual(222);
      expect(a2.$_get(0)).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_5500
     * @tc.name int32ArrayConstructorPart09TestMindmapTest055
     * @tc.desc Verify INT_MAX,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let a1 = new Int32Array(buf, 0);
      a1.$_set(0, 2147483647);
      let a2 = new Int32Array(buf, 0);
      expect(a2.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_5600
     * @tc.name int32ArrayConstructorPart09TestMindmapTest056
     * @tc.desc Verify INT_MIN,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let a1 = new Int32Array(buf, 0);
      a1.$_set(0, -2147483648);
      let a2 = new Int32Array(buf, 0);
      expect(a2.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_5700
     * @tc.name int32ArrayConstructorPart09TestMindmapTest057
     * @tc.desc Verify (offset == buffer) $_set(0, v) throws RangeError, buffer unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let aFull = new Int32Array(buf, 0);
      aFull.$_set(0, 77);
      let aEmpty = new Int32Array(buf, 8);
      try {
        aEmpty.$_set(0, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(aFull.$_get(0)).assertEqual(77);
      expect(aEmpty.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_5800
     * @tc.name int32ArrayConstructorPart09TestMindmapTest058
     * @tc.desc Verify offset=4 INT_MIN,offset=0 int32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let a1 = new Int32Array(buf, 4);
      a1.$_set(0, -2147483648);
      let a0 = new Int32Array(buf, 0);
      expect(a0.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_5900
     * @tc.name int32ArrayConstructorPart09TestMindmapTest059
     * @tc.desc Verify buffer offset (0/4/8) ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let a0 = new Int32Array(buf, 0);
      let a4 = new Int32Array(buf, 4);
      let a8 = new Int32Array(buf, 8);
      a0.$_set(0, 10);
      a4.$_set(0, 20);
      a8.$_set(0, 30);
      expect(a0.$_get(0)).assertEqual(10);
      expect(a0.$_get(1)).assertEqual(20);
      expect(a0.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_6000
     * @tc.name int32ArrayConstructorPart09TestMindmapTest060
     * @tc.desc Verify fill offset ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let a1 = new Int32Array(buf, 4);
      a1.fill(7);
      let a0 = new Int32Array(buf, 0);
      expect(a0.$_get(1)).assertEqual(7);
      expect(a0.$_get(2)).assertEqual(7);
      expect(a0.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_6100
     * @tc.name int32ArrayConstructorPart09TestMindmapTest061
     * @tc.desc Verify set offset ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let aOff = new Int32Array(buf, 4);
      let src = Int32Array.of(55, 66);
      aOff.set(src, 0);
      let aFull = new Int32Array(buf, 0);
      expect(aFull.$_get(1)).assertEqual(55);
      expect(aFull.$_get(2)).assertEqual(66);
      expect(aFull.$_get(0)).assertEqual(0);
      expect(aFull.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_6200
     * @tc.name int32ArrayConstructorPart09TestMindmapTest062
     * @tc.desc Verify offset=4 subarray(0) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let a1 = new Int32Array(buf, 4);
      let aSub = a1.subarray(0);
      aSub.$_set(0, 999);
      expect(a1.$_get(0)).assertEqual(999);
      expect(aSub.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_6300
     * @tc.name int32ArrayConstructorPart09TestMindmapTest063
     * @tc.desc Verify reverse ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let a1 = new Int32Array(buf, 0);
      a1.$_set(0, 1);
      a1.$_set(1, 2);
      a1.reverse();
      let a2 = new Int32Array(buf, 0);
      expect(a2.$_get(0)).assertEqual(2);
      expect(a2.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_6400
     * @tc.name int32ArrayConstructorPart09TestMindmapTest064
     * @tc.desc Verify ArrayBuffer , 0( 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let arr = new Int32Array(buf, 0);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_6500
     * @tc.name int32ArrayConstructorPart09TestMindmapTest065
     * @tc.desc Verify offset=4 , 4 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let a1 = new Int32Array(buf, 4);
      a1.$_set(0, 7);
      let a0 = new Int32Array(buf, 0);
      expect(a0.$_get(0)).assertEqual(0);
      expect(a0.$_get(1)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_6600
     * @tc.name int32ArrayConstructorPart09TestMindmapTest066
     * @tc.desc Verify DataView Int32Array ( 0x01000000 = 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let dv = new DataView(buf);
      dv.setInt32(0, 1, true);
      let arr = new Int32Array(buf, 0);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_6700
     * @tc.name int32ArrayConstructorPart09TestMindmapTest067
     * @tc.desc Verify buf 7 bytes, byteOffset=4 buffer identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(7);
      try {
        new Int32Array(buf, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_6800
     * @tc.name int32ArrayConstructorPart09TestMindmapTest068
     * @tc.desc Verify buffer fill(INT_MAX),offset INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let a0 = new Int32Array(buf, 0);
      a0.fill(2147483647);
      let a4 = new Int32Array(buf, 4);
      expect(a4.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_6900
     * @tc.name int32ArrayConstructorPart09TestMindmapTest069
     * @tc.desc Verify buffer -1( 1 ),offset -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let a0 = new Int32Array(buf, 0);
      a0.$_set(1, -1);
      let a4 = new Int32Array(buf, 4);
      expect(a4.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_7000
     * @tc.name int32ArrayConstructorPart09TestMindmapTest070
     * @tc.desc Verify buffer(4096 = 1024 ),offset=0,length=1024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4096);
      let arr = new Int32Array(buf, 0);
      expect(arr.length).assertEqual(1024);
      expect(arr.byteLength).assertEqual(4096);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_7100
     * @tc.name int32ArrayConstructorPart09TestMindmapTest071
     * @tc.desc Verify buffer(4096),offset=4092( 4 ),length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4096);
      let arr = new Int32Array(buf, 4092);
      expect(arr.length).assertEqual(1);
      expect(arr.byteOffset).assertEqual(4092);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_7200
     * @tc.name int32ArrayConstructorPart09TestMindmapTest072
     * @tc.desc Verify buffer(4096),offset=4088,length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4096);
      let arr = new Int32Array(buf, 4088);
      expect(arr.length).assertEqual(2);
      expect(arr.byteOffset).assertEqual(4088);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_7300
     * @tc.name int32ArrayConstructorPart09TestMindmapTest073
     * @tc.desc Verify buffer(4096),offset=4096( buffer )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4096);
      let arr = new Int32Array(buf, 4096);
      expect(arr.length).assertEqual(0);
      expect(arr.byteOffset).assertEqual(4096);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_7400
     * @tc.name int32ArrayConstructorPart09TestMindmapTest074
     * @tc.desc Verify buffer(4096),offset=4097( 1 , ) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4096);
      try {
        new Int32Array(buf, 4097);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_7500
     * @tc.name int32ArrayConstructorPart09TestMindmapTest075
     * @tc.desc Verify buffer(4096),offset=4093( , ) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4096);
      try {
        new Int32Array(buf, 4093);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_7600
     * @tc.name int32ArrayConstructorPart09TestMindmapTest076
     * @tc.desc Verify buffer(4096),offset=1( ) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4096);
      try {
        new Int32Array(buf, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_7700
     * @tc.name int32ArrayConstructorPart09TestMindmapTest077
     * @tc.desc Verify buffer(4096),offset=-4096( ) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4096);
      try {
        new Int32Array(buf, -4096);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_7800
     * @tc.name int32ArrayConstructorPart09TestMindmapTest078
     * @tc.desc Verify buf+offset , ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let a1 = new Int32Array(buf, 0);
      let a2 = new Int32Array(buf, 0);
      a1.$_set(0, 123);
      expect(a2.$_get(0)).assertEqual(123);
      expect(a1.buffer).assertEqual(a2.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_7900
     * @tc.name int32ArrayConstructorPart09TestMindmapTest079
     * @tc.desc Verify buf offset ,buffer byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let a1 = new Int32Array(buf, 0);
      let a2 = new Int32Array(buf, 4);
      expect(a1.buffer).assertEqual(a2.buffer);
      expect(a1.byteOffset).assertEqual(0);
      expect(a2.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_8000
     * @tc.name int32ArrayConstructorPart09TestMindmapTest080
     * @tc.desc Verify toString Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new Int32Array(buf, 0);
      expect(arr.toString()).assertEqual('0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_8100
     * @tc.name int32ArrayConstructorPart09TestMindmapTest081
     * @tc.desc Verify toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(0);
      let arr = new Int32Array(buf, 0);
      expect(arr.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_8200
     * @tc.name int32ArrayConstructorPart09TestMindmapTest082
     * @tc.desc Verify (offset=0,buf=4)toString 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let arr = new Int32Array(buf, 0);
      expect(arr.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_8300
     * @tc.name int32ArrayConstructorPart09TestMindmapTest083
     * @tc.desc Verify offset=4,buffer=8 , join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let a4 = new Int32Array(buf, 4);
      a4.$_set(0, 42);
      expect(a4.join(',')).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART09_TEST_MINDMAP_8400
     * @tc.name int32ArrayConstructorPart09TestMindmapTest084
     * @tc.desc Verify offset=0 0 offset=4 , offset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart09TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let a0 = new Int32Array(buf, 0);
      let a4 = new Int32Array(buf, 4);
      a0.$_set(0, 11);
      a0.$_set(1, 22);
      a4.$_set(0, 33);
      expect(a0.$_get(0)).assertEqual(11);
      expect(a0.$_get(1)).assertEqual(33);
      expect(a4.$_get(0)).assertEqual(33);
    });
  });
}
