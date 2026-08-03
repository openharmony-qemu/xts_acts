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

export default function Uint8ArrayAttribute01Test(): void {
  describe('Uint8ArrayAttribute01Test', () => {
    beforeAll(() => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_0100
     * @tc.name testUint8ArrayAttribute001
     * @tc.desc Verify empty constructor BYTES_PER_ELEMENT is 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array();
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_0200
     * @tc.name testUint8ArrayAttribute002
     * @tc.desc Verify empty constructor buffer.byteLength is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array();
      expect(arr.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_0300
     * @tc.name testUint8ArrayAttribute003
     * @tc.desc Verify empty constructor byteOffset is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array();
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_0400
     * @tc.name testUint8ArrayAttribute004
     * @tc.desc Verify empty constructor name is Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array();
      expect(arr.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_0500
     * @tc.name testUint8ArrayAttribute005
     * @tc.desc Verify int constructor BYTES_PER_ELEMENT is 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_0600
     * @tc.name testUint8ArrayAttribute006
     * @tc.desc Verify int constructor byteLength is 5
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      expect(arr.byteLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_0700
     * @tc.name testUint8ArrayAttribute007
     * @tc.desc Verify int constructor name is Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      expect(arr.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_0800
     * @tc.name testUint8ArrayAttribute008
     * @tc.desc Verify number constructor length is 5
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5.0);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_0900
     * @tc.name testUint8ArrayAttribute009
     * @tc.desc Verify copy constructor BYTES_PER_ELEMENT is 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array(3);
      const arr = new Uint8Array(src);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_1000
     * @tc.name testUint8ArrayAttribute010
     * @tc.desc Verify copy constructor byteLength matches source
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array(3);
      const arr = new Uint8Array(src);
      expect(arr.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_1100
     * @tc.name testUint8ArrayAttribute011
     * @tc.desc Verify copy constructor name is Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array(3);
      const arr = new Uint8Array(src);
      expect(arr.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_1200
     * @tc.name testUint8ArrayAttribute012
     * @tc.desc Verify copy constructor buffer is independent
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array(3);
      src.$_set(0, 10);
      const arr = new Uint8Array(src);
      arr.$_set(0, 20);
      expect(src.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_1300
     * @tc.name testUint8ArrayAttribute013
     * @tc.desc Verify copy constructor byteOffset is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array(3);
      const arr = new Uint8Array(src);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_1400
     * @tc.name testUint8ArrayAttribute014
     * @tc.desc Verify FixedArray<int> constructor length is 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_1500
     * @tc.name testUint8ArrayAttribute015
     * @tc.desc Verify FixedArray<int> constructor BYTES_PER_ELEMENT is 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_1600
     * @tc.name testUint8ArrayAttribute016
     * @tc.desc Verify FixedArray<number> constructor length is 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1.0, 2.0]);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_1700
     * @tc.name testUint8ArrayAttribute017
     * @tc.desc Verify Array<int> constructor length matches source
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<int> = [5, 10, 15];
      const arr = new Uint8Array(src);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_1800
     * @tc.name testUint8ArrayAttribute018
     * @tc.desc Verify ArrayBuffer constructor buffer reference is shared
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_1900
     * @tc.name testUint8ArrayAttribute019
     * @tc.desc Verify ArrayBuffer constructor byteOffset is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_2000
     * @tc.name testUint8ArrayAttribute020
     * @tc.desc Verify ArrayBuffer constructor byteLength equals buf.byteLength
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_2100
     * @tc.name testUint8ArrayAttribute021
     * @tc.desc Verify two-parameter int offset constructor buffer reference is shared
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, 2);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_2200
     * @tc.name testUint8ArrayAttribute022
     * @tc.desc Verify two-parameter int offset constructor byteOffset is 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, 2);
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_2300
     * @tc.name testUint8ArrayAttribute023
     * @tc.desc Verify two-parameter int offset constructor byteLength is remaining bytes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, 2);
      expect(arr.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_2400
     * @tc.name testUint8ArrayAttribute024
     * @tc.desc Verify two-parameter number offset constructor byteOffset is 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, 2.0);
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_2500
     * @tc.name testUint8ArrayAttribute025
     * @tc.desc Verify two-parameter number offset constructor byteLength is remaining bytes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, 2.0);
      expect(arr.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_2600
     * @tc.name testUint8ArrayAttribute026
     * @tc.desc Verify three-parameter constructor length is 4
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, 0, 4);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_2700
     * @tc.name testUint8ArrayAttribute027
     * @tc.desc Verify three-parameter undefined constructor length covers full buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, undefined, undefined);
      expect(arr.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_2800
     * @tc.name testUint8ArrayAttribute028
     * @tc.desc Verify three-parameter undefined constructor byteOffset is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, undefined, undefined);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_2900
     * @tc.name testUint8ArrayAttribute029
     * @tc.desc Verify int length 0 constructor length is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_3000
     * @tc.name testUint8ArrayAttribute030
     * @tc.desc Verify int length 1 constructor length is 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_3100
     * @tc.name testUint8ArrayAttribute031
     * @tc.desc Verify int length 100 constructor length is 100
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      expect(arr.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_3200
     * @tc.name testUint8ArrayAttribute032
     * @tc.desc Verify int length 255 constructor byteLength is 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(255);
      expect(arr.byteLength).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_3300
     * @tc.name testUint8ArrayAttribute033
     * @tc.desc Verify int length 256 constructor byteLength is 256
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(256);
      expect(arr.byteLength).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_3400
     * @tc.name testUint8ArrayAttribute034
     * @tc.desc Verify int length -1 constructor throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint8Array(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_3500
     * @tc.name testUint8ArrayAttribute035
     * @tc.desc Verify number length 2.0 constructor length is 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(2.0);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_3600
     * @tc.name testUint8ArrayAttribute036
     * @tc.desc Verify number length 3.5 constructor length is truncated to 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3.5);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_3700
     * @tc.name testUint8ArrayAttribute037
     * @tc.desc Verify number length 5.7 constructor length is truncated to 5
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5.7);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_3800
     * @tc.name testUint8ArrayAttribute038
     * @tc.desc Verify ArrayBuffer offset int 0 constructor byteOffset is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, 0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_3900
     * @tc.name testUint8ArrayAttribute039
     * @tc.desc Verify ArrayBuffer offset int 1 constructor byteOffset is 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, 1);
      expect(arr.byteOffset).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_4000
     * @tc.name testUint8ArrayAttribute040
     * @tc.desc Verify ArrayBuffer offset int 1 constructor byteLength is remaining 7
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, 1);
      expect(arr.byteLength).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_4100
     * @tc.name testUint8ArrayAttribute041
     * @tc.desc Verify ArrayBuffer offset int 3 constructor byteOffset is 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, 3);
      expect(arr.byteOffset).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_4200
     * @tc.name testUint8ArrayAttribute042
     * @tc.desc Verify ArrayBuffer offset number 1.5 constructor byteOffset is truncated to 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, 1.5);
      expect(arr.byteOffset).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_4300
     * @tc.name testUint8ArrayAttribute043
     * @tc.desc Verify ArrayBuffer offset number 1.5 constructor byteLength is remaining 7
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, 1.5);
      expect(arr.byteLength).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_4400
     * @tc.name testUint8ArrayAttribute044
     * @tc.desc Verify ArrayBuffer three-parameter length int 0 constructor length is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, 0, 0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_4500
     * @tc.name testUint8ArrayAttribute045
     * @tc.desc Verify ArrayBuffer three-parameter length int 1 constructor length is 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, 0, 1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_4600
     * @tc.name testUint8ArrayAttribute046
     * @tc.desc Verify ArrayBuffer three-parameter length int covers full buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, 0, 8);
      expect(arr.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_4700
     * @tc.name testUint8ArrayAttribute047
     * @tc.desc Verify Uint8Array.of(1) single element length is 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_4800
     * @tc.name testUint8ArrayAttribute048
     * @tc.desc Verify Uint8Array.of(1, 2, 3) multiple elements length is 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_4900
     * @tc.name testUint8ArrayAttribute049
     * @tc.desc Verify Uint8Array.of(1, 2, 3) multiple elements BYTES_PER_ELEMENT is 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_5000
     * @tc.name testUint8ArrayAttribute050
     * @tc.desc Verify Uint8Array.of(1, 2, 3) multiple elements name is Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      expect(arr.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_5100
     * @tc.name testUint8ArrayAttribute051
     * @tc.desc Verify Uint8Array.from([10, 20]) from FixedArray length is 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.from([10, 20]);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_5200
     * @tc.name testUint8ArrayAttribute052
     * @tc.desc Verify Uint8Array.from(Set<int>) from Set length equals set size
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<int>();
      s.add(1);
      s.add(2);
      const arr = Uint8Array.from(s);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_5300
     * @tc.name testUint8ArrayAttribute053
     * @tc.desc Verify Uint8Array.from(src) from same type copy length is same
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint8Array.of(5, 6);
      const arr = Uint8Array.from(src);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_5400
     * @tc.name testUint8ArrayAttribute054
     * @tc.desc Verify fill operation length unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      arr.fill(1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_5500
     * @tc.name testUint8ArrayAttribute055
     * @tc.desc Verify fill operation BYTES_PER_ELEMENT unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      arr.fill(1);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_5600
     * @tc.name testUint8ArrayAttribute056
     * @tc.desc Verify fill operation name unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      arr.fill(1);
      expect(arr.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_5700
     * @tc.name testUint8ArrayAttribute057
     * @tc.desc Verify copyWithin operation length unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4);
      arr.copyWithin(0, 2);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_5800
     * @tc.name testUint8ArrayAttribute058
     * @tc.desc Verify set operation length unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      arr.set([1, 2], 0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_5900
     * @tc.name testUint8ArrayAttribute059
     * @tc.desc Verify sort operation length unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(3, 1, 2);
      arr.sort();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_6000
     * @tc.name testUint8ArrayAttribute060
     * @tc.desc Verify reverse operation length unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      arr.reverse();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_6100
     * @tc.name testUint8ArrayAttribute061
     * @tc.desc Verify map operation original array length unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      arr.map((v: number, i: int, a: Uint8Array): number => v + 1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_6200
     * @tc.name testUint8ArrayAttribute062
     * @tc.desc Verify filter operation original array length unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      arr.filter((v: number, i: int, a: Uint8Array): boolean => v > 1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_6300
     * @tc.name testUint8ArrayAttribute063
     * @tc.desc Verify two Uint8Array from same ArrayBuffer share buffer reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const baseView = new Uint8Array(buf);
      const offsetView = new Uint8Array(buf, 2);
      expect(offsetView.buffer).assertEqual(baseView.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_6400
     * @tc.name testUint8ArrayAttribute064
     * @tc.desc Verify subarray view shares buffer with original array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4);
      const sub = arr.subarray(1, 3);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_6500
     * @tc.name testUint8ArrayAttribute065
     * @tc.desc Verify subarray view byteOffset reflects start offset
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4);
      const sub = arr.subarray(1, 3);
      expect(sub.byteOffset).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_6600
     * @tc.name testUint8ArrayAttribute066
     * @tc.desc Verify subarray view byteLength corresponds to element count
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4);
      const sub = arr.subarray(1, 3);
      expect(sub.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_6700
     * @tc.name testUint8ArrayAttribute067
     * @tc.desc Verify hexadecimal 0xFF and 0x80 elements length is 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0xFF, 0x80]);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_6800
     * @tc.name testUint8ArrayAttribute068
     * @tc.desc Verify mixed hexadecimal elements byteLength is 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0x00, 0xFF, 0x80]);
      expect(arr.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_6900
     * @tc.name testUint8ArrayAttribute069
     * @tc.desc Verify all-zero elements length is 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_7000
     * @tc.name testUint8ArrayAttribute070
     * @tc.desc Verify all-255 elements length is 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 255, 255]);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_7100
     * @tc.name testUint8ArrayAttribute071
     * @tc.desc Verify middle value 127 element length is 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([127]);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_7200
     * @tc.name testUint8ArrayAttribute072
     * @tc.desc Verify boundary values 1 and 255 elements byteLength is 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 255]);
      expect(arr.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_7300
     * @tc.name testUint8ArrayAttribute073
     * @tc.desc Verify copy from empty Uint8Array length is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array();
      const arr = new Uint8Array(src);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_7400
     * @tc.name testUint8ArrayAttribute074
     * @tc.desc Verify Uint8Array.from from empty Set length is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<int>();
      const arr = Uint8Array.from(s);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_7500
     * @tc.name testUint8ArrayAttribute075
     * @tc.desc Verify Uint8Array.from from single element Set length is 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<int>();
      s.add(100);
      const arr = Uint8Array.from(s);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_7600
     * @tc.name testUint8ArrayAttribute076
     * @tc.desc Verify ArrayBuffer size 1 constructor length is 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(1);
      const arr = new Uint8Array(buf);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_7700
     * @tc.name testUint8ArrayAttribute077
     * @tc.desc Verify ArrayBuffer size 100 constructor length is 100
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(100);
      const arr = new Uint8Array(buf);
      expect(arr.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_7800
     * @tc.name testUint8ArrayAttribute078
     * @tc.desc Verify ArrayBuffer offset int 7 constructor byteOffset is 7
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 7);
      expect(arr.byteOffset).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_7900
     * @tc.name testUint8ArrayAttribute079
     * @tc.desc Verify ArrayBuffer offset int 7 constructor byteLength is remaining 9
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 7);
      expect(arr.byteLength).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_8000
     * @tc.name testUint8ArrayAttribute080
     * @tc.desc Verify ArrayBuffer offset int 15 constructor byteOffset is 15
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 15);
      expect(arr.byteOffset).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_8100
     * @tc.name testUint8ArrayAttribute081
     * @tc.desc Verify ArrayBuffer offset int 15 constructor byteLength is 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 15);
      expect(arr.byteLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_8200
     * @tc.name testUint8ArrayAttribute082
     * @tc.desc Verify ArrayBuffer offset int 0 three-parameter length covers full buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 0, 16);
      expect(arr.length).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_8300
     * @tc.name testUint8ArrayAttribute083
     * @tc.desc Verify Array<int> with 10 zero elements length is 10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<int> = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
      const arr = new Uint8Array(src);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_8400
     * @tc.name testUint8ArrayAttribute084
     * @tc.desc Verify map returns new array with same length as original
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const mapped = arr.map((v: number, i: int, a: Uint8Array): number => v + 1);
      expect(mapped.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_8500
     * @tc.name testUint8ArrayAttribute085
     * @tc.desc Verify filter returns new array with length less than original
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4, 5);
      const filtered = arr.filter((v: number, i: int, a: Uint8Array): boolean => v > 3);
      expect(filtered.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_8600
     * @tc.name testUint8ArrayAttribute086
     * @tc.desc Verify toReversed returns new array with same length as original
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const rev = arr.toReversed();
      expect(rev.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE01_8700
     * @tc.name testUint8ArrayAttribute087
     * @tc.desc Verify toSorted returns new array with same length as original
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(3, 1, 2);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(3);
    });
  });
}
