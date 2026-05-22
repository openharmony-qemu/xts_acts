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

export default function arrayBufferFromSixTest(): void {
  describe('ArrayBufferFromSixTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });


    /**
     * @tc.name testArrayBufferFromSix0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0100
     * @tc.desc Verify result.byteLength equals 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcd', 'utf8');
      const result = ArrayBuffer.from(source, 1, 2);
      expect(result.byteLength).assertEqual(2);
    });
    /**
     * @tc.name testArrayBufferFromSix0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0200
     * @tc.desc Verify result.byteLength equals 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('hello', 'utf8');
      const result = ArrayBuffer.from(source, 0, source.byteLength);
      expect(result.byteLength).assertEqual(5);
    });
    /**
     * @tc.name testArrayBufferFromSix0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0300
     * @tc.desc Verify result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new ArrayBuffer(0);
      const result = ArrayBuffer.from(empty, 0, 0);
      expect(result.byteLength).assertEqual(0);
    });
    /**
     * @tc.name testArrayBufferFromSix0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0400
     * @tc.desc Verify result.byteLength equals 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcdefghijklmnopqrstuvwxyz', 'utf8');
      const result = ArrayBuffer.from(source, 5, 10);
      expect(result.byteLength).assertEqual(10);
    });
    /**
     * @tc.name testArrayBufferFromSix0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0500
     * @tc.desc Verify ArrayBuffer.stringify returns 'abc'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcdef', 'utf8');
      const result = ArrayBuffer.from(source, 0, 3);
      const str = ArrayBuffer.stringify(result, 'utf8', 0, result.byteLength);
      expect(str).assertEqual('abc');
    });
    /**
     * @tc.name testArrayBufferFromSix0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0600
     * @tc.desc Verify ArrayBuffer.stringify returns 'cde'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcdef', 'utf8');
      const result = ArrayBuffer.from(source, 2, 3);
      const str = ArrayBuffer.stringify(result, 'utf8', 0, result.byteLength);
      expect(str).assertEqual('cde');
    });
    /**
     * @tc.name testArrayBufferFromSix0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0700
     * @tc.desc Verify ArrayBuffer.stringify returns 'f'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcdef', 'utf8');
      const result = ArrayBuffer.from(source, source.byteLength - 1, 1);
      const str = ArrayBuffer.stringify(result, 'utf8', 0, result.byteLength);
      expect(str).assertEqual('f');
    });
    /**
     * @tc.name testArrayBufferFromSix0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0800
     * @tc.desc Verify result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcdef', 'utf8');
      const result = ArrayBuffer.from(source, source.byteLength, 0);
      expect(result.byteLength).assertEqual(0);
    });
    /**
     * @tc.name testArrayBufferFromSix0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0900
     * @tc.desc Verify ArrayBuffer.from(source, source.byteLength + 1, 1) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcdef', 'utf8');
      try {
        ArrayBuffer.from(source, source.byteLength + 1, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
    /**
     * @tc.name testArrayBufferFromSix0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1000
     * @tc.desc Verify ArrayBuffer.from(source, -1, 1) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcdef', 'utf8');
      try {
        ArrayBuffer.from(source, -1, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
    /**
     * @tc.name testArrayBufferFromSix0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1100
     * @tc.desc Verify result.byteLength equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcdef', 'utf8');
      const result = ArrayBuffer.from(source, Double.toInt(1.5), 1);
      expect(result.byteLength).assertEqual(1);
      expect(result.at(0)).assertEqual(source.at(1));
    });
    /**
     * @tc.name testArrayBufferFromSix0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1200
     * @tc.desc Verify result.byteLength equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcdef', 'utf8');
      const result = ArrayBuffer.from(source, 0, 1);
      expect(result.byteLength).assertEqual(1);
      expect(result.at(0)).assertEqual(source.at(0));
    });
    /**
     * @tc.name testArrayBufferFromSix0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1300
     * @tc.desc Verify result.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcdef', 'utf8');
      const result = ArrayBuffer.from(source, 1, 3);
      expect(result.byteLength).assertEqual(3);
      expect(result.at(0)).assertEqual(source.at(1));
      expect(result.at(1)).assertEqual(source.at(2));
      expect(result.at(2)).assertEqual(source.at(3));
    });
    /**
     * @tc.name testArrayBufferFromSix0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1400
     * @tc.desc Verify result.byteLength equals 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcdef', 'utf8');
      const result = ArrayBuffer.from(source, 2, source.byteLength - 2);
      expect(result.byteLength).assertEqual(4);
    });
    /**
     * @tc.name testArrayBufferFromSix0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1500
     * @tc.desc Verify result.byteLength equals source.byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcdef', 'utf8');
      const result = ArrayBuffer.from(source, 0, source.byteLength);
      expect(result.byteLength).assertEqual(source.byteLength);
    });
    /**
     * @tc.name testArrayBufferFromSix0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1600
     * @tc.desc Verify ArrayBuffer.from(source, 2, source.byteLength) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcdef', 'utf8');
      try {
        ArrayBuffer.from(source, 2, source.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
    /**
     * @tc.name testArrayBufferFromSix0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1700
     * @tc.desc Verify ArrayBuffer.from(source, 0, -1) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcdef', 'utf8');
      try {
        ArrayBuffer.from(source, 0, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
    /**
     * @tc.name testArrayBufferFromSix0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1800
     * @tc.desc Verify result.byteLength equals 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcdef', 'utf8');
      const result = ArrayBuffer.from(source, 0, Double.toInt(2.5));
      expect(result.byteLength).assertEqual(2);
      expect(result.at(0)).assertEqual(source.at(0));
      expect(result.at(1)).assertEqual(source.at(1));
    });
    /**
     * @tc.name testArrayBufferFromSix0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1900
     * @tc.desc Verify result.byteLength equals 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcdefghij', 'utf8');
      const result = ArrayBuffer.from(source, 3, 4);
      expect(result.byteLength).assertEqual(4);
      expect(result.at(0)).assertEqual(source.at(3));
      expect(result.at(1)).assertEqual(source.at(4));
      expect(result.at(2)).assertEqual(source.at(5));
      expect(result.at(3)).assertEqual(source.at(6));
    });
    /**
     * @tc.name testArrayBufferFromSix0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2000
     * @tc.desc Verify result != source is true and result.byteLength equals sourceLen
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcd', 'utf8');
      const result = ArrayBuffer.from(source, 0, source.byteLength);
      const sourceLen = source.byteLength;
      expect(result.byteLength).assertEqual(sourceLen);
      expect(result != source).assertTrue();
    });
    /**
     * @tc.name testArrayBufferFromSix0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2100
     * @tc.desc Verify r1.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('1234567890', 'utf8');
      const r1 = ArrayBuffer.from(source, 0, 3);
      const r2 = ArrayBuffer.from(source, 5, 3);
      expect(r1.byteLength).assertEqual(3);
      expect(r2.byteLength).assertEqual(3);
    });
    /**
     * @tc.name testArrayBufferFromSix0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2200
     * @tc.desc Verify from(source, 0, 2) returns 2-byte ArrayBuffer copy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcd', 'utf8');
      const result = ArrayBuffer.from(source, 0, 2);
      expect(result instanceof ArrayBuffer).assertTrue();
      expect(result.byteLength).assertEqual(2);
    });
    /**
     * @tc.name testArrayBufferFromSix0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2300
     * @tc.desc Verify ArrayBuffer.stringify returns 'bc'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcdef', 'utf8');
      const result = ArrayBuffer.from(source, 1, 2);
      const str = ArrayBuffer.stringify(result, 'utf8', 0, result.byteLength);
      expect(str).assertEqual('bc');
    });
    /**
     * @tc.name testArrayBufferFromSix0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2400
     * @tc.desc Verify buffer.at returns expected bytes at 3 indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcdef', 'utf8');
      const result = ArrayBuffer.from(source, 1, 3);
      expect(result.at(0)).assertEqual(source.at(1));
      expect(result.at(1)).assertEqual(source.at(2));
      expect(result.at(2)).assertEqual(source.at(3));
    });
    /**
     * @tc.name testArrayBufferFromSix0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2500
     * @tc.desc Verify byteLength typeof is int
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcd', 'utf8');
      const result = ArrayBuffer.from(source, 1, 2);
      expect(typeof result.byteLength === 'int').assertTrue();
    });
    /**
     * @tc.name testArrayBufferFromSix0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2600
     * @tc.desc Verify result.at(i) returns source.at(i)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('hello world', 'utf8');
      const result = ArrayBuffer.from(source, 0, source.byteLength);
      for (let i: int = 0; i < result.byteLength; i++) {
        expect(result.at(i)).assertEqual(source.at(i));
      }
    });
    /**
     * @tc.name testArrayBufferFromSix0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2700
     * @tc.desc Verify ArrayBuffer.stringify returns 'defg'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcdefghij', 'utf8');
      const result = ArrayBuffer.from(source, 3, 4);
      const str = ArrayBuffer.stringify(result, 'utf8', 0, result.byteLength);
      expect(str).assertEqual('defg');
    });
    /**
     * @tc.name testArrayBufferFromSix0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2800
     * @tc.desc Verify result.byteLength equals source.byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('fullcopy', 'utf8');
      const result = ArrayBuffer.from(source, 0, source.byteLength);
      expect(result.byteLength).assertEqual(source.byteLength);
      const str = ArrayBuffer.stringify(result, 'utf8', 0, result.byteLength);
      expect(str).assertEqual('fullcopy');
    });
    /**
     * @tc.name testArrayBufferFromSix0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2900
     * @tc.desc Verify return value is ArrayBuffer instance and result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcd', 'utf8');
      const result = ArrayBuffer.from(source, 0, 0);
      expect(result.byteLength).assertEqual(0);
      expect(result instanceof ArrayBuffer).assertTrue();
    });
    /**
     * @tc.name testArrayBufferFromSix0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_3000
     * @tc.desc Verify result.byteLength equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcd', 'utf8');
      const result = ArrayBuffer.from(source, 0, 1);
      expect(result.byteLength).assertEqual(1);
      expect(result.at(0)).assertEqual(source.at(0));
    });
    /**
     * @tc.name testArrayBufferFromSix0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_3100
     * @tc.desc Verify result.byteLength equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcd', 'utf8');
      const result = ArrayBuffer.from(source, source.byteLength - 1, 1);
      expect(result.byteLength).assertEqual(1);
      expect(result.at(0)).assertEqual(source.at(source.byteLength - 1));
    });
    /**
     * @tc.name testArrayBufferFromSix0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_3200
     * @tc.desc Verify result.byteLength equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('x', 'utf8');
      const result = ArrayBuffer.from(source, 0, 1);
      expect(result.byteLength).assertEqual(1);
      expect(result.at(0)).assertEqual(source.at(0));
    });
    /**
     * @tc.name testArrayBufferFromSix0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_3300
     * @tc.desc Verify ArrayBuffer.from(source, 3, source.byteLength - 2) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcdef', 'utf8');
      try {
        ArrayBuffer.from(source, 3, source.byteLength - 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
    /**
     * @tc.name testArrayBufferFromSix0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_3400
     * @tc.desc Verify ArrayBuffer.from(source, 0, 1000) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcdef', 'utf8');
      try {
        ArrayBuffer.from(source, 0, 1000);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
    /**
     * @tc.name testArrayBufferFromSix0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_3500
     * @tc.desc Verify ArrayBuffer.from(source, source.byteLength, 1) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcdef', 'utf8');
      try {
        ArrayBuffer.from(source, source.byteLength, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
    /**
     * @tc.name testArrayBufferFromSix0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_3600
     * @tc.desc Verify ArrayBuffer.from(source, source.byteLength + 10, 1) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcdef', 'utf8');
      try {
        ArrayBuffer.from(source, source.byteLength + 10, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
    /**
     * @tc.name testArrayBufferFromSix0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_3700
     * @tc.desc Verify ArrayBuffer.from(source, -1, 2) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcdef', 'utf8');
      try {
        ArrayBuffer.from(source, -1, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
    /**
     * @tc.name testArrayBufferFromSix0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_3800
     * @tc.desc Verify ArrayBuffer.from(source, -100, 2) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcdef', 'utf8');
      try {
        ArrayBuffer.from(source, -100, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
    /**
     * @tc.name testArrayBufferFromSix0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_3900
     * @tc.desc Verify ArrayBuffer.from(source, 0, -100) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcdef', 'utf8');
      try {
        ArrayBuffer.from(source, 0, -100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
    /**
     * @tc.name testArrayBufferFromSix0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_4000
     * @tc.desc Verify ArrayBuffer.from(source, -1, -1) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from('abcdef', 'utf8');
      try {
        ArrayBuffer.from(source, -1, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
  });
}
