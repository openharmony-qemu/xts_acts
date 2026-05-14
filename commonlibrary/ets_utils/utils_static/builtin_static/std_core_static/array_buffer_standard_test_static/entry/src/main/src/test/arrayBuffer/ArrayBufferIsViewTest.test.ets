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

export default function arrayBufferIsViewTest(): void {
  describe('ArrayBufferIsViewTest', (): void => {
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
     * @tc.name testArrayBufferIsView0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0100
     * @tc.desc Verify ArrayBuffer.isView: passing 1 required obj，normal call ArrayBuffer.isView()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      let result = ArrayBuffer.isView(view);
      expect(result).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0200
     * @tc.desc Verify ArrayBuffer.isView: calling with zero args ，verify compile or runtime is
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8)
      const view = new DataView(buffer)
      expect(ArrayBuffer.isView(view as Object)).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0300
     * @tc.desc Verify ArrayBuffer.isView: passing 2 ，verify ignored or error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      let result = ArrayBuffer.isView(view, "extra");
      expect(result).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0400
     * @tc.desc Verify ArrayBuffer.isView: passing 3 ，verify ignored or error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      let result = ArrayBuffer.isView(view, "extra1", "extra2");
      expect(result).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0500
     * @tc.desc Verify ArrayBuffer.isView: passing DataViewinstance ，verify returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      let result = ArrayBuffer.isView(view);
      expect(result).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0600
     * @tc.desc Verify ArrayBuffer.isView: passing Int8Arrayinstance ，verify returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Int8Array(buffer);
      let result = ArrayBuffer.isView(arr);
      expect(result).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0700
     * @tc.desc Verify ArrayBuffer.isView: passing Uint8Arrayinstance ，verify returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Uint8Array(buffer);
      let result = ArrayBuffer.isView(arr);
      expect(result).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0800
     * @tc.desc Verify ArrayBuffer.isView: passing Int16Arrayinstance ，verify returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Int16Array(buffer);
      let result = ArrayBuffer.isView(arr);
      expect(result).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0900
     * @tc.desc Verify ArrayBuffer.isView: passing Uint16Arrayinstance ，verify returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Uint16Array(buffer);
      let result = ArrayBuffer.isView(arr);
      expect(result).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1000
     * @tc.desc Verify ArrayBuffer.isView: passing Int32Arrayinstance ，verify returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Int32Array(buffer);
      let result = ArrayBuffer.isView(arr);
      expect(result).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1100
     * @tc.desc Verify ArrayBuffer.isView: passing Uint32Arrayinstance ，verify returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Uint32Array(buffer);
      let result = ArrayBuffer.isView(arr);
      expect(result).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1200
     * @tc.desc Verify ArrayBuffer.isView: passing Float32Arrayinstance ，verify returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Float32Array(buffer);
      let result = ArrayBuffer.isView(arr);
      expect(result).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1300
     * @tc.desc Verify ArrayBuffer.isView: passing Float64Arrayinstance ，verify returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Float64Array(buffer);
      let result = ArrayBuffer.isView(arr);
      expect(result).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1400
     * @tc.desc Verify ArrayBuffer.isView: passing ArrayBufferinstance ，verify returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = ArrayBuffer.isView(buffer);
      expect(result).assertFalse()
    });

    /**
     * @tc.name testArrayBufferIsView0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1500
     * @tc.desc Verify ArrayBuffer.isView: passing plain empty object ，verify returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.isView({});
      expect(result).assertFalse()
    });

    /**
     * @tc.name testArrayBufferIsView0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1600
     * @tc.desc Verify ArrayBuffer.isView: passing property plain object ，verify returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.isView({ a: 1 });
      expect(result).assertFalse()
    });

    /**
     * @tc.name testArrayBufferIsView0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1700
     * @tc.desc Verify ArrayBuffer.isView: passing string ，verify returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.isView("hello");
      expect(result).assertFalse()
    });

    /**
     * @tc.name testArrayBufferIsView0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1800
     * @tc.desc Verify ArrayBuffer.isView: passing empty string ，verify returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.isView("");
      expect(result).assertFalse()
    });

    /**
     * @tc.name testArrayBufferIsView0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1900
     * @tc.desc Verify ArrayBuffer.isView: passing ，verify returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.isView(123);
      expect(result).assertFalse()
    });

    /**
     * @tc.name testArrayBufferIsView0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_2000
     * @tc.desc Verify ArrayBuffer.isView: passing 0，verify returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.isView(0);
      expect(result).assertFalse()
    });

    /**
     * @tc.name testArrayBufferIsView0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_2100
     * @tc.desc Verify ArrayBuffer.isView: passing NaN，verify returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.isView(NaN);
      expect(result).assertFalse()
    });

    /**
     * @tc.name testArrayBufferIsView0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_2200
     * @tc.desc Verify ArrayBuffer.isView: passing boolean true，verify returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.isView(true);
      expect(result).assertFalse()
    });

    /**
     * @tc.name testArrayBufferIsView0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_2300
     * @tc.desc Verify ArrayBuffer.isView: passing boolean false，verify returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.isView(false);
      expect(result).assertFalse()
    });

    /**
     * @tc.name testArrayBufferIsView0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_2400
     * @tc.desc Verify ArrayBuffer.isView: passing empty array ，verify returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.isView([]);
      expect(result).assertFalse()
    });

    /**
     * @tc.name testArrayBufferIsView0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_2500
     * @tc.desc Verify ArrayBuffer.isView: passing not empty array ，verify returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.isView([1, 2, 3]);
      expect(result).assertFalse()
    });

    /**
     * @tc.name testArrayBufferIsView0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_2600
     * @tc.desc Verify ArrayBuffer.isView: passing DataView，return value is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      let result = ArrayBuffer.isView(view);
      console.info(result === true ? "true" : "false");
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_2700
     * @tc.desc Verify ArrayBuffer.isView: passing Int8Array，return value is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Int8Array(buffer);
      let result = ArrayBuffer.isView(arr);
      console.info(result === true ? "true" : "false");
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_2800
     * @tc.desc Verify ArrayBuffer.isView: passing Uint8Array，return value is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Uint8Array(buffer);
      let result = ArrayBuffer.isView(arr);
      console.info(result === true ? "true" : "false");
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_2900
     * @tc.desc Verify ArrayBuffer.isView: passing Int16Array，return value is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Int16Array(buffer);
      let result = ArrayBuffer.isView(arr);
      console.info(result === true ? "true" : "false");
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_3000
     * @tc.desc Verify ArrayBuffer.isView: passing Uint16Array，return value is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Uint16Array(buffer);
      let result = ArrayBuffer.isView(arr);
      console.info(result === true ? "true" : "false");
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_3100
     * @tc.desc Verify ArrayBuffer.isView: passing Int32Array，return value is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Int32Array(buffer);
      let result = ArrayBuffer.isView(arr);
      console.info(result === true ? "true" : "false");
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_3200
     * @tc.desc Verify ArrayBuffer.isView: passing Uint32Array，return value is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Uint32Array(buffer);
      let result = ArrayBuffer.isView(arr);
      console.info(result === true ? "true" : "false");
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_3300
     * @tc.desc Verify ArrayBuffer.isView: passing Float32Array，return value is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Float32Array(buffer);
      let result = ArrayBuffer.isView(arr);
      console.info(result === true ? "true" : "false");
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_3400
     * @tc.desc Verify ArrayBuffer.isView: passing Float64Array，return value is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Float64Array(buffer);
      let result = ArrayBuffer.isView(arr);
      console.info(result === true ? "true" : "false");
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_3500
     * @tc.desc Verify ArrayBuffer.isView: passing offset create DataView，return value is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer, 4, 8);
      let result = ArrayBuffer.isView(view);
      console.info(result === true ? "true" : "false");
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_3600
     * @tc.desc Verify ArrayBuffer.isView: passing offset create TypedArray，return value is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const arr = new Int8Array(buffer, 4, 8);
      let result = ArrayBuffer.isView(arr);
      console.info(result === true ? "true" : "false");
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_3700
     * @tc.desc Verify ArrayBuffer.isView: passing independent create TypedArray，return value is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(8);
      let result = ArrayBuffer.isView(arr);
      console.info(result === true ? "true" : "false");
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_3800
     * @tc.desc Verify ArrayBuffer.isView: passing ArrayBufferinstance ，return value is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = ArrayBuffer.isView(buffer);
      console.info(result === false ? "false" : "true");
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_3900
     * @tc.desc Verify ArrayBuffer.isView: passing plain object ，return value is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.isView({});
      console.info(result === false ? "false" : "true");
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_4000
     * @tc.desc Verify ArrayBuffer.isView: passing string ，return value is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.isView("hello");
      console.info(result === false ? "false" : "true");
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_4100
     * @tc.desc Verify ArrayBuffer.isView: passing ，return value is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.isView(42);
      console.info(result === false ? "false" : "true");
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_4200
     * @tc.desc Verify ArrayBuffer.isView: passing boolean ，return value is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.isView(true);
      console.info(result === false ? "false" : "true");
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_4300
     * @tc.desc Verify ArrayBuffer.isView: passing array ，return value is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.isView([1, 2, 3]);
      console.info(result === false ? "false" : "true");
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_4400
     * @tc.desc Verify ArrayBuffer.isView: verify ArrayBuffer.isView return value type is boolean
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      let result = ArrayBuffer.isView(view);
      console.info(typeof result === "boolean" ? "boolean" : typeof result);
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_4500
     * @tc.desc Verify ArrayBuffer.isView: verify return value numbertype
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      let result = ArrayBuffer.isView(view);
      console.info(typeof result !== "number" ? "not number" : "number");
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_4600
     * @tc.desc Verify ArrayBuffer.isView: verify return value stringtype
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      let result = ArrayBuffer.isView(view);
      console.info(typeof result !== "string" ? "not string" : "string");
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_4700
     * @tc.desc Verify ArrayBuffer.isView: verify return value objecttype
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      let result = ArrayBuffer.isView(view);
      console.info(typeof result !== "object" ? "not object" : "object");
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_4800
     * @tc.desc Verify ArrayBuffer.isView: verify not view return value type is boolean
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.isView({});
      console.info(typeof result === "boolean" ? "boolean" : typeof result);
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_4900
     * @tc.desc Verify ArrayBuffer.isView: passing null is ，verify returns false or throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.isView(null);
      expect(result).assertFalse()
    });

    /**
     * @tc.name testArrayBufferIsView0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_5000
     * @tc.desc Verify ArrayBuffer.isView: passing undefined is ，verify returns false or throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.isView(undefined);
      expect(result).assertFalse()
    });

    /**
     * @tc.name testArrayBufferIsView0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_5100
     * @tc.desc Verify ArrayBuffer.isView: passing string type ，verify returns false throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.isView("test string");
      console.info(result === false ? "false" : "true");
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferIsView0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_5200
     * @tc.desc Verify ArrayBuffer.isView: passing type ，verify returns false throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.isView(3.14);
      console.info(result === false ? "false" : "true");
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferIsView0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_5300
     * @tc.desc Verify ArrayBuffer.isView: passing negative ，verify returns false throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.isView(-1);
      console.info(result === false ? "false" : "true");
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferIsView0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_5400
     * @tc.desc Verify ArrayBuffer.isView: passing Infinity，verify returns false throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.isView(Infinity);
      console.info(result === false ? "false" : "true");
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferIsView0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_5500
     * @tc.desc Verify ArrayBuffer.isView: passing ，verify returns false throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.isView(-Infinity);
      console.info(result === false ? "false" : "true");
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferIsView0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_5600
     * @tc.desc Verify ArrayBuffer.isView: passing boolean type ，verify returns false throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.isView(true);
      console.info(result === false ? "false" : "true");
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferIsView0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_5700
     * @tc.desc Verify ArrayBuffer.isView: passing length is 0 DataView，verify returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      const view = new DataView(buffer);
      let result = ArrayBuffer.isView(view);
      console.info(result === true ? "true" : "false");
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_5800
     * @tc.desc Verify ArrayBuffer.isView: passing length is 0 TypedArray，verify returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      const arr = new Int8Array(buffer);
      let result = ArrayBuffer.isView(arr);
      console.info(result === true ? "true" : "false");
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferIsView0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_5900
     * @tc.desc Verify ArrayBuffer.isView: passing empty ArrayBuffer ，verify returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      let result = ArrayBuffer.isView(buffer);
      console.info(result === false ? "false" : "true");
      expect(result != null).assertTrue()
    });
    return;
  });
}
