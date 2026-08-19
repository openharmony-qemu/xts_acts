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

export default function Float64ArrayProperty2Test(): void {
  describe('Float64ArrayProperty2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_0100
     * @tc.name testFloat64ArrayProperty2001
     * @tc.desc Verify static BYTES_PER_ELEMENT = 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const actualBytesPerElement = Float64Array.BYTES_PER_ELEMENT;
      const expectedBytesPerElement: int = 8;
      expect(actualBytesPerElement).assertEqual(expectedBytesPerElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_0200
     * @tc.name testFloat64ArrayProperty2002
     * @tc.desc Verify instance BYTES_PER_ELEMENT = 8 for array constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0]);
      const actualBytesPerElement = arr.BYTES_PER_ELEMENT;
      const expectedBytesPerElement: int = 8;
      expect(actualBytesPerElement).assertEqual(expectedBytesPerElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_0300
     * @tc.name testFloat64ArrayProperty2003
     * @tc.desc Verify instance BYTES_PER_ELEMENT = 8 for length constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(3);
      const actualBytesPerElement = arr.BYTES_PER_ELEMENT;
      const expectedBytesPerElement: int = 8;
      expect(actualBytesPerElement).assertEqual(expectedBytesPerElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_0400
     * @tc.name testFloat64ArrayProperty2004
     * @tc.desc Verify instance BYTES_PER_ELEMENT = 8 for buffer constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(new ArrayBuffer(8));
      const actualBytesPerElement = arr.BYTES_PER_ELEMENT;
      const expectedBytesPerElement: int = 8;
      expect(actualBytesPerElement).assertEqual(expectedBytesPerElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_0500
     * @tc.name testFloat64ArrayProperty2005
     * @tc.desc Verify instance BYTES_PER_ELEMENT = 8 for of constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0);
      const actualBytesPerElement = arr.BYTES_PER_ELEMENT;
      const expectedBytesPerElement: int = 8;
      expect(actualBytesPerElement).assertEqual(expectedBytesPerElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_0600
     * @tc.name testFloat64ArrayProperty2006
     * @tc.desc Verify instance BYTES_PER_ELEMENT = 8 for from constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.from([1.0]);
      const actualBytesPerElement = arr.BYTES_PER_ELEMENT;
      const expectedBytesPerElement: int = 8;
      expect(actualBytesPerElement).assertEqual(expectedBytesPerElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_0700
     * @tc.name testFloat64ArrayProperty2007
     * @tc.desc Verify name = Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const actualName = new Float64Array().name;
      const expectedName: string = 'Float64Array';
      expect(actualName).assertEqual(expectedName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_0800
     * @tc.name testFloat64ArrayProperty2008
     * @tc.desc Verify length=0 for empty array literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([]);
      const actualLength = arr.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_0900
     * @tc.name testFloat64ArrayProperty2009
     * @tc.desc Verify length=0 for length constructor 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      const actualLength = arr.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_1000
     * @tc.name testFloat64ArrayProperty2010
     * @tc.desc Verify length=1 for single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([5.0]);
      const actualLength = arr.length;
      const expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_1100
     * @tc.name testFloat64ArrayProperty2011
     * @tc.desc Verify length=3 for three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const actualLengthSecond = arr.length;
      const expectedLengthSecond: int = 3;
      expect(actualLengthSecond).assertEqual(expectedLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_1200
     * @tc.name testFloat64ArrayProperty2012
     * @tc.desc Verify length=4 for of 4 args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const actualLengthSecond = arr.length;
      const expectedLengthSecond: int = 4;
      expect(actualLengthSecond).assertEqual(expectedLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_1300
     * @tc.name testFloat64ArrayProperty2013
     * @tc.desc Verify length=3 for from 3-element source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.from([1.0, 2.0, 3.0]);
      const actualLengthSecond = arr.length;
      const expectedLengthSecond: int = 3;
      expect(actualLengthSecond).assertEqual(expectedLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_1400
     * @tc.name testFloat64ArrayProperty2014
     * @tc.desc Verify byteLength=0 for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([]);
      const actualByteLength = arr.byteLength;
      const expectedByteLength: int = 0;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_1500
     * @tc.name testFloat64ArrayProperty2015
     * @tc.desc Verify byteLength=8 for single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0]);
      const actualByteLength = arr.byteLength;
      const expectedByteLength: int = 8;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_1600
     * @tc.name testFloat64ArrayProperty2016
     * @tc.desc Verify byteLength=24 for three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const actualByteLength = arr.byteLength;
      const expectedByteLength: int = 24;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_1700
     * @tc.name testFloat64ArrayProperty2017
     * @tc.desc Verify byteLength=800 for 100 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(100);
      const actualByteLength = arr.byteLength;
      const expectedByteLength: int = 800;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_1800
     * @tc.name testFloat64ArrayProperty2018
     * @tc.desc Verify byteOffset=0 for default array constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const actualByteOffset = arr.byteOffset;
      const expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_1900
     * @tc.name testFloat64ArrayProperty2019
     * @tc.desc Verify byteOffset=0 for length constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(3);
      const actualByteOffset = arr.byteOffset;
      const expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_2000
     * @tc.name testFloat64ArrayProperty2020
     * @tc.desc Verify byteOffset=0 for of constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0);
      const actualByteOffset = arr.byteOffset;
      const expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_2100
     * @tc.name testFloat64ArrayProperty2021
     * @tc.desc Verify byteOffset=0 for from constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.from([1.0]);
      const actualByteOffset = arr.byteOffset;
      const expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_2200
     * @tc.name testFloat64ArrayProperty2022
     * @tc.desc Verify byteLength = length*8 for three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const actualByteLength = arr.byteLength;
      const expectedByteLength: int = arr.length * 8;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_2300
     * @tc.name testFloat64ArrayProperty2023
     * @tc.desc Verify byteLength = length*8 for zero elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([]);
      const actualByteLength = arr.byteLength;
      const expectedByteLength: int = arr.length * 8;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_2400
     * @tc.name testFloat64ArrayProperty2024
     * @tc.desc Verify byteLength = length*8 for single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0]);
      const actualByteLength = arr.byteLength;
      const expectedByteLength: int = arr.length * 8;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_2500
     * @tc.name testFloat64ArrayProperty2025
     * @tc.desc Verify byteLength = length*8 for 50 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(50);
      const actualByteLength = arr.byteLength;
      const expectedByteLength: int = arr.length * 8;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_2600
     * @tc.name testFloat64ArrayProperty2026
     * @tc.desc Verify byteLength = length * BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const actualByteLength = arr.byteLength;
      const expectedByteLength: int = arr.length * arr.BYTES_PER_ELEMENT;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_2700
     * @tc.name testFloat64ArrayProperty2027
     * @tc.desc Verify byteOffset+byteLength=buffer.byteLength for full view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      expect(arr.byteOffset + arr.byteLength).assertEqual(arr.buffer.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_2800
     * @tc.name testFloat64ArrayProperty2028
     * @tc.desc Verify subarray(1) byteOffset = 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const sub = arr.subarray(1);
      const actualByteOffset = sub.byteOffset;
      const expectedByteOffset: int = 8;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_2900
     * @tc.name testFloat64ArrayProperty2029
     * @tc.desc Verify length unchanged after $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const before = arr.length;
      arr.$_set(0, 5.0);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_3000
     * @tc.name testFloat64ArrayProperty2030
     * @tc.desc Verify length unchanged after fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const before = arr.length;
      arr.fill(9.0);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_3100
     * @tc.name testFloat64ArrayProperty2031
     * @tc.desc Verify length unchanged after sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([3.0, 1.0, 2.0]);
      const before = arr.length;
      arr.sort();
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_3200
     * @tc.name testFloat64ArrayProperty2032
     * @tc.desc Verify length unchanged after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const before = arr.length;
      arr.reverse();
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_3300
     * @tc.name testFloat64ArrayProperty2033
     * @tc.desc Verify length unchanged after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const before = arr.length;
      arr.copyWithin(0, 2, 4);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_3400
     * @tc.name testFloat64ArrayProperty2034
     * @tc.desc Verify byteLength unchanged after $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const before = arr.byteLength;
      arr.$_set(1, 5.0);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_3500
     * @tc.name testFloat64ArrayProperty2035
     * @tc.desc Verify byteLength unchanged after fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const before = arr.byteLength;
      arr.fill(7.0);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_3600
     * @tc.name testFloat64ArrayProperty2036
     * @tc.desc Verify byteLength unchanged after sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([3.0, 1.0, 2.0]);
      const before = arr.byteLength;
      arr.sort();
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_3700
     * @tc.name testFloat64ArrayProperty2037
     * @tc.desc Verify byteOffset unchanged after $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const before = arr.byteOffset;
      arr.$_set(0, 5.0);
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_3800
     * @tc.name testFloat64ArrayProperty2038
     * @tc.desc Verify byteOffset unchanged after fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const before = arr.byteOffset;
      arr.fill(7.0);
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_3900
     * @tc.name testFloat64ArrayProperty2039
     * @tc.desc Verify byteOffset unchanged after reverse for offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const arr = new Float64Array(buf, 8, 3);
      const before = arr.byteOffset;
      arr.reverse();
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_4000
     * @tc.name testFloat64ArrayProperty2040
     * @tc.desc Verify buffer reference unchanged after $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const before = arr.buffer;
      arr.$_set(0, 5.0);
      expect(arr.buffer).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_4100
     * @tc.name testFloat64ArrayProperty2041
     * @tc.desc Verify buffer reference unchanged after fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const before = arr.buffer;
      arr.fill(7.0);
      expect(arr.buffer).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_4200
     * @tc.name testFloat64ArrayProperty2042
     * @tc.desc Verify buffer reference unchanged after sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([3.0, 1.0, 2.0]);
      const before = arr.buffer;
      arr.sort();
      expect(arr.buffer).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_4300
     * @tc.name testFloat64ArrayProperty2043
     * @tc.desc Verify BYTES_PER_ELEMENT unchanged after fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      arr.fill(7.0);
      const actualBytesPerElementSecond = arr.BYTES_PER_ELEMENT;
      const expectedBytesPerElementSecond: int = 8;
      expect(actualBytesPerElementSecond).assertEqual(expectedBytesPerElementSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_4400
     * @tc.name testFloat64ArrayProperty2044
     * @tc.desc Verify all-same [2.0x6] byteLength=length*8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([2.0, 2.0, 2.0, 2.0, 2.0, 2.0]);
      const actualByteLengthSecond = arr.byteLength;
      const expectedByteLengthSecond: int = arr.length * 8;
      expect(actualByteLengthSecond).assertEqual(expectedByteLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_4500
     * @tc.name testFloat64ArrayProperty2045
     * @tc.desc Verify all-NaN has length=3 byteLength=24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([NaN, NaN, NaN]);
      const actualLengthThird = arr.length;
      const expectedLengthThird: int = 3;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
      const actualByteLengthSecond = arr.byteLength;
      const expectedByteLengthSecond: int = 24;
      expect(actualByteLengthSecond).assertEqual(expectedByteLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_4600
     * @tc.name testFloat64ArrayProperty2046
     * @tc.desc Verify subarray(-1) length=1 byteOffset=24 for 4-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sub = arr.subarray(-1);
      const actualLengthThird = sub.length;
      const expectedLengthThird: int = 1;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
      const actualByteOffsetSecond = sub.byteOffset;
      const expectedByteOffsetSecond: int = 24;
      expect(actualByteOffsetSecond).assertEqual(expectedByteOffsetSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_4700
     * @tc.name testFloat64ArrayProperty2047
     * @tc.desc Verify subarray(-length) wraps to full array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sub = arr.subarray(-4);
      const actualLengthThird = sub.length;
      const expectedLengthThird: int = 4;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_4800
     * @tc.name testFloat64ArrayProperty2048
     * @tc.desc Verify subarray(length) gives empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sub = arr.subarray(4);
      const actualLengthThird = sub.length;
      const expectedLengthThird: int = 0;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_4900
     * @tc.name testFloat64ArrayProperty2049
     * @tc.desc Verify subarray(large 999999) gives empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sub = arr.subarray(999999);
      const actualLengthThird = sub.length;
      const expectedLengthThird: int = 0;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_5000
     * @tc.name testFloat64ArrayProperty2050
     * @tc.desc Verify subarray(2,-1) gives length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sub = arr.subarray(2, -1);
      const actualLengthThird = sub.length;
      const expectedLengthThird: int = 1;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_5100
     * @tc.name testFloat64ArrayProperty2051
     * @tc.desc Verify subarray(-2,-1) gives length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sub = arr.subarray(-2, -1);
      const actualLengthThird = sub.length;
      const expectedLengthThird: int = 1;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
      const actualElement0 = sub.$_get(0);
      const expectedElement0: number = 3.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualByteOffsetSecond = sub.byteOffset;
      const expectedByteOffsetSecond: int = 16;
      expect(actualByteOffsetSecond).assertEqual(expectedByteOffsetSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_5200
     * @tc.name testFloat64ArrayProperty2052
     * @tc.desc Verify subarray(-1,-2) gives empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sub = arr.subarray(-1, -2);
      const actualLengthThird = sub.length;
      const expectedLengthThird: int = 0;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_5300
     * @tc.name testFloat64ArrayProperty2053
     * @tc.desc Verify subarray(-1) satisfies byteLength=length*8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sub = arr.subarray(-1);
      const actualByteLengthSecond = sub.byteLength;
      const expectedByteLengthSecond: int = sub.length * 8;
      expect(actualByteLengthSecond).assertEqual(expectedByteLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_5400
     * @tc.name testFloat64ArrayProperty2054
     * @tc.desc Verify slice(-1) length=1 byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sl = arr.slice(-1);
      const actualLengthThird = sl.length;
      const expectedLengthThird: int = 1;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
      const actualByteOffsetSecond = sl.byteOffset;
      const expectedByteOffsetSecond: int = 0;
      expect(actualByteOffsetSecond).assertEqual(expectedByteOffsetSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_5500
     * @tc.name testFloat64ArrayProperty2055
     * @tc.desc Verify slice(-length) gives full copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sl = arr.slice(-4);
      const actualLengthThird = sl.length;
      const expectedLengthThird: int = 4;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_5600
     * @tc.name testFloat64ArrayProperty2056
     * @tc.desc Verify slice(length) gives empty copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sl = arr.slice(4);
      const actualLengthThird = sl.length;
      const expectedLengthThird: int = 0;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_5700
     * @tc.name testFloat64ArrayProperty2057
     * @tc.desc Verify slice(large 999999) gives empty copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sl = arr.slice(999999);
      const actualLengthThird = sl.length;
      const expectedLengthThird: int = 0;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_5800
     * @tc.name testFloat64ArrayProperty2058
     * @tc.desc Verify slice(1,-1) gives length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sl = arr.slice(1, -1);
      const actualLengthThird = sl.length;
      const expectedLengthThird: int = 2;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
      const sharesSliceBuffer: boolean = sl.buffer === arr.buffer;
      expect(sharesSliceBuffer).assertFalse();
      expect(sl.$_get(0)).assertEqual(2.0);
      expect(sl.$_get(1)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_5900
     * @tc.name testFloat64ArrayProperty2059
     * @tc.desc Verify slice(2,1) gives empty copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sl = arr.slice(2, 1);
      const actualLengthThird = sl.length;
      const expectedLengthThird: int = 0;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
      expect(sl.byteLength).assertEqual(0);
      const sharesEmptySliceBuffer: boolean = sl.buffer === arr.buffer;
      expect(sharesEmptySliceBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_6000
     * @tc.name testFloat64ArrayProperty2060
     * @tc.desc Verify fill(start>end) no-op byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const before = arr.byteLength;
      arr.fill(9.0, 5, 2);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_6100
     * @tc.name testFloat64ArrayProperty2061
     * @tc.desc Verify fill negative start>end no-op byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const before = arr.byteOffset;
      arr.fill(9.0, -1, -2);
      expect(arr.byteOffset).assertEqual(before);
      expect(arr.$_get(0)).assertEqual(1.0);
      expect(arr.$_get(3)).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_6200
     * @tc.name testFloat64ArrayProperty2062
     * @tc.desc Verify fill(start=length) no-op length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      arr.fill(9.0, 4, 5);
      const actualLengthThird = arr.length;
      const expectedLengthThird: int = 4;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = 4.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_6300
     * @tc.name testFloat64ArrayProperty2063
     * @tc.desc Verify copyWithin(target=length) no-op length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      arr.copyWithin(4, 0, 1);
      const actualLengthThird = arr.length;
      const expectedLengthThird: int = 4;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_6400
     * @tc.name testFloat64ArrayProperty2064
     * @tc.desc Verify copyWithin(target>length) no-op byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const before = arr.byteLength;
      arr.copyWithin(5, 0, 1);
      expect(arr.byteLength).assertEqual(before);
      expect(arr.$_get(0)).assertEqual(1.0);
      expect(arr.$_get(3)).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_6500
     * @tc.name testFloat64ArrayProperty2065
     * @tc.desc Verify copyWithin(start=length) no-op byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const before = arr.byteOffset;
      arr.copyWithin(0, 4, 5);
      expect(arr.byteOffset).assertEqual(before);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = 4.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_6600
     * @tc.name testFloat64ArrayProperty2066
     * @tc.desc Verify copyWithin(start>end) no-op byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const before = arr.byteOffset;
      arr.copyWithin(0, 2, 1);
      expect(arr.byteOffset).assertEqual(before);
      const actualElement0Second = arr.$_get(0);
      const expectedElement0Second: number = 1.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement3Second = arr.$_get(3);
      const expectedElement3Second: number = 4.0;
      expect(actualElement3Second).assertEqual(expectedElement3Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_6700
     * @tc.name testFloat64ArrayProperty2067
     * @tc.desc Verify $_set(index=length) throws invalid index and preserves length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      try {
        arr.$_set(4, 9.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        const actualMessage = e.message;
        const expectedMessage: string = 'invalid index';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      const actualLengthFourth = arr.length;
      const expectedLengthFourth: int = 4;
      expect(actualLengthFourth).assertEqual(expectedLengthFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_6800
     * @tc.name testFloat64ArrayProperty2068
     * @tc.desc Verify $_set(index>length) throws invalid index and preserves byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const before = arr.byteLength;
      try {
        arr.$_set(5, 9.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        const actualMessage = e.message;
        const expectedMessage: string = 'invalid index';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      expect(arr.byteLength).assertEqual(before);
      expect(arr.$_get(0)).assertEqual(1.0);
      expect(arr.$_get(3)).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_6900
     * @tc.name testFloat64ArrayProperty2069
     * @tc.desc Verify $_set(negative index) throws invalid index and preserves byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const before = arr.byteOffset;
      try {
        arr.$_set(-1, 9.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        const actualMessage = e.message;
        const expectedMessage: string = 'invalid index';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      expect(arr.byteOffset).assertEqual(before);
      expect(arr.$_get(0)).assertEqual(1.0);
      expect(arr.$_get(3)).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_7000
     * @tc.name testFloat64ArrayProperty2070
     * @tc.desc Verify $_set(large 999999) throws invalid index and preserves byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const before = arr.byteLength;
      try {
        arr.$_set(999999, 9.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        const actualMessage = e.message;
        const expectedMessage: string = 'invalid index';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      expect(arr.byteLength).assertEqual(before);
      expect(arr.$_get(0)).assertEqual(1.0);
      expect(arr.$_get(3)).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_7100
     * @tc.name testFloat64ArrayProperty2071
     * @tc.desc Verify set offset=length throws RangeError length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      try {
        arr.set([1.0], 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const actualLengthFourth = arr.length;
      const expectedLengthFourth: int = 4;
      expect(actualLengthFourth).assertEqual(expectedLengthFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_7200
     * @tc.name testFloat64ArrayProperty2072
     * @tc.desc Verify set offset>length RangeError byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const before = arr.byteLength;
      try {
        arr.set([1.0], 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.byteLength).assertEqual(before);
      expect(arr.$_get(0)).assertEqual(1.0);
      expect(arr.$_get(3)).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_7300
     * @tc.name testFloat64ArrayProperty2073
     * @tc.desc Verify set negative offset RangeError buffer unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const before = arr.buffer;
      try {
        arr.set([1.0], -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.buffer).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_7400
     * @tc.name testFloat64ArrayProperty2074
     * @tc.desc Verify set large offset RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      try {
        arr.set([1.0], 999999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_7500
     * @tc.name testFloat64ArrayProperty2075
     * @tc.desc Verify with(index=length) RangeError length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      try {
        const r = arr.with(4, 9.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const actualLengthFourth = arr.length;
      const expectedLengthFourth: int = 4;
      expect(actualLengthFourth).assertEqual(expectedLengthFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_7600
     * @tc.name testFloat64ArrayProperty2076
     * @tc.desc Verify with(index>length) RangeError byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const before = arr.byteLength;
      try {
        const r = arr.with(5, 9.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_7700
     * @tc.name testFloat64ArrayProperty2077
     * @tc.desc Verify with(-length-1) RangeError byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const before = arr.byteOffset;
      try {
        const r = arr.with(-5, 9.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_7800
     * @tc.name testFloat64ArrayProperty2078
     * @tc.desc Verify with(large index) RangeError buffer unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const before = arr.buffer;
      try {
        const r = arr.with(999999, 9.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.buffer).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_7900
     * @tc.name testFloat64ArrayProperty2079
     * @tc.desc Verify map callback throw leaves length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      try {
        arr.map((v: number): number => {
          throw new Error();
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      const actualLengthFourth = arr.length;
      const expectedLengthFourth: int = 4;
      expect(actualLengthFourth).assertEqual(expectedLengthFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_8000
     * @tc.name testFloat64ArrayProperty2080
     * @tc.desc Verify filter callback throw leaves byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const before = arr.byteLength;
      try {
        arr.filter((v: number): boolean => {
          throw new Error();
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_8100
     * @tc.name testFloat64ArrayProperty2081
     * @tc.desc Verify sort comparator throw leaves buffer unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([3.0, 1.0, 2.0, 4.0]);
      const before = arr.buffer;
      try {
        arr.sort((a: number, b: number): int => {
          throw new Error();
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.buffer).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_8200
     * @tc.name testFloat64ArrayProperty2082
     * @tc.desc Verify find callback throw leaves byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const before = arr.byteLength;
      try {
        arr.find((v: number): boolean => {
          throw new Error();
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_8300
     * @tc.name testFloat64ArrayProperty2083
     * @tc.desc Verify forEach callback throw leaves byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const before = arr.byteLength;
      try {
        arr.forEach((v: number): void => {
          throw new Error();
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_8400
     * @tc.name testFloat64ArrayProperty2084
     * @tc.desc Verify normal positive business chain preserves property metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const revenue = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const active = revenue.filter((v: number): boolean => v >= 2.0).map((v: number): number => v * 10.0);
      const actualLengthFourth = active.length;
      const expectedLengthFourth: int = 3;
      expect(actualLengthFourth).assertEqual(expectedLengthFourth);
      const actualByteLengthThird = active.byteLength;
      const expectedByteLengthThird: int = 24;
      expect(actualByteLengthThird).assertEqual(expectedByteLengthThird);
      const actualByteOffsetThird = active.byteOffset;
      const expectedByteOffsetThird: int = 0;
      expect(actualByteOffsetThird).assertEqual(expectedByteOffsetThird);
      const actualElement0Second = active.$_get(0);
      const expectedElement0Second: number = 20.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_8500
     * @tc.name testFloat64ArrayProperty2085
     * @tc.desc Verify large length 1000 gives byteLength=8000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1000);
      const actualLengthFourth = arr.length;
      const expectedLengthFourth: int = 1000;
      expect(actualLengthFourth).assertEqual(expectedLengthFourth);
      const actualByteLengthThird = arr.byteLength;
      const expectedByteLengthThird: int = 8000;
      expect(actualByteLengthThird).assertEqual(expectedByteLengthThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_8600
     * @tc.name testFloat64ArrayProperty2086
     * @tc.desc Verify repeated BYTES_PER_ELEMENT reads return same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(5);
      const firstResult = arr.BYTES_PER_ELEMENT;
      const secondResult = arr.BYTES_PER_ELEMENT;
      const actualResultFourth = firstResult;
      const expectedResultFourth: number = 8;
      expect(actualResultFourth).assertEqual(expectedResultFourth);
      const actualResultFifth = secondResult;
      const expectedResultFifth: number = 8;
      expect(actualResultFifth).assertEqual(expectedResultFifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_8700
     * @tc.name testFloat64ArrayProperty2087
     * @tc.desc Verify repeated buffer reads return same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const arr = new Float64Array(buf, 8, 3);
      const b1 = arr.buffer;
      const b2 = arr.buffer;
      expect(b1).assertEqual(buf);
      expect(b2).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_8800
     * @tc.name testFloat64ArrayProperty2088
     * @tc.desc Verify repeated name reads return same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(1);
      const n1 = arr.name;
      const n2 = arr.name;
      const actualResultFourth = n1;
      const expectedResultFourth: string = 'Float64Array';
      expect(actualResultFourth).assertEqual(expectedResultFourth);
      const actualResultFifth = n2;
      const expectedResultFifth: string = 'Float64Array';
      expect(actualResultFifth).assertEqual(expectedResultFifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_8900
     * @tc.name testFloat64ArrayProperty2089
     * @tc.desc Verify byteLength = length * BYTES_PER_ELEMENT for 10-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(10);
      const actualByteLengthNinth = arr.byteLength;
      const expectedByteLengthNinth: int = arr.length * arr.BYTES_PER_ELEMENT;
      expect(actualByteLengthNinth).assertEqual(expectedByteLengthNinth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_9000
     * @tc.name testFloat64ArrayProperty2090
     * @tc.desc Verify property composition for buffer offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(128);
      const view = new Float64Array(buf, 24, 8);
      const actualByteOffsetNinth = view.byteOffset;
      const expectedByteOffsetNinth: int = 24;
      expect(actualByteOffsetNinth).assertEqual(expectedByteOffsetNinth);
      const actualByteLengthNinth = view.byteLength;
      const expectedByteLengthNinth: int = 64;
      expect(actualByteLengthNinth).assertEqual(expectedByteLengthNinth);
      const actualLengthTenth = view.length;
      const expectedLengthTenth: int = 8;
      expect(actualLengthTenth).assertEqual(expectedLengthTenth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_9100
     * @tc.name testFloat64ArrayProperty2091
     * @tc.desc Verify subarray property composition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float64Array(30);
      const child = parent.subarray(5, 20);
      const actualLengthTenth = child.length;
      const expectedLengthTenth: int = 15;
      expect(actualLengthTenth).assertEqual(expectedLengthTenth);
      const actualByteLengthNinth = child.byteLength;
      const expectedByteLengthNinth: int = 120;
      expect(actualByteLengthNinth).assertEqual(expectedByteLengthNinth);
      const actualByteOffsetNinth = child.byteOffset;
      const expectedByteOffsetNinth: int = 40;
      expect(actualByteOffsetNinth).assertEqual(expectedByteOffsetNinth);
      expect(child.buffer).assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_9200
     * @tc.name testFloat64ArrayProperty2092
     * @tc.desc Verify slice property composition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float64Array(30);
      const sliced = parent.slice(5, 20);
      const actualLengthTenth = sliced.length;
      const expectedLengthTenth: int = 15;
      expect(actualLengthTenth).assertEqual(expectedLengthTenth);
      const actualByteLengthNinth = sliced.byteLength;
      const expectedByteLengthNinth: int = 120;
      expect(actualByteLengthNinth).assertEqual(expectedByteLengthNinth);
      const actualByteOffsetNinth = sliced.byteOffset;
      const expectedByteOffsetNinth: int = 0;
      expect(actualByteOffsetNinth).assertEqual(expectedByteOffsetNinth);
      expect(sliced.buffer).not().assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_9300
     * @tc.name testFloat64ArrayProperty2093
     * @tc.desc Verify large array (1000) properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(1000);
      const actualLengthTenth = arr.length;
      const expectedLengthTenth: int = 1000;
      expect(actualLengthTenth).assertEqual(expectedLengthTenth);
      const actualByteLengthNinth = arr.byteLength;
      const expectedByteLengthNinth: int = 8000;
      expect(actualByteLengthNinth).assertEqual(expectedByteLengthNinth);
      const actualByteOffsetNinth = arr.byteOffset;
      const expectedByteOffsetNinth: int = 0;
      expect(actualByteOffsetNinth).assertEqual(expectedByteOffsetNinth);
      const actualBytesPerElementSeventh = arr.BYTES_PER_ELEMENT;
      const expectedBytesPerElementSeventh: int = 8;
      expect(actualBytesPerElementSeventh).assertEqual(expectedBytesPerElementSeventh);
      const actualNameTenth = arr.name;
      const expectedNameTenth: string = 'Float64Array';
      expect(actualNameTenth).assertEqual(expectedNameTenth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_9400
     * @tc.name testFloat64ArrayProperty2094
     * @tc.desc Verify huge array (10000) BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(10000);
      const actualBytesPerElementSeventh = arr.BYTES_PER_ELEMENT;
      const expectedBytesPerElementSeventh: int = 8;
      expect(actualBytesPerElementSeventh).assertEqual(expectedBytesPerElementSeventh);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_9500
     * @tc.name testFloat64ArrayProperty2095
     * @tc.desc Verify all property access does not throw on normal array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(5);
      const actualLengthTenth = arr.length;
      const expectedLengthTenth: int = 5;
      expect(actualLengthTenth).assertEqual(expectedLengthTenth);
      const actualByteLengthNinth = arr.byteLength;
      const expectedByteLengthNinth: int = 40;
      expect(actualByteLengthNinth).assertEqual(expectedByteLengthNinth);
      const actualByteOffsetNinth = arr.byteOffset;
      const expectedByteOffsetNinth: int = 0;
      expect(actualByteOffsetNinth).assertEqual(expectedByteOffsetNinth);
      const actualBytesPerElementSeventh = arr.BYTES_PER_ELEMENT;
      const expectedBytesPerElementSeventh: int = 8;
      expect(actualBytesPerElementSeventh).assertEqual(expectedBytesPerElementSeventh);
      const actualNameTenth = arr.name;
      const expectedNameTenth: string = 'Float64Array';
      expect(actualNameTenth).assertEqual(expectedNameTenth);
      const actualByteLengthTenth = arr.buffer.byteLength;
      const expectedByteLengthTenth: int = 40;
      expect(actualByteLengthTenth).assertEqual(expectedByteLengthTenth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_9600
     * @tc.name testFloat64ArrayProperty2096
     * @tc.desc Verify all property access does not throw on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array();
      const actualLengthTenth = arr.length;
      const expectedLengthTenth: int = 0;
      expect(actualLengthTenth).assertEqual(expectedLengthTenth);
      const actualByteLengthNinth = arr.byteLength;
      const expectedByteLengthNinth: int = 0;
      expect(actualByteLengthNinth).assertEqual(expectedByteLengthNinth);
      const actualByteOffsetNinth = arr.byteOffset;
      const expectedByteOffsetNinth: int = 0;
      expect(actualByteOffsetNinth).assertEqual(expectedByteOffsetNinth);
      const actualBytesPerElementSeventh = arr.BYTES_PER_ELEMENT;
      const expectedBytesPerElementSeventh: int = 8;
      expect(actualBytesPerElementSeventh).assertEqual(expectedBytesPerElementSeventh);
      const actualNameTenth = arr.name;
      const expectedNameTenth: string = 'Float64Array';
      expect(actualNameTenth).assertEqual(expectedNameTenth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_9700
     * @tc.name testFloat64ArrayProperty2097
     * @tc.desc Verify all property access does not throw on subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float64Array(10);
      const child = parent.subarray(5, 8);
      const actualLengthTenth = child.length;
      const expectedLengthTenth: int = 3;
      expect(actualLengthTenth).assertEqual(expectedLengthTenth);
      const actualByteLengthNinth = child.byteLength;
      const expectedByteLengthNinth: int = 24;
      expect(actualByteLengthNinth).assertEqual(expectedByteLengthNinth);
      const actualByteOffsetNinth = child.byteOffset;
      const expectedByteOffsetNinth: int = 40;
      expect(actualByteOffsetNinth).assertEqual(expectedByteOffsetNinth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_9800
     * @tc.name testFloat64ArrayProperty2098
     * @tc.desc Verify all property access does not throw on slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float64Array(10);
      const sliced = parent.slice(5, 8);
      const actualLengthTenth = sliced.length;
      const expectedLengthTenth: int = 3;
      expect(actualLengthTenth).assertEqual(expectedLengthTenth);
      const actualByteLengthNinth = sliced.byteLength;
      const expectedByteLengthNinth: int = 24;
      expect(actualByteLengthNinth).assertEqual(expectedByteLengthNinth);
      const actualByteOffsetNinth = sliced.byteOffset;
      const expectedByteOffsetNinth: int = 0;
      expect(actualByteOffsetNinth).assertEqual(expectedByteOffsetNinth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_PROPERTY2_9900
     * @tc.name testFloat64ArrayProperty2099
     * @tc.desc Verify all property access does not throw on large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayProperty2099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(100000);
      const actualLengthTenth = arr.length;
      const expectedLengthTenth: int = 100000;
      expect(actualLengthTenth).assertEqual(expectedLengthTenth);
      const actualByteLengthNinth = arr.byteLength;
      const expectedByteLengthNinth: int = 800000;
      expect(actualByteLengthNinth).assertEqual(expectedByteLengthNinth);
      const actualByteOffsetNinth = arr.byteOffset;
      const expectedByteOffsetNinth: int = 0;
      expect(actualByteOffsetNinth).assertEqual(expectedByteOffsetNinth);
    });

  })
}
