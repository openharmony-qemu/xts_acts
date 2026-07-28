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

export default function Float32ArrayConstructor2Test(): void {
  describe('Float32ArrayConstructor2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0010
     * @tc.name testFloat32ArrayConstructorTwo001
     * @tc.desc Verify overload 2 passing single int literal 2 constructs array with length 2 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: number = 2;
      const arr = new Float32Array(len);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0020
     * @tc.name testFloat32ArrayConstructorTwo002
     * @tc.desc Verify overload 3 passing single number literal 2.0 constructs array with length 2 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: number = 2.0;
      const arr = new Float32Array(len);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0030
     * @tc.name testFloat32ArrayConstructorTwo003
     * @tc.desc Verify overload 6 passing single FixedArray<number> literal construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.0, 2.0];
      const arr = new Float32Array(src);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0040
     * @tc.name testFloat32ArrayConstructorTwo004
     * @tc.desc Verify overload 7 passing single Array<number> constructs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10.0, 20.0];
      const arr = new Float32Array(src);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0050
     * @tc.name testFloat32ArrayConstructorTwo005
     * @tc.desc Verify overload 7 passing Array<number> constructs length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      const arr = new Float32Array(src);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0060
     * @tc.name testFloat32ArrayConstructorTwo006
     * @tc.desc Verify overload 2 int length 0 constructs empty storage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: number = 0;
      const arr = new Float32Array(len);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0070
     * @tc.name testFloat32ArrayConstructorTwo007
     * @tc.desc Verify overload 2 int length 1 zero-initializes the element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: number = 1;
      const arr = new Float32Array(len);
      expect(arr.length).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0080
     * @tc.name testFloat32ArrayConstructorTwo008
     * @tc.desc Verify overload 2 int length 3 zero-initializes first and last elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: number = 3;
      const arr = new Float32Array(len);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0090
     * @tc.name testFloat32ArrayConstructorTwo009
     * @tc.desc Verify overload 2 int length 5 creates expected byte length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: number = 5;
      const arr = new Float32Array(len);
      expect(arr.length).assertEqual(5);
      expect(arr.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0100
     * @tc.name testFloat32ArrayConstructorTwo010
     * @tc.desc Verify overload 2 int length 10 zero-initializes middle and last elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: number = 10;
      const arr = new Float32Array(len);
      expect(arr.length).assertEqual(10);
      expect(arr.$_get(5)).assertEqual(0);
      expect(arr.$_get(9)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0110
     * @tc.name testFloat32ArrayConstructorTwo011
     * @tc.desc Verify overload 2 int length 100 creates expected byte length and last zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: number = 100;
      const arr = new Float32Array(len);
      expect(arr.length).assertEqual(100);
      expect(arr.byteLength).assertEqual(400);
      expect(arr.$_get(99)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0120
     * @tc.name testFloat32ArrayConstructorTwo012
     * @tc.desc Verify overload 2 int length 1024 byte length relation and middle zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: number = 1024;
      const arr = new Float32Array(len);
      expect(arr.length).assertEqual(1024);
      expect(arr.byteLength).assertEqual(len * 4);
      expect(arr.$_get(512)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0130
     * @tc.name testFloat32ArrayConstructorTwo013
     * @tc.desc Verify overload 2 int length 65536 constructs a large array and the last element is zero-initialized
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: number = 65536;
      const arr = new Float32Array(len);
      expect(arr.length).assertEqual(65536);
      const element015 = arr.$_get(65535);
      expect(element015).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0140
     * @tc.name testFloat32ArrayConstructorTwo014
     * @tc.desc Verify overload 3 number length 0.0 truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: number = 0.0;
      const arr = new Float32Array(len);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0150
     * @tc.name testFloat32ArrayConstructorTwo015
     * @tc.desc Verify overload 3 number length 1.0 truncates to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: number = 1.0;
      const arr = new Float32Array(len);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0160
     * @tc.name testFloat32ArrayConstructorTwo016
     * @tc.desc Verify overload 3 number length 2.9 truncates to 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: number = 2.9;
      const arr = new Float32Array(len);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0170
     * @tc.name testFloat32ArrayConstructorTwo017
     * @tc.desc Verify overload 3 number length 3.1 truncates to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: number = 3.1;
      const arr = new Float32Array(len);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0180
     * @tc.name testFloat32ArrayConstructorTwo018
     * @tc.desc Verify overload 3 number length 1.9 truncates to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: number = 1.9;
      const arr = new Float32Array(len);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0190
     * @tc.name testFloat32ArrayConstructorTwo019
     * @tc.desc Verify overload 3 number length 4.5 truncates to 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: number = 4.5;
      const arr = new Float32Array(len);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0200
     * @tc.name testFloat32ArrayConstructorTwo020
     * @tc.desc Verify overload 3 number length 0.9 truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: number = 0.9;
      const arr = new Float32Array(len);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0210
     * @tc.name testFloat32ArrayConstructorTwo021
     * @tc.desc Verify overload 3 number length 0.99999 truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: number = 0.99999;
      const arr = new Float32Array(len);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0220
     * @tc.name testFloat32ArrayConstructorTwo022
     * @tc.desc Verify overload 3 number length 1.99999 truncates to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: number = 1.99999;
      const arr = new Float32Array(len);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0230
     * @tc.name testFloat32ArrayConstructorTwo023
     * @tc.desc Verify overload 3 number length -0.0 truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: number = -0.0;
      const arr = new Float32Array(len);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0240
     * @tc.name testFloat32ArrayConstructorTwo024
     * @tc.desc Verify overload 3 number length -0.5 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: number = -0.5;
      try {
        new Float32Array(len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0250
     * @tc.name testFloat32ArrayConstructorTwo025
     * @tc.desc Verify overload 3 number scientific notation 1e1 truncates to 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: number = 1e1;
      const arr = new Float32Array(len);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0260
     * @tc.name testFloat32ArrayConstructorTwo026
     * @tc.desc Verify overload 3 number scientific notation 1e2 truncates to 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: number = 1e2;
      const arr = new Float32Array(len);
      expect(arr.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0270
     * @tc.name testFloat32ArrayConstructorTwo027
     * @tc.desc Verify overload 3 number length 2.9 overload 2 int length 2 byteLength are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(2);
      const b = new Float32Array(2.9);
      expect(a.byteLength).assertEqual(b.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0280
     * @tc.name testFloat32ArrayConstructorTwo028
     * @tc.desc Verify overload 2 int length 1 byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0290
     * @tc.name testFloat32ArrayConstructorTwo029
     * @tc.desc Verify overload 2 int length 16 byteLength 64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(16);
      expect(arr.byteLength).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0300
     * @tc.name testFloat32ArrayConstructorTwo030
     * @tc.desc Verify overload 2 int length -100 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float32Array(-100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0310
     * @tc.name testFloat32ArrayConstructorTwo031
     * @tc.desc Verify overload 3 number length -1.0 truncates to -1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float32Array(-1.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0320
     * @tc.name testFloat32ArrayConstructorTwo032
     * @tc.desc Verify overload 3 number length -1.9 truncates to -1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float32Array(-1.9);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0330
     * @tc.name testFloat32ArrayConstructorTwo033
     * @tc.desc Verify overload 3 number length -2.5 truncates to -2 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float32Array(-2.5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0340
     * @tc.name testFloat32ArrayConstructorTwo034
     * @tc.desc Verify overload 3 number length -100.7 truncates to -100 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float32Array(-100.7);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0350
     * @tc.name testFloat32ArrayConstructorTwo035
     * @tc.desc Verify overload 3 number length -Infinity throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float32Array(-Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0360
     * @tc.name testFloat32ArrayConstructorTwo036
     * @tc.desc Verify overload 3 number length -1.0 throws RangeError and previously constructed instance length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      try {
        new Float32Array(-1.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0370
     * @tc.name testFloat32ArrayConstructorTwo037
     * @tc.desc Verify overload 2 int length 3 byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0380
     * @tc.name testFloat32ArrayConstructorTwo038
     * @tc.desc Verify overload 2 int length 3 BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0390
     * @tc.name testFloat32ArrayConstructorTwo039
     * @tc.desc Verify overload 2 int length 3 name Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      expect(arr.name).assertEqual('Float32Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0400
     * @tc.name testFloat32ArrayConstructorTwo040
     * @tc.desc Verify overload 2 int length 3 buffer non-empty byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      expect(arr.buffer.byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0410
     * @tc.name testFloat32ArrayConstructorTwo041
     * @tc.desc Verify overload 2 int length 4 Float32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      expect(arr.length).assertEqual(4);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0420
     * @tc.name testFloat32ArrayConstructorTwo042
     * @tc.desc Verify overload 2 int length 3 buffer.byteLength 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      expect(arr.buffer.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0430
     * @tc.name testFloat32ArrayConstructorTwo043
     * @tc.desc Verify overload 2 int length 0 buffer capacity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      expect(arr.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0440
     * @tc.name testFloat32ArrayConstructorTwo044
     * @tc.desc Verify overload 2 int length 2 toString reflects zero initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const observedValue052 = arr.toString();
      expect(observedValue052).assertEqual('0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0450
     * @tc.name testFloat32ArrayConstructorTwo045
     * @tc.desc Verify overload 3 number length 3.0 byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3.0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0460
     * @tc.name testFloat32ArrayConstructorTwo046
     * @tc.desc Verify overload 3 number length 3.0 BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3.0);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0470
     * @tc.name testFloat32ArrayConstructorTwo047
     * @tc.desc Verify overload 3 number length 3.0 name Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3.0);
      expect(arr.name).assertEqual('Float32Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0480
     * @tc.name testFloat32ArrayConstructorTwo048
     * @tc.desc Verify overload 3 number length 3.0 buffer non-empty byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3.0);
      expect(arr.buffer.byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0490
     * @tc.name testFloat32ArrayConstructorTwo049
     * @tc.desc Verify overload 3 number length 4.0 Float32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4.0);
      expect(arr.length).assertEqual(4);
      expect(arr.$_get(0)).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0500
     * @tc.name testFloat32ArrayConstructorTwo050
     * @tc.desc Verify overload 3 number length 0.0 buffer capacity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0.0);
      expect(arr.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0510
     * @tc.name testFloat32ArrayConstructorTwo051
     * @tc.desc Verify overload 3 number length 2.0 toString reflects zero initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2.0);
      const observedValue060 = arr.toString();
      expect(observedValue060).assertEqual('0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0520
     * @tc.name testFloat32ArrayConstructorTwo052
     * @tc.desc Verify overload 2 int length 3 all elements are zero-initialized
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const element061 = arr.$_get(0);
      expect(element061).assertEqual(0);
      const element061Part2 = arr.$_get(1);
      expect(element061Part2).assertEqual(0);
      const element061Part3 = arr.$_get(2);
      expect(element061Part3).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0530
     * @tc.name testFloat32ArrayConstructorTwo053
     * @tc.desc Verify overload 2 int length 1 element is zero-initialized 1/x Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      const element062 = 1.0 / arr.$_get(0);
      expect(element062).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0540
     * @tc.name testFloat32ArrayConstructorTwo054
     * @tc.desc Verify overload 2 int length 5 last element is zero-initialized
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(5);
      const element063 = arr.$_get(4);
      expect(element063).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0550
     * @tc.name testFloat32ArrayConstructorTwo055
     * @tc.desc Verify overload 3 number length 3.0 all elements are zero-initialized
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3.0);
      const element064 = arr.$_get(0);
      expect(element064).assertEqual(0);
      const element064Part2 = arr.$_get(1);
      expect(element064Part2).assertEqual(0);
      const element064Part3 = arr.$_get(2);
      expect(element064Part3).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0560
     * @tc.name testFloat32ArrayConstructorTwo056
     * @tc.desc Verify overload 3 number length 2.9 truncates to 2 element is zero-initialized
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2.9);
      const element065 = arr.$_get(0);
      expect(element065).assertEqual(0);
      const element065Part2 = arr.$_get(1);
      expect(element065Part2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0570
     * @tc.name testFloat32ArrayConstructorTwo057
     * @tc.desc Verify overload 3 number length 1.0 element is zero-initialized 1/x Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1.0);
      const element066 = 1.0 / arr.$_get(0);
      expect(element066).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0580
     * @tc.name testFloat32ArrayConstructorTwo058
     * @tc.desc Verify overload 2 int length 0 at(0) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const atValue067 = arr.at(0);
      expect(atValue067).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0590
     * @tc.name testFloat32ArrayConstructorTwo059
     * @tc.desc Verify overload 3 number length 0.0 values() iterator is immediately done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0.0);
      const it = arr.values();
      const iteratorValue068 = it.next().done;
      expect(iteratorValue068).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0600
     * @tc.name testFloat32ArrayConstructorTwo060
     * @tc.desc Verify overload 6 single-element FixedArray<number> first element equals source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [7.5];
      const arr = new Float32Array(src);
      const element071 = arr.$_get(0);
      expect(element071).assertEqual(7.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0610
     * @tc.name testFloat32ArrayConstructorTwo061
     * @tc.desc Verify overload 6 three-element FixedArray<number> order is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.0, 2.0, 3.0];
      const arr = new Float32Array(src);
      const element072 = arr.$_get(0);
      expect(element072).assertEqual(1.0);
      const element072Part2 = arr.$_get(1);
      expect(element072Part2).assertEqual(2.0);
      const element072Part3 = arr.$_get(2);
      expect(element072Part3).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0620
     * @tc.name testFloat32ArrayConstructorTwo062
     * @tc.desc Verify overload 7 three-element Array<number> length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0, 3.0];
      const arr = new Float32Array(src);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0630
     * @tc.name testFloat32ArrayConstructorTwo063
     * @tc.desc Verify overload 7 ten-element Array<number> length 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0];
      const arr = new Float32Array(src);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0640
     * @tc.name testFloat32ArrayConstructorTwo064
     * @tc.desc Verify overload 7 single-element Array<number> first element equals source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [9.25];
      const arr = new Float32Array(src);
      const element079 = arr.$_get(0);
      expect(element079).assertEqual(9.25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0650
     * @tc.name testFloat32ArrayConstructorTwo065
     * @tc.desc Verify overload 7 four-element Array<number> order is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0, 3.0, 4.0];
      const arr = new Float32Array(src);
      const element080 = arr.$_get(0);
      expect(element080).assertEqual(1.0);
      const element080Part2 = arr.$_get(3);
      expect(element080Part2).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0660
     * @tc.name testFloat32ArrayConstructorTwo066
     * @tc.desc Verify overload 7 Array<number> stores each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [2.5, 2.5, 2.5];
      const arr = new Float32Array(src);
      const element081 = arr.$_get(0);
      expect(element081).assertEqual(2.5);
      const element081Part2 = arr.$_get(2);
      expect(element081Part2).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0670
     * @tc.name testFloat32ArrayConstructorTwo067
     * @tc.desc Verify overload 7 mixed signs Array<number> stores
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-1.0, 0.0, 1.0];
      const arr = new Float32Array(src);
      const element082 = arr.$_get(0);
      expect(element082).assertEqual(-1.0);
      const element082Part2 = arr.$_get(2);
      expect(element082Part2).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0680
     * @tc.name testFloat32ArrayConstructorTwo068
     * @tc.desc Verify overload 7 contains negative floats Array<number> stores
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-3.75];
      const arr = new Float32Array(src);
      const element083 = arr.$_get(0);
      expect(element083).assertEqual(-3.75);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0690
     * @tc.name testFloat32ArrayConstructorTwo069
     * @tc.desc Verify overload 7 eight-element Array<number> stores all elements in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0];
      const arr = new Float32Array(src);
      expect(arr.length).assertEqual(8);
      const element084 = arr.$_get(0);
      expect(element084).assertEqual(1.0);
      const element084Part2 = arr.$_get(7);
      expect(element084Part2).assertEqual(8.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0700
     * @tc.name testFloat32ArrayConstructorTwo070
     * @tc.desc Verify overload 6 source contains +Infinity -Infinity stores both
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY];
      const arr = new Float32Array(src);
      const element094 = arr.$_get(0);
      expect(element094).assertEqual(Number.POSITIVE_INFINITY);
      const element094Part2 = arr.$_get(1);
      expect(element094Part2).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0710
     * @tc.name testFloat32ArrayConstructorTwo071
     * @tc.desc Verify overload 7 source contains float32 maximum finite value 3.4028234663852886e+38 stores unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [3.4028234663852886e+38];
      const arr = new Float32Array(src);
      const element095 = arr.$_get(0);
      expect(element095).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0720
     * @tc.name testFloat32ArrayConstructorTwo072
     * @tc.desc Verify overload 7 source contains minimum normal value 1.1754943508222875e-38 stores
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.1754943508222875e-38];
      const arr = new Float32Array(src);
      const element096 = arr.$_get(0);
      expect(element096).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0730
     * @tc.name testFloat32ArrayConstructorTwo073
     * @tc.desc Verify overload 7 source contains minimum positive subnormal value 1.401298464324817e-45 stores
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.401298464324817e-45];
      const arr = new Float32Array(src);
      const element097 = arr.$_get(0);
      expect(element097).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0740
     * @tc.name testFloat32ArrayConstructorTwo074
     * @tc.desc Verify overload 7 source contains 0.1 truncated to float32 and approximates 0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0.1];
      const arr = new Float32Array(src);
      expect(arr.$_get(0)).assertEqual(Math.fround(0.1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0750
     * @tc.name testFloat32ArrayConstructorTwo075
     * @tc.desc Verify overload 7 source contains 16777217 is truncated by float32 to 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [16777217];
      const arr = new Float32Array(src);
      const element099 = arr.$_get(0);
      expect(element099).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0760
     * @tc.name testFloat32ArrayConstructorTwo076
     * @tc.desc Verify overload 7 source contains 1.0e40 exceeds float32 range and stores as +Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0e40];
      const arr = new Float32Array(src);
      const element100 = arr.$_get(0);
      expect(element100).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0770
     * @tc.name testFloat32ArrayConstructorTwo077
     * @tc.desc Verify overload 7 source contains -1.0e40 exceeds float32 range and stores as -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-1.0e40];
      const arr = new Float32Array(src);
      const element101 = arr.$_get(0);
      expect(element101).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0780
     * @tc.name testFloat32ArrayConstructorTwo078
     * @tc.desc Verify overload 7 source contains 1.0e-46 underflows and stores as +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0e-46];
      const arr = new Float32Array(src);
      const element102 = arr.$_get(0);
      expect(element102).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0790
     * @tc.name testFloat32ArrayConstructorTwo079
     * @tc.desc Verify overload 7 source contains NaN stores as NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [Number.NaN];
      const arr = new Float32Array(src);
      const element103 = arr.$_get(0);
      expect(element103).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0800
     * @tc.name testFloat32ArrayConstructorTwo080
     * @tc.desc Verify overload 7 source contains Number.MAX_SAFE_INTEGER is float32 rounded and stored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [9007199254740991];
      const arr = new Float32Array(src);
      const element104 = arr.$_get(0);
      expect(element104).assertEqual(9007199254740992);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0810
     * @tc.name testFloat32ArrayConstructorTwo081
     * @tc.desc Verify overload 7 source contains -0 stores as -0 /x -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-0.0];
      const arr = new Float32Array(src);
      const element109 = 1.0 / arr.$_get(0);
      expect(element109).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0820
     * @tc.name testFloat32ArrayConstructorTwo082
     * @tc.desc Verify overload 7 source contains +0 stores as +0 /x Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0.0];
      const arr = new Float32Array(src);
      const element110 = 1.0 / arr.$_get(0);
      expect(element110).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0830
     * @tc.name testFloat32ArrayConstructorTwo083
     * @tc.desc Verify overload 7 source contains minimum finite negative value-3.4028234663852886e+38 stores
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-3.4028234663852886e+38];
      const arr = new Float32Array(src);
      const element111 = arr.$_get(0);
      expect(element111).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0840
     * @tc.name testFloat32ArrayConstructorTwo084
     * @tc.desc Verify overload 7 source contains 16777216(2^24) stores exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [16777216];
      const arr = new Float32Array(src);
      const element112 = arr.$_get(0);
      expect(element112).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0850
     * @tc.name testFloat32ArrayConstructorTwo085
     * @tc.desc Verify overload 6 three-element byteLength = length*4 = 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.0, 2.0, 3.0];
      const arr = new Float32Array(src);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0860
     * @tc.name testFloat32ArrayConstructorTwo086
     * @tc.desc Verify overload 6 constructs byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.0, 2.0];
      const arr = new Float32Array(src);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0870
     * @tc.name testFloat32ArrayConstructorTwo087
     * @tc.desc Verify overload 6 constructs BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.0];
      const arr = new Float32Array(src);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0880
     * @tc.name testFloat32ArrayConstructorTwo088
     * @tc.desc Verify overload 6 constructs name Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.0];
      const arr = new Float32Array(src);
      expect(arr.name).assertEqual('Float32Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0890
     * @tc.name testFloat32ArrayConstructorTwo089
     * @tc.desc Verify overload 6 constructs a Float32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.0];
      const arr = new Float32Array(src);
      expect(arr.length).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0900
     * @tc.name testFloat32ArrayConstructorTwo090
     * @tc.desc Verify overload 6 constructs buffer capacity equals byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.0, 2.0];
      const arr = new Float32Array(src);
      expect(arr.buffer.byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0910
     * @tc.name testFloat32ArrayConstructorTwo091
     * @tc.desc Verify overload 7 three-element byteLength = length*4 = 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0, 3.0];
      const arr = new Float32Array(src);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0920
     * @tc.name testFloat32ArrayConstructorTwo092
     * @tc.desc Verify overload 7 constructs byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0];
      const arr = new Float32Array(src);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0930
     * @tc.name testFloat32ArrayConstructorTwo093
     * @tc.desc Verify overload 7 constructs BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0];
      const arr = new Float32Array(src);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0940
     * @tc.name testFloat32ArrayConstructorTwo094
     * @tc.desc Verify overload 7 constructs name Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0];
      const arr = new Float32Array(src);
      expect(arr.name).assertEqual('Float32Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0950
     * @tc.name testFloat32ArrayConstructorTwo095
     * @tc.desc Verify overload 7 constructs a Float32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0];
      const arr = new Float32Array(src);
      expect(arr.length).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0960
     * @tc.name testFloat32ArrayConstructorTwo096
     * @tc.desc Verify overload 7 constructs buffer capacity equals byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0];
      const arr = new Float32Array(src);
      expect(arr.buffer.byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0970
     * @tc.name testFloat32ArrayConstructorTwo097
     * @tc.desc Verify overload 6 FixedArray source is copied (mutating source after construction does not affect the array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.0, 2.0];
      const arr = new Float32Array(src);
      src[0] = 100.0;
      const element127 = arr.$_get(0);
      expect(element127).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0980
     * @tc.name testFloat32ArrayConstructorTwo098
     * @tc.desc Verify overload 6 FixedArray write does not propagate back to source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.0, 2.0];
      const arr = new Float32Array(src);
      arr.$_set(0, 999.0);
      expect(src[0]).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_0990
     * @tc.name testFloat32ArrayConstructorTwo099
     * @tc.desc Verify overload 7 Array source is copied (mutating source after construction does not affect the array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0];
      const arr = new Float32Array(src);
      src[0] = 100.0;
      const element129 = arr.$_get(0);
      expect(element129).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_1000
     * @tc.name testFloat32ArrayConstructorTwo100
     * @tc.desc Verify overload 7 Array write does not propagate back to source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0];
      const arr = new Float32Array(src);
      arr.$_set(0, 999.0);
      expect(src[0]).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_1010
     * @tc.name testFloat32ArrayConstructorTwo101
     * @tc.desc Verify overload 6 and overload length element are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: FixedArray<number> = [7.0, 8.0];
      const a: Array<number> = [7.0, 8.0];
      const af = new Float32Array(f);
      const aa = new Float32Array(a);
      expect(af.length).assertEqual(aa.length);
      const element131 = af.$_get(0);
      expect(element131).assertEqual(aa.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_1020
     * @tc.name testFloat32ArrayConstructorTwo102
     * @tc.desc Verify overload 7 two Array-constructed arrays have independent buffers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0]);
      const b = new Float32Array([1.0, 2.0]);
      const observedValue132 = a.buffer === b.buffer;
      expect(observedValue132).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_1030
     * @tc.name testFloat32ArrayConstructorTwo103
     * @tc.desc Verify overload 6 multi-element at(-1) returns last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.0, 2.0, 3.0];
      const arr = new Float32Array(src);
      const atValue133 = arr.at(-1);
      expect(atValue133).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_1040
     * @tc.name testFloat32ArrayConstructorTwo104
     * @tc.desc Verify overload 6 multi-element at(0) returns first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.0, 2.0, 3.0];
      const arr = new Float32Array(src);
      const atValue134 = arr.at(0);
      expect(atValue134).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_1050
     * @tc.name testFloat32ArrayConstructorTwo105
     * @tc.desc Verify overload 7 multi-element indexOf element returns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0, 3.0];
      const arr = new Float32Array(src);
      const indexValue135 = arr.indexOf(2.0);
      expect(indexValue135).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_1060
     * @tc.name testFloat32ArrayConstructorTwo106
     * @tc.desc Verify overload 7 multi-element lastIndexOf element returns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0, 2.0, 3.0];
      const arr = new Float32Array(src);
      const lastIndexValue136 = arr.lastIndexOf(2.0);
      expect(lastIndexValue136).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_1070
     * @tc.name testFloat32ArrayConstructorTwo107
     * @tc.desc Verify overload 7 source contains NaN includes(NaN) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, Number.NaN, 3.0];
      const arr = new Float32Array(src);
      const predicateResult137 = arr.includes(Number.NaN);
      expect(predicateResult137).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_1080
     * @tc.name testFloat32ArrayConstructorTwo108
     * @tc.desc Verify overload 7 source contains NaN indexOf(NaN) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, Number.NaN, 3.0];
      const arr = new Float32Array(src);
      const indexValue138 = arr.indexOf(Number.NaN);
      expect(indexValue138).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_1090
     * @tc.name testFloat32ArrayConstructorTwo109
     * @tc.desc Verify overload 6 values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.0, 2.0, 3.0];
      const arr = new Float32Array(src);
      const it = arr.values();
      const iteratorValue139 = it.next().value;
      expect(iteratorValue139).assertEqual(1.0);
      const iteratorValue139Part2 = it.next().value;
      expect(iteratorValue139Part2).assertEqual(2.0);
      const iteratorValue139Part3 = it.next().value;
      expect(iteratorValue139Part3).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_1100
     * @tc.name testFloat32ArrayConstructorTwo110
     * @tc.desc Verify overload 6 entries() [index,value]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [7.0, 8.0];
      const arr = new Float32Array(src);
      const it = arr.entries();
      const first = it.next().value!;
      expect(first[0]).assertEqual(0);
      expect(first[1]).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_1110
     * @tc.name testFloat32ArrayConstructorTwo111
     * @tc.desc Verify overload 2 int length 3 and overload number length 3.0 length are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(3);
      const b = new Float32Array(3.0);
      expect(a.length).assertEqual(b.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_1120
     * @tc.name testFloat32ArrayConstructorTwo112
     * @tc.desc Verify overload 2 int length 4 and overload number length 4.0 byteLength are both 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(4);
      const b = new Float32Array(4.0);
      expect(a.byteLength).assertEqual(16);
      expect(b.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_1130
     * @tc.name testFloat32ArrayConstructorTwo113
     * @tc.desc Verify overload 2 int length 0 and overload number length 0.0 byteLength are both 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(0);
      const b = new Float32Array(0.0);
      expect(a.byteLength).assertEqual(0);
      expect(b.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_1140
     * @tc.name testFloat32ArrayConstructorTwo114
     * @tc.desc Verify overload 2 int length 2 default byteOffset 0 buffer capacity equals byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.buffer.byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_1150
     * @tc.name testFloat32ArrayConstructorTwo115
     * @tc.desc Verify overload 3 number length 2.0 default byteOffset 0 byteLength 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2.0);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_1160
     * @tc.name testFloat32ArrayConstructorTwo116
     * @tc.desc Verify overload 2 int length constructs overload 6 FixedArray constructs length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fromLen = new Float32Array(4);
      const fromArr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      expect(fromLen.length).assertEqual(4);
      expect(fromArr.length).assertEqual(4);
      const element146 = fromLen.$_get(0);
      expect(element146).assertEqual(0);
      const element146Part2 = fromArr.$_get(0);
      expect(element146Part2).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_1170
     * @tc.name testFloat32ArrayConstructorTwo117
     * @tc.desc Verify overload 6 and overload byteLength are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: FixedArray<number> = [1.0, 2.0, 3.0];
      const a: Array<number> = [1.0, 2.0, 3.0];
      const af = new Float32Array(f);
      const aa = new Float32Array(a);
      expect(af.byteLength).assertEqual(aa.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_TWO_1180
     * @tc.name testFloat32ArrayConstructorTwo118
     * @tc.desc Verify overload 2 length constructs an independent buffer and overload constructs buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorTwo118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(2);
      const b = new Float32Array([1.0, 2.0]);
      const observedValue148 = a.buffer === b.buffer;
      expect(observedValue148).assertFalse();
    });

  });
}
