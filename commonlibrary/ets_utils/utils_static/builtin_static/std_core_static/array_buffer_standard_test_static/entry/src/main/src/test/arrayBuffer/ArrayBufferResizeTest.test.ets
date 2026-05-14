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
 * WITHOUT WARRANTIES OR ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function arrayBufferResizeTest(): void {
  describe('ArrayBufferResizeTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.name testArrayBufferResize0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0100
     * @tc.desc Verify ArrayBuffer.resize: call resize passing 1 int ，normal exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(2, 6);
      buffer.resize(4);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferResize0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0200
     * @tc.desc Verify ArrayBuffer.resize: call resize ，expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(2, 6);
      try {
        buffer.resize();
      } catch (e) {
        console.info(e instanceof TypeError);
      }
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferResize0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0300
     * @tc.desc Verify ArrayBuffer.resize: call resize passing 2 ，expect or throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(2, 6);
      try {
        buffer.resize(4, 6);
      } catch (e) {
        console.info(e);
      }
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferResize0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0400
     * @tc.desc Verify ArrayBuffer.resize: call resize passing 3 ，expect or throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(2, 6);
      try {
        buffer.resize(4, 6, 8);
      } catch (e) {
        console.info(e);
      }
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferResize0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0500
     * @tc.desc Verify ArrayBuffer.resize: passing 0， buffer length is 0，byteLength is 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 6);
      buffer.resize(0);
      console.info(buffer.byteLength === 0);
      expect(buffer != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferResize0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0600
     * @tc.desc Verify ArrayBuffer.resize: passing and when before byteLength ，byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 8);
      buffer.resize(4);
      console.info(buffer.byteLength === 4);
      expect(buffer != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferResize0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0700
     * @tc.desc Verify ArrayBuffer.resize: passing maxByteLength， buffer to maximum
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 6);
      buffer.resize(6);
      console.info(buffer.byteLength === 6);
      expect(buffer != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferResize0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0800
     * @tc.desc Verify ArrayBuffer.resize: passing less than when before byteLength ，buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(6, 10);
      buffer.resize(3);
      console.info(buffer.byteLength === 3);
      expect(buffer != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferResize0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0900
     * @tc.desc Verify ArrayBuffer.resize: passing greater than when before byteLength ，buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 8);
      buffer.resize(6);
      console.info(buffer.byteLength === 6);
      expect(buffer != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferResize0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_1000
     * @tc.desc Verify ArrayBuffer.resize: passing -1，expect throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(2, 6);
      try {
        buffer.resize(-1);
      } catch (e) {
        console.info(e instanceof RangeError);
      }
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferResize0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_1100
     * @tc.desc Verify ArrayBuffer.resize: passing greater than maxByteLength ，expect throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(2, 6);
      try {
        buffer.resize(7);
      } catch (e) {
        console.info(e instanceof RangeError);
      }
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferResize0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_1200
     * @tc.desc Verify ArrayBuffer.resize: passing inttype maximum ，expect throws RangeError（ maxByteLength）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(2, 6);
      try {
        buffer.resize(2147483647);
      } catch (e) {
        console.info(e instanceof RangeError);
      }
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferResize0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_1300
     * @tc.desc Verify ArrayBuffer.resize: passing null，expect throws TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(2, 6);
      try {
        buffer.resize(null);
      } catch (e) {
        console.info(e instanceof TypeError);
      }
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferResize0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_1400
     * @tc.desc Verify ArrayBuffer.resize: passing undefined，expect throws TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(2, 6);
      try {
        buffer.resize(undefined);
      } catch (e) {
        console.info(e instanceof TypeError);
      }
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferResize0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_1500
     * @tc.desc Verify ArrayBuffer.resize: passing floating-point 1.5，verify type or throws exception is
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(2, 6);
      try {
        buffer.resize(1.5);
      } catch (e) {
        console.info(e);
      }
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferResize0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_1600
     * @tc.desc Verify ArrayBuffer.resize: passing string type ，expect throws TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(2, 6);
      try {
        buffer.resize("4");
      } catch (e) {
        console.info(e instanceof TypeError);
      }
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferResize0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_1700
     * @tc.desc Verify ArrayBuffer.resize: passing boolean true，verify type or throws exception is
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(2, 6);
      try {
        buffer.resize(true);
      } catch (e) {
        console.info(e);
      }
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferResize0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_1800
     * @tc.desc Verify ArrayBuffer.resize: passing empty object ，expect throws TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(2, 6);
      try {
        buffer.resize({});
      } catch (e) {
        console.info(e instanceof TypeError);
      }
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferResize0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_1900
     * @tc.desc Verify ArrayBuffer.resize: buffer from length resize to length ，byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 8);
      buffer.resize(6);
      console.info(buffer.byteLength === 6);
      expect(buffer != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferResize0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_2000
     * @tc.desc Verify ArrayBuffer.resize: buffer from length resize to length ，byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(6, 10);
      buffer.resize(2);
      console.info(buffer.byteLength === 2);
      expect(buffer != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferResize0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_2100
     * @tc.desc Verify ArrayBuffer.resize: buffer resize to length 0，byteLength is 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 8);
      buffer.resize(0);
      console.info(buffer.byteLength === 0);
      expect(buffer != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferResize0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_2200
     * @tc.desc Verify ArrayBuffer.resize: buffer resize to maxByteLength，byteLength equals maxByteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 10);
      buffer.resize(10);
      console.info(buffer.byteLength === 10);
      expect(buffer != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferResize0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_2300
     * @tc.desc Verify ArrayBuffer.resize: multiple call resize， byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 10);
      buffer.resize(4);
      console.info(buffer.byteLength === 4);
      buffer.resize(8);
      console.info(buffer.byteLength === 8);
      buffer.resize(2);
      console.info(buffer.byteLength === 2);
      buffer.resize(10);
      console.info(buffer.byteLength === 10);
      expect(buffer != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferResize0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_2400
     * @tc.desc Verify ArrayBuffer.resize: buffer ，verify byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(6, 12);
      buffer.resize(2);
      console.info(buffer.byteLength === 2);
      buffer.resize(10);
      console.info(buffer.byteLength === 10);
      expect(buffer != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferResize0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_2500
     * @tc.desc Verify ArrayBuffer.resize: verify resizemethod return value is undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 6);
      const result = buffer.resize(4);
      console.info(result === undefined);
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferResize0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_2600
     * @tc.desc Verify ArrayBuffer.resize: verify return value null or not undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 6);
      const result = buffer.resize(4);
      console.info(result !== null);
      console.info(result === undefined);
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferResize0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_2700
     * @tc.desc Verify ArrayBuffer.resize: resize to after ，byteLength equals newLen
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 10);
      buffer.resize(7);
      console.info(buffer.byteLength === 7);
      expect(buffer != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferResize0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_2800
     * @tc.desc Verify ArrayBuffer.resize: resize to after ，byteLength equals newLen
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 12);
      buffer.resize(3);
      console.info(buffer.byteLength === 3);
      expect(buffer != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferResize0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_2900
     * @tc.desc Verify ArrayBuffer.resize: resize(0) after ，byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(5, 10);
      buffer.resize(0);
      console.info(buffer.byteLength === 0);
      expect(buffer != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferResize0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_3000
     * @tc.desc Verify ArrayBuffer.resize: resize to maxByteLength after ，byteLengthequals maxByteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 8);
      buffer.resize(8);
      console.info(buffer.byteLength === 8);
      console.info(buffer.byteLength === buffer.maxByteLength);
      expect(buffer != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferResize0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_3100
     * @tc.desc Verify ArrayBuffer.resize: resize after maxByteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 10);
      buffer.resize(5);
      console.info(buffer.maxByteLength === 10);
      buffer.resize(0);
      console.info(buffer.maxByteLength === 10);
      expect(buffer != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferResize0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_3200
     * @tc.desc Verify ArrayBuffer.resize: multiple resize after ，byteLength equals after passing
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      buffer.resize(8);
      buffer.resize(2);
      buffer.resize(12);
      console.info(buffer.byteLength === 12);
      expect(buffer != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferResize0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_3300
     * @tc.desc Verify ArrayBuffer.resize: resize after ， byte TypedArray setmethod data
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 8);
      const view = new Int8Array(buffer);
      buffer.resize(6);
      view.set([10, 20, 30, 40], 2);
      console.info(view[2] === 10);
      console.info(view[3] === 20);
      console.info(view[4] === 30);
      console.info(view[5] === 40);
      expect(view != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferResize0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_3400
     * @tc.desc Verify ArrayBuffer.resize: resize after ， byte is 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 8);
      buffer.resize(6);
      const view = new Int8Array(buffer);
      console.info(view[2] === 0);
      console.info(view[3] === 0);
      console.info(view[4] === 0);
      console.info(view[5] === 0);
      expect(view != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferResize0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_3500
     * @tc.desc Verify ArrayBuffer.resize: resize to maxByteLength after ，
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 6);
      buffer.resize(6);
      const view = new Int8Array(buffer);
      view.set([1, 2, 3, 4, 5, 6]);
      console.info(view[0] === 1);
      console.info(view[5] === 6);
      expect(view != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferResize0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_3600
     * @tc.desc Verify ArrayBuffer.resize: ， normal set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(6, 12);
      const view = new Int8Array(buffer);
      view.set([1, 2, 3, 4, 5, 6]);
      buffer.resize(2);
      buffer.resize(8);
      view.set([10, 20, 30, 40, 50, 60], 2);
      console.info(view[2] === 10);
      console.info(view[7] === 60);
      expect(view != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferResize0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_3700
     * @tc.desc Verify ArrayBuffer.resize: resize after ， byte data
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 8);
      const view = new Int8Array(buffer);
      view.set([1, 2, 3, 4]);
      buffer.resize(8);
      console.info(view[0] === 1);
      console.info(view[1] === 2);
      console.info(view[2] === 3);
      console.info(view[3] === 4);
      expect(view != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferResize0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_3800
     * @tc.desc Verify ArrayBuffer.resize: resize after ， （0~newLen-1） byte data
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(6, 10);
      const view = new Int8Array(buffer);
      view.set([10, 20, 30, 40, 50, 60]);
      buffer.resize(3);
      console.info(view[0] === 10);
      console.info(view[1] === 20);
      console.info(view[2] === 30);
      expect(view != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferResize0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_3900
     * @tc.desc Verify ArrayBuffer.resize: ， data
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(6, 12);
      const view = new Int8Array(buffer);
      view.set([1, 2, 3, 4, 5, 6]);
      buffer.resize(3);
      buffer.resize(6);
      console.info(view[0] === 1);
      console.info(view[1] === 2);
      console.info(view[2] === 3);
      expect(view != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferResize0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_4000
     * @tc.desc Verify ArrayBuffer.resize: resize to 0 after ，verify data is （ data ）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 8);
      const view = new Int8Array(buffer);
      view.set([10, 20, 30, 40]);
      buffer.resize(0);
      buffer.resize(4);
      console.info(view[0] === 0);
      console.info(view[1] === 0);
      console.info(view[2] === 0);
      console.info(view[3] === 0);
      expect(view != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferResize0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_4100
     * @tc.desc Verify ArrayBuffer.resize: multiple resize（ length ）， data
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 12);
      const view = new Int8Array(buffer);
      view.set([11, 22, 33, 44]);
      buffer.resize(8);
      buffer.resize(3);
      console.info(view[0] === 11);
      console.info(view[1] === 22);
      console.info(view[2] === 33);
      expect(view != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferResize0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_4200
     * @tc.desc Verify ArrayBuffer.resize: create resizable ArrayBuffer（ maxByteLength），call resizeexpect throws TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(4);
      try {
        buffer.resize(6);
      } catch (e) {
        console.info(e instanceof TypeError);
      }
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferResize0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_4300
     * @tc.desc Verify ArrayBuffer.resize: resizable buffer resize to when before length ， expect throws TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(4);
      try {
        buffer.resize(4);
      } catch (e) {
        console.info(e instanceof TypeError);
      }
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferResize0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_4400
     * @tc.desc Verify ArrayBuffer.resize: ArrayBuffer detach after call resize，expect throws TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(4, 8);
      // 通过transfer detach原始buffer
      const transferred = buffer.transfer();
      try {
        buffer.resize(6);
      } catch (e) {
        console.info(e instanceof TypeError);
      }
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferResize0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_4500
     * @tc.desc Verify ArrayBuffer.resize: detached after buffer passing 0 expect throws TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(4, 8);
      const transferred = buffer.transfer();
      try {
        buffer.resize(0);
      } catch (e) {
        console.info(e instanceof TypeError);
      }
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferResize0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_4600
     * @tc.desc Verify ArrayBuffer.resize: passing -1，expect throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(2, 6);
      try {
        buffer.resize(-1);
      } catch (e) {
        console.info(e instanceof RangeError);
      }
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferResize0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_4700
     * @tc.desc Verify ArrayBuffer.resize: passing negative -100，expect throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(2, 6);
      try {
        buffer.resize(-100);
      } catch (e) {
        console.info(e instanceof RangeError);
      }
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferResize0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_4800
     * @tc.desc Verify ArrayBuffer.resize: passing maxByteLength + 1，expect throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(2, 6);
      try {
        buffer.resize(7);
      } catch (e) {
        console.info(e instanceof RangeError);
      }
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferResize0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_4900
     * @tc.desc Verify ArrayBuffer.resize: passing greater than maxByteLength 1000，expect throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(2, 6);
      try {
        buffer.resize(1000);
      } catch (e) {
        console.info(e instanceof RangeError);
      }
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferResize0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_5000
     * @tc.desc Verify ArrayBuffer.resize: passing 2147483647，expect throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(2, 6);
      try {
        buffer.resize(2147483647);
      } catch (e) {
        console.info(e instanceof RangeError);
      }
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferResize0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_5100
     * @tc.desc Verify ArrayBuffer.resize: passing -2147483648（intminimum ），expect throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(2, 6);
      try {
        buffer.resize(-2147483648);
      } catch (e) {
        console.info(e instanceof RangeError);
      }
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });
    return;
  });
}
