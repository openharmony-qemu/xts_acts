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
import Utils from '../Util.test';

export default function Float64ArrayConstructor2Test(): void {
  describe('Float64ArrayConstructor2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_0100
     * @tc.name testFloat64ArrayConstructor2001
     * @tc.desc Verify overload 2 length 1 single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const eightValue: number = 8;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(1);
      expect(arr.length).assertEqual(oneValue);
      expect(arr.byteLength).assertEqual(eightValue);
      expect(arr[0]).assertEqual(zeroPointZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_0200
     * @tc.name testFloat64ArrayConstructor2002
     * @tc.desc Verify overload 2 length 2 double elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const sixteenValue: number = 16;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(2);
      expect(arr.length).assertEqual(twoValue);
      expect(arr.byteLength).assertEqual(sixteenValue);
      expect(arr[0]).assertEqual(zeroPointZero);
      expect(arr[1]).assertEqual(zeroPointZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_0300
     * @tc.name testFloat64ArrayConstructor2003
     * @tc.desc Verify overload 2 length negative throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float64Array(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_0400
     * @tc.name testFloat64ArrayConstructor2004
     * @tc.desc Verify overload 2 length 2147483646 boundary before max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float64Array(2147483646);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_0500
     * @tc.name testFloat64ArrayConstructor2005
     * @tc.desc Verify overload 2 length -2147483647 boundary after min throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float64Array(-2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_0600
     * @tc.name testFloat64ArrayConstructor2006
     * @tc.desc Verify overload 2 length Infinity throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float64Array(Infinity);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_0700
     * @tc.name testFloat64ArrayConstructor2007
     * @tc.desc Verify overload 2 length -Infinity throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float64Array(-Infinity);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_0800
     * @tc.name testFloat64ArrayConstructor2008
     * @tc.desc Verify overload 2 return type Float64Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(3);
      const obj: Object = arr as Object;
      let isF64: boolean = false;
      if (obj instanceof Float64Array) {
        isF64 = true;
      }
      const expectVal = true;
      expect(isF64).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_0900
     * @tc.name testFloat64ArrayConstructor2009
     * @tc.desc Verify overload 2 return buffer is ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(3);
      const obj: Object = arr.buffer as Object;
      let isAB: boolean = false;
      if (obj instanceof ArrayBuffer) {
        isAB = true;
      }
      const expectVal = true;
      expect(isAB).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_1000
     * @tc.name testFloat64ArrayConstructor2010
     * @tc.desc Verify overload 2 return all elements initialized to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(4);
      expect(arr[0]).assertEqual(zeroPointZero);
      expect(arr[1]).assertEqual(zeroPointZero);
      expect(arr[2]).assertEqual(zeroPointZero);
      expect(arr[3]).assertEqual(zeroPointZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_1100
     * @tc.name testFloat64ArrayConstructor2011
     * @tc.desc Verify overload 2 length null throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nullLike: Object | null = null;
      try {
        new Float64Array(nullLike as Object as number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_1200
     * @tc.name testFloat64ArrayConstructor2012
     * @tc.desc Verify overload 6 two parameters normal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const sixteenValue: number = 16;
      const buf = new ArrayBuffer(16);
      const arr = new Float64Array(buf, 0);
      expect(arr.length).assertEqual(twoValue);
      expect(arr.byteLength).assertEqual(sixteenValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_1300
     * @tc.name testFloat64ArrayConstructor2013
     * @tc.desc Verify overload 6 buf is 8-byte ArrayBuffer single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const eightValue: number = 8;
      const buf = new ArrayBuffer(8);
      const arr = new Float64Array(buf, 0);
      expect(arr.length).assertEqual(oneValue);
      expect(arr.byteLength).assertEqual(eightValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_1400
     * @tc.name testFloat64ArrayConstructor2014
     * @tc.desc Verify overload 6 buf is 32-byte ArrayBuffer four elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourValue: number = 4;
      const thirtytwoValue: number = 32;
      const buf = new ArrayBuffer(32);
      const arr = new Float64Array(buf, 0);
      expect(arr.length).assertEqual(fourValue);
      expect(arr.byteLength).assertEqual(thirtytwoValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_1500
     * @tc.name testFloat64ArrayConstructor2015
     * @tc.desc Verify overload 6 buf is 64-byte ArrayBuffer eight elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightValue: number = 8;
      const sixtyfourValue: number = 64;
      const buf = new ArrayBuffer(64);
      const arr = new Float64Array(buf, 0);
      expect(arr.length).assertEqual(eightValue);
      expect(arr.byteLength).assertEqual(sixtyfourValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_1600
     * @tc.name testFloat64ArrayConstructor2016
     * @tc.desc Verify overload 6 buf is 1-byte ArrayBuffer non-8-multiple
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const buf = new ArrayBuffer(1);
      const arr = new Float64Array(buf, 0);
      const expectVal = zeroValue;
      expect(arr.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_1700
     * @tc.name testFloat64ArrayConstructor2017
     * @tc.desc Verify overload 6 buf is 7-byte ArrayBuffer non-8-multiple
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const buf = new ArrayBuffer(7);
      const arr = new Float64Array(buf, 0);
      const expectVal = zeroValue;
      expect(arr.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_1800
     * @tc.name testFloat64ArrayConstructor2018
     * @tc.desc Verify overload 6 buf is 15-byte ArrayBuffer non-8-multiple
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elemCount: number = 1;
      const elemTotalByte: number = 8;
      const bufferTotalByte: number = 15;
      const buf = new ArrayBuffer(bufferTotalByte);
      const arr = new Float64Array(buf, 0);
      expect(arr.length).assertEqual(elemCount);
      expect(arr.byteLength).assertEqual(elemTotalByte);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_1900
     * @tc.name testFloat64ArrayConstructor2019
     * @tc.desc Verify overload 6 buf is null throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nullLike: Object | null = null;
      try {
        new Float64Array(nullLike as Object as ArrayBuffer, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_2000
     * @tc.name testFloat64ArrayConstructor2020
     * @tc.desc Verify overload 6 buf is Array throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2, 3];
      try {
        new Float64Array(arr as Object as ArrayBuffer, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_2100
     * @tc.name testFloat64ArrayConstructor2021
     * @tc.desc Verify overload 6 buf is Float64Array throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float64Array(2);
      try {
        new Float64Array(src as Object as ArrayBuffer, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_2200
     * @tc.name testFloat64ArrayConstructor2022
     * @tc.desc Verify overload 6 byteOffset -1 negative throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        new Float64Array(buf, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_2300
     * @tc.name testFloat64ArrayConstructor2023
     * @tc.desc Verify overload 6 byteOffset 1 non-8-multiple throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        new Float64Array(buf, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_2400
     * @tc.name testFloat64ArrayConstructor2024
     * @tc.desc Verify overload 6 byteOffset exceeds buffer length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        new Float64Array(buf, 20);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_2500
     * @tc.name testFloat64ArrayConstructor2025
     * @tc.desc Verify overload 6 byteOffset 32 exceeds 16-byte buffer throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        new Float64Array(buf, 32);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_2600
     * @tc.name testFloat64ArrayConstructor2026
     * @tc.desc Verify overload 6 byteOffset Infinity throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        new Float64Array(buf, Infinity);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_2700
     * @tc.name testFloat64ArrayConstructor2027
     * @tc.desc Verify overload 6 byteOffset -Infinity throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        new Float64Array(buf, -Infinity);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_2800
     * @tc.name testFloat64ArrayConstructor2028
     * @tc.desc Verify overload 6 byteOffset INT_MAX huge offset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        new Float64Array(buf, 2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_2900
     * @tc.name testFloat64ArrayConstructor2029
     * @tc.desc Verify overload 6 byteOffset INT_MIN throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        new Float64Array(buf, -2147483648);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_3000
     * @tc.name testFloat64ArrayConstructor2030
     * @tc.desc Verify overload 6 return type Float64Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float64Array(buf, 0);
      const obj: Object = arr as Object;
      let isF64: boolean = false;
      if (obj instanceof Float64Array) {
        isF64 = true;
      }
      const expectVal = true;
      expect(isF64).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_3100
     * @tc.name testFloat64ArrayConstructor2031
     * @tc.desc Verify overload 6 return buffer shares same ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float64Array(buf, 0);
      const expectVal = buf;
      expect(arr.buffer).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_3200
     * @tc.name testFloat64ArrayConstructor2032
     * @tc.desc Verify overload 6 return all elements initialized to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const buf = new ArrayBuffer(16);
      const arr = new Float64Array(buf, 0);
      expect(arr[0]).assertEqual(zeroPointZero);
      expect(arr[1]).assertEqual(zeroPointZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_3300
     * @tc.name testFloat64ArrayConstructor2033
     * @tc.desc Verify overload 6 buffer sharing write to view affects original buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piApprox: number = 3.14;
      const buf = new ArrayBuffer(16);
      const arr = new Float64Array(buf, 0);
      arr[0] = 3.14;
      const view2 = new Float64Array(buf, 0);
      const expectVal = piApprox;
      expect(view2[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_3400
     * @tc.name testFloat64ArrayConstructor2034
     * @tc.desc Verify overload 6 buffer sharing offset view write affects original buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointsevenone: number = 2.71;
      const buf = new ArrayBuffer(24);
      const arr1 = new Float64Array(buf, 0);
      const arr2 = new Float64Array(buf, 8);
      arr2[0] = 2.71;
      const viewCheck = new Float64Array(buf, 8);
      const expectVal = twoPointsevenone;
      expect(viewCheck[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_3500
     * @tc.name testFloat64ArrayConstructor2035
     * @tc.desc Verify overload 6 buffer sharing multiple views share same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const arr1 = new Float64Array(buf, 0);
      const arr2 = new Float64Array(buf, 8);
      expect(arr1.buffer).assertEqual(buf);
      expect(arr2.buffer).assertEqual(buf);
      expect(arr1.buffer).assertEqual(arr2.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_3600
     * @tc.name testFloat64ArrayConstructor2036
     * @tc.desc Verify overload 10 three parameters normal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const sixteenValue: number = 16;
      const buf = new ArrayBuffer(24);
      const arr = new Float64Array(buf, 0, 2);
      expect(arr.length).assertEqual(twoValue);
      expect(arr.byteLength).assertEqual(sixteenValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_3700
     * @tc.name testFloat64ArrayConstructor2037
     * @tc.desc Verify constructor exception handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nullLike: Object | null = null;
      try {
        new Float64Array(nullLike as Object as ArrayBuffer, 0, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_3800
     * @tc.name testFloat64ArrayConstructor2038
     * @tc.desc Verify overload 10 buf is Array throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2, 3];
      try {
        new Float64Array(arr as Object as ArrayBuffer, 0, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_3900
     * @tc.name testFloat64ArrayConstructor2039
     * @tc.desc Verify overload 10 byteOffset -1 negative throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        new Float64Array(buf, -1, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_4000
     * @tc.name testFloat64ArrayConstructor2040
     * @tc.desc Verify overload 10 byteOffset 1 non-8-multiple throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        new Float64Array(buf, 1, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_4100
     * @tc.name testFloat64ArrayConstructor2041
     * @tc.desc Verify overload 10 byteOffset Infinity throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        new Float64Array(buf, Infinity, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_4200
     * @tc.name testFloat64ArrayConstructor2042
     * @tc.desc Verify overload 10 byteOffset -Infinity throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        new Float64Array(buf, -Infinity, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_4300
     * @tc.name testFloat64ArrayConstructor2043
     * @tc.desc Verify overload 10 byteOffset INT_MAX huge offset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        new Float64Array(buf, 2147483647, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_4400
     * @tc.name testFloat64ArrayConstructor2044
     * @tc.desc Verify overload 10 length negative throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        new Float64Array(buf, 0, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_4500
     * @tc.name testFloat64ArrayConstructor2045
     * @tc.desc Verify overload 10 length Infinity throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        new Float64Array(buf, 0, Infinity);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_4600
     * @tc.name testFloat64ArrayConstructor2046
     * @tc.desc Verify overload 10 length -Infinity throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        new Float64Array(buf, 0, -Infinity);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_4700
     * @tc.name testFloat64ArrayConstructor2047
     * @tc.desc Verify overload 10 length INT_MAX huge length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        new Float64Array(buf, 0, 2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_4800
     * @tc.name testFloat64ArrayConstructor2048
     * @tc.desc Verify overload 10 length INT_MIN throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        new Float64Array(buf, 0, -2147483648);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_4900
     * @tc.name testFloat64ArrayConstructor2049
     * @tc.desc Verify overload 10 length exceeds buffer remaining throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        new Float64Array(buf, 0, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_5000
     * @tc.name testFloat64ArrayConstructor2050
     * @tc.desc Verify overload 10 length exceeds buffer remaining offset then exceed throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(24);
        new Float64Array(buf, 8, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_5100
     * @tc.name testFloat64ArrayConstructor2051
     * @tc.desc Verify overload 10 return type Float64Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const arr = new Float64Array(buf, 0, 2);
      const obj: Object = arr as Object;
      let isF64: boolean = false;
      if (obj instanceof Float64Array) {
        isF64 = true;
      }
      const expectVal = true;
      expect(isF64).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_5200
     * @tc.name testFloat64ArrayConstructor2052
     * @tc.desc Verify overload 10 return buffer shares same ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const arr = new Float64Array(buf, 0, 2);
      const expectVal = buf;
      expect(arr.buffer).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_5300
     * @tc.name testFloat64ArrayConstructor2053
     * @tc.desc Verify overload 10 return all elements initialized to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const buf = new ArrayBuffer(16);
      const arr = new Float64Array(buf, 0, 2);
      expect(arr[0]).assertEqual(zeroPointZero);
      expect(arr[1]).assertEqual(zeroPointZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_5400
     * @tc.name testFloat64ArrayConstructor2054
     * @tc.desc Verify overload 10 buffer sharing write to view affects original buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piApprox: number = 3.14;
      const buf = new ArrayBuffer(16);
      const arr = new Float64Array(buf, 0, 2);
      arr[0] = 3.14;
      const view2 = new Float64Array(buf, 0, 2);
      const expectVal = piApprox;
      expect(view2[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_5500
     * @tc.name testFloat64ArrayConstructor2055
     * @tc.desc Verify overload 10 buffer sharing offset view write affects original buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointsevenone: number = 2.71;
      const buf = new ArrayBuffer(24);
      const arr1 = new Float64Array(buf, 0, 3);
      const arr2 = new Float64Array(buf, 8, 2);
      arr2[0] = 2.71;
      const viewCheck = new Float64Array(buf, 8, 2);
      const expectVal = twoPointsevenone;
      expect(viewCheck[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_5600
     * @tc.name testFloat64ArrayConstructor2056
     * @tc.desc Verify overload 10 buffer sharing multiple views share same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const arr1 = new Float64Array(buf, 0, 3);
      const arr2 = new Float64Array(buf, 8, 2);
      const arr3 = new Float64Array(buf, 16, 1);
      expect(arr1.buffer).assertEqual(buf);
      expect(arr2.buffer).assertEqual(buf);
      expect(arr3.buffer).assertEqual(buf);
      expect(arr1.buffer).assertEqual(arr2.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_5700
     * @tc.name testFloat64ArrayConstructor2057
     * @tc.desc Verify overload 10 buffer sharing parent child views cross write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointfourone: number = 1.41;
      const buf = new ArrayBuffer(24);
      const parent = new Float64Array(buf, 0, 3);
      const child = new Float64Array(buf, 8, 2);
      parent[1] = 1.41;
      const checkParent = new Float64Array(buf, 0, 3);
      const expectVal = onePointfourone;
      expect(checkParent[1]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_2_5800
     * @tc.name testFloat64ArrayConstructor2058
     * @tc.desc Verify overload 10 buffer sharing length limits view boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor2058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const sixteenValue: number = 16;
      const zeroPointZero: number = 0.0;
      const buf = new ArrayBuffer(32);
      const arr = new Float64Array(buf, 0, 2);
      expect(arr.length).assertEqual(twoValue);
      expect(arr.byteLength).assertEqual(sixteenValue);
      expect(arr[0]).assertEqual(zeroPointZero);
      expect(arr[1]).assertEqual(zeroPointZero);
    });

  })
}
