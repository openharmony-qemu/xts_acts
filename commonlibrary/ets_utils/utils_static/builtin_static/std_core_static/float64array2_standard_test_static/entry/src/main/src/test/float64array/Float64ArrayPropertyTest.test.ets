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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function Float64ArrayPropertyTest(): void {
  describe('Float64ArrayPropertyTest', (): void => {
    beforeAll((): void => {
    })

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    })

    afterEach((): void => {
    })

    afterAll((): void => {
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0010
     * @tc.name testFloat64ArrayProperty001
     * @tc.desc Verify 0-arg constructor sets length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array();
      const actualLength = arr.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0020
     * @tc.name testFloat64ArrayProperty002
     * @tc.desc Verify 0-arg constructor sets byteLength=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array();
      const actualByteLength = arr.byteLength;
      const expectedByteLength: int = 0;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0030
     * @tc.name testFloat64ArrayProperty003
     * @tc.desc Verify 0-arg constructor sets byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array();
      const actualByteOffset = arr.byteOffset;
      const expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0040
     * @tc.name testFloat64ArrayProperty004
     * @tc.desc Verify 0-arg constructor sets BYTES_PER_ELEMENT=8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array();
      const actualBytesPerElement = arr.BYTES_PER_ELEMENT;
      const expectedBytesPerElement: int = 8;
      expect(actualBytesPerElement).assertEqual(expectedBytesPerElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0050
     * @tc.name testFloat64ArrayProperty005
     * @tc.desc Verify 0-arg constructor sets name=Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array();
      const actualName = arr.name;
      const expectedName: string = 'Float64Array';
      expect(actualName).assertEqual(expectedName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0060
     * @tc.name testFloat64ArrayProperty006
     * @tc.desc Verify 0-arg constructor buffer.byteLength=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array();
      const actualByteLength = arr.buffer.byteLength;
      const expectedByteLength: int = 0;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0070
     * @tc.name testFloat64ArrayProperty007
     * @tc.desc Verify 1-arg number constructor length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(3);
      const actualLength = arr.length;
      const expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0080
     * @tc.name testFloat64ArrayProperty008
     * @tc.desc Verify 3-arg (buffer,byteOffset,length) sets length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const arr = new Float64Array(buf, 8, 2);
      const actualLength = arr.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      const actualByteOffset = arr.byteOffset;
      const expectedByteOffset: int = 8;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
      const actualByteLength = arr.byteLength;
      const expectedByteLength: int = 16;
      expect(actualByteLength).assertEqual(expectedByteLength);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0090
     * @tc.name testFloat64ArrayProperty009
     * @tc.desc Verify length=1 gives byteLength=8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(1);
      const actualLength = arr.length;
      const expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
      const actualByteLength = arr.byteLength;
      const expectedByteLength: int = 8;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0100
     * @tc.name testFloat64ArrayProperty010
     * @tc.desc Verify length=0 gives byteLength=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      const actualLength = arr.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
      const actualByteLength = arr.byteLength;
      const expectedByteLength: int = 0;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0110
     * @tc.name testFloat64ArrayProperty011
     * @tc.desc Verify length=1024 gives byteLength=8192
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(1024);
      const actualLength = arr.length;
      const expectedLength: int = 1024;
      expect(actualLength).assertEqual(expectedLength);
      const actualByteLength = arr.byteLength;
      const expectedByteLength: int = 8192;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0120
     * @tc.name testFloat64ArrayProperty012
     * @tc.desc Verify hex literal 0x10 gives length=16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0x10);
      const actualLength = arr.length;
      const expectedLength: int = 16;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0130
     * @tc.name testFloat64ArrayProperty013
     * @tc.desc Verify octal literal 0o10 gives length=8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0o10);
      const actualLength = arr.length;
      const expectedLength: int = 8;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0140
     * @tc.name testFloat64ArrayProperty014
     * @tc.desc Verify binary literal 0b100 gives length=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0b100);
      const actualLength = arr.length;
      const expectedLength: int = 4;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0150
     * @tc.name testFloat64ArrayProperty015
     * @tc.desc Verify scientific notation 1e1 gives length=10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(1e1);
      const actualLength = arr.length;
      const expectedLength: int = 10;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0160
     * @tc.name testFloat64ArrayProperty016
     * @tc.desc Verify length=-0 gives length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(-0);
      const actualLength = arr.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0170
     * @tc.name testFloat64ArrayProperty017
     * @tc.desc Verify length=NaN ToIndex to 0 gives length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(NaN);
      const actualLength = arr.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0180
     * @tc.name testFloat64ArrayProperty018
     * @tc.desc Verify length=-1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Float64Array(-1);
        expect().assertFail();
      } catch (e) {
        const actualName = e.name;
        const expectedName: string = 'RangeError';
        expect(actualName).assertEqual(expectedName);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0190
     * @tc.name testFloat64ArrayProperty019
     * @tc.desc Verify length=-2147483648 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Float64Array(-2147483648);
        expect().assertFail();
      } catch (e) {
        const actualName = e.name;
        const expectedName: string = 'RangeError';
        expect(actualName).assertEqual(expectedName);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0200
     * @tc.name testFloat64ArrayProperty020
     * @tc.desc Verify length=Infinity throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Float64Array(Infinity);
        expect().assertFail();
      } catch (e) {
        const actualName = e.name;
        const expectedName: string = 'RangeError';
        expect(actualName).assertEqual(expectedName);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0210
     * @tc.name testFloat64ArrayProperty021
     * @tc.desc Verify length=5 gives byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(5);
      const actualByteOffsetSecond = arr.byteOffset;
      const expectedByteOffsetSecond: int = 0;
      expect(actualByteOffsetSecond).assertEqual(expectedByteOffsetSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0220
     * @tc.name testFloat64ArrayProperty022
     * @tc.desc Verify length=6 gives buffer.byteLength=48
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(6);
      const actualByteLengthSecond = arr.buffer.byteLength;
      const expectedByteLengthSecond: int = 48;
      expect(actualByteLengthSecond).assertEqual(expectedByteLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0230
     * @tc.name testFloat64ArrayProperty023
     * @tc.desc Verify length=7 gives name=Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(7);
      const actualNameSecond = arr.name;
      const expectedNameSecond: string = 'Float64Array';
      expect(actualNameSecond).assertEqual(expectedNameSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0240
     * @tc.name testFloat64ArrayProperty024
     * @tc.desc Verify length=9 gives byteLength=length*8=72
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(9);
      const actualByteLengthSecond = arr.byteLength;
      const expectedByteLengthSecond: int = arr.length * 8;
      expect(actualByteLengthSecond).assertEqual(expectedByteLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0250
     * @tc.name testFloat64ArrayProperty025
     * @tc.desc Verify array source [1.0] gives length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0]);
      const actualLengthSecond = arr.length;
      const expectedLengthSecond: int = 1;
      expect(actualLengthSecond).assertEqual(expectedLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0260
     * @tc.name testFloat64ArrayProperty026
     * @tc.desc Verify array source [1.0,2.0] gives byteLength=16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0]);
      const actualByteLengthSecond = arr.byteLength;
      const expectedByteLengthSecond: int = 16;
      expect(actualByteLengthSecond).assertEqual(expectedByteLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0270
     * @tc.name testFloat64ArrayProperty027
     * @tc.desc Verify source [NaN] gives length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([NaN]);
      const actualLengthSecond = arr.length;
      const expectedLengthSecond: int = 1;
      expect(actualLengthSecond).assertEqual(expectedLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0280
     * @tc.name testFloat64ArrayProperty028
     * @tc.desc Verify source [Infinity] gives length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([Infinity]);
      const actualLengthSecond = arr.length;
      const expectedLengthSecond: int = 1;
      expect(actualLengthSecond).assertEqual(expectedLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0290
     * @tc.name testFloat64ArrayProperty029
     * @tc.desc Verify source [-Infinity] gives length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-Infinity]);
      const actualLengthSecond = arr.length;
      const expectedLengthSecond: int = 1;
      expect(actualLengthSecond).assertEqual(expectedLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0300
     * @tc.name testFloat64ArrayProperty030
     * @tc.desc Verify source [-0] gives length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-0]);
      const actualLengthSecond = arr.length;
      const expectedLengthSecond: int = 1;
      expect(actualLengthSecond).assertEqual(expectedLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0310
     * @tc.name testFloat64ArrayProperty031
     * @tc.desc Verify source [NaN,Infinity,-Infinity] gives length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([NaN, Infinity, -Infinity]);
      const actualLengthSecond = arr.length;
      const expectedLengthSecond: int = 3;
      expect(actualLengthSecond).assertEqual(expectedLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0320
     * @tc.name testFloat64ArrayProperty032
     * @tc.desc Verify source [0.1,0.2] gives length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 0.2]);
      const actualLengthSecond = arr.length;
      const expectedLengthSecond: int = 2;
      expect(actualLengthSecond).assertEqual(expectedLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0330
     * @tc.name testFloat64ArrayProperty033
     * @tc.desc Verify source 5 elements gives byteLength=40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const actualByteLengthSecond = arr.byteLength;
      const expectedByteLengthSecond: int = 40;
      expect(actualByteLengthSecond).assertEqual(expectedByteLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0340
     * @tc.name testFloat64ArrayProperty034
     * @tc.desc Verify source 10 elements gives byteLength=80
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]);
      const actualByteLengthSecond = arr.byteLength;
      const expectedByteLengthSecond: int = 80;
      expect(actualByteLengthSecond).assertEqual(expectedByteLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0350
     * @tc.name testFloat64ArrayProperty035
     * @tc.desc Verify Float64Array source [1.0,2.0,3.0] gives length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float64Array([1.0, 2.0, 3.0]);
      const arr = new Float64Array(src);
      const actualLengthSecond = arr.length;
      const expectedLengthSecond: int = 3;
      expect(actualLengthSecond).assertEqual(expectedLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0360
     * @tc.name testFloat64ArrayProperty036
     * @tc.desc Verify Float64Array source [1.0,2.0] gives byteLength=16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float64Array([1.0, 2.0]);
      const arr = new Float64Array(src);
      const actualByteLengthSecond = arr.byteLength;
      const expectedByteLengthSecond: int = 16;
      expect(actualByteLengthSecond).assertEqual(expectedByteLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0370
     * @tc.name testFloat64ArrayProperty037
     * @tc.desc Verify Float64Array source [1.0,2.0] gives byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float64Array([1.0, 2.0]);
      const arr = new Float64Array(src);
      const actualByteOffsetSecond = arr.byteOffset;
      const expectedByteOffsetSecond: int = 0;
      expect(actualByteOffsetSecond).assertEqual(expectedByteOffsetSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0380
     * @tc.name testFloat64ArrayProperty038
     * @tc.desc Verify Float64Array source buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float64Array([1.0]);
      const arr = new Float64Array(src);
      const actualByteLengthSecond = arr.buffer.byteLength;
      const expectedByteLengthSecond: int = 8;
      expect(actualByteLengthSecond).assertEqual(expectedByteLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0390
     * @tc.name testFloat64ArrayProperty039
     * @tc.desc Verify empty Float64Array source gives length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float64Array([]);
      const arr = new Float64Array(src);
      const actualLengthSecond = arr.length;
      const expectedLengthSecond: int = 0;
      expect(actualLengthSecond).assertEqual(expectedLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0400
     * @tc.name testFloat64ArrayProperty040
     * @tc.desc Verify buf 8 bytes gives length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(new ArrayBuffer(8));
      const actualLengthSecond = arr.length;
      const expectedLengthSecond: int = 1;
      expect(actualLengthSecond).assertEqual(expectedLengthSecond);
      const actualByteLengthSecond = arr.byteLength;
      const expectedByteLengthSecond: int = 8;
      expect(actualByteLengthSecond).assertEqual(expectedByteLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0410
     * @tc.name testFloat64ArrayProperty041
     * @tc.desc Verify buf 16 bytes gives length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(new ArrayBuffer(16));
      const actualLengthThird = arr.length;
      const expectedLengthThird: int = 2;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
      const actualByteLengthThird = arr.byteLength;
      const expectedByteLengthThird: int = 16;
      expect(actualByteLengthThird).assertEqual(expectedByteLengthThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0420
     * @tc.name testFloat64ArrayProperty042
     * @tc.desc Verify buf 0 bytes gives length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(new ArrayBuffer(0));
      const actualLengthThird = arr.length;
      const expectedLengthThird: int = 0;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
      const actualByteLengthThird = arr.byteLength;
      const expectedByteLengthThird: int = 0;
      expect(actualByteLengthThird).assertEqual(expectedByteLengthThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0430
     * @tc.name testFloat64ArrayProperty043
     * @tc.desc Verify buffer is shared reference same as input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float64Array(buf);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0440
     * @tc.name testFloat64ArrayProperty044
     * @tc.desc Verify buf 16 bytes gives byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(new ArrayBuffer(16));
      const actualByteOffsetThird = arr.byteOffset;
      const expectedByteOffsetThird: int = 0;
      expect(actualByteOffsetThird).assertEqual(expectedByteOffsetThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0450
     * @tc.name testFloat64ArrayProperty045
     * @tc.desc Verify buf 24 bytes gives byteLength=24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(new ArrayBuffer(24));
      const actualByteLengthThird = arr.byteLength;
      const expectedByteLengthThird: int = 24;
      expect(actualByteLengthThird).assertEqual(expectedByteLengthThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0460
     * @tc.name testFloat64ArrayProperty046
     * @tc.desc Verify buf 8 bytes gives name=Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(new ArrayBuffer(8));
      const actualNameThird = arr.name;
      const expectedNameThird: string = 'Float64Array';
      expect(actualNameThird).assertEqual(expectedNameThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0470
     * @tc.name testFloat64ArrayProperty047
     * @tc.desc Verify buf24 offset8 gives length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(new ArrayBuffer(24), 8);
      const actualLengthThird = arr.length;
      const expectedLengthThird: int = 2;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
      const actualByteOffsetThird = arr.byteOffset;
      const expectedByteOffsetThird: int = 8;
      expect(actualByteOffsetThird).assertEqual(expectedByteOffsetThird);
      const actualByteLengthThird = arr.byteLength;
      const expectedByteLengthThird: int = 16;
      expect(actualByteLengthThird).assertEqual(expectedByteLengthThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0480
     * @tc.name testFloat64ArrayProperty048
     * @tc.desc Verify buf16 offset0 gives length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(new ArrayBuffer(16), 0);
      const actualLengthThird = arr.length;
      const expectedLengthThird: int = 2;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
      const actualByteOffsetThird = arr.byteOffset;
      const expectedByteOffsetThird: int = 0;
      expect(actualByteOffsetThird).assertEqual(expectedByteOffsetThird);
      const actualByteLengthThird = arr.byteLength;
      const expectedByteLengthThird: int = 16;
      expect(actualByteLengthThird).assertEqual(expectedByteLengthThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0490
     * @tc.name testFloat64ArrayProperty049
     * @tc.desc Verify buf24 offset8 gives byteLength=16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(new ArrayBuffer(24), 8);
      const actualByteLengthThird = arr.byteLength;
      const expectedByteLengthThird: int = 16;
      expect(actualByteLengthThird).assertEqual(expectedByteLengthThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0500
     * @tc.name testFloat64ArrayProperty050
     * @tc.desc Verify buf16 offset8 shares reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float64Array(buf, 8);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0510
     * @tc.name testFloat64ArrayProperty051
     * @tc.desc Verify buf32 offset16 gives length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(new ArrayBuffer(32), 16);
      const actualLengthThird = arr.length;
      const expectedLengthThird: int = 2;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
      const actualByteOffsetThird = arr.byteOffset;
      const expectedByteOffsetThird: int = 16;
      expect(actualByteOffsetThird).assertEqual(expectedByteOffsetThird);
      const actualByteLengthThird = arr.byteLength;
      const expectedByteLengthThird: int = 16;
      expect(actualByteLengthThird).assertEqual(expectedByteLengthThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0520
     * @tc.name testFloat64ArrayProperty052
     * @tc.desc Verify buf32 offset0 len3 gives length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const arr = new Float64Array(buf, 0, 3);
      const actualLengthThird = arr.length;
      const expectedLengthThird: int = 3;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
      const actualByteLengthThird = arr.byteLength;
      const expectedByteLengthThird: int = 24;
      expect(actualByteLengthThird).assertEqual(expectedByteLengthThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0530
     * @tc.name testFloat64ArrayProperty053
     * @tc.desc Verify buf24 offset8 len2 gives byteLength=16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const arr = new Float64Array(buf, 8, 2);
      const actualLengthThird = arr.length;
      const expectedLengthThird: int = 2;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
      const actualByteLengthThird = arr.byteLength;
      const expectedByteLengthThird: int = 16;
      expect(actualByteLengthThird).assertEqual(expectedByteLengthThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0540
     * @tc.name testFloat64ArrayProperty054
     * @tc.desc Verify buf16 offset8 len1 gives length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float64Array(buf, 8, 1);
      const actualLengthThird = arr.length;
      const expectedLengthThird: int = 1;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
      const actualByteOffsetThird = arr.byteOffset;
      const expectedByteOffsetThird: int = 8;
      expect(actualByteOffsetThird).assertEqual(expectedByteOffsetThird);
      const actualByteLengthThird = arr.byteLength;
      const expectedByteLengthThird: int = 8;
      expect(actualByteLengthThird).assertEqual(expectedByteLengthThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0550
     * @tc.name testFloat64ArrayProperty055
     * @tc.desc Verify buf32 offset8 len0 gives length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const arr = new Float64Array(buf, 8, 0);
      const actualLengthThird = arr.length;
      const expectedLengthThird: int = 0;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
      const actualByteOffsetThird = arr.byteOffset;
      const expectedByteOffsetThird: int = 8;
      expect(actualByteOffsetThird).assertEqual(expectedByteOffsetThird);
      const actualByteLengthThird = arr.byteLength;
      const expectedByteLengthThird: int = 0;
      expect(actualByteLengthThird).assertEqual(expectedByteLengthThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0560
     * @tc.name testFloat64ArrayProperty056
     * @tc.desc Verify buf24 offset8 len2 shares buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const arr = new Float64Array(buf, 8, 2);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0570
     * @tc.name testFloat64ArrayProperty057
     * @tc.desc Verify buf16 offset0 len2 legitimate gives length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float64Array(buf, 0, 2);
      const actualLengthThird = arr.length;
      const expectedLengthThird: int = 2;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0580
     * @tc.name testFloat64ArrayProperty058
     * @tc.desc Verify of() 0-arg gives length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of();
      const actualLengthThird = arr.length;
      const expectedLengthThird: int = 0;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0590
     * @tc.name testFloat64ArrayProperty059
     * @tc.desc Verify of(1.0) gives length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0);
      const actualLengthThird = arr.length;
      const expectedLengthThird: int = 1;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0600
     * @tc.name testFloat64ArrayProperty060
     * @tc.desc Verify of(1.0,2.0,3.0) gives byteLength=24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0, 3.0);
      const actualByteLengthFourth = arr.byteLength;
      const expectedByteLengthFourth: int = 24;
      expect(actualByteLengthFourth).assertEqual(expectedByteLengthFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0610
     * @tc.name testFloat64ArrayProperty061
     * @tc.desc Verify of(NaN,Infinity) gives length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(NaN, Infinity);
      const actualLengthFourth = arr.length;
      const expectedLengthFourth: int = 2;
      expect(actualLengthFourth).assertEqual(expectedLengthFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0620
     * @tc.name testFloat64ArrayProperty062
     * @tc.desc Verify of(1.0) gives byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0);
      const actualByteOffsetFourth = arr.byteOffset;
      const expectedByteOffsetFourth: int = 0;
      expect(actualByteOffsetFourth).assertEqual(expectedByteOffsetFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0630
     * @tc.name testFloat64ArrayProperty063
     * @tc.desc Verify of(1.0,2.0) gives name=Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0);
      const actualNameFourth = arr.name;
      const expectedNameFourth: string = 'Float64Array';
      expect(actualNameFourth).assertEqual(expectedNameFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0640
     * @tc.name testFloat64ArrayProperty064
     * @tc.desc Verify from([]) gives length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.from([]);
      const actualLengthFourth = arr.length;
      const expectedLengthFourth: int = 0;
      expect(actualLengthFourth).assertEqual(expectedLengthFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0650
     * @tc.name testFloat64ArrayProperty065
     * @tc.desc Verify from([1.0,2.0,3.0,4.0]) gives byteLength=32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.from([1.0, 2.0, 3.0, 4.0]);
      const actualByteLengthFourth = arr.byteLength;
      const expectedByteLengthFourth: int = 32;
      expect(actualByteLengthFourth).assertEqual(expectedByteLengthFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0660
     * @tc.name testFloat64ArrayProperty066
     * @tc.desc Verify from([1.0]) buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.from([1.0]);
      const actualByteLengthFourth = arr.buffer.byteLength;
      const expectedByteLengthFourth: int = 8;
      expect(actualByteLengthFourth).assertEqual(expectedByteLengthFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0670
     * @tc.name testFloat64ArrayProperty067
     * @tc.desc Verify length and instance name for length constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(2);
      const actualLengthFourth = arr.length;
      const expectedLengthFourth: int = 2;
      expect(actualLengthFourth).assertEqual(expectedLengthFourth);
      const actualNameFourth = arr.name;
      const expectedNameFourth: string = 'Float64Array';
      expect(actualNameFourth).assertEqual(expectedNameFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0680
     * @tc.name testFloat64ArrayProperty068
     * @tc.desc Verify byteLength equals length * 8 for array constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const actualByteLengthFourth = arr.byteLength;
      const expectedByteLengthFourth: int = arr.length * Float64Array.BYTES_PER_ELEMENT;
      expect(actualByteLengthFourth).assertEqual(expectedByteLengthFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0690
     * @tc.name testFloat64ArrayProperty069
     * @tc.desc Verify byteLength equals length * 8 for length constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(5);
      const actualByteLengthFourth = arr.byteLength;
      const expectedByteLengthFourth: int = arr.length * 8;
      expect(actualByteLengthFourth).assertEqual(expectedByteLengthFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0700
     * @tc.name testFloat64ArrayProperty070
     * @tc.desc Verify byteOffset + byteLength = buffer.byteLength for array constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      expect(arr.byteOffset + arr.byteLength).assertEqual(arr.buffer.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0710
     * @tc.name testFloat64ArrayProperty071
     * @tc.desc Verify buffer is ArrayBuffer instance for array constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0]);
      const actualByteLengthFourth = arr.buffer.byteLength;
      const expectedByteLengthFourth: int = 16;
      expect(actualByteLengthFourth).assertEqual(expectedByteLengthFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0720
     * @tc.name testFloat64ArrayProperty072
     * @tc.desc Verify buffer byteLength for length constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(5);
      const actualByteLengthFourth = arr.buffer.byteLength;
      const expectedByteLengthFourth: int = 40;
      expect(actualByteLengthFourth).assertEqual(expectedByteLengthFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0730
     * @tc.name testFloat64ArrayProperty073
     * @tc.desc Verify of result buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const actualByteLengthFourth = arr.buffer.byteLength;
      const expectedByteLengthFourth: int = 16;
      expect(actualByteLengthFourth).assertEqual(expectedByteLengthFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0740
     * @tc.name testFloat64ArrayProperty074
     * @tc.desc Verify from result buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.from([1.0, 2.0, 3.0]);
      const actualByteLengthFourth = arr.buffer.byteLength;
      const expectedByteLengthFourth: int = 24;
      expect(actualByteLengthFourth).assertEqual(expectedByteLengthFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0750
     * @tc.name testFloat64ArrayProperty075
     * @tc.desc Verify subarray result length and byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sub: Float64Array = arr.subarray(1, 3);
      const actualLengthFourth = sub.length;
      const expectedLengthFourth: int = 2;
      expect(actualLengthFourth).assertEqual(expectedLengthFourth);
      const actualByteLengthFourth = sub.byteLength;
      const expectedByteLengthFourth: int = 16;
      expect(actualByteLengthFourth).assertEqual(expectedByteLengthFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0760
     * @tc.name testFloat64ArrayProperty076
     * @tc.desc Verify slice result length and byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const sl: Float64Array = arr.slice(0, 2);
      const actualLengthFourth = sl.length;
      const expectedLengthFourth: int = 2;
      expect(actualLengthFourth).assertEqual(expectedLengthFourth);
      const actualByteLengthFourth = sl.byteLength;
      const expectedByteLengthFourth: int = 16;
      expect(actualByteLengthFourth).assertEqual(expectedByteLengthFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0770
     * @tc.name testFloat64ArrayProperty077
     * @tc.desc Verify reverse changes values without changing view properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const arr: Float64Array = new Float64Array(buf, 8, 3);
      arr.$_set(0, 12.0);
      arr.$_set(1, 24.0);
      arr.$_set(2, 36.0);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(36.0);
      expect(arr.$_get(2)).assertEqual(12.0);
      expect(arr.length).assertEqual(3);
      expect(arr.byteLength).assertEqual(24);
      const actualByteOffsetFourth = arr.byteOffset;
      const expectedByteOffsetFourth: int = 8;
      expect(actualByteOffsetFourth).assertEqual(expectedByteOffsetFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0780
     * @tc.name testFloat64ArrayProperty078
     * @tc.desc Verify fill changes values without changing array properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([12.0, 24.0, 36.0]);
      arr.fill(48.0);
      expect(arr.$_get(0)).assertEqual(48.0);
      expect(arr.$_get(2)).assertEqual(48.0);
      expect(arr.length).assertEqual(3);
      expect(arr.byteLength).assertEqual(24);
      const actualByteLengthFourth = arr.buffer.byteLength;
      const expectedByteLengthFourth: int = 24;
      expect(actualByteLengthFourth).assertEqual(expectedByteLengthFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0790
     * @tc.name testFloat64ArrayProperty079
     * @tc.desc Verify byteLength equals length*8 for offset view (len 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const arr: Float64Array = new Float64Array(buf, 8, 3);
      const actualByteLengthFourth = arr.byteLength;
      const expectedByteLengthFourth: int = arr.length * 8;
      expect(actualByteLengthFourth).assertEqual(expectedByteLengthFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0800
     * @tc.name testFloat64ArrayProperty080
     * @tc.desc Verify offset view end equals its occupied buffer boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(48);
      const arr = new Float64Array(buf, 16, 3);
      expect(arr.byteOffset + arr.byteLength).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0810
     * @tc.name testFloat64ArrayProperty081
     * @tc.desc Verify complete view byteOffset=0 byteLength=buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const arr = new Float64Array(buf);
      const actualByteOffsetFourth = arr.byteOffset;
      const expectedByteOffsetFourth: int = 0;
      expect(actualByteOffsetFourth).assertEqual(expectedByteOffsetFourth);
      const actualByteLengthFourth = arr.byteLength;
      const expectedByteLengthFourth: int = 32;
      expect(actualByteLengthFourth).assertEqual(expectedByteLengthFourth);
      expect(arr.byteLength).assertEqual(buf.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0820
     * @tc.name testFloat64ArrayProperty082
     * @tc.desc Verify partial view byteOffset>0 byteLength<buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(48);
      const arr = new Float64Array(buf, 16, 2);
      const actualByteOffsetFifth = arr.byteOffset;
      const expectedByteOffsetFifth: int = 16;
      expect(actualByteOffsetFifth).assertEqual(expectedByteOffsetFifth);
      const actualByteLengthFifth = arr.byteLength;
      const expectedByteLengthFifth: int = 16;
      expect(actualByteLengthFifth).assertEqual(expectedByteLengthFifth);
      expect(arr.byteOffset + arr.byteLength).assertEqual(32);
      expect(buf.byteLength).assertEqual(48);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0830
     * @tc.name testFloat64ArrayProperty083
     * @tc.desc Verify single-element all property consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(1);
      const actualLengthFifth = arr.length;
      const expectedLengthFifth: int = 1;
      expect(actualLengthFifth).assertEqual(expectedLengthFifth);
      const actualByteLengthFifth = arr.byteLength;
      const expectedByteLengthFifth: int = 8;
      expect(actualByteLengthFifth).assertEqual(expectedByteLengthFifth);
      const actualByteOffsetFifth = arr.byteOffset;
      const expectedByteOffsetFifth: int = 0;
      expect(actualByteOffsetFifth).assertEqual(expectedByteOffsetFifth);
      const actualBytesPerElementSecond = arr.BYTES_PER_ELEMENT;
      const expectedBytesPerElementSecond: int = 8;
      expect(actualBytesPerElementSecond).assertEqual(expectedBytesPerElementSecond);
      const actualByteLengthSixth = arr.buffer.byteLength;
      const expectedByteLengthSixth: int = 8;
      expect(actualByteLengthSixth).assertEqual(expectedByteLengthSixth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0840
     * @tc.name testFloat64ArrayProperty084
     * @tc.desc Verify zero-length all property consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      const actualLengthFifth = arr.length;
      const expectedLengthFifth: int = 0;
      expect(actualLengthFifth).assertEqual(expectedLengthFifth);
      const actualByteLengthFifth = arr.byteLength;
      const expectedByteLengthFifth: int = 0;
      expect(actualByteLengthFifth).assertEqual(expectedByteLengthFifth);
      const actualByteOffsetFifth = arr.byteOffset;
      const expectedByteOffsetFifth: int = 0;
      expect(actualByteOffsetFifth).assertEqual(expectedByteOffsetFifth);
      const actualBytesPerElementSecond = arr.BYTES_PER_ELEMENT;
      const expectedBytesPerElementSecond: int = 8;
      expect(actualBytesPerElementSecond).assertEqual(expectedBytesPerElementSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0850
     * @tc.name testFloat64ArrayProperty085
     * @tc.desc Verify fill changes one instance without changing the other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Float64Array(3);
      const arr2 = new Float64Array(7);
      arr1.fill(12.0);
      expect(arr1.$_get(0)).assertEqual(12.0);
      expect(arr2.$_get(0)).assertEqual(0.0);
      const actualLengthFifth = arr1.length;
      const expectedLengthFifth: int = 3;
      expect(actualLengthFifth).assertEqual(expectedLengthFifth);
      const actualLengthSixth = arr2.length;
      const expectedLengthSixth: int = 7;
      expect(actualLengthSixth).assertEqual(expectedLengthSixth);
      const actualByteLengthFifth = arr1.byteLength;
      const expectedByteLengthFifth: int = 24;
      expect(actualByteLengthFifth).assertEqual(expectedByteLengthFifth);
      const actualByteLengthSixth = arr2.byteLength;
      const expectedByteLengthSixth: int = 56;
      expect(actualByteLengthSixth).assertEqual(expectedByteLengthSixth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0860
     * @tc.name testFloat64ArrayProperty086
     * @tc.desc Verify two instances share same BYTES_PER_ELEMENT and name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Float64Array(3);
      const arr2 = new Float64Array(7);
      const actualBytesPerElementSecond = arr1.BYTES_PER_ELEMENT;
      const expectedBytesPerElementSecond: int = 8;
      expect(actualBytesPerElementSecond).assertEqual(expectedBytesPerElementSecond);
      const actualBytesPerElementThird = arr2.BYTES_PER_ELEMENT;
      const expectedBytesPerElementThird: int = 8;
      expect(actualBytesPerElementThird).assertEqual(expectedBytesPerElementThird);
      const actualNameFifth = arr1.name;
      const expectedNameFifth: string = 'Float64Array';
      expect(actualNameFifth).assertEqual(expectedNameFifth);
      const actualNameSixth = arr2.name;
      const expectedNameSixth: string = 'Float64Array';
      expect(actualNameSixth).assertEqual(expectedNameSixth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0870
     * @tc.name testFloat64ArrayProperty087
     * @tc.desc Verify $_set changes an element without changing properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(5);
      const len = arr.length;
      const bl = arr.byteLength;
      arr.$_set(0, 100.0);
      expect(arr.$_get(0)).assertEqual(100.0);
      expect(arr.length).assertEqual(len);
      expect(arr.byteLength).assertEqual(bl);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0880
     * @tc.name testFloat64ArrayProperty088
     * @tc.desc Verify NaN array length byteLength name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([12.0, NaN, 36.0]);
      const actualLengthFifth = arr.length;
      const expectedLengthFifth: int = 3;
      expect(actualLengthFifth).assertEqual(expectedLengthFifth);
      const actualByteLengthFifth = arr.byteLength;
      const expectedByteLengthFifth: int = 24;
      expect(actualByteLengthFifth).assertEqual(expectedByteLengthFifth);
      const actualNameFifth = arr.name;
      const expectedNameFifth: string = 'Float64Array';
      expect(actualNameFifth).assertEqual(expectedNameFifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0890
     * @tc.name testFloat64ArrayProperty089
     * @tc.desc Verify ordinary values preserve array properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([12.0, 24.0, 36.0]);
      const actualLengthFifth = arr.length;
      const expectedLengthFifth: int = 3;
      expect(actualLengthFifth).assertEqual(expectedLengthFifth);
      const actualByteLengthFifth = arr.byteLength;
      const expectedByteLengthFifth: int = 24;
      expect(actualByteLengthFifth).assertEqual(expectedByteLengthFifth);
      const actualNameFifth = arr.name;
      const expectedNameFifth: string = 'Float64Array';
      expect(actualNameFifth).assertEqual(expectedNameFifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0900
     * @tc.name testFloat64ArrayProperty090
     * @tc.desc Verify default constructor all properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array();
      const actualLengthFifth = arr.length;
      const expectedLengthFifth: int = 0;
      expect(actualLengthFifth).assertEqual(expectedLengthFifth);
      const actualByteLengthFifth = arr.byteLength;
      const expectedByteLengthFifth: int = 0;
      expect(actualByteLengthFifth).assertEqual(expectedByteLengthFifth);
      const actualByteOffsetFifth = arr.byteOffset;
      const expectedByteOffsetFifth: int = 0;
      expect(actualByteOffsetFifth).assertEqual(expectedByteOffsetFifth);
      const actualBytesPerElementSecond = arr.BYTES_PER_ELEMENT;
      const expectedBytesPerElementSecond: int = 8;
      expect(actualBytesPerElementSecond).assertEqual(expectedBytesPerElementSecond);
      const actualNameFifth = arr.name;
      const expectedNameFifth: string = 'Float64Array';
      expect(actualNameFifth).assertEqual(expectedNameFifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0910
     * @tc.name testFloat64ArrayProperty091
     * @tc.desc Verify length constructor all properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(7);
      const actualLengthFifth = arr.length;
      const expectedLengthFifth: int = 7;
      expect(actualLengthFifth).assertEqual(expectedLengthFifth);
      const actualByteLengthFifth = arr.byteLength;
      const expectedByteLengthFifth: int = 56;
      expect(actualByteLengthFifth).assertEqual(expectedByteLengthFifth);
      const actualByteOffsetFifth = arr.byteOffset;
      const expectedByteOffsetFifth: int = 0;
      expect(actualByteOffsetFifth).assertEqual(expectedByteOffsetFifth);
      const actualBytesPerElementSecond = arr.BYTES_PER_ELEMENT;
      const expectedBytesPerElementSecond: int = 8;
      expect(actualBytesPerElementSecond).assertEqual(expectedBytesPerElementSecond);
      const actualNameFifth = arr.name;
      const expectedNameFifth: string = 'Float64Array';
      expect(actualNameFifth).assertEqual(expectedNameFifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0920
     * @tc.name testFloat64ArrayProperty092
     * @tc.desc Verify array literal constructor all properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const actualLengthFifth = arr.length;
      const expectedLengthFifth: int = 5;
      expect(actualLengthFifth).assertEqual(expectedLengthFifth);
      const actualByteLengthFifth = arr.byteLength;
      const expectedByteLengthFifth: int = 40;
      expect(actualByteLengthFifth).assertEqual(expectedByteLengthFifth);
      const actualByteOffsetFifth = arr.byteOffset;
      const expectedByteOffsetFifth: int = 0;
      expect(actualByteOffsetFifth).assertEqual(expectedByteOffsetFifth);
      const actualBytesPerElementSecond = arr.BYTES_PER_ELEMENT;
      const expectedBytesPerElementSecond: int = 8;
      expect(actualBytesPerElementSecond).assertEqual(expectedBytesPerElementSecond);
      const actualNameFifth = arr.name;
      const expectedNameFifth: string = 'Float64Array';
      expect(actualNameFifth).assertEqual(expectedNameFifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0930
     * @tc.name testFloat64ArrayProperty093
     * @tc.desc Verify copy constructor properties and copy isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Float64Array.of(12.0, 24.0, 36.0);
      const arr = new Float64Array(source);
      const actualLengthSeventh = arr.length;
      const expectedLengthSeventh: int = 3;
      expect(actualLengthSeventh).assertEqual(expectedLengthSeventh);
      const actualByteLengthSeventh = arr.byteLength;
      const expectedByteLengthSeventh: int = 24;
      expect(actualByteLengthSeventh).assertEqual(expectedByteLengthSeventh);
      const actualByteOffsetSixth = arr.byteOffset;
      const expectedByteOffsetSixth: int = 0;
      expect(actualByteOffsetSixth).assertEqual(expectedByteOffsetSixth);
      const actualBytesPerElementFourth = arr.BYTES_PER_ELEMENT;
      const expectedBytesPerElementFourth: int = 8;
      expect(actualBytesPerElementFourth).assertEqual(expectedBytesPerElementFourth);
      const actualNameSeventh = arr.name;
      const expectedNameSeventh: string = 'Float64Array';
      expect(actualNameSeventh).assertEqual(expectedNameSeventh);
      source.fill(48.0);
      expect(source.$_get(0)).assertEqual(48.0);
      expect(arr.$_get(0)).assertEqual(12.0);
      expect(arr.buffer).not().assertEqual(source.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0940
     * @tc.name testFloat64ArrayProperty094
     * @tc.desc Verify ArrayBuffer constructor all properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(new ArrayBuffer(48));
      const actualLengthSeventh = arr.length;
      const expectedLengthSeventh: int = 6;
      expect(actualLengthSeventh).assertEqual(expectedLengthSeventh);
      const actualByteLengthSeventh = arr.byteLength;
      const expectedByteLengthSeventh: int = 48;
      expect(actualByteLengthSeventh).assertEqual(expectedByteLengthSeventh);
      const actualByteOffsetSixth = arr.byteOffset;
      const expectedByteOffsetSixth: int = 0;
      expect(actualByteOffsetSixth).assertEqual(expectedByteOffsetSixth);
      const actualBytesPerElementFourth = arr.BYTES_PER_ELEMENT;
      const expectedBytesPerElementFourth: int = 8;
      expect(actualBytesPerElementFourth).assertEqual(expectedBytesPerElementFourth);
      const actualNameSeventh = arr.name;
      const expectedNameSeventh: string = 'Float64Array';
      expect(actualNameSeventh).assertEqual(expectedNameSeventh);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0950
     * @tc.name testFloat64ArrayProperty095
     * @tc.desc Verify ArrayBuffer+offset constructor all properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(new ArrayBuffer(96), 16);
      const actualLengthSeventh = arr.length;
      const expectedLengthSeventh: int = 10;
      expect(actualLengthSeventh).assertEqual(expectedLengthSeventh);
      const actualByteLengthSeventh = arr.byteLength;
      const expectedByteLengthSeventh: int = 80;
      expect(actualByteLengthSeventh).assertEqual(expectedByteLengthSeventh);
      const actualByteOffsetSixth = arr.byteOffset;
      const expectedByteOffsetSixth: int = 16;
      expect(actualByteOffsetSixth).assertEqual(expectedByteOffsetSixth);
      const actualBytesPerElementFourth = arr.BYTES_PER_ELEMENT;
      const expectedBytesPerElementFourth: int = 8;
      expect(actualBytesPerElementFourth).assertEqual(expectedBytesPerElementFourth);
      const actualNameSeventh = arr.name;
      const expectedNameSeventh: string = 'Float64Array';
      expect(actualNameSeventh).assertEqual(expectedNameSeventh);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0960
     * @tc.name testFloat64ArrayProperty096
     * @tc.desc Verify ArrayBuffer+offset+length constructor all properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(new ArrayBuffer(128), 32, 4);
      const actualLengthSeventh = arr.length;
      const expectedLengthSeventh: int = 4;
      expect(actualLengthSeventh).assertEqual(expectedLengthSeventh);
      const actualByteLengthSeventh = arr.byteLength;
      const expectedByteLengthSeventh: int = 32;
      expect(actualByteLengthSeventh).assertEqual(expectedByteLengthSeventh);
      const actualByteOffsetSixth = arr.byteOffset;
      const expectedByteOffsetSixth: int = 32;
      expect(actualByteOffsetSixth).assertEqual(expectedByteOffsetSixth);
      const actualBytesPerElementFourth = arr.BYTES_PER_ELEMENT;
      const expectedBytesPerElementFourth: int = 8;
      expect(actualBytesPerElementFourth).assertEqual(expectedBytesPerElementFourth);
      const actualNameSeventh = arr.name;
      const expectedNameSeventh: string = 'Float64Array';
      expect(actualNameSeventh).assertEqual(expectedNameSeventh);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0970
     * @tc.name testFloat64ArrayProperty097
     * @tc.desc Verify static of constructor all properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const actualLengthSeventh = arr.length;
      const expectedLengthSeventh: int = 4;
      expect(actualLengthSeventh).assertEqual(expectedLengthSeventh);
      const actualByteLengthSeventh = arr.byteLength;
      const expectedByteLengthSeventh: int = 32;
      expect(actualByteLengthSeventh).assertEqual(expectedByteLengthSeventh);
      const actualByteOffsetSixth = arr.byteOffset;
      const expectedByteOffsetSixth: int = 0;
      expect(actualByteOffsetSixth).assertEqual(expectedByteOffsetSixth);
      const actualBytesPerElementFourth = arr.BYTES_PER_ELEMENT;
      const expectedBytesPerElementFourth: int = 8;
      expect(actualBytesPerElementFourth).assertEqual(expectedBytesPerElementFourth);
      const actualNameSeventh = arr.name;
      const expectedNameSeventh: string = 'Float64Array';
      expect(actualNameSeventh).assertEqual(expectedNameSeventh);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0980
     * @tc.name testFloat64ArrayProperty098
     * @tc.desc Verify static from array constructor all properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.from([1.0, 2.0, 3.0]);
      const actualLengthSeventh = arr.length;
      const expectedLengthSeventh: int = 3;
      expect(actualLengthSeventh).assertEqual(expectedLengthSeventh);
      const actualByteLengthSeventh = arr.byteLength;
      const expectedByteLengthSeventh: int = 24;
      expect(actualByteLengthSeventh).assertEqual(expectedByteLengthSeventh);
      const actualByteOffsetSixth = arr.byteOffset;
      const expectedByteOffsetSixth: int = 0;
      expect(actualByteOffsetSixth).assertEqual(expectedByteOffsetSixth);
      const actualBytesPerElementFourth = arr.BYTES_PER_ELEMENT;
      const expectedBytesPerElementFourth: int = 8;
      expect(actualBytesPerElementFourth).assertEqual(expectedBytesPerElementFourth);
      const actualNameSeventh = arr.name;
      const expectedNameSeventh: string = 'Float64Array';
      expect(actualNameSeventh).assertEqual(expectedNameSeventh);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_0990
     * @tc.name testFloat64ArrayProperty099
     * @tc.desc Verify subarray shares buffer and has correct byteOffset byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float64Array(16);
      const sub = parent.subarray(4, 12);
      expect(sub.buffer).assertEqual(parent.buffer);
      const actualByteOffsetSixth = sub.byteOffset;
      const expectedByteOffsetSixth: int = parent.byteOffset + 32;
      expect(actualByteOffsetSixth).assertEqual(expectedByteOffsetSixth);
      const actualByteLengthSeventh = sub.byteLength;
      const expectedByteLengthSeventh: int = 64;
      expect(actualByteLengthSeventh).assertEqual(expectedByteLengthSeventh);
      const actualLengthSeventh = sub.length;
      const expectedLengthSeventh: int = 8;
      expect(actualLengthSeventh).assertEqual(expectedLengthSeventh);
      const actualBytesPerElementFourth = sub.BYTES_PER_ELEMENT;
      const expectedBytesPerElementFourth: int = 8;
      expect(actualBytesPerElementFourth).assertEqual(expectedBytesPerElementFourth);
      const actualNameSeventh = sub.name;
      const expectedNameSeventh: string = 'Float64Array';
      expect(actualNameSeventh).assertEqual(expectedNameSeventh);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_1000
     * @tc.name testFloat64ArrayProperty100
     * @tc.desc Verify chained subarray properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float64Array(20);
      const sub1 = parent.subarray(4, 16);
      const sub2 = sub1.subarray(2, 8);
      expect(sub2.buffer).assertEqual(parent.buffer);
      const actualByteOffsetSixth = sub2.byteOffset;
      const expectedByteOffsetSixth: int = 48;
      expect(actualByteOffsetSixth).assertEqual(expectedByteOffsetSixth);
      const actualByteLengthSeventh = sub2.byteLength;
      const expectedByteLengthSeventh: int = 48;
      expect(actualByteLengthSeventh).assertEqual(expectedByteLengthSeventh);
      const actualLengthSeventh = sub2.length;
      const expectedLengthSeventh: int = 6;
      expect(actualLengthSeventh).assertEqual(expectedLengthSeventh);
      const actualBytesPerElementFourth = sub2.BYTES_PER_ELEMENT;
      const expectedBytesPerElementFourth: int = 8;
      expect(actualBytesPerElementFourth).assertEqual(expectedBytesPerElementFourth);
      const actualNameSeventh = sub2.name;
      const expectedNameSeventh: string = 'Float64Array';
      expect(actualNameSeventh).assertEqual(expectedNameSeventh);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_1010
     * @tc.name testFloat64ArrayProperty101
     * @tc.desc Verify slice creates new buffer with byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float64Array(16);
      const sliced = parent.slice(4, 12);
      expect(sliced.buffer).not().assertEqual(parent.buffer);
      const actualByteOffsetSixth = sliced.byteOffset;
      const expectedByteOffsetSixth: int = 0;
      expect(actualByteOffsetSixth).assertEqual(expectedByteOffsetSixth);
      const actualByteLengthSeventh = sliced.byteLength;
      const expectedByteLengthSeventh: int = 64;
      expect(actualByteLengthSeventh).assertEqual(expectedByteLengthSeventh);
      const actualLengthSeventh = sliced.length;
      const expectedLengthSeventh: int = 8;
      expect(actualLengthSeventh).assertEqual(expectedLengthSeventh);
      const actualBytesPerElementFourth = sliced.BYTES_PER_ELEMENT;
      const expectedBytesPerElementFourth: int = 8;
      expect(actualBytesPerElementFourth).assertEqual(expectedBytesPerElementFourth);
      const actualNameSeventh = sliced.name;
      const expectedNameSeventh: string = 'Float64Array';
      expect(actualNameSeventh).assertEqual(expectedNameSeventh);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_1020
     * @tc.name testFloat64ArrayProperty102
     * @tc.desc Verify multiple views on same buffer have independent offsets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(256);
      const firstResult = new Float64Array(buf, 0, 8);
      const secondResult = new Float64Array(buf, 64, 8);
      const thirdResult = new Float64Array(buf, 128, 8);
      expect(firstResult.buffer).assertEqual(buf);
      expect(secondResult.buffer).assertEqual(buf);
      expect(thirdResult.buffer).assertEqual(buf);
      const actualByteOffsetSixth = firstResult.byteOffset;
      const expectedByteOffsetSixth: int = 0;
      expect(actualByteOffsetSixth).assertEqual(expectedByteOffsetSixth);
      const actualByteOffsetSeventh = secondResult.byteOffset;
      const expectedByteOffsetSeventh: int = 64;
      expect(actualByteOffsetSeventh).assertEqual(expectedByteOffsetSeventh);
      const actualByteOffsetEighth = thirdResult.byteOffset;
      const expectedByteOffsetEighth: int = 128;
      expect(actualByteOffsetEighth).assertEqual(expectedByteOffsetEighth);
      const actualLengthSeventh = firstResult.length;
      const expectedLengthSeventh: int = 8;
      expect(actualLengthSeventh).assertEqual(expectedLengthSeventh);
      const actualLengthEighth = secondResult.length;
      const expectedLengthEighth: int = 8;
      expect(actualLengthEighth).assertEqual(expectedLengthEighth);
      const actualLengthNinth = thirdResult.length;
      const expectedLengthNinth: int = 8;
      expect(actualLengthNinth).assertEqual(expectedLengthNinth);
      const actualBytesPerElementFourth = firstResult.BYTES_PER_ELEMENT;
      const expectedBytesPerElementFourth: int = 8;
      expect(actualBytesPerElementFourth).assertEqual(expectedBytesPerElementFourth);
      const actualBytesPerElementFifth = secondResult.BYTES_PER_ELEMENT;
      const expectedBytesPerElementFifth: int = 8;
      expect(actualBytesPerElementFifth).assertEqual(expectedBytesPerElementFifth);
      const actualBytesPerElementSixth = thirdResult.BYTES_PER_ELEMENT;
      const expectedBytesPerElementSixth: int = 8;
      expect(actualBytesPerElementSixth).assertEqual(expectedBytesPerElementSixth);
      const actualNameSeventh = firstResult.name;
      const expectedNameSeventh: string = 'Float64Array';
      expect(actualNameSeventh).assertEqual(expectedNameSeventh);
      const actualNameEighth = secondResult.name;
      const expectedNameEighth: string = 'Float64Array';
      expect(actualNameEighth).assertEqual(expectedNameEighth);
      const actualNameNinth = thirdResult.name;
      const expectedNameNinth: string = 'Float64Array';
      expect(actualNameNinth).assertEqual(expectedNameNinth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_1030
     * @tc.name testFloat64ArrayProperty103
     * @tc.desc Verify buffer from ArrayBuffer constructor equal to passed buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(128);
      const view1 = new Float64Array(buf, 0, 8);
      const view2 = new Float64Array(buf, 32, 4);
      expect(view1.buffer).assertEqual(buf);
      expect(view2.buffer).assertEqual(buf);
      const actualByteOffsetSixth = view1.byteOffset;
      const expectedByteOffsetSixth: int = 0;
      expect(actualByteOffsetSixth).assertEqual(expectedByteOffsetSixth);
      const actualByteOffsetSeventh = view2.byteOffset;
      const expectedByteOffsetSeventh: int = 32;
      expect(actualByteOffsetSeventh).assertEqual(expectedByteOffsetSeventh);
      const actualLengthSeventh = view1.length;
      const expectedLengthSeventh: int = 8;
      expect(actualLengthSeventh).assertEqual(expectedLengthSeventh);
      const actualLengthEighth = view2.length;
      const expectedLengthEighth: int = 4;
      expect(actualLengthEighth).assertEqual(expectedLengthEighth);
      const actualByteLengthSeventh = view1.byteLength;
      const expectedByteLengthSeventh: int = 64;
      expect(actualByteLengthSeventh).assertEqual(expectedByteLengthSeventh);
      const actualByteLengthEighth = view2.byteLength;
      const expectedByteLengthEighth: int = 32;
      expect(actualByteLengthEighth).assertEqual(expectedByteLengthEighth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_1040
     * @tc.name testFloat64ArrayProperty104
     * @tc.desc Verify byteOffset 8 boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(128);
      const arr = new Float64Array(buf, 8, 4);
      const actualByteOffsetSixth = arr.byteOffset;
      const expectedByteOffsetSixth: int = 8;
      expect(actualByteOffsetSixth).assertEqual(expectedByteOffsetSixth);
      const actualByteLengthSeventh = arr.byteLength;
      const expectedByteLengthSeventh: int = 32;
      expect(actualByteLengthSeventh).assertEqual(expectedByteLengthSeventh);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_1050
     * @tc.name testFloat64ArrayProperty105
     * @tc.desc Verify byteOffset 128 boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(1024);
      const arr = new Float64Array(buf, 128, 32);
      const actualByteOffsetSixth = arr.byteOffset;
      const expectedByteOffsetSixth: int = 128;
      expect(actualByteOffsetSixth).assertEqual(expectedByteOffsetSixth);
      const actualByteLengthSeventh = arr.byteLength;
      const expectedByteLengthSeventh: int = 256;
      expect(actualByteLengthSeventh).assertEqual(expectedByteLengthSeventh);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_1060
     * @tc.name testFloat64ArrayProperty106
     * @tc.desc Verify buffer.byteLength equals byteLength for direct array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(5);
      expect(arr.buffer.byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_1070
     * @tc.name testFloat64ArrayProperty107
     * @tc.desc Verify buffer from ArrayBuffer view equals passed buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const arr = new Float64Array(buf, 8, 2);
      expect(arr.buffer).assertEqual(buf);
      const actualByteOffsetSixth = arr.byteOffset;
      const expectedByteOffsetSixth: int = 8;
      expect(actualByteOffsetSixth).assertEqual(expectedByteOffsetSixth);
      const actualByteLengthSeventh = arr.byteLength;
      const expectedByteLengthSeventh: int = 16;
      expect(actualByteLengthSeventh).assertEqual(expectedByteLengthSeventh);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_1080
     * @tc.name testFloat64ArrayProperty108
     * @tc.desc Verify buffer from copy constructor is independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float64Array([1.0, 2.0]);
      const copied = new Float64Array(src);
      const actualByteLengthSeventh = copied.buffer.byteLength;
      const expectedByteLengthSeventh: int = 16;
      expect(actualByteLengthSeventh).assertEqual(expectedByteLengthSeventh);
      expect(copied.buffer).not().assertEqual(src.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_1090
     * @tc.name testFloat64ArrayProperty109
     * @tc.desc Verify buffer from FixedArray constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: FixedArray<number> = [1.0, 2.0];
      const arr = new Float64Array(numbers);
      const actualByteLengthSeventh = arr.buffer.byteLength;
      const expectedByteLengthSeventh: int = 16;
      expect(actualByteLengthSeventh).assertEqual(expectedByteLengthSeventh);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_1100
     * @tc.name testFloat64ArrayProperty110
     * @tc.desc Verify empty array buffer byteLength is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      const actualByteLengthSeventh = arr.buffer.byteLength;
      const expectedByteLengthSeventh: int = 0;
      expect(actualByteLengthSeventh).assertEqual(expectedByteLengthSeventh);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_1110
     * @tc.name testFloat64ArrayProperty111
     * @tc.desc Verify length stays unchanged after fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(10);
      const beforeLength = arr.length;
      arr.fill(48.0);
      expect(arr.$_get(0)).assertEqual(48.0);
      expect(arr.length).assertEqual(beforeLength);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_1120
     * @tc.name testFloat64ArrayProperty112
     * @tc.desc Verify byteLength stays unchanged after fill on offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(48);
      const arr = new Float64Array(buf, 16, 2);
      const beforeByteLength = arr.byteLength;
      arr.fill(48.0);
      expect(arr.$_get(1)).assertEqual(48.0);
      expect(arr.byteLength).assertEqual(beforeByteLength);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY_1130
     * @tc.name testFloat64ArrayProperty113
     * @tc.desc Verify byteOffset stays unchanged after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(48);
      const arr = new Float64Array(buf, 16, 2);
      arr.$_set(0, 12.0);
      arr.$_set(1, 24.0);
      const beforeByteOffset = arr.byteOffset;
      arr.copyWithin(0, 1);
      expect(arr.$_get(0)).assertEqual(24.0);
      expect(arr.byteOffset).assertEqual(beforeByteOffset);
      expect(arr.byteOffset).assertEqual(16);
    });

  })
}
