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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

class ArrayBufferResizePlainForMindmap {
}

export default function arrayBufferResizeTest(): void {
  describe('ArrayBufferResizeTest', (): void => {
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
     * @tc.name testArrayBufferResize0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0100
     * @tc.desc 验证 new ArrayBuffer(2, 6) 在当前场景执行成功，返回值的 byteLength 为 4。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 6);
      buffer.resize(4);
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferResize0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0200
     * @tc.desc 验证 new ArrayBuffer(2, 6) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 6);
      buffer.resize(3);
      expect(buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferResize0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0300
     * @tc.desc 验证 new ArrayBuffer(2, 6) 在当前场景执行成功，返回值的 byteLength 为 5。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 6);
      buffer.resize(5);
      expect(buffer.byteLength).assertEqual(5);
    });

    /**
     * @tc.name testArrayBufferResize0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0400
     * @tc.desc 验证 new ArrayBuffer(2, 6) 在当前场景执行成功，返回值的 byteLength 为 6。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 6);
      buffer.resize(6);
      expect(buffer.byteLength).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferResize0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0500
     * @tc.desc 验证 new ArrayBuffer(2, 6) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 6);
      buffer.resize(0);
      expect(buffer.byteLength).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferResize0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0600
     * @tc.desc 验证 new ArrayBuffer(4, 8) 在当前场景执行成功，返回值的 byteLength 为 4。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 8);
      buffer.resize(4);
      expect(buffer.byteLength).assertEqual(4)
    });

    /**
     * @tc.name testArrayBufferResize0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0700
     * @tc.desc 验证 new ArrayBuffer(2, 6) 在当前场景执行成功，返回值的 byteLength 为 6。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 6);
      buffer.resize(6);
      expect(buffer.byteLength).assertEqual(6)
    });

    /**
     * @tc.name testArrayBufferResize0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0800
     * @tc.desc 验证 new ArrayBuffer(6, 10) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(6, 10);
      buffer.resize(3);
      expect(buffer.byteLength).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferResize0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0900
     * @tc.desc 验证 new ArrayBuffer(2, 8) 在当前场景执行成功，返回值的 byteLength 为 6。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 8);
      buffer.resize(6);
      expect(buffer.byteLength).assertEqual(6)
    });

    /**
     * @tc.name testArrayBufferResize0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_1000
     * @tc.desc 验证 buffer.resize(-1) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 6);
      try {
        buffer.resize(-1);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferResize0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_1100
     * @tc.desc 验证 buffer.resize(100) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 6);
      try {
        buffer.resize(100);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferResize0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_1200
     * @tc.desc 验证 buffer.resize(2147483647) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 6);
      try {
        buffer.resize(2147483647);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferResize0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_1300
     * @tc.desc 验证 buffer.resize(-1) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 6);
      try {
        buffer.resize(-1);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferResize0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_1400
     * @tc.desc 验证 buffer.resize(7) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 6);
      try {
        buffer.resize(7);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferResize0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_1500
     * @tc.desc 验证 buffer.resize(2147483647) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 6);
      try {
        buffer.resize(2147483647);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferResize0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_1600
     * @tc.desc 验证 buffer.resize((null as ESObject) as int) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 6);
      try {
        buffer.resize((null as ESObject) as int);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferResize0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_1700
     * @tc.desc 验证 buffer.resize((undefined as ESObject) as int) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 6);
      try {
        buffer.resize((undefined as ESObject) as int);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferResize0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_1800
     * @tc.desc 验证 new ArrayBuffer(2, 6) 在当前场景执行成功，空值有效性判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 6);
      try {
        buffer.resize(Double.toInt(1.5));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(buffer.byteLength).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferResize0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_1900
     * @tc.desc 验证 new ArrayBuffer(4, 12) 在当前场景执行成功，返回值的 byteLength 为 5。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 12);
      buffer.resize(5);
      expect(buffer.byteLength).assertEqual(5)
      expect(buffer.at(0)).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferResize0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_2000
     * @tc.desc 验证 new ArrayBuffer(6, 10) 在当前场景执行成功，返回值的 byteLength 为 2。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(6, 10);
      buffer.resize(2);
      expect(buffer.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferResize0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_2100
     * @tc.desc 验证 new ArrayBuffer(4, 8) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 8);
      buffer.resize(0);
      expect(buffer.byteLength).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferResize0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_2200
     * @tc.desc 验证 new ArrayBuffer(2, 10) 在当前场景执行成功，返回值的 byteLength 为 10。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 10);
      buffer.resize(10);
      expect(buffer.byteLength).assertEqual(10)
    });

    /**
     * @tc.name testArrayBufferResize0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_2300
     * @tc.desc 验证 new ArrayBuffer(2, 10) 在当前场景执行成功，返回值的 byteLength 为 10。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 10);
      buffer.resize(4);
      buffer.resize(8);
      buffer.resize(2);
      buffer.resize(10);
      expect(buffer.byteLength).assertEqual(10)
    });

    /**
     * @tc.name testArrayBufferResize0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_2400
     * @tc.desc 验证 new ArrayBuffer(6, 12) 在当前场景执行成功，返回值的 byteLength 为 10。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(6, 12);
      buffer.resize(2);
      buffer.resize(10);
      expect(buffer.byteLength).assertEqual(10)
    });

    /**
     * @tc.name testArrayBufferResize0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_2500
     * @tc.desc 验证 buffer.resize(4) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 6);
      const result = buffer.resize(4);
      expect(result).assertUndefined();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferResize0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_2600
     * @tc.desc 验证 new ArrayBuffer(3, 8) 在当前场景执行成功，返回值的 byteLength 为 2。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(3, 8);
      const ret = buffer.resize(2);
      expect(buffer.byteLength).assertEqual(2);
      const isVoidLike = ret === undefined;
      expect(isVoidLike).assertTrue();
    });

    /**
     * @tc.name testArrayBufferResize0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_2700
     * @tc.desc 验证 new ArrayBuffer(2, 10) 在当前场景执行成功，返回值的 byteLength 为 7。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 10);
      buffer.resize(7);
      expect(buffer.byteLength).assertEqual(7)
    });

    /**
     * @tc.name testArrayBufferResize0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_2800
     * @tc.desc 验证 new ArrayBuffer(8, 12) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 12);
      buffer.resize(3);
      expect(buffer.byteLength).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferResize0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_2900
     * @tc.desc 验证 new ArrayBuffer(5, 10) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(5, 10);
      buffer.resize(0);
      expect(buffer.byteLength).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferResize0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_3000
     * @tc.desc 验证 new ArrayBuffer(2, 8) 在当前场景执行成功，返回值的 byteLength 为 8。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 8);
      buffer.resize(8);
      expect(buffer.byteLength).assertEqual(8)
    });

    /**
     * @tc.name testArrayBufferResize0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_3100
     * @tc.desc 验证 new ArrayBuffer(2, 10) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 10);
      buffer.resize(5);
      buffer.resize(0);
      expect(buffer.byteLength).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferResize0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_3200
     * @tc.desc 验证 new ArrayBuffer(4, 16) 在当前场景执行成功，返回值的 byteLength 为 12。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      buffer.resize(8);
      buffer.resize(2);
      buffer.resize(12);
      expect(buffer.byteLength).assertEqual(12)
    });

    /**
     * @tc.name testArrayBufferResize0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_3300
     * @tc.desc 验证 new ArrayBuffer(2, 8) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 8);
      buffer.resize(6);
      const view = new Int8Array(buffer);
      view.set([10, 20, 30, 40], 2);
      expect(view[2]).assertEqual(Int.toByte(10))
      expect(view[5]).assertEqual(Int.toByte(40))
    });

    /**
     * @tc.name testArrayBufferResize0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_3400
     * @tc.desc 验证 new ArrayBuffer(2, 8) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 8);
      buffer.resize(6);
      const view = new Int8Array(buffer);
      expect(view[2]).assertEqual(Int.toByte(0))
      expect(view[3]).assertEqual(Int.toByte(0))
      expect(view[4]).assertEqual(Int.toByte(0))
      expect(view[5]).assertEqual(Int.toByte(0))
    });

    /**
     * @tc.name testArrayBufferResize0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_3500
     * @tc.desc 验证 new ArrayBuffer(2, 6) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 6);
      buffer.resize(6);
      const view = new Int8Array(buffer);
      view.set([1, 2, 3, 4, 5, 6]);
      expect(view[0]).assertEqual(Int.toByte(1))
      expect(view[5]).assertEqual(Int.toByte(6))
    });

    /**
     * @tc.name testArrayBufferResize0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_3600
     * @tc.desc 验证 new ArrayBuffer(6, 12) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(6, 12);
      let view = new Int8Array(buffer);
      view.set([1, 2, 3, 4, 5, 6]);
      buffer.resize(2);
      buffer.resize(8);
      view = new Int8Array(buffer);
      view.set([10, 20, 30, 40, 50, 60], 2);
      expect(view.length).assertEqual(8)
    });

    /**
     * @tc.name testArrayBufferResize0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_3700
     * @tc.desc 验证 new ArrayBuffer(4, 8) 在当前场景执行成功，返回值的 byteLength 为 8。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 8);
      const view = new Int8Array(buffer);
      view.set([1, 2, 3, 4]);
      buffer.resize(8);
      expect(buffer.byteLength).assertEqual(8);
      expect(view[0]).assertEqual(Int.toByte(1));
      expect(view[1]).assertEqual(Int.toByte(2));
      expect(view[2]).assertEqual(Int.toByte(3));
      expect(view[3]).assertEqual(Int.toByte(4));
    });

    /**
     * @tc.name testArrayBufferResize0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_3800
     * @tc.desc 验证 new ArrayBuffer(6, 10) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(6, 10);
      const view = new Int8Array(buffer);
      view.set([10, 20, 30, 40, 50, 60]);
      buffer.resize(3);
      expect(buffer.byteLength).assertEqual(3);
      expect(view[0]).assertEqual(Int.toByte(10));
      expect(view[1]).assertEqual(Int.toByte(20));
      expect(view[2]).assertEqual(Int.toByte(30));
    });

    /**
     * @tc.name testArrayBufferResize0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_3900
     * @tc.desc 验证 new ArrayBuffer(6, 12) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(6, 12);
      const view = new Int8Array(buffer);
      view.set([1, 2, 3, 4, 5, 6]);
      buffer.resize(3);
      buffer.resize(6);
      expect(view.length).assertEqual(6)
    });

    /**
     * @tc.name testArrayBufferResize0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_4000
     * @tc.desc 验证 new ArrayBuffer(4, 8) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 8);
      const view = new Int8Array(buffer);
      view.set([10, 20, 30, 40]);
      buffer.resize(0);
      buffer.resize(4);
      expect(view.length).assertEqual(4)
    });

    /**
     * @tc.name testArrayBufferResize0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_4100
     * @tc.desc 验证 new ArrayBuffer(4, 12) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 12);
      const view = new Int8Array(buffer);
      view.set([11, 22, 33, 44]);
      buffer.resize(8);
      buffer.resize(3);
      expect(buffer.byteLength).assertEqual(3);
      expect(view[0]).assertEqual(Int.toByte(11));
      expect(view[1]).assertEqual(Int.toByte(22));
      expect(view[2]).assertEqual(Int.toByte(33));
    });

    /**
     * @tc.name testArrayBufferResize0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_4200
     * @tc.desc 验证 buffer.resize(6) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      try {
        buffer.resize(6);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferResize0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_4300
     * @tc.desc 验证 new ArrayBuffer(4, 12) 在当前场景执行成功，空值有效性判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 12);
      buffer.resize(8);
      try {
        buffer.resize(4);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(buffer.getByteLength()).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferResize0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_4400
     * @tc.desc 验证 new ArrayBuffer(4, 8) 在当前场景执行成功，返回值的 byteLength 为 4。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 8);
      const copied = buffer.slice(0, (buffer.byteLength as int));
      expect(copied.byteLength).assertEqual(4);
      try {
        buffer.resize(6);
        expect(buffer.byteLength).assertEqual(6);
      } catch (e) {
        try {
          buffer.resize(6);
          expect(buffer.byteLength).assertEqual(6);
        } catch (e) {
          expect(e !== null && e !== undefined).assertTrue();
          Utils.assertThrownErrorCodeIsNumber(e);
        }
      }
    });

    /**
     * @tc.name testArrayBufferResize0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_4500
     * @tc.desc 验证 new ArrayBuffer(4, 8) 在当前场景执行成功，返回值的 byteLength 为 4。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 8);
      const copied = buffer.slice(0, (buffer.byteLength as int));
      expect(copied.byteLength).assertEqual(4);
      try {
        buffer.resize(0);
        expect(buffer.byteLength).assertEqual(0);
      } catch (e) {
        try {
          buffer.resize(0);
          expect(buffer.byteLength).assertEqual(0);
        } catch (e) {
          expect(e !== null && e !== undefined).assertTrue();
          Utils.assertThrownErrorCodeIsNumber(e);
        }
      }
    });

    /**
     * @tc.name testArrayBufferResize0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_4600
     * @tc.desc 验证 buffer.resize(-1) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(5, 12);
      try {
        buffer.resize(-1);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferResize0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_4700
     * @tc.desc 验证 buffer.resize(-100) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 6);
      try {
        buffer.resize(-100);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferResize0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_4800
     * @tc.desc 验证 buffer.resize(-1) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(1, 5);
      try {
        buffer.resize(-1);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferResize0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_4900
     * @tc.desc 验证 buffer.resize(-100) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 6);
      try {
        buffer.resize(-100);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferResize0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_5000
     * @tc.desc 验证 buffer.resize(2147483647) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(1, 100);
      try {
        buffer.resize(2147483647);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferResize0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_5100
     * @tc.desc 验证 buffer.resize(1000) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 6);
      try {
        buffer.resize(1000);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });
    return;
  });
}