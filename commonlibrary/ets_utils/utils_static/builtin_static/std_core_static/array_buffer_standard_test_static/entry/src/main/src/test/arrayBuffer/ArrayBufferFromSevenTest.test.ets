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

export default function arrayBufferFromSevenTest(): void {
  describe('ArrayBufferFromSevenTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });




    /**
     * @tc.name testArrayBufferFromSeven0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0100
     * @tc.desc Verify result.byteLength equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      view[0] = 1;
      view[1] = 2;
      view[2] = 3;
      view[3] = 4;
      view[4] = 5;
      view[5] = 6;
      view[6] = 7;
      view[7] = 8;
      const result = ArrayBuffer.from(source);
      expect(result.byteLength).assertEqual(8);
      const resultView = new Int8Array(result);
      for (let i: int = 0; i < 8; i++) {
        expect(resultView[i]).assertEqual(view[i]);
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0200
     * @tc.desc Verify 2-arg omit length via Utils: byteLength equals source.byteLength - 3 and bytes from offset 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      view[0] = 1;
      view[1] = 2;
      view[2] = 3;
      view[3] = 4;
      view[4] = 5;
      view[5] = 6;
      view[6] = 7;
      view[7] = 8;
      const result = Utils.fromArrayBufferWithOffset(source, 3);
      const resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(source.byteLength - 3);
      for (let i: int = 0; i < 5; i++) {
        expect(resultView[i]).assertEqual(view[i + 3]);
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0300
     * @tc.desc Verify result.byteLength equals 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      view[0] = 1;
      view[1] = 2;
      view[2] = 3;
      view[3] = 4;
      view[4] = 5;
      view[5] = 6;
      view[6] = 7;
      view[7] = 8;
      const result = ArrayBuffer.from(source, 2, 4);
      expect(result.byteLength).assertEqual(4);
      const resultView = new Int8Array(result);
      for (let i: int = 0; i < 4; i++) {
        expect(resultView[i]).assertEqual(view[i + 2]);
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0400
     * @tc.desc Verify result.byteLength equals 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(16);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 16; i++) {
        view[i] = i;
      }
      const result = ArrayBuffer.from(source, 0, 16);
      expect(result.byteLength).assertEqual(16);
      const resultView = new Int8Array(result);
      for (let i: int = 0; i < 16; i++) {
        expect(resultView[i]).assertEqual(view[i]);
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0500
     * @tc.desc Verify result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new ArrayBuffer(0);
      const result = ArrayBuffer.from(empty);
      expect(result.byteLength).assertEqual(0);
    });
    /**
     * @tc.name testArrayBufferFromSeven0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0600
     * @tc.desc Verify result.byteLength equals 1024
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(1024);
      const view = new Int8Array(source);
      view[0] = 42;
      view[1023] = 99;
      const result = ArrayBuffer.from(source);
      expect(result.byteLength).assertEqual(1024);
      expect(result.at(0)).assertEqual(Int.toByte(42));
      expect(result.at(1023)).assertEqual(Int.toByte(99));
    });
    /**
     * @tc.name testArrayBufferFromSeven0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0700
     * @tc.desc Verify result.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(6);
      const view = new Int8Array(source);
      view[0] = 1;
      view[1] = 2;
      view[2] = 3;
      view[3] = 4;
      view[4] = 5;
      view[5] = 6;
      const result = ArrayBuffer.from(source, 0, 3);
      expect(result.byteLength).assertEqual(3);
      const resultView = new Int8Array(result);
      for (let i: int = 0; i < 3; i++) {
        expect(resultView[i]).assertEqual(view[i]);
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0800
     * @tc.desc Verify result.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(6);
      const view = new Int8Array(source);
      view[0] = 1;
      view[1] = 2;
      view[2] = 3;
      view[4] = 5;
      view[5] = 6;
      const result = ArrayBuffer.from(source, 2, 3);
      expect(result.byteLength).assertEqual(3);
      const resultView = new Int8Array(result);
      for (let i: int = 0; i < 3; i++) {
        expect(resultView[i]).assertEqual(view[i + 2]);
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0900
     * @tc.desc Verify result.byteLength equals 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      const view = new Int8Array(source);
      view[0] = 10;
      view[1] = 20;
      const result = ArrayBuffer.from(source, 0.0, 2);
      expect(result.byteLength).assertEqual(2);
      const resultView = new Int8Array(result);
      for (let i: int = 0; i < 2; i++) {
        expect(resultView[i]).assertEqual(view[i]);
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1000
     * @tc.desc Verify from(source, Double.toInt(1.5), 3) copies 3 bytes from offset 1 (STA truncates 1.5 to 1)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 8; i++) {
        view[i] = i;
      }
      const result = ArrayBuffer.from(source, Double.toInt(1.5), 3);
      expect(result.byteLength).assertEqual(3);
      expect(result.at(0)).assertEqual(source.at(1));
    });
    /**
     * @tc.name testArrayBufferFromSeven0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1100
     * @tc.desc Verify NaN offset coerces to 0 (STA NaN→0) and copies first 4 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 8; i++) {
        view[i] = i;
      }
      const result = ArrayBuffer.from(source, Double.toInt(Double.NaN), 4);
      expect(result.byteLength).assertEqual(4);
      expect(result.at(0)).assertEqual(source.at(0));
      expect(result.at(3)).assertEqual(source.at(3));
    });
    /**
     * @tc.name testArrayBufferFromSeven0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1200
     * @tc.desc Verify ArrayBuffer.from(source, Double.toInt(Double.POSITIVE_INFINITY), 4) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        ArrayBuffer.from(source, Double.toInt(Double.POSITIVE_INFINITY), 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1300
     * @tc.desc Verify ArrayBuffer.from(source, Double.toInt(Double.NEGATIVE_INFINITY), 4) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        ArrayBuffer.from(source, Double.toInt(Double.NEGATIVE_INFINITY), 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1400
     * @tc.desc Verify ArrayBuffer.from(source, -1, 2) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        ArrayBuffer.from(source, -1, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1500
     * @tc.desc Verify ArrayBuffer.from(source, -100, 2) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        ArrayBuffer.from(source, -100, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1600
     * @tc.desc Verify result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(6);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 6; i++) {
        view[i] = i;
      }
      const result = ArrayBuffer.from(source, source.byteLength, 0);
      expect(result.byteLength).assertEqual(0);
    });
    /**
     * @tc.name testArrayBufferFromSeven0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1700
     * @tc.desc Verify ArrayBuffer.from(source, source.byteLength + 1, 1) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        ArrayBuffer.from(source, source.byteLength + 1, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1800
     * @tc.desc Verify ArrayBuffer.from(source, Double.toInt(Number.MAX_SAFE_INTEGER), 1) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        ArrayBuffer.from(source, Double.toInt(Number.MAX_SAFE_INTEGER), 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1900
     * @tc.desc Verify result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const result = ArrayBuffer.from(source, 0, 0);
      expect(result.byteLength).assertEqual(0);
    });
    /**
     * @tc.name testArrayBufferFromSeven0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_2000
     * @tc.desc Verify result.byteLength equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(6);
      const view = new Int8Array(source);
      view[0] = 42;
      const result = ArrayBuffer.from(source, 0, 1);
      expect(result.byteLength).assertEqual(1);
      expect(result.at(0)).assertEqual(Int.toByte(42));
    });
    /**
     * @tc.name testArrayBufferFromSeven0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_2100
     * @tc.desc Verify result.byteLength equals 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(10);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 10; i++) {
        view[i] = i;
      }
      const result = ArrayBuffer.from(source, 1, 5);
      expect(result.byteLength).assertEqual(5);
      expect(result.at(0)).assertEqual(source.at(1));
      expect(result.at(4)).assertEqual(source.at(5));
    });
    /**
     * @tc.name testArrayBufferFromSeven0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_2200
     * @tc.desc Verify result.byteLength equals 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 8; i++) {
        view[i] = i;
      }
      const result = ArrayBuffer.from(source, 3, source.byteLength - 3);
      expect(result.byteLength).assertEqual(5);
      const resultView = new Int8Array(result);
      for (let i: int = 0; i < 5; i++) {
        expect(resultView[i]).assertEqual(view[i + 3]);
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_2300
     * @tc.desc Verify result.byteLength equals source.byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 8; i++) {
        view[i] = i;
      }
      const result = ArrayBuffer.from(source, 0, source.byteLength);
      expect(result.byteLength).assertEqual(source.byteLength);
    });
    /**
     * @tc.name testArrayBufferFromSeven0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_2400
     * @tc.desc Verify result.byteLength equals 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 8; i++) {
        view[i] = i;
      }
      const result = ArrayBuffer.from(source, 0, Double.toInt(2.7));
      expect(result.byteLength).assertEqual(2);
      const resultView = new Int8Array(result);
      for (let i: int = 0; i < 2; i++) {
        expect(resultView[i]).assertEqual(view[i]);
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_2500
     * @tc.desc Verify result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const result = ArrayBuffer.from(source, 0, 0.0);
      expect(result.byteLength).assertEqual(0);
    });
    /**
     * @tc.name testArrayBufferFromSeven0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_2600
     * @tc.desc Verify result.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 8; i++) {
        view[i] = i;
      }
      const result = ArrayBuffer.from(source, 0, 3.0);
      expect(result.byteLength).assertEqual(3);
      const resultView = new Int8Array(result);
      for (let i: int = 0; i < 3; i++) {
        expect(resultView[i]).assertEqual(view[i]);
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_2700
     * @tc.desc Verify NaN length coerces to 0 (STA NaN→0) and yields empty buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const result = ArrayBuffer.from(source, 0, Double.toInt(Double.NaN));
      expect(result.byteLength).assertEqual(0);
    });
    /**
     * @tc.name testArrayBufferFromSeven0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_2800
     * @tc.desc Verify ArrayBuffer.from(source, 0, Double.toInt(Double.POSITIVE_INFINITY)) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        ArrayBuffer.from(source, 0, Double.toInt(Double.POSITIVE_INFINITY));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_2900
     * @tc.desc Verify ArrayBuffer.from(source, 0, Double.toInt(Double.NEGATIVE_INFINITY)) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        ArrayBuffer.from(source, 0, Double.toInt(Double.NEGATIVE_INFINITY));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_3000
     * @tc.desc Verify ArrayBuffer.from(source, 0, -1) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        ArrayBuffer.from(source, 0, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_3100
     * @tc.desc Verify ArrayBuffer.from(source, 0, -100) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        ArrayBuffer.from(source, 0, -100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_3200
     * @tc.desc Verify ArrayBuffer.from(source, 2, 10) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        ArrayBuffer.from(source, 2, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_3300
     * @tc.desc Verify ArrayBuffer.from(source, 0, Double.toInt(Number.MAX_SAFE_INTEGER)) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        ArrayBuffer.from(source, 0, Double.toInt(Number.MAX_SAFE_INTEGER));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_3400
     * @tc.desc Verify modifying result copy view does not affect source view
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      const view = new Int8Array(source);
      view[0] = 10;
      view[1] = 20;
      view[2] = 30;
      view[3] = 40;
      const result = ArrayBuffer.from(source);
      const resultView = new Int8Array(result);
      resultView[0] = 99;
      expect(view[0]).assertEqual(10);
    });
    /**
     * @tc.name testArrayBufferFromSeven0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_3500
     * @tc.desc Verify result === source is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      const result = ArrayBuffer.from(source);
      expect(result === source).assertFalse();
    });
    /**
     * @tc.name testArrayBufferFromSeven0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_3600
     * @tc.desc Verify r1.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(10);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 10; i++) {
        view[i] = i;
      }
      const r1 = ArrayBuffer.from(source, 0, 3);
      const r2 = ArrayBuffer.from(source, 5, 3);
      const r3 = ArrayBuffer.from(source, 8, 2);
      expect(r1.byteLength).assertEqual(3);
      expect(r2.byteLength).assertEqual(3);
      expect(r3.byteLength).assertEqual(2);
    });
    /**
     * @tc.name testArrayBufferFromSeven0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_3700
     * @tc.desc Verify ArrayBuffer.from(source, 1, 3) copies 3 bytes from offset 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 8; i++) {
        view[i] = i;
      }
      const result = ArrayBuffer.from(source, 1, 3);
      expect(result.byteLength).assertEqual(3);
      expect(result.at(0)).assertEqual(source.at(1));
      expect(result.at(2)).assertEqual(source.at(3));
    });
    /**
     * @tc.name testArrayBufferFromSeven0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_3800
     * @tc.desc Verify from result is ArrayBuffer, byteLength typeof is int, Class.of matches ref
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const result = ArrayBuffer.from(source, 1, 3);
      const ref = new ArrayBuffer(0);
      expect(result instanceof ArrayBuffer).assertTrue();
      expect(typeof result.byteLength).assertEqual('int');
      expect(Class.of(result) === Class.of(ref)).assertTrue();
    });
    /**
     * @tc.name testArrayBufferFromSeven0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_3900
     * @tc.desc Verify Utils.fromArrayBufferWithOffset(source, 2) equals from(source, 2, byteLength-2)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 8; i++) {
        view[i] = i;
      }
      const r1 = ArrayBuffer.from(source, 2, source.byteLength - 2);
      const r2 = Utils.fromArrayBufferWithOffset(source, 2);
      expect(r1.byteLength).assertEqual(r2.byteLength);
      expect(r1.byteLength).assertEqual(source.byteLength - 2);
      const r1View = new Int8Array(r1);
      const r2View = new Int8Array(r2);
      for (let i: int = 0; i < r1.byteLength; i++) {
        expect(r1View[i]).assertEqual(r2View[i]);
        expect(r1View[i]).assertEqual(view[i + 2]);
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_4000
     * @tc.desc Verify resultView[i] equals view[i]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(6);
      const view = new Int8Array(source);
      view[0] = 10;
      view[1] = 20;
      view[2] = 30;
      view[3] = 40;
      view[4] = 50;
      view[5] = 60;
      const result = ArrayBuffer.from(source);
      const resultView = new Int8Array(result);
      for (let i: int = 0; i < 6; i++) {
        expect(resultView[i]).assertEqual(view[i]);
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_4100
     * @tc.desc Verify 2-arg omit length: byteLength equals source.byteLength - 3 and resultView[i] equals view[i + 3]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 8; i++) {
        view[i] = i * 10;
      }
      const result = Utils.fromArrayBufferWithOffset(source, 3);
      expect(result.byteLength).assertEqual(source.byteLength - 3);
      const resultView = new Int8Array(result);
      for (let i: int = 0; i < result.byteLength; i++) {
        expect(resultView[i]).assertEqual(view[i + 3]);
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_4200
     * @tc.desc Verify resultView[i] equals view[i + 2]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(10);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 10; i++) {
        view[i] = i + 1;
      }
      const result = ArrayBuffer.from(source, 2, 5);
      const resultView = new Int8Array(result);
      for (let i: int = 0; i < 5; i++) {
        expect(resultView[i]).assertEqual(view[i + 2]);
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_4300
     * @tc.desc Verify buffer.at returns expected bytes at 4 indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 8; i++) {
        view[i] = i * 2;
      }
      const result = ArrayBuffer.from(source, 1, 4);
      expect(result.at(0)).assertEqual(source.at(1));
      expect(result.at(1)).assertEqual(source.at(2));
      expect(result.at(2)).assertEqual(source.at(3));
      expect(result.at(3)).assertEqual(source.at(4));
    });
    /**
     * @tc.name testArrayBufferFromSeven0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_4400
     * @tc.desc Verify srcView[0] equals 11
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      const srcView = new Int8Array(source);
      srcView[0] = 11;
      srcView[1] = 22;
      srcView[2] = 33;
      srcView[3] = 44;
      const result = ArrayBuffer.from(source);
      const resView = new Int8Array(result);
      resView[0] = 99;
      resView[1] = 88;
      expect(srcView[0]).assertEqual(11);
      expect(srcView[1]).assertEqual(22);
    });
    /**
     * @tc.name testArrayBufferFromSeven0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_4500
     * @tc.desc Verify allMatch is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(256);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 256; i++) {
        view[i] = i;
      }
      const result = ArrayBuffer.from(source);
      const resultView = new Int8Array(result);
      let allMatch = true;
      for (let i: int = 0; i < 256; i++) {
        if (resultView[i] !== view[i]) {
          allMatch = false;
          break;
        }
      }
      expect(allMatch).assertTrue();
    });
    /**
     * @tc.name testArrayBufferFromSeven0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_4600
     * @tc.desc Verify 2-arg omit length from offset 7: byteLength equals source.byteLength - 7 and tail bytes match view
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(10);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 10; i++) {
        view[i] = i + 100;
      }
      const result = Utils.fromArrayBufferWithOffset(source, 7);
      const resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(source.byteLength - 7);
      for (let i: int = 0; i < 3; i++) {
        expect(resultView[i]).assertEqual(view[i + 7]);
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_4700
     * @tc.desc Verify result.byteLength equals 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(6);
      const view = new Int8Array(source);
      view[0] = 1;
      view[1] = 2;
      view[2] = 3;
      view[3] = 4;
      view[4] = 5;
      view[5] = 6;
      const result = ArrayBuffer.from(source);
      expect(result.byteLength).assertEqual(6);
      const resultView = new Int8Array(result);
      for (let i: int = 0; i < 6; i++) {
        expect(resultView[i]).assertEqual(view[i]);
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_4800
     * @tc.desc Verify 2-arg omit length at offset 0: byteLength equals source.byteLength and all bytes match
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 8; i++) {
        view[i] = i;
      }
      const result = Utils.fromArrayBufferWithOffset(source, 0);
      const resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(source.byteLength);
      for (let i: int = 0; i < 8; i++) {
        expect(resultView[i]).assertEqual(view[i]);
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_4900
     * @tc.desc Verify return value is ArrayBuffer instance and result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const result = ArrayBuffer.from(source, 0, 0);
      expect(result instanceof ArrayBuffer).assertTrue();
      expect(result.byteLength).assertEqual(0);
    });
    /**
     * @tc.name testArrayBufferFromSeven0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_5000
     * @tc.desc Verify result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const result = ArrayBuffer.from(source, source.byteLength, 0);
      expect(result.byteLength).assertEqual(0);
    });
    /**
     * @tc.name testArrayBufferFromSeven0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_5100
     * @tc.desc Verify result.byteLength equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      view[0] = 42;
      const result = ArrayBuffer.from(source, 0, 1);
      expect(result.byteLength).assertEqual(1);
      expect(result.at(0)).assertEqual(source.at(0));
    });
    /**
     * @tc.name testArrayBufferFromSeven0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_5200
     * @tc.desc Verify result.byteLength equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      view[7] = 77;
      const result = ArrayBuffer.from(source, source.byteLength - 1, 1);
      expect(result.byteLength).assertEqual(1);
      expect(result.at(0)).assertEqual(source.at(source.byteLength - 1));
    });
    /**
     * @tc.name testArrayBufferFromSeven0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_5300
     * @tc.desc Verify result.byteLength equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(1);
      const view = new Int8Array(source);
      view[0] = 127;
      const result = ArrayBuffer.from(source);
      expect(result.byteLength).assertEqual(1);
      expect(result.at(0)).assertEqual(source.at(0));
    });
    /**
     * @tc.name testArrayBufferFromSeven0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_5400
     * @tc.desc Verify ArrayBuffer.from(source, 3, 6) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        ArrayBuffer.from(source, 3, 6);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_5500
     * @tc.desc Verify ArrayBuffer.from(source, 0, 1000) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        ArrayBuffer.from(source, 0, 1000);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_5600
     * @tc.desc Verify ArrayBuffer.from(source, source.byteLength, 1) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        ArrayBuffer.from(source, source.byteLength, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_5700
     * @tc.desc Verify ArrayBuffer.from(source, source.byteLength + 10, 1) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        ArrayBuffer.from(source, source.byteLength + 10, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_5800
     * @tc.desc Verify ArrayBuffer.from(source, 0, 10) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      try {
        ArrayBuffer.from(source, 0, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_5900
     * @tc.desc Verify Utils.fromArrayBufferWithOffset(source, 10) propagates IndexOutOfBoundsError (tail length negative)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      try {
        Utils.fromArrayBufferWithOffset(source, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
    /**
     * @tc.name testArrayBufferFromSeven0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_6000
     * @tc.desc Verify NaN offset and length both coerce to 0 (STA NaN→0)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const nanOff: number = Double.toInt(Double.NaN);
      const nanLen: number = Double.toInt(Double.NaN);
      const result = ArrayBuffer.from(source, nanOff, nanLen);
      expect(result.byteLength).assertEqual(0);
    });
  });
}
