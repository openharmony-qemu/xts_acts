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
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function arrayBufferFromObjectTest(): void {
  describe('ArrayBufferFromObjectTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferFromObject0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0100
     * @tc.desc Verify result.byteLength equals 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('hello', 'utf8', 5);
      expect(result.byteLength).assertEqual(5);
    });

    /**
     * @tc.name testArrayBufferFromObject0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0200
     * @tc.desc Verify result.byteLength equals 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(16);
      const result = Utils.fromObjectWithBuffer(src, 0, 16);
      expect(result.byteLength).assertEqual(16);
    });

    /**
     * @tc.name testArrayBufferFromObject0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0300
     * @tc.desc Verify result.byteLength equals 11
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('hello world', 'utf8', 11);
      expect(result.byteLength).assertEqual(11);
    });

    /**
     * @tc.name testArrayBufferFromObject0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0400
     * @tc.desc Verify result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('', 'utf8', 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromObject0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0500
     * @tc.desc Verify result.byteLength equals 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('你好', 'utf8', 6);
      expect(result.byteLength).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferFromObject0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0600
     * @tc.desc Verify result.byteLength equals 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('abc\t\n\r', 'utf8', 6);
      expect(result.byteLength).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferFromObject0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0700
     * @tc.desc Verify result.byteLength equals 10000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longStr = Utils.buildLongString('a', 10000);
      const result = ArrayBuffer.fromObject(longStr, 'utf8', 10000);
      expect(result.byteLength).assertEqual(10000);
    });

    /**
     * @tc.name testArrayBufferFromObject0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0800
     * @tc.desc Verify result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(0);
      const result = Utils.fromObjectWithBuffer(src, 0, 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromObject0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0900
     * @tc.desc Verify result.byteLength equals 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(16);
      const result = Utils.fromObjectWithBuffer(src, 0, 16);
      expect(result.byteLength).assertEqual(16);
    });

    /**
     * @tc.name testArrayBufferFromObject0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1000
     * @tc.desc Verify result.byteLength equals 1024
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(1024);
      const result = Utils.fromObjectWithBuffer(src, 0, 1024);
      expect(result.byteLength).assertEqual(1024);
    });

    /**
     * @tc.name testArrayBufferFromObject0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1100
     * @tc.desc Verify result.byteLength equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(8);
      const view = new Uint8Array(src);
      view[0] = 1;
      view[1] = 2;
      view[2] = 3;
      const result = Utils.fromObjectWithBuffer(src, 0, 8);
      expect(result.byteLength).assertEqual(8);
      expect(result.at(0)).assertEqual(Int.toByte(1));
      expect(result.at(2)).assertEqual(Int.toByte(3));
    });

    /**
     * @tc.name testArrayBufferFromObject0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1200
     * @tc.desc Verify ArrayBuffer.fromObject(Utils.boxAsObject(badNum), 0, 4) throws Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const badNum: number = 123;
        ArrayBuffer.fromObject(Utils.boxAsObject(badNum), 0, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1300
     * @tc.desc Verify ArrayBuffer.fromObject(Utils.boxAsObject(badNum), 0, 4) throws Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const badNum: number = 0;
        ArrayBuffer.fromObject(Utils.boxAsObject(badNum), 0, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1400
     * @tc.desc Verify ArrayBuffer.fromObject(Utils.boxAsObject(badNum), 0, 4) throws Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const badNum: number = -1;
        ArrayBuffer.fromObject(Utils.boxAsObject(badNum), 0, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1500
     * @tc.desc Verify ArrayBuffer.fromObject(Utils.boxAsObject(badNum), 0, 4) throws Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const badNum: number = 3.14;
        ArrayBuffer.fromObject(Utils.boxAsObject(badNum), 0, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1600
     * @tc.desc Verify ArrayBuffer.fromObject(Utils.booleanAsObject(true), 0, 4) throws Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject(Utils.booleanAsObject(true), 0, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1700
     * @tc.desc Verify ArrayBuffer.fromObject(Utils.booleanAsObject(false), 0, 4) throws Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject(Utils.booleanAsObject(false), 0, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1800
     * @tc.desc Verify ArrayBuffer.fromObject(Utils.nullAsObject(), 0, 4) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject(Utils.nullAsObject(), 0, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1900
     * @tc.desc Verify ArrayBuffer.fromObject(Utils.undefinedAsObject(), 0, 4) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject(Utils.undefinedAsObject(), 0, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_2000
     * @tc.desc Verify ArrayBuffer.fromObject(Utils.arrayNumberAsObject(badArr), 0, 4) throws Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const badArr = new Array<number>();
      badArr.pushOne(1);
      badArr.pushOne(2);
      badArr.pushOne(3);
      try {
        ArrayBuffer.fromObject(Utils.arrayNumberAsObject(badArr), 0, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_2100
     * @tc.desc Verify ArrayBuffer.fromObject(Utils.fromObjectClassArg(Utils.plainObject()), 0, 4) throws Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject(Utils.fromObjectClassArg(Utils.plainObject()), 0, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_2200
     * @tc.desc Verify ArrayBuffer.fromObject(Utils.intReturningFnAsObject(), 0, 4) throws Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject(Utils.intReturningFnAsObject(), 0, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_2300
     * @tc.desc Verify ArrayBuffer.fromObject(Utils.uint8ArrayAsObject(arr), 0, 8) throws Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint8Array(8);
        ArrayBuffer.fromObject(Utils.uint8ArrayAsObject(arr), 0, 8);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_2400
     * @tc.desc Verify result.byteLength equals 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(16);
      const w = new Uint8Array(src);
      w[0] = 99;
      const result = Utils.fromObjectWithBuffer(src, 0, 16);
      expect(result.byteLength).assertEqual(16);
      expect(result.at(0)).assertEqual(Int.toByte(99));
    });

    /**
     * @tc.name testArrayBufferFromObject0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_2500
     * @tc.desc Verify result.byteLength equals 12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(16);
      const result = Utils.fromObjectWithBuffer(src, 4, 12);
      expect(result.byteLength).assertEqual(12);
    });

    /**
     * @tc.name testArrayBufferFromObject0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_2600
     * @tc.desc Verify result.byteLength equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(16);
      const result = Utils.fromObjectWithBuffer(src, 15, 1);
      expect(result.byteLength).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferFromObject0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_2700
     * @tc.desc Verify result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(16);
      const result = Utils.fromObjectWithBuffer(src, 16, 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromObject0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_2800
     * @tc.desc Verify Utils.fromObjectWithBuffer(src, -1, 16) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, -1, 16);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_2900
     * @tc.desc Verify Utils.fromObjectWithBuffer(src, 20, 4) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, 20, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_3000
     * @tc.desc Verify Utils.fromObjectWithBuffer(src, 2147483647, 4) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, 2147483647, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_3100
     * @tc.desc Verify result.byteLength equals 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('hello', 'utf8', 5);
      expect(result.byteLength).assertEqual(5);
      expect(result.at(0)).assertEqual(Int.toByte(104));
      expect(result.at(4)).assertEqual(Int.toByte(111));
    });

    /**
     * @tc.name testArrayBufferFromObject0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_3200
     * @tc.desc Verify result.byteLength equals 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('hello', 'utf-8', 5);
      expect(result.byteLength).assertEqual(5);
    });

    /**
     * @tc.name testArrayBufferFromObject0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_3300
     * @tc.desc Verify result.byteLength equals 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('hello', 'ascii', 5);
      expect(result.byteLength).assertEqual(5);
    });

    /**
     * @tc.name testArrayBufferFromObject0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_3400
     * @tc.desc Verify ArrayBuffer.fromObject('hello', 'invalid-encoding', 5) throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject('hello', 'invalid-encoding', 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_3500
     * @tc.desc Verify ArrayBuffer.fromObject('hello', '', 5) throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject('hello', '', 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_3600
     * @tc.desc Verify ArrayBuffer.fromObject('hello', Utils.nullAsString(), 5) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject('hello', Utils.nullAsString(), 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_3700
     * @tc.desc Verify ArrayBuffer.fromObject('hello', Utils.undefinedAsString(), 5) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject('hello', Utils.undefinedAsString(), 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_3800
     * @tc.desc Verify ArrayBuffer.fromObject('hello', Utils.booleanAsString(true), 5) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject('hello', Utils.booleanAsString(true), 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_3900
     * @tc.desc Verify ArrayBuffer.fromObject('hello', Utils.booleanAsString(false), 5) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject('hello', Utils.booleanAsString(false), 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_4000
     * @tc.desc Verify result.byteLength equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(16);
      const result = Utils.fromObjectWithBuffer(src, Double.toInt(2.5), 8);
      expect(result.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferFromObject0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_4100
     * @tc.desc Verify result.byteLength equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(16);
      const result = Utils.fromObjectWithBuffer(src, Double.toInt(Double.NaN), 8);
      expect(result.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferFromObject0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_4200
     * @tc.desc Verify result.byteLength equals 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(16);
      const result = Utils.fromObjectWithBuffer(src, 0, 16);
      expect(result.byteLength).assertEqual(16);
    });

    /**
     * @tc.name testArrayBufferFromObject0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_4300
     * @tc.desc Verify result.byteLength equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(16);
      const result = Utils.fromObjectWithBuffer(src, 0, 1);
      expect(result.byteLength).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferFromObject0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_4400
     * @tc.desc Verify result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(16);
      const result = Utils.fromObjectWithBuffer(src, 0, 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromObject0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_4500
     * @tc.desc Verify Utils.fromObjectWithBuffer(src, 0, -1) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, 0, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_4600
     * @tc.desc Verify Utils.fromObjectWithBuffer(src, 0, -100) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, 0, -100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_4700
     * @tc.desc Verify Utils.fromObjectWithBuffer(src, 8, 20) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, 8, 20);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_4800
     * @tc.desc Verify result.byteLength equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(16);
      const result = Utils.fromObjectWithBuffer(src, 8, 8);
      expect(result.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferFromObject0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_4900
     * @tc.desc Verify Utils.fromObjectWithBuffer(src, 0, 2147483647) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, 0, 2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_5000
     * @tc.desc Verify Utils.fromObjectWithBuffer(src, 0, Utils.nullAsInt()) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, 0, Utils.nullAsInt());
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_5100
     * @tc.desc Verify Utils.fromObjectWithBuffer(src, 0, Utils.undefinedAsInt()) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, 0, Utils.undefinedAsInt());
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_5200
     * @tc.desc Verify Utils.fromObjectWithBuffer(src, 0, Utils.stringAsInt('10')) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, 0, Utils.stringAsInt('10'));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_5300
     * @tc.desc Verify Utils.fromObjectWithBuffer(src, 0, Utils.booleanAsInt(true)) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, 0, Utils.booleanAsInt(true));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_5400
     * @tc.desc Verify result.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(16);
      const result = Utils.fromObjectWithBuffer(src, 0, Double.toInt(3.14));
      expect(result.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromObject0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_5500
     * @tc.desc Verify result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(16);
      const result = Utils.fromObjectWithBuffer(src, 0, Double.toInt(Double.NaN));
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromObject0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_5600
     * @tc.desc Verify value is not null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('hello', 'utf8', 5);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromObject0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_5700
     * @tc.desc Verify value is not null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(16);
      const view = new Uint8Array(src);
      view[0] = 72;
      view[1] = 105;
      const result = Utils.fromObjectWithBuffer(src, 0, 16);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromObject0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_5800
     * @tc.desc Verify result.byteLength equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(16);
      const result = Utils.fromObjectWithBuffer(src, 4, 8);
      expect(result.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferFromObject0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_5900
     * @tc.desc Verify result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('', 'utf8', 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromObject0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_6000
     * @tc.desc Verify result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(0);
      const result = Utils.fromObjectWithBuffer(src, 0, 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromObject0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_6100
     * @tc.desc Verify return value is ArrayBuffer instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('hello', 'utf8', 5);
      expect(result instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromObject0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_6200
     * @tc.desc Verify typeof result equals 'object'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('hello', 'utf8', 5);
      expect(typeof result).assertEqual('object');
    });

    /**
     * @tc.name testArrayBufferFromObject0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_6300
     * @tc.desc Verify Class.of(result) === Class.of(ref) is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('hello', 'utf8', 5);
      const ref = new ArrayBuffer(0);
      expect(Class.of(result) === Class.of(ref)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromObject0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_6400
     * @tc.desc Verify result !== src is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(16);
      const result = Utils.fromObjectWithBuffer(src, 0, 16);
      expect(result !== src).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromObject0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_6500
     * @tc.desc Verify Uint8Array view bytes match UTF-8 encoding of abc
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('abc', 'utf8', 3);
      const view = new Uint8Array(result);
      expect(view[0]).assertEqual(97);
      expect(view[1]).assertEqual(98);
      expect(view[2]).assertEqual(99);
    });

    /**
     * @tc.name testArrayBufferFromObject0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_6600
     * @tc.desc Verify view.length equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('你', 'utf8', 3);
      const view = new Uint8Array(result);
      expect(view.length).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromObject0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_6700
     * @tc.desc Verify resView[0] equals 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(4);
      const srcView = new Uint8Array(src);
      srcView[0] = 10;
      srcView[1] = 20;
      srcView[2] = 30;
      srcView[3] = 40;
      const result = Utils.fromObjectWithBuffer(src, 0, 4);
      const resView = new Uint8Array(result);
      expect(resView[0]).assertEqual(10);
      expect(resView[1]).assertEqual(20);
      expect(resView[2]).assertEqual(30);
      expect(resView[3]).assertEqual(40);
    });

    /**
     * @tc.name testArrayBufferFromObject0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_6800
     * @tc.desc Verify resView[0] equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(8);
      const srcView = new Uint8Array(src);
      srcView[0] = 1;
      srcView[1] = 2;
      srcView[2] = 3;
      srcView[3] = 4;
      srcView[4] = 5;
      srcView[5] = 6;
      srcView[6] = 7;
      srcView[7] = 8;
      const result = Utils.fromObjectWithBuffer(src, 2, 4);
      const resView = new Uint8Array(result);
      expect(resView[0]).assertEqual(3);
      expect(resView[1]).assertEqual(4);
      expect(resView[2]).assertEqual(5);
      expect(resView[3]).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferFromObject0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_6900
     * @tc.desc Verify srcView[0] equals 100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(4);
      const srcView = new Uint8Array(src);
      srcView[0] = 100;
      const result = Utils.fromObjectWithBuffer(src, 0, 4);
      const resView = new Uint8Array(result);
      resView[0] = 200;
      expect(srcView[0]).assertEqual(100);
    });

    /**
     * @tc.name testArrayBufferFromObject0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_7000
     * @tc.desc Verify result.byteLength equals 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(32);
      const result = Utils.fromObjectWithBuffer(src, 0, 16);
      expect(result.byteLength).assertEqual(16);
    });

    /**
     * @tc.name testArrayBufferFromObject0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_7100
     * @tc.desc Verify result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(16);
      const result = Utils.fromObjectWithBuffer(src, 0, 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromObject0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_7200
     * @tc.desc Verify result.byteLength equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(8);
      const result = Utils.fromObjectWithBuffer(src, 0, 8);
      expect(result.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferFromObject0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_7300
     * @tc.desc Verify result.byteLength equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(8);
      const result = Utils.fromObjectWithBuffer(src, 7, 1);
      expect(result.byteLength).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferFromObject0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_7400
     * @tc.desc Verify result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(8);
      const result = Utils.fromObjectWithBuffer(src, 8, 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromObject0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_7500
     * @tc.desc Verify result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('', 'utf8', 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromObject0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_7600
     * @tc.desc Verify result.byteLength equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('A', 'utf8', 1);
      expect(result.byteLength).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferFromObject0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_7700
     * @tc.desc Verify ArrayBuffer.fromObject(Utils.arrayNumberAsObject(emptyArr), 0, 4) throws Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyArr = new Array<number>();
      try {
        ArrayBuffer.fromObject(Utils.arrayNumberAsObject(emptyArr), 0, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_7800
     * @tc.desc Verify ArrayBuffer.fromObject(Utils.dataViewAsObject(dv), 0, 8) throws Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(8);
        const dv = new DataView(buf);
        ArrayBuffer.fromObject(Utils.dataViewAsObject(dv), 0, 8);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_7900
     * @tc.desc Verify Utils.fromObjectWithBuffer(src, Utils.nullAsInt(), 16) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, Utils.nullAsInt(), 16);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_8000
     * @tc.desc Verify ArrayBuffer.fromObject(Utils.nullAsObject(), (null as string), (null as int)) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject(Utils.nullAsObject(), (null as string), (null as int));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_8100
     * @tc.desc Verify ArrayBuffer.fromObject(Utils.undefinedAsObject(), (undefined as string), (undefined as int)) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject(Utils.undefinedAsObject(), (undefined as string), (undefined as int));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_8200
     * @tc.desc Verify Utils.fromObjectWithBuffer(src, -1, 8) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, -1, 8);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_8300
     * @tc.desc Verify Utils.fromObjectWithBuffer(src, 100, 4) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const src = new ArrayBuffer(8);
        Utils.fromObjectWithBuffer(src, 100, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_8400
     * @tc.desc Verify Utils.fromObjectWithBuffer(src, 0, -5) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, 0, -5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_8500
     * @tc.desc Verify Utils.fromObjectWithBuffer(src, 4, 8) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const src = new ArrayBuffer(8);
        Utils.fromObjectWithBuffer(src, 4, 8);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_8600
     * @tc.desc Verify ArrayBuffer.fromObject('hi', 'utf8', 100) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject('hi', 'utf8', 100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0087
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_8700
     * @tc.desc Verify Utils.fromObjectWithBuffer(src, -2147483648, 8) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, -2147483648, 8);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_8800
     * @tc.desc Verify Utils.fromObjectWithBuffer(src, 0, 2147483647) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, 0, 2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
  });
}
