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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function arrayBufferPropertyTest(): void {
  describe('ArrayBufferPropertyTest', (): void => {
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
     * @tc.name testArrayBufferProperty0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0100
     * @tc.desc Verify fixed-size ArrayBuffer constructed with length-only reports matching byteLength.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      expect(buffer.byteLength).assertEqual(4)
    });

    /**
     * @tc.name testArrayBufferProperty0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0200
     * @tc.desc Verify resizable ArrayBuffer initial byteLength equals the initial length parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(2, 8)
      expect(buffer.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferProperty0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0300
     * @tc.desc Verify empty ArrayBuffer has byteLength 0.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(0)
      expect(buffer.byteLength).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferProperty0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0400
     * @tc.desc Verify ArrayBuffer with length 0 and maxByteLength reports byteLength 0.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(0, 16)
      expect(buffer.byteLength).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferProperty0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0500
     * @tc.desc Verify ArrayBuffer constructed with number length reports byteLength after int conversion.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8 as number)
      expect(buffer.byteLength).assertEqual(8)
    });

    /**
     * @tc.name testArrayBufferProperty0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0600
     * @tc.desc Verify resizable ArrayBuffer updates byteLength after resize.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(2, 8)
      buffer.resize(6)
      expect(buffer.byteLength).assertEqual(6)
    });

    /**
     * @tc.name testArrayBufferProperty0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0700
     * @tc.desc Verify resizable ArrayBuffer resized to 0 has byteLength 0.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4, 8)
      buffer.resize(0)
      expect(buffer.byteLength).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferProperty0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0800
     * @tc.desc Verify resizable ArrayBuffer resized to maxByteLength reports matching byteLength.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(2, 8)
      buffer.resize(8)
      expect(buffer.byteLength).assertEqual(8)
    });

    /**
     * @tc.name testArrayBufferProperty0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0900
     * @tc.desc Verify ArrayBuffer.from string encoding reports byteLength equal to encoded size.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encoded = ArrayBuffer.from("ABC", "utf8")
      expect(encoded.byteLength).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferProperty0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1000
     * @tc.desc Verify ArrayBuffer.from Uint8Array reports byteLength equal to source length.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(4)
      let u8 = new Uint8Array(ab)
      let copied = ArrayBuffer.from(u8)
      expect(copied.byteLength).assertEqual(4)
    });

    /**
     * @tc.name testArrayBufferProperty0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1100
     * @tc.desc Verify slice result byteLength equals the sliced range length.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8)
      let sliced = buffer.slice(2, 6)
      expect(sliced.byteLength).assertEqual(4)
    });

    /**
     * @tc.name testArrayBufferProperty0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1200
     * @tc.desc Verify large ArrayBuffer reports correct byteLength.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(1024)
      expect(buffer.byteLength).assertEqual(1024)
    });

    /**
     * @tc.name testArrayBufferProperty0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1300
     * @tc.desc Verify newly created ArrayBuffer has detached false.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8)
      expect(buffer.detached).assertFalse()
    });

    /**
     * @tc.name testArrayBufferProperty0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1400
     * @tc.desc Verify newly created resizable ArrayBuffer has detached false.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(2, 8)
      expect(buffer.detached).assertFalse()
    });

    /**
     * @tc.name testArrayBufferProperty0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1500
     * @tc.desc Verify length-0 ArrayBuffer has detached false.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(0)
      expect(buffer.detached).assertFalse()
    });

    /**
     * @tc.name testArrayBufferProperty0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1600
     * @tc.desc Verify full-range slice leaves source not detached and yields a non-detached copy with same byteLength (ArkTS-sta ArrayBuffer has no transfer on typings; slice models copy semantics).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8)
      let copied = buffer.slice(0, 8)
      expect(buffer.detached).assertFalse()
      expect(copied.byteLength).assertEqual(8)
      expect(copied.detached).assertFalse()
    });

    /**
     * @tc.name testArrayBufferProperty0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1700
     * @tc.desc Verify slice result has detached false and expected byteLength (no transfer API on ArkTS-sta typings in this SDK).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8)
      let copied = buffer.slice(0, 8)
      expect(copied.detached).assertFalse()
      expect(copied.byteLength).assertEqual(8)
    });

    /**
     * @tc.name testArrayBufferProperty0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1800
     * @tc.desc Verify resizable ArrayBuffer stays not detached after resize.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(2, 8)
      buffer.resize(6)
      expect(buffer.detached).assertFalse()
    });

    /**
     * @tc.name testArrayBufferProperty0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1900
     * @tc.desc Verify original ArrayBuffer stays not detached after slice.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8)
      let sliced = buffer.slice(0, 4)
      expect(buffer.detached).assertFalse()
    });

    /**
     * @tc.name testArrayBufferProperty0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_2000
     * @tc.desc Verify sliced ArrayBuffer has detached false.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8)
      let sliced = buffer.slice(0, 4)
      expect(sliced.detached).assertFalse()
    });

    /**
     * @tc.name testArrayBufferProperty0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_2100
     * @tc.desc Verify fixed-size ArrayBuffer has resizable false when maxByteLength omitted.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      expect(buffer.resizable).assertFalse()
    });

    /**
     * @tc.name testArrayBufferProperty0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_2200
     * @tc.desc Verify resizable ArrayBuffer has resizable true when maxByteLength provided.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(2, 8)
      expect(buffer.resizable).assertTrue()
    });

    /**
     * @tc.name testArrayBufferProperty0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_2300
     * @tc.desc Verify resizable true when length equals maxByteLength.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4, 4)
      expect(buffer.resizable).assertTrue()
    });

    /**
     * @tc.name testArrayBufferProperty0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_2400
     * @tc.desc Verify length 0 with maxByteLength yields resizable true.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(0, 8)
      expect(buffer.resizable).assertTrue()
    });

    /**
     * @tc.name testArrayBufferProperty0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_2500
     * @tc.desc Verify length 0 without maxByteLength yields resizable false.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(0)
      expect(buffer.resizable).assertFalse()
    });

    /**
     * @tc.name testArrayBufferProperty0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_2600
     * @tc.desc Verify number length without maxByteLength yields resizable false.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4 as number)
      expect(buffer.resizable).assertFalse()
    });

    /**
     * @tc.name testArrayBufferProperty0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_2700
     * @tc.desc Verify number length with maxByteLength yields resizable true.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(2 as number, 8 as number)
      expect(buffer.resizable).assertTrue()
    });

    /**
     * @tc.name testArrayBufferProperty0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_2800
     * @tc.desc Verify resizable ArrayBuffer keeps resizable true after resize.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(2, 8)
      buffer.resize(6)
      expect(buffer.resizable).assertTrue()
    });

    /**
     * @tc.name testArrayBufferProperty0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_2900
     * @tc.desc Verify slice from resizable buffer yields non-resizable result.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(2, 8)
      let sliced = buffer.slice(0, 2)
      expect(sliced.resizable).assertFalse()
    });

    /**
     * @tc.name testArrayBufferProperty0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_3000
     * @tc.desc Verify ArrayBuffer.from result is not resizable.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encoded = ArrayBuffer.from("ABC", "utf8")
      expect(encoded.resizable).assertFalse()
    });

    /**
     * @tc.name testArrayBufferProperty0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_3100
     * @tc.desc Verify byteLength reflects constructor-specified byte count.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16)
      expect(buffer.byteLength).assertEqual(16)
    });

    /**
     * @tc.name testArrayBufferProperty0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_3200
     * @tc.desc Verify repeated byteLength reads are consistent.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8)
      let len1 = buffer.byteLength
      let len2 = buffer.byteLength
      expect(len1).assertEqual(len2)
      expect(len1).assertEqual(8)
    });

    /**
     * @tc.name testArrayBufferProperty0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_3300
     * @tc.desc Verify getByteLength matches byteLength property.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(5)
      expect(buffer.getByteLength()).assertEqual(buffer.byteLength)
      expect(buffer.byteLength).assertEqual(5)
    });

    /**
     * @tc.name testArrayBufferProperty0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_3400
     * @tc.desc Verify byteLength is assignable to int and matches expected value.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8)
      let len: int = buffer.byteLength
      expect(len).assertEqual(8)
    });

    /**
     * @tc.name testArrayBufferProperty0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_3500
     * @tc.desc Verify byteLength is non-negative.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      expect(buffer.byteLength >= 0).assertTrue()
    });

    /**
     * @tc.name testArrayBufferProperty0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_3600
     * @tc.desc Verify byteLength is an integral byte count.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8)
      expect((buffer.byteLength % 1) == 0).assertTrue()
    });

    /**
     * @tc.name testArrayBufferProperty0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_3700
     * @tc.desc Verify empty buffer byteLength is 0.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(0)
      expect(buffer.byteLength).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferProperty0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_3800
     * @tc.desc Verify minimal non-zero buffer has byteLength 1.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(1)
      expect(buffer.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferProperty0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_3900
     * @tc.desc Verify large buffer byteLength is reported correctly.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4096)
      expect(buffer.byteLength).assertEqual(4096)
    });

    /**
     * @tc.name testArrayBufferProperty0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_4000
     * @tc.desc Verify byteLength updates across multiple resize steps.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4, 16)
      expect(buffer.byteLength).assertEqual(4)
      buffer.resize(10)
      expect(buffer.byteLength).assertEqual(10)
      buffer.resize(16)
      expect(buffer.byteLength).assertEqual(16)
    });

    /**
     * @tc.name testArrayBufferProperty0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_4100
     * @tc.desc Verify byteLength is 0 after resize to 0.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4, 8)
      buffer.resize(0)
      expect(buffer.byteLength).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferProperty0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_4200
     * @tc.desc Verify new buffer detached is false.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8)
      expect(buffer.detached).assertEqual(false)
    });

    /**
     * @tc.name testArrayBufferProperty0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_4300
     * @tc.desc Verify repeated detached reads are consistent.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8)
      let d1 = buffer.detached
      let d2 = buffer.detached
      expect(d1).assertEqual(d2)
      expect(d1).assertFalse()
    });

    /**
     * @tc.name testArrayBufferProperty0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_4400
     * @tc.desc Verify detached is assignable to boolean and matches expectation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8)
      let isDetached: boolean = buffer.detached
      expect(isDetached).assertFalse()
    });

    /**
     * @tc.name testArrayBufferProperty0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_4500
     * @tc.desc Verify detached is either true or false.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8)
      expect(buffer.detached === true).assertFalse()
      expect(buffer.detached === false).assertTrue()
    });

    /**
     * @tc.name testArrayBufferProperty0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_4600
     * @tc.desc Verify empty buffer detached is false.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(0)
      expect(buffer.detached).assertFalse()
    });

    /**
     * @tc.name testArrayBufferProperty0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_4700
     * @tc.desc Verify slice keeps source and copy not detached (transfer not on ArrayBuffer type in this SDK).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8)
      let copied = buffer.slice(0, 4)
      expect(buffer.detached).assertFalse()
      expect(copied.detached).assertFalse()
    });

    /**
     * @tc.name testArrayBufferProperty0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_4800
     * @tc.desc Verify resize does not detach buffer.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(2, 8)
      buffer.resize(6)
      expect(buffer.detached).assertFalse()
    });

    /**
     * @tc.name testArrayBufferProperty0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_4900
     * @tc.desc Verify slice does not change source detached state.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8)
      let sliced = buffer.slice(0, 4)
      expect(buffer.detached).assertFalse()
      expect(sliced.detached).assertFalse()
    });

    /**
     * @tc.name testArrayBufferProperty0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_5000
     * @tc.desc Verify fixed buffer resizable is false.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      expect(buffer.resizable).assertEqual(false)
    });

    /**
     * @tc.name testArrayBufferProperty0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_5100
     * @tc.desc Verify resizable buffer reports resizable true.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(2, 8)
      expect(buffer.resizable).assertEqual(true)
    });

    /**
     * @tc.name testArrayBufferProperty0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_5200
     * @tc.desc Verify repeated resizable reads are consistent.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(2, 8)
      let r1 = buffer.resizable
      let r2 = buffer.resizable
      expect(r1).assertEqual(r2)
      expect(r1).assertTrue()
    });

    /**
     * @tc.name testArrayBufferProperty0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_5300
     * @tc.desc Verify resizable is assignable to boolean and matches expectation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(2, 8)
      let isResizable: boolean = buffer.resizable
      expect(isResizable).assertTrue()
    });

    /**
     * @tc.name testArrayBufferProperty0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_5400
     * @tc.desc Verify resizable is either true or false.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      expect(buffer.resizable === true).assertFalse()
      expect(buffer.resizable === false).assertTrue()
    });

    /**
     * @tc.name testArrayBufferProperty0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_5500
     * @tc.desc Verify empty fixed buffer resizable is false.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(0)
      expect(buffer.resizable).assertFalse()
    });

    /**
     * @tc.name testArrayBufferProperty0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_5600
     * @tc.desc Verify empty resizable buffer resizable is true.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(0, 16)
      expect(buffer.resizable).assertTrue()
    });

    /**
     * @tc.name testArrayBufferProperty0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_5700
     * @tc.desc Verify resizable remains true when length equals maxByteLength.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8, 8)
      expect(buffer.resizable).assertTrue()
    });

    /**
     * @tc.name testArrayBufferProperty0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_5800
     * @tc.desc Verify resize does not change resizable flag.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(2, 8)
      buffer.resize(6)
      expect(buffer.resizable).assertTrue()
    });

    /**
     * @tc.name testArrayBufferProperty0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_5900
     * @tc.desc Verify slice from resizable buffer is not resizable.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4, 16)
      let sliced = buffer.slice(0, 4)
      expect(sliced.resizable).assertFalse()
    });

    /**
     * @tc.name testArrayBufferProperty0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_6000
     * @tc.desc Verify ArrayBuffer.from result is not resizable.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encoded = ArrayBuffer.from("ABC", "utf8")
      expect(encoded.resizable).assertFalse()
    });

    /**
     * @tc.name testArrayBufferProperty0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_6100
     * @tc.desc Verify fixed buffer byteLength stays constant while not resizable.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8)
      expect(buffer.resizable).assertFalse()
      expect(buffer.byteLength).assertEqual(8)
    });

    /**
     * @tc.name testArrayBufferProperty0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_6200
     * @tc.desc Verify resizable buffer byteLength changes after resize.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(2, 8)
      expect(buffer.resizable).assertTrue()
      buffer.resize(6)
      expect(buffer.byteLength).assertEqual(6)
    });

    /**
     * @tc.name testArrayBufferProperty0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_6300
     * @tc.desc Verify non-detached buffer reports expected byteLength.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8)
      expect(buffer.detached).assertFalse()
      expect(buffer.byteLength).assertEqual(8)
    });

    /**
     * @tc.name testArrayBufferProperty0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_6400
     * @tc.desc Verify fixed buffer stays not detached and not resizable after full-range slice; copy byteLength matches.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      let copied = buffer.slice(0, 4)
      expect(buffer.detached).assertFalse()
      expect(buffer.resizable).assertFalse()
      expect(copied.byteLength).assertEqual(4)
    });

    /**
     * @tc.name testArrayBufferProperty0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_6500
     * @tc.desc Verify resizable source stays not detached after slice; slice copy is fixed (resizable false) with same span byteLength.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(2, 8)
      let copied = buffer.slice(0, 2)
      expect(buffer.detached).assertFalse()
      expect(buffer.resizable).assertTrue()
      expect(copied.resizable).assertFalse()
      expect(copied.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferProperty0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_6600
     * @tc.desc Verify initial triple property state for fixed buffer.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8)
      expect(buffer.byteLength).assertEqual(8)
      expect(buffer.detached).assertFalse()
      expect(buffer.resizable).assertFalse()
    });

    /**
     * @tc.name testArrayBufferProperty0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_6700
     * @tc.desc Verify initial triple property state for resizable buffer.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4, 16)
      expect(buffer.byteLength).assertEqual(4)
      expect(buffer.detached).assertFalse()
      expect(buffer.resizable).assertTrue()
    });

    /**
     * @tc.name testArrayBufferProperty0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_6800
     * @tc.desc Verify byteLength read-only observation via stable reads (ArkTS-sta cannot assign).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8)
      let len1: int = buffer.byteLength
      let len2: int = buffer.byteLength
      expect(len1).assertEqual(len2)
      expect(len1).assertEqual(8)
    });

    /**
     * @tc.name testArrayBufferProperty0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_6900
     * @tc.desc Verify fixed buffer byteLength unchanged across lifecycle reads.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8)
      let len1 = buffer.byteLength
      let len2 = buffer.byteLength
      expect(len1).assertEqual(len2)
      expect(len1).assertEqual(8)
    });

    /**
     * @tc.name testArrayBufferProperty0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_7000
     * @tc.desc Verify resizable buffer byteLength changes via resize only (property read-only).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4, 8)
      expect(buffer.byteLength).assertEqual(4)
      buffer.resize(6)
      expect(buffer.byteLength).assertEqual(6)
      // buffer.byteLength = 8 // 编译错误：byteLength是只读属性
    });

    /**
     * @tc.name testArrayBufferProperty0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_7100
     * @tc.desc Verify detached read-only observation via stable reads (ArkTS-sta cannot assign).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8)
      expect(buffer.detached).assertFalse()
      let d1: boolean = buffer.detached
      let d2: boolean = buffer.detached
      expect(d1).assertEqual(d2)
    });

    /**
     * @tc.name testArrayBufferProperty0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_7200
     * @tc.desc Verify detached stays false after slice and byte mutation on source (no transfer API on ArrayBuffer typings here).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8)
      expect(buffer.detached).assertFalse()
      let copied = buffer.slice(0, 4)
      buffer.set(0, 1 as byte)
      expect(buffer.detached).assertFalse()
      expect(copied.detached).assertFalse()
      expect(copied.byteLength).assertEqual(4)
    });

    /**
     * @tc.name testArrayBufferProperty0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_7300
     * @tc.desc Verify resizable read-only observation via stable reads (ArkTS-sta cannot assign).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      expect(buffer.resizable).assertFalse()
      let r1: boolean = buffer.resizable
      let r2: boolean = buffer.resizable
      expect(r1).assertEqual(r2)
    });

    /**
     * @tc.name testArrayBufferProperty0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_7400
     * @tc.desc Verify resizable unchanged after resize on resizable buffer.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(2, 8)
      let r1 = buffer.resizable
      buffer.resize(6)
      let r2 = buffer.resizable
      expect(r1).assertEqual(r2)
      expect(r1).assertTrue()
    });

    /**
     * @tc.name testArrayBufferProperty0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_7500
     * @tc.desc Verify resizable buffer resized to 0 has byteLength 0 and remains not detached (transfer-based zero-length source not expressible without transfer API).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8, 16)
      buffer.resize(0)
      expect(buffer.byteLength).assertEqual(0)
      expect(buffer.detached).assertFalse()
    });

    /**
     * @tc.name testArrayBufferProperty0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_7600
     * @tc.desc Verify resizable buffer resized to 0 has byteLength 0 and remains not detached.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4, 16)
      buffer.resize(0)
      expect(buffer.byteLength).assertEqual(0)
      expect(buffer.detached).assertFalse()
    });

    /**
     * @tc.name testArrayBufferProperty0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_7700
     * @tc.desc Verify partial slice leaves both source and copy not detached with expected byteLength on copy.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8)
      let copied = buffer.slice(2, 6)
      expect(buffer.detached).assertFalse()
      expect(copied.detached).assertFalse()
      expect(copied.byteLength).assertEqual(4)
    });

    /**
     * @tc.name testArrayBufferProperty0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_7800
     * @tc.desc Verify fixed buffer and its full-range slice both report resizable false.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      let copied = buffer.slice(0, 4)
      expect(buffer.resizable).assertFalse()
      expect(copied.resizable).assertFalse()
    });

    /**
     * @tc.name testArrayBufferProperty0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_7900
     * @tc.desc Verify resizable source stays resizable true while slice copy is fixed (resizable false).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(2, 8)
      let copied = buffer.slice(0, 2)
      expect(buffer.resizable).assertTrue()
      expect(copied.resizable).assertFalse()
    });

    /**
     * @tc.name testArrayBufferProperty0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_8000
     * @tc.desc Verify full-range slice copy byteLength matches original and copy is not detached.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8)
      let copied = buffer.slice(0, 8)
      expect(copied.byteLength).assertEqual(8)
      expect(copied.detached).assertFalse()
    });

    /**
     * @tc.name testArrayBufferProperty0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_8100
     * @tc.desc Verify slice from resizable buffer yields fixed copy with expected byteLength and resizable false on copy.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4, 16)
      let copied = buffer.slice(0, 4)
      expect(copied.resizable).assertFalse()
      expect(copied.byteLength).assertEqual(4)
    });

    /**
     * @tc.name testArrayBufferProperty0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_8200
     * @tc.desc Verify at with index equal to byteLength throws and buffer remains usable with expected byteLength (detached slice error path not built without transfer API).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8)
      try {
        buffer.at(8)
        expect(true).assertFail()
      } catch (error) {
        expect(error !== null && error !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(error as object)
      }
      expect(buffer.byteLength).assertEqual(8)
    });

    /**
     * @tc.name testArrayBufferProperty0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_8300
     * @tc.desc Verify resize within max on resizable buffer updates byteLength and keeps not detached (detached resize path not built without transfer API).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4, 16)
      buffer.resize(12)
      expect(buffer.byteLength).assertEqual(12)
      expect(buffer.detached).assertFalse()
      expect(buffer.resizable).assertTrue()
    });

    /**
     * @tc.name testArrayBufferProperty0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_8400
     * @tc.desc Verify resize on fixed buffer throws TypeError.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      try {
        buffer.resize(8)
        expect(true).assertFail()
      } catch (error) {
        expect(error !== null && error !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(error as object)
      }
    });

    /**
     * @tc.name testArrayBufferProperty0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_8500
     * @tc.desc Verify at with out-of-range index throws after set; byteLength preserved and in-range read matches set byte.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8)
      buffer.set(0, 65 as byte)
      try {
        buffer.at(8)
        expect(true).assertFail()
      } catch (error) {
        expect(error !== null && error !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(error as object)
      }
      expect(buffer.byteLength).assertEqual(8)
      expect(buffer.at(0)).assertEqual(65 as byte)
    });

    /**
     * @tc.name testArrayBufferProperty0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_8600
     * @tc.desc Verify set with index equal to byteLength throws and byteLength unchanged.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8)
      try {
        buffer.set(8, 65 as byte)
        expect(true).assertFail()
      } catch (error) {
        expect(error !== null && error !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(error as object)
      }
      expect(buffer.byteLength).assertEqual(8)
    });

    /**
     * @tc.name testArrayBufferProperty0087
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_8700
     * @tc.desc Verify negative length constructor throws RangeError.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let badLen: int = -1
      try {
        let buffer = new ArrayBuffer(badLen)
        expect(true).assertFail()
      } catch (error) {
        expect(error !== null && error !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(error as object)
      }
    });

    /**
     * @tc.name testArrayBufferProperty0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_8800
     * @tc.desc Verify negative maxByteLength constructor throws RangeError.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let badMax: int = -1
      try {
        let buffer = new ArrayBuffer(4, badMax)
        expect(true).assertFail()
      } catch (error) {
        expect(error !== null && error !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(error as object)
      }
    });

    /**
     * @tc.name testArrayBufferProperty0089
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_8900
     * @tc.desc Verify length greater than maxByteLength constructor throws RangeError.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buffer = new ArrayBuffer(8, 4)
        expect(true).assertFail()
      } catch (error) {
        expect(error !== null && error !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(error as object)
      }
    });

    /**
     * @tc.name testArrayBufferProperty0090
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_9000
     * @tc.desc Verify resize beyond maxByteLength throws RangeError.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(2, 8)
      try {
        buffer.resize(16)
        expect(true).assertFail()
      } catch (error) {
        expect(error !== null && error !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(error as object)
      }
    });

    /**
     * @tc.name testArrayBufferProperty0091
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_9100
     * @tc.desc Verify resize with negative length throws RangeError. OH throws std.core.RangeError; ERROR_CODE.01 uses Utils.assertThrownErrorCodeIsNumber (numeric code when present, else strict std.core simple type name via Class.getName).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(2, 8)
      try {
        buffer.resize(-1)
        expect(true).assertFail()
      } catch (error) {
        expect(error !== null && error !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(error as object)
      }
    });
    return;
  });
}
