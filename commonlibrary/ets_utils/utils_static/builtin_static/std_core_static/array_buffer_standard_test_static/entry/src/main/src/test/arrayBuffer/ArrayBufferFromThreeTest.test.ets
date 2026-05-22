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

export default function arrayBufferFromThreeTest(): void {
  describe('ArrayBufferFromThreeTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });


    /**
     * @tc.name testArrayBufferFromThree0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0100
     * @tc.desc Verify result.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array([1, 2, 3]);
      const result = ArrayBuffer.from(u8);
      expect(result.byteLength).assertEqual(3);
    });
    /**
     * @tc.name testArrayBufferFromThree0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0200
     * @tc.desc Verify result.byteLength equals 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array([10, 20, 30, 40, 50]);
      const result = ArrayBuffer.from(u8);
      expect(result.byteLength).assertEqual(5);
      expect(result.at(0)).assertEqual(10);
      expect(result.at(4)).assertEqual(50);
    });
    /**
     * @tc.name testArrayBufferFromThree0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0300
     * @tc.desc Verify result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array(0);
      const result = ArrayBuffer.from(u8);
      expect(result.byteLength).assertEqual(0);
    });
    /**
     * @tc.name testArrayBufferFromThree0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0400
     * @tc.desc Verify result.byteLength equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array([255]);
      const result = ArrayBuffer.from(u8);
      expect(result.byteLength).assertEqual(1);
    });
    /**
     * @tc.name testArrayBufferFromThree0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0500
     * @tc.desc Verify 1024-byte copy preserves byteLength and sampled bytes (i % 256)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array(1024);
      for (let i: int = 0; i < 1024; i++) {
        u8[i] = i % 256;
      }
      const result = ArrayBuffer.from(u8);
      expect(result.byteLength).assertEqual(1024);
      const view = new Uint8Array(result);
      expect(view[0]).assertEqual(0);
      expect(view[255]).assertEqual(255);
      expect(view[1023]).assertEqual(255);
    });
    /**
     * @tc.name testArrayBufferFromThree0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0600
     * @tc.desc Verify from(Uint8Array subview) copies full underlying buffer with expected bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(10);
      const full = new Uint8Array(buf);
      for (let i: int = 0; i < 10; i++) {
        full[i] = i;
      }
      const u8 = new Uint8Array(buf, 3, 5);
      const result = ArrayBuffer.from(u8);
      expect(result.byteLength).assertEqual(10);
      const view = new Uint8Array(result);
      expect(view[3]).assertEqual(3);
      expect(view[7]).assertEqual(7);
    });
    /**
     * @tc.name testArrayBufferFromThree0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0700
     * @tc.desc Verify from standalone Uint8Array copies bytes 0,0,0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array([0, 0, 0]);
      const result = ArrayBuffer.from(u8);
      expect(result.byteLength).assertEqual(3);
      const view = new Uint8Array(result);
      expect(view[0]).assertEqual(0);
      expect(view[1]).assertEqual(0);
      expect(view[2]).assertEqual(0);
    });
    /**
     * @tc.name testArrayBufferFromThree0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0800
     * @tc.desc Verify from standalone Uint8Array copies bytes 255,255,255
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array([255, 255, 255]);
      const result = ArrayBuffer.from(u8);
      expect(result.byteLength).assertEqual(3);
      const view = new Uint8Array(result);
      expect(view[0]).assertEqual(255);
      expect(view[1]).assertEqual(255);
      expect(view[2]).assertEqual(255);
    });
    /**
     * @tc.name testArrayBufferFromThree0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0900
     * @tc.desc Verify ArrayBuffer.from(Utils.castToUint8Array(null as Object)) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.from(Utils.castToUint8Array(null as Object));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.name testArrayBufferFromThree0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1000
     * @tc.desc Verify ArrayBuffer.from(Utils.castToUint8Array(undefined as Object)) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.from(Utils.castToUint8Array(undefined as Object));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.name testArrayBufferFromThree0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1100
     * @tc.desc Verify ArrayBuffer.from(Utils.castToUint8Array(i8 as Object)) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i8 = new Int8Array([1, 2, 3]);
      try {
        ArrayBuffer.from(Utils.castToUint8Array(i8 as Object));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.name testArrayBufferFromThree0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1200
     * @tc.desc Verify ArrayBuffer.from(Utils.castToUint8Array("hello" as Object)) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.from(Utils.castToUint8Array("hello" as Object));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.name testArrayBufferFromThree0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1300
     * @tc.desc Verify ArrayBuffer.from(Utils.castToUint8Array(Utils.boxAsObject(badNum))) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const badNum: number = 123;
      try {
        ArrayBuffer.from(Utils.castToUint8Array(Utils.boxAsObject(badNum)));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.name testArrayBufferFromThree0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1400
     * @tc.desc Verify ArrayBuffer.from(Utils.castToUint8Array(true as Object)) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.from(Utils.castToUint8Array(true as Object));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.name testArrayBufferFromThree0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1500
     * @tc.desc Verify ArrayBuffer.from(Utils.castToUint8Array(buf as Object)) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(10);
      try {
        ArrayBuffer.from(Utils.castToUint8Array(buf as Object));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.name testArrayBufferFromThree0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1600
     * @tc.desc Verify ArrayBuffer.from(Utils.castToUint8Array(Utils.plainObject())) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.from(Utils.castToUint8Array(Utils.plainObject()));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.name testArrayBufferFromThree0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1700
     * @tc.desc Verify ArrayBuffer.from(Utils.castToUint8Array(i32 as Object)) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i32 = new Int32Array([1, 2, 3]);
      try {
        ArrayBuffer.from(Utils.castToUint8Array(i32 as Object));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.name testArrayBufferFromThree0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1800
     * @tc.desc Verify ArrayBuffer.from(Utils.castToUint8Array(f32 as Object)) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f32 = new Float32Array([1.0, 2.0, 3.0]);
      try {
        ArrayBuffer.from(Utils.castToUint8Array(f32 as Object));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.name testArrayBufferFromThree0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1900
     * @tc.desc Verify result.byteLength equals u8.length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array([1, 2, 3, 4, 5]);
      const result = ArrayBuffer.from(u8);
      expect(result.byteLength).assertEqual(u8.length);
      expect(result.byteLength).assertEqual(5);
    });
    /**
     * @tc.name testArrayBufferFromThree0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_2000
     * @tc.desc Verify result1.byteLength equals result2.byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array([1, 2, 3]);
      const result1 = ArrayBuffer.from(u8);
      const result2 = ArrayBuffer.from(u8);
      expect(result1 === result2).assertFalse();
      expect(result1.byteLength).assertEqual(result2.byteLength);
    });
    /**
     * @tc.name testArrayBufferFromThree0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_2100
     * @tc.desc Verify return value is ArrayBuffer instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array([1, 2, 3]);
      const result = ArrayBuffer.from(u8);
      expect(result instanceof ArrayBuffer).assertTrue();
    });
    /**
     * @tc.name testArrayBufferFromThree0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_2200
     * @tc.desc Verify result.at(0) returns 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array([1, 2, 3]);
      const result = ArrayBuffer.from(u8);
      expect(result.at(0)).assertEqual(1);
    });
    /**
     * @tc.name testArrayBufferFromThree0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_2300
     * @tc.desc Verify byteLength typeof is int
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array([1, 2, 3]);
      const result = ArrayBuffer.from(u8);
      expect(typeof result.byteLength === 'int').assertTrue();
    });
    /**
     * @tc.name testArrayBufferFromThree0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_2400
     * @tc.desc Verify view[0] equals 42 after resize
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array([42]);
      const result = ArrayBuffer.from(u8);
      const view = new Uint8Array(result);
      expect(view[0]).assertEqual(42);
    });
    /**
     * @tc.name testArrayBufferFromThree0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_2500
     * @tc.desc Verify view[i] equals u8[i]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array([10, 20, 30, 40, 50]);
      const result = ArrayBuffer.from(u8);
      const view = new Uint8Array(result);
      for (let i: int = 0; i < 5; i++) {
        expect(view[i]).assertEqual(u8[i]);
      }
    });
    /**
     * @tc.name testArrayBufferFromThree0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_2600
     * @tc.desc Verify buffer.at returns expected bytes at 2 indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array([100, 200, 150]);
      const result = ArrayBuffer.from(u8);
      const view = new Uint8Array(result);
      expect(view.at(0)).assertEqual(100);
      expect(view.at(-1)).assertEqual(150);
    });
    /**
     * @tc.name testArrayBufferFromThree0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_2700
     * @tc.desc Verify TypedArray view bytes match expected values after resize
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array([0, 128, 255]);
      const result = ArrayBuffer.from(u8);
      const view = new Uint8Array(result);
      expect(view[0]).assertEqual(0);
      expect(view[1]).assertEqual(128);
      expect(view[2]).assertEqual(255);
    });
    /**
     * @tc.name testArrayBufferFromThree0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_2800
     * @tc.desc Verify view[i] equals i
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array(256);
      for (let i: int = 0; i < 256; i++) {
        u8[i] = i;
      }
      const result = ArrayBuffer.from(u8);
      const view = new Uint8Array(result);
      for (let i: int = 0; i < 256; i++) {
        expect(view[i]).assertEqual(i);
      }
    });
    /**
     * @tc.name testArrayBufferFromThree0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_2900
     * @tc.desc Verify from copy is isolated when source Uint8Array is mutated
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array([1, 2, 3]);
      const result = ArrayBuffer.from(u8);
      const viewBefore = new Uint8Array(result);
      expect(viewBefore[0]).assertEqual(1);
      u8[0] = 99;
      const viewAfter = new Uint8Array(result);
      expect(viewAfter[0]).assertEqual(1);
    });
    /**
     * @tc.name testArrayBufferFromThree0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_3000
     * @tc.desc Verify u8[0] equals 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array([10, 20, 30]);
      const result = ArrayBuffer.from(u8);
      const view = new Uint8Array(result);
      view[0] = 99;
      expect(u8[0]).assertEqual(10);
    });
    /**
     * @tc.name testArrayBufferFromThree0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_3100
     * @tc.desc Verify views share the same underlying ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array([1, 2, 3]);
      const result = ArrayBuffer.from(u8);
      expect(result === u8.buffer).assertFalse();
    });
    /**
     * @tc.name testArrayBufferFromThree0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_3200
     * @tc.desc Verify view[0] equals 1 after resize
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const srcBuf = new ArrayBuffer(4);
      const u8 = new Uint8Array(srcBuf);
      u8[0] = 1;
      u8[1] = 2;
      u8[2] = 3;
      u8[3] = 4;
      const result = ArrayBuffer.from(u8);
      const otherView = new Uint8Array(srcBuf);
      otherView[0] = 100;
      const view = new Uint8Array(result);
      expect(view[0]).assertEqual(1);
    });
    /**
     * @tc.name testArrayBufferFromThree0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_3300
     * @tc.desc Verify result1.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array([1, 2, 3]);
      const result1 = ArrayBuffer.from(u8);
      expect(result1.byteLength).assertEqual(3);
      const copied = result1.slice(0, result1.byteLength);
      expect(copied.byteLength).assertEqual(3);
      const u8OnCopy = new Uint8Array(copied);
      expect(u8OnCopy.byteLength).assertEqual(3);
      const u8OnSource = new Uint8Array(result1);
      expect(u8OnSource.byteLength).assertEqual(3);
    });
    /**
     * @tc.name testArrayBufferFromThree0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_3400
     * @tc.desc Verify copied.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(3);
      const u8 = new Uint8Array(buf);
      const copied = buf.slice(0, buf.byteLength);
      expect(copied.byteLength).assertEqual(3);
      const result = ArrayBuffer.from(u8);
      expect(result instanceof ArrayBuffer).assertTrue();
      expect(result.byteLength).assertEqual(3);
    });
    /**
     * @tc.name testArrayBufferFromThree0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_3500
     * @tc.desc Verify copied.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(3);
      const u8 = new Uint8Array(buf);
      const copied = buf.slice(0, buf.byteLength);
      expect(copied.byteLength).assertEqual(3);
      const result = ArrayBuffer.from(u8);
      const view = new Uint8Array(result);
      expect(view.length).assertEqual(3);
    });
    /**
     * @tc.name testArrayBufferFromThree0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_3600
     * @tc.desc Verify ArrayBuffer.from(Utils.castToUint8Array(i16 as Object)) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i16 = new Int16Array([1, 2, 3]);
      try {
        ArrayBuffer.from(Utils.castToUint8Array(i16 as Object));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.name testArrayBufferFromThree0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_3700
     * @tc.desc Verify ArrayBuffer.from(Utils.castToUint8Array(u16 as Object)) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u16 = new Uint16Array([1, 2, 3]);
      try {
        ArrayBuffer.from(Utils.castToUint8Array(u16 as Object));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.name testArrayBufferFromThree0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_3800
     * @tc.desc Verify ArrayBuffer.from(Utils.castToUint8Array(f64 as Object)) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f64 = new Float64Array([1.0, 2.0]);
      try {
        ArrayBuffer.from(Utils.castToUint8Array(f64 as Object));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
  });
}
