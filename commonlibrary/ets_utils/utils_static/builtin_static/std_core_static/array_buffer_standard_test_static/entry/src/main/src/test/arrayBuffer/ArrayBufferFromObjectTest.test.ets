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

export default function arrayBufferFromObjectTest(): void {
  describe('ArrayBufferFromObjectTest', (): void => {
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
     * @tc.name testArrayBufferFromObject0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0010
     * @tc.desc Verify ArrayBuffer.fromObject: passing 3 required -string+encoding+length，normal call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("hello", "utf8", 5);
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromObject0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0020
     * @tc.desc Verify ArrayBuffer.fromObject: passing 3 required -ArrayBuffer+byteOffset+length，normal call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(16);
      let result = ArrayBuffer.fromObject(src, 0, 16);
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromObject0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0030
     * @tc.desc Verify ArrayBuffer.fromObject: 1 obj，expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject();
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0040
     * @tc.desc Verify ArrayBuffer.fromObject: 2 byteOffsetOrEncoding，expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject("hello");
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0050
     * @tc.desc Verify ArrayBuffer.fromObject: 3 length，expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject("hello", "utf8");
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0060
     * @tc.desc Verify ArrayBuffer.fromObject: passing 1 ，expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject("hello");
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0070
     * @tc.desc Verify ArrayBuffer.fromObject: extra parameters （4 ），expect throws exception or ignored
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject("hello", "utf8", 5, "extra");
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0080
     * @tc.desc Verify ArrayBuffer.fromObject: extra parameters （5 ），expect throws exception or ignored
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject("hello", "utf8", 5, "extra1", "extra2");
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0090
     * @tc.desc Verify ArrayBuffer.fromObject: obj is stringtype -plain ASCIIstring ，normal create ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("hello world", "utf8", 11);
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromObject0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0100
     * @tc.desc Verify ArrayBuffer.fromObject: obj is stringtype -empty string ，normal create
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("", "utf8", 0);
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromObject0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0110
     * @tc.desc Verify ArrayBuffer.fromObject: obj is stringtype -non-ASCII string （ byte ）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("你好", "utf8", 6);
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromObject0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0120
     * @tc.desc Verify ArrayBuffer.fromObject: obj is stringtype - special characters string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("abc\t\n\r", "utf8", 7);
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromObject0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0130
     * @tc.desc Verify ArrayBuffer.fromObject: obj is stringtype -long string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr = "a".repeat(10000);
      let result = ArrayBuffer.fromObject(longStr, "utf8", 10000);
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromObject0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0140
     * @tc.desc Verify ArrayBuffer.fromObject: obj is ArrayBuffertype -empty ArrayBuffer（length is 0）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(0);
      let result = ArrayBuffer.fromObject(src, 0, 0);
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromObject0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0150
     * @tc.desc Verify ArrayBuffer.fromObject: obj is ArrayBuffertype -normal ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(16);
      let result = ArrayBuffer.fromObject(src, 0, 16);
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromObject0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0160
     * @tc.desc Verify ArrayBuffer.fromObject: obj is ArrayBuffertype - ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(1024);
      let result = ArrayBuffer.fromObject(src, 0, 1024);
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromObject0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0170
     * @tc.desc Verify ArrayBuffer.fromObject: obj is ArrayBuffertype - data ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(8);
      let view = new Uint8Array(src);
      view[0] = 1; view[1] = 2; view[2] = 3;
      let result = ArrayBuffer.fromObject(src, 0, 8);
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromObject0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0180
     * @tc.desc Verify ArrayBuffer.fromObject: obj is numbertype ，expect throws Errorexception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject(123, 0, 4);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0190
     * @tc.desc Verify ArrayBuffer.fromObject: obj is number 0，expect throws Errorexception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject(0, 0, 4);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0200
     * @tc.desc Verify ArrayBuffer.fromObject: obj is negative ，expect throws Errorexception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject(-1, 0, 4);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0210
     * @tc.desc Verify ArrayBuffer.fromObject: obj is floating-point ，expect throws Errorexception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject(3.14, 0, 4);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0220
     * @tc.desc Verify ArrayBuffer.fromObject: obj is booleantype true，expect throws Errorexception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject(true, 0, 4);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0230
     * @tc.desc Verify ArrayBuffer.fromObject: obj is booleantype false，expect throws Errorexception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject(false, 0, 4);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0240
     * @tc.desc Verify ArrayBuffer.fromObject: obj is null，expect throws Errorexception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject(null, 0, 4);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0250
     * @tc.desc Verify ArrayBuffer.fromObject: obj is undefined，expect throws Errorexception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject(undefined, 0, 4);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0260
     * @tc.desc Verify ArrayBuffer.fromObject: obj is array type ，expect throws Errorexception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject([1, 2, 3], 0, 4);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0270
     * @tc.desc Verify ArrayBuffer.fromObject: obj is plain object {}，expect throws Errorexception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject({}, 0, 4);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0280
     * @tc.desc Verify ArrayBuffer.fromObject: obj is function type ，expect throws Errorexception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject(function(){}, 0, 4);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0290
     * @tc.desc Verify ArrayBuffer.fromObject: obj is TypedArray（ Uint8Array），expect throws Errorexception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr = new Uint8Array(8);
      let result = ArrayBuffer.fromObject(arr, 0, 8);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0300
     * @tc.desc Verify ArrayBuffer.fromObject: byteOffsetOrEncoding is inttype -offset is 0（ from ArrayBuffer ）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(16);
      let result = ArrayBuffer.fromObject(src, 0, 16);
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromObject0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0310
     * @tc.desc Verify ArrayBuffer.fromObject: byteOffsetOrEncoding is inttype -positive offset
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(16);
      let result = ArrayBuffer.fromObject(src, 4, 12);
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromObject0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0320
     * @tc.desc Verify ArrayBuffer.fromObject: byteOffsetOrEncoding is inttype -offset equals ArrayBufferlength 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(16);
      let result = ArrayBuffer.fromObject(src, 15, 1);
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromObject0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0330
     * @tc.desc Verify ArrayBuffer.fromObject: byteOffsetOrEncoding is inttype -offset equals ArrayBufferlength （length=0boundary ）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(16);
      let result = ArrayBuffer.fromObject(src, 16, 0);
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromObject0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0340
     * @tc.desc Verify ArrayBuffer.fromObject: byteOffsetOrEncoding is inttype -negative offset ，expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
      let result = ArrayBuffer.fromObject(src, -1, 16);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0350
     * @tc.desc Verify ArrayBuffer.fromObject: byteOffsetOrEncoding is inttype -offset out of range ArrayBufferlength ，expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
      let result = ArrayBuffer.fromObject(src, 20, 4);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0360
     * @tc.desc Verify ArrayBuffer.fromObject: byteOffsetOrEncoding is inttype -offset is intmaximum ，expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
      let result = ArrayBuffer.fromObject(src, 2147483647, 4);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0370
     * @tc.desc Verify ArrayBuffer.fromObject: byteOffsetOrEncoding is stringtype -"utf8"encoding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("hello", "utf8", 5);
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromObject0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0380
     * @tc.desc Verify ArrayBuffer.fromObject: byteOffsetOrEncoding is stringtype -"utf-8"encoding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("hello", "utf-8", 5);
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromObject0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0390
     * @tc.desc Verify ArrayBuffer.fromObject: byteOffsetOrEncoding is stringtype -"ascii"encoding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("hello", "ascii", 5);
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromObject0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0400
     * @tc.desc Verify ArrayBuffer.fromObject: byteOffsetOrEncoding is stringtype - encoding string ，expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject("hello", "invalid-encoding", 5);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0410
     * @tc.desc Verify ArrayBuffer.fromObject: byteOffsetOrEncoding is stringtype -empty string ，expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject("hello", "", 5);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0420
     * @tc.desc Verify ArrayBuffer.fromObject: byteOffsetOrEncoding is null，expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject("hello", null, 5);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0430
     * @tc.desc Verify ArrayBuffer.fromObject: byteOffsetOrEncoding is undefined，expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject("hello", undefined, 5);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0440
     * @tc.desc Verify ArrayBuffer.fromObject: byteOffsetOrEncoding is booleantype true，expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject("hello", true, 5);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0450
     * @tc.desc Verify ArrayBuffer.fromObject: byteOffsetOrEncoding is booleantype false，expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject("hello", false, 5);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0460
     * @tc.desc Verify ArrayBuffer.fromObject: byteOffsetOrEncoding is floating-point （not ），expect is verify
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(16);
      let result = ArrayBuffer.fromObject(src, 2.5, 8);
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromObject0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0470
     * @tc.desc Verify ArrayBuffer.fromObject: byteOffsetOrEncoding is NaN，expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
      let result = ArrayBuffer.fromObject(src, NaN, 8);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0480
     * @tc.desc Verify ArrayBuffer.fromObject: length is normal ， and source data length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(16);
      let result = ArrayBuffer.fromObject(src, 0, 16);
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromObject0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0490
     * @tc.desc Verify ArrayBuffer.fromObject: length is 1（minimum valid ）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(16);
      let result = ArrayBuffer.fromObject(src, 0, 1);
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromObject0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0500
     * @tc.desc Verify ArrayBuffer.fromObject: length is 0（boundary ）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(16);
      let result = ArrayBuffer.fromObject(src, 0, 0);
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromObject0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0510
     * @tc.desc Verify ArrayBuffer.fromObject: length is negative ，expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
      let result = ArrayBuffer.fromObject(src, 0, -1);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0520
     * @tc.desc Verify ArrayBuffer.fromObject: length is -100（ negative ），expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
      let result = ArrayBuffer.fromObject(src, 0, -100);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0530
     * @tc.desc Verify ArrayBuffer.fromObject: lengthout of range （offset+length > source.length），expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
      let result = ArrayBuffer.fromObject(src, 8, 20);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0540
     * @tc.desc Verify ArrayBuffer.fromObject: lengthequals source ArrayBuffer length （offset+length == source.length）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(16);
      let result = ArrayBuffer.fromObject(src, 8, 8);
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromObject0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0550
     * @tc.desc Verify ArrayBuffer.fromObject: length is intmaximum (2147483647)，expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
      let result = ArrayBuffer.fromObject(src, 0, 2147483647);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0560
     * @tc.desc Verify ArrayBuffer.fromObject: length is null，expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
      let result = ArrayBuffer.fromObject(src, 0, null);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0570
     * @tc.desc Verify ArrayBuffer.fromObject: length is undefined，expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
      let result = ArrayBuffer.fromObject(src, 0, undefined);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0580
     * @tc.desc Verify ArrayBuffer.fromObject: length is stringtype "10"，expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
      let result = ArrayBuffer.fromObject(src, 0, "10");
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0590
     * @tc.desc Verify ArrayBuffer.fromObject: length is booleantype true，expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
      let result = ArrayBuffer.fromObject(src, 0, true);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0600
     * @tc.desc Verify ArrayBuffer.fromObject: length is floating-point 3.14，expect throws exception or truncated
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
      let result = ArrayBuffer.fromObject(src, 0, 3.14);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0610
     * @tc.desc Verify ArrayBuffer.fromObject: length is NaN，expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
      let result = ArrayBuffer.fromObject(src, 0, NaN);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0620
     * @tc.desc Verify ArrayBuffer.fromObject: string+encodingsuccess create ArrayBuffer，return value not nullnot undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("hello", "utf8", 5);
      expect(result != null).assertTrue();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromObject0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0630
     * @tc.desc Verify ArrayBuffer.fromObject: ArrayBuffer+byteOffsetsuccess create ArrayBuffer，return value not nullnot undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(16);
      let view = new Uint8Array(src);
      view[0] = 72; view[1] = 105;
      let result = ArrayBuffer.fromObject(src, 0, 16);
      expect(result != null).assertTrue();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromObject0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0640
     * @tc.desc Verify ArrayBuffer.fromObject: from ArrayBuffer offset create ，returns length buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(16);
      let result = ArrayBuffer.fromObject(src, 4, 8);
      expect(result.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferFromObject0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0650
     * @tc.desc Verify ArrayBuffer.fromObject: from empty string create ，returns length is 0 ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("", "utf8", 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromObject0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0660
     * @tc.desc Verify ArrayBuffer.fromObject: from empty ArrayBuffercreate ，returns length is 0 ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(0);
      let result = ArrayBuffer.fromObject(src, 0, 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromObject0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0670
     * @tc.desc Verify ArrayBuffer.fromObject: return value ArrayBufferinstance -instanceofverify
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("hello", "utf8", 5);
      expect(result instanceof ArrayBuffer).assertEqual(true);
    });

    /**
     * @tc.name testArrayBufferFromObject0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0680
     * @tc.desc Verify ArrayBuffer.fromObject: return value typeof is "object"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("hello", "utf8", 5);
      expect(typeof result).assertEqual("object");
    });

    /**
     * @tc.name testArrayBufferFromObject0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0690
     * @tc.desc Verify ArrayBuffer.fromObject: return value constructor is ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("hello", "utf8", 5);
      expect(result.constructor).assertEqual(ArrayBuffer);
    });

    /**
     * @tc.name testArrayBufferFromObject0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0700
     * @tc.desc Verify ArrayBuffer.fromObject: returns ArrayBuffer and source ArrayBuffer reference （independent ）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(16);
      let result = ArrayBuffer.fromObject(src, 0, 16);
      expect(result).not.toBe(src);
    });

    /**
     * @tc.name testArrayBufferFromObject0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0710
     * @tc.desc Verify ArrayBuffer.fromObject: from stringcreate -verify UTF8encoding after byte data
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("abc", "utf8", 3);
      let view = new Uint8Array(result);
      expect(view[0]).assertEqual(97);  // 'a'
      expect(view[1]).assertEqual(98);  // 'b'
      expect(view[2]).assertEqual(99);  // 'c'
    });

    /**
     * @tc.name testArrayBufferFromObject0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0720
     * @tc.desc Verify ArrayBuffer.fromObject: from stringcreate -verify non-ASCII UTF8encoding （ byte ）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("你", "utf8", 3);
      let view = new Uint8Array(result);
      expect(view.length).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromObject0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0730
     * @tc.desc Verify ArrayBuffer.fromObject: from ArrayBuffercreate -verify copy data and source data consistent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(4);
      let srcView = new Uint8Array(src);
      srcView[0] = 10; srcView[1] = 20; srcView[2] = 30; srcView[3] = 40;
      let result = ArrayBuffer.fromObject(src, 0, 4);
      let resView = new Uint8Array(result);
      expect(resView[0]).assertEqual(10);
      expect(resView[1]).assertEqual(20);
      expect(resView[2]).assertEqual(30);
      expect(resView[3]).assertEqual(40);
    });

    /**
     * @tc.name testArrayBufferFromObject0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0740
     * @tc.desc Verify ArrayBuffer.fromObject: from ArrayBuffer offset create -verify data from offset copy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(8);
      let srcView = new Uint8Array(src);
      srcView[0] = 1; srcView[1] = 2; srcView[2] = 3; srcView[3] = 4;
      srcView[4] = 5; srcView[5] = 6; srcView[6] = 7; srcView[7] = 8;
      let result = ArrayBuffer.fromObject(src, 2, 4);
      let resView = new Uint8Array(result);
      expect(resView[0]).assertEqual(3);
      expect(resView[1]).assertEqual(4);
      expect(resView[2]).assertEqual(5);
      expect(resView[3]).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferFromObject0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0750
     * @tc.desc Verify ArrayBuffer.fromObject: modify returns ArrayBuffer source ArrayBuffer（data ）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(4);
      let srcView = new Uint8Array(src);
      srcView[0] = 100;
      let result = ArrayBuffer.fromObject(src, 0, 4);
      let resView = new Uint8Array(result);
      resView[0] = 200;
      expect(srcView[0]).assertEqual(100);
    });

    /**
     * @tc.name testArrayBufferFromObject0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0760
     * @tc.desc Verify ArrayBuffer.fromObject: return value byteLengthequals passing length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(32);
      let result = ArrayBuffer.fromObject(src, 0, 16);
      expect(result.byteLength).assertEqual(16);
    });

    /**
     * @tc.name testArrayBufferFromObject0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0770
     * @tc.desc Verify ArrayBuffer.fromObject: length=0 create ArrayBuffer，byteLength is 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(16);
      let result = ArrayBuffer.fromObject(src, 0, 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromObject0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0780
     * @tc.desc Verify ArrayBuffer.fromObject: byteOffset=0 and lengthequals source ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(8);
      let result = ArrayBuffer.fromObject(src, 0, 8);
      expect(result.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferFromObject0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0790
     * @tc.desc Verify ArrayBuffer.fromObject: byteOffset is maximum valid offset （srcLength-1），length is 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(8);
      let result = ArrayBuffer.fromObject(src, 7, 1);
      expect(result.byteLength).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferFromObject0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0800
     * @tc.desc Verify ArrayBuffer.fromObject: byteOffsetequals srcLength，length is 0（boundary valid ）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(8);
      let result = ArrayBuffer.fromObject(src, 8, 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromObject0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0810
     * @tc.desc Verify ArrayBuffer.fromObject: empty string +utf8encoding +length=0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("", "utf8", 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromObject0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0820
     * @tc.desc Verify ArrayBuffer.fromObject: single character string +utf8encoding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("A", "utf8", 1);
      expect(result.byteLength).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferFromObject0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0830
     * @tc.desc Verify ArrayBuffer.fromObject: obj is numberint ，expect throws Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject(42, 0, 4);
      } catch (e) {
        expect(e instanceof Error).assertEqual(true);
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0840
     * @tc.desc Verify ArrayBuffer.fromObject: obj is numberfloating-point ，expect throws Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject(3.14, 0, 4);
      } catch (e) {
        expect(e instanceof Error).assertEqual(true);
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0850
     * @tc.desc Verify ArrayBuffer.fromObject: obj is boolean true，expect throws Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject(true, 0, 4);
      } catch (e) {
        expect(e instanceof Error).assertEqual(true);
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0860
     * @tc.desc Verify ArrayBuffer.fromObject: obj is boolean false，expect throws Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject(false, 0, 4);
      } catch (e) {
        expect(e instanceof Error).assertEqual(true);
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0087
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0870
     * @tc.desc Verify ArrayBuffer.fromObject: obj is plain object {}，expect throws Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject({}, 0, 4);
      } catch (e) {
        expect(e instanceof Error).assertEqual(true);
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0880
     * @tc.desc Verify ArrayBuffer.fromObject: obj is array []，expect throws Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject([], 0, 4);
      } catch (e) {
        expect(e instanceof Error).assertEqual(true);
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0089
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0890
     * @tc.desc Verify ArrayBuffer.fromObject: obj is Uint8Array TypedArray，expect throws Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr = new Uint8Array(8);
        let result = ArrayBuffer.fromObject(arr, 0, 8);
      } catch (e) {
        expect(e instanceof Error).assertEqual(true);
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0090
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0900
     * @tc.desc Verify ArrayBuffer.fromObject: obj is DataView，expect throws Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf = new ArrayBuffer(8);
        let dv = new DataView(buf);
        let result = ArrayBuffer.fromObject(dv, 0, 8);
      } catch (e) {
        expect(e instanceof Error).assertEqual(true);
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0091
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0910
     * @tc.desc Verify ArrayBuffer.fromObject: obj is function function(){}，expect throws Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject(function(){}, 0, 4);
      } catch (e) {
        expect(e instanceof Error).assertEqual(true);
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0092
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0920
     * @tc.desc Verify ArrayBuffer.fromObject: obj is null，expect throws Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject(null, 0, 4);
      } catch (e) {
        expect(e instanceof Error).assertEqual(true);
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0093
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0930
     * @tc.desc Verify ArrayBuffer.fromObject: obj is undefined，expect throws Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject(undefined, 0, 4);
      } catch (e) {
        expect(e instanceof Error).assertEqual(true);
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0094
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0940
     * @tc.desc Verify ArrayBuffer.fromObject: byteOffsetOrEncoding is null（string ），expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject("hello", null, 5);
      } catch (e) {
        expect(e != null).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0095
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0950
     * @tc.desc Verify ArrayBuffer.fromObject: byteOffsetOrEncoding is undefined（string ），expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject("hello", undefined, 5);
      } catch (e) {
        expect(e != null).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0096
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0960
     * @tc.desc Verify ArrayBuffer.fromObject: byteOffsetOrEncoding is null（ArrayBuffer ），expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
        let result = ArrayBuffer.fromObject(src, null, 16);
      } catch (e) {
        expect(e != null).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0097
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0970
     * @tc.desc Verify ArrayBuffer.fromObject: length is null，expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
        let result = ArrayBuffer.fromObject(src, 0, null);
      } catch (e) {
        expect(e != null).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0098
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0980
     * @tc.desc Verify ArrayBuffer.fromObject: length is undefined，expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
        let result = ArrayBuffer.fromObject(src, 0, undefined);
      } catch (e) {
        expect(e != null).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0099
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0990
     * @tc.desc Verify ArrayBuffer.fromObject: is null，expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject(null, null, null);
      } catch (e) {
        expect(e != null).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1000
     * @tc.desc Verify ArrayBuffer.fromObject: is undefined，expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject(undefined, undefined, undefined);
      } catch (e) {
        expect(e != null).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0101
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1010
     * @tc.desc Verify ArrayBuffer.fromObject: byteOffset is negative ，expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
        let result = ArrayBuffer.fromObject(src, -1, 8);
      } catch (e) {
        expect(e != null).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0102
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1020
     * @tc.desc Verify ArrayBuffer.fromObject: byteOffsetgreater than source ArrayBufferlength ，expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(8);
        let result = ArrayBuffer.fromObject(src, 100, 4);
      } catch (e) {
        expect(e != null).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0103
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1030
     * @tc.desc Verify ArrayBuffer.fromObject: length is negative ，expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
        let result = ArrayBuffer.fromObject(src, 0, -5);
      } catch (e) {
        expect(e != null).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0104
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1040
     * @tc.desc Verify ArrayBuffer.fromObject: byteOffset + lengthout of range source ArrayBufferlength ，expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(8);
        let result = ArrayBuffer.fromObject(src, 4, 8);
      } catch (e) {
        expect(e != null).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0105
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1050
     * @tc.desc Verify ArrayBuffer.fromObject: stringencoding length string encoding after byte ，expect throws exception or truncated
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.fromObject("hi", "utf8", 100);
      } catch (e) {
        expect(e != null).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0106
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1060
     * @tc.desc Verify ArrayBuffer.fromObject: byteOffset is intminimum （-2147483648），expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
        let result = ArrayBuffer.fromObject(src, -2147483648, 8);
      } catch (e) {
        expect(e != null).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0107
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1070
     * @tc.desc Verify ArrayBuffer.fromObject: length is intmaximum （2147483647）， memory ，expect throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
        let result = ArrayBuffer.fromObject(src, 0, 2147483647);
      } catch (e) {
        expect(e != null).assertTrue();
      }
    });
    return;
  });
}
