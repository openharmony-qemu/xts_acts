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

export default function arrayBufferResizableFieldTest(): void {
  describe('ArrayBufferResizableFieldTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });


    /**
     * @tc.name testArrayBufferResizableField0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_0100
     * @tc.desc Verify resizable is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      expect(buffer.resizable).assertFalse();
    });
    /**
     * @tc.name testArrayBufferResizableField0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_0200
     * @tc.desc Verify resizable is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      expect(buffer.resizable).assertFalse();
    });
    /**
     * @tc.name testArrayBufferResizableField0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_0300
     * @tc.desc Verify resizable is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(1024);
      expect(buffer.resizable).assertFalse();
    });
    /**
     * @tc.name testArrayBufferResizableField0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_0400
     * @tc.desc Verify resizable is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 8);
      expect(buffer.resizable).assertTrue();
    });
    /**
     * @tc.name testArrayBufferResizableField0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_0500
     * @tc.desc Verify resizable is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0, 4);
      expect(buffer.resizable).assertTrue();
    });
    /**
     * @tc.name testArrayBufferResizableField0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_0600
     * @tc.desc Verify resizable is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 8);
      expect(buffer.resizable).assertTrue();
    });
    /**
     * @tc.name testArrayBufferResizableField0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_0700
     * @tc.desc Verify resizable is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(1, 1024);
      expect(buffer.resizable).assertTrue();
    });
    /**
     * @tc.name testArrayBufferResizableField0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_0800
     * @tc.desc Verify resizable is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(8);
      const sliced = src.slice(0, 4);
      expect(sliced.resizable).assertFalse();
    });
    /**
     * @tc.name testArrayBufferResizableField0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_0900
     * @tc.desc Verify sliced.resizable is false and src.resizable is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(4, 16);
      const sliced = src.slice(1, 3);
      expect(sliced.resizable).assertFalse();
      expect(src.resizable).assertTrue();
    });
    /**
     * @tc.name testArrayBufferResizableField0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_1000
     * @tc.desc Verify fixed buffer resizable is false and resizable buffer is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fixed = new ArrayBuffer(4);
      expect(fixed.resizable).assertFalse();
      const resizable = new ArrayBuffer(2, 8);
      expect(resizable.resizable).assertTrue();
    });
    /**
     * @tc.name testArrayBufferResizableField0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_1100
     * @tc.desc Verify result is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      const result = buffer.resizable;
      expect(result).assertFalse();
    });
    /**
     * @tc.name testArrayBufferResizableField0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_1200
     * @tc.desc Verify result is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 8);
      const result = buffer.resizable;
      expect(result).assertTrue();
    });
    /**
     * @tc.name testArrayBufferResizableField0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_1300
     * @tc.desc Verify fixed buffers b1, b2, and b3 resizable are all false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b1 = new ArrayBuffer(1);
      const b2 = new ArrayBuffer(100);
      const b3 = new ArrayBuffer(4096);
      expect(b1.resizable).assertFalse();
      expect(b2.resizable).assertFalse();
      expect(b3.resizable).assertFalse();
    });
    /**
     * @tc.name testArrayBufferResizableField0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_1400
     * @tc.desc Verify resizable is true and resizable is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b1 = new ArrayBuffer(1, 2);
      const b2 = new ArrayBuffer(10, 100);
      const b3 = new ArrayBuffer(0, 4096);
      expect(b1.resizable).assertTrue();
      expect(b2.resizable).assertTrue();
      expect(b3.resizable).assertTrue();
    });
    /**
     * @tc.name testArrayBufferResizableField0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_1500
     * @tc.desc Verify typeof fixed.resizable equals "boolean"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fixed = new ArrayBuffer(4);
      const resizable = new ArrayBuffer(2, 8);
      expect(typeof fixed.resizable).assertEqual("boolean");
      expect(typeof resizable.resizable).assertEqual("boolean");
    });
    /**
     * @tc.name testArrayBufferResizableField0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_1600
     * @tc.desc Verify fixed.resizable is false and res.resizable is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fixed = new ArrayBuffer(4);
      const res = new ArrayBuffer(2, 8);
      expect(fixed.resizable).assertFalse();
      expect(res.resizable).assertTrue();
    });
    /**
     * @tc.name testArrayBufferResizableField0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_1700
     * @tc.desc Verify resizable is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(1, 1);
      expect(buffer.resizable).assertTrue();
    });
    /**
     * @tc.name testArrayBufferResizableField0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_1800
     * @tc.desc Verify resizable is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0, 1);
      expect(buffer.resizable).assertTrue();
    });
    /**
     * @tc.name testArrayBufferResizableField0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_1900
     * @tc.desc Verify resizable is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(1024, 4096);
      expect(buffer.resizable).assertTrue();
    });
    /**
     * @tc.name testArrayBufferResizableField0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_2000
     * @tc.desc Verify resizable is true and resizable is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 8);
      expect(buffer.resizable).assertTrue();
      buffer.resize(4);
      expect(buffer.resizable).assertTrue();
      buffer.resize(8);
      expect(buffer.resizable).assertTrue();
    });
    /**
     * @tc.name testArrayBufferResizableField0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_2100
     * @tc.desc Verify buffer.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      expect(buffer.byteLength).assertEqual(0);
      expect(buffer.resizable).assertFalse();
    });
    /**
     * @tc.name testArrayBufferResizableField0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_2200
     * @tc.desc Verify API call throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      try {
        (buffer as Record<string, Object>)["resizable"] = true as Object;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.name testArrayBufferResizableField0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_2300
     * @tc.desc Verify API call throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      const before = buffer.resizable;
      try {
        (buffer as Record<string, Object>)["resizable"] = true as Object;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
      expect(buffer.resizable === before).assertTrue();
    });
    /**
     * @tc.name testArrayBufferResizableField0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_2400
     * @tc.desc Verify API call throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 8);
      const before = buffer.resizable;
      try {
        (buffer as Record<string, Object>)["resizable"] = false as Object;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
      expect(buffer.resizable === before).assertTrue();
    });
    /**
     * @tc.name testArrayBufferResizableField0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_2500
     * @tc.desc Verify detached is false and resizable is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 8);
      buffer.resize(0);
      expect(buffer.resizable).assertTrue();
      expect(buffer.detached).assertFalse();
    });
    /**
     * @tc.name testArrayBufferResizableField0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_2600
     * @tc.desc Verify resizable is false and r1 === r2 && r1 === false is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fixed = new ArrayBuffer(4);
      expect(fixed.resizable).assertFalse();
      expect(fixed.resizable).assertFalse();
    });
    /**
     * @tc.name testArrayBufferResizableField0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_2700
     * @tc.desc Verify resizable is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 8);
      buffer.resize(6);
      buffer.resize(0);
      expect(buffer.resizable).assertTrue();
    });
  });
}
