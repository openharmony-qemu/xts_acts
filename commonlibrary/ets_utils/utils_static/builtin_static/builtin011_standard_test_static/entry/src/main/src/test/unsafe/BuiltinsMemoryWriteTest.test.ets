/*
* Copyright (c) 2026 RKH Corp.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import { unsafeMemory } from "std/core";

export native function getStringSizeInBytes(value: string): int;

export default function BuiltinsMemoryWriteTest(): void {
  describe("BuiltinsMemoryWriteTest", () => {
    const INVALID_ADDR: long = 0 as long;
    beforeAll(() => {});
    beforeEach(() => {});
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name    unsafeBooleanReadWriteTest0100
     * @tc.number  SUB_BUILTINS_MEMORY_READWRITE_TEST_0100
     * @tc.desc    Verify unsafeMemory write and read boolean value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('unsafeBooleanReadWriteTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const addr: long = INVALID_ADDR;
      unsafeMemory.writeBoolean(addr, true);
      const res: boolean = unsafeMemory.readBoolean(addr);
      expect(res).assertTrue();
    });

    /**
     * @tc.name    unsafeInt8ReadWriteTest0200
     * @tc.number  SUB_BUILTINS_MEMORY_READWRITE_TEST_0200
     * @tc.desc    Verify unsafeMemory write and read int8 value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('unsafeInt8ReadWriteTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const addr: long = INVALID_ADDR;
      const val: byte = 127 as byte;
      unsafeMemory.writeInt8(addr, val);
      const res: byte = unsafeMemory.readInt8(addr);
      expect(res).assertEqual(val);
    });

    /**
     * @tc.name    unsafeInt16ReadWriteTest0300
     * @tc.number  SUB_BUILTINS_MEMORY_READWRITE_TEST_0300
     * @tc.desc    Verify unsafeMemory write and read int16 value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('unsafeInt16ReadWriteTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const addr: long = INVALID_ADDR;
      const val: short = 32767 as short;
      unsafeMemory.writeInt16(addr, val);
      const res: short = unsafeMemory.readInt16(addr);
      expect(res).assertEqual(val);
    });

    /**
     * @tc.name    unsafeInt32ReadWriteTest0400
     * @tc.number  SUB_BUILTINS_MEMORY_READWRITE_TEST_0400
     * @tc.desc    Verify unsafeMemory write and read int32 value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('unsafeInt32ReadWriteTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const addr: long = INVALID_ADDR;
      const val: int = 2147483647;
      unsafeMemory.writeInt32(addr, val);
      const res: int = unsafeMemory.readInt32(addr);
      expect(res).assertEqual(val);
    });

    /**
     * @tc.name    unsafeInt64ReadWriteTest0500
     * @tc.number  SUB_BUILTINS_MEMORY_READWRITE_TEST_0500
     * @tc.desc    Verify unsafeMemory write and read int64 value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('unsafeInt64ReadWriteTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const addr: long = INVALID_ADDR;
      const val: long = 9223372036854775807 as long;
      unsafeMemory.writeInt64(addr, val);
      const res: long = unsafeMemory.readInt64(addr);
      expect(res).assertEqual(val);
    });

    /**
     * @tc.name    unsafeFloat32ReadWriteTest0600
     * @tc.number  SUB_BUILTINS_MEMORY_READWRITE_TEST_0600
     * @tc.desc    Verify unsafeMemory write and read float32 value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('unsafeFloat32ReadWriteTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const addr: long = INVALID_ADDR;
      const val: float = 3.14f;
      unsafeMemory.writeFloat32(addr, val);
      const res: float = unsafeMemory.readFloat32(addr);
      expect(res).assertEqual(val);
    });

    /**
     * @tc.name    unsafeFloat64ReadWriteTest0700
     * @tc.number  SUB_BUILTINS_MEMORY_READWRITE_TEST_0700
     * @tc.desc    Verify unsafeMemory write and read float64 value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('unsafeFloat64ReadWriteTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const addr: long = INVALID_ADDR;
      const val: double = 3.1415926535;
      unsafeMemory.writeFloat64(addr, val);
      const res: double = unsafeMemory.readFloat64(addr);
      expect(res).assertEqual(val);
    });

    /**
     * @tc.name    unsafeNumberReadWriteTest0800
     * @tc.number  SUB_BUILTINS_MEMORY_READWRITE_TEST_0800
     * @tc.desc    Verify unsafeMemory write and read number value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('unsafeNumberReadWriteTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const addr: long = INVALID_ADDR;
      const val: number = 123.456;
      unsafeMemory.writeNumber(addr, val);
      const res: number = unsafeMemory.readNumber(addr);
      expect(res).assertEqual(val);
    });

    /**
     * @tc.name    unsafeStringReadWriteTest0900
     * @tc.number  SUB_BUILTINS_MEMORY_READWRITE_TEST_0900
     * @tc.desc    Verify unsafeMemory write and read string value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('unsafeStringReadWriteTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const addr: long = INVALID_ADDR;
      const str: string = "Test_String_2026";
      const sizeInBytes: int = getStringSizeInBytes(str);
      unsafeMemory.writeString(addr, str);
      const res: string = unsafeMemory.readString(addr, sizeInBytes);
      expect(res).assertEqual(str);
    });
  });
}