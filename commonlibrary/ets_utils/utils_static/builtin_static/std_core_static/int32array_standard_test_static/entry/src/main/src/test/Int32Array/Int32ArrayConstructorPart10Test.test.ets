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
export default function int32ArrayConstructorPart10TestMindmapTestTest(): void {
  describe('Int32ArrayConstructorPart10TestMindmapTestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_0100
     * @tc.name int32ArrayConstructorPart10TestMindmapTest001
     * @tc.desc Verify Int32Array(buf, 0) with 16-byte ArrayBuffer yields length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let view: Int32Array = new Int32Array(buf, 0);
      expect(view.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_0200
     * @tc.name int32ArrayConstructorPart10TestMindmapTest002
     * @tc.desc Verify Int32Array(buf, 0) with 8-byte ArrayBuffer yields byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int32Array = new Int32Array(buf, 0);
      expect(view.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_0300
     * @tc.name int32ArrayConstructorPart10TestMindmapTest003
     * @tc.desc Verify Int32Array(buf, 0) with 8-byte ArrayBuffer yields byteLength 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int32Array = new Int32Array(buf, 0);
      expect(view.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_0400
     * @tc.name int32ArrayConstructorPart10TestMindmapTest004
     * @tc.desc Verify Int32Array(buf, 0) with 10-byte ArrayBuffer truncates length to 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      try {
        new Int32Array(buf, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_0500
     * @tc.name int32ArrayConstructorPart10TestMindmapTest005
     * @tc.desc Verify Int32Array(buf, 0) with 4-byte ArrayBuffer yields length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int32Array = new Int32Array(buf, 0);
      expect(view.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_0600
     * @tc.name int32ArrayConstructorPart10TestMindmapTest006
     * @tc.desc Verify Int32Array(buf, 0) with zero-length ArrayBuffer yields length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let view: Int32Array = new Int32Array(buf, 0);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_0700
     * @tc.name int32ArrayConstructorPart10TestMindmapTest007
     * @tc.desc Verify Int32Array(buf, 0) with 4096-byte ArrayBuffer yields length 1024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4096);
      let view: Int32Array = new Int32Array(buf, 0);
      expect(view.length).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_0800
     * @tc.name int32ArrayConstructorPart10TestMindmapTest008
     * @tc.desc Verify two Int32Array views on same buffer share data via $_set/$_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let valFirst: Int32Array = new Int32Array(buf, 0);
      valFirst.$_set(0, 100);
      let valSecond: Int32Array = new Int32Array(buf, 0);
      expect(valSecond.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_0900
     * @tc.name int32ArrayConstructorPart10TestMindmapTest009
     * @tc.desc Verify Int32Array(buf) default byteOffset 0 shares writes with offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let w: Int32Array = new Int32Array(buf);
      w.$_set(1, -42);
      let view: Int32Array = new Int32Array(buf, 0);
      expect(view.$_get(1)).assertEqual(-42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_1000
     * @tc.name int32ArrayConstructorPart10TestMindmapTest010
     * @tc.desc Verify Int32Array(buf, 0) with 8-byte ArrayBuffer yields length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int32Array = new Int32Array(buf, 0);
      expect(view.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_1100
     * @tc.name int32ArrayConstructorPart10TestMindmapTest011
     * @tc.desc Verify Int32Array(buf, 0) with 16-byte ArrayBuffer yields byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let view: Int32Array = new Int32Array(buf, 0);
      expect(view.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_1200
     * @tc.name int32ArrayConstructorPart10TestMindmapTest012
     * @tc.desc Verify Int32Array(buf, -0) treats negative zero as byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int32Array = new Int32Array(buf, -0);
      expect(view.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_1300
     * @tc.name int32ArrayConstructorPart10TestMindmapTest013
     * @tc.desc Verify Int32Array(buf, 4) with 16-byte buffer yields byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let view: Int32Array = new Int32Array(buf, 4);
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_1400
     * @tc.name int32ArrayConstructorPart10TestMindmapTest014
     * @tc.desc Verify Int32Array(buf, 8.0) with 20-byte buffer yields length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let view: Int32Array = new Int32Array(buf, 8.0);
      expect(view.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_1500
     * @tc.name int32ArrayConstructorPart10TestMindmapTest015
     * @tc.desc Verify Int32Array(buf, 12.0) with 16-byte buffer yields length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let view: Int32Array = new Int32Array(buf, 12.0);
      expect(view.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_1600
     * @tc.name int32ArrayConstructorPart10TestMindmapTest016
     * @tc.desc Verify Int32Array(buf, 16.0) with 16-byte buffer yields length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let view: Int32Array = new Int32Array(buf, 16.0);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_1700
     * @tc.name int32ArrayConstructorPart10TestMindmapTest017
     * @tc.desc Verify Int32Array(buf, 2.9) non-4-aligned byteOffset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      try {
        new Int32Array(buf, 2.9);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_1800
     * @tc.name int32ArrayConstructorPart10TestMindmapTest018
     * @tc.desc Verify Int32Array(buf, 3) non-4-aligned byteOffset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      try {
        new Int32Array(buf, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_1900
     * @tc.name int32ArrayConstructorPart10TestMindmapTest019
     * @tc.desc Verify Int32Array(buf, 1) non-4-aligned byteOffset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      try {
        new Int32Array(buf, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_2000
     * @tc.name int32ArrayConstructorPart10TestMindmapTest020
     * @tc.desc Verify Int32Array(buf, -4) negative byteOffset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      try {
        new Int32Array(buf, -4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_2100
     * @tc.name int32ArrayConstructorPart10TestMindmapTest021
     * @tc.desc Verify Int32Array(buf, -1) negative byteOffset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      try {
        new Int32Array(buf, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_2200
     * @tc.name int32ArrayConstructorPart10TestMindmapTest022
     * @tc.desc Verify Int32Array(buf, 2) non-4-aligned byteOffset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      try {
        new Int32Array(buf, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_2300
     * @tc.name int32ArrayConstructorPart10TestMindmapTest023
     * @tc.desc Verify Int32Array(buf, 5) non-4-aligned byteOffset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      try {
        new Int32Array(buf, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_2400
     * @tc.name int32ArrayConstructorPart10TestMindmapTest024
     * @tc.desc Verify Int32Array(buf, Double.NaN) byteOffset NaN treated as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int32Array = new Int32Array(buf, Double.NaN);
      expect(view.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_2500
     * @tc.name int32ArrayConstructorPart10TestMindmapTest025
     * @tc.desc Verify Int32Array(buf, Double.POSITIVE_INFINITY) byteOffset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      try {
        new Int32Array(buf, Double.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_2600
     * @tc.name int32ArrayConstructorPart10TestMindmapTest026
     * @tc.desc Verify Int32Array(buf, Double.NEGATIVE_INFINITY) byteOffset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      try {
        new Int32Array(buf, Double.NEGATIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_2700
     * @tc.name int32ArrayConstructorPart10TestMindmapTest027
     * @tc.desc Verify Int32Array(buf, 17.0) byteOffset exceeds buffer throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      try {
        new Int32Array(buf, 17.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_2800
     * @tc.name int32ArrayConstructorPart10TestMindmapTest028
     * @tc.desc Verify Int32Array(buf, 16.1) float byteOffset truncated to 16 yields length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let view: Int32Array = new Int32Array(buf, 16.1);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_2900
     * @tc.name int32ArrayConstructorPart10TestMindmapTest029
     * @tc.desc Verify Int32Array(buf, 16.9) float byteOffset truncated to 16 yields byteOffset 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let view: Int32Array = new Int32Array(buf, 16.9);
      expect(view.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_3000
     * @tc.name int32ArrayConstructorPart10TestMindmapTest030
     * @tc.desc Verify Int32Array(buf, 9007199254740991.0) MAX_SAFE_INTEGER byteOffset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      try {
        new Int32Array(buf, 9007199254740991.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_3100
     * @tc.name int32ArrayConstructorPart10TestMindmapTest031
     * @tc.desc Verify Int32Array(buf, 3.999999) float truncates to 3 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      try {
        new Int32Array(buf, 3.999999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_3200
     * @tc.name int32ArrayConstructorPart10TestMindmapTest032
     * @tc.desc Verify Int32Array(buf, 4.000001) float truncates to 4 yields byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let view: Int32Array = new Int32Array(buf, 4.000001);
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_3300
     * @tc.name int32ArrayConstructorPart10TestMindmapTest033
     * @tc.desc Verify Int32Array(buf, 4) with 16-byte buffer yields byteLength 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let view: Int32Array = new Int32Array(buf, 4);
      expect(view.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_3400
     * @tc.name int32ArrayConstructorPart10TestMindmapTest034
     * @tc.desc Verify Int32Array(buf, 12.0) yields length 1 and byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let view: Int32Array = new Int32Array(buf, 12.0);
      expect(view.length).assertEqual(1);
      expect(view.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_3500
     * @tc.name int32ArrayConstructorPart10TestMindmapTest035
     * @tc.desc Verify Int32Array(buf, 0) with 9-byte buffer truncates length to 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(9);
      try {
        new Int32Array(buf, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_3600
     * @tc.name int32ArrayConstructorPart10TestMindmapTest036
     * @tc.desc Verify Int32Array(buf, 4) with 11-byte buffer yields length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(11);
      try {
        new Int32Array(buf, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_3700
     * @tc.name int32ArrayConstructorPart10TestMindmapTest037
     * @tc.desc Verify Int32Array(buf, 4) with 7-byte buffer insufficient remainder yields length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(7);
      try {
        new Int32Array(buf, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_3800
     * @tc.name int32ArrayConstructorPart10TestMindmapTest038
     * @tc.desc Verify Int32Array(buf, 4) with 8-byte buffer yields length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int32Array = new Int32Array(buf, 4);
      expect(view.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_3900
     * @tc.name int32ArrayConstructorPart10TestMindmapTest039
     * @tc.desc Verify Int32Array(buf, 4) with 5-byte buffer one remaining byte yields length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      try {
        new Int32Array(buf, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_4000
     * @tc.name int32ArrayConstructorPart10TestMindmapTest040
     * @tc.desc Verify Int32Array view cast to Object instanceof Int32Array returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int32Array = new Int32Array(buf, 0);
      let isInstance: boolean = (view as Object) instanceof Int32Array;
      expect(isInstance).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_4100
     * @tc.name int32ArrayConstructorPart10TestMindmapTest041
     * @tc.desc Verify Int32Array(buf, 0) buffer property returns the original ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int32Array = new Int32Array(buf, 0);
      expect(view.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_4200
     * @tc.name int32ArrayConstructorPart10TestMindmapTest042
     * @tc.desc Verify Int32Array(buf, 0) BYTES_PER_ELEMENT equals 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int32Array = new Int32Array(buf, 0);
      expect(view.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_4300
     * @tc.name int32ArrayConstructorPart10TestMindmapTest043
     * @tc.desc Verify Int32Array(buf, 0) with 12-byte buffer zero-initializes all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let view: Int32Array = new Int32Array(buf, 0);
      expect(view.$_get(0)).assertEqual(0);
      expect(view.$_get(1)).assertEqual(0);
      expect(view.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_4400
     * @tc.name int32ArrayConstructorPart10TestMindmapTest044
     * @tc.desc Verify view as Object instanceof Int32Array returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int32Array = new Int32Array(buf, 0);
      let checkObj: Object = view as Object;
      expect(checkObj instanceof Int32Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_4500
     * @tc.name int32ArrayConstructorPart10TestMindmapTest045
     * @tc.desc Verify Int32Array(buf, -8.0) negative float byteOffset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      try {
        new Int32Array(buf, -8.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_4600
     * @tc.name int32ArrayConstructorPart10TestMindmapTest046
     * @tc.desc Verify Int32Array(buf, 20.0) byteOffset exceeds 16-byte buffer throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      try {
        new Int32Array(buf, 20.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_4700
     * @tc.name int32ArrayConstructorPart10TestMindmapTest047
     * @tc.desc Verify Int32Array(buf, 1) non-4-aligned byteOffset on 4-byte buffer throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        new Int32Array(buf, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_4800
     * @tc.name int32ArrayConstructorPart10TestMindmapTest048
     * @tc.desc Verify Int32Array(buf, 4) byteOffset equals 4-byte buffer byteLength yields length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int32Array = new Int32Array(buf, 4);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_4900
     * @tc.name int32ArrayConstructorPart10TestMindmapTest049
     * @tc.desc Verify Int32Array(buf, 5) byteOffset exceeds 4-byte buffer throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        new Int32Array(buf, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_5000
     * @tc.name int32ArrayConstructorPart10TestMindmapTest050
     * @tc.desc Verify Int32Array(buf, 4) byteOffset on zero-length buffer throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      try {
        new Int32Array(buf, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_5100
     * @tc.name int32ArrayConstructorPart10TestMindmapTest051
     * @tc.desc Verify Int32Array(buf, 1) byteOffset on zero-length buffer throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      try {
        new Int32Array(buf, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_5200
     * @tc.name int32ArrayConstructorPart10TestMindmapTest052
     * @tc.desc Verify offset view $_set propagates to full view at correct index on shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let full: Int32Array = new Int32Array(buf);
      let offset: Int32Array = new Int32Array(buf, 4);
      offset.$_set(0, 777);
      expect(full.$_get(1)).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_5300
     * @tc.name int32ArrayConstructorPart10TestMindmapTest053
     * @tc.desc Verify offset view $_set(2) propagates to full view $_get(3) on shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let full: Int32Array = new Int32Array(buf);
      let offset: Int32Array = new Int32Array(buf, 4);
      offset.$_set(2, 888);
      expect(full.$_get(3)).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_5400
     * @tc.name int32ArrayConstructorPart10TestMindmapTest054
     * @tc.desc Verify full view $_set propagates to offset view $_get(0) on shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let full: Int32Array = new Int32Array(buf);
      let offset: Int32Array = new Int32Array(buf, 4);
      full.$_set(1, 999);
      expect(offset.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_5500
     * @tc.name int32ArrayConstructorPart10TestMindmapTest055
     * @tc.desc Verify views at byteOffset 0 and 8.0 share writes across non-adjacent offsets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let valFirst: Int32Array = new Int32Array(buf, 0);
      let valSecond: Int32Array = new Int32Array(buf, 8.0);
      valFirst.$_set(3, 111);
      expect(valSecond.$_get(1)).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_5600
     * @tc.name int32ArrayConstructorPart10TestMindmapTest056
     * @tc.desc Verify Int32Array(buf, 8.0) buffer property returns the original ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let view: Int32Array = new Int32Array(buf, 8.0);
      expect(view.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_5700
     * @tc.name int32ArrayConstructorPart10TestMindmapTest057
     * @tc.desc Verify two views at same offset 4 share data via $_set/$_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let valFirst: Int32Array = new Int32Array(buf, 4);
      let valSecond: Int32Array = new Int32Array(buf, 4);
      valFirst.$_set(0, 321);
      expect(valSecond.$_get(0)).assertEqual(321);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_5800
     * @tc.name int32ArrayConstructorPart10TestMindmapTest058
     * @tc.desc Verify two views at same offset 4 share mutations with value 555
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let valFirst: Int32Array = new Int32Array(buf, 4);
      let valSecond: Int32Array = new Int32Array(buf, 4);
      valFirst.$_set(0, 555);
      expect(valSecond.$_get(0)).assertEqual(555);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_5900
     * @tc.name int32ArrayConstructorPart10TestMindmapTest059
     * @tc.desc Verify $_set on empty tail view at offset 8 throws RangeError without corrupting full view data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let full: Int32Array = new Int32Array(buf);
      full.$_set(0, 42);
      full.$_set(1, 43);
      let tail: Int32Array = new Int32Array(buf, 8.0);
      try {
        tail.$_set(0, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(full.$_get(0)).assertEqual(42);
      expect(full.$_get(1)).assertEqual(43);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_6000
     * @tc.name int32ArrayConstructorPart10TestMindmapTest060
     * @tc.desc Verify two views at offset 0 share INT_MAX value via $_set/$_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let valFirst: Int32Array = new Int32Array(buf, 0);
      let valSecond: Int32Array = new Int32Array(buf, 0);
      valFirst.$_set(0, 2147483647);
      expect(valSecond.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_6100
     * @tc.name int32ArrayConstructorPart10TestMindmapTest061
     * @tc.desc Verify offset=4 view with INT_MIN propagates to full view at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let valFirst: Int32Array = new Int32Array(buf, 4);
      let full: Int32Array = new Int32Array(buf);
      valFirst.$_set(0, -2147483648);
      expect(full.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_6200
     * @tc.name int32ArrayConstructorPart10TestMindmapTest062
     * @tc.desc Verify four views at offsets 0, 4, 8, 12 each report correct byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let valFirst: Int32Array = new Int32Array(buf, 0);
      let valSecond: Int32Array = new Int32Array(buf, 4);
      let vEight: Int32Array = new Int32Array(buf, 8.0);
      let valThird: Int32Array = new Int32Array(buf, 12.0);
      expect(valFirst.byteOffset).assertEqual(0);
      expect(valSecond.byteOffset).assertEqual(4);
      expect(vEight.byteOffset).assertEqual(8);
      expect(valThird.byteOffset).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_6300
     * @tc.name int32ArrayConstructorPart10TestMindmapTest063
     * @tc.desc Verify four views write distinct values and full view reads all correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let valFirst: Int32Array = new Int32Array(buf, 0);
      let valSecond: Int32Array = new Int32Array(buf, 4);
      let vEight: Int32Array = new Int32Array(buf, 8.0);
      let valThird: Int32Array = new Int32Array(buf, 12.0);
      valFirst.$_set(0, 10);
      valSecond.$_set(0, 20);
      vEight.$_set(0, 30);
      valThird.$_set(0, 40);
      let full: Int32Array = new Int32Array(buf);
      expect(full.$_get(0)).assertEqual(10);
      expect(full.$_get(1)).assertEqual(20);
      expect(full.$_get(2)).assertEqual(30);
      expect(full.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_6400
     * @tc.name int32ArrayConstructorPart10TestMindmapTest064
     * @tc.desc Verify view at offset 12.0 $_set(-1) propagates to full view $_get(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let last: Int32Array = new Int32Array(buf, 12.0);
      let full: Int32Array = new Int32Array(buf);
      last.$_set(0, -1);
      expect(full.$_get(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_6500
     * @tc.name int32ArrayConstructorPart10TestMindmapTest065
     * @tc.desc Verify empty view at offset 8.0 buffer property returns the original ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let empty: Int32Array = new Int32Array(buf, 8.0);
      expect(empty.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_6600
     * @tc.name int32ArrayConstructorPart10TestMindmapTest066
     * @tc.desc Verify empty view at offset 8.0 byteLength is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let empty: Int32Array = new Int32Array(buf, 8.0);
      expect(empty.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_6700
     * @tc.name int32ArrayConstructorPart10TestMindmapTest067
     * @tc.desc Verify two views with NaN byteOffset and zero offset share data on same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let valFirst: Int32Array = new Int32Array(buf, Double.NaN);
      let valSecond: Int32Array = new Int32Array(buf, 0);
      valFirst.$_set(0, 77);
      expect(valSecond.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_6800
     * @tc.name int32ArrayConstructorPart10TestMindmapTest068
     * @tc.desc Verify Int32Array(buf, 4) reports byteOffset 4 length 3 byteLength 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let view: Int32Array = new Int32Array(buf, 4);
      expect(view.byteOffset).assertEqual(4);
      expect(view.length).assertEqual(3);
      expect(view.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_6900
     * @tc.name int32ArrayConstructorPart10TestMindmapTest069
     * @tc.desc Verify Int32Array(buf, 0) with 12-byte buffer reports length 3 byteLength 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let view: Int32Array = new Int32Array(buf, 0);
      expect(view.length).assertEqual(3);
      expect(view.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_7000
     * @tc.name int32ArrayConstructorPart10TestMindmapTest070
     * @tc.desc Verify full view writes 1-4 and offset=4 view reads elements 2-4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let w: Int32Array = new Int32Array(buf);
      w.$_set(0, 1);
      w.$_set(1, 2);
      w.$_set(2, 3);
      w.$_set(3, 4);
      let view: Int32Array = new Int32Array(buf, 4);
      expect(view.$_get(0)).assertEqual(2);
      expect(view.$_get(1)).assertEqual(3);
      expect(view.$_get(2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_7100
     * @tc.name int32ArrayConstructorPart10TestMindmapTest071
     * @tc.desc Verify Int32Array(buf, 8.5) float byteOffset truncated to 8 yields length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let view: Int32Array = new Int32Array(buf, 8.5);
      expect(view.byteOffset).assertEqual(8);
      expect(view.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_7200
     * @tc.name int32ArrayConstructorPart10TestMindmapTest072
     * @tc.desc Verify Int32Array(buf, 0) with 8-byte buffer yields byteOffset 0 length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int32Array = new Int32Array(buf, 0);
      expect(view.byteOffset).assertEqual(0);
      expect(view.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART10_TEST_MINDMAP_7300
     * @tc.name int32ArrayConstructorPart10TestMindmapTest073
     * @tc.desc Verify two views at same offset 4 share byteOffset length and mutations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart10TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let vNum: Int32Array = new Int32Array(buf, 4);
      let vInt: Int32Array = new Int32Array(buf, 4);
      expect(vNum.byteOffset).assertEqual(vInt.byteOffset);
      expect(vNum.length).assertEqual(vInt.length);
      vNum.$_set(0, 123);
      expect(vInt.$_get(0)).assertEqual(123);
    });
  });
}
