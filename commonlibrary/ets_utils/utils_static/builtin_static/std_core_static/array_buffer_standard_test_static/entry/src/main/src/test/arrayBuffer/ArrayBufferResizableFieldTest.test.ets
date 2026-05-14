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

export default function arrayBufferResizableFieldTest(): void {
  describe('ArrayBufferResizableFieldTest', (): void => {
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
     * @tc.name testArrayBufferResizableField0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_0100
     * @tc.desc Verify ArrayBuffer.resizable: fixed-size buffer （ maxByteLength），resizable is false
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
     * @tc.desc Verify ArrayBuffer.resizable: fixed-size buffer （length is 0， maxByteLength），resizable is false
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
     * @tc.desc Verify ArrayBuffer.resizable: fixed-size buffer （length ），resizable is false
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
     * @tc.desc Verify ArrayBuffer.resizable: resizable buffer （ maxByteLength），resizable is true
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
     * @tc.desc Verify ArrayBuffer.resizable: resizable buffer （length is 0， maxByteLength），resizable is true
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
     * @tc.desc Verify ArrayBuffer.resizable: resizable buffer （lengthequals maxByteLength），resizable is true
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
     * @tc.desc Verify ArrayBuffer.resizable: resizable buffer （maxByteLength greater than length），resizable is true
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
     * @tc.desc Verify ArrayBuffer.resizable: empty buffer （length is 0， maxByteLength），resizable is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      expect(buffer.resizable).assertFalse();
    });

    /**
     * @tc.name testArrayBufferResizableField0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_0900
     * @tc.desc Verify ArrayBuffer.resizable: slicecreate fixed-size buffer ，resizable is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(8);
      const sliced = src.slice(0, 4);
      expect(sliced.resizable).assertFalse();
    });

    /**
     * @tc.name testArrayBufferResizableField0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_1000
     * @tc.desc Verify ArrayBuffer.resizable: slicecreate resizable buffer ，resizable is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(4, 16);
      const sliced = src.slice(1, 3);
      expect(sliced.resizable).assertTrue();
    });

    /**
     * @tc.name testArrayBufferResizableField0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_1100
     * @tc.desc Verify ArrayBuffer.resizable: multiple access resizableproperty ，return value consistent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fixed = new ArrayBuffer(4);
      expect(fixed.resizable).assertFalse();
      expect(fixed.resizable).assertFalse();
      const resizable = new ArrayBuffer(2, 8);
      expect(resizable.resizable).assertTrue();
      expect(resizable.resizable).assertTrue();
    });

    /**
     * @tc.name testArrayBufferResizableField0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_1200
     * @tc.desc Verify ArrayBuffer.resizable: fixed-size buffer returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      const result = buffer.resizable;
      expect(result).assertFalse();
    });

    /**
     * @tc.name testArrayBufferResizableField0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_1300
     * @tc.desc Verify ArrayBuffer.resizable: resizable buffer returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 8);
      const result = buffer.resizable;
      expect(result).assertTrue();
    });

    /**
     * @tc.name testArrayBufferResizableField0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_1400
     * @tc.desc Verify ArrayBuffer.resizable: length fixed-size buffer returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b1 = new ArrayBuffer(1);
      const b2 = new ArrayBuffer(100);
      const b3 = new ArrayBuffer(4096);
      expect(b1.resizable).assertFalse();
      expect(b2.resizable).assertFalse();
      expect(b3.resizable).assertFalse();
    });

    /**
     * @tc.name testArrayBufferResizableField0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_1500
     * @tc.desc Verify ArrayBuffer.resizable: maxByteLength buffer returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b1 = new ArrayBuffer(1, 2);
      const b2 = new ArrayBuffer(10, 100);
      const b3 = new ArrayBuffer(0, 4096);
      expect(b1.resizable).assertTrue();
      expect(b2.resizable).assertTrue();
      expect(b3.resizable).assertTrue();
    });

    /**
     * @tc.name testArrayBufferResizableField0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_1600
     * @tc.desc Verify ArrayBuffer.resizable: resizablereturn value type is boolean
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fixed = new ArrayBuffer(4);
      const resizable = new ArrayBuffer(2, 8);
      expect(typeof fixed.resizable).assertEqual("boolean");
      expect(typeof resizable.resizable).assertEqual("boolean");
    });

    /**
     * @tc.name testArrayBufferResizableField0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_1700
     * @tc.desc Verify ArrayBuffer.resizable: resizablereturn value equals false（not falsy ）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      expect(buffer.resizable === false).assertTrue();
      expect(buffer.resizable === 0).assertFalse();
      expect(buffer.resizable === null).assertFalse();
      expect(buffer.resizable === undefined).assertFalse();
    });

    /**
     * @tc.name testArrayBufferResizableField0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_1800
     * @tc.desc Verify ArrayBuffer.resizable: resizablereturn value equals true（not truthy ）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 8);
      expect(buffer.resizable === true).assertTrue();
      expect(buffer.resizable === 1).assertFalse();
      expect(buffer.resizable).assertTrue();
    });

    /**
     * @tc.name testArrayBufferResizableField0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_1900
     * @tc.desc Verify ArrayBuffer.resizable: === and == return value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fixed = new ArrayBuffer(4);
      const res = new ArrayBuffer(2, 8);
      expect(fixed.resizable === false).assertTrue();
      expect(res.resizable === true).assertTrue();
      expect(fixed.resizable == false).assertTrue();
      expect(res.resizable == true).assertTrue();
    });

    /**
     * @tc.name testArrayBufferResizableField0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_2000
     * @tc.desc Verify ArrayBuffer.resizable: lengthequals maxByteLength ，resizable is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 8);
      expect(buffer.resizable).assertTrue();
    });

    /**
     * @tc.name testArrayBufferResizableField0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_2100
     * @tc.desc Verify ArrayBuffer.resizable: length is 1，maxByteLength is 1，resizable is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(1, 1);
      expect(buffer.resizable).assertTrue();
    });

    /**
     * @tc.name testArrayBufferResizableField0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_2200
     * @tc.desc Verify ArrayBuffer.resizable: length is 0，maxByteLength is 1，resizable is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0, 1);
      expect(buffer.resizable).assertTrue();
    });

    /**
     * @tc.name testArrayBufferResizableField0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_2300
     * @tc.desc Verify ArrayBuffer.resizable: buffer ，resizable is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(1024, 4096);
      expect(buffer.resizable).assertTrue();
    });

    /**
     * @tc.name testArrayBufferResizableField0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_2400
     * @tc.desc Verify ArrayBuffer.resizable: resize after resizableproperty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 8);
      expect(buffer.resizable).assertTrue();
      buffer.resize(4);
      expect(buffer.resizable).assertTrue();
      buffer.resize(8);
      expect(buffer.resizable).assertTrue();
    });

    /**
     * @tc.name testArrayBufferResizableField0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_2500
     * @tc.desc Verify ArrayBuffer.resizable: fixed-size buffer byteLength is 0 ，resizable is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      expect(buffer.byteLength).assertEqual(0);
      expect(buffer.resizable).assertFalse();
    });

    /**
     * @tc.name testArrayBufferResizableField0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_2600
     * @tc.desc Verify ArrayBuffer.resizable: resizableassignment at error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      try {
          (buffer as Record<string, Object>)["resizable"] = true;
          expect(false).assertTrue();
      } catch (e) {
              expect(e !== null && e !== undefined).assertTrue();
              Utils.assertThrownErrorCodeIsNumber(e as object);
            }
    });

    /**
     * @tc.name testArrayBufferResizableField0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_2700
     * @tc.desc Verify ArrayBuffer.resizable: fixed-size buffer resizableproperty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      const before = buffer.resizable;
      try {
          Object.defineProperty(buffer, 'resizable', { value: true });
      } catch (e) {
          expect(buffer.resizable === before).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferResizableField0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_2800
     * @tc.desc Verify ArrayBuffer.resizable: buffer resizableproperty is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 8);
      const before = buffer.resizable;
      try {
          Object.defineProperty(buffer, 'resizable', { value: false });
      } catch (e) {
          expect(buffer.resizable === before).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferResizableField0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_2900
     * @tc.desc Verify ArrayBuffer.resizable: detached after access resizablereturns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.detach();
      expect(buffer.resizable).assertFalse();
    });

    /**
     * @tc.name testArrayBufferResizableField0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_3000
     * @tc.desc Verify ArrayBuffer.resizable: resizable buffer detached after access resizablereturns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 8);
      buffer.detach();
      expect(buffer.resizable).assertFalse();
    });

    /**
     * @tc.name testArrayBufferResizableField0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_3100
     * @tc.desc Verify ArrayBuffer.resizable: detached after resizable and detached before consistent （ is false）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fixed = new ArrayBuffer(4);
      expect(fixed.resizable).assertFalse();
      fixed.detach();
      expect(fixed.resizable).assertFalse();
    });

    /**
     * @tc.name testArrayBufferResizableField0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_3200
     * @tc.desc Verify ArrayBuffer.resizable: buffer detached after resizable is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 8);
      expect(buffer.resizable).assertTrue();
      buffer.detach();
      expect(buffer.resizable).assertFalse();
    });
    return;
  });
}
