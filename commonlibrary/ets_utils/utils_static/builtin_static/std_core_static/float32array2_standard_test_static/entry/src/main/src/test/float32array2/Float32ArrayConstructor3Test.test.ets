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

export default function Float32ArrayConstructor3Test(): void {
  describe('Float32ArrayConstructor3Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(45);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0010
     * @tc.name testFloat32ArrayConstructorThree001
     * @tc.desc Verify overload 10 number offset 0.0 on 8 buffer view length is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 0.0;
      const arr = new Float32Array(new ArrayBuffer(8), off);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0020
     * @tc.name testFloat32ArrayConstructorThree002
     * @tc.desc Verify overload 10 number offset 4.0 on 8 buffer view length is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 4.0;
      const arr = new Float32Array(new ArrayBuffer(8), off);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0030
     * @tc.name testFloat32ArrayConstructorThree003
     * @tc.desc Verify overload 10 number offset 8.0 on 8 buffer view length is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 8.0;
      const arr = new Float32Array(new ArrayBuffer(8), off);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0040
     * @tc.name testFloat32ArrayConstructorThree004
     * @tc.desc Verify overload 10 number offset 4.9 truncates to 4 after view length is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 4.9;
      const arr = new Float32Array(new ArrayBuffer(8), off);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0050
     * @tc.name testFloat32ArrayConstructorThree005
     * @tc.desc Verify overload 10 number offset 8.9 truncates to 8 after view length is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 8.9;
      const arr = new Float32Array(new ArrayBuffer(8), off);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0060
     * @tc.name testFloat32ArrayConstructorThree006
     * @tc.desc Verify overload 10 number offset 0.9 truncates to 0 after view length is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 0.9;
      const arr = new Float32Array(new ArrayBuffer(8), off);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0070
     * @tc.name testFloat32ArrayConstructorThree007
     * @tc.desc Verify overload 10 number offset 0.5 truncates to 0 after on 4 buffer length is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 0.5;
      const arr = new Float32Array(new ArrayBuffer(4), off);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0080
     * @tc.name testFloat32ArrayConstructorThree008
     * @tc.desc Verify overload 10 number offset 12.0 on 16 buffer view length is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 12.0;
      const arr = new Float32Array(new ArrayBuffer(16), off);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0090
     * @tc.name testFloat32ArrayConstructorThree009
     * @tc.desc Verify overload 10 number offset 12.9 truncates to 12 after view length is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 12.9;
      const arr = new Float32Array(new ArrayBuffer(16), off);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0100
     * @tc.name testFloat32ArrayConstructorThree010
     * @tc.desc Verify overload 10 number offset 4.0 after truncation byteOffset property is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 4.0;
      const arr = new Float32Array(new ArrayBuffer(8), off);
      expect(arr.byteOffset).assertEqual(4);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0110
     * @tc.name testFloat32ArrayConstructorThree011
     * @tc.desc Verify overload 10 number offset 4.9 after truncation byteOffset property is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 4.9;
      const arr = new Float32Array(new ArrayBuffer(8), off);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0120
     * @tc.name testFloat32ArrayConstructorThree012
     * @tc.desc Verify overload 10 number offset 0.0 byteOffset property is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 0.0;
      const arr = new Float32Array(new ArrayBuffer(8), off);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0130
     * @tc.name testFloat32ArrayConstructorThree013
     * @tc.desc Verify overload 10 number offset 8.0 on 16 buffer view length is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 8.0;
      const arr = new Float32Array(new ArrayBuffer(16), off);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0140
     * @tc.name testFloat32ArrayConstructorThree014
     * @tc.desc Verify overload 10 number offset -0.0 truncates to 0 after view length is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = -0.0;
      const arr = new Float32Array(new ArrayBuffer(8), off);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0150
     * @tc.name testFloat32ArrayConstructorThree015
     * @tc.desc Verify overload 10 number offset 0.999 truncates to 0 after view length is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 0.999;
      const arr = new Float32Array(new ArrayBuffer(4), off);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0160
     * @tc.name testFloat32ArrayConstructorThree016
     * @tc.desc Verify overload 10 number offset 0.0 on 0 buffer view length is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 0.0;
      const arr = new Float32Array(new ArrayBuffer(0), off);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0170
     * @tc.name testFloat32ArrayConstructorThree017
     * @tc.desc Verify overload 10 number offset 0.0 on 4 buffer view length is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 0.0;
      const arr = new Float32Array(new ArrayBuffer(4), off);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0180
     * @tc.name testFloat32ArrayConstructorThree018
     * @tc.desc Verify overload 10 number offset equals buffer 8.0 to empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 8.0;
      const arr = new Float32Array(new ArrayBuffer(8), off);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0190
     * @tc.name testFloat32ArrayConstructorThree019
     * @tc.desc Verify overload 10 number offset 16.0 equals 16 buffer to empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 16.0;
      const arr = new Float32Array(new ArrayBuffer(16), off);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0200
     * @tc.name testFloat32ArrayConstructorThree020
     * @tc.desc Verify overload 10 number offset 0.0 on 100 buffer view length is 25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 0.0;
      const arr = new Float32Array(new ArrayBuffer(100), off);
      expect(arr.length).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0210
     * @tc.name testFloat32ArrayConstructorThree021
     * @tc.desc Verify overload 10 number offset 96.0 on 100 buffer view length is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 96.0;
      const arr = new Float32Array(new ArrayBuffer(100), off);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0220
     * @tc.name testFloat32ArrayConstructorThree022
     * @tc.desc Verify overload 10 number offset view BYTES_PER_ELEMENT is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 0.0;
      const arr = new Float32Array(new ArrayBuffer(8), off);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
      expect(arr.length).assertEqual(2);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0230
     * @tc.name testFloat32ArrayConstructorThree023
     * @tc.desc Verify overload 10 number offset view name is Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 0.0;
      const arr = new Float32Array(new ArrayBuffer(8), off);
      expect(arr.name).assertEqual('Float32Array');
      expect(arr.length).assertEqual(2);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0240
     * @tc.name testFloat32ArrayConstructorThree024
     * @tc.desc Verify overload 10 number offset view length and byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 0.0;
      const arr = new Float32Array(new ArrayBuffer(8), off);
      expect(arr.length).assertEqual(2);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0250
     * @tc.name testFloat32ArrayConstructorThree025
     * @tc.desc Verify overload 10 number offset view buffer equals source buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const off: number = 0.0;
      const arr = new Float32Array(buf, off);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0260
     * @tc.name testFloat32ArrayConstructorThree026
     * @tc.desc Verify overload 10 number offset NaN converts to 0 on 8 buffer view length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = NaN;
      const arr = new Float32Array(new ArrayBuffer(8), off);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0270
     * @tc.name testFloat32ArrayConstructorThree027
     * @tc.desc Verify overload 10 number offset 8.9 truncates to 8 after view byteOffset is 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 8.9;
      const arr = new Float32Array(new ArrayBuffer(16), off);
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0280
     * @tc.name testFloat32ArrayConstructorThree028
     * @tc.desc Verify overload 10 number offset 12.9 truncates to 12 after view byteLength is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 12.9;
      const arr = new Float32Array(new ArrayBuffer(16), off);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0290
     * @tc.name testFloat32ArrayConstructorThree029
     * @tc.desc Verify overload 10 number offset view $_set and $_get returns consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 0.0;
      const arr = new Float32Array(new ArrayBuffer(8), off);
      arr.$_set(0, 1.5);
      const element029 = arr.$_get(0);
      expect(element029).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0300
     * @tc.name testFloat32ArrayConstructorThree030
     * @tc.desc Verify overload 10 number offset view length 3 and byteLength 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 4.0;
      const arr = new Float32Array(new ArrayBuffer(16), off);
      expect(arr.length).assertEqual(3);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0310
     * @tc.name testFloat32ArrayConstructorThree031
     * @tc.desc Verify overload 10 number offset 5.9 truncates to 5 unaligned throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 5.9;
      const buf = new ArrayBuffer(16);
      try {
        new Float32Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0320
     * @tc.name testFloat32ArrayConstructorThree032
     * @tc.desc Verify overload 10 number offset 3.9 truncates to 3 unaligned throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 3.9;
      const buf = new ArrayBuffer(16);
      try {
        new Float32Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0330
     * @tc.name testFloat32ArrayConstructorThree033
     * @tc.desc Verify overload 10 number offset 2.5 truncates to 2 unaligned throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 2.5;
      const buf = new ArrayBuffer(16);
      try {
        new Float32Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0340
     * @tc.name testFloat32ArrayConstructorThree034
     * @tc.desc Verify overload 10 number offset 1.9 truncates to 1 unaligned throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 1.9;
      const buf = new ArrayBuffer(16);
      try {
        new Float32Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0350
     * @tc.name testFloat32ArrayConstructorThree035
     * @tc.desc Verify overload 10 number offset 6.7 truncates to 6 unaligned throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 6.7;
      const buf = new ArrayBuffer(16);
      try {
        new Float32Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0360
     * @tc.name testFloat32ArrayConstructorThree036
     * @tc.desc Verify overload 10 number offset 9.9 truncates to 9 unaligned throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 9.9;
      const buf = new ArrayBuffer(16);
      try {
        new Float32Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0370
     * @tc.name testFloat32ArrayConstructorThree037
     * @tc.desc Verify overload 10 number offset 7.5 truncates to 7 unaligned throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 7.5;
      const buf = new ArrayBuffer(16);
      try {
        new Float32Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0380
     * @tc.name testFloat32ArrayConstructorThree038
     * @tc.desc Verify overload 10 number offset 10.9 truncates to 10 unaligned throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 10.9;
      const buf = new ArrayBuffer(16);
      try {
        new Float32Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0390
     * @tc.name testFloat32ArrayConstructorThree039
     * @tc.desc Verify overload 10 number offset -1.0 negative offset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = -1.0;
      const buf = new ArrayBuffer(8);
      try {
        new Float32Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0400
     * @tc.name testFloat32ArrayConstructorThree040
     * @tc.desc Verify overload 10 number offset -4.0 negative offset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = -4.0;
      const buf = new ArrayBuffer(8);
      try {
        new Float32Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0410
     * @tc.name testFloat32ArrayConstructorThree041
     * @tc.desc Verify overload 10 number offset -8.0 negative offset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = -8.0;
      const buf = new ArrayBuffer(8);
      try {
        new Float32Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0420
     * @tc.name testFloat32ArrayConstructorThree042
     * @tc.desc Verify overload 10 number offset 20.0 exceeds 8 buffer throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 20.0;
      const buf = new ArrayBuffer(8);
      try {
        new Float32Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0430
     * @tc.name testFloat32ArrayConstructorThree043
     * @tc.desc Verify overload 10 number offset 16.1 truncates to 16 exceeds 8 buffer throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 16.1;
      const buf = new ArrayBuffer(8);
      try {
        new Float32Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0440
     * @tc.name testFloat32ArrayConstructorThree044
     * @tc.desc Verify overload 10 number offset 9.0 truncates to 9 unaligned and out of bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 9.0;
      const buf = new ArrayBuffer(8);
      try {
        new Float32Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0450
     * @tc.name testFloat32ArrayConstructorThree045
     * @tc.desc Verify overload 10 number offset throws after on instance fields remain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(8), 0);
      const off: number = -1.0;
      try {
        new Float32Array(new ArrayBuffer(8), off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0460
     * @tc.name testFloat32ArrayConstructorThree046
     * @tc.desc Verify overload 10 number offset view $_set writes is reflected in the underlying buffer (DataView reads)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const off: number = 0.0;
      const view = new Float32Array(buf, off);
      view.$_set(0, 1.5);
      const dv = new DataView(buf);
      const observedValue046 = dv.getFloat32(0, true);
      expect(observedValue046).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0470
     * @tc.name testFloat32ArrayConstructorThree047
     * @tc.desc Verify overload 10 DataView.setFloat32 writes is number offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const off: number = 0.0;
      const view = new Float32Array(buf, off);
      const dv = new DataView(buf);
      dv.setFloat32(4, 9.5, true);
      const element047 = view.$_get(1);
      expect(element047).assertEqual(9.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0480
     * @tc.name testFloat32ArrayConstructorThree048
     * @tc.desc Verify overload 10 number offset view and int offset view share the same buffer affects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const offNum: number = 0.0;
      const vNum = new Float32Array(buf, offNum);
      const vInt = new Float32Array(buf, 4);
      vNum.$_set(1, 7.5);
      const element048 = vInt.$_get(0);
      expect(element048).assertEqual(7.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0490
     * @tc.name testFloat32ArrayConstructorThree049
     * @tc.desc Verify overload 10 two number offset view buffer one reads another
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const off: number = 0.0;
      const observedValue049 = new Float32Array(buf, off);
      const observedValue049Part2 = new Float32Array(buf, off);
      observedValue049.$_set(0, 3.25);
      const element049 = observedValue049Part2.$_get(0);
      expect(element049).assertEqual(3.25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0500
     * @tc.name testFloat32ArrayConstructorThree050
     * @tc.desc Verify overload 10 number offset view $_set writes does not affect buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const off: number = 0.0;
      const view = new Float32Array(buf, off);
      view.$_set(0, 1.5);
      view.$_set(1, 2.5);
      expect(buf.byteLength).assertEqual(8);
      expect(view.$_get(0)).assertEqual(1.5);
      expect(view.$_get(1)).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0510
     * @tc.name testFloat32ArrayConstructorThree051
     * @tc.desc Verify overload 10 number offset 4.0 view writes is reflected in the underlying buffer 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const off: number = 4.0;
      const view = new Float32Array(buf, off);
      view.$_set(0, 6.5);
      const dv = new DataView(buf);
      const observedValue051 = dv.getFloat32(4, true);
      expect(observedValue051).assertEqual(6.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0520
     * @tc.name testFloat32ArrayConstructorThree052
     * @tc.desc Verify overload 10 number offset view writes maximum finite value after DataView read back consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const off: number = 0.0;
      const view = new Float32Array(buf, off);
      view.$_set(0, 3.4028234663852886e+38);
      const dv = new DataView(buf);
      const observedValue052 = dv.getFloat32(0, true);
      expect(observedValue052).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0530
     * @tc.name testFloat32ArrayConstructorThree053
     * @tc.desc Verify overload 10 number offset view writes after Uint8Array view by small observes changes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const off: number = 0.0;
      const view = new Float32Array(buf, off);
      view.$_set(0, 1.0);
      const bytes = new Uint8Array(buf);
      const element053 = bytes.$_get(0);
      expect(element053).assertEqual(0);
      const element053Part2 = bytes.$_get(3);
      expect(element053Part2).assertEqual(63);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0540
     * @tc.name testFloat32ArrayConstructorThree054
     * @tc.desc Verify overload 10 number offset view writes -0 after DataView reads is -0 (1/x is -Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const off: number = 0.0;
      const view = new Float32Array(buf, off);
      view.$_set(0, -0.0);
      const dv = new DataView(buf);
      const observedValue054 = 1.0 / dv.getFloat32(0, true);
      expect(observedValue054).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0550
     * @tc.name testFloat32ArrayConstructorThree055
     * @tc.desc Verify overload 10 number offset view writes NaN after DataView reads is NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const off: number = 0.0;
      const view = new Float32Array(buf, off);
      view.$_set(0, Number.NaN);
      const dv = new DataView(buf);
      const observedValue055 = dv.getFloat32(0, true);
      expect(observedValue055).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0560
     * @tc.name testFloat32ArrayConstructorThree056
     * @tc.desc Verify overload 11 byteOffset=0,length=2 on 16 buffer view length is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(16), 0, 2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0570
     * @tc.name testFloat32ArrayConstructorThree057
     * @tc.desc Verify overload 11 byteOffset=4,length=2 on 16 buffer view length is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(16), 4, 2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0580
     * @tc.name testFloat32ArrayConstructorThree058
     * @tc.desc Verify overload 11 byteOffset=8,length=1 on 16 buffer view length is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(16), 8, 1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0590
     * @tc.name testFloat32ArrayConstructorThree059
     * @tc.desc Verify overload 11 byteOffset=0,length=4 on 16 buffer view length is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(16), 0, 4);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0600
     * @tc.name testFloat32ArrayConstructorThree060
     * @tc.desc Verify overload 11 byteOffset=12,length=1 on 16 buffer view length is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(16), 12, 1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0610
     * @tc.name testFloat32ArrayConstructorThree061
     * @tc.desc Verify overload 11 byteOffset=4,length=3 on 16 buffer view length is 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(16), 4, 3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0620
     * @tc.name testFloat32ArrayConstructorThree062
     * @tc.desc Verify overload 11 length=0 on 8 buffer to empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(8), 0, 0);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0630
     * @tc.name testFloat32ArrayConstructorThree063
     * @tc.desc Verify overload 11 length=1 on 4 buffer view length is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(4), 0, 1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0640
     * @tc.name testFloat32ArrayConstructorThree064
     * @tc.desc Verify overload 11 length=3 on 16 buffer view length is 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(16), 0, 3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0650
     * @tc.name testFloat32ArrayConstructorThree065
     * @tc.desc Verify overload 11 length=5 on 20 buffer view length is 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(20), 0, 5);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0660
     * @tc.name testFloat32ArrayConstructorThree066
     * @tc.desc Verify overload 11 length=0 on 0 buffer to empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(0), 0, 0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0670
     * @tc.name testFloat32ArrayConstructorThree067
     * @tc.desc Verify overload 11 length=10 on 40 buffer view length is 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(40), 0, 10);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0680
     * @tc.name testFloat32ArrayConstructorThree068
     * @tc.desc Verify overload 11 length=25 on 100 buffer view length is 25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(100), 0, 25);
      expect(arr.length).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0690
     * @tc.name testFloat32ArrayConstructorThree069
     * @tc.desc Verify overload 11 byteOffset=0,length=0 on non zero buffer still is empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(16), 0, 0);
      expect(arr.length).assertEqual(0);
      expect(arr.buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0700
     * @tc.name testFloat32ArrayConstructorThree070
     * @tc.desc Verify overload 11 byteOffset=8,length=0 on 8 buffer to empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(8), 8, 0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0710
     * @tc.name testFloat32ArrayConstructorThree071
     * @tc.desc Verify overload 11 byteOffset=8,length=0 view byteOffset is 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(8), 8, 0);
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0720
     * @tc.name testFloat32ArrayConstructorThree072
     * @tc.desc Verify overload 11 byteOffset=4,length=3 16 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(16), 4, 3);
      const byteLengthValue073 = arr.byteOffset + arr.byteLength;
      expect(byteLengthValue073).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0730
     * @tc.name testFloat32ArrayConstructorThree073
     * @tc.desc Verify overload 11 byteOffset=0,length=4 16 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(16), 0, 4);
      const byteLengthValue074 = arr.byteOffset + arr.byteLength;
      expect(byteLengthValue074).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0740
     * @tc.name testFloat32ArrayConstructorThree074
     * @tc.desc Verify overload 11 length equals remaining element count (buf16,offset4,length3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4, 3);
      const lengthValue075 = arr.length * 4;
      expect(lengthValue075).assertEqual(buf.byteLength - 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0750
     * @tc.name testFloat32ArrayConstructorThree075
     * @tc.desc Verify overload 11 byteOffset=0,length=0 on 0 buffer length and byteLength are all 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(0), 0, 0);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0760
     * @tc.name testFloat32ArrayConstructorThree076
     * @tc.desc Verify overload 11 view (ArrayBuffer(24), 8, 2) length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(24), 8, 2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0770
     * @tc.name testFloat32ArrayConstructorThree077
     * @tc.desc Verify overload 11 view byteLength equals length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(16), 0, 3);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0780
     * @tc.name testFloat32ArrayConstructorThree078
     * @tc.desc Verify overload 11 view byteOffset equals byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(16), 8, 1);
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0790
     * @tc.name testFloat32ArrayConstructorThree079
     * @tc.desc Verify overload 11 view buffer equals source buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 0, 2);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0800
     * @tc.name testFloat32ArrayConstructorThree080
     * @tc.desc Verify overload 11 view BYTES_PER_ELEMENT is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(8), 0, 2);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
      expect(arr.length).assertEqual(2);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0810
     * @tc.name testFloat32ArrayConstructorThree081
     * @tc.desc Verify overload 11 view name is Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(8), 0, 2);
      expect(arr.name).assertEqual('Float32Array');
      expect(arr.length).assertEqual(2);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0820
     * @tc.name testFloat32ArrayConstructorThree082
     * @tc.desc Verify overload 11 view length and byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(8), 0, 2);
      expect(arr.length).assertEqual(2);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0830
     * @tc.name testFloat32ArrayConstructorThree083
     * @tc.desc Verify overload 11 byteOffset=8,length=2 view byteOffset is 8 byteLength is 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(16), 8, 2);
      expect(arr.byteOffset).assertEqual(8);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0840
     * @tc.name testFloat32ArrayConstructorThree084
     * @tc.desc Verify overload 11 number length 2.9 truncates to 2 on 16 buffer view byteLength 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 0;
      const len: number = 2.9;
      const arr = new Float32Array(new ArrayBuffer(16), off, len);
      expect(arr.length).assertEqual(2);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0850
     * @tc.name testFloat32ArrayConstructorThree085
     * @tc.desc Verify overload 11 length=1 view byteLength is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(8), 0, 1);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0860
     * @tc.name testFloat32ArrayConstructorThree086
     * @tc.desc Verify overload 11 view buffer.byteLength greater than or equal to view byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(32), 0, 2);
      expect(arr.buffer.byteLength).assertEqual(32);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0870
     * @tc.name testFloat32ArrayConstructorThree087
     * @tc.desc Verify overload 11 view $_set and $_get returns consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(8), 0, 2);
      arr.$_set(1, 2.5);
      const element088 = arr.$_get(1);
      expect(element088).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0880
     * @tc.name testFloat32ArrayConstructorThree088
     * @tc.desc Verify overload 11 view writes does not affect buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 0, 2);
      arr.$_set(0, 1.5);
      arr.$_set(1, 2.5);
      expect(buf.byteLength).assertEqual(16);
      expect(arr.$_get(0)).assertEqual(1.5);
      expect(arr.$_get(1)).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0890
     * @tc.name testFloat32ArrayConstructorThree089
     * @tc.desc Verify overload 11 view length writes within range and length subset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(16), 0, 2);
      expect(arr.length).assertEqual(2);
      arr.$_set(1, 1.0);
      const element090 = arr.$_get(1);
      expect(element090).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0900
     * @tc.name testFloat32ArrayConstructorThree090
     * @tc.desc Verify overload 11 view buffer capacity and view byteLength difference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const view = new Float32Array(buf, 4, 3);
      const byteLengthValue091 = view.buffer.byteLength - view.byteLength;
      expect(byteLengthValue091).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0910
     * @tc.name testFloat32ArrayConstructorThree091
     * @tc.desc Verify overload 11 byteOffset=2,length=1 unaligned throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Float32Array(buf, 2, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0920
     * @tc.name testFloat32ArrayConstructorThree092
     * @tc.desc Verify overload 11 byteOffset=1,length=1 unaligned throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Float32Array(buf, 1, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0930
     * @tc.name testFloat32ArrayConstructorThree093
     * @tc.desc Verify overload 11 byteOffset=3,length=1 unaligned throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Float32Array(buf, 3, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0940
     * @tc.name testFloat32ArrayConstructorThree094
     * @tc.desc Verify overload 11 byteOffset=6,length=2 unaligned throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      try {
        new Float32Array(buf, 6, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0950
     * @tc.name testFloat32ArrayConstructorThree095
     * @tc.desc Verify overload 11 byteOffset=5,length=1 unaligned throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      try {
        new Float32Array(buf, 5, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0960
     * @tc.name testFloat32ArrayConstructorThree096
     * @tc.desc Verify overload 11 byteOffset=10,length=1 unaligned throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      try {
        new Float32Array(buf, 10, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0970
     * @tc.name testFloat32ArrayConstructorThree097
     * @tc.desc Verify overload 11 byteOffset=-1,length=1 negative offset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Float32Array(buf, -1, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0980
     * @tc.name testFloat32ArrayConstructorThree098
     * @tc.desc Verify overload 11 byteOffset=-4,length=1 negative offset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Float32Array(buf, -4, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_0990
     * @tc.name testFloat32ArrayConstructorThree099
     * @tc.desc Verify overload 11 byteOffset=0,length=-1 negative length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Float32Array(buf, 0, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1000
     * @tc.name testFloat32ArrayConstructorThree100
     * @tc.desc Verify overload 11 byteOffset=0,length=-5 negative length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Float32Array(buf, 0, -5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1010
     * @tc.name testFloat32ArrayConstructorThree101
     * @tc.desc Verify overload 11 byteOffset=4,length=2 on 8 buffer out of bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Float32Array(buf, 4, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1020
     * @tc.name testFloat32ArrayConstructorThree102
     * @tc.desc Verify overload 11 byteOffset=0,length=5 on 16 buffer out of bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      try {
        new Float32Array(buf, 0, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1030
     * @tc.name testFloat32ArrayConstructorThree103
     * @tc.desc Verify overload 11 byteOffset=12,length=2 on 16 buffer out of bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      try {
        new Float32Array(buf, 12, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1040
     * @tc.name testFloat32ArrayConstructorThree104
     * @tc.desc Verify overload 11 byteOffset=16,length=1 on 16 buffer out of bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      try {
        new Float32Array(buf, 16, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1050
     * @tc.name testFloat32ArrayConstructorThree105
     * @tc.desc Verify overload 11 byteOffset=8,length=1 on 8 buffer out of bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Float32Array(buf, 8, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1060
     * @tc.name testFloat32ArrayConstructorThree106
     * @tc.desc Verify overload 11 negative length throws RangeError after source buffer capacity remains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Float32Array(buf, 0, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(buf.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1070
     * @tc.name testFloat32ArrayConstructorThree107
     * @tc.desc Verify overload 11 byteOffset+length out of bounds throws RangeError after existing view fields remains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const existing = new Float32Array(new ArrayBuffer(8), 0, 2);
      try {
        new Float32Array(new ArrayBuffer(8), 0, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(existing.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1080
     * @tc.name testFloat32ArrayConstructorThree108
     * @tc.desc Verify overload 11 unaligned byteOffset throws RangeError after another view remains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const valid = new Float32Array(buf, 0, 2);
      try {
        new Float32Array(buf, 1, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(valid.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1090
     * @tc.name testFloat32ArrayConstructorThree109
     * @tc.desc Verify overload 11 view $_set writes is reflected in the underlying buffer (DataView reads)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new Float32Array(buf, 0, 2);
      view.$_set(0, 1.5);
      const dv = new DataView(buf);
      const observedValue111 = dv.getFloat32(0, true);
      expect(observedValue111).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1100
     * @tc.name testFloat32ArrayConstructorThree110
     * @tc.desc Verify overload 11 DataView.setFloat32 writes is view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new Float32Array(buf, 0, 2);
      const dv = new DataView(buf);
      dv.setFloat32(4, 9.5, true);
      const element112 = view.$_get(1);
      expect(element112).assertEqual(9.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1110
     * @tc.name testFloat32ArrayConstructorThree111
     * @tc.desc Verify overload 11 two same byteOffset and length view buffer affects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const observedValue113 = new Float32Array(buf, 0, 2);
      const observedValue113Part2 = new Float32Array(buf, 0, 2);
      observedValue113.$_set(0, 11.0);
      const element113 = observedValue113Part2.$_get(0);
      expect(element113).assertEqual(11.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1120
     * @tc.name testFloat32ArrayConstructorThree112
     * @tc.desc Verify overload 11 offset view writes is reflected in whole-buffer view corresponding position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const full = new Float32Array(buf, 0, 4);
      const offset = new Float32Array(buf, 8, 2);
      offset.$_set(0, 22.0);
      const element114 = full.$_get(2);
      expect(element114).assertEqual(22.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1130
     * @tc.name testFloat32ArrayConstructorThree113
     * @tc.desc Verify overload 11 two overlapping views write through the shared region
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const observedValue115 = new Float32Array(buf, 0, 3);
      const observedValue115Part2 = new Float32Array(buf, 4, 3);
      observedValue115.$_set(1, 33.0);
      const element115 = observedValue115Part2.$_get(0);
      expect(element115).assertEqual(33.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1140
     * @tc.name testFloat32ArrayConstructorThree114
     * @tc.desc Verify overload 11 view subarray after modifying child view affects underlying buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new Float32Array(buf, 0, 2);
      const sub = view.subarray(1);
      sub.$_set(0, 8.5);
      const dv = new DataView(buf);
      const observedValue116 = dv.getFloat32(4, true);
      expect(observedValue116).assertEqual(8.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1150
     * @tc.name testFloat32ArrayConstructorThree115
     * @tc.desc Verify overload 11 view writes affects source buffer copy construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(1.0, 2.0);
      const copy = new Float32Array(src);
      const view = new Float32Array(src.buffer, 0, 2);
      copy.$_set(0, 100.0);
      view.$_set(0, 200.0);
      const element117 = src.$_get(0);
      expect(element117).assertEqual(200.0);
      const element117Part2 = copy.$_get(0);
      expect(element117Part2).assertEqual(100.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1160
     * @tc.name testFloat32ArrayConstructorThree116
     * @tc.desc Verify overload 11 non zero byteOffset view $_get reads for buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const setup = new Float32Array(buf, 0, 3);
      setup.$_set(2, 42.0);
      const view = new Float32Array(buf, 8, 1);
      const element118 = view.$_get(0);
      expect(element118).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1170
     * @tc.name testFloat32ArrayConstructorThree117
     * @tc.desc Verify overload 11 view writes -0 after DataView reads is -0 (1/x is -Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const view = new Float32Array(buf, 0, 1);
      view.$_set(0, -0.0);
      const dv = new DataView(buf);
      const observedValue119 = 1.0 / dv.getFloat32(0, true);
      expect(observedValue119).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1180
     * @tc.name testFloat32ArrayConstructorThree118
     * @tc.desc Verify overload 11 view writes Infinity after DataView reads is Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const view = new Float32Array(buf, 0, 1);
      view.$_set(0, Number.POSITIVE_INFINITY);
      const dv = new DataView(buf);
      const observedValue120 = dv.getFloat32(0, true);
      expect(observedValue120).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1190
     * @tc.name testFloat32ArrayConstructorThree119
     * @tc.desc Verify overload 11 view writes NaN after DataView reads is NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const view = new Float32Array(buf, 0, 1);
      view.$_set(0, Number.NaN);
      const dv = new DataView(buf);
      const observedValue121 = dv.getFloat32(0, true);
      expect(observedValue121).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1200
     * @tc.name testFloat32ArrayConstructorThree120
     * @tc.desc Verify overload 11 view buffer one is visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const observedValue122 = new Float32Array(buf, 0, 1);
      const observedValue122Part2 = new Float32Array(buf, 0, 1);
      const observedValue122Part3 = new Float32Array(buf, 0, 1);
      observedValue122.$_set(0, 66.0);
      const element122 = observedValue122Part2.$_get(0);
      expect(element122).assertEqual(66.0);
      const element122Part2 = observedValue122Part3.$_get(0);
      expect(element122Part2).assertEqual(66.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1210
     * @tc.name testFloat32ArrayConstructorThree121
     * @tc.desc Verify overload 11 view writes after another different length view byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const observedValue123 = new Float32Array(buf, 0, 2);
      const observedValue123Part2 = new Float32Array(buf, 0, 1);
      observedValue123.$_set(1, 5.0);
      expect(observedValue123Part2.byteLength).assertEqual(4);
      expect(observedValue123.$_get(1)).assertEqual(5.0);
      expect(observedValue123Part2.$_get(0)).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1220
     * @tc.name testFloat32ArrayConstructorThree122
     * @tc.desc Verify overload 11 buffer writes after toString changes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const observedValue124 = new Float32Array(buf, 0, 2);
      const observedValue124Part2 = new Float32Array(buf, 0, 2);
      observedValue124.$_set(0, 1.0);
      observedValue124.$_set(1, 2.0);
      const observedValue124Part3 = observedValue124Part2.toString();
      expect(observedValue124Part3).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1230
     * @tc.name testFloat32ArrayConstructorThree123
     * @tc.desc Verify overload 11 offset view $_set after buffer again constructs view reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const observedValue125 = new Float32Array(buf, 4, 2);
      observedValue125.$_set(1, 21.0);
      const observedValue125Part2 = new Float32Array(buf, 4, 2);
      const element125 = observedValue125Part2.$_get(1);
      expect(element125).assertEqual(21.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1240
     * @tc.name testFloat32ArrayConstructorThree124
     * @tc.desc Verify overload 11 view on number buffer number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const setup = new Float32Array(buf, 0, 2);
      setup.$_set(0, 3.0);
      setup.$_set(1, 4.0);
      const view = new Float32Array(buf, 0, 2);
      const element126 = view.$_get(0);
      expect(element126).assertEqual(3.0);
      const element126Part2 = view.$_get(1);
      expect(element126Part2).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1250
     * @tc.name testFloat32ArrayConstructorThree125
     * @tc.desc Verify overload 11 buffer float32 value view $_get read back consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const dv = new DataView(buf);
      dv.setFloat32(0, 1.25, true);
      const view = new Float32Array(buf, 0, 1);
      const element127 = view.$_get(0);
      expect(element127).assertEqual(1.25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1260
     * @tc.name testFloat32ArrayConstructorThree126
     * @tc.desc Verify overload 11 view reads buffer in float32 truncates value (16777217 is 16777216)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const setup = new Float32Array(buf, 0, 1);
      setup.$_set(0, 16777217);
      const view = new Float32Array(buf, 0, 1);
      const element128 = view.$_get(0);
      expect(element128).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1270
     * @tc.name testFloat32ArrayConstructorThree127
     * @tc.desc Verify overload 11 view reads buffer in exceeds the float32 range value (1e40 is Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const setup = new Float32Array(buf, 0, 1);
      setup.$_set(0, 1.0e40);
      const view = new Float32Array(buf, 0, 1);
      const element129 = view.$_get(0);
      expect(element129).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1280
     * @tc.name testFloat32ArrayConstructorThree128
     * @tc.desc Verify overload 11 view reads buffer in NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const setup = new Float32Array(buf, 0, 1);
      setup.$_set(0, Number.NaN);
      const view = new Float32Array(buf, 0, 1);
      const element130 = view.$_get(0);
      expect(element130).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1290
     * @tc.name testFloat32ArrayConstructorThree129
     * @tc.desc Verify overload 11 view reads buffer in +0 and -0(1/x)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const setup = new Float32Array(buf, 0, 2);
      setup.$_set(0, 0.0);
      setup.$_set(1, -0.0);
      const view = new Float32Array(buf, 0, 2);
      const element131 = 1.0 / view.$_get(0);
      expect(element131).assertEqual(Number.POSITIVE_INFINITY);
      const element131Part2 = 1.0 / view.$_get(1);
      expect(element131Part2).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1300
     * @tc.name testFloat32ArrayConstructorThree130
     * @tc.desc Verify overload 11 view reads buffer in float32 precision 0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const setup = new Float32Array(buf, 0, 1);
      setup.$_set(0, 0.1);
      const view = new Float32Array(buf, 0, 1);
      expect(view.$_get(0)).assertEqual(Math.fround(0.1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1310
     * @tc.name testFloat32ArrayConstructorThree131
     * @tc.desc Verify overload 11 view on offset number buffer reads corresponding position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const setup = new Float32Array(buf, 0, 3);
      setup.$_set(0, 10.0);
      setup.$_set(1, 20.0);
      setup.$_set(2, 30.0);
      const view = new Float32Array(buf, 4, 2);
      const element133 = view.$_get(0);
      expect(element133).assertEqual(20.0);
      const element133Part2 = view.$_get(1);
      expect(element133Part2).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_THREE_1320
     * @tc.name testFloat32ArrayConstructorThree132
     * @tc.desc Verify overload 11 view writes covers buffer in number after is buffer view observes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorThree132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const setup = new Float32Array(buf, 0, 2);
      setup.$_set(0, 5.0);
      setup.$_set(1, 6.0);
      const view = new Float32Array(buf, 0, 2);
      view.$_set(0, 99.0);
      const element134 = setup.$_get(0);
      expect(element134).assertEqual(99.0);
      const element134Part2 = setup.$_get(1);
      expect(element134Part2).assertEqual(6.0);
    });

  });
}
