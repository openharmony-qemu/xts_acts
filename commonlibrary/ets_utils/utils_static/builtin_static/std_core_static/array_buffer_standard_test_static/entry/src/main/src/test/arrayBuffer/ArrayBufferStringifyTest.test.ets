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

export default function arrayBufferStringifyTest(): void {
  describe('ArrayBufferStringifyTest', (): void => {
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
     * @tc.name testArrayBufferStringify0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0010
     * @tc.desc Verify ArrayBuffer.stringify: passing 4 required ，normal call ArrayBuffer.stringify()，returns decode after string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(result).assertEqual("ABC");
    });

    /**
     * @tc.name testArrayBufferStringify0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0020
     * @tc.desc Verify ArrayBuffer.stringify: calling with zero args ，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.stringify();
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0030
     * @tc.desc Verify ArrayBuffer.stringify: passing buffer ， encoding/start/end，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0040
     * @tc.desc Verify ArrayBuffer.stringify: passing buffer encoding， start/end，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8");
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0050
     * @tc.desc Verify ArrayBuffer.stringify: passing buffer、encoding、start， end，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0060
     * @tc.desc Verify ArrayBuffer.stringify: passing 5 ，verify ignored or error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength, "extra");
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0070
     * @tc.desc Verify ArrayBuffer.stringify: passing 6 ，verify ignored or error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength, "extra1", "extra2");
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0080
     * @tc.desc Verify ArrayBuffer.stringify: passing ArrayBuffer.from()create ArrayBuffer，normal decode
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("Hello", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(result).assertEqual("Hello");
    });

    /**
     * @tc.name testArrayBufferStringify0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0090
     * @tc.desc Verify ArrayBuffer.stringify: passing new ArrayBuffer()create data buffer ，normal decode
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(5);
      const view = new Uint8Array(buffer);
      view[0] = 72; view[1] = 101; view[2] = 108; view[3] = 108; view[4] = 111;
      let result = ArrayBuffer.stringify(buffer, "utf8", 0, 5);
      expect(result).assertEqual("Hello");
    });

    /**
     * @tc.name testArrayBufferStringify0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0100
     * @tc.desc Verify ArrayBuffer.stringify: passing length is 0 ArrayBuffer，start=0,end=0，returns empty string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      let result = ArrayBuffer.stringify(buffer, "utf8", 0, 0);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name testArrayBufferStringify0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0110
     * @tc.desc Verify ArrayBuffer.stringify: passing slicecreate ArrayBuffer，decode data
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      const sliced = encoded.slice(2, 5);
      let result = ArrayBuffer.stringify(sliced, "utf8", 0, sliced.byteLength);
      expect(result).assertEqual("CDE");
    });

    /**
     * @tc.name testArrayBufferStringify0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0120
     * @tc.desc Verify ArrayBuffer.stringify: passing null is buffer ，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.stringify(null, "utf8", 0, 3);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0130
     * @tc.desc Verify ArrayBuffer.stringify: passing undefined is buffer ，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.stringify(undefined, "utf8", 0, 3);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0140
     * @tc.desc Verify ArrayBuffer.stringify: passing string ArrayBuffer，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.stringify("not a buffer", "utf8", 0, 3);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0150
     * @tc.desc Verify ArrayBuffer.stringify: passing ArrayBuffer，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.stringify(123, "utf8", 0, 3);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0160
     * @tc.desc Verify ArrayBuffer.stringify: passing plain object ArrayBuffer，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.stringify({}, "utf8", 0, 3);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0170
     * @tc.desc Verify ArrayBuffer.stringify: passing Uint8Array ArrayBuffer，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(8);
      const arr = new Uint8Array(buffer);
      let result = ArrayBuffer.stringify(arr, "utf8", 0, 8);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0180
     * @tc.desc Verify ArrayBuffer.stringify: passing DataView ArrayBuffer，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      let result = ArrayBuffer.stringify(view, "utf8", 0, 8);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0190
     * @tc.desc Verify ArrayBuffer.stringify: passing "utf8" is encoding ，normal decode UTF-8encoding data
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(result).assertEqual("ABC");
    });

    /**
     * @tc.name testArrayBufferStringify0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0200
     * @tc.desc Verify ArrayBuffer.stringify: passing "utf-8" is encoding ，verify normal decode
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf-8", 0, encoded.byteLength);
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferStringify0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0210
     * @tc.desc Verify ArrayBuffer.stringify: passing empty string "" is encoding ，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "", 0, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0220
     * @tc.desc Verify ArrayBuffer.stringify: passing encoding "invalid-encoding"，verify runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "invalid-encoding", 0, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0230
     * @tc.desc Verify ArrayBuffer.stringify: passing null is encoding ，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, null, 0, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0240
     * @tc.desc Verify ArrayBuffer.stringify: passing undefined is encoding ，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, undefined, 0, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0250
     * @tc.desc Verify ArrayBuffer.stringify: passing is encoding ，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, 123, 0, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0260
     * @tc.desc Verify ArrayBuffer.stringify: passing boolean is encoding ，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, true, 0, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0270
     * @tc.desc Verify ArrayBuffer.stringify: passing object is encoding ，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, {}, 0, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0280
     * @tc.desc Verify ArrayBuffer.stringify: start=0， from buffer decode
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(result).assertEqual("ABCDEF");
    });

    /**
     * @tc.name testArrayBufferStringify0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0290
     * @tc.desc Verify ArrayBuffer.stringify: start=3， from decode ，returns string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 3, encoded.byteLength);
      expect(result).assertEqual("DEF");
    });

    /**
     * @tc.name testArrayBufferStringify0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0300
     * @tc.desc Verify ArrayBuffer.stringify: startequals end，returns empty string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 3, 3);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name testArrayBufferStringify0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0310
     * @tc.desc Verify ArrayBuffer.stringify: start=byteLength，end=byteLength，returns empty string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", encoded.byteLength, encoded.byteLength);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name testArrayBufferStringify0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0320
     * @tc.desc Verify ArrayBuffer.stringify: start is negative （ -1），verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", -1, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0330
     * @tc.desc Verify ArrayBuffer.stringify: startgreater than byteLength（ 100），verify runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 100, 100);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0340
     * @tc.desc Verify ArrayBuffer.stringify: startgreater than end（ start=5,end=2），verify runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 5, 2);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0350
     * @tc.desc Verify ArrayBuffer.stringify: passing null is start ，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", null, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0360
     * @tc.desc Verify ArrayBuffer.stringify: passing undefined is start ，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", undefined, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0370
     * @tc.desc Verify ArrayBuffer.stringify: passing string is start ，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", "0", encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0380
     * @tc.desc Verify ArrayBuffer.stringify: passing floating-point is start ，verify compile or runtime is
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 1.5, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0390
     * @tc.desc Verify ArrayBuffer.stringify: passing NaN is start ，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", NaN, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0400
     * @tc.desc Verify ArrayBuffer.stringify: passing Infinity is start ，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", Infinity, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0410
     * @tc.desc Verify ArrayBuffer.stringify: end=byteLength，decode from start to data
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(result).assertEqual("ABCDEF");
    });

    /**
     * @tc.name testArrayBufferStringify0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0420
     * @tc.desc Verify ArrayBuffer.stringify: end=3，decode before 3 byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, 3);
      expect(result).assertEqual("ABC");
    });

    /**
     * @tc.name testArrayBufferStringify0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0430
     * @tc.desc Verify ArrayBuffer.stringify: endequals start（ end=2,start=2），returns empty string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 2, 2);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name testArrayBufferStringify0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0440
     * @tc.desc Verify ArrayBuffer.stringify: end=0，start=0，returns empty string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, 0);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name testArrayBufferStringify0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0450
     * @tc.desc Verify ArrayBuffer.stringify: end is negative （ -1），verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, -1);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0460
     * @tc.desc Verify ArrayBuffer.stringify: endgreater than byteLength（ 100），verify runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, 100);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0470
     * @tc.desc Verify ArrayBuffer.stringify: passing null is end ，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, null);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0480
     * @tc.desc Verify ArrayBuffer.stringify: passing undefined is end ，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, undefined);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0490
     * @tc.desc Verify ArrayBuffer.stringify: passing string is end ，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, "3");
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0500
     * @tc.desc Verify ArrayBuffer.stringify: passing floating-point is end ，verify compile or runtime is
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, 2.7);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0510
     * @tc.desc Verify ArrayBuffer.stringify: passing NaN is end ，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, NaN);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0520
     * @tc.desc Verify ArrayBuffer.stringify: passing Infinity is end ，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, Infinity);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0530
     * @tc.desc Verify ArrayBuffer.stringify: endless than start（ end=1,start=3），verify runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 3, 1);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0540
     * @tc.desc Verify ArrayBuffer.stringify: decode ASCIIstring ，verify return value and string consistent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(result).assertEqual("ABC");
    });

    /**
     * @tc.name testArrayBufferStringify0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0550
     * @tc.desc Verify ArrayBuffer.stringify: decode string ，verify return value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "Hello World! This is a test string.";
      const encoded = ArrayBuffer.from(text, "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(result).assertEqual(text);
    });

    /**
     * @tc.name testArrayBufferStringify0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0560
     * @tc.desc Verify ArrayBuffer.stringify: from decode ，verify returns string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 3, 6);
      expect(result).assertEqual("DEF");
    });

    /**
     * @tc.name testArrayBufferStringify0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0570
     * @tc.desc Verify ArrayBuffer.stringify: from decode to ，verify returns string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, 3);
      expect(result).assertEqual("ABC");
    });

    /**
     * @tc.name testArrayBufferStringify0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0580
     * @tc.desc Verify ArrayBuffer.stringify: start end is ，decode
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 2, 5);
      expect(result).assertEqual("CDE");
    });

    /**
     * @tc.name testArrayBufferStringify0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0590
     * @tc.desc Verify ArrayBuffer.stringify: start=0,end=1，decode byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("A", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, 1);
      expect(result).assertEqual("A");
    });

    /**
     * @tc.name testArrayBufferStringify0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0600
     * @tc.desc Verify ArrayBuffer.stringify: decode UTF-8encoding non-ASCII ，verify byte decode
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("你好", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(result).assertEqual("你好");
    });

    /**
     * @tc.name testArrayBufferStringify0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0610
     * @tc.desc Verify ArrayBuffer.stringify: decode ASCII non-ASCII string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("Hello你好", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(result).assertEqual("Hello你好");
    });

    /**
     * @tc.name testArrayBufferStringify0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0620
     * @tc.desc Verify ArrayBuffer.stringify: decode special characters （ 、 ） string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("A\nB\tC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(result).assertEqual("A\nB\tC");
    });

    /**
     * @tc.name testArrayBufferStringify0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0630
     * @tc.desc Verify ArrayBuffer.stringify: decode empty string ，verify empty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("A B C", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(result).assertEqual("A B C");
    });

    /**
     * @tc.name testArrayBufferStringify0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0640
     * @tc.desc Verify ArrayBuffer.stringify: decode empty string ArrayBuffer，returns empty string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, 0);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name testArrayBufferStringify0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0650
     * @tc.desc Verify ArrayBuffer.stringify: typeofverify return value type is string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.name testArrayBufferStringify0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0660
     * @tc.desc Verify ArrayBuffer.stringify: verify normal call return value is null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(result != null).assertTrue();
    });

    /**
     * @tc.name testArrayBufferStringify0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0670
     * @tc.desc Verify ArrayBuffer.stringify: verify normal call return value is undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(result != undefined).assertTrue();
    });

    /**
     * @tc.name testArrayBufferStringify0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0680
     * @tc.desc Verify ArrayBuffer.stringify: verify return value numbertype
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("123", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(typeof result !== "number").assertTrue();
    });

    /**
     * @tc.name testArrayBufferStringify0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0690
     * @tc.desc Verify ArrayBuffer.stringify: verify return value objecttype
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(typeof result !== "object").assertTrue();
    });

    /**
     * @tc.name testArrayBufferStringify0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0700
     * @tc.desc Verify ArrayBuffer.stringify: ArrayBuffermultiple call stringify，return value consistent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABC", "utf8");
      let result1 = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      let result2 = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(result1 === result2).assertTrue();
    });

    /**
     * @tc.name testArrayBufferStringify0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0710
     * @tc.desc Verify ArrayBuffer.stringify: ArrayBuffer.from()encoding after stringify()decode ， is string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = "ABC";
      const encoded = ArrayBuffer.from(original, "utf8");
      let decoded = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(decoded).assertEqual(original);
    });

    /**
     * @tc.name testArrayBufferStringify0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0720
     * @tc.desc Verify ArrayBuffer.stringify: non-ASCII encoding after decode ， is string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = "你好世界";
      const encoded = ArrayBuffer.from(original, "utf8");
      let decoded = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(decoded).assertEqual(original);
    });

    /**
     * @tc.name testArrayBufferStringify0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0730
     * @tc.desc Verify ArrayBuffer.stringify: empty string encoding after decode ， is empty string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = "";
      const encoded = ArrayBuffer.from(original, "utf8");
      let decoded = ArrayBuffer.stringify(encoded, "utf8", 0, 0);
      expect(decoded).assertEqual(original);
    });

    /**
     * @tc.name testArrayBufferStringify0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0740
     * @tc.desc Verify ArrayBuffer.stringify: special characters encoding after decode ， is string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = "Hello\nWorld\t!";
      const encoded = ArrayBuffer.from(original, "utf8");
      let decoded = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(decoded).assertEqual(original);
    });

    /**
     * @tc.name testArrayBufferStringify0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0750
     * @tc.desc Verify ArrayBuffer.stringify: encoding after decode ， is string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = "1234567890";
      const encoded = ArrayBuffer.from(original, "utf8");
      let decoded = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(decoded).assertEqual(original);
    });

    /**
     * @tc.name testArrayBufferStringify0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0760
     * @tc.desc Verify ArrayBuffer.stringify: ASCII、non-ASCII 、 、 encoding after decode
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = "Test123测试!@#";
      const encoded = ArrayBuffer.from(original, "utf8");
      let decoded = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(decoded).assertEqual(original);
    });

    /**
     * @tc.name testArrayBufferStringify0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0770
     * @tc.desc Verify ArrayBuffer.stringify: decode before ， decode after ， after equals string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = "ABCDEF";
      const encoded = ArrayBuffer.from(original, "utf8");
      let first = ArrayBuffer.stringify(encoded, "utf8", 0, 3);
      let second = ArrayBuffer.stringify(encoded, "utf8", 3, encoded.byteLength);
      expect(first + second).assertEqual(original);
    });

    /**
     * @tc.name testArrayBufferStringify0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0780
     * @tc.desc Verify ArrayBuffer.stringify: decode after verify string length and encoding before consistent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = "ABCDEF";
      const encoded = ArrayBuffer.from(original, "utf8");
      let decoded = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(decoded.length).assertEqual(original.length);
    });

    /**
     * @tc.name testArrayBufferStringify0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0790
     * @tc.desc Verify ArrayBuffer.stringify: byte decode ASCII ， byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABC", "utf8");
      let a = ArrayBuffer.stringify(encoded, "utf8", 0, 1);
      let b = ArrayBuffer.stringify(encoded, "utf8", 1, 2);
      let c = ArrayBuffer.stringify(encoded, "utf8", 2, 3);
      expect(a).assertEqual("A");
      expect(b).assertEqual("B");
      expect(c).assertEqual("C");
    });

    /**
     * @tc.name testArrayBufferStringify0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0800
     * @tc.desc Verify ArrayBuffer.stringify: start=0,end=byteLength，decode buffer data
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(result).assertEqual("ABCDEF");
    });

    /**
     * @tc.name testArrayBufferStringify0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0810
     * @tc.desc Verify ArrayBuffer.stringify: startequals end，returns empty string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 3, 3);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name testArrayBufferStringify0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0820
     * @tc.desc Verify ArrayBuffer.stringify: start=0,end=0，returns empty string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, 0);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name testArrayBufferStringify0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0830
     * @tc.desc Verify ArrayBuffer.stringify: start=byteLength,end=byteLength，returns empty string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", encoded.byteLength, encoded.byteLength);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name testArrayBufferStringify0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0840
     * @tc.desc Verify ArrayBuffer.stringify: start=0,end=1， decode byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, 1);
      expect(result).assertEqual("A");
    });

    /**
     * @tc.name testArrayBufferStringify0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0850
     * @tc.desc Verify ArrayBuffer.stringify: decode after byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", encoded.byteLength - 1, encoded.byteLength);
      expect(result).assertEqual("F");
    });

    /**
     * @tc.name testArrayBufferStringify0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0860
     * @tc.desc Verify ArrayBuffer.stringify: length is 1 ArrayBuffer decode
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("X", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, 1);
      expect(result).assertEqual("X");
    });

    /**
     * @tc.name testArrayBufferStringify0087
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0870
     * @tc.desc Verify ArrayBuffer.stringify: length is 0 ArrayBuffer，start=0,end=0，returns empty string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      let result = ArrayBuffer.stringify(buffer, "utf8", 0, 0);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name testArrayBufferStringify0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0880
     * @tc.desc Verify ArrayBuffer.stringify: decode buffer （1024byte ），verify decode
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr = "";
      for (let i: int = 0; i < 1024; i++) {
        longStr += "A";
      }
      const encoded = ArrayBuffer.from(longStr, "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(result.length).assertEqual(1024);
    });

    /**
     * @tc.name testArrayBufferStringify0089
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0890
     * @tc.desc Verify ArrayBuffer.stringify: UTF-8 byte （non-ASCII ）， at boundary decode
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("你好", "utf8");
      let charLen = encoded.byteLength / 2;
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, charLen);
      expect(result).assertEqual("你");
    });

    /**
     * @tc.name testArrayBufferStringify0090
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0900
     * @tc.desc Verify ArrayBuffer.stringify: passing 4 null ，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.stringify(null, null, null, null);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0091
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0910
     * @tc.desc Verify ArrayBuffer.stringify: passing 4 undefined ，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.stringify(undefined, undefined, undefined, undefined);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0092
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0920
     * @tc.desc Verify ArrayBuffer.stringify: buffer is null， is ，verify runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.stringify(null, "utf8", 0, 3);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0093
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0930
     * @tc.desc Verify ArrayBuffer.stringify: buffer is undefined， is ，verify runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.stringify(undefined, "utf8", 0, 3);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0094
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0940
     * @tc.desc Verify ArrayBuffer.stringify: encoding is null， is ，verify runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, null, 0, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0095
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0950
     * @tc.desc Verify ArrayBuffer.stringify: encoding is undefined， is ，verify runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, undefined, 0, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0096
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0960
     * @tc.desc Verify ArrayBuffer.stringify: start is null， is ，verify runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", null, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0097
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0970
     * @tc.desc Verify ArrayBuffer.stringify: start is undefined， is ，verify runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", undefined, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0098
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0980
     * @tc.desc Verify ArrayBuffer.stringify: end is null， is ，verify runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, null);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0099
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0990
     * @tc.desc Verify ArrayBuffer.stringify: end is undefined， is ，verify runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, undefined);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1000
     * @tc.desc Verify ArrayBuffer.stringify: start=5,end=2， greater than ，verify runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 5, 2);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0101
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1010
     * @tc.desc Verify ArrayBuffer.stringify: start=10,end=0， greater than ，verify runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 10, 0);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0102
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1020
     * @tc.desc Verify ArrayBuffer.stringify: start=2,end=-1，verify runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 2, -1);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0103
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1030
     * @tc.desc Verify ArrayBuffer.stringify: start=100out of range bufferlength ，verify runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 100, 100);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0104
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1040
     * @tc.desc Verify ArrayBuffer.stringify: end=100out of range bufferlength ，verify runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, 100);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0105
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1050
     * @tc.desc Verify ArrayBuffer.stringify: start end out of range bufferlength ，verify runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 100, 200);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0106
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1060
     * @tc.desc Verify ArrayBuffer.stringify: start=0 end=100out of range ，verify runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, 100);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0107
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1070
     * @tc.desc Verify ArrayBuffer.stringify: start=byteLength endout of range ，verify runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", encoded.byteLength, 100);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0108
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1080
     * @tc.desc Verify ArrayBuffer.stringify: passing encoding "unknown-encoding"，verify runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "unknown-encoding", 0, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0109
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1090
     * @tc.desc Verify ArrayBuffer.stringify: encoding=""，verify runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "", 0, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0110
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1100
     * @tc.desc Verify ArrayBuffer.stringify: passing "UTF8"（ ），verify or error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "UTF8", 0, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0111
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1110
     * @tc.desc Verify ArrayBuffer.stringify: passing " utf8 "（ empty ），verify or error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, " utf8 ", 0, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0112
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1120
     * @tc.desc Verify ArrayBuffer.stringify: passing "xyz123" is encoding ，verify runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "xyz123", 0, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0113
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1130
     * @tc.desc Verify ArrayBuffer.stringify: bufferpassing ，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.stringify(12345, "utf8", 0, 3);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0114
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1140
     * @tc.desc Verify ArrayBuffer.stringify: bufferpassing boolean ，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.stringify(true, "utf8", 0, 3);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0115
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1150
     * @tc.desc Verify ArrayBuffer.stringify: bufferpassing string ，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.stringify("not a buffer", "utf8", 0, 3);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0116
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1160
     * @tc.desc Verify ArrayBuffer.stringify: encodingpassing ，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, 65, 0, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0117
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1170
     * @tc.desc Verify ArrayBuffer.stringify: encodingpassing boolean ，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, true, 0, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0118
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1180
     * @tc.desc Verify ArrayBuffer.stringify: startpassing string "0"，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", "0", encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0119
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1190
     * @tc.desc Verify ArrayBuffer.stringify: startpassing boolean ，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", true, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0120
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1200
     * @tc.desc Verify ArrayBuffer.stringify: endpassing string "3"，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, "3");
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0121
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1210
     * @tc.desc Verify ArrayBuffer.stringify: endpassing boolean ，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, false);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0122
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1220
     * @tc.desc Verify ArrayBuffer.stringify: startpassing object ，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", {}, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0123
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1230
     * @tc.desc Verify ArrayBuffer.stringify: endpassing object ，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, {});
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0124
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1240
     * @tc.desc Verify ArrayBuffer.stringify: passing type ，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.stringify("buffer", 123, "start", true);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0125
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1250
     * @tc.desc Verify ArrayBuffer.stringify: start=-1，verify runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", -1, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0126
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1260
     * @tc.desc Verify ArrayBuffer.stringify: end=-1，verify runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, -1);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0127
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1270
     * @tc.desc Verify ArrayBuffer.stringify: start=-3,end=-1，verify runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", -3, -1);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0128
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1280
     * @tc.desc Verify ArrayBuffer.stringify: start=-100，verify runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", -100, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0129
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1290
     * @tc.desc Verify ArrayBuffer.stringify: end=-100，verify runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, -100);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0130
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1300
     * @tc.desc Verify ArrayBuffer.stringify: start=NaN，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", NaN, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0131
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1310
     * @tc.desc Verify ArrayBuffer.stringify: end=NaN，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, NaN);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0132
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1320
     * @tc.desc Verify ArrayBuffer.stringify: start=Infinity，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", Infinity, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0133
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1330
     * @tc.desc Verify ArrayBuffer.stringify: end=Infinity，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, Infinity);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0134
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1340
     * @tc.desc Verify ArrayBuffer.stringify: start=-Infinity，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", -Infinity, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0135
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1350
     * @tc.desc Verify ArrayBuffer.stringify: end=-Infinity，verify compile or runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, -Infinity);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0136
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1360
     * @tc.desc Verify ArrayBuffer.stringify: start=1.5，verify compile or runtime is
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 1.5, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0137
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1370
     * @tc.desc Verify ArrayBuffer.stringify: end=2.7，verify compile or runtime is
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, 2.7);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0138
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1380
     * @tc.desc Verify ArrayBuffer.stringify: start is maximum ，verify runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", Number.MAX_SAFE_INTEGER, Number.MAX_SAFE_INTEGER);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0139
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1390
     * @tc.desc Verify ArrayBuffer.stringify: start is minimum （negative ），verify runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", Number.MIN_SAFE_INTEGER, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0140
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1400
     * @tc.desc Verify ArrayBuffer.stringify: detach ArrayBuffercall stringify，verify runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
      encoded.detach();
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferStringify0141
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1410
     * @tc.desc Verify ArrayBuffer.stringify: resizable ArrayBuffercall stringify，verify normal decode
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 16);
      const view = new Uint8Array(buffer);
      view[0] = 65; view[1] = 66; view[2] = 67;
      let result = ArrayBuffer.stringify(buffer, "utf8", 0, 3);
      expect(result).assertEqual("ABC");
    });

    /**
     * @tc.name testArrayBufferStringify0142
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1420
     * @tc.desc Verify ArrayBuffer.stringify: resize after call stringify，verify length decode
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(6, 16);
      const view = new Uint8Array(buffer);
      view[0] = 65; view[1] = 66; view[2] = 67; view[3] = 68; view[4] = 69; view[5] = 70;
      buffer.resize(3);
      let result = ArrayBuffer.stringify(buffer, "utf8", 0, buffer.byteLength);
      expect(result).assertEqual("ABC");
    });
    return;
  });
}
