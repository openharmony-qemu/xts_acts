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

export default function arrayBufferStringifyTest(): void {
  describe('ArrayBufferStringifyTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });







    /**
     * @tc.name testArrayBufferStringify0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0010
     * @tc.desc Verify ArrayBuffer.stringify returns "ABC"
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
     * @tc.desc Verify ArrayBuffer.stringify returns "Hello"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("Hello", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(result).assertEqual("Hello");
    });

    /**
     * @tc.name testArrayBufferStringify0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0030
     * @tc.desc Verify ArrayBuffer.stringify returns "Hello"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(5);
      const view = new Uint8Array(buffer);
      view[0] = 72; view[1] = 101; view[2] = 108; view[3] = 108; view[4] = 111;
      let result = ArrayBuffer.stringify(buffer, "utf8", 0, 5);
      expect(result).assertEqual("Hello");
    });

    /**
     * @tc.name testArrayBufferStringify0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0040
     * @tc.desc Verify ArrayBuffer.stringify returns ""
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      let result = ArrayBuffer.stringify(buffer, "utf8", 0, 0);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name testArrayBufferStringify0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0050
     * @tc.desc Verify ArrayBuffer.stringify returns "CDE"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      const sliced = encoded.slice(2, 5);
      let result = ArrayBuffer.stringify(sliced, "utf8", 0, sliced.byteLength);
      expect(result).assertEqual("CDE");
    });

    /**
     * @tc.name testArrayBufferStringify0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0060
     * @tc.desc Verify ArrayBuffer.stringify(Utils.castToArrayBuffer(Utils.nullAsObject()), "utf8", 0, 3) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.stringify(Utils.castToArrayBuffer(Utils.nullAsObject()), "utf8", 0, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0070
     * @tc.desc Verify ArrayBuffer.stringify(Utils.castToArrayBuffer(Utils.undefinedAsObject()), "utf8", 0, 3) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.stringify(Utils.castToArrayBuffer(Utils.undefinedAsObject()), "utf8", 0, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0080
     * @tc.desc Verify ArrayBuffer.stringify(Utils.castToArrayBuffer("not a buffer" as Object), "utf8", 0, 3) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.stringify(Utils.castToArrayBuffer("not a buffer" as Object), "utf8", 0, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0090
     * @tc.desc Verify ArrayBuffer.stringify(Utils.numberAsArrayBuffer(n), "utf8", 0, 3) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const n: number = 123;
        ArrayBuffer.stringify(Utils.numberAsArrayBuffer(n), "utf8", 0, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0100
     * @tc.desc Verify ArrayBuffer.stringify(Utils.castToArrayBuffer(Utils.plainObject()), "utf8", 0, 3) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.stringify(Utils.castToArrayBuffer(Utils.plainObject()), "utf8", 0, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0110
     * @tc.desc Verify ArrayBuffer.stringify(Utils.castToArrayBuffer(Utils.uint8ArrayAsObject(arr)), "utf8", 0, 8) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(8);
        const arr = new Uint8Array(buffer);
        ArrayBuffer.stringify(Utils.castToArrayBuffer(Utils.uint8ArrayAsObject(arr)), "utf8", 0, 8);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0120
     * @tc.desc Verify ArrayBuffer.stringify(Utils.castToArrayBuffer(Utils.dataViewAsObject(view)), "utf8", 0, 8) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(8);
        const view = new DataView(buffer);
        ArrayBuffer.stringify(Utils.castToArrayBuffer(Utils.dataViewAsObject(view)), "utf8", 0, 8);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0130
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "utf-8", 0, encoded.byteLength) returns "ABC"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf-8", 0, encoded.byteLength);
      expect(result).assertEqual("ABC");
    });

    /**
     * @tc.name testArrayBufferStringify0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0140
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "", 0, encoded.byteLength) throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, "", 0, encoded.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0150
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "invalid-encoding", 0, encoded.byteLength) throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, "invalid-encoding", 0, encoded.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0160
     * @tc.desc Verify ArrayBuffer.stringify(encoded, Utils.nullAsString(), 0, encoded.byteLength) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, Utils.nullAsString(), 0, encoded.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0170
     * @tc.desc Verify ArrayBuffer.stringify(encoded, Utils.undefinedAsString(), 0, encoded.byteLength) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, Utils.undefinedAsString(), 0, encoded.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0180
     * @tc.desc Verify ArrayBuffer.stringify(encoded, Utils.numberAsString(encNum), 0, encoded.byteLength) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        const encNum: number = 123;
        ArrayBuffer.stringify(encoded, Utils.numberAsString(encNum), 0, encoded.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0190
     * @tc.desc Verify ArrayBuffer.stringify(encoded, Utils.booleanAsString(true), 0, encoded.byteLength) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, Utils.booleanAsString(true), 0, encoded.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0200
     * @tc.desc Verify ArrayBuffer.stringify(encoded, Utils.castToString({} as Object), 0, encoded.byteLength) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, Utils.castToString({} as Object), 0, encoded.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0210
     * @tc.desc Verify ArrayBuffer.stringify returns "ABCDEF"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(result).assertEqual("ABCDEF");
    });

    /**
     * @tc.name testArrayBufferStringify0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0220
     * @tc.desc Verify ArrayBuffer.stringify returns "DEF"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 3, encoded.byteLength);
      expect(result).assertEqual("DEF");
    });

    /**
     * @tc.name testArrayBufferStringify0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0230
     * @tc.desc Verify ArrayBuffer.stringify returns ""
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 3, 3);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name testArrayBufferStringify0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0240
     * @tc.desc Verify ArrayBuffer.stringify returns ""
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", encoded.byteLength, encoded.byteLength);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name testArrayBufferStringify0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0250
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "utf8", -1, encoded.byteLength) throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, "utf8", -1, encoded.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0260
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "utf8", 100, 100) throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, "utf8", 100, 100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0270
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "utf8", 5, 2) throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABCDEF", "utf8");
        ArrayBuffer.stringify(encoded, "utf8", 5, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0280
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "utf8", Utils.nullAsInt(), encoded.byteLength) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, "utf8", Utils.nullAsInt(), encoded.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0290
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "utf8", Utils.undefinedAsInt(), encoded.byteLength) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, "utf8", Utils.undefinedAsInt(), encoded.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0300
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "utf8", Utils.stringAsInt("0"), encoded.byteLength) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, "utf8", Utils.stringAsInt("0"), encoded.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0310
     * @tc.desc Verify ArrayBuffer.stringify returns "BCDEF"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", (Double.toInt(1.5)), encoded.byteLength);
      expect(result).assertEqual("BCDEF");
    });

    /**
     * @tc.name testArrayBufferStringify0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0320
     * @tc.desc Verify Double.toInt(Double.NaN) as start coerces to 0 and stringify returns "ABC" (STA NaN→0)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", (Double.toInt(Double.NaN)), encoded.byteLength);
      expect(result).assertEqual("ABC");
    });

    /**
     * @tc.name testArrayBufferStringify0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0330
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "utf8", (Double.toInt(Double.POSITIVE_INFINITY)), encoded.byteLength) throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, "utf8", (Double.toInt(Double.POSITIVE_INFINITY)), encoded.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0340
     * @tc.desc Verify ArrayBuffer.stringify returns ""
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 2, 2);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name testArrayBufferStringify0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0350
     * @tc.desc Verify ArrayBuffer.stringify returns ""
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, 0);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name testArrayBufferStringify0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0360
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "utf8", 0, -1) throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABCDEF", "utf8");
        ArrayBuffer.stringify(encoded, "utf8", 0, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0370
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "utf8", 0, 100) throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, "utf8", 0, 100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0380
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "utf8", 0, Utils.nullAsInt()) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, "utf8", 0, Utils.nullAsInt());
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0390
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "utf8", 0, Utils.undefinedAsInt()) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, "utf8", 0, Utils.undefinedAsInt());
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0400
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "utf8", 0, Utils.stringAsInt("3")) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, "utf8", 0, Utils.stringAsInt("3"));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0410
     * @tc.desc Verify ArrayBuffer.stringify returns "AB"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, (Double.toInt(2.7)));
      expect(result).assertEqual("AB");
    });

    /**
     * @tc.name testArrayBufferStringify0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0420
     * @tc.desc Verify ArrayBuffer.stringify returns ""
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, (Double.toInt(Double.NaN)));
      expect(result).assertEqual("");
    });

    /**
     * @tc.name testArrayBufferStringify0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0430
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "utf8", 0, (Double.toInt(Double.POSITIVE_INFINITY))) throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, "utf8", 0, (Double.toInt(Double.POSITIVE_INFINITY)));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0440
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "utf8", 3, 1) throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABCDEF", "utf8");
        ArrayBuffer.stringify(encoded, "utf8", 3, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0450
     * @tc.desc Verify result equals text
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "Hello World! This is a test string.";
      const encoded = ArrayBuffer.from(text, "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(result).assertEqual(text);
    });

    /**
     * @tc.name testArrayBufferStringify0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0460
     * @tc.desc Verify ArrayBuffer.stringify returns "DEF"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 3, 6);
      expect(result).assertEqual("DEF");
    });

    /**
     * @tc.name testArrayBufferStringify0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0470
     * @tc.desc Verify ArrayBuffer.stringify returns "CDE"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 2, 5);
      expect(result).assertEqual("CDE");
    });

    /**
     * @tc.name testArrayBufferStringify0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0480
     * @tc.desc Verify ArrayBuffer.stringify returns "A"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("A", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, 1);
      expect(result).assertEqual("A");
    });

    /**
     * @tc.name testArrayBufferStringify0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0490
     * @tc.desc Verify result equals decoded Chinese text
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("你好", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(result).assertEqual("你好");
    });

    /**
     * @tc.name testArrayBufferStringify0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0500
     * @tc.desc Verify result equals decoded mixed text
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("Hello你好", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(result).assertEqual("Hello你好");
    });

    /**
     * @tc.name testArrayBufferStringify0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0510
     * @tc.desc Verify ArrayBuffer.stringify returns "A\nB\tC"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("A\nB\tC", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(result).assertEqual("A\nB\tC");
    });

    /**
     * @tc.name testArrayBufferStringify0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0520
     * @tc.desc Verify ArrayBuffer.stringify returns "A B C"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("A B C", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(result).assertEqual("A B C");
    });

    /**
     * @tc.name testArrayBufferStringify0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0530
     * @tc.desc Verify ArrayBuffer.stringify returns ""
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, 0);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name testArrayBufferStringify0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0540
     * @tc.desc Verify ArrayBuffer.stringify returns original
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = "ABC";
      const encoded = ArrayBuffer.from(original, "utf8");
      let decoded = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(decoded).assertEqual(original);
    });

    /**
     * @tc.name testArrayBufferStringify0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0550
     * @tc.desc Verify ArrayBuffer.stringify returns original
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = "你好世界";
      const encoded = ArrayBuffer.from(original, "utf8");
      let decoded = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(decoded).assertEqual(original);
    });

    /**
     * @tc.name testArrayBufferStringify0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0560
     * @tc.desc Verify ArrayBuffer.stringify returns original
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = "";
      const encoded = ArrayBuffer.from(original, "utf8");
      let decoded = ArrayBuffer.stringify(encoded, "utf8", 0, 0);
      expect(decoded).assertEqual(original);
    });

    /**
     * @tc.name testArrayBufferStringify0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0570
     * @tc.desc Verify ArrayBuffer.stringify returns original
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = "Hello\nWorld\t!";
      const encoded = ArrayBuffer.from(original, "utf8");
      let decoded = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(decoded).assertEqual(original);
    });

    /**
     * @tc.name testArrayBufferStringify0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0580
     * @tc.desc Verify ArrayBuffer.stringify returns original
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = "1234567890";
      const encoded = ArrayBuffer.from(original, "utf8");
      let decoded = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(decoded).assertEqual(original);
    });

    /**
     * @tc.name testArrayBufferStringify0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0590
     * @tc.desc Verify ArrayBuffer.stringify returns original
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = "Test123测试!@#";
      const encoded = ArrayBuffer.from(original, "utf8");
      let decoded = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(decoded).assertEqual(original);
    });

    /**
     * @tc.name testArrayBufferStringify0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0600
     * @tc.desc Verify ArrayBuffer.stringify returns original
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = "ABCDEF";
      const encoded = ArrayBuffer.from(original, "utf8");
      let first = ArrayBuffer.stringify(encoded, "utf8", 0, 3);
      let second = ArrayBuffer.stringify(encoded, "utf8", 3, encoded.byteLength);
      expect(first + second).assertEqual(original);
    });

    /**
     * @tc.name testArrayBufferStringify0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0610
     * @tc.desc Verify ArrayBuffer.stringify returns original.length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = "ABCDEF";
      const encoded = ArrayBuffer.from(original, "utf8");
      let decoded = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(decoded.length).assertEqual(original.length);
    });

    /**
     * @tc.name testArrayBufferStringify0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0620
     * @tc.desc Verify ArrayBuffer.stringify returns "A"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABC", "utf8");
      let a = ArrayBuffer.stringify(encoded, "utf8", 0, 1);
      let b = ArrayBuffer.stringify(encoded, "utf8", 1, 2);
      let c = ArrayBuffer.stringify(encoded, "utf8", 2, 3);
      expect(a).assertEqual("A");
      expect(b).assertEqual("B");
      expect(c).assertEqual("C");
    });

    /**
     * @tc.name testArrayBufferStringify0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0630
     * @tc.desc Verify ArrayBuffer.stringify returns ""
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", encoded.byteLength, encoded.byteLength);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name testArrayBufferStringify0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0640
     * @tc.desc Verify ArrayBuffer.stringify returns "A"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, 1);
      expect(result).assertEqual("A");
    });

    /**
     * @tc.name testArrayBufferStringify0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0650
     * @tc.desc Verify ArrayBuffer.stringify returns "F"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("ABCDEF", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", encoded.byteLength - 1, encoded.byteLength);
      expect(result).assertEqual("F");
    });

    /**
     * @tc.name testArrayBufferStringify0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0660
     * @tc.desc Verify ArrayBuffer.stringify returns "X"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("X", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, 1);
      expect(result).assertEqual("X");
    });

    /**
     * @tc.name testArrayBufferStringify0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0670
     * @tc.desc Verify stringify decodes full 1024-byte UTF-8 payload to original long string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr = Utils.buildLongString("A", 1000) + Utils.repeatString("A", 24);
      const encoded = ArrayBuffer.from(longStr, "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, encoded.byteLength);
      expect(result.length).assertEqual(1024);
      expect(result).assertEqual(longStr);
    });

    /**
     * @tc.name testArrayBufferStringify0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0680
     * @tc.desc Verify result equals decoded Chinese text
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const encoded = ArrayBuffer.from("你好", "utf8");
      let result = ArrayBuffer.stringify(encoded, "utf8", 0, 3);
      expect(result).assertEqual("你");
    });

    /**
     * @tc.name testArrayBufferStringify0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0690
     * @tc.desc Verify ArrayBuffer.stringify(Utils.castToArrayBuffer(Utils.nullAsObject()), Utils.nullAsString(), Utils.nullAsInt(), Utils.n... throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.stringify(Utils.castToArrayBuffer(Utils.nullAsObject()), Utils.nullAsString(), Utils.nullAsInt(), Utils.nullAsInt());
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0700
     * @tc.desc Verify ArrayBuffer.stringify(Utils.castToArrayBuffer(Utils.undefinedAsObject()), Utils.undefinedAsString(), Utils.undefinedA... throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.stringify(Utils.castToArrayBuffer(Utils.undefinedAsObject()), Utils.undefinedAsString(), Utils.undefinedAsInt(), Utils.undefinedAsInt());
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0710
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "utf8", 10, 0) throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABCDEF", "utf8");
        ArrayBuffer.stringify(encoded, "utf8", 10, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0720
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "utf8", 2, -1) throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABCDEF", "utf8");
        ArrayBuffer.stringify(encoded, "utf8", 2, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0730
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "utf8", 100, 200) throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, "utf8", 100, 200);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0740
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "utf8", encoded.byteLength, 100) throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, "utf8", encoded.byteLength, 100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0750
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "unknown-encoding", 0, encoded.byteLength) throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, "unknown-encoding", 0, encoded.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0760
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "UTF8", 0, encoded.byteLength) throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, "UTF8", 0, encoded.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0770
     * @tc.desc Verify ArrayBuffer.stringify(encoded, " utf8 ", 0, encoded.byteLength) throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, " utf8 ", 0, encoded.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0780
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "xyz123", 0, encoded.byteLength) throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, "xyz123", 0, encoded.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0790
     * @tc.desc Verify ArrayBuffer.stringify(Utils.numberAsArrayBuffer(n), "utf8", 0, 3) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const n: number = 12345;
        ArrayBuffer.stringify(Utils.numberAsArrayBuffer(n), "utf8", 0, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0800
     * @tc.desc Verify ArrayBuffer.stringify(Utils.castToArrayBuffer(Utils.booleanAsObject(true)), "utf8", 0, 3) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.stringify(Utils.castToArrayBuffer(Utils.booleanAsObject(true)), "utf8", 0, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0810
     * @tc.desc Verify ArrayBuffer.stringify(encoded, Utils.numberAsString(encNum), 0, encoded.byteLength) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        const encNum: number = 65;
        ArrayBuffer.stringify(encoded, Utils.numberAsString(encNum), 0, encoded.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0820
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "utf8", Utils.booleanAsInt(true), encoded.byteLength) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, "utf8", Utils.booleanAsInt(true), encoded.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0830
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "utf8", 0, Utils.booleanAsInt(false)) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, "utf8", 0, Utils.booleanAsInt(false));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0840
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "utf8", Utils.castToInt({} as Object), encoded.byteLength) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, "utf8", Utils.castToInt({} as Object), encoded.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0850
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "utf8", 0, Utils.castToInt({} as Object)) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, "utf8", 0, Utils.castToInt({} as Object));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0860
     * @tc.desc Verify ArrayBuffer.stringify(Utils.castToArrayBuffer("buffer" as Object), Utils.numberAsString(badEnc), Utils.stringAsInt("s... throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const badEnc: number = 123;
        ArrayBuffer.stringify(Utils.castToArrayBuffer("buffer" as Object), Utils.numberAsString(badEnc),
        Utils.stringAsInt("start"), Utils.booleanAsInt(true));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0087
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0870
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "utf8", -3, -1) throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, "utf8", -3, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0880
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "utf8", -100, encoded.byteLength) throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, "utf8", -100, encoded.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0089
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0890
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "utf8", 0, -100) throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, "utf8", 0, -100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0090
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0900
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "utf8", (Double.toInt(Double.NEGATIVE_INFINITY)), encoded.byteLength) throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, "utf8", (Double.toInt(Double.NEGATIVE_INFINITY)), encoded.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0091
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0910
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "utf8", 0, (Double.toInt(Double.NEGATIVE_INFINITY))) throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, "utf8", 0, (Double.toInt(Double.NEGATIVE_INFINITY)));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0092
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0920
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "utf8", Double.toInt(Number.MAX_SAFE_INTEGER), Double.toInt(Number.MAX_SAFE_INTEGER)) throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, "utf8", Double.toInt(Number.MAX_SAFE_INTEGER), Double.toInt(Number.MAX_SAFE_INTEGER));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0093
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0930
     * @tc.desc Verify ArrayBuffer.stringify(encoded, "utf8", Double.toInt(Number.MIN_SAFE_INTEGER), encoded.byteLength) throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const encoded = ArrayBuffer.from("ABC", "utf8");
        ArrayBuffer.stringify(encoded, "utf8", Double.toInt(Number.MIN_SAFE_INTEGER), encoded.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0094
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0940
     * @tc.desc Verify ArrayBuffer.stringify returns ""
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 16);
      buffer.resize(0);
      let result = ArrayBuffer.stringify(buffer, "utf8", 0, 0);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name testArrayBufferStringify0095
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0950
     * @tc.desc Verify ArrayBuffer.stringify returns "ABC"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 16);
      const view = new Uint8Array(buffer);
      view[0] = 65; view[1] = 66; view[2] = 67;
      let result = ArrayBuffer.stringify(buffer, "utf8", 0, 3);
      expect(result).assertEqual("ABC");
    });

    /**
     * @tc.name testArrayBufferStringify0096
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0960
     * @tc.desc Verify ArrayBuffer.stringify returns "ABC"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(6, 16);
      const view = new Uint8Array(buffer);
      view[0] = 65; view[1] = 66; view[2] = 67; view[3] = 68; view[4] = 69; view[5] = 70;
      buffer.resize(3);
      let result = ArrayBuffer.stringify(buffer, "utf8", 0, buffer.byteLength);
      expect(result).assertEqual("ABC");
    });

  });
}
