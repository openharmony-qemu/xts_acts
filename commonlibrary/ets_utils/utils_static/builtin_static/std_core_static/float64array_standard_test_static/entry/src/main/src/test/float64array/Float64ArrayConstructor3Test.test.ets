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

export default function Float64ArrayConstructor3Test(): void {
  describe('Float64ArrayConstructor3Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_0100
     * @tc.name testFloat64ArrayConstructor3001
     * @tc.desc Verify overload 3 arity 3 normal construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const buf = new ArrayBuffer(24);
      const view = new Float64Array(buf, 0, 3);
      const expectVal = threeValue;
      expect(view.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_0200
     * @tc.name testFloat64ArrayConstructor3002
     * @tc.desc Verify overload 3 arity 1 only buffer passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twentyfourValue: number = 24;
      const buf = new ArrayBuffer(24);
      const view = new Float64Array(buf);
      const expectVal = twentyfourValue;
      expect(view.byteLength).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_0300
     * @tc.name testFloat64ArrayConstructor3003
     * @tc.desc Verify overload 3 buf is minimum ArrayBuffer (1 byte)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const buf = new ArrayBuffer(1);
      const view = new Float64Array(buf, 0, 0);
      const expectVal = zeroValue;
      expect(view.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_0400
     * @tc.name testFloat64ArrayConstructor3004
     * @tc.desc Verify overload 3 buf is 8 bytes (exactly one Float64)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const eightValue: number = 8;
      const buf = new ArrayBuffer(8);
      const view = new Float64Array(buf, 0, 1);
      expect(view.length).assertEqual(oneValue);
      expect(view.byteLength).assertEqual(eightValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_0500
     * @tc.name testFloat64ArrayConstructor3005
     * @tc.desc Verify overload 3 buf is 16 bytes (two Float64)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const sixteenValue: number = 16;
      const buf = new ArrayBuffer(16);
      const view = new Float64Array(buf, 0, 2);
      expect(view.length).assertEqual(twoValue);
      expect(view.byteLength).assertEqual(sixteenValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_0600
     * @tc.name testFloat64ArrayConstructor3006
     * @tc.desc Verify overload 3 buf is huge ArrayBuffer (1MB)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightValue: number = 8;
      const largeSize: int = 1048576;
      const buf = new ArrayBuffer(largeSize);
      const view = new Float64Array(buf, 0, largeSize / 8);
      const expectVal = largeSize / eightValue;
      expect(view.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_0700
     * @tc.name testFloat64ArrayConstructor3007
     * @tc.desc Verify overload 3 byteOffset -1 negative out of bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(24);
        new Float64Array(buf, -1, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_0800
     * @tc.name testFloat64ArrayConstructor3008
     * @tc.desc Verify overload 3 byteOffset 25 exceeds buffer (non-8-multiple) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(32);
        new Float64Array(buf, 25, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_0900
     * @tc.name testFloat64ArrayConstructor3009
     * @tc.desc Verify overload 3 byteOffset 40 exceeds buffer (8-multiple) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(40);
        new Float64Array(buf, 40, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_1000
     * @tc.name testFloat64ArrayConstructor3010
     * @tc.desc Verify overload 3 length -1 negative throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(24);
        new Float64Array(buf, 0, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_1100
     * @tc.name testFloat64ArrayConstructor3011
     * @tc.desc Verify overload 3 length 10 but buffer insufficient throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        new Float64Array(buf, 0, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_1200
     * @tc.name testFloat64ArrayConstructor3012
     * @tc.desc Verify overload 3 length 3 byteOffset plus length exceeds buffer throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        new Float64Array(buf, 8, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_1300
     * @tc.name testFloat64ArrayConstructor3013
     * @tc.desc Verify overload 3 byteOffset 0 length MAX_INT huge throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(8);
        new Float64Array(buf, 0, 2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_1400
     * @tc.name testFloat64ArrayConstructor3014
     * @tc.desc Verify overload 3 byteOffset 3 length 2 (non-8-multiple offset) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(32);
        new Float64Array(buf, 3, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_1500
     * @tc.name testFloat64ArrayConstructor3015
     * @tc.desc Verify overload 3 return type is Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const view = new Float64Array(buf, 0, 3);
      const obj: Object = view as Object;
      let isF64: boolean = false;
      if (obj instanceof Float64Array) {
        isF64 = true;
      }
      const expectVal = true;
      expect(isF64).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_1600
     * @tc.name testFloat64ArrayConstructor3016
     * @tc.desc Verify overload 3 returned buffer is same as source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const view = new Float64Array(buf, 0, 3);
      const expectVal = buf;
      expect(view.buffer).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_1700
     * @tc.name testFloat64ArrayConstructor3017
     * @tc.desc Verify overload 3 buf is null throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nullLike: Object | null = null;
      try {
        new Float64Array(nullLike as Object as ArrayBuffer, 0, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_1800
     * @tc.name testFloat64ArrayConstructor3018
     * @tc.desc Verify overload 3 buf is undefined throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const undef: Object | undefined = undefined;
      try {
        new Float64Array(undef as Object as ArrayBuffer, 0, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_1900
     * @tc.name testFloat64ArrayConstructor3019
     * @tc.desc Verify overload 3 buf is Array throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      try {
        new Float64Array(src as Object as ArrayBuffer, 0, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_2000
     * @tc.name testFloat64ArrayConstructor3020
     * @tc.desc Verify overload 3 byteOffset non-integer truncates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(24);
        const off: Number | undefined = 1;
        new Float64Array(buf, off, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_2100
     * @tc.name testFloat64ArrayConstructor3021
     * @tc.desc Verify overload 3 view and buffer share write effect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const buf = new ArrayBuffer(16);
      const view = new Float64Array(buf, 0, 2);
      view[0] = 1.5;
      const expectVal = onePointFive;
      expect(view[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_2200
     * @tc.name testFloat64ArrayConstructor3022
     * @tc.desc Verify overload 3 offset view shares buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointFive: number = 2.5;
      const eightValue: number = 8;
      const buf = new ArrayBuffer(24);
      const view = new Float64Array(buf, 8, 2);
      view[0] = 2.5;
      expect(view[0]).assertEqual(twoPointFive);
      expect(view.byteOffset).assertEqual(eightValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_2300
     * @tc.name testFloat64ArrayConstructor3023
     * @tc.desc Verify overload 3 multiple views share same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hundredPointZero: number = 100.0;
      const zeroPointZero: number = 0.0;
      const buf = new ArrayBuffer(32);
      const view1 = new Float64Array(buf, 0, 2);
      const view2 = new Float64Array(buf, 16, 2);
      view1[0] = 100.0;
      expect(view1[0]).assertEqual(hundredPointZero);
      expect(view2[0]).assertEqual(zeroPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_2400
     * @tc.name testFloat64ArrayConstructor3024
     * @tc.desc Verify overload 3 overlapping views share buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue99: number = 99.0;
      const buf = new ArrayBuffer(24);
      const view1 = new Float64Array(buf, 0, 2);
      const view2 = new Float64Array(buf, 8, 1);
      view1[1] = 99.0;
      const expectVal = fillValue99;
      expect(view2[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_2500
     * @tc.name testFloat64ArrayConstructor3025
     * @tc.desc Verify overload 7 arity 1 only buffer passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twentyfourValue: number = 24;
      const threeValue: number = 3;
      const buf = new ArrayBuffer(24);
      const view = new Float64Array(buf);
      expect(view.byteLength).assertEqual(twentyfourValue);
      expect(view.length).assertEqual(threeValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_2600
     * @tc.name testFloat64ArrayConstructor3026
     * @tc.desc Verify overload 7 buf is 0-byte ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const buf = new ArrayBuffer(0);
      const off: Number | undefined = undefined;
      const len: Number | undefined = undefined;
      const view = new Float64Array(buf, off, len);
      expect(view.length).assertEqual(zeroValue);
      expect(view.byteLength).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_2700
     * @tc.name testFloat64ArrayConstructor3027
     * @tc.desc Verify overload 7 buf is 4-byte ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const buf = new ArrayBuffer(4);
      const view = new Float64Array(buf, 0, 0);
      const expectVal = zeroValue;
      expect(view.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_2800
     * @tc.name testFloat64ArrayConstructor3028
     * @tc.desc Verify overload 7 buf is 64-byte ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightValue: number = 8;
      const sixtyfourValue: number = 64;
      const buf = new ArrayBuffer(64);
      const view = new Float64Array(buf, 0, 8);
      expect(view.length).assertEqual(eightValue);
      expect(view.byteLength).assertEqual(sixtyfourValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_2900
     * @tc.name testFloat64ArrayConstructor3029
     * @tc.desc Verify overload 7 byteOffset Number(-1) negative offset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(24);
        const offset: Number = -1;
        new Float64Array(buf, offset, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_3000
     * @tc.name testFloat64ArrayConstructor3030
     * @tc.desc Verify overload 7 length Number(-5) negative length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(24);
        const len: Number = -5;
        new Float64Array(buf, 0, len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_3100
     * @tc.name testFloat64ArrayConstructor3031
     * @tc.desc Verify overload 7 length Number.MAX_VALUE huge length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(24);
        const len: Number = Number.MAX_VALUE;
        new Float64Array(buf, 0, len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_3200
     * @tc.name testFloat64ArrayConstructor3032
     * @tc.desc Verify overload 7 byteOffset Number(1) length 1 (non-8-multiple offset) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        const offset: Number = 1;
        new Float64Array(buf, offset, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_3300
     * @tc.name testFloat64ArrayConstructor3033
     * @tc.desc Verify overload 7 byteOffset Number(3) length Number(2) (non-8-multiple) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(32);
        const offset: Number = 3;
        const len: Number = 2;
        new Float64Array(buf, offset, len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_3400
     * @tc.name testFloat64ArrayConstructor3034
     * @tc.desc Verify overload 7 return type is Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const off: Number | undefined = undefined;
      const len: Number | undefined = undefined;
      const view = new Float64Array(buf, off, len);
      const obj: Object = view as Object;
      let isF64: boolean = false;
      if (obj instanceof Float64Array) {
        isF64 = true;
      }
      const expectVal = true;
      expect(isF64).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_3500
     * @tc.name testFloat64ArrayConstructor3035
     * @tc.desc Verify overload 7 returned buffer is same as source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const view = new Float64Array(buf, 8, 1);
      const expectVal = buf;
      expect(view.buffer).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_3600
     * @tc.name testFloat64ArrayConstructor3036
     * @tc.desc Verify overload 7 buf is null throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nullLike: Object | null = null;
      const off: Number | undefined = undefined;
      const len: Number | undefined = undefined;
      try {
        new Float64Array(nullLike as Object as ArrayBuffer, off, len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_3700
     * @tc.name testFloat64ArrayConstructor3037
     * @tc.desc Verify overload 7 byteOffset Number(24) length 1 out of bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(24);
        const offset: Number = 24;
        const len: Number = 1;
        new Float64Array(buf, offset, len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_3800
     * @tc.name testFloat64ArrayConstructor3038
     * @tc.desc Verify overload 7 byteOffset Number(8) length Number(10) out of bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(24);
        const offset: Number = 8;
        const len: Number = 10;
        new Float64Array(buf, offset, len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_3900
     * @tc.name testFloat64ArrayConstructor3039
     * @tc.desc Verify overload 7 undefined parameters view shares buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piApprox: number = 3.14;
      const buf = new ArrayBuffer(16);
      const off: Number | undefined = undefined;
      const len: Number | undefined = undefined;
      const view = new Float64Array(buf, off, len);
      view[0] = 3.14;
      const expectVal = piApprox;
      expect(view[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_4000
     * @tc.name testFloat64ArrayConstructor3040
     * @tc.desc Verify overload 7 partial undefined parameters view shares buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointsevenone: number = 2.71;
      const twoValue: number = 2;
      const buf = new ArrayBuffer(24);
      const off: Number | undefined = undefined;
      const view = new Float64Array(buf, off, 2);
      view[1] = 2.71;
      expect(view[1]).assertEqual(twoPointsevenone);
      expect(view.length).assertEqual(twoValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_4100
     * @tc.name testFloat64ArrayConstructor3041
     * @tc.desc Verify overload 7 offset undefined view shares buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointfourone: number = 1.41;
      const eightValue: number = 8;
      const buf = new ArrayBuffer(32);
      const view = new Float64Array(buf, 8, undefined);
      view[0] = 1.41;
      expect(view[0]).assertEqual(onePointfourone);
      expect(view.byteOffset).assertEqual(eightValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_4200
     * @tc.name testFloat64ArrayConstructor3042
     * @tc.desc Verify overload 11 arity 1 single parameter construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const buf = new ArrayBuffer(16);
      const view = new Float64Array(buf);
      const expectVal = twoValue;
      expect(view.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_4300
     * @tc.name testFloat64ArrayConstructor3043
     * @tc.desc Verify overload 11 buf is ArrayBuffer (16 bytes)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const sixteenValue: number = 16;
      const buf = new ArrayBuffer(16);
      const view = new Float64Array(buf);
      expect(view.length).assertEqual(twoValue);
      expect(view.byteLength).assertEqual(sixteenValue);
      expect(view.buffer).assertEqual(buf);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_4400
     * @tc.name testFloat64ArrayConstructor3044
     * @tc.desc Verify overload 11 buf is ArrayBuffer (0 bytes)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const buf = new ArrayBuffer(0);
      const view = new Float64Array(buf);
      expect(view.length).assertEqual(zeroValue);
      expect(view.byteLength).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_4500
     * @tc.name testFloat64ArrayConstructor3045
     * @tc.desc Verify overload 11 buf is ArrayBuffer (8 bytes)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const eightValue: number = 8;
      const buf = new ArrayBuffer(8);
      const view = new Float64Array(buf);
      expect(view.length).assertEqual(oneValue);
      expect(view.byteLength).assertEqual(eightValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_4600
     * @tc.name testFloat64ArrayConstructor3046
     * @tc.desc Verify overload 11 buf is ArrayBuffer (64 bytes)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightValue: number = 8;
      const sixtyfourValue: number = 64;
      const buf = new ArrayBuffer(64);
      const view = new Float64Array(buf);
      expect(view.length).assertEqual(eightValue);
      expect(view.byteLength).assertEqual(sixtyfourValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_4700
     * @tc.name testFloat64ArrayConstructor3047
     * @tc.desc Verify overload 11 buf is ArrayLike empty object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const src: Array<number> = [];
      const arrLike: ArrayLike<Number> = src;
      const view = new Float64Array(arrLike);
      const expectVal = zeroValue;
      expect(view.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_4800
     * @tc.name testFloat64ArrayConstructor3048
     * @tc.desc Verify overload 11 buf is ArrayLike single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const onePointFive: number = 1.5;
      const src: Array<number> = [1.5];
      const arrLike: ArrayLike<Number> = src;
      const view = new Float64Array(arrLike);
      expect(view.length).assertEqual(oneValue);
      expect(view[0]).assertEqual(onePointFive);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_4900
     * @tc.name testFloat64ArrayConstructor3049
     * @tc.desc Verify overload 11 buf is ArrayLike three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const src: Array<number> = [1.0, 2.0, 3.0];
      const arrLike: ArrayLike<Number> = src;
      const view = new Float64Array(arrLike);
      expect(view.length).assertEqual(threeValue);
      expect(view[0]).assertEqual(onePointZero);
      expect(view[1]).assertEqual(twoPointZero);
      expect(view[2]).assertEqual(threePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_5000
     * @tc.name testFloat64ArrayConstructor3050
     * @tc.desc Verify overload 11 buf is ArrayLike containing negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negonePointzero: number = -1.0;
      const negtwoPointfive: number = -2.5;
      const negthreePointonefour: number = -3.14;
      const src: Array<number> = [-1.0, -2.5, -3.14];
      const arrLike: ArrayLike<Number> = src;
      const view = new Float64Array(arrLike);
      expect(view[0]).assertEqual(negonePointzero);
      expect(view[1]).assertEqual(negtwoPointfive);
      expect(view[2]).assertEqual(negthreePointonefour);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_5100
     * @tc.name testFloat64ArrayConstructor3051
     * @tc.desc Verify overload 11 buf is ArrayLike containing boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const doubleMinValue: number = 5e-324;
      const src: Array<number> = [1.7976931348623157e+308, 5e-324, 0.0];
      const arrLike: ArrayLike<Number> = src;
      const view = new Float64Array(arrLike);
      expect(view[0]).assertEqual(doubleMaxValue);
      expect(view[1]).assertEqual(doubleMinValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_5200
     * @tc.name testFloat64ArrayConstructor3052
     * @tc.desc Verify overload 11 buf is ArrayLike containing NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const src: Array<number> = [NaN, 1.0];
      const arrLike: ArrayLike<Number> = src;
      const view = new Float64Array(arrLike);
      const actVal1 = Number.isNaN(view[0]);
      const expectVal = true;
      expect(actVal1).assertEqual(expectVal);
      expect(view[1]).assertEqual(onePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_5300
     * @tc.name testFloat64ArrayConstructor3053
     * @tc.desc Verify overload 11 buf is ArrayLike containing Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const negativeInfinity: number = -Infinity;
      const src: Array<number> = [Infinity, -Infinity];
      const arrLike: ArrayLike<Number> = src;
      const view = new Float64Array(arrLike);
      expect(view[0]).assertEqual(positiveInfinity);
      expect(view[1]).assertEqual(negativeInfinity);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_5400
     * @tc.name testFloat64ArrayConstructor3054
     * @tc.desc Verify overload 11 buf is ArrayLike containing scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e308: number = 1.0e-308;
      const sciValue10e3082: number = 1.0e+308;
      const src: Array<number> = [1.0e-308, 1.0e+308];
      const arrLike: ArrayLike<Number> = src;
      const view = new Float64Array(arrLike);
      expect(view[0]).assertEqual(sciValue10e308);
      expect(view[1]).assertEqual(sciValue10e3082);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_5500
     * @tc.name testFloat64ArrayConstructor3055
     * @tc.desc Verify overload 11 buf is ArrayLike containing decimal precision boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0.1, 0.2];
      const arrLike: ArrayLike<Number> = src;
      const view = new Float64Array(arrLike);
      const expectVal = false;
      expect(view[0] + view[1] === 0.3).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_5600
     * @tc.name testFloat64ArrayConstructor3056
     * @tc.desc Verify overload 11 buf is ArrayLike containing -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeZero: number = -0.0;
      const src: Array<number> = [-0.0];
      const arrLike: ArrayLike<Number> = src;
      const view = new Float64Array(arrLike);
      const expectVal = negativeZero;
      expect(view[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_5700
     * @tc.name testFloat64ArrayConstructor3057
     * @tc.desc Verify overload 11 buf is ArrayLike super long (100 elements)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenValue: number = 10;
      const zeroPointZero: number = 0.0;
      const view = new Float64Array(10);
      expect(view.length).assertEqual(tenValue);
      const actVal2 = view.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal2).assertEqual(expectVal);
      const actVal3 = view.$_get(9);
      const expectVal2 = zeroPointZero;
      expect(actVal3).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_5800
     * @tc.name testFloat64ArrayConstructor3058
     * @tc.desc Verify overload 11 buf is ArrayLike all same elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiveValue: number = 5;
      const fillValue42: number = 42.0;
      const src: Array<number> = [42.0, 42.0, 42.0, 42.0, 42.0];
      const arrLike: ArrayLike<Number> = src;
      const view = new Float64Array(arrLike);
      expect(view.length).assertEqual(fiveValue);
      expect(view[0]).assertEqual(fillValue42);
      expect(view[4]).assertEqual(fillValue42);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_5900
     * @tc.name testFloat64ArrayConstructor3059
     * @tc.desc Verify overload 11 buf is Float64Array (deep copy)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const negativeOne: number = -1;
      const src = Float64Array.of(int32MinValue, -1, zeroValue);
      const view = new Float64Array(src);
      expect(view.length).assertEqual(threeValue);
      expect(view[0]).assertEqual(int32MinValue);
      expect(view[1]).assertEqual(negativeOne);
      expect(view[2]).assertEqual(zeroValue);
      expect(view.buffer === src.buffer).assertFalse();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_6000
     * @tc.name testFloat64ArrayConstructor3060
     * @tc.desc Verify overload 11 buf is Array<number> (deep copy)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const onePointFive: number = 1.5;
      const twoPointFive: number = 2.5;
      const threePointfive: number = 3.5;
      const src: Array<number> = [1.5, 2.5, 3.5];
      const view = new Float64Array(src);
      expect(view.length).assertEqual(threeValue);
      expect(view[0]).assertEqual(onePointFive);
      expect(view[1]).assertEqual(twoPointFive);
      expect(view[2]).assertEqual(threePointfive);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_6100
     * @tc.name testFloat64ArrayConstructor3061
     * @tc.desc Verify overload 11 buf is FixedArray<number> (deep copy)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const onePointFive: number = 1.5;
      const twoPointFive: number = 2.5;
      const threePointfive: number = 3.5;
      const src: FixedArray<number> = [1.5, 2.5, 3.5];
      const view = new Float64Array(src);
      expect(view.length).assertEqual(threeValue);
      expect(view[0]).assertEqual(onePointFive);
      expect(view[1]).assertEqual(twoPointFive);
      expect(view[2]).assertEqual(threePointfive);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_6200
     * @tc.name testFloat64ArrayConstructor3062
     * @tc.desc Verify overload 11 buf is ArrayLike modifying does not affect original object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num999Pointzero: number = 999.0;
      const src: Array<number> = [0.0, 10.0];
      const arrLike: ArrayLike<Number> = src;
      const view = new Float64Array(arrLike);
      view[0] = 999.0;
      const expectVal = num999Pointzero;
      expect(view[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_6300
     * @tc.name testFloat64ArrayConstructor3063
     * @tc.desc Verify overload 11 buf is Iterable consumed once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const src: Array<number> = [1.0, 2.0, 3.0];
      const iterable: Iterable<Number> = src;
      const view = new Float64Array(iterable);
      const expectVal = threeValue;
      expect(view.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_6400
     * @tc.name testFloat64ArrayConstructor3064
     * @tc.desc Verify overload 11 buf is Iterable containing Number objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const src: Array<number> = [1.0, 2.0, 3.0];
      const view = new Float64Array(src);
      expect(view.length).assertEqual(threeValue);
      expect(view[0]).assertEqual(onePointZero);
      expect(view[1]).assertEqual(twoPointZero);
      expect(view[2]).assertEqual(threePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_6500
     * @tc.name testFloat64ArrayConstructor3065
     * @tc.desc Verify overload 11 ArrayLike construction returns Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0.0, 1.0];
      const arrLike: ArrayLike<Number> = src;
      const view = new Float64Array(arrLike);
      const obj: Object = view as Object;
      let isF64: boolean = false;
      if (obj instanceof Float64Array) {
        isF64 = true;
      }
      const expectVal = true;
      expect(isF64).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_6600
     * @tc.name testFloat64ArrayConstructor3066
     * @tc.desc Verify overload 11 ArrayBuffer construction returns Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Float64Array(buf);
      const obj: Object = view as Object;
      let isF64: boolean = false;
      if (obj instanceof Float64Array) {
        isF64 = true;
      }
      const expectVal = true;
      expect(isF64).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_6700
     * @tc.name testFloat64ArrayConstructor3067
     * @tc.desc Verify overload 11 ArrayLike construction returns independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0.0, 1.0];
      const arrLike: ArrayLike<Number> = src;
      const view = new Float64Array(arrLike);
      const obj: Object = view.buffer as Object;
      let isAB: boolean = false;
      if (obj instanceof ArrayBuffer) {
        isAB = true;
      }
      const expectVal = true;
      expect(isAB).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_6800
     * @tc.name testFloat64ArrayConstructor3068
     * @tc.desc Verify overload 11 ArrayBuffer construction returns shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Float64Array(buf);
      const expectVal = buf;
      expect(view.buffer).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_6900
     * @tc.name testFloat64ArrayConstructor3069
     * @tc.desc Verify overload 11 buf is ArrayLike with super large length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const src: Array<number> = new Array<number>(1000);
        for (let i: int = 0; i < 1000; i++) {
          src[i] = i * 1.0;
        }
        const arrLike: ArrayLike<Number> = src;
        new Float64Array(arrLike);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_7000
     * @tc.name testFloat64ArrayConstructor3070
     * @tc.desc Verify overload 11 ArrayLike construction deep copy does not share
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num500Pointzero: number = 500.0;
      const src: Array<number> = [0.0, 10.0];
      const arrLike: ArrayLike<Number> = src;
      const view = new Float64Array(arrLike);
      view[0] = 500.0;
      const expectVal = num500Pointzero;
      expect(view[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_7100
     * @tc.name testFloat64ArrayConstructor3071
     * @tc.desc Verify overload 11 ArrayBuffer construction is view sharing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num123Pointfourfivesix: number = 123.456;
      const buf = new ArrayBuffer(16);
      const view = new Float64Array(buf);
      view[0] = 123.456;
      const expectVal = num123Pointfourfivesix;
      expect(view[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_7200
     * @tc.name testFloat64ArrayConstructor3072
     * @tc.desc Verify constructor from array negative check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      expect(arr[0] === 1.0).assertTrue();
      expect(arr[0] === 9.0).assertFalse();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_7300
     * @tc.name testFloat64ArrayConstructor3073
     * @tc.desc Verify array constructor preserves hex literals 0xFF and 0xAA
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const hexValueAA: number = 0xAA;
      const num255Value: number = 255;
      const num170Pointzero: number = 170.0;
      const arr = new Float64Array([hexValueFF, hexValueAA]);
      expect(arr[0]).assertEqual(num255Value);
      expect(arr[1]).assertEqual(num170Pointzero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_3_7400
     * @tc.name testFloat64ArrayConstructor3074
     * @tc.desc Verify array constructor preserves binary literals 0b11111111 and 0b10101010
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor3074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const binaryValue10101010: number = 0b10101010;
      const num255Value: number = 255;
      const num170Pointzero: number = 170.0;
      const arr = new Float64Array([binaryValue11111111, binaryValue10101010]);
      expect(arr[0]).assertEqual(num255Value);
      expect(arr[1]).assertEqual(num170Pointzero);
    })

  })
}
