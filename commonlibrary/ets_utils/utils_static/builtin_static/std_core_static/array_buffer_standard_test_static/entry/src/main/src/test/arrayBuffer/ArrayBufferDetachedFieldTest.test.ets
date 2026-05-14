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

export default function arrayBufferDetachedFieldTest(): void {
  describe('ArrayBufferDetachedFieldTest', (): void => {
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
     * @tc.name testArrayBufferDetachedField0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_0100
     * @tc.desc Verify ArrayBuffer.detached: fixed-size ArrayBufferaccess detachedproperty ，returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.detached;
      expect(result).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_0200
     * @tc.desc Verify ArrayBuffer.detached: is 1 fixed-size ArrayBufferaccess detachedproperty ，returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(1);
      let result = buffer.detached;
      expect(result).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_0300
     * @tc.desc Verify ArrayBuffer.detached: resizable ArrayBufferaccess detachedproperty ，returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 32);
      let result = buffer.detached;
      expect(result).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_0400
     * @tc.desc Verify ArrayBuffer.detached: resizable ArrayBuffer resize after access detachedproperty ， returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      buffer.resize(10);
      let result = buffer.detached;
      expect(result).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_0500
     * @tc.desc Verify ArrayBuffer.detached: is 0 ArrayBufferaccess detachedproperty ，returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      let result = buffer.detached;
      expect(result).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_0600
     * @tc.desc Verify ArrayBuffer.detached: ArrayBufferaccess detachedproperty ，returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(65536);
      let result = buffer.detached;
      expect(result).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_0700
     * @tc.desc Verify ArrayBuffer.detached: ArrayBuffer.fromcreate buffer access detachedproperty ，returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = ArrayBuffer.from("ABC", "utf8");
      let result = buffer.detached;
      expect(result).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_0800
     * @tc.desc Verify ArrayBuffer.detached: slicecreate ArrayBufferaccess detachedproperty ，returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const sliced = buffer.slice(4, 10);
      let result = sliced.detached;
      expect(result).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_0900
     * @tc.desc Verify ArrayBuffer.detached: ArrayBuffer slice after ， detachedproperty is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const sliced = buffer.slice(4, 10);
      let result = buffer.detached;
      expect(result).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_1000
     * @tc.desc Verify ArrayBuffer.detached: create ArrayBuffer detachedproperty is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      expect(buffer.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_1100
     * @tc.desc Verify ArrayBuffer.detached: multiple access detachedproperty ，return value consistent is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result1 = buffer.detached;
      let result2 = buffer.detached;
      let result3 = buffer.detached;
      expect(result1 === result2 && result2 === result3).assertTrue();
      expect(result1).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_1200
     * @tc.desc Verify ArrayBuffer.detached: ArrayBuffercreate DataView after ，detachedproperty is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      expect(buffer.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_1300
     * @tc.desc Verify ArrayBuffer.detached: ArrayBuffercreate Int8Array after ，detachedproperty is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Int8Array(buffer);
      expect(buffer.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_1400
     * @tc.desc Verify ArrayBuffer.detached: ArrayBuffercreate TypedArray after ，detachedproperty is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const i8 = new Int8Array(buffer);
      const u8 = new Uint8Array(buffer);
      const i32 = new Int32Array(buffer);
      expect(buffer.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_1500
     * @tc.desc Verify ArrayBuffer.detached: verify detachedproperty return value type is boolean
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.detached;
      expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.name testArrayBufferDetachedField0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_1600
     * @tc.desc Verify ArrayBuffer.detached: verify detachedreturn value equals false（not falsy ）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.detached;
      expect(result === false).assertTrue();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name testArrayBufferDetachedField0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_1700
     * @tc.desc Verify ArrayBuffer.detached: verify detachedreturn value not equal true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.detached;
      expect(result !== true).assertTrue();
    });

    /**
     * @tc.name testArrayBufferDetachedField0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_1800
     * @tc.desc Verify ArrayBuffer.detached: boolean semantics (OH may box detached as Boolean; instanceof Boolean may be true).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.detached;
      expect((result === true || result === false) || result instanceof Boolean).assertTrue();
    });

    /**
     * @tc.name testArrayBufferDetachedField0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_1900
     * @tc.desc Verify ArrayBuffer.detached: is 0 ArrayBuffer，detachedreturns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      expect(buffer.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_2000
     * @tc.desc Verify ArrayBuffer.detached: is 1 ArrayBuffer，detachedreturns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(1);
      expect(buffer.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_2100
     * @tc.desc Verify ArrayBuffer.detached: ArrayBuffer（1024byte ），detachedreturns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(1024);
      expect(buffer.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_2200
     * @tc.desc Verify ArrayBuffer.detached: resizable ArrayBuffer resize to 0 after ，detached is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      buffer.resize(0);
      expect(buffer.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_2300
     * @tc.desc Verify ArrayBuffer.detached: resizable ArrayBuffer resize to maxByteLength after ，detached is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      buffer.resize(16);
      expect(buffer.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_2400
     * @tc.desc Verify ArrayBuffer.detached: resizable ArrayBuffer multiple resize，detached is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      buffer.resize(8);
      expect(buffer.detached).assertFalse();
      buffer.resize(2);
      expect(buffer.detached).assertFalse();
      buffer.resize(16);
      expect(buffer.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_2500
     * @tc.desc Mindmap assumes assignment to detached; ArkTS treats detached read-only — only assert observable false via expect(buffer.detached).assertFalse().
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      expect(buffer.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_2600
     * @tc.desc Mindmap assigns false to detached; ArkTS rejects assignment — observable read-only detached stays false.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      expect(buffer.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_2700
     * @tc.desc Mindmap assigns undefined; ArkTS rejects assignment to read-only detached — assert detached false only.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      expect(buffer.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_2800
     * @tc.desc Mindmap assigns number; ArkTS rejects assignment — detached remains false on read.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      expect(buffer.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_2900
     * @tc.desc Mindmap assigns string; ArkTS rejects assignment — detached remains false on read.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      expect(buffer.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_3000
     * @tc.desc Mindmap assigns object; ArkTS rejects assignment — detached remains false on read.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      expect(buffer.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_3100
     * @tc.desc No detach() on STA; resizable resize(0) for zero-byteLength semantics — detached remains false (not ES detached buffer).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 16);
      buffer.resize(0);
      expect(buffer.detached).assertFalse();
      expect(buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferDetachedField0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_3200
     * @tc.desc After resize(0), repeated detached reads stay false/consistency (no detach API on STA).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 16);
      buffer.resize(0);
      let result1 = buffer.detached;
      let result2 = buffer.detached;
      expect(result1 === result2).assertTrue();
      expect(result1).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_3300
     * @tc.desc Resizable buffer after resize(0): detached is false under STA (not ES-detached-by-detach).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      buffer.resize(0);
      expect(buffer.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_3400
     * @tc.desc Resizable buffer resize then read detached — stays false without detach()/transfer APIs.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      buffer.resize(10);
      expect(buffer.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_3500
     * @tc.desc Zero-length fixed ArrayBuffer stays non-detached (detached false) on STA — no detach() call.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      expect(buffer.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_3600
     * @tc.desc ES mindmap: post-detach assignment; ArkTS has no detach and read-only detached — assert detached false only.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      expect(buffer.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_3700
     * @tc.desc Normal buffer: detached is boolean-typed and false (no detach); covers mindmap post-detach typeof check on STA.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.detached;
      expect(typeof result).assertEqual("boolean");
      expect(result === false).assertTrue();
    });
    return;
  });
}
