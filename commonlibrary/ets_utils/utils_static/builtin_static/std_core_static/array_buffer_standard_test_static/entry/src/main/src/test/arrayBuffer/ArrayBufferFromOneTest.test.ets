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

export default function arrayBufferFromOneTest(): void {
  describe('ArrayBufferFromOneTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });


    /**
     * @tc.name testArrayBufferFromOne0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0100
     * @tc.desc Verify result.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [Int.toByte(1), Int.toByte(2), Int.toByte(3)];
      const result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(3);
      expect(result.at(0)).assertEqual(Int.toByte(1));
      expect(result.at(2)).assertEqual(Int.toByte(3));
    });
    /**
     * @tc.name testArrayBufferFromOne0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0200
     * @tc.desc Verify result.byteLength equals 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> =
        [Int.toByte(0), Int.toByte(1), Int.toByte(10), Int.toByte(100), Int.toByte(127)];
      const result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(5);
      expect(result.at(4)).assertEqual(Int.toByte(127));
    });
    /**
     * @tc.name testArrayBufferFromOne0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0300
     * @tc.desc Verify result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [];
      const result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(0);
    });
    /**
     * @tc.name testArrayBufferFromOne0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0400
     * @tc.desc Verify result.byteLength equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [Int.toByte(42)];
      const result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(1);
      expect(result.at(0)).assertEqual(Int.toByte(42));
    });
    /**
     * @tc.name testArrayBufferFromOne0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0500
     * @tc.desc Verify result.byteLength equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> =
        [Int.toByte(1), Int.toByte(2), Int.toByte(3), Int.toByte(4), Int.toByte(5), Int.toByte(6), Int.toByte(7),
          Int.toByte(8)];
      const result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(8);
      expect(result.at(7)).assertEqual(Int.toByte(8));
    });
    /**
     * @tc.name testArrayBufferFromOne0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0600
     * @tc.desc Verify result.byteLength equals 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [Int.toByte(-1), Int.toByte(-10), Int.toByte(-50), Int.toByte(-128)];
      const result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(4);
      expect(result.at(0)).assertEqual(Int.toByte(-1));
      expect(result.at(3)).assertEqual(Int.toByte(-128));
    });
    /**
     * @tc.name testArrayBufferFromOne0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0700
     * @tc.desc Verify result.byteLength equals 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [Int.toByte(127), Int.toByte(-128), Int.toByte(0), Int.toByte(-1)];
      const result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(4);
      expect(result.at(0)).assertEqual(Int.toByte(127));
      expect(result.at(1)).assertEqual(Int.toByte(-128));
    });
    /**
     * @tc.name testArrayBufferFromOne0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0800
     * @tc.desc Verify result.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [Int.toByte(127), Int.toByte(127), Int.toByte(127)];
      const result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(3);
      expect(result.at(1)).assertEqual(Int.toByte(127));
    });
    /**
     * @tc.name testArrayBufferFromOne0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0900
     * @tc.desc Verify result.byteLength equals 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [Int.toByte(-128), Int.toByte(-128)];
      const result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(2);
      expect(result.at(0)).assertEqual(Int.toByte(-128));
    });
    /**
     * @tc.name testArrayBufferFromOne0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1000
     * @tc.desc Verify ArrayBuffer.from(Utils.castToValueArrayByte(null as Object)) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.from(Utils.castToValueArrayByte(null as Object));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.name testArrayBufferFromOne0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1100
     * @tc.desc Verify ArrayBuffer.from(Utils.castToValueArrayByte(undefined as Object)) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.from(Utils.castToValueArrayByte(undefined as Object));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.name testArrayBufferFromOne0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1200
     * @tc.desc Verify ArrayBuffer.from(Utils.castToValueArrayByte("hello" as Object)) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.from(Utils.castToValueArrayByte("hello" as Object));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.name testArrayBufferFromOne0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1300
     * @tc.desc Verify ArrayBuffer.from(Utils.castToValueArrayByte(Utils.boxAsObject(badNum))) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const badNum: number = 123;
      try {
        ArrayBuffer.from(Utils.castToValueArrayByte(Utils.boxAsObject(badNum)));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.name testArrayBufferFromOne0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1400
     * @tc.desc Verify ArrayBuffer.from(Utils.castToValueArrayByte(true as Object)) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.from(Utils.castToValueArrayByte(true as Object));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.name testArrayBufferFromOne0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1500
     * @tc.desc Verify ArrayBuffer.from(Utils.castToValueArrayByte(Utils.plainRecordAsObject())) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.from(Utils.castToValueArrayByte(Utils.plainRecordAsObject()));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.name testArrayBufferFromOne0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1600
     * @tc.desc Verify ArrayBuffer.from(Utils.castToValueArrayByte(buf as Object)) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      try {
        ArrayBuffer.from(Utils.castToValueArrayByte(buf as Object));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.name testArrayBufferFromOne0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1700
     * @tc.desc Verify result.byteLength equals 7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> =
        [Int.toByte(0), Int.toByte(1), Int.toByte(63), Int.toByte(127), Int.toByte(-1), Int.toByte(-64),
          Int.toByte(-128)];
      const result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(7);
      expect(result.at(3)).assertEqual(Int.toByte(127));
      expect(result.at(6)).assertEqual(Int.toByte(-128));
    });
    /**
     * @tc.name testArrayBufferFromOne0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1800
     * @tc.desc Verify result.byteLength equals 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> =
        [Int.toByte(1), Int.toByte(2), Int.toByte(3), Int.toByte(4), Int.toByte(5)];
      const result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(5);
      expect(result.at(0)).assertEqual(Int.toByte(1));
      expect(result.at(4)).assertEqual(Int.toByte(5));
    });
    /**
     * @tc.name testArrayBufferFromOne0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1900
     * @tc.desc Verify result.byteLength equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [Int.toByte(99)];
      const result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(1);
      expect(result.at(0)).assertEqual(Int.toByte(99));
    });
    /**
     * @tc.name testArrayBufferFromOne0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_2000
     * @tc.desc Verify result.byteLength equals 1024
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = new ValueArray<byte>(1024, Int.toByte(0));
      for (let i: int = 0; i < 1024; i++) {
        arr[i] = Int.toByte(i % 256);
      }
      const result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(1024);
      expect(result.at(0)).assertEqual(Int.toByte(0));
      const lastIndex: int = 1023;
      expect(result.at(lastIndex)).assertEqual(Int.toByte(255));
    });
    /**
     * @tc.name testArrayBufferFromOne0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_2100
     * @tc.desc Verify result.at(i) returns arr[i]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> =
        [Int.toByte(10), Int.toByte(20), Int.toByte(30), Int.toByte(40), Int.toByte(50)];
      const result = ArrayBuffer.from(arr);
      for (let i: int = 0; i < 5; i++) {
        expect(result.at(i)).assertEqual(arr[i]);
      }
    });
    /**
     * @tc.name testArrayBufferFromOne0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_2200
     * @tc.desc Verify buffer.at returns boundary positive and zero bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [Int.toByte(127), Int.toByte(-128), Int.toByte(0)];
      const result = ArrayBuffer.from(arr);
      expect(result.at(0)).assertEqual(Int.toByte(127));
      expect(result.at(1)).assertEqual(Int.toByte(-128));
      expect(result.at(2)).assertEqual(Int.toByte(0));
    });
    /**
     * @tc.name testArrayBufferFromOne0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_2300
     * @tc.desc Verify buffer.at returns negative byte values at 3 indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [Int.toByte(-1), Int.toByte(-50), Int.toByte(-100)];
      const result = ArrayBuffer.from(arr);
      expect(result.at(0)).assertEqual(Int.toByte(-1));
      expect(result.at(1)).assertEqual(Int.toByte(-50));
      expect(result.at(2)).assertEqual(Int.toByte(-100));
    });
    /**
     * @tc.name testArrayBufferFromOne0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_2400
     * @tc.desc Verify result.at(i) returns Int.toByte(0)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [Int.toByte(0), Int.toByte(0), Int.toByte(0), Int.toByte(0)];
      const result = ArrayBuffer.from(arr);
      for (let i: int = 0; i < 4; i++) {
        expect(result.at(i)).assertEqual(Int.toByte(0));
      }
    });
    /**
     * @tc.name testArrayBufferFromOne0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_2500
     * @tc.desc Verify result.at(0) returns Int.toByte(42)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [Int.toByte(42)];
      const result = ArrayBuffer.from(arr);
      expect(result.at(0)).assertEqual(Int.toByte(42));
    });
    /**
     * @tc.name testArrayBufferFromOne0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_2600
     * @tc.desc Verify buffer.at returns expected bytes at 2 indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [Int.toByte(1), Int.toByte(2), Int.toByte(3)];
      const result = ArrayBuffer.from(arr);
      arr[0] = Int.toByte(99);
      expect(result.at(0)).assertEqual(Int.toByte(1));
      expect(result.at(1)).assertEqual(Int.toByte(2));
    });
    /**
     * @tc.name testArrayBufferFromOne0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_2700
     * @tc.desc Verify modifying ArrayBuffer via set does not affect source ValueArray<byte>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [Int.toByte(10), Int.toByte(20)];
      const result = ArrayBuffer.from(arr);
      result.set(0, Int.toByte(99));
      expect(arr[0]).assertEqual(Int.toByte(10));
      expect(arr[1]).assertEqual(Int.toByte(20));
    });
    /**
     * @tc.name testArrayBufferFromOne0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_2800
     * @tc.desc Verify result1.byteLength equals result2.byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [Int.toByte(5), Int.toByte(6), Int.toByte(7)];
      const result1 = ArrayBuffer.from(arr);
      const result2 = ArrayBuffer.from(arr);
      expect((result1 !== result2)).assertTrue();
      expect(result1.byteLength).assertEqual(result2.byteLength);
      expect(result1.at(0)).assertEqual(result2.at(0));
    });
    /**
     * @tc.name testArrayBufferFromOne0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_2900
     * @tc.desc Verify result.at(0) returns Int.toByte(1)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [Int.toByte(1), Int.toByte(2), Int.toByte(3)];
      const result = ArrayBuffer.from(arr);
      arr[0] = Int.toByte(100);
      expect(result.at(0)).assertEqual(Int.toByte(1));
      expect(arr[0]).assertEqual(Int.toByte(100));
    });
    /**
     * @tc.name testArrayBufferFromOne0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_3000
     * @tc.desc Verify ArrayBuffer.from(Utils.castToValueArrayByte(Utils.voidFnAsObject())) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.from(Utils.castToValueArrayByte(Utils.voidFnAsObject()));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
  });
}
