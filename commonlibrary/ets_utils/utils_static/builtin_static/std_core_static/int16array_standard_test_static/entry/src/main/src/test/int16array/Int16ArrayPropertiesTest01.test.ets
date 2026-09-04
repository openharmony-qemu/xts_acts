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

export default function Int16ArrayPropertiesTest01(): void {
  describe('Int16ArrayPropertiesTest01', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_0100
     * @tc.name testInt16ArrayPropertiesTestOne001
     * @tc.desc Verify new Int16Array(buf,intOffset) BYTES_PER_ELEMENT equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Int16Array(buf, 0);
      let actualBytesPerElement: int = arr.BYTES_PER_ELEMENT;
      let expectedBytesPerElement: int = 2;
      expect(actualBytesPerElement).assertEqual(expectedBytesPerElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_0200
     * @tc.name testInt16ArrayPropertiesTestOne002
     * @tc.desc Verify new Int16Array(buf,numberOffset) BYTES_PER_ELEMENT equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const offset: number = 0.0;
      const arr = new Int16Array(buf, offset);
      let actualBytesPerElement: int = arr.BYTES_PER_ELEMENT;
      let expectedBytesPerElement: int = 2;
      expect(actualBytesPerElement).assertEqual(expectedBytesPerElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_0300
     * @tc.name testInt16ArrayPropertiesTestOne003
     * @tc.desc Verify new Int16Array(buf,intOffset,intLength) BYTES_PER_ELEMENT equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Int16Array(buf, 0, 2);
      let actualBytesPerElement: int = arr.BYTES_PER_ELEMENT;
      let expectedBytesPerElement: int = 2;
      expect(actualBytesPerElement).assertEqual(expectedBytesPerElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_0400
     * @tc.name testInt16ArrayPropertiesTestOne004
     * @tc.desc Verify Int16Array.BYTES_PER_ELEMENT typed as int equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = Int16Array.BYTES_PER_ELEMENT;
      let expectedValue: int = 2;
      expect(val).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_0500
     * @tc.name testInt16ArrayPropertiesTestOne005
     * @tc.desc Verify Int16Array.from instance BYTES_PER_ELEMENT equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Int16Array.of(5, 6);
      const arr = Int16Array.from(src);
      let actualBytesPerElement: int = arr.BYTES_PER_ELEMENT;
      let expectedBytesPerElement: int = 2;
      expect(actualBytesPerElement).assertEqual(expectedBytesPerElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_0600
     * @tc.name testInt16ArrayPropertiesTestOne006
     * @tc.desc Verify new Int16Array() buffer is an empty ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array();
      let actualByteLength: int = arr.buffer.byteLength;
      let expectedByteLength: int = 0;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_0700
     * @tc.name testInt16ArrayPropertiesTestOne007
     * @tc.desc Verify new Int16Array(int) allocates exact buffer and view byte lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      let actualBufferByteLength: int = arr.buffer.byteLength;
      let expectedBufferByteLength: int = 6;
      expect(actualBufferByteLength).assertEqual(expectedBufferByteLength);
      let actualByteLength: int = arr.byteLength;
      let expectedByteLength: int = 6;
      expect(actualByteLength).assertEqual(expectedByteLength);
      let actualLength: int = arr.length;
      let expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_0800
     * @tc.name testInt16ArrayPropertiesTestOne008
     * @tc.desc Verify new Int16Array(number) buffer property is not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3.0);
      let actualByteLength: int = arr.buffer.byteLength;
      let expectedByteLength: int = arr.byteLength;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_0900
     * @tc.name testInt16ArrayPropertiesTestOne009
     * @tc.desc Verify new Int16Array(src) buffer is independent from source buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Int16Array.of(1, 2);
      const arr = new Int16Array(src);
      expect(arr.buffer).not().assertEqual(src.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_1000
     * @tc.name testInt16ArrayPropertiesTestOne010
     * @tc.desc Verify new Int16Array(buf,numberOffset) buffer same reference as buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const offset: number = 0.0;
      const arr = new Int16Array(buf, offset);
      let actualBuffer: ArrayBuffer = arr.buffer;
      let expectedBuffer: ArrayBuffer = buf;
      expect(actualBuffer).assertEqual(expectedBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_1100
     * @tc.name testInt16ArrayPropertiesTestOne011
     * @tc.desc Verify new Int16Array(zero ArrayBuffer) buffer.byteLength equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(0);
      const arr = new Int16Array(buf);
      let actualByteLength: int = arr.buffer.byteLength;
      let expectedByteLength: int = 0;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_1200
     * @tc.name testInt16ArrayPropertiesTestOne012
     * @tc.desc Verify new Int16Array() byteOffset equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array();
      let actualByteOffset: int = arr.byteOffset;
      let expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_1300
     * @tc.name testInt16ArrayPropertiesTestOne013
     * @tc.desc Verify new Int16Array(int length) byteOffset equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      let actualByteOffset: int = arr.byteOffset;
      let expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_1400
     * @tc.name testInt16ArrayPropertiesTestOne014
     * @tc.desc Verify Int16Array byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Int16Array.of(1, 2);
      const arr = new Int16Array(src);
      let actualByteOffset: int = arr.byteOffset;
      let expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_1500
     * @tc.name testInt16ArrayPropertiesTestOne015
     * @tc.desc Verify ArrayBuffer + undefined + undefined byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Int16Array(buf, undefined, undefined);
      let actualByteOffset: int = arr.byteOffset;
      let expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_1600
     * @tc.name testInt16ArrayPropertiesTestOne016
     * @tc.desc Verify int byteOffset = 0 byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const offset: int = 0;
      const arr = new Int16Array(buf, offset);
      let actualByteOffset: int = arr.byteOffset;
      let expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_1700
     * @tc.name testInt16ArrayPropertiesTestOne017
     * @tc.desc Verify Int16Array.of byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      let actualByteOffset: int = arr.byteOffset;
      let expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_1800
     * @tc.name testInt16ArrayPropertiesTestOne018
     * @tc.desc Verify Int16Array.from byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Int16Array.of(5, 6);
      const arr = Int16Array.from(src);
      let actualByteOffset: int = arr.byteOffset;
      let expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_1900
     * @tc.name testInt16ArrayPropertiesTestOne019
     * @tc.desc Verify ArrayBuffer + number byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const offset: number = 4.0;
      const arr = new Int16Array(buf, offset);
      let actualByteLength: int = arr.byteLength;
      let expectedByteLength: int = 4;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_2000
     * @tc.name testInt16ArrayPropertiesTestOne020
     * @tc.desc Verify length = 0 byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Int16Array(buf, 0, 0);
      let actualByteLength: int = arr.byteLength;
      let expectedByteLength: int = 0;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_2100
     * @tc.name testInt16ArrayPropertiesTestOne021
     * @tc.desc Verify length = 1 byteLength 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Int16Array(buf, 0, 1);
      let actualByteLength: int = arr.byteLength;
      let expectedByteLength: int = 2;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_2200
     * @tc.name testInt16ArrayPropertiesTestOne022
     * @tc.desc Verify number 3.7 3 byteLength 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(10);
      const length: number = 3.7;
      const arr = new Int16Array(buf, 0, length);
      let actualByteLength: int = arr.byteLength;
      let expectedByteLength: int = 6;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_2300
     * @tc.name testInt16ArrayPropertiesTestOne023
     * @tc.desc Verify Int16Array.of byteLength = length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20);
      let actualByteLength: int = arr.byteLength;
      let expectedByteLength: int = 4;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_2400
     * @tc.name testInt16ArrayPropertiesTestOne024
     * @tc.desc Verify Int16Array length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Int16Array.of(1, 2, 3, 4);
      const arr = new Int16Array(src);
      let actualLength: int = arr.length;
      let expectedLength: int = 4;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_2500
     * @tc.name testInt16ArrayPropertiesTestOne025
     * @tc.desc Verify ArrayBuffer + int length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Int16Array(buf, 0);
      let actualLength: int = arr.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_2600
     * @tc.name testInt16ArrayPropertiesTestOne026
     * @tc.desc Verify ArrayBuffer + number length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const offset: number = 2.0;
      const arr = new Int16Array(buf, offset);
      let actualLength: int = arr.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_2700
     * @tc.name testInt16ArrayPropertiesTestOne027
     * @tc.desc Verify ArrayBuffer + int + int length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf, 2, 2);
      let actualLength: int = arr.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_2800
     * @tc.name testInt16ArrayPropertiesTestOne028
     * @tc.desc Verify int length = 0 length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(0);
      let actualLength: int = arr.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_2900
     * @tc.name testInt16ArrayPropertiesTestOne029
     * @tc.desc Verify int length = 32767 int16 length 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(32767);
      let actualLength: int = arr.length;
      let expectedLength: int = 32767;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_3000
     * @tc.name testInt16ArrayPropertiesTestOne030
     * @tc.desc Verify Int16Array.of factory length equals element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30, 40);
      let actualLength: int = arr.length;
      let expectedLength: int = 4;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_3100
     * @tc.name testInt16ArrayPropertiesTestOne031
     * @tc.desc Verify Int16Array name 'Int16Array'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Int16Array.of(1, 2);
      const arr = new Int16Array(src);
      let actualName: string = arr.name;
      let expectedName: string = 'Int16Array';
      expect(actualName).assertEqual(expectedName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_3200
     * @tc.name testInt16ArrayPropertiesTestOne032
     * @tc.desc Verify empty arr.byteLength equals length times BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let expected: int = arr.length * Int16Array.BYTES_PER_ELEMENT;
      let actualByteLength: int = arr.byteLength;
      let expectedByteLength: int = expected;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_3300
     * @tc.name testInt16ArrayPropertiesTestOne033
     * @tc.desc Verify zero-length Int16Array buffer is not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let actualByteLength: int = arr.buffer.byteLength;
      let expectedBuffer: int = arr.byteLength;
      expect(actualByteLength).assertEqual(expectedBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_3400
     * @tc.name testInt16ArrayPropertiesTestOne034
     * @tc.desc Verify Int16Array.of buffer is not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2);
      let actualByteLength: int = arr.buffer.byteLength;
      let expectedBuffer: int = arr.byteLength;
      expect(actualByteLength).assertEqual(expectedBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_3500
     * @tc.name testInt16ArrayPropertiesTestOne035
     * @tc.desc Verify Int16Array.from buffer is not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1, 2, 3];
      let arr: Int16Array = Int16Array.from(src);
      let actualByteLength: int = arr.buffer.byteLength;
      let expectedBuffer: int = arr.byteLength;
      expect(actualByteLength).assertEqual(expectedBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_3600
     * @tc.name testInt16ArrayPropertiesTestOne036
     * @tc.desc Verify subarray view buffer shares parent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let child: Int16Array = parent.subarray(1, 3);
      let actualBuffer: ArrayBuffer = child.buffer;
      let expectedBuffer: ArrayBuffer = parent.buffer;
      expect(actualBuffer).assertEqual(expectedBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_3700
     * @tc.name testInt16ArrayPropertiesTestOne037
     * @tc.desc Verify shared buffer views see $_set writes via buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view1: Int16Array = new Int16Array(buf, 0);
      let view2: Int16Array = new Int16Array(buf, 0);
      view1.$_set(0, 99);
      let elementAt0: number = view2.$_get(0);
      let expectedElement0: int = 99;
      expect(elementAt0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_3800
     * @tc.name testInt16ArrayPropertiesTestOne038
     * @tc.desc Verify different byteOffset views on same buffer are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view1: Int16Array = new Int16Array(buf, 0, 2);
      let view2: Int16Array = new Int16Array(buf, 4, 2);
      view1.$_set(0, 10);
      view2.$_set(0, 20);
      let elementAt0: number = view1.$_get(0);
      let expectedElement0: int = 10;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt02: number = view2.$_get(0);
      let expectedElement02: int = 20;
      expect(elementAt02).assertEqual(expectedElement02);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_3900
     * @tc.name testInt16ArrayPropertiesTestOne039
     * @tc.desc Verify fill keeps the same buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let bufBefore: ArrayBuffer = arr.buffer;
      arr.fill(0);
      let actualBuffer: ArrayBuffer = arr.buffer;
      let expectedBuffer: ArrayBuffer = bufBefore;
      expect(actualBuffer).assertEqual(expectedBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_4000
     * @tc.name testInt16ArrayPropertiesTestOne040
     * @tc.desc Verify reverse keeps the same buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let bufBefore: ArrayBuffer = arr.buffer;
      arr.reverse();
      let actualBuffer: ArrayBuffer = arr.buffer;
      let expectedBuffer: ArrayBuffer = bufBefore;
      expect(actualBuffer).assertEqual(expectedBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_4100
     * @tc.name testInt16ArrayPropertiesTestOne041
     * @tc.desc Verify sort keeps the same buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([3, 1, 2]);
      let bufBefore: ArrayBuffer = arr.buffer;
      arr.sort();
      let actualBuffer: ArrayBuffer = arr.buffer;
      let expectedBuffer: ArrayBuffer = bufBefore;
      expect(actualBuffer).assertEqual(expectedBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_4200
     * @tc.name testInt16ArrayPropertiesTestOne042
     * @tc.desc Verify independent Int16Array instances have different buffer references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: Int16Array = new Int16Array([1, 2]);
      let arr2: Int16Array = new Int16Array([1, 2]);
      expect(arr1.buffer).not().assertEqual(arr2.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_4300
     * @tc.name testInt16ArrayPropertiesTestOne043
     * @tc.desc Verify independent Int16Array.of instances have different buffer references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: Int16Array = Int16Array.of(1, 2);
      let arr2: Int16Array = Int16Array.of(1, 2);
      expect(arr1.buffer).not().assertEqual(arr2.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_4400
     * @tc.name testInt16ArrayPropertiesTestOne044
     * @tc.desc Verify arr.byteOffset equals 0 for whole-buffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2]);
      let offset: int = arr.byteOffset;
      let expectedValue: int = 0;
      expect(offset).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_4500
     * @tc.name testInt16ArrayPropertiesTestOne045
     * @tc.desc Verify subarray(0) byteOffset equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int16Array = new Int16Array([1, 2, 3]);
      let child: Int16Array = parent.subarray(0);
      let actualByteOffset: int = child.byteOffset;
      let expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_4600
     * @tc.name testInt16ArrayPropertiesTestOne046
     * @tc.desc Verify $_set does not change byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let offsetBefore: int = arr.byteOffset;
      arr.$_set(0, 99);
      let actualByteOffset: int = arr.byteOffset;
      let expectedByteOffset: int = offsetBefore;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_4700
     * @tc.name testInt16ArrayPropertiesTestOne047
     * @tc.desc Verify zero-length Int16Array byteLength is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let actualByteLength: int = arr.byteLength;
      let expectedByteLength: int = 0;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_4800
     * @tc.name testInt16ArrayPropertiesTestOne048
     * @tc.desc Verify byteLength equals length times BYTES_PER_ELEMENT at offset zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(3);
      let actualByteLength: int = arr.byteLength;
      let expectedByteLength: int = 6;
      expect(actualByteLength).assertEqual(expectedByteLength);
      let actualByteOffset: int = arr.byteOffset;
      let expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
      let actualLength: int = arr.length;
      let expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
      let actualBufferByteLength: int = arr.buffer.byteLength;
      let expectedBufferByteLength: int = 6;
      expect(actualBufferByteLength).assertEqual(expectedBufferByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_4900
     * @tc.name testInt16ArrayPropertiesTestOne049
     * @tc.desc Verify Int16Array.of() empty call has byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of();
      let actualByteLength: int = arr.byteLength;
      let expectedByteLength: int = 0;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_5000
     * @tc.name testInt16ArrayPropertiesTestOne050
     * @tc.desc Verify Int16Array.from empty source has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [];
      let arr: Int16Array = Int16Array.from(src);
      let actualLength: int = arr.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_5100
     * @tc.name testInt16ArrayPropertiesTestOne051
     * @tc.desc Verify subarray(0, 2) length is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let child: Int16Array = parent.subarray(0, 2);
      let actualLength: int = child.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_5200
     * @tc.name testInt16ArrayPropertiesTestOne052
     * @tc.desc Verify fill does not change length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let lenBefore: int = arr.length;
      arr.fill(0);
      let actualLength: int = arr.length;
      let expectedLength: int = lenBefore;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_5300
     * @tc.name testInt16ArrayPropertiesTestOne053
     * @tc.desc Verify reverse does not change length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let lenBefore: int = arr.length;
      arr.reverse();
      let actualLength: int = arr.length;
      let expectedLength: int = lenBefore;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_5400
     * @tc.name testInt16ArrayPropertiesTestOne054
     * @tc.desc Verify sort does not change length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([3, 1, 2]);
      let lenBefore: int = arr.length;
      arr.sort();
      let actualLength: int = arr.length;
      let expectedLength: int = lenBefore;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_5500
     * @tc.name testInt16ArrayPropertiesTestOne055
     * @tc.desc Verify copyWithin does not change length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
      let lenBefore: int = arr.length;
      arr.copyWithin(0, 2);
      let actualLength: int = arr.length;
      let expectedLength: int = lenBefore;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_5600
     * @tc.name testInt16ArrayPropertiesTestOne056
     * @tc.desc Verify Int16Array.of() empty call has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of();
      let actualLength: int = arr.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_5700
     * @tc.name testInt16ArrayPropertiesTestOne057
     * @tc.desc Verify new Int16Array([]) length is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([]);
      let actualLength: int = arr.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_5800
     * @tc.name testInt16ArrayPropertiesTestOne058
     * @tc.desc Verify Int16Array instance name equals Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      let nameStr: string = arr.name;
      let expectedValue: string = 'Int16Array';
      expect(nameStr).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_5900
     * @tc.name testInt16ArrayPropertiesTestOne059
     * @tc.desc Verify $_set(-1) OOB write leaves length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      arr.$_set(0, 10);
      const lenBefore: int = arr.length;
      try {
        arr.$_set(-1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualLength: int = arr.length;
      let expectedLength: int = lenBefore;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_6000
     * @tc.name testInt16ArrayPropertiesTestOne060
     * @tc.desc Verify $_set(-1) OOB write leaves byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      arr.$_set(0, 10);
      const blBefore: int = arr.byteLength;
      try {
        arr.$_set(-1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualByteLength: int = arr.byteLength;
      let expectedByteLength: int = blBefore;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_6100
     * @tc.name testInt16ArrayPropertiesTestOne061
     * @tc.desc Verify $_set(-1) OOB write leaves byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      const boBefore: int = arr.byteOffset;
      try {
        arr.$_set(-1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualByteOffset: int = arr.byteOffset;
      let expectedByteOffset: int = boBefore;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_6200
     * @tc.name testInt16ArrayPropertiesTestOne062
     * @tc.desc Verify $_set(length) OOB write leaves length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      const lenBefore: int = arr.length;
      try {
        arr.$_set(lenBefore, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualLength: int = arr.length;
      let expectedLength: int = lenBefore;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_6300
     * @tc.name testInt16ArrayPropertiesTestOne063
     * @tc.desc Verify $_set(length) OOB write leaves byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      const blBefore: int = arr.byteLength;
      try {
        arr.$_set(arr.length, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualByteLength: int = arr.byteLength;
      let expectedByteLength: int = blBefore;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_6400
     * @tc.name testInt16ArrayPropertiesTestOne064
     * @tc.desc Verify $_set(length+1) OOB write leaves length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      const lenBefore: int = arr.length;
      try {
        arr.$_set(lenBefore + 1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualLength: int = arr.length;
      let expectedLength: int = lenBefore;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_6500
     * @tc.name testInt16ArrayPropertiesTestOne065
     * @tc.desc Verify $_set(length+1) OOB write leaves byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      const blBefore: int = arr.byteLength;
      try {
        arr.$_set(arr.length + 1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualByteLength: int = arr.byteLength;
      let expectedByteLength: int = blBefore;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_6600
     * @tc.name testInt16ArrayPropertiesTestOne066
     * @tc.desc Verify $_set(-length-1) OOB write leaves length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      const lenBefore: int = arr.length;
      try {
        arr.$_set(-arr.length - 1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualLength: int = arr.length;
      let expectedLength: int = lenBefore;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_6700
     * @tc.name testInt16ArrayPropertiesTestOne067
     * @tc.desc Verify $_set(-length-1) OOB write leaves byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      const blBefore: int = arr.byteLength;
      try {
        arr.$_set(-arr.length - 1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualByteLength: int = arr.byteLength;
      let expectedByteLength: int = blBefore;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_6800
     * @tc.name testInt16ArrayPropertiesTestOne068
     * @tc.desc Verify $_set(-length-1) OOB write keeps buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      const bufBefore: ArrayBuffer = arr.buffer;
      try {
        arr.$_set(-arr.length - 1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualBuffer: ArrayBuffer = arr.buffer;
      let expectedBuffer: ArrayBuffer = bufBefore;
      expect(actualBuffer).assertEqual(expectedBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_6900
     * @tc.name testInt16ArrayPropertiesTestOne069
     * @tc.desc Verify $_set(2147483647) OOB write leaves length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(2);
      const lenBefore: int = arr.length;
      try {
        arr.$_set(2147483647, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualLength: int = arr.length;
      let expectedLength: int = lenBefore;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_7000
     * @tc.name testInt16ArrayPropertiesTestOne070
     * @tc.desc Verify $_set(2147483647) OOB write leaves byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(2);
      const blBefore: int = arr.byteLength;
      try {
        arr.$_set(2147483647, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualByteLength: int = arr.byteLength;
      let expectedByteLength: int = blBefore;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_7100
     * @tc.name testInt16ArrayPropertiesTestOne071
     * @tc.desc Verify $_get(-1) throws RangeError and length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      const lenBefore: int = arr.length;
      try {
        arr.$_get(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualLength: int = arr.length;
      let expectedLength: int = lenBefore;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_7200
     * @tc.name testInt16ArrayPropertiesTestOne072
     * @tc.desc Verify $_get(-1) throws RangeError and byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      const blBefore: int = arr.byteLength;
      try {
        arr.$_get(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualByteLength: int = arr.byteLength;
      let expectedByteLength: int = blBefore;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_7300
     * @tc.name testInt16ArrayPropertiesTestOne073
     * @tc.desc Verify $_get(length) throws RangeError and length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      const lenBefore: int = arr.length;
      try {
        arr.$_get(lenBefore);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualLength: int = arr.length;
      let expectedLength: int = lenBefore;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_7400
     * @tc.name testInt16ArrayPropertiesTestOne074
     * @tc.desc Verify $_get(length) throws RangeError and byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      const boBefore: int = arr.byteOffset;
      try {
        arr.$_get(arr.length);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualByteOffset: int = arr.byteOffset;
      let expectedByteOffset: int = boBefore;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_ONE_7500
     * @tc.name testInt16ArrayPropertiesTestOne075
     * @tc.desc Verify $_get(length+1) throws RangeError and length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      const lenBefore: int = arr.length;
      try {
        arr.$_get(lenBefore + 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualLength: int = arr.length;
      let expectedLength: int = lenBefore;
      expect(actualLength).assertEqual(expectedLength);
    });
  });
}
