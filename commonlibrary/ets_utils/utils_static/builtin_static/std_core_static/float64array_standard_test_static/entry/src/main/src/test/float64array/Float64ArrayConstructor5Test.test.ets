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

export default function Float64ArrayConstructor5Test(): void {
  describe('Float64ArrayConstructor5Test', (): void => {
    beforeAll((): void => {
    })

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30)
    })

    afterEach((): void => {
    })

    afterAll((): void => {
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0010
     * @tc.name testFloat64ArrayConstructor5001
     * @tc.desc Verify one-arg constructor dispatches to Float64Array overload with same type instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const threeValue: number = 3;
      const src = new Float64Array([onePointZero, twoPointZero, threePointZero]);
      const copy = new Float64Array(src);
      expect(copy.length).assertEqual(threeValue);
      expect(copy[0]).assertEqual(onePointZero);
      expect(copy[1]).assertEqual(twoPointZero);
      expect(copy[2]).assertEqual(threePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0020
     * @tc.name testFloat64ArrayConstructor5002
     * @tc.desc Verify one-arg constructor dispatches to Array<number> overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const onePointZero: number = 1.0;
      const src: Array<number> = [1.0, 2.0, 3.0];
      const arr = new Float64Array(src);
      expect(arr.length).assertEqual(threeValue);
      expect(arr[0]).assertEqual(onePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0030
     * @tc.name testFloat64ArrayConstructor5003
     * @tc.desc Verify one-arg constructor dispatches to Iterable<Number> overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const onePointZero: number = 1.0;
      const src: Iterable<Number> = [1.0, 2.0, 3.0];
      const arr = new Float64Array(src);
      expect(arr.length).assertEqual(threeValue);
      expect(arr[0]).assertEqual(onePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0040
     * @tc.name testFloat64ArrayConstructor5004
     * @tc.desc Verify one-arg constructor dispatches to ArrayBuffer overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixteenValue: number = 16;
      const buf = new ArrayBuffer(16);
      const arr = new Float64Array(buf);
      expect(arr.buffer).assertEqual(buf);
      expect(arr.byteLength).assertEqual(sixteenValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0050
     * @tc.name testFloat64ArrayConstructor5005
     * @tc.desc Verify two-arg constructor dispatches to ArrayBuffer plus int offset overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightValue: number = 8;
      const twentyfourValue: number = 24;
      const buf = new ArrayBuffer(32);
      const arr = new Float64Array(buf, 8);
      expect(arr.buffer).assertEqual(buf);
      expect(arr.byteOffset).assertEqual(eightValue);
      expect(arr.byteLength).assertEqual(twentyfourValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0060
     * @tc.name testFloat64ArrayConstructor5006
     * @tc.desc Verify two-arg constructor dispatches to ArrayBuffer plus number offset overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightValue: number = 8;
      const twentyfourValue: number = 24;
      const buf = new ArrayBuffer(32);
      const offset: number = 8.0;
      const arr = new Float64Array(buf, offset);
      expect(arr.buffer).assertEqual(buf);
      expect(arr.byteOffset).assertEqual(eightValue);
      expect(arr.byteLength).assertEqual(twentyfourValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0070
     * @tc.name testFloat64ArrayConstructor5007
     * @tc.desc Verify three-arg constructor with all Number|undefined params supplied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightValue: number = 8;
      const twoValue: number = 2;
      const buf = new ArrayBuffer(32);
      const off: Number | undefined = 8;
      const len: Number | undefined = 2;
      const arr = new Float64Array(buf, off, len);
      expect(arr.buffer).assertEqual(buf);
      expect(arr.byteOffset).assertEqual(eightValue);
      expect(arr.length).assertEqual(twoValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0080
     * @tc.name testFloat64ArrayConstructor5008
     * @tc.desc Verify three-arg constructor with both Number|undefined params undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const fourValue: number = 4;
      const buf = new ArrayBuffer(32);
      const off: Number | undefined = undefined;
      const len: Number | undefined = undefined;
      const arr = new Float64Array(buf, off, len);
      expect(arr.buffer).assertEqual(buf);
      expect(arr.byteOffset).assertEqual(zeroValue);
      expect(arr.length).assertEqual(fourValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0090
     * @tc.name testFloat64ArrayConstructor5009
     * @tc.desc Verify three-arg constructor with only offset undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const twoValue: number = 2;
      const buf = new ArrayBuffer(32);
      const off: Number | undefined = undefined;
      const arr = new Float64Array(buf, off, 2);
      expect(arr.buffer).assertEqual(buf);
      expect(arr.byteOffset).assertEqual(zeroValue);
      expect(arr.length).assertEqual(twoValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0100
     * @tc.name testFloat64ArrayConstructor5010
     * @tc.desc Verify undefined offset default equals zero offset in three-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const zeroValue: number = 0;
      const buf = new ArrayBuffer(24);
      const a = new Float64Array(buf, 0, 3);
      const off: Number | undefined = undefined;
      const b = new Float64Array(buf, off, 3);
      expect(a.length).assertEqual(threeValue);
      expect(b.length).assertEqual(threeValue);
      expect(a.byteOffset).assertEqual(zeroValue);
      expect(b.byteOffset).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0110
     * @tc.name testFloat64ArrayConstructor5011
     * @tc.desc Verify zero-arg constructor equals ArrayBuffer(0) constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const a = new Float64Array();
      const b = new Float64Array(new ArrayBuffer(0));
      expect(a.length).assertEqual(zeroValue);
      expect(b.length).assertEqual(zeroValue);
      expect(a.byteLength).assertEqual(zeroValue);
      expect(b.byteLength).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0120
     * @tc.name testFloat64ArrayConstructor5012
     * @tc.desc Verify both undefined params default behavior in three-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const fiveValue: number = 5;
      const fortyValue: number = 40;
      const buf = new ArrayBuffer(40);
      const off: Number | undefined = undefined;
      const len: Number | undefined = undefined;
      const arr = new Float64Array(buf, off, len);
      expect(arr.byteOffset).assertEqual(zeroValue);
      expect(arr.length).assertEqual(fiveValue);
      expect(arr.byteLength).assertEqual(fortyValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0130
     * @tc.name testFloat64ArrayConstructor5013
     * @tc.desc Verify buffer still usable after non-8-multiple offset RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const buf = new ArrayBuffer(16);
      try {
        new Float64Array(buf, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const valid = new Float64Array(buf, 0);
      expect(valid.length).assertEqual(twoValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0140
     * @tc.name testFloat64ArrayConstructor5014
     * @tc.desc Verify buffer still usable after insufficient length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const buf = new ArrayBuffer(8);
      try {
        new Float64Array(buf, 0, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const valid = new Float64Array(buf, 0, 1);
      expect(valid.length).assertEqual(oneValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0150
     * @tc.name testFloat64ArrayConstructor5015
     * @tc.desc Verify offset beyond buffer boundary throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(8);
        new Float64Array(buf, 16);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0160
     * @tc.name testFloat64ArrayConstructor5016
     * @tc.desc Verify Float64Array copy constructor shares buffer with original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const src = new Float64Array([onePointZero, twoPointZero]);
      const copy = new Float64Array(src);
      expect(copy.length).assertEqual(src.length);
      expect(copy[0]).assertEqual(onePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0170
     * @tc.name testFloat64ArrayConstructor5017
     * @tc.desc Verify modifying copy after Float64Array copy construction does not affect original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const num999Pointzero: number = 999.0;
      const src = new Float64Array([onePointZero, twoPointZero]);
      const copy = new Float64Array(src);
      copy[0] = 999.0;
      expect(src[0]).assertEqual(onePointZero);
      expect(copy[0]).assertEqual(num999Pointzero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0180
     * @tc.name testFloat64ArrayConstructor5018
     * @tc.desc Verify deep copy semantics that modifying original does not affect copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const num888Pointzero: number = 888.0;
      const src = new Float64Array([onePointZero, twoPointZero]);
      const copy = new Float64Array(src);
      src[0] = 888.0;
      expect(src[0]).assertEqual(num888Pointzero);
      expect(copy[0]).assertEqual(onePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0190
     * @tc.name testFloat64ArrayConstructor5019
     * @tc.desc Verify value consistency between Array<number> construction and Float64Array copy construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const src1 = new Float64Array([onePointZero, twoPointZero, threePointZero]);
      const src2: Array<number> = [1.0, 2.0, 3.0];
      const copy1 = new Float64Array(src1);
      const copy2 = new Float64Array(src2);
      expect(copy1[0]).assertEqual(copy2[0]);
      expect(copy1[1]).assertEqual(copy2[1]);
      expect(copy1[2]).assertEqual(copy2[2]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0200
     * @tc.name testFloat64ArrayConstructor5020
     * @tc.desc Verify value consistency between Iterable<Number> construction and Array<number> construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src1: Array<number> = [1.0, 2.0, 3.0];
      const src2: Iterable<Number> = [1.0, 2.0, 3.0];
      const copy1 = new Float64Array(src1);
      const copy2 = new Float64Array(src2);
      expect(copy1.length).assertEqual(copy2.length);
      expect(copy1[0]).assertEqual(copy2[0]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0210
     * @tc.name testFloat64ArrayConstructor5021
     * @tc.desc Verify value consistency between FixedArray construction and Array construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src1: Array<number> = [1.0, 2.0];
      const src2: FixedArray<number> = [1.0, 2.0];
      const copy1 = new Float64Array(src1);
      const copy2 = new Float64Array(src2);
      expect(copy1.length).assertEqual(copy2.length);
      expect(copy1[0]).assertEqual(copy2[0]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0220
     * @tc.name testFloat64ArrayConstructor5022
     * @tc.desc Verify unified negative length RangeError across different overloads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float64Array(-5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      try {
        const buf = new ArrayBuffer(16);
        new Float64Array(buf, 0, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0230
     * @tc.name testFloat64ArrayConstructor5023
     * @tc.desc Verify huge length constructor throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float64Array(9007199254740991);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0240
     * @tc.name testFloat64ArrayConstructor5024
     * @tc.desc Verify huge offset constructor throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        new Float64Array(buf, 9007199254740991);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0250
     * @tc.name testFloat64ArrayConstructor5025
     * @tc.desc Verify non-integer offset constructor truncation behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightValue: number = 8;
      const twentyfourValue: number = 24;
      const buf = new ArrayBuffer(32);
      const arr = new Float64Array(buf, 8);
      expect(arr.byteOffset).assertEqual(eightValue);
      expect(arr.byteLength).assertEqual(twentyfourValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0260
     * @tc.name testFloat64ArrayConstructor5026
     * @tc.desc Verify parent and child ArrayBuffer views share the same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const parent = new Float64Array(buf, 0, 4);
      const child = new Float64Array(buf, 16, 2);
      expect(parent.buffer).assertEqual(child.buffer);
      expect(parent.buffer).assertEqual(buf);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0270
     * @tc.name testFloat64ArrayConstructor5027
     * @tc.desc Verify child view observes parent view write via shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const buf = new ArrayBuffer(32);
      const parent = new Float64Array(buf, 0, 4);
      const child = new Float64Array(buf, 16, 2);
      parent[2] = 0.0;
      const expectVal = zeroPointZero;
      expect(child[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0280
     * @tc.name testFloat64ArrayConstructor5028
     * @tc.desc Verify parent view observes child view write via shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negsciValue10e6: number = -1.0e-6;
      const buf = new ArrayBuffer(32);
      const parent = new Float64Array(buf, 0, 4);
      const child = new Float64Array(buf, 16, 2);
      child[1] = -1.0e-6;
      const expectVal = negsciValue10e6;
      expect(parent[3]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0290
     * @tc.name testFloat64ArrayConstructor5029
     * @tc.desc Verify three views interactive write through shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const buf = new ArrayBuffer(48);
      const view1 = new Float64Array(buf, 0, 2);
      const view2 = new Float64Array(buf, 16, 2);
      const view3 = new Float64Array(buf, 32, 2);
      view1[0] = 1.0;
      view2[0] = 2.0;
      view3[0] = 3.0;
      expect(view1[0]).assertEqual(onePointZero);
      expect(view2[0]).assertEqual(twoPointZero);
      expect(view3[0]).assertEqual(threePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0300
     * @tc.name testFloat64ArrayConstructor5030
     * @tc.desc Verify Float64Array copy construction deep copy shares buffer but content is independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const twentyPointzero: number = 20.0;
      const src = new Float64Array([tenPointZero, twentyPointzero]);
      const copy = new Float64Array(src);
      copy[0] = 999.0;
      const expectVal = tenPointZero;
      expect(src[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0310
     * @tc.name testFloat64ArrayConstructor5031
     * @tc.desc Verify view from ArrayBuffer references the original buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twentyfourValue: number = 24;
      const buf = new ArrayBuffer(24);
      const view = new Float64Array(buf, 8, 2);
      expect(view.buffer).assertEqual(buf);
      expect(view.buffer.byteLength).assertEqual(twentyfourValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0320
     * @tc.name testFloat64ArrayConstructor5032
     * @tc.desc Verify multi-view shared buffer byteLength consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fortyValue: number = 40;
      const buf = new ArrayBuffer(40);
      const v1 = new Float64Array(buf, 0, 5);
      const v2 = new Float64Array(buf, 8, 4);
      const v3 = new Float64Array(buf, 16, 3);
      expect(v1.buffer.byteLength).assertEqual(fortyValue);
      expect(v2.buffer.byteLength).assertEqual(fortyValue);
      expect(v3.buffer.byteLength).assertEqual(fortyValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0330
     * @tc.name testFloat64ArrayConstructor5033
     * @tc.desc Verify length independence between copy construction and original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const threeValue: number = 3;
      const src = new Float64Array([onePointZero, twoPointZero, threePointZero]);
      const copy = new Float64Array(src);
      expect(copy.length).assertEqual(src.length);
      copy[0] = 100.0;
      expect(src.length).assertEqual(threeValue);
      expect(copy.length).assertEqual(threeValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0340
     * @tc.name testFloat64ArrayConstructor5034
     * @tc.desc Verify byteLength consistency between copy construction and original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const fourPointZero: number = 4.0;
      const thirtytwoValue: number = 32;
      const src = new Float64Array([onePointZero, twoPointZero, threePointZero, fourPointZero]);
      const copy = new Float64Array(src);
      expect(copy.byteLength).assertEqual(src.byteLength);
      expect(copy.byteLength).assertEqual(thirtytwoValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0350
     * @tc.name testFloat64ArrayConstructor5035
     * @tc.desc Verify Iterable construction consumes iterator once via Array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const onePointZero: number = 1.0;
      const src: Array<number> = [1.0, 2.0, 3.0];
      const iterable: Iterable<Number> = src;
      const arr = new Float64Array(iterable);
      expect(arr.length).assertEqual(threeValue);
      expect(arr[0]).assertEqual(onePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0360
     * @tc.name testFloat64ArrayConstructor5036
     * @tc.desc Verify constructing from same Iterable source array twice does not duplicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const src: Array<number> = [10.0, 20.0];
      const arr1 = new Float64Array(src);
      const expectVal = twoValue;
      expect(arr1.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0370
     * @tc.name testFloat64ArrayConstructor5037
     * @tc.desc Verify nested Iterable construction each consumes once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const src1: Array<number> = [1.0, 2.0];
      const src2: Array<number> = [3.0, 4.0];
      const arr1 = new Float64Array(src1);
      const arr2 = new Float64Array(src2);
      expect(arr1.length).assertEqual(twoValue);
      expect(arr2.length).assertEqual(twoValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0380
     * @tc.name testFloat64ArrayConstructor5038
     * @tc.desc Verify constructing from empty Iterable source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const src: Array<number> = [];
      const iterable: Iterable<Number> = src;
      const arr = new Float64Array(iterable);
      const expectVal = zeroValue;
      expect(arr.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0390
     * @tc.name testFloat64ArrayConstructor5039
     * @tc.desc Verify Iterable construction containing boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourValue: number = 4;
      const zeroPointZero: number = 0.0;
      const src: Array<number> = [0.0, -0.0, 1.0e-308, 1.0e+308];
      const iterable: Iterable<Number> = src;
      const arr = new Float64Array(iterable);
      expect(arr.length).assertEqual(fourValue);
      expect(arr[0]).assertEqual(zeroPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0400
     * @tc.name testFloat64ArrayConstructor5040
     * @tc.desc Verify single-element array dispatches to ArrayLike overload instead of length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiveValue: number = 5;
      const oneValue: number = 1;
      const fivePointZero: number = 5.0;
      const arr = new Float64Array([fiveValue]);
      expect(arr.length).assertEqual(oneValue);
      expect(arr[0]).assertEqual(fivePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0410
     * @tc.name testFloat64ArrayConstructor5041
     * @tc.desc Verify single-element array dispatch validates content rather than length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hundredValue: number = 100;
      const oneValue: number = 1;
      const hundredPointzero: number = 100.0;
      const arr = new Float64Array([hundredValue]);
      expect(arr.length).assertEqual(oneValue);
      expect(arr[0]).assertEqual(hundredPointzero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0420
     * @tc.name testFloat64ArrayConstructor5042
     * @tc.desc Verify empty array dispatches to ArrayLike overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([]);
      expect(arr.length).assertEqual(zeroValue);
      expect(arr.byteLength).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0430
     * @tc.name testFloat64ArrayConstructor5043
     * @tc.desc Verify multi-element array dispatches to ArrayLike overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const fourPointZero: number = 4.0;
      const fivePointZero: number = 5.0;
      const fiveValue: number = 5;
      const arr = new Float64Array([onePointZero, twoPointZero, threePointZero, fourPointZero, fivePointZero]);
      expect(arr.length).assertEqual(fiveValue);
      expect(arr[0]).assertEqual(onePointZero);
      expect(arr[4]).assertEqual(fivePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0440
     * @tc.name testFloat64ArrayConstructor5044
     * @tc.desc Verify ArrayBuffer instance dispatches to ArrayBuffer overload instead of ArrayLike
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const buf = new ArrayBuffer(16);
      const arr = new Float64Array(buf);
      expect(arr.buffer).assertEqual(buf);
      expect(arr.length).assertEqual(twoValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0450
     * @tc.name testFloat64ArrayConstructor5045
     * @tc.desc Verify FixedArray dispatches to FixedArray overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const onePointZero: number = 1.0;
      const fa: FixedArray<number> = [1.0, 2.0, 3.0];
      const arr = new Float64Array(fa);
      expect(arr.length).assertEqual(threeValue);
      expect(arr[0]).assertEqual(onePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0460
     * @tc.name testFloat64ArrayConstructor5046
     * @tc.desc Verify Float64Array instance dispatches to Float64Array overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const twoValue: number = 2;
      const src = new Float64Array([onePointZero, twoPointZero]);
      const copy = new Float64Array(src);
      expect(copy.length).assertEqual(twoValue);
      expect(copy[0]).assertEqual(onePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0470
     * @tc.name testFloat64ArrayConstructor5047
     * @tc.desc Verify ArrayLike dispatch containing NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const nanValue: number = NaN;
      const threePointZero: number = 3.0;
      const threeValue: number = 3;
      const arr = new Float64Array([onePointZero, nanValue, threePointZero]);
      expect(arr.length).assertEqual(threeValue);
      const actVal1 = Number.isNaN(arr[1]);
      const expectVal = true;
      expect(actVal1).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0480
     * @tc.name testFloat64ArrayConstructor5048
     * @tc.desc Verify ArrayLike dispatch containing Infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const zeroPointZero: number = 0.0;
      const threeValue: number = 3;
      const negativeInfinity: number = -Infinity;
      const arr = new Float64Array([positiveInfinity, -positiveInfinity, zeroPointZero]);
      expect(arr.length).assertEqual(threeValue);
      expect(arr[0]).assertEqual(positiveInfinity);
      expect(arr[1]).assertEqual(negativeInfinity);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0490
     * @tc.name testFloat64ArrayConstructor5049
     * @tc.desc Verify ArrayLike dispatch containing negative zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeZero: number = -0.0;
      const zeroPointZero: number = 0.0;
      const twoValue: number = 2;
      const arr = new Float64Array([negativeZero, zeroPointZero]);
      expect(arr.length).assertEqual(twoValue);
      expect(arr[0]).assertEqual(negativeZero);
      expect(arr[1]).assertEqual(zeroPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0500
     * @tc.name testFloat64ArrayConstructor5050
     * @tc.desc Verify name property of Float64Array copy constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const src = new Float64Array([onePointZero]);
      const copy = new Float64Array(src);
      const expectVal = 'Float64Array';
      expect(copy.name).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0510
     * @tc.name testFloat64ArrayConstructor5051
     * @tc.desc Verify BYTES_PER_ELEMENT consistency across all overloads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const zeroValue: number = 0;
      const fortyValue: number = 40;
      const sixteenValue: number = 16;
      const a = new Float64Array();
      const b = new Float64Array(5);
      const c = new Float64Array([onePointZero, twoPointZero]);
      const buf = new ArrayBuffer(16);
      const d = new Float64Array(buf);
      expect(a.byteLength).assertEqual(zeroValue);
      expect(b.byteLength).assertEqual(fortyValue);
      expect(c.byteLength).assertEqual(sixteenValue);
      expect(d.byteLength).assertEqual(sixteenValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0520
     * @tc.name testFloat64ArrayConstructor5052
     * @tc.desc Verify Float64Array instance check consistency across all overloads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const fourValue: number = 4;
      const a = new Float64Array();
      const b = new Float64Array(5);
      const c = new Float64Array([onePointZero]);
      const buf = new ArrayBuffer(16);
      const d = new Float64Array(buf);
      const objs: Array<Object> = [a, b, c, d];
      let count: int = 0;
      for (let i: int = 0; i < objs.length; i++) {
        if (objs[i] instanceof Float64Array) {
          count = count + 1;
        }
      }
      const expectVal = fourValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0530
     * @tc.name testFloat64ArrayConstructor5053
     * @tc.desc Verify original array immutability after copy construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const threeValue: number = 3;
      const twentyfourValue: number = 24;
      const src = new Float64Array([onePointZero, twoPointZero, threePointZero]);
      const copy = new Float64Array(src);
      copy[0] = 999.0;
      expect(src[0]).assertEqual(onePointZero);
      expect(src.length).assertEqual(threeValue);
      expect(src.byteLength).assertEqual(twentyfourValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0540
     * @tc.name testFloat64ArrayConstructor5054
     * @tc.desc Verify copy immutability after modifying original (reverse direction)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const threeValue: number = 3;
      const twentyfourValue: number = 24;
      const src = new Float64Array([onePointZero, twoPointZero, threePointZero]);
      const copy = new Float64Array(src);
      src[0] = 888.0;
      expect(copy[0]).assertEqual(onePointZero);
      expect(copy.length).assertEqual(threeValue);
      expect(copy.byteLength).assertEqual(twentyfourValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0550
     * @tc.name testFloat64ArrayConstructor5055
     * @tc.desc Verify parent view write visibility from child view after view sharing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ninetyninePointninenine: number = 99.99;
      const buf = new ArrayBuffer(24);
      const parent = new Float64Array(buf, 0, 3);
      const child = new Float64Array(buf, 8, 2);
      parent[1] = 99.99;
      const expectVal = ninetyninePointninenine;
      expect(child[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0560
     * @tc.name testFloat64ArrayConstructor5056
     * @tc.desc Verify child view write visibility from parent view after view sharing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negative99Point99: number = -99.99;
      const buf = new ArrayBuffer(24);
      const parent = new Float64Array(buf, 0, 3);
      const child = new Float64Array(buf, 8, 2);
      child[1] = -99.99;
      const expectVal = negative99Point99;
      expect(parent[2]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0570
     * @tc.name testFloat64ArrayConstructor5057
     * @tc.desc Verify value passing through multi-view shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num111Pointzero: number = 111.0;
      const num222Pointzero: number = 222.0;
      const num333Pointzero: number = 333.0;
      const buf = new ArrayBuffer(48);
      const v1 = new Float64Array(buf, 0, 2);
      const v2 = new Float64Array(buf, 16, 2);
      const v3 = new Float64Array(buf, 32, 2);
      v1[0] = 111.0;
      v2[0] = 222.0;
      v3[0] = 333.0;
      expect(v1[0]).assertEqual(num111Pointzero);
      expect(v2[0]).assertEqual(num222Pointzero);
      expect(v3[0]).assertEqual(num333Pointzero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0580
     * @tc.name testFloat64ArrayConstructor5058
     * @tc.desc Verify number literal dispatches to length overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const twentyfourValue: number = 24;
      const n: number = 3;
      const arr = new Float64Array(n);
      expect(arr.length).assertEqual(threeValue);
      expect(arr.byteLength).assertEqual(twentyfourValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0590
     * @tc.name testFloat64ArrayConstructor5059
     * @tc.desc Verify int literal dispatches to int length overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const twentyfourValue: number = 24;
      const n: int = 3;
      const arr = new Float64Array(n);
      expect(arr.length).assertEqual(threeValue);
      expect(arr.byteLength).assertEqual(twentyfourValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0600
     * @tc.name testFloat64ArrayConstructor5060
     * @tc.desc Verify undefined as byteOffset default equals zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const a = new Float64Array(buf, 0, 3);
      const off: Number | undefined = undefined;
      const b = new Float64Array(buf, off, 3);
      expect(a.length).assertEqual(b.length);
      expect(a.byteOffset).assertEqual(b.byteOffset);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0610
     * @tc.name testFloat64ArrayConstructor5061
     * @tc.desc Verify undefined as length default equals remaining length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const a = new Float64Array(buf, 8, 2);
      const len: Number | undefined = undefined;
      const b = new Float64Array(buf, 8, len);
      expect(a.length).assertEqual(b.length);
      expect(a.byteLength).assertEqual(b.byteLength);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0620
     * @tc.name testFloat64ArrayConstructor5062
     * @tc.desc Verify two undefined params default behavior versus zero-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const twoValue: number = 2;
      const buf = new ArrayBuffer(16);
      const a = new Float64Array();
      const off: Number | undefined = undefined;
      const len: Number | undefined = undefined;
      const b = new Float64Array(buf, off, len);
      expect(a.length).assertEqual(zeroValue);
      expect(b.length).assertEqual(twoValue);
      expect(b.byteOffset).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0630
     * @tc.name testFloat64ArrayConstructor5063
     * @tc.desc Verify dispatch differentiation between Float64Array instance and Array<number> instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const fa = new Float64Array([onePointZero, twoPointZero]);
      const aa: Array<number> = [1.0, 2.0];
      const c1 = new Float64Array(fa);
      const c2 = new Float64Array(aa);
      expect(c1.length).assertEqual(c2.length);
      expect(c1[0]).assertEqual(c2[0]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0640
     * @tc.name testFloat64ArrayConstructor5064
     * @tc.desc Verify dispatch differentiation between FixedArray and Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [1.0, 2.0];
      const aa: Array<number> = [1.0, 2.0];
      const c1 = new Float64Array(fa);
      const c2 = new Float64Array(aa);
      expect(c1.length).assertEqual(c2.length);
      expect(c1[0]).assertEqual(c2[0]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0650
     * @tc.name testFloat64ArrayConstructor5065
     * @tc.desc Verify dispatch differentiation between Iterable and Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ia: Array<number> = [1.0, 2.0];
      const ii: Iterable<Number> = [1.0, 2.0];
      const c1 = new Float64Array(ia);
      const c2 = new Float64Array(ii);
      expect(c1.length).assertEqual(c2.length);
      expect(c1[0]).assertEqual(c2[0]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0660
     * @tc.name testFloat64ArrayConstructor5066
     * @tc.desc Verify non-8-multiple offset RangeError keeps buffer usable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const sixteenValue: number = 16;
      const buf = new ArrayBuffer(16);
      try {
        new Float64Array(buf, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const valid = new Float64Array(buf, 0);
      expect(valid.length).assertEqual(twoValue);
      expect(valid.byteLength).assertEqual(sixteenValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0670
     * @tc.name testFloat64ArrayConstructor5067
     * @tc.desc Verify offset plus length exceeding buffer boundary throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        new Float64Array(buf, 8, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0680
     * @tc.name testFloat64ArrayConstructor5068
     * @tc.desc Verify offset plus length exactly at buffer boundary does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const eightValue: number = 8;
      const buf = new ArrayBuffer(16);
      const arr = new Float64Array(buf, 8, 1);
      expect(arr.length).assertEqual(oneValue);
      expect(arr.byteLength).assertEqual(eightValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0690
     * @tc.name testFloat64ArrayConstructor5069
     * @tc.desc Verify negative offset throws RangeError in Number|undefined overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        const off: Number | undefined = -1;
        new Float64Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0700
     * @tc.name testFloat64ArrayConstructor5070
     * @tc.desc Verify negative length throws RangeError in Number|undefined overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        const len: Number | undefined = -1;
        new Float64Array(buf, 0, len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0710
     * @tc.name testFloat64ArrayConstructor5071
     * @tc.desc Verify boundary after floating-point length truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array(0.9);
      expect(arr.length).assertEqual(zeroValue);
      expect(arr.byteLength).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0720
     * @tc.name testFloat64ArrayConstructor5072
     * @tc.desc Verify modifying copy element does not change original after copy construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const piApprox: number = 3.14;
      const src = new Float64Array([onePointZero, twoPointZero, threePointZero]);
      const copy = new Float64Array(src);
      copy[1] = 3.14;
      expect(src[1]).assertEqual(twoPointZero);
      expect(copy[1]).assertEqual(piApprox);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0730
     * @tc.name testFloat64ArrayConstructor5073
     * @tc.desc Verify modifying original element does not change copy after copy construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const negthreePointonefour: number = -3.14;
      const src = new Float64Array([onePointZero, twoPointZero, threePointZero]);
      const copy = new Float64Array(src);
      src[2] = -3.14;
      expect(src[2]).assertEqual(negthreePointonefour);
      expect(copy[2]).assertEqual(threePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0740
     * @tc.name testFloat64ArrayConstructor5074
     * @tc.desc Verify deep copy semantics that copy and original content initially match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const twoPointFive: number = 2.5;
      const threePointfive: number = 3.5;
      const src = new Float64Array([onePointFive, twoPointFive, threePointfive]);
      const copy = new Float64Array(src);
      expect(copy[0]).assertEqual(onePointFive);
      expect(copy[1]).assertEqual(twoPointFive);
      expect(copy[2]).assertEqual(threePointfive);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0750
     * @tc.name testFloat64ArrayConstructor5075
     * @tc.desc Verify deep copy semantics with special values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const positiveInfinity: number = Infinity;
      const nanValue: number = NaN;
      const negativeZero: number = -0.0;
      const negativeInfinity: number = -Infinity;
      const src = new Float64Array([zeroPointZero, -0.0, positiveInfinity, -positiveInfinity, nanValue]);
      const copy = new Float64Array(src);
      expect(copy[0]).assertEqual(zeroPointZero);
      expect(copy[1]).assertEqual(negativeZero);
      expect(copy[2]).assertEqual(positiveInfinity);
      expect(copy[3]).assertEqual(negativeInfinity);
      const actVal2 = Number.isNaN(copy[4]);
      const expectVal = true;
      expect(actVal2).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0760
     * @tc.name testFloat64ArrayConstructor5076
     * @tc.desc Verify deep copy semantics with boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e308: number = 1.0e-308;
      const sciValue10e3082: number = 1.0e+308;
      const negsciValue10e308: number = -1.0e+308;
      const src = new Float64Array([sciValue10e308, sciValue10e3082, negsciValue10e308]);
      const copy = new Float64Array(src);
      expect(copy[0]).assertEqual(sciValue10e308);
      expect(copy[1]).assertEqual(sciValue10e3082);
      expect(copy[2]).assertEqual(negsciValue10e308);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0770
     * @tc.name testFloat64ArrayConstructor5077
     * @tc.desc Verify deep copy semantics with empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const src = new Float64Array();
      const copy = new Float64Array(src);
      expect(copy.length).assertEqual(zeroValue);
      expect(copy.byteLength).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0780
     * @tc.name testFloat64ArrayConstructor5078
     * @tc.desc Verify deep copy semantics with single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue42: number = 42.0;
      const oneValue: number = 1;
      const src = new Float64Array([fillValue42]);
      const copy = new Float64Array(src);
      expect(copy.length).assertEqual(oneValue);
      expect(copy[0]).assertEqual(fillValue42);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0790
     * @tc.name testFloat64ArrayConstructor5079
     * @tc.desc Verify deep copy semantics with large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hundredValue: number = 100;
      const zeroValue: number = 0;
      const ninetynineValue: number = 99;
      const src = new Float64Array(100);
      for (let i: int = 0; i < 100; i++) {
        src[i] = i;
      }
      const copy = new Float64Array(src);
      expect(copy.length).assertEqual(hundredValue);
      expect(copy[0]).assertEqual(zeroValue);
      expect(copy[99]).assertEqual(ninetynineValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0800
     * @tc.name testFloat64ArrayConstructor5080
     * @tc.desc Verify byteOffset relationship between parent and child view after view sharing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const sixteenValue: number = 16;
      const buf = new ArrayBuffer(40);
      const parent = new Float64Array(buf, 0, 5);
      const child = new Float64Array(buf, 16, 3);
      expect(parent.byteOffset).assertEqual(zeroValue);
      expect(child.byteOffset).assertEqual(sixteenValue);
      expect(child.byteOffset - parent.byteOffset).assertEqual(sixteenValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0810
     * @tc.name testFloat64ArrayConstructor5081
     * @tc.desc Verify child view byteLength calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twentyfourValue: number = 24;
      const fortyValue: number = 40;
      const buf = new ArrayBuffer(40);
      const child = new Float64Array(buf, 16, 3);
      expect(child.byteLength).assertEqual(twentyfourValue);
      expect(child.buffer.byteLength).assertEqual(fortyValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0820
     * @tc.name testFloat64ArrayConstructor5082
     * @tc.desc Verify view offset alignment (8-multiple)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const eightValue: number = 8;
      const sixteenValue: number = 16;
      const buf = new ArrayBuffer(48);
      const v1 = new Float64Array(buf, 0, 2);
      const v2 = new Float64Array(buf, 8, 2);
      const v3 = new Float64Array(buf, 16, 2);
      expect(v1.byteOffset).assertEqual(zeroValue);
      expect(v2.byteOffset).assertEqual(eightValue);
      expect(v3.byteOffset).assertEqual(sixteenValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0830
     * @tc.name testFloat64ArrayConstructor5083
     * @tc.desc Verify value passing through overlapping region writes in view sharing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hundredPointzero: number = 100.0;
      const num200Pointzero: number = 200.0;
      const buf = new ArrayBuffer(24);
      const v1 = new Float64Array(buf, 0, 3);
      const v2 = new Float64Array(buf, 8, 2);
      v1[1] = 100.0;
      expect(v2[0]).assertEqual(hundredPointzero);
      v2[1] = 200.0;
      expect(v1[2]).assertEqual(num200Pointzero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0840
     * @tc.name testFloat64ArrayConstructor5084
     * @tc.desc Verify three views overlapping write in view sharing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const zeroValue: number = 0;
      const threePointZero: number = 3.0;
      const buf = new ArrayBuffer(48);
      const v1 = new Float64Array(buf, 0, 4);
      const v2 = new Float64Array(buf, 8, 4);
      const v3 = new Float64Array(buf, 16, 2);
      v1[0] = 1.0;
      v2[0] = 2.0;
      v3[0] = 3.0;
      expect(v1[1]).assertEqual(twoValue);
      expect(v2[2]).assertEqual(zeroValue);
      expect(v3[0]).assertEqual(threePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0850
     * @tc.name testFloat64ArrayConstructor5085
     * @tc.desc Verify read consistency after continuous writes in view sharing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenValue: number = 10;
      const thirtyValue: number = 30;
      const thirtyPointzero: number = 30.0;
      const fortyPointzero: number = 40.0;
      const buf = new ArrayBuffer(48);
      const v1 = new Float64Array(buf, 0, 4);
      const v2 = new Float64Array(buf, 8, 4);
      v1[0] = 10.0;
      v1[1] = 20.0;
      v2[0] = 30.0;
      v2[1] = 40.0;
      expect(v1[0]).assertEqual(tenValue);
      expect(v1[1]).assertEqual(thirtyValue);
      expect(v2[0]).assertEqual(thirtyPointzero);
      expect(v2[1]).assertEqual(fortyPointzero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0860
     * @tc.name testFloat64ArrayConstructor5086
     * @tc.desc Verify cross-view boundary value write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const negativeInfinity: number = -Infinity;
      const buf = new ArrayBuffer(32);
      const v1 = new Float64Array(buf, 0, 4);
      const v2 = new Float64Array(buf, 16, 2);
      v1[0] = Infinity;
      v2[0] = -Infinity;
      expect(v1[0]).assertEqual(positiveInfinity);
      expect(v2[0]).assertEqual(negativeInfinity);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0870
     * @tc.name testFloat64ArrayConstructor5087
     * @tc.desc Verify cross-view NaN write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const v1 = new Float64Array(buf, 0, 3);
      const v2 = new Float64Array(buf, 16, 1);
      v1[1] = NaN;
      v2[0] = NaN;
      const actVal3 = Number.isNaN(v1[1]);
      const expectVal = true;
      expect(actVal3).assertEqual(expectVal);
      const actVal4 = Number.isNaN(v2[0]);
      const expectVal2 = true;
      expect(actVal4).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0880
     * @tc.name testFloat64ArrayConstructor5088
     * @tc.desc Verify iterator construction with scientific notation values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const sciValue10e100: number = 1.0e-100;
      const src: Array<number> = [1.0e-100, 1.0e+100, 2.5e-50];
      const iter: Iterable<Number> = src;
      const arr = new Float64Array(iter);
      expect(arr.length).assertEqual(threeValue);
      expect(arr[0]).assertEqual(sciValue10e100);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0890
     * @tc.name testFloat64ArrayConstructor5089
     * @tc.desc Verify iterator construction with decimal precision boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const src: Array<number> = [0.1, 0.2, 0.3];
      const iter: Iterable<Number> = src;
      const arr = new Float64Array(iter);
      expect(arr.length).assertEqual(threeValue);
      expect(arr[0] === arr[1]).assertEqual(false);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0900
     * @tc.name testFloat64ArrayConstructor5090
     * @tc.desc Verify iterator construction with integer boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const int32MaxValue: number = 2147483647;
      const int32MinValue: number = -2147483648;
      const src: Array<number> = [2147483647, -2147483648, 0];
      const iter: Iterable<Number> = src;
      const arr = new Float64Array(iter);
      expect(arr.length).assertEqual(threeValue);
      expect(arr[0]).assertEqual(int32MaxValue);
      expect(arr[1]).assertEqual(int32MinValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0910
     * @tc.name testFloat64ArrayConstructor5091
     * @tc.desc Verify iterator construction with floating-point boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const doubleMinValue: number = 5e-324;
      const src: Array<number> = [1.7976931348623157e+308, 5e-324];
      const iter: Iterable<Number> = src;
      const arr = new Float64Array(iter);
      expect(arr.length).assertEqual(twoValue);
      expect(arr[0]).assertEqual(doubleMaxValue);
      expect(arr[1]).assertEqual(doubleMinValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0920
     * @tc.name testFloat64ArrayConstructor5092
     * @tc.desc Verify iterator construction with negative numbers and zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourValue: number = 4;
      const negonePointzero: number = -1.0;
      const zeroPointZero: number = 0.0;
      const src: Array<number> = [-1.0, -999999.99, 0.0, -0.0];
      const iter: Iterable<Number> = src;
      const arr = new Float64Array(iter);
      expect(arr.length).assertEqual(fourValue);
      expect(arr[0]).assertEqual(negonePointzero);
      expect(arr[2]).assertEqual(zeroPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0930
     * @tc.name testFloat64ArrayConstructor5093
     * @tc.desc Verify literal 0 dispatch with buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const a = new Float64Array();
      const b = new Float64Array(0);
      expect(a.length).assertEqual(zeroValue);
      expect(b.length).assertEqual(zeroValue);
      expect(a.byteLength).assertEqual(zeroValue);
      expect(b.byteLength).assertEqual(zeroValue);
      expect(a.buffer.byteLength).assertEqual(zeroValue);
      expect(b.buffer.byteLength).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0940
     * @tc.name testFloat64ArrayConstructor5094
     * @tc.desc Verify literal 1 dispatch with byteOffset and buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const eightValue: number = 8;
      const zeroValue: number = 0;
      const arr = new Float64Array(1);
      expect(arr.length).assertEqual(oneValue);
      expect(arr.byteLength).assertEqual(eightValue);
      expect(arr.byteOffset).assertEqual(zeroValue);
      expect(arr.buffer.byteLength).assertEqual(eightValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0950
     * @tc.name testFloat64ArrayConstructor5095
     * @tc.desc Verify single-element array dispatch with content and byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue42: number = 42.0;
      const oneValue: number = 1;
      const eightValue: number = 8;
      const arr = new Float64Array([fillValue42]);
      expect(arr.length).assertEqual(oneValue);
      expect(arr[0]).assertEqual(fillValue42);
      expect(arr.byteLength).assertEqual(eightValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0960
     * @tc.name testFloat64ArrayConstructor5096
     * @tc.desc Verify multi-element array dispatch with first and last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const fourPointZero: number = 4.0;
      const fourValue: number = 4;
      const arr = new Float64Array([onePointZero, twoPointZero, threePointZero, fourPointZero]);
      expect(arr.length).assertEqual(fourValue);
      expect(arr[0]).assertEqual(onePointZero);
      expect(arr[3]).assertEqual(fourPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0970
     * @tc.name testFloat64ArrayConstructor5097
     * @tc.desc Verify ArrayBuffer dispatch with buffer and byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const twentyfourValue: number = 24;
      const buf = new ArrayBuffer(24);
      const arr = new Float64Array(buf);
      expect(arr.buffer).assertEqual(buf);
      expect(arr.length).assertEqual(threeValue);
      expect(arr.byteLength).assertEqual(twentyfourValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0980
     * @tc.name testFloat64ArrayConstructor5098
     * @tc.desc Verify FixedArray dispatch with first and last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiveValue: number = 5;
      const onePointZero: number = 1.0;
      const fivePointZero: number = 5.0;
      const fa: FixedArray<number> = [1.0, 2.0, 3.0, 4.0, 5.0];
      const arr = new Float64Array(fa);
      expect(arr.length).assertEqual(fiveValue);
      expect(arr[0]).assertEqual(onePointZero);
      expect(arr[4]).assertEqual(fivePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_0990
     * @tc.name testFloat64ArrayConstructor5099
     * @tc.desc Verify Array<number> dispatch with first and last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixValue: number = 6;
      const onePointZero: number = 1.0;
      const sixPointZero: number = 6.0;
      const aa: Array<number> = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0];
      const arr = new Float64Array(aa);
      expect(arr.length).assertEqual(sixValue);
      expect(arr[0]).assertEqual(onePointZero);
      expect(arr[5]).assertEqual(sixPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1000
     * @tc.name testFloat64ArrayConstructor5100
     * @tc.desc Verify Iterable<Number> dispatch with first and last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiveValue: number = 5;
      const onePointZero: number = 1.0;
      const fivePointZero: number = 5.0;
      const ii: Iterable<Number> = [1.0, 2.0, 3.0, 4.0, 5.0];
      const arr = new Float64Array(ii);
      expect(arr.length).assertEqual(fiveValue);
      expect(arr[0]).assertEqual(onePointZero);
      expect(arr[4]).assertEqual(fivePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1010
     * @tc.name testFloat64ArrayConstructor5101
     * @tc.desc Verify two-arg ArrayBuffer plus int offset dispatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightValue: number = 8;
      const twentyfourValue: number = 24;
      const threeValue: number = 3;
      const buf = new ArrayBuffer(32);
      const arr = new Float64Array(buf, 8);
      expect(arr.buffer).assertEqual(buf);
      expect(arr.byteOffset).assertEqual(eightValue);
      expect(arr.byteLength).assertEqual(twentyfourValue);
      expect(arr.length).assertEqual(threeValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1020
     * @tc.name testFloat64ArrayConstructor5102
     * @tc.desc Verify two-arg ArrayBuffer plus number offset dispatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixteenValue: number = 16;
      const twoValue: number = 2;
      const buf = new ArrayBuffer(32);
      const offset: number = 16.0;
      const arr = new Float64Array(buf, offset);
      expect(arr.buffer).assertEqual(buf);
      expect(arr.byteOffset).assertEqual(sixteenValue);
      expect(arr.byteLength).assertEqual(sixteenValue);
      expect(arr.length).assertEqual(twoValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1030
     * @tc.name testFloat64ArrayConstructor5103
     * @tc.desc Verify three-arg ArrayBuffer plus int plus int dispatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixteenValue: number = 16;
      const twoValue: number = 2;
      const buf = new ArrayBuffer(48);
      const arr = new Float64Array(buf, 16, 2);
      expect(arr.buffer).assertEqual(buf);
      expect(arr.byteOffset).assertEqual(sixteenValue);
      expect(arr.length).assertEqual(twoValue);
      expect(arr.byteLength).assertEqual(sixteenValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1040
     * @tc.name testFloat64ArrayConstructor5104
     * @tc.desc Verify three-arg ArrayBuffer plus undefined offset plus int length dispatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const twentyfourValue: number = 24;
      const buf = new ArrayBuffer(32);
      const off: Number | undefined = undefined;
      const arr = new Float64Array(buf, off, 3);
      expect(arr.byteOffset).assertEqual(zeroValue);
      expect(arr.length).assertEqual(threeValue);
      expect(arr.byteLength).assertEqual(twentyfourValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1050
     * @tc.name testFloat64ArrayConstructor5105
     * @tc.desc Verify three-arg ArrayBuffer plus int offset plus undefined length dispatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightValue: number = 8;
      const threeValue: number = 3;
      const twentyfourValue: number = 24;
      const buf = new ArrayBuffer(32);
      const len: Number | undefined = undefined;
      const arr = new Float64Array(buf, 8, len);
      expect(arr.byteOffset).assertEqual(eightValue);
      expect(arr.length).assertEqual(threeValue);
      expect(arr.byteLength).assertEqual(twentyfourValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1060
     * @tc.name testFloat64ArrayConstructor5106
     * @tc.desc Verify length property consistency across all overloads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const zeroValue: number = 0;
      const fiveValue: number = 5;
      const twoValue: number = 2;
      const a = new Float64Array();
      const b = new Float64Array(0);
      const c = new Float64Array(5);
      const d = new Float64Array([onePointZero, twoPointZero]);
      const e = new Float64Array(new ArrayBuffer(16));
      expect(a.length).assertEqual(zeroValue);
      expect(b.length).assertEqual(zeroValue);
      expect(c.length).assertEqual(fiveValue);
      expect(d.length).assertEqual(twoValue);
      expect(e.length).assertEqual(twoValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1070
     * @tc.name testFloat64ArrayConstructor5107
     * @tc.desc Verify byteLength property consistency across all overloads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const zeroValue: number = 0;
      const fortyValue: number = 40;
      const twentyfourValue: number = 24;
      const a = new Float64Array();
      const b = new Float64Array(5);
      const c = new Float64Array([onePointZero, twoPointZero, threePointZero]);
      const d = new Float64Array(new ArrayBuffer(24));
      expect(a.byteLength).assertEqual(zeroValue);
      expect(b.byteLength).assertEqual(fortyValue);
      expect(c.byteLength).assertEqual(twentyfourValue);
      expect(d.byteLength).assertEqual(twentyfourValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1080
     * @tc.name testFloat64ArrayConstructor5108
     * @tc.desc Verify byteOffset property consistency across all overloads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroValue: number = 0;
      const a = new Float64Array();
      const b = new Float64Array(5);
      const c = new Float64Array([onePointZero]);
      const buf = new ArrayBuffer(16);
      const d = new Float64Array(buf);
      expect(a.byteOffset).assertEqual(zeroValue);
      expect(b.byteOffset).assertEqual(zeroValue);
      expect(c.byteOffset).assertEqual(zeroValue);
      expect(d.byteOffset).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1090
     * @tc.name testFloat64ArrayConstructor5109
     * @tc.desc Verify property consistency between copy construction and original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const src = new Float64Array([onePointZero, twoPointZero, threePointZero]);
      const copy = new Float64Array(src);
      expect(copy.length).assertEqual(src.length);
      expect(copy.byteLength).assertEqual(src.byteLength);
      expect(copy.byteOffset).assertEqual(src.byteOffset);
      expect(copy.BYTES_PER_ELEMENT).assertEqual(src.BYTES_PER_ELEMENT);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1100
     * @tc.name testFloat64ArrayConstructor5110
     * @tc.desc Verify property relationship between view and original buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fortyValue: number = 40;
      const twentyfourValue: number = 24;
      const eightValue: number = 8;
      const threeValue: number = 3;
      const buf = new ArrayBuffer(40);
      const view = new Float64Array(buf, 8, 3);
      expect(view.buffer).assertEqual(buf);
      expect(view.buffer.byteLength).assertEqual(fortyValue);
      expect(view.byteLength).assertEqual(twentyfourValue);
      expect(view.byteOffset).assertEqual(eightValue);
      expect(view.length).assertEqual(threeValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1110
     * @tc.name testFloat64ArrayConstructor5111
     * @tc.desc Verify instance identity preserved after exception - valid construction properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const buf = new ArrayBuffer(16);
      try {
        new Float64Array(buf, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const valid = new Float64Array(buf, 0);
      let isValid: boolean = false;
      const obj: Object = valid as Object;
      if (obj instanceof Float64Array) {
        isValid = true;
      }
      const expectVal = true;
      expect(isValid).assertEqual(expectVal);
      expect(valid.length).assertEqual(twoValue);
      expect(valid.name).assertEqual('Float64Array');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1120
     * @tc.name testFloat64ArrayConstructor5112
     * @tc.desc Verify instance identity preserved after negative length exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      try {
        new Float64Array(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const valid = new Float64Array(1);
      expect(valid.length).assertEqual(oneValue);
      let isValid: boolean = false;
      const obj: Object = valid as Object;
      if (obj instanceof Float64Array) {
        isValid = true;
      }
      const expectVal = true;
      expect(isValid).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1130
     * @tc.name testFloat64ArrayConstructor5113
     * @tc.desc Verify instance identity preserved after huge offset exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      try {
        const buf = new ArrayBuffer(8);
        new Float64Array(buf, 100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const valid = new Float64Array(new ArrayBuffer(16), 0);
      expect(valid.length).assertEqual(twoValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1140
     * @tc.name testFloat64ArrayConstructor5114
     * @tc.desc Verify all original array property immutability after copy construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const fourPointZero: number = 4.0;
      const fourValue: number = 4;
      const thirtytwoValue: number = 32;
      const zeroValue: number = 0;
      const src = new Float64Array([onePointZero, twoPointZero, threePointZero, fourPointZero]);
      const copy = new Float64Array(src);
      copy[0] = 999.0;
      expect(src.length).assertEqual(fourValue);
      expect(src.byteLength).assertEqual(thirtytwoValue);
      expect(src.byteOffset).assertEqual(zeroValue);
      expect(src[0]).assertEqual(onePointZero);
      expect(src.name).assertEqual('Float64Array');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1150
     * @tc.name testFloat64ArrayConstructor5115
     * @tc.desc Verify all copy property immutability after modifying original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const fourPointZero: number = 4.0;
      const fourValue: number = 4;
      const thirtytwoValue: number = 32;
      const zeroValue: number = 0;
      const src = new Float64Array([onePointZero, twoPointZero, threePointZero, fourPointZero]);
      const copy = new Float64Array(src);
      src[0] = 888.0;
      expect(copy.length).assertEqual(fourValue);
      expect(copy.byteLength).assertEqual(thirtytwoValue);
      expect(copy.byteOffset).assertEqual(zeroValue);
      expect(copy[0]).assertEqual(onePointZero);
      expect(copy.name).assertEqual('Float64Array');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1160
     * @tc.name testFloat64ArrayConstructor5116
     * @tc.desc Verify parent view property immutability after view sharing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourValue: number = 4;
      const thirtytwoValue: number = 32;
      const zeroValue: number = 0;
      const buf = new ArrayBuffer(32);
      const parent = new Float64Array(buf, 0, 4);
      const child = new Float64Array(buf, 16, 2);
      child[0] = 777.0;
      expect(parent.length).assertEqual(fourValue);
      expect(parent.byteLength).assertEqual(thirtytwoValue);
      expect(parent.byteOffset).assertEqual(zeroValue);
      expect(parent.buffer).assertEqual(buf);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1170
     * @tc.name testFloat64ArrayConstructor5117
     * @tc.desc Verify child view property immutability after view sharing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const sixteenValue: number = 16;
      const buf = new ArrayBuffer(32);
      const parent = new Float64Array(buf, 0, 4);
      const child = new Float64Array(buf, 16, 2);
      parent[2] = 555.0;
      expect(child.length).assertEqual(twoValue);
      expect(child.byteLength).assertEqual(sixteenValue);
      expect(child.byteOffset).assertEqual(sixteenValue);
      expect(child.buffer).assertEqual(buf);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1180
     * @tc.name testFloat64ArrayConstructor5118
     * @tc.desc Verify multi-view shared buffer reference equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(48);
      const v1 = new Float64Array(buf, 0, 2);
      const v2 = new Float64Array(buf, 16, 2);
      const v3 = new Float64Array(buf, 32, 2);
      expect(v1.buffer).assertEqual(v2.buffer);
      expect(v2.buffer).assertEqual(v3.buffer);
      expect(v1.buffer).assertEqual(buf);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1190
     * @tc.name testFloat64ArrayConstructor5119
     * @tc.desc Verify copy and original buffer reference equal but content independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const hundredPointzero: number = 100.0;
      const num200Pointzero: number = 200.0;
      const src = new Float64Array([onePointZero, twoPointZero, threePointZero]);
      const copy = new Float64Array(src);
      copy[0] = 100.0;
      src[1] = 200.0;
      expect(copy[0]).assertEqual(hundredPointzero);
      expect(copy[1]).assertEqual(twoPointZero);
      expect(src[0]).assertEqual(onePointZero);
      expect(src[1]).assertEqual(num200Pointzero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1200
     * @tc.name testFloat64ArrayConstructor5120
     * @tc.desc Verify visibility of all shared views after view write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num123Pointzero: number = 123.0;
      const num456Pointzero: number = 456.0;
      const buf = new ArrayBuffer(48);
      const v1 = new Float64Array(buf, 0, 4);
      const v2 = new Float64Array(buf, 8, 4);
      v1[1] = 123.0;
      expect(v2[0]).assertEqual(num123Pointzero);
      v2[2] = 456.0;
      expect(v1[3]).assertEqual(num456Pointzero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1210
     * @tc.name testFloat64ArrayConstructor5121
     * @tc.desc Verify independence between original and copy after copy construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const tenPointZero: number = 10.0;
      const twentyPointzero: number = 20.0;
      const threeValue: number = 3;
      const src = new Float64Array([onePointZero, twoPointZero, threePointZero]);
      const copy = new Float64Array(src);
      src[0] = 10.0;
      copy[0] = 20.0;
      expect(src[0]).assertEqual(tenPointZero);
      expect(copy[0]).assertEqual(twentyPointzero);
      expect(src.length).assertEqual(threeValue);
      expect(copy.length).assertEqual(threeValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1220
     * @tc.name testFloat64ArrayConstructor5122
     * @tc.desc Verify buffer sharing after copy construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const twentyfourValue: number = 24;
      const num999Pointzero: number = 999.0;
      const src = new Float64Array([onePointZero, twoPointZero, threePointZero]);
      const copy = new Float64Array(src);
      expect(src.buffer.byteLength).assertEqual(twentyfourValue);
      expect(copy.buffer.byteLength).assertEqual(twentyfourValue);
      src.$_set(0, num999Pointzero);
      const actVal5 = copy.$_get(0);
      const expectVal = onePointZero;
      expect(actVal5).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1230
     * @tc.name testFloat64ArrayConstructor5123
     * @tc.desc Verify byteOffset sharing after copy construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightValue: number = 8;
      const zeroValue: number = 0;
      const buf = new ArrayBuffer(32);
      const src = new Float64Array(buf, 8, 2);
      const copy = new Float64Array(src);
      expect(src.byteOffset).assertEqual(eightValue);
      expect(copy.byteOffset).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1240
     * @tc.name testFloat64ArrayConstructor5124
     * @tc.desc Verify byteLength sharing after copy construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const fourPointZero: number = 4.0;
      const thirtytwoValue: number = 32;
      const src = new Float64Array([onePointZero, twoPointZero, threePointZero, fourPointZero]);
      const copy = new Float64Array(src);
      expect(src.byteLength).assertEqual(copy.byteLength);
      expect(src.byteLength).assertEqual(thirtytwoValue);
      expect(copy.byteLength).assertEqual(thirtytwoValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1250
     * @tc.name testFloat64ArrayConstructor5125
     * @tc.desc Verify BYTES_PER_ELEMENT consistency after copy construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const sixteenValue: number = 16;
      const src = new Float64Array([onePointZero, twoPointZero]);
      const copy = new Float64Array(src);
      expect(src.BYTES_PER_ELEMENT).assertEqual(copy.BYTES_PER_ELEMENT);
      expect(src.byteLength).assertEqual(sixteenValue);
      expect(copy.byteLength).assertEqual(sixteenValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1260
     * @tc.name testFloat64ArrayConstructor5126
     * @tc.desc Verify name property consistency after copy construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const src = new Float64Array([onePointZero, twoPointZero]);
      const copy = new Float64Array(src);
      expect(src.name).assertEqual(copy.name);
      expect(src.name).assertEqual('Float64Array');
      expect(copy.name).assertEqual('Float64Array');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1270
     * @tc.name testFloat64ArrayConstructor5127
     * @tc.desc Verify instanceof type check after copy construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const twoValue: number = 2;
      const src = new Float64Array([onePointZero, twoPointZero]);
      const copy = new Float64Array(src);
      const objs: Array<Object> = [src, copy];
      let count: int = 0;
      for (let i: int = 0; i < objs.length; i++) {
        if (objs[i] instanceof Float64Array) {
          count = count + 1;
        }
      }
      const expectVal = twoValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1280
     * @tc.name testFloat64ArrayConstructor5128
     * @tc.desc Verify ArrayBuffer originality after copy construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const twoValue: number = 2;
      const src = new Float64Array([onePointZero, twoPointZero, threePointZero]);
      const copy = new Float64Array(src);
      const objs: Array<Object> = [src.buffer, copy.buffer];
      let count: int = 0;
      for (let i: int = 0; i < objs.length; i++) {
        if (objs[i] instanceof ArrayBuffer) {
          count = count + 1;
        }
      }
      const expectVal = twoValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1290
     * @tc.name testFloat64ArrayConstructor5129
     * @tc.desc Verify buffer not modified after copy construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twentyfourValue: number = 24;
      const buf = new ArrayBuffer(24);
      const src = new Float64Array(buf, 0, 3);
      const copy = new Float64Array(src);
      copy[0] = 999.0;
      expect(buf.byteLength).assertEqual(twentyfourValue);
      expect(src.buffer).assertEqual(buf);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1300
     * @tc.name testFloat64ArrayConstructor5130
     * @tc.desc Verify value consistency across all views after multi-view write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const fourPointZero: number = 4.0;
      const fivePointZero: number = 5.0;
      const sixPointZero: number = 6.0;
      const buf = new ArrayBuffer(48);
      const v1 = new Float64Array(buf, 0, 4);
      const v2 = new Float64Array(buf, 16, 2);
      const v3 = new Float64Array(buf, 32, 2);
      v1[0] = 1.0;
      v1[1] = 2.0;
      v2[0] = 3.0;
      v2[1] = 4.0;
      v3[0] = 5.0;
      v3[1] = 6.0;
      expect(v1[0]).assertEqual(onePointZero);
      expect(v1[1]).assertEqual(twoPointZero);
      expect(v2[0]).assertEqual(threePointZero);
      expect(v2[1]).assertEqual(fourPointZero);
      expect(v3[0]).assertEqual(fivePointZero);
      expect(v3[1]).assertEqual(sixPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1310
     * @tc.name testFloat64ArrayConstructor5131
     * @tc.desc Verify original fields unchanged after modifying copy elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const threeValue: number = 3;
      const twentyfourValue: number = 24;
      const src = new Float64Array([onePointZero, twoPointZero, threePointZero]);
      const copy = new Float64Array(src);
      copy[0] = 1.0e-10;
      copy[1] = 1.0e10;
      copy[2] = 0.0;
      expect(src[0]).assertEqual(onePointZero);
      expect(src[1]).assertEqual(twoPointZero);
      expect(src[2]).assertEqual(threePointZero);
      expect(src.length).assertEqual(threeValue);
      expect(src.byteLength).assertEqual(twentyfourValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1320
     * @tc.name testFloat64ArrayConstructor5132
     * @tc.desc Verify copy fields unchanged after modifying original elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const threeValue: number = 3;
      const twentyfourValue: number = 24;
      const src = new Float64Array([onePointZero, twoPointZero, threePointZero]);
      const copy = new Float64Array(src);
      src[0] = -1.0e-10;
      src[1] = -1.0e10;
      src[2] = -0.0;
      expect(copy[0]).assertEqual(onePointZero);
      expect(copy[1]).assertEqual(twoPointZero);
      expect(copy[2]).assertEqual(threePointZero);
      expect(copy.length).assertEqual(threeValue);
      expect(copy.byteLength).assertEqual(twentyfourValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1330
     * @tc.name testFloat64ArrayConstructor5133
     * @tc.desc Verify value passing through overlapping region write in view sharing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twentyPointzero: number = 20.0;
      const thirtyPointzero: number = 30.0;
      const fortyPointzero: number = 40.0;
      const buf = new ArrayBuffer(48);
      const v1 = new Float64Array(buf, 0, 4);
      const v2 = new Float64Array(buf, 8, 4);
      v1[0] = 10.0;
      v1[1] = 20.0;
      v1[2] = 30.0;
      v1[3] = 40.0;
      expect(v2[0]).assertEqual(twentyPointzero);
      expect(v2[1]).assertEqual(thirtyPointzero);
      expect(v2[2]).assertEqual(fortyPointzero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1340
     * @tc.name testFloat64ArrayConstructor5134
     * @tc.desc Verify child region write visibility from parent region in view sharing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const pointTwoFive: number = 0.25;
      const buf = new ArrayBuffer(32);
      const parent = new Float64Array(buf, 0, 4);
      const child = new Float64Array(buf, 8, 2);
      child[0] = 0.5;
      child[1] = 0.25;
      expect(parent[1]).assertEqual(pointFive);
      expect(parent[2]).assertEqual(pointTwoFive);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1350
     * @tc.name testFloat64ArrayConstructor5135
     * @tc.desc Verify parent region write visibility from child region in view sharing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const buf = new ArrayBuffer(32);
      const parent = new Float64Array(buf, 0, 4);
      const child = new Float64Array(buf, 8, 2);
      parent[1] = 0.125;
      parent[2] = 0.0625;
      expect(child[0]).assertEqual(pointOneTwoFive);
      expect(child[1]).assertEqual(pointZeroSixTwoFive);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1360
     * @tc.name testFloat64ArrayConstructor5136
     * @tc.desc Verify all view value consistency after three-view continuous write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const fourPointZero: number = 4.0;
      const twoPointZero: number = 2.0;
      const fivePointZero: number = 5.0;
      const threePointZero: number = 3.0;
      const sixPointZero: number = 6.0;
      const buf = new ArrayBuffer(48);
      const v1 = new Float64Array(buf, 0, 4);
      const v2 = new Float64Array(buf, 16, 2);
      const v3 = new Float64Array(buf, 32, 2);
      v1[0] = 1.0;
      v2[0] = 2.0;
      v3[0] = 3.0;
      v1[1] = 4.0;
      v2[1] = 5.0;
      v3[1] = 6.0;
      expect(v1[0]).assertEqual(onePointZero);
      expect(v1[1]).assertEqual(fourPointZero);
      expect(v2[0]).assertEqual(twoPointZero);
      expect(v2[1]).assertEqual(fivePointZero);
      expect(v3[0]).assertEqual(threePointZero);
      expect(v3[1]).assertEqual(sixPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1370
     * @tc.name testFloat64ArrayConstructor5137
     * @tc.desc Verify complete independence between original and copy after copy construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const fourPointZero: number = 4.0;
      const fivePointZero: number = 5.0;
      const fiveValue: number = 5;
      const fortyValue: number = 40;
      const zeroValue: number = 0;
      const num999Pointzero: number = 999.0;
      const num888Pointzero: number = 888.0;
      const src = new Float64Array([onePointZero, twoPointZero, threePointZero, fourPointZero, fivePointZero]);
      const copy = new Float64Array(src);
      expect(copy.length).assertEqual(fiveValue);
      expect(copy.byteLength).assertEqual(fortyValue);
      expect(copy.byteOffset).assertEqual(zeroValue);
      expect(copy[0]).assertEqual(onePointZero);
      expect(copy.name).assertEqual('Float64Array');
      copy[0] = 999.0;
      src[4] = 888.0;
      expect(copy[0]).assertEqual(num999Pointzero);
      expect(src[4]).assertEqual(num888Pointzero);
      expect(copy[4]).assertEqual(fivePointZero);
      expect(src[0]).assertEqual(onePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1380
     * @tc.name testFloat64ArrayConstructor5138
     * @tc.desc Verify dispatch differentiation between ArrayBuffer and ArrayLike for ArrayLike instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const src: Array<number> = [1.0, 2.0];
      const al: ArrayLike<Number> = src;
      const arr = new Float64Array(al);
      expect(arr.length).assertEqual(twoValue);
      expect(arr[0]).assertEqual(onePointZero);
      expect(arr[1]).assertEqual(twoPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1390
     * @tc.name testFloat64ArrayConstructor5139
     * @tc.desc Verify ArrayLike<Number> dispatch with first and last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const tenPointZero: number = 10.0;
      const thirtyPointzero: number = 30.0;
      const src: Array<number> = [10.0, 20.0, 30.0];
      const al: ArrayLike<Number> = src;
      const arr = new Float64Array(al);
      expect(arr.length).assertEqual(threeValue);
      expect(arr[0]).assertEqual(tenPointZero);
      expect(arr[2]).assertEqual(thirtyPointzero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1400
     * @tc.name testFloat64ArrayConstructor5140
     * @tc.desc Verify Float64Array copy constructor keeps negative first value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const src = Float64Array.of(int32MinValue, -1, zeroValue);
      const arr = new Float64Array(src);
      expect(arr[0] === 1.0).assertEqual(false);
      expect(arr[0] === 9.0).assertEqual(false);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1410
     * @tc.name testFloat64ArrayConstructor5141
     * @tc.desc Verify Float64Array copy constructor preserves hex literal 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const num255Value: number = 255;
      const arr = Float64Array.of(hexValueFF);
      const copy = new Float64Array(arr);
      const expectVal = num255Value;
      expect(copy[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_5_1420
     * @tc.name testFloat64ArrayConstructor5142
     * @tc.desc Verify Float64Array copy constructor preserves binary literal 0b11111111
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor5142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const num255Value: number = 255;
      const arr = Float64Array.of(binaryValue11111111);
      const copy = new Float64Array(arr);
      const expectVal = num255Value;
      expect(copy[0]).assertEqual(expectVal);
    })

  })
}
