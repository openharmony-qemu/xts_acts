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
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int8ArraySubarrayPart02Test(): void {
  describe('Int8ArraySubarrayPart02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    const INT8_MAX = 127;
    const INT8_MIN = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_0200
     * @tc.name int8ArraySubarrayPart02Test002
     * @tc.desc Verify subarray(1) positive index returns 1-byte typed array view sharing src buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = src.subarray(1);
      let actualBytesPerElement: int = view.BYTES_PER_ELEMENT;
      let expectedBytesPerElement: int = 1;
      expect(actualBytesPerElement).assertEqual(expectedBytesPerElement);
      let actualViewBuffer: ArrayBuffer = view.buffer;
      let expectedViewBuffer: ArrayBuffer = src.buffer;
      expect(actualViewBuffer).assertEqual(expectedViewBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_0400
     * @tc.name int8ArraySubarrayPart02Test004
     * @tc.desc Verify subarray(length) out-of-bounds returns 1-byte typed array view sharing src buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = src.subarray(5);
      let actualBytesPerElement: int = view.BYTES_PER_ELEMENT;
      let expectedBytesPerElement: int = 1;
      expect(actualBytesPerElement).assertEqual(expectedBytesPerElement);
      let actualViewBuffer: ArrayBuffer = view.buffer;
      let expectedViewBuffer: ArrayBuffer = src.buffer;
      expect(actualViewBuffer).assertEqual(expectedViewBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_0500
     * @tc.name int8ArraySubarrayPart02Test005
     * @tc.desc Verify subarray(0,1) single-element view shares buffer and keeps first value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = src.subarray(0, 1);
      let actualBytesPerElement: int = view.BYTES_PER_ELEMENT;
      let expectedBytesPerElement: int = 1;
      expect(actualBytesPerElement).assertEqual(expectedBytesPerElement);
      let actualViewBuffer: ArrayBuffer = view.buffer;
      let expectedViewBuffer: ArrayBuffer = src.buffer;
      expect(actualViewBuffer).assertEqual(expectedViewBuffer);
      let actualFirst: number = view.$_get(0);
      let expectedFirst: int = 10;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_0700
     * @tc.name int8ArraySubarrayPart02Test007
     * @tc.desc Verify subarray(-2,-1) double-negative view returns 1-byte typed array view sharing src buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = src.subarray(-2, -1);
      let actualBytesPerElement: int = view.BYTES_PER_ELEMENT;
      let expectedBytesPerElement: int = 1;
      expect(actualBytesPerElement).assertEqual(expectedBytesPerElement);
      let actualViewBuffer: ArrayBuffer = view.buffer;
      let expectedViewBuffer: ArrayBuffer = src.buffer;
      expect(actualViewBuffer).assertEqual(expectedViewBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_0800
     * @tc.name int8ArraySubarrayPart02Test008
     * @tc.desc Verify subarray() view preserves signed negative values (not Uint8Array behavior)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(-10, 20, 30, 40, 50);
      let view: Int8Array = src.subarray();
      let actualFirstElement: number = view[0];
      let expectedFirstElement: int = -10;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_1200
     * @tc.name int8ArraySubarrayPart02Test012
     * @tc.desc Verify subarray(1) view first element equals src index 1 element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(11, 22, 33, 44, 55);
      let view: Int8Array = src.subarray(1);
      let actualFirstElement: number = view[0];
      let expectedFirstElement: int = 22;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_1600
     * @tc.name int8ArraySubarrayPart02Test016
     * @tc.desc Verify subarray(-2) view elements equal last 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(11, 22, 33, 44, 55);
      let view: Int8Array = src.subarray(-2);
      let actualFirstElement: number = view[0];
      let expectedFirstElement: int = 44;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
      let actualSecondElement: number = view[1];
      let expectedSecondElement: int = 55;
      expect(actualSecondElement).assertEqual(expectedSecondElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_1700
     * @tc.name int8ArraySubarrayPart02Test017
     * @tc.desc Verify subarray(-2,-1) view only contains second-to-last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(11, 22, 33, 44, 55);
      let view: Int8Array = src.subarray(-2, -1);
      let actualFirstElement: number = view[0];
      let expectedFirstElement: int = 44;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_1800
     * @tc.name int8ArraySubarrayPart02Test018
     * @tc.desc Verify subarray(0,2) view elements equal first 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(11, 22, 33, 44, 55);
      let view: Int8Array = src.subarray(0, 2);
      let actualFirstElement: number = view[0];
      let expectedFirstElement: int = 11;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
      let actualSecondElement: number = view[1];
      let expectedSecondElement: int = 22;
      expect(actualSecondElement).assertEqual(expectedSecondElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_2300
     * @tc.name int8ArraySubarrayPart02Test023
     * @tc.desc Verify subarray(0, length+100) end out-of-bounds clipped to end, last element correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(11, 22, 33, 44, 55);
      let view: Int8Array = src.subarray(0, 105);
      let actualLastElement: number = view[4];
      let expectedLastElement: int = 55;
      expect(actualLastElement).assertEqual(expectedLastElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_2400
     * @tc.name int8ArraySubarrayPart02Test024
     * @tc.desc Verify subarray(-100) negative out-of-bounds normalized to 0, first element correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(11, 22, 33, 44, 55);
      let view: Int8Array = src.subarray(-100);
      let actualFirstElement: number = view[0];
      let expectedFirstElement: int = 11;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_2500
     * @tc.name int8ArraySubarrayPart02Test025
     * @tc.desc Verify subarray view containing boundary element 127 value correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(127, 1, 2);
      let view: Int8Array = src.subarray(0, 1);
      let actualFirstElement: number = view[0];
      let expectedFirstElement: number = INT8_MAX;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_2600
     * @tc.name int8ArraySubarrayPart02Test026
     * @tc.desc Verify subarray view containing boundary element -128 value correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(-128, 1, 2);
      let view: Int8Array = src.subarray(0, 1);
      let actualFirstElement: number = view[0];
      let expectedFirstElement: number = INT8_MIN;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_2700
     * @tc.name int8ArraySubarrayPart02Test027
     * @tc.desc Verify subarray view shows truncated two hundred as negative fifty six
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = new Int8Array([200, 1, 2]);
      let view: Int8Array = src.subarray(0, 1);
      let actualFirstElement: number = view[0];
      let expectedFirstElement: int = -56;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_2800
     * @tc.name int8ArraySubarrayPart02Test028
     * @tc.desc Verify subarray() length equals src length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = src.subarray();
      let actualViewLength: int = view.length;
      let expectedViewLength: int = 5;
      expect(actualViewLength).assertEqual(expectedViewLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_2900
     * @tc.name int8ArraySubarrayPart02Test029
     * @tc.desc Verify subarray(1) length equals src length minus 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = src.subarray(1);
      let actualViewLength: int = view.length;
      let expectedViewLength: int = 4;
      expect(actualViewLength).assertEqual(expectedViewLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_3000
     * @tc.name int8ArraySubarrayPart02Test030
     * @tc.desc Verify subarray(1,3) length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = src.subarray(1, 3);
      let actualViewLength: int = view.length;
      let expectedViewLength: int = 2;
      expect(actualViewLength).assertEqual(expectedViewLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_3100
     * @tc.name int8ArraySubarrayPart02Test031
     * @tc.desc Verify subarray(0, 0) length equals 0 on an of()-created array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = src.subarray(0, 0);
      let actualViewLength: int = view.length;
      let expectedViewLength: int = 0;
      expect(actualViewLength).assertEqual(expectedViewLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_3200
     * @tc.name int8ArraySubarrayPart02Test032
     * @tc.desc Verify subarray(length) length equals 0 on an of()-created array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = src.subarray(5);
      let actualViewLength: int = view.length;
      let expectedViewLength: int = 0;
      expect(actualViewLength).assertEqual(expectedViewLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_3300
     * @tc.name int8ArraySubarrayPart02Test033
     * @tc.desc Verify subarray(-2) length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = src.subarray(-2);
      let actualViewLength: int = view.length;
      let expectedViewLength: int = 2;
      expect(actualViewLength).assertEqual(expectedViewLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_3400
     * @tc.name int8ArraySubarrayPart02Test034
     * @tc.desc Verify subarray(-2,-1) length equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = src.subarray(-2, -1);
      let actualViewLength: int = view.length;
      let expectedViewLength: int = 1;
      expect(actualViewLength).assertEqual(expectedViewLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_3500
     * @tc.name int8ArraySubarrayPart02Test035
     * @tc.desc Verify subarray(1,-1) length equals src length minus 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = src.subarray(1, -1);
      let actualViewLength: int = view.length;
      let expectedViewLength: int = 3;
      expect(actualViewLength).assertEqual(expectedViewLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_3600
     * @tc.name int8ArraySubarrayPart02Test036
     * @tc.desc Verify subarray(0, length+100) length clipped to src length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = src.subarray(0, 105);
      let actualViewLength: int = view.length;
      let expectedViewLength: int = 5;
      expect(actualViewLength).assertEqual(expectedViewLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_3700
     * @tc.name int8ArraySubarrayPart02Test037
     * @tc.desc Verify subarray(length, length+5) length equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = src.subarray(5, 10);
      let actualViewLength: int = view.length;
      let expectedViewLength: int = 0;
      expect(actualViewLength).assertEqual(expectedViewLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_3800
     * @tc.name int8ArraySubarrayPart02Test038
     * @tc.desc Verify subarray() byteOffset equals src byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = src.subarray();
      let actualByteOffset: int = view.byteOffset;
      let expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_3900
     * @tc.name int8ArraySubarrayPart02Test039
     * @tc.desc Verify subarray(1) byteOffset equals src byteOffset plus 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = src.subarray(1);
      let actualByteOffset: int = view.byteOffset;
      let expectedByteOffset: int = 1;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_4000
     * @tc.name int8ArraySubarrayPart02Test040
     * @tc.desc Verify subarray(2,4) byteOffset equals src byteOffset plus 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = src.subarray(2, 4);
      let actualByteOffset: int = view.byteOffset;
      let expectedByteOffset: int = 2;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_4100
     * @tc.name int8ArraySubarrayPart02Test041
     * @tc.desc Verify subarray(-2) byteOffset equals src byteOffset plus (src length minus 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = src.subarray(-2);
      let actualByteOffset: int = view.byteOffset;
      let expectedByteOffset: int = 3;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_4200
     * @tc.name int8ArraySubarrayPart02Test042
     * @tc.desc Verify subarray(length) byteOffset equals src byteOffset plus src length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = src.subarray(5);
      let actualByteOffset: int = view.byteOffset;
      let expectedByteOffset: int = 5;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_4300
     * @tc.name int8ArraySubarrayPart02Test043
     * @tc.desc Verify subarray(1) call does not change src length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      src.subarray(1);
      let actualSrcLength: int = src.length;
      let expectedSrcLength: int = 5;
      expect(actualSrcLength).assertEqual(expectedSrcLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_4400
     * @tc.name int8ArraySubarrayPart02Test044
     * @tc.desc Verify subarray(1,3) call does not change src first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      src.subarray(1, 3);
      let actualSrcFirstElement: number = src[0];
      let expectedSrcFirstElement: int = 10;
      expect(actualSrcFirstElement).assertEqual(expectedSrcFirstElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_4500
     * @tc.name int8ArraySubarrayPart02Test045
     * @tc.desc Verify subarray(1,3) call does not change src last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      src.subarray(1, 3);
      let actualSrcLastElement: number = src[4];
      let expectedSrcLastElement: int = 50;
      expect(actualSrcLastElement).assertEqual(expectedSrcLastElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_4600
     * @tc.name int8ArraySubarrayPart02Test046
     * @tc.desc Verify subarray(-2) call does not change src first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      src.subarray(-2);
      let actualSrcFirstElement: number = src[0];
      let expectedSrcFirstElement: int = 10;
      expect(actualSrcFirstElement).assertEqual(expectedSrcFirstElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_4800
     * @tc.name int8ArraySubarrayPart02Test048
     * @tc.desc Verify subarray(length) call does not change src elements one by one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      src.subarray(src.length);
      let actualSrcFourthElement: number = src[3];
      let expectedSrcFourthElement: int = 40;
      expect(actualSrcFourthElement).assertEqual(expectedSrcFourthElement);
      let actualSrcLastElement: number = src[4];
      let expectedSrcLastElement: int = 50;
      expect(actualSrcLastElement).assertEqual(expectedSrcLastElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_4900
     * @tc.name int8ArraySubarrayPart02Test049
     * @tc.desc Verify subarray().subarray() chained return is 1-byte typed array view sharing src buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = src.subarray().subarray();
      let actualBytesPerElement: int = view.BYTES_PER_ELEMENT;
      let expectedBytesPerElement: int = 1;
      expect(actualBytesPerElement).assertEqual(expectedBytesPerElement);
      let actualViewBuffer: ArrayBuffer = view.buffer;
      let expectedViewBuffer: ArrayBuffer = src.buffer;
      expect(actualViewBuffer).assertEqual(expectedViewBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_5000
     * @tc.name int8ArraySubarrayPart02Test050
     * @tc.desc Verify subarray(1).subarray(1) equivalent to subarray(2) first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = src.subarray(1).subarray(1);
      let actualFirstElement: number = view[0];
      let expectedFirstElement: int = 30;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_5100
     * @tc.name int8ArraySubarrayPart02Test051
     * @tc.desc Verify subarray(1,3).subarray(1) equivalent to subarray(2,3) element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = src.subarray(1, 3).subarray(1);
      let actualFirstElement: number = view[0];
      let expectedFirstElement: int = 30;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_5200
     * @tc.name int8ArraySubarrayPart02Test052
     * @tc.desc Verify subarray(0,2).subarray(0,1) element correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = src.subarray(0, 2).subarray(0, 1);
      let actualFirstElement: number = view[0];
      let expectedFirstElement: int = 10;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_5300
     * @tc.name int8ArraySubarrayPart02Test053
     * @tc.desc Verify subarray().subarray().subarray() triple chain length equals src length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = src.subarray().subarray().subarray();
      let actualViewLength: int = view.length;
      let expectedViewLength: int = 5;
      expect(actualViewLength).assertEqual(expectedViewLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_5400
     * @tc.name int8ArraySubarrayPart02Test054
     * @tc.desc Verify subarray(1).subarray(0,1) length equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = src.subarray(1).subarray(0, 1);
      let actualViewLength: int = view.length;
      let expectedViewLength: int = 1;
      expect(actualViewLength).assertEqual(expectedViewLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_5500
     * @tc.name int8ArraySubarrayPart02Test055
     * @tc.desc Verify subarray(-2).subarray(-1) first element equals src last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = src.subarray(-2).subarray(-1);
      let actualFirstElement: number = view[0];
      let expectedFirstElement: int = 50;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_6100
     * @tc.name int8ArraySubarrayPart02Test061
     * @tc.desc Verify offset-constructed view subarray byteOffset accumulates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let src: Int8Array = new Int8Array(buf, 2, 5);
      let view: Int8Array = src.subarray(1);
      let actualByteOffset: int = view.byteOffset;
      let expectedByteOffset: int = 3;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_6200
     * @tc.name int8ArraySubarrayPart02Test062
     * @tc.desc Verify offset-constructed view subarray(0) byteOffset equals src byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let src: Int8Array = new Int8Array(buf, 2, 5);
      let view: Int8Array = src.subarray(0);
      let actualByteOffset: int = view.byteOffset;
      let expectedByteOffset: int = 2;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_6800
     * @tc.name int8ArraySubarrayPart02Test068
     * @tc.desc Verify subarray(1) view length change does not affect src length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = src.subarray(1);
      let actualSrcLength: int = src.length;
      let expectedSrcLength: int = 5;
      expect(actualSrcLength).assertEqual(expectedSrcLength);
      let actualViewLength: int = view.length;
      let expectedViewLength: int = 4;
      expect(actualViewLength).assertEqual(expectedViewLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_6900
     * @tc.name int8ArraySubarrayPart02Test069
     * @tc.desc Verify subarray view element set keeps src byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = src.subarray(1, 3);
      view[0] = 99;
      let actualSrcByteLength: int = src.byteLength;
      let expectedSrcByteLength: int = 5;
      expect(actualSrcByteLength).assertEqual(expectedSrcByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_7000
     * @tc.name int8ArraySubarrayPart02Test070
     * @tc.desc Verify subarray(1,3) modify view element reflected in src index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = src.subarray(1, 3);
      view[0] = 50;
      let actualSrcSecondElement: number = src[1];
      let expectedSrcSecondElement: int = 50;
      expect(actualSrcSecondElement).assertEqual(expectedSrcSecondElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_7100
     * @tc.name int8ArraySubarrayPart02Test071
     * @tc.desc Verify subarray(2) modify view element to -128 reflected in src index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = src.subarray(2);
      view[0] = -128;
      let actualSrcThirdElement: number = src[2];
      let expectedSrcThirdElement: number = INT8_MIN;
      expect(actualSrcThirdElement).assertEqual(expectedSrcThirdElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_7200
     * @tc.name int8ArraySubarrayPart02Test072
     * @tc.desc Verify subarray() on empty buffer length equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = new Int8Array(new ArrayBuffer(0));
      let view: Int8Array = src.subarray();
      let actualViewLength: int = view.length;
      let expectedViewLength: int = 0;
      expect(actualViewLength).assertEqual(expectedViewLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART02_TEST_7300
     * @tc.name int8ArraySubarrayPart02Test073
     * @tc.desc Verify subarray() on empty buffer buffer same reference as src buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart02Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = new Int8Array(new ArrayBuffer(0));
      let view: Int8Array = src.subarray();
      let actualViewBuffer: ArrayBuffer = view.buffer;
      let expectedViewBuffer: ArrayBuffer = src.buffer;
      expect(actualViewBuffer).assertEqual(expectedViewBuffer);
    });
  });
}
