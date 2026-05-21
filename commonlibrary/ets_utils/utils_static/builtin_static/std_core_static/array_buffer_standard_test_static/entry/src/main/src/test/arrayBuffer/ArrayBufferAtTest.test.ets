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

export default function arrayBufferAtTest(): void {
  describe('ArrayBufferAtTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferAt0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0100
     * @tc.desc Verify buffer.at(0) returns Int.toByte(11)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      buffer.set(0, Int.toByte(11))
      buffer.set(1, Int.toByte(22))
      buffer.set(2, Int.toByte(33))
      buffer.set(3, Int.toByte(44))
      expect(buffer.at(0)).assertEqual(Int.toByte(11))
    });

    /**
     * @tc.name testArrayBufferAt0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0200
     * @tc.desc Verify buffer.at(2) returns Int.toByte(30)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(5)
      buffer.set(0, Int.toByte(10))
      buffer.set(1, Int.toByte(20))
      buffer.set(2, Int.toByte(30))
      buffer.set(3, Int.toByte(40))
      buffer.set(4, Int.toByte(50))
      let result = buffer.at(2)
      expect(result).assertEqual(Int.toByte(30))
    });

    /**
     * @tc.name testArrayBufferAt0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0300
     * @tc.desc Verify buffer.at(3) returns Int.toByte(40)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      buffer.set(0, Int.toByte(10))
      buffer.set(1, Int.toByte(20))
      buffer.set(2, Int.toByte(30))
      buffer.set(3, Int.toByte(40))
      let result = buffer.at(3)
      expect(result).assertEqual(Int.toByte(40))
    });

    /**
     * @tc.name testArrayBufferAt0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0400
     * @tc.desc Verify buffer.at returns expected bytes at 3 indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(3)
      buffer.set(0, Int.toByte(65))
      buffer.set(1, Int.toByte(66))
      buffer.set(2, Int.toByte(67))
      expect(buffer.at(0)).assertEqual(Int.toByte(65))
      expect(buffer.at(1)).assertEqual(Int.toByte(66))
      expect(buffer.at(2)).assertEqual(Int.toByte(67))
    });

    /**
     * @tc.name testArrayBufferAt0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0500
     * @tc.desc Verify buffer.at(0) returns Int.toByte(0)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      let result = buffer.at(0)
      expect(result).assertEqual(Int.toByte(0))
    });

    /**
     * @tc.name testArrayBufferAt0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0600
     * @tc.desc Verify buffer.at returns expected bytes at 4 indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      buffer.set(0, Int.toByte(10))
      buffer.set(2, Int.toByte(30))
      expect(buffer.at(0)).assertEqual(Int.toByte(10))
      expect(buffer.at(1)).assertEqual(Int.toByte(0))
      expect(buffer.at(2)).assertEqual(Int.toByte(30))
      expect(buffer.at(3)).assertEqual(Int.toByte(0))
    });

    /**
     * @tc.name testArrayBufferAt0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0700
     * @tc.desc Verify buffer.at returns expected bytes at 2 indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(2)
      buffer.set(0, Int.toByte(10))
      expect(buffer.at(0)).assertEqual(Int.toByte(10))
      buffer.set(0, Int.toByte(99))
      expect(buffer.at(0)).assertEqual(Int.toByte(99))
    });

    /**
     * @tc.name testArrayBufferAt0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0800
     * @tc.desc Verify r1 equals Int.toByte(42)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(2)
      buffer.set(0, Int.toByte(42))
      let r1 = buffer.at(0)
      let r2 = buffer.at(0)
      let r3 = buffer.at(0)
      expect(r1).assertEqual(Int.toByte(42))
      expect(r2).assertEqual(Int.toByte(42))
      expect(r3).assertEqual(Int.toByte(42))
    });

    /**
     * @tc.name testArrayBufferAt0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0900
     * @tc.desc Verify buffer.at(0) returns Int.toByte(127)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(2)
      buffer.set(0, Int.toByte(127))
      let result = buffer.at(0)
      expect(result).assertEqual(Int.toByte(127))
    });

    /**
     * @tc.name testArrayBufferAt0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_1000
     * @tc.desc Verify buffer.at(0) returns Int.toByte(-128)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(2)
      buffer.set(0, Int.toByte(-128))
      let result = buffer.at(0)
      expect(result).assertEqual(Int.toByte(-128))
    });

    /**
     * @tc.name testArrayBufferAt0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_1100
     * @tc.desc Verify buffer.at(0) returns Int.toByte(65)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      buffer.set(0, Int.toByte(65))
      let result: byte = buffer.at(0)
      expect(result).assertEqual(Int.toByte(65))
    });

    /**
     * @tc.name testArrayBufferAt0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_1200
     * @tc.desc Verify sum equals 30
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(2)
      buffer.set(0, Int.toByte(10))
      buffer.set(1, Int.toByte(20))
      let sum = buffer.at(0) + buffer.at(1)
      expect(sum).assertEqual(30)
    });

    /**
     * @tc.name testArrayBufferAt0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_1300
     * @tc.desc Verify at(0) is less than at(1) and buffer.at(0) === 10 is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(2)
      buffer.set(0, Int.toByte(10))
      buffer.set(1, Int.toByte(20))
      expect(buffer.at(0) < buffer.at(1)).assertTrue()
      expect(buffer.at(0) === 10).assertTrue()
    });

    /**
     * @tc.name testArrayBufferAt0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_1400
     * @tc.desc Verify buffer.at(0) returns Int.toByte(42)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(1)
      buffer.set(0, Int.toByte(42))
      expect(buffer.at(0)).assertEqual(Int.toByte(42))
    });

    /**
     * @tc.name testArrayBufferAt0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_1500
     * @tc.desc Verify buffer.at(0) returns Int.toByte(0)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(1)
      expect(buffer.at(0)).assertEqual(Int.toByte(0))
    });

    /**
     * @tc.name testArrayBufferAt0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_1600
     * @tc.desc Verify buffer.at returns expected bytes at 3 indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(256)
      buffer.set(0, Int.toByte(1))
      buffer.set(127, Int.toByte(127))
      buffer.set(255, Int.toByte(-1))
      expect(buffer.at(0)).assertEqual(Int.toByte(1))
      expect(buffer.at(127)).assertEqual(Int.toByte(127))
      expect(buffer.at(255)).assertEqual(Int.toByte(-1))
    });

    /**
     * @tc.name testArrayBufferAt0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_1700
     * @tc.desc Verify API call throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      buffer.set(0, Int.toByte(10))
      try {
        buffer.at(-1)
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError')
      }
    });

    /**
     * @tc.name testArrayBufferAt0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_1800
     * @tc.desc Verify API call throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      try {
        buffer.at(-100)
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError')
      }
    });

    /**
     * @tc.name testArrayBufferAt0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_1900
     * @tc.desc Verify API call throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      try {
        buffer.at(-2)
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError')
      }
    });

    /**
     * @tc.name testArrayBufferAt0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_2000
     * @tc.desc Verify API call throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      let posMin: int = -2147483648
      try {
        buffer.at(posMin)
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError')
      }
    });

    /**
     * @tc.name testArrayBufferAt0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_2100
     * @tc.desc Verify API call throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(1)
      buffer.set(0, Int.toByte(42))
      try {
        buffer.at(1)
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError')
      }
    });

    /**
     * @tc.name testArrayBufferAt0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_2200
     * @tc.desc Verify API call throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      buffer.set(0, Int.toByte(10))
      try {
        buffer.at(4)
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError')
      }
    });

    /**
     * @tc.name testArrayBufferAt0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_2300
     * @tc.desc Verify API call throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      try {
        buffer.at(1000)
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError')
      }
    });

    /**
     * @tc.name testArrayBufferAt0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_2400
     * @tc.desc Verify API call throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      let posMax: int = 2147483647
      try {
        buffer.at(posMax)
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError')
      }
    });

    /**
     * @tc.name testArrayBufferAt0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_2500
     * @tc.desc Verify API call throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(0)
      try {
        buffer.at(-1)
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError')
      }
    });

    /**
     * @tc.name testArrayBufferAt0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_2600
     * @tc.desc Verify API call throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(0)
      try {
        buffer.at(10)
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError')
      }
    });

    /**
     * @tc.name testArrayBufferAt0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_2700
     * @tc.desc Verify API call throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4, 8)
      buffer.set(0, Int.toByte(10))
      buffer.resize(0)
      try {
        buffer.at(0)
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError')
      }
    });

    /**
     * @tc.name testArrayBufferAt0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_2800
     * @tc.desc Verify API call throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4, 8)
      buffer.resize(0)
      try {
        buffer.at(3)
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError')
      }
    });

    /**
     * @tc.name testArrayBufferAt0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_2900
     * @tc.desc Verify buffer2.at(0) returns Int.toByte(65)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer1 = new ArrayBuffer(4, 16)
      buffer1.set(0, Int.toByte(10))
      buffer1.resize(0)
      let buffer2 = new ArrayBuffer(2)
      buffer2.set(0, Int.toByte(65))
      expect(buffer2.at(0)).assertEqual(Int.toByte(65))
    });

    /**
     * @tc.name testArrayBufferAt0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_3000
     * @tc.desc Verify buffer.at(0) returns Int.toByte(65)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(3)
      buffer.set(0, Int.toByte(65))
      buffer.set(1, Int.toByte(66))
      buffer.set(2, Int.toByte(67))
      let result = buffer.at(0)
      expect(result).assertEqual(Int.toByte(65))
    });

    /**
     * @tc.name testArrayBufferAt0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_3400
     * @tc.desc Verify API call throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      try {
        buffer.at(100)
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError')
      }
    });

    /**
     * @tc.name testArrayBufferAt0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_3500
     * @tc.desc Verify buffer.at returns expected bytes at 3 indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      buffer.set(1, Int.toByte(100))
      expect(buffer.at(0)).assertEqual(Int.toByte(0))
      expect(buffer.at(2)).assertEqual(Int.toByte(0))
      expect(buffer.at(3)).assertEqual(Int.toByte(0))
    });

    /**
     * @tc.name testArrayBufferAt0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_3600
     * @tc.desc Verify API call throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(0)
      try {
        buffer.at(0)
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError')
      }
    });
  });
}
