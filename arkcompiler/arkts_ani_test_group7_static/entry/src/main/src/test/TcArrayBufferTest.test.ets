/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import { Foo } from '../ets/Index';

export default function TcArrayBufferTest(): void {
  describe("TcArrayBufferTest", (): void => {
    try {
      loadLibrary("entry");
    } catch (e) {
      console.log('loadFailed', e.message);
      expect(false).assertTrue();
    }

    /**
     * @tc.number SUB_TC_ARRAYBUFFER_TEST_0100
     * @tc.name testTcArrayBuffer0001
     * @tc.desc Verify that ArrayBuffer_GetInfo can read a uint32 value from ArrayBuffer data.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArrayBuffer0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let buffer = new ArrayBuffer(4);
      let view = new Uint8Array(buffer);
      view[0] = 1;
      view[1] = 2;
      view[2] = 0;
      view[3] = 0;
      expect(cls.test_ArrayBufferReadUint32(buffer)).assertEqual(513);
    });

    /**
     * @tc.number SUB_TC_ARRAYBUFFER_TEST_0200
     * @tc.name testTcArrayBuffer0002
     * @tc.desc Verify that native code can modify ArrayBuffer data and ArkTS can observe the change.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArrayBuffer0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let buffer = new ArrayBuffer(4);
      cls.test_ArrayBufferModifyUint32(buffer);
      let view = new Uint8Array(buffer);
      expect(view[0]).assertEqual(0x78);
      expect(view[1]).assertEqual(0x56);
      expect(view[2]).assertEqual(0x34);
      expect(view[3]).assertEqual(0x12);
    });

    /**
     * @tc.number SUB_TC_ARRAYBUFFER_TEST_0300
     * @tc.name testTcArrayBuffer0003
     * @tc.desc Verify that ArrayBuffer_GetInfo size matches byteLength.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArrayBuffer0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ArrayBufferGetSize(new ArrayBuffer(0))).assertEqual(0);
      expect(cls.test_ArrayBufferGetSize(new ArrayBuffer(16))).assertEqual(16);
      expect(cls.test_ArrayBufferGetSize(new ArrayBuffer(1024))).assertEqual(1024);
    });

    /**
     * @tc.number SUB_TC_ARRAYBUFFER_TEST_0400
     * @tc.name testTcArrayBuffer0004
     * @tc.desc Verify typed ArrayBuffer native signature receives a valid ArrayBuffer.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArrayBuffer0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ArrayBufferExpectBuffer(new ArrayBuffer(8))).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ARRAYBUFFER_TEST_0500
     * @tc.name testTcArrayBuffer0005
     * @tc.desc Verify ArrayBuffer_GetInfo behavior for a detached ArrayBuffer.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArrayBuffer0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let buffer = new ArrayBuffer(4);
      expect(cls.test_ArrayBufferDetached(buffer)).assertFalse();
    });

    /**
     * @tc.number SUB_TC_ARRAYBUFFER_TEST_0600
     * @tc.name testTcArrayBuffer0006
     * @tc.desc Verify that native code can read raw bytes written through TypedArray views.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArrayBuffer0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let buffer = new ArrayBuffer(4);
      let view = new Uint8Array(buffer);
      view[0] = 1;
      view[1] = 2;
      view[2] = 3;
      view[3] = 4;
      expect(cls.test_ArrayBufferReadRawBytes(buffer)).assertEqual(10);
    });

    /**
     * @tc.number SUB_TC_ARRAYBUFFER_TEST_0700
     * @tc.name testTcArrayBuffer0007
     * @tc.desc Verify that native byte modification is visible immediately from ArkTS TypedArray.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArrayBuffer0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let buffer = new ArrayBuffer(4);
      let view = new Uint8Array(buffer);
      expect(cls.test_ArrayBufferModifyByte(buffer, 0, 0xFF)).assertTrue();
      expect(view[0]).assertEqual(0xFF);
    });

    /**
     * @tc.number SUB_TC_ARRAYBUFFER_TEST_0800
     * @tc.name testTcArrayBuffer0008
     * @tc.desc Verify native bounds checking before writing ArrayBuffer data.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArrayBuffer0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let buffer = new ArrayBuffer(4);
      expect(cls.test_ArrayBufferWriteWithBoundsCheck(buffer, 2, 100)).assertTrue();
      expect(cls.test_ArrayBufferWriteWithBoundsCheck(buffer, 5, 100)).assertFalse();
    });

    /**
     * @tc.number SUB_TC_ARRAYBUFFER_TEST_0900
     * @tc.name testTcArrayBuffer0009
     * @tc.desc Verify ArrayBuffer_GetInfo on a zero-size ArrayBuffer without dereferencing the pointer.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArrayBuffer0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ArrayBufferZeroSize(new ArrayBuffer(0))).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ARRAYBUFFER_TEST_1000
     * @tc.name testTcArrayBuffer0010
     * @tc.desc Verify that the C++ native function uses ani_arraybuffer instead of ani_object.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArrayBuffer0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ArrayBufferTypedSignature(new ArrayBuffer(4))).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ARRAYBUFFER_TEST_1100
     * @tc.name testTcArrayBuffer0011
     * @tc.desc Verify saved ArrayBuffer data pointer behavior across native calls while buffer remains referenced.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArrayBuffer0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let buffer = new ArrayBuffer(4);
      let view = new Uint8Array(buffer);
      view[0] = 77;
      expect(cls.test_ArrayBufferSaveDataPointer(buffer)).assertTrue();
      expect(cls.test_ArrayBufferUseSavedPointer()).assertEqual(77);
    });

    /**
     * @tc.number SUB_TC_ARRAYBUFFER_TEST_1200
     * @tc.name testTcArrayBuffer0012
     * @tc.desc Verify that native code can create ArrayBuffer and return it to ArkTS.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArrayBuffer0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let buffer = cls.test_ArrayBufferCreateNative(4);
      let view = new Uint8Array(buffer);
      expect(view[0]).assertEqual(0);
      expect(view[1]).assertEqual(1);
      expect(view[2]).assertEqual(2);
      expect(view[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_TC_ARRAYBUFFER_TEST_1300
     * @tc.name testTcArrayBuffer0013
     * @tc.desc Verify native access to a large ArrayBuffer.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArrayBuffer0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let buffer = new ArrayBuffer(1024 * 1024);
      expect(cls.test_ArrayBufferLargeBuffer(buffer)).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ARRAYBUFFER_TEST_1400
     * @tc.name testTcArrayBuffer0014
     * @tc.desc Verify multiple native threads write to the same ArrayBuffer using atomic operations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArrayBuffer0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let buffer = new ArrayBuffer(4);
      expect(cls.test_ArrayBufferMultiThreadWrite(buffer, 4, 1000)).assertEqual(4000);
    });

    /**
     * @tc.number SUB_TC_ARRAYBUFFER_TEST_1500
     * @tc.name testTcArrayBuffer0015
     * @tc.desc Verify ArrayBuffer_GetInfo result pointer can be used as uint8_t pointer for byte operations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArrayBuffer0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let buffer = new ArrayBuffer(256);
      expect(cls.test_ArrayBufferFillBytes(buffer)).assertTrue();
      let view = new Uint8Array(buffer);
      expect(view[0]).assertEqual(0);
      expect(view[1]).assertEqual(1);
      expect(view[255]).assertEqual(255);
    });

    /**
     * @tc.number SUB_TC_ARRAYBUFFER_TEST_1600
     * @tc.name testTcArrayBuffer0016
     * @tc.desc Verify TypedArray buffer shares the same memory modified by native code.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArrayBuffer0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let typed = new Uint8Array(4);
      expect(cls.test_ArrayBufferModifyTypedArrayBuffer(typed.buffer)).assertTrue();
      expect(typed[0]).assertEqual(0xAB);
    });

    /**
     * @tc.number SUB_TC_ARRAYBUFFER_TEST_1700
     * @tc.name testTcArrayBuffer0017
     * @tc.desc Verify native access to empty ArrayBuffer does not crash.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArrayBuffer0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ArrayBufferEmptyNoCrash(new ArrayBuffer(0))).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ARRAYBUFFER_TEST_1800
     * @tc.name testTcArrayBuffer0018
     * @tc.desc Verify native reading of uint32 data from an unaligned offset in ArrayBuffer.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArrayBuffer0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let buffer = new ArrayBuffer(5);
      let view = new Uint8Array(buffer);
      view[1] = 1;
      view[2] = 2;
      view[3] = 0;
      view[4] = 0;
      expect(cls.test_ArrayBufferReadUnalignedUint32(buffer)).assertEqual(513);
    });
  });
}
