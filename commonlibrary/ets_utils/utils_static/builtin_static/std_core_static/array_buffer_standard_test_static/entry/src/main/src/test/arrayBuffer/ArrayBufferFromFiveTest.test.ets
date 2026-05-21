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

export default function arrayBufferFromFiveTest(): void {
  describe('ArrayBufferFromFiveTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferFromFive0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0100
     * @tc.desc Verify buf.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('ABC', 'utf8');
      expect(buf.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromFive0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0200
     * @tc.desc Verify buf.byteLength equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('Hello123', 'utf8');
      expect(buf.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferFromFive0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0300
     * @tc.desc Verify buf.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('', 'utf8');
      expect(buf.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromFive0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0400
     * @tc.desc Verify buf.byteLength equals 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('你好', 'utf8');
      expect(buf.byteLength).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferFromFive0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0500
     * @tc.desc Verify buf.byteLength equals 15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('こんにちは', 'utf8');
      expect(buf.byteLength).assertEqual(15);
    });

    /**
     * @tc.name testArrayBufferFromFive0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0600
     * @tc.desc Verify buf.byteLength equals 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('😀', 'utf8');
      expect(buf.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferFromFive0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0700
     * @tc.desc Verify buf.byteLength equals 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('A😀B', 'utf8');
      expect(buf.byteLength).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferFromFive0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0800
     * @tc.desc Verify buf.byteLength equals 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('A\tB\nC', 'utf8');
      expect(buf.byteLength).assertEqual(5);
    });

    /**
     * @tc.name testArrayBufferFromFive0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0900
     * @tc.desc Verify buf.byteLength equals 13
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('Hello, World!', 'utf8');
      expect(buf.byteLength).assertEqual(13);
    });

    /**
     * @tc.name testArrayBufferFromFive0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1000
     * @tc.desc Verify buf.byteLength equals 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('A\\B\\C', 'utf8');
      expect(buf.byteLength).assertEqual(5);
    });

    /**
     * @tc.name testArrayBufferFromFive0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1100
     * @tc.desc Verify buf.byteLength equals 10000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from(Utils.buildLongString('A', 10000), 'utf8');
      expect(buf.byteLength).assertEqual(10000);
    });

    /**
     * @tc.name testArrayBufferFromFive0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1200
     * @tc.desc Verify buf.byteLength equals 3000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from(Utils.buildLongString('你', 1000), 'utf8');
      expect(buf.byteLength).assertEqual(3000);
    });

    /**
     * @tc.name testArrayBufferFromFive0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1300
     * @tc.desc Verify buf.byteLength equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('A', 'utf8');
      expect(buf.byteLength).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferFromFive0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1400
     * @tc.desc Verify buf.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('ABC', 'utf-8');
      expect(buf.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromFive0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1500
     * @tc.desc Verify buf.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('ABC', 'ascii');
      expect(buf.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromFive0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1600
     * @tc.desc Verify buf.byteLength equals 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('ABC', 'utf16le');
      expect(buf.byteLength).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferFromFive0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1700
     * @tc.desc Verify buf.byteLength equals 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('ABC', 'ucs2');
      expect(buf.byteLength).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferFromFive0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1800
     * @tc.desc Verify buf.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('QUJD', 'base64');
      expect(buf.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromFive0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1900
     * @tc.desc Verify buf.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('414243', 'hex');
      expect(buf.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromFive0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2000
     * @tc.desc Verify buf.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('ABC', 'latin1');
      expect(buf.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromFive0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2100
     * @tc.desc Verify buf.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('ABC', 'binary');
      expect(buf.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromFive0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2200
     * @tc.desc Verify ArrayBuffer.from('ABC', '') throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.from('ABC', '');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2300
     * @tc.desc Verify ArrayBuffer.from('ABC', 'invalid_encoding') throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.from('ABC', 'invalid_encoding');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2400
     * @tc.desc Verify ArrayBuffer.from('ABC', 'xyz123') throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.from('ABC', 'xyz123');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2500
     * @tc.desc Verify buf.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = ArrayBuffer.from('ABC', 'UTF8');
        expect(buf.byteLength).assertEqual(3);
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
        const fallback = ArrayBuffer.from('ABC', 'utf8');
        expect(fallback.byteLength).assertEqual(3);
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2600
     * @tc.desc Verify buf.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = ArrayBuffer.from('ABC', 'Utf8');
        expect(buf.byteLength).assertEqual(3);
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
        const fallback = ArrayBuffer.from('ABC', 'utf8');
        expect(fallback.byteLength).assertEqual(3);
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2700
     * @tc.desc Verify buf.byteLength equals 12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('你好世界', 'utf8');
      expect(buf.byteLength).assertEqual(12);
    });

    /**
     * @tc.name testArrayBufferFromFive0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2800
     * @tc.desc Verify buf.byteLength equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('😀🎉', 'utf8');
      expect(buf.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferFromFive0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2900
     * @tc.desc Verify buf.byteLength equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('A你好B', 'utf8');
      expect(buf.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferFromFive0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3000
     * @tc.desc Verify buf1.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf1 = ArrayBuffer.from('ABC', 'utf8');
      const buf2 = ArrayBuffer.from('ABC', 'utf16le');
      expect(buf1.byteLength).assertEqual(3);
      expect(buf2.byteLength).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferFromFive0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3100
     * @tc.desc Verify return value is ArrayBuffer instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('ABC', 'utf8');
      expect(buf instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromFive0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3200
     * @tc.desc Verify typeof buf === 'object' is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('ABC', 'utf8');
      expect(typeof buf === 'object').assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromFive0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3300
     * @tc.desc Verify value is not null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('ABC', 'utf8');
      expect(buf !== null).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromFive0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3400
     * @tc.desc Verify value is not undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('ABC', 'utf8');
      expect(buf !== undefined).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromFive0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3500
     * @tc.desc Verify typeof buf.byteLength equals 'int'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('ABC', 'utf8');
      expect(typeof buf.byteLength).assertEqual('int');
    });

    /**
     * @tc.name testArrayBufferFromFive0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3600
     * @tc.desc Verify sliced.byteLength equals 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('ABC', 'utf8');
      const sliced = buf.slice(0, 2);
      expect(sliced.byteLength).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferFromFive0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3700
     * @tc.desc Verify buf1 !== buf2 is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf1 = ArrayBuffer.from('ABC', 'utf8');
      const buf2 = ArrayBuffer.from('ABC', 'utf8');
      expect(buf1 !== buf2).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromFive0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3800
     * @tc.desc Verify ArrayBuffer.stringify returns original
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: string = 'ABC';
      const buf = ArrayBuffer.from(original, 'utf8');
      const restored = ArrayBuffer.stringify(buf, 'utf8', 0, buf.byteLength);
      expect(restored).assertEqual(original);
    });

    /**
     * @tc.name testArrayBufferFromFive0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3900
     * @tc.desc Verify ArrayBuffer.stringify returns original
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: string = '你好世界';
      const buf = ArrayBuffer.from(original, 'utf8');
      const restored = ArrayBuffer.stringify(buf, 'utf8', 0, buf.byteLength);
      expect(restored).assertEqual(original);
    });

    /**
     * @tc.name testArrayBufferFromFive0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4000
     * @tc.desc Verify ArrayBuffer.stringify returns original
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: string = '😀🎉';
      const buf = ArrayBuffer.from(original, 'utf8');
      const restored = ArrayBuffer.stringify(buf, 'utf8', 0, buf.byteLength);
      expect(restored).assertEqual(original);
    });

    /**
     * @tc.name testArrayBufferFromFive0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4100
     * @tc.desc Verify ArrayBuffer.stringify returns original
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: string = 'Hello你好😀';
      const buf = ArrayBuffer.from(original, 'utf8');
      const restored = ArrayBuffer.stringify(buf, 'utf8', 0, buf.byteLength);
      expect(restored).assertEqual(original);
    });

    /**
     * @tc.name testArrayBufferFromFive0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4200
     * @tc.desc Verify ArrayBuffer.stringify returns original
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: string = 'A\tB\nC';
      const buf = ArrayBuffer.from(original, 'utf8');
      const restored = ArrayBuffer.stringify(buf, 'utf8', 0, buf.byteLength);
      expect(restored).assertEqual(original);
    });

    /**
     * @tc.name testArrayBufferFromFive0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4300
     * @tc.desc Verify ArrayBuffer.stringify returns 'BC'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('ABCDE', 'utf8');
      const partial = ArrayBuffer.stringify(buf, 'utf8', 1, 3);
      expect(partial).assertEqual('BC');
    });

    /**
     * @tc.name testArrayBufferFromFive0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4400
     * @tc.desc Verify ArrayBuffer.stringify returns original
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pair: string = Utils.repeatString('AB', 2);
      let original: string = '';
      for (let i: int = 0; i < 100; i++) {
        original += pair;
      }
      const buf = ArrayBuffer.from(original, 'utf8');
      const restored = ArrayBuffer.stringify(buf, 'utf8', 0, buf.byteLength);
      expect(restored).assertEqual(original);
    });

    /**
     * @tc.name testArrayBufferFromFive0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4500
     * @tc.desc Verify ArrayBuffer.stringify returns original
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: string = 'ABC';
      const buf = ArrayBuffer.from(original, 'utf16le');
      const restored = ArrayBuffer.stringify(buf, 'utf16le', 0, buf.byteLength);
      expect(restored).assertEqual(original);
    });

    /**
     * @tc.name testArrayBufferFromFive0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4600
     * @tc.desc Verify return value is ArrayBuffer instance and buf.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('', 'utf8');
      expect(buf instanceof ArrayBuffer).assertTrue();
      expect(buf.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromFive0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4700
     * @tc.desc Verify ArrayBuffer.stringify returns ''
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('', 'utf8');
      const restored = ArrayBuffer.stringify(buf, 'utf8', 0, buf.byteLength);
      expect(restored).assertEqual('');
    });

    /**
     * @tc.name testArrayBufferFromFive0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4800
     * @tc.desc Verify buf.byteLength equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('A', 'utf8');
      expect(buf.byteLength).assertEqual(1);
      const restored = ArrayBuffer.stringify(buf, 'utf8', 0, buf.byteLength);
      expect(restored).assertEqual('A');
    });

    /**
     * @tc.name testArrayBufferFromFive0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4900
     * @tc.desc Verify buf.byteLength equals 10000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from(Utils.buildLongString('A', 10000), 'utf8');
      expect(buf.byteLength).assertEqual(10000);
    });

    /**
     * @tc.name testArrayBufferFromFive0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_5000
     * @tc.desc Verify ArrayBuffer.from('ABC', 'notexist') throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.from('ABC', 'notexist');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_5100
     * @tc.desc Verify ArrayBuffer.from('ABC', '12345') throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.from('ABC', '12345');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_5200
     * @tc.desc Verify ArrayBuffer.from('ABC', '!@#$%') throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.from('ABC', '!@#$%');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_5300
     * @tc.desc Verify ArrayBuffer.from('ABC', ' ') throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.from('ABC', '   ');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });
  });
}
