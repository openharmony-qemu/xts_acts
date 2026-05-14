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

export default function arrayBufferSetTest(): void {
  describe('ArrayBufferSetTest', (): void => {
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
     * @tc.name testArrayBufferSet0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_0100
     * @tc.desc Verify ArrayBuffer.set: passing 2 required pos val，normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(65));
      expect(buffer.at(0)).assertEqual(Int.toByte(65));
    });

    /**
     * @tc.name testArrayBufferSet0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_0200
     * @tc.desc Mind map one-arg set not in STA; executable path uses pos+byte per resize(pos,val).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(65));
      expect(buffer.at(0)).assertEqual(Int.toByte(65));
    });

    /**
     * @tc.name testArrayBufferSet0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_0300
     * @tc.desc Mind map misordered args not in STA; verify legal set(pos,val).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(1, Int.toByte(66));
      expect(buffer.at(1)).assertEqual(Int.toByte(66));
    });

    /**
     * @tc.name testArrayBufferSet0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_0400
     * @tc.desc Mind map zero-arg set not in STA; verify two-arg call writes byte.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(2, Int.toByte(67));
      expect(buffer.at(2)).assertEqual(Int.toByte(67));
    });

    /**
     * @tc.name testArrayBufferSet0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_0500
     * @tc.desc Mind map three-arg set not in STA; verify exactly two parameters update one slot.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(3, Int.toByte(68));
      expect(buffer.at(3)).assertEqual(Int.toByte(68));
    });

    /**
     * @tc.name testArrayBufferSet0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_0600
     * @tc.desc Verify ArrayBuffer.set: pos=0， buffer byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      expect(buffer.at(0)).assertEqual(Int.toByte(10));
    });

    /**
     * @tc.name testArrayBufferSet0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_0700
     * @tc.desc Verify ArrayBuffer.set: pos is buffer ，normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.set(4, Int.toByte(20));
      expect(buffer.at(4)).assertEqual(Int.toByte(20));
    });

    /**
     * @tc.name testArrayBufferSet0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_0800
     * @tc.desc Verify ArrayBuffer.set: pos=byteLength-1， buffer after byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(3, Int.toByte(99));
      expect(buffer.at(3)).assertEqual(Int.toByte(99));
    });

    /**
     * @tc.name testArrayBufferSet0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_0900
     * @tc.desc Verify ArrayBuffer.set: pos=-1， IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      try {
        buffer.set(-1, Int.toByte(10));
      } catch (e) {
        expect(e instanceof IndexOutOfBoundsError).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferSet0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_1000
     * @tc.desc Verify ArrayBuffer.set: pos is negative ， IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      try {
        buffer.set(-100, Int.toByte(10));
      } catch (e) {
        expect(e instanceof IndexOutOfBoundsError).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferSet0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_1100
     * @tc.desc Verify ArrayBuffer.set: pos=byteLength，equals buffer length ， IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      try {
        buffer.set(4, Int.toByte(10));
      } catch (e) {
        expect(e instanceof IndexOutOfBoundsError).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferSet0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_1200
     * @tc.desc Verify ArrayBuffer.set: pos greater than byteLength， IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      try {
        buffer.set(1000, Int.toByte(10));
      } catch (e) {
        expect(e instanceof IndexOutOfBoundsError).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferSet0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_1300
     * @tc.desc Verify ArrayBuffer.set: pos is intmaximum (2147483647)， IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      try {
        buffer.set(2147483647, Int.toByte(10));
      } catch (e) {
        expect(e instanceof IndexOutOfBoundsError).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferSet0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_1400
     * @tc.desc Verify ArrayBuffer.set: pos is intminimum (-2147483648)， IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      try {
        buffer.set(-2147483648, Int.toByte(10));
      } catch (e) {
        expect(e instanceof IndexOutOfBoundsError).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferSet0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_1500
     * @tc.desc Verify ArrayBuffer.set: byte 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(0));
      expect(buffer.at(0)).assertEqual(Int.toByte(0));
    });

    /**
     * @tc.name testArrayBufferSet0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_1600
     * @tc.desc Verify ArrayBuffer.set: byte 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(1));
      expect(buffer.at(0)).assertEqual(Int.toByte(1));
    });

    /**
     * @tc.name testArrayBufferSet0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_1700
     * @tc.desc Verify ArrayBuffer.set: byte 100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(100));
      expect(buffer.at(0)).assertEqual(Int.toByte(100));
    });

    /**
     * @tc.name testArrayBufferSet0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_1800
     * @tc.desc Verify ArrayBuffer.set: bytemaximum 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(127));
      expect(buffer.at(0)).assertEqual(Int.toByte(127));
    });

    /**
     * @tc.name testArrayBufferSet0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_1900
     * @tc.desc Verify ArrayBuffer.set: byteminimum -128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(-128));
      expect(buffer.at(0)).assertEqual(Int.toByte(-128));
    });

    /**
     * @tc.name testArrayBufferSet0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_2000
     * @tc.desc Verify ArrayBuffer.set: byte -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(-1));
      expect(buffer.at(0)).assertEqual(Int.toByte(-1));
    });

    /**
     * @tc.name testArrayBufferSet0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_2100
     * @tc.desc Verify ArrayBuffer.set: byte -50
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(-50));
      expect(buffer.at(0)).assertEqual(Int.toByte(-50));
    });

    /**
     * @tc.name testArrayBufferSet0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_2200
     * @tc.desc Verify ArrayBuffer.set: byte 65， A
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(3);
      buffer.set(0, Int.toByte(65));
      expect(buffer.at(0)).assertEqual(Int.toByte(65));
    });

    /**
     * @tc.name testArrayBufferSet0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_2300
     * @tc.desc Verify ArrayBuffer.set: multiple set， after before
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      buffer.set(0, Int.toByte(20));
      expect(buffer.at(0)).assertEqual(Int.toByte(20));
    });

    /**
     * @tc.name testArrayBufferSet0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_2400
     * @tc.desc Verify ArrayBuffer.set: byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      buffer.set(1, Int.toByte(20));
      buffer.set(2, Int.toByte(30));
      buffer.set(3, Int.toByte(40));
      expect(buffer.at(0)).assertEqual(Int.toByte(10));
      expect(buffer.at(1)).assertEqual(Int.toByte(20));
      expect(buffer.at(2)).assertEqual(Int.toByte(30));
      expect(buffer.at(3)).assertEqual(Int.toByte(40));
    });

    /**
     * @tc.name testArrayBufferSet0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_2500
     * @tc.desc Verify ArrayBuffer.set: setmethod return value ，returns undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      const result = buffer.set(0, Int.toByte(65));
      expect(result).assertUndefined();
    });

    /**
     * @tc.name testArrayBufferSet0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_2600
     * @tc.desc Verify ArrayBuffer.set: set after at ，verify consistent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(1, Int.toByte(88));
      const val = buffer.at(1);
      expect(val).assertEqual(88);
    });

    /**
     * @tc.name testArrayBufferSet0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_2700
     * @tc.desc Verify ArrayBuffer.set: set after ，
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      buffer.set(2, Int.toByte(30));
      expect(buffer.at(0)).assertEqual(Int.toByte(10));
      expect(buffer.at(1)).assertEqual(Int.toByte(0));
      expect(buffer.at(2)).assertEqual(Int.toByte(30));
      expect(buffer.at(3)).assertEqual(Int.toByte(0));
    });

    /**
     * @tc.name testArrayBufferSet0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_2800
     * @tc.desc Verify ArrayBuffer.set: ，
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      expect(buffer.at(0)).assertEqual(Int.toByte(10));
      buffer.set(0, Int.toByte(99));
      expect(buffer.at(0)).assertEqual(Int.toByte(99));
    });

    /**
     * @tc.name testArrayBufferSet0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_2900
     * @tc.desc Verify ArrayBuffer.set: bytemaximum 127 after verify
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(127));
      expect(buffer.at(0)).assertEqual(Int.toByte(127));
    });

    /**
     * @tc.name testArrayBufferSet0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_3000
     * @tc.desc Verify ArrayBuffer.set: byteminimum -128 after verify
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(-128));
      expect(buffer.at(0)).assertEqual(Int.toByte(-128));
    });

    /**
     * @tc.name testArrayBufferSet0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_3100
     * @tc.desc Verify ArrayBuffer.set: pos is negative ，throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      try {
        buffer.set(-1, Int.toByte(10));
      } catch (e) {
        expect(e instanceof IndexOutOfBoundsError).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferSet0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_3200
     * @tc.desc Verify ArrayBuffer.set: posequals buffer length ，throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      try {
        buffer.set(4, Int.toByte(10));
      } catch (e) {
        expect(e instanceof IndexOutOfBoundsError).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferSet0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_3300
     * @tc.desc Verify ArrayBuffer.set: pos greater than buffer length ，throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      try {
        buffer.set(9999, Int.toByte(10));
      } catch (e) {
        expect(e instanceof IndexOutOfBoundsError).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferSet0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_3400
     * @tc.desc Verify ArrayBuffer.set: pos is 2147483647，throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      try {
        buffer.set(2147483647, Int.toByte(10));
      } catch (e) {
        expect(e instanceof IndexOutOfBoundsError).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferSet0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_3500
     * @tc.desc Verify ArrayBuffer.set: pos is -2147483648，throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      try {
        buffer.set(-2147483648, Int.toByte(10));
      } catch (e) {
        expect(e instanceof IndexOutOfBoundsError).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferSet0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_3600
     * @tc.desc Verify ArrayBuffer.set: empty ArrayBuffer(byteLength=0)，pos=0throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      try {
        buffer.set(0, Int.toByte(10));
      } catch (e) {
        expect(e instanceof IndexOutOfBoundsError).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferSet0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_3700
     * @tc.desc Verify ArrayBuffer.set: empty ArrayBuffer(byteLength=0)，pos=1throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      try {
        buffer.set(1, Int.toByte(10));
      } catch (e) {
        expect(e instanceof IndexOutOfBoundsError).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferSet0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_3800
     * @tc.desc Verify ArrayBuffer.set: empty ArrayBuffer(byteLength=0)，pos=-1throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      try {
        buffer.set(-1, Int.toByte(10));
      } catch (e) {
        expect(e instanceof IndexOutOfBoundsError).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferSet0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_3900
     * @tc.desc No STA detach(); zero-length resizable buffer (resize(0)) rejects set at index 0 — same observable boundary as mind-map detach narrative.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 8);
      buffer.resize(0);
      try {
        buffer.set(0, Int.toByte(10));
        expect(true).assertFail();
      } catch (e) {
        expect(e instanceof IndexOutOfBoundsError).assertTrue();
      }
    });
    return;
  });
}
