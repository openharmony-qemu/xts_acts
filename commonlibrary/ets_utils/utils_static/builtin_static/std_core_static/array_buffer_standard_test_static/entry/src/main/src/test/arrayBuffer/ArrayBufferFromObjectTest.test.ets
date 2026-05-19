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

class ArrayBufferFromObjectPlainForMindmap {
}

function arrayBufferFromObjectMindmapFn(): int {
  return 1
}

export default function arrayBufferFromObjectTest(): void {
  describe('ArrayBufferFromObjectTest', (): void => {
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
     * @tc.name testArrayBufferFromObject0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0010
     * @tc.desc 验证 ArrayBuffer.fromObject("hello", "utf8", 5) 在当前场景执行成功，返回值的 byteLength 为 5。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("hello", "utf8", 5);
      expect(result.byteLength).assertEqual(5);
      expect(result.at(0)).assertEqual(Int.toByte(104));
      expect(result.at(4)).assertEqual(Int.toByte(111));
    });

    /**
     * @tc.name testArrayBufferFromObject0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0020
     * @tc.desc 验证 Utils.fromObjectWithBuffer(src, 0, 16) 在当前场景执行成功，返回值的 byteLength 为 16。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(16);
      let result = Utils.fromObjectWithBuffer(src, 0, 16);
      expect(result.byteLength).assertEqual(16);
    });

    /**
     * @tc.name testArrayBufferFromObject0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0030
     * @tc.desc 验证 ArrayBuffer.fromObject("ok", "utf8", 2) 在当前场景执行成功，返回值的 byteLength 为 2。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("ok", "utf8", 2);
      expect(result.byteLength).assertEqual(2);
      expect(result.at(0)).assertEqual(Int.toByte(111));
      expect(result.at(1)).assertEqual(Int.toByte(107));
    });

    /**
     * @tc.name testArrayBufferFromObject0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0040
     * @tc.desc 验证 ArrayBuffer.fromObject("world", "utf8", 5) 在当前场景执行成功，返回值的 byteLength 为 5。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("world", "utf8", 5);
      expect(result.byteLength).assertEqual(5);
    });

    /**
     * @tc.name testArrayBufferFromObject0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0050
     * @tc.desc 验证 ArrayBuffer.fromObject("hi", "utf8", 2) 在当前场景执行成功，返回值的 byteLength 为 2。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("hi", "utf8", 2);
      expect(result.byteLength).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferFromObject0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0060
     * @tc.desc 验证 Utils.fromObjectWithBuffer(src, 2, 8) 在当前场景执行成功，返回值的 byteLength 为 8。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(12);
      let result = Utils.fromObjectWithBuffer(src, 2, 8);
      expect(result.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferFromObject0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0070
     * @tc.desc 验证 ArrayBuffer.fromObject("test", "utf8", 4) 在当前场景执行成功，返回值的 byteLength 为 4。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("test", "utf8", 4);
      expect(result.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferFromObject0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0080
     * @tc.desc 验证 Utils.fromObjectWithBuffer(src, 0, 8) 在当前场景执行成功，返回值的 byteLength 为 8。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(8);
      let result = Utils.fromObjectWithBuffer(src, 0, 8);
      expect(result.byteLength).assertEqual(8);
      expect(result !== src).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromObject0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0090
     * @tc.desc 验证 ArrayBuffer.fromObject("hello world", "utf8", 11) 在当前场景执行成功，返回值的 byteLength 为 11。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("hello world", "utf8", 11);
      expect(result.byteLength).assertEqual(11)
    });

    /**
     * @tc.name testArrayBufferFromObject0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0100
     * @tc.desc 验证 ArrayBuffer.fromObject("", "utf8", 0) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("", "utf8", 0);
      expect(result.byteLength).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferFromObject0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0110
     * @tc.desc 验证 ArrayBuffer.fromObject("你好", "utf8", 6) 在当前场景执行成功，返回值的 byteLength 为 6。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("你好", "utf8", 6);
      expect(result.byteLength).assertEqual(6)
    });

    /**
     * @tc.name testArrayBufferFromObject0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0120
     * @tc.desc 验证 ArrayBuffer.fromObject("abc\t\n\r", "utf8", 7) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject("abc\t\n\r", "utf8", 7);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0130
     * @tc.desc 验证 ArrayBuffer.fromObject(longStr, "utf8", 10000) 在当前场景执行成功，返回值的 byteLength 为 10000。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr = "";
      for (let i: int = 0; i < 10000; i++) {
        longStr += "a";
      }
      let result = ArrayBuffer.fromObject(longStr, "utf8", 10000);
      expect(result.byteLength).assertEqual(10000)
    });

    /**
     * @tc.name testArrayBufferFromObject0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0140
     * @tc.desc 验证 Utils.fromObjectWithBuffer(src, 0, 0) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(0);
      let result = Utils.fromObjectWithBuffer(src, 0, 0);
      expect(result.byteLength).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferFromObject0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0150
     * @tc.desc 验证 Utils.fromObjectWithBuffer(src, 0, 16) 在当前场景执行成功，返回值的 byteLength 为 16。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(16);
      let result = Utils.fromObjectWithBuffer(src, 0, 16);
      expect(result.byteLength).assertEqual(16);
      expect(result.at(0)).assertEqual(Int.toByte(0));
      expect(result.at(15)).assertEqual(Int.toByte(0));
    });

    /**
     * @tc.name testArrayBufferFromObject0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0160
     * @tc.desc 验证 Utils.fromObjectWithBuffer(src, 0, 1024) 在当前场景执行成功，返回值的 byteLength 为 1024。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(1024);
      let result = Utils.fromObjectWithBuffer(src, 0, 1024);
      expect(result.byteLength).assertEqual(1024)
    });

    /**
     * @tc.name testArrayBufferFromObject0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0170
     * @tc.desc 验证 Utils.fromObjectWithBuffer(src, 0, 8) 在当前场景执行成功，返回值的 byteLength 为 8。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(8);
      let view = new Uint8Array(src);
      view[0] = 1;
      view[1] = 2;
      view[2] = 3;
      let result = Utils.fromObjectWithBuffer(src, 0, 8);
      expect(result.byteLength).assertEqual(8)
    });

    /**
     * @tc.name testArrayBufferFromObject0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0180
     * @tc.desc 验证 ArrayBuffer.fromObject((123 as number) as Object, 0, 4) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject((123 as number) as Object, 0, 4);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0190
     * @tc.desc 验证 ArrayBuffer.fromObject((0 as number) as Object, 0, 4) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject((0 as number) as Object, 0, 4);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0200
     * @tc.desc 验证 ArrayBuffer.fromObject((-1 as number) as Object, 0, 4) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject((-1 as number) as Object, 0, 4);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0210
     * @tc.desc 验证 ArrayBuffer.fromObject((3.14 as number) as Object, 0, 4) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject((3.14 as number) as Object, 0, 4);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0220
     * @tc.desc 验证 ArrayBuffer.fromObject((true as Object), 0, 4) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject((true as Object), 0, 4);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0230
     * @tc.desc 验证 ArrayBuffer.fromObject((false as Object), 0, 4) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject((false as Object), 0, 4);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0240
     * @tc.desc 验证 ArrayBuffer.fromObject((null as Object), 0, 4) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject((null as Object), 0, 4);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0250
     * @tc.desc 验证 ArrayBuffer.fromObject((undefined as Object), 0, 4) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject((undefined as Object), 0, 4);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0260
     * @tc.desc 验证 ArrayBuffer.fromObject((badArr as ESObject) as Object, 0, 4) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let badArr = new Array<number>();
      badArr.pushOne(1);
      badArr.pushOne(2);
      badArr.pushOne(3);
      try {
        ArrayBuffer.fromObject((badArr as ESObject) as Object, 0, 4);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0270
     * @tc.desc 验证 ArrayBuffer.fromObject((plain as ESObject) as Object, 0, 4) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let plain = new ArrayBufferFromObjectPlainForMindmap();
      try {
        ArrayBuffer.fromObject((plain as ESObject) as Object, 0, 4);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0280
     * @tc.desc 验证 ArrayBuffer.fromObject((arrayBufferFromObjectMindmapFn as ESObject) as Object, 0, 4) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject((arrayBufferFromObjectMindmapFn as ESObject) as Object, 0, 4);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0290
     * @tc.desc 验证 new Uint8Array(8) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr = new Uint8Array(8);
        ArrayBuffer.fromObject((arr as ESObject) as Object, 0, 8);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0300
     * @tc.desc 验证 Utils.fromObjectWithBuffer(src, 0, 16) 在当前场景执行成功，返回值的 byteLength 为 16。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(16);
      let w = new Uint8Array(src);
      w[5] = 7;
      w[6] = 8;
      let result = Utils.fromObjectWithBuffer(src, 0, 16);
      expect(result.byteLength).assertEqual(16);
      expect(result.at(5)).assertEqual(Int.toByte(7));
      expect(result.at(6)).assertEqual(Int.toByte(8));
    });

    /**
     * @tc.name testArrayBufferFromObject0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0310
     * @tc.desc 验证 Utils.fromObjectWithBuffer(src, 4, 12) 在当前场景执行成功，返回值的 byteLength 为 12。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(16);
      let result = Utils.fromObjectWithBuffer(src, 4, 12);
      expect(result.byteLength).assertEqual(12)
    });

    /**
     * @tc.name testArrayBufferFromObject0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0320
     * @tc.desc 验证 Utils.fromObjectWithBuffer(src, 15, 1) 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(16);
      let result = Utils.fromObjectWithBuffer(src, 15, 1);
      expect(result.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromObject0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0330
     * @tc.desc 验证 Utils.fromObjectWithBuffer(src, 16, 0) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(16);
      let result = Utils.fromObjectWithBuffer(src, 16, 0);
      expect(result.byteLength).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferFromObject0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0340
     * @tc.desc 验证 new ArrayBuffer(16) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, -1, 16);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0350
     * @tc.desc 验证 new ArrayBuffer(16) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, 20, 4);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0360
     * @tc.desc 验证 new ArrayBuffer(16) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, 2147483647, 4);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0370
     * @tc.desc 验证 ArrayBuffer.fromObject("hello", "utf8", 5) 在当前场景执行成功，返回值的 byteLength 为 5。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("hello", "utf8", 5);
      expect(result.byteLength).assertEqual(5)
    });

    /**
     * @tc.name testArrayBufferFromObject0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0380
     * @tc.desc 验证 ArrayBuffer.fromObject("hello", "utf-8", 5) 在当前场景执行成功，返回值的 byteLength 为 5。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("hello", "utf-8", 5);
      expect(result.byteLength).assertEqual(5)
    });

    /**
     * @tc.name testArrayBufferFromObject0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0390
     * @tc.desc 验证 ArrayBuffer.fromObject("hello", "ascii", 5) 在当前场景执行成功，返回值的 byteLength 为 5。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("hello", "ascii", 5);
      expect(result.byteLength).assertEqual(5)
    });

    /**
     * @tc.name testArrayBufferFromObject0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0400
     * @tc.desc 验证 ArrayBuffer.fromObject("hello", "invalid-encoding", 5) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject("hello", "invalid-encoding", 5);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0410
     * @tc.desc 验证 ArrayBuffer.fromObject("hello", "", 5) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject("hello", "", 5);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0420
     * @tc.desc 验证 ArrayBuffer.fromObject("hello", (null as string), 5) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject("hello", (null as string), 5);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0430
     * @tc.desc 验证 ArrayBuffer.fromObject("hello", (undefined as string), 5) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject("hello", (undefined as string), 5);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0440
     * @tc.desc 验证 ArrayBuffer.fromObject("hello", (true as string), 5) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject("hello", (true as string), 5);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0450
     * @tc.desc 验证 ArrayBuffer.fromObject("hello", (false as string), 5) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject("hello", (false as string), 5);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0460
     * @tc.desc 验证 Utils.fromObjectWithBuffer(src, Double.toInt(2.0), 8) 在当前场景执行成功，返回值的 byteLength 为 8。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(16);
      let result = Utils.fromObjectWithBuffer(src, Double.toInt(2.0), 8);
      expect(result.byteLength).assertEqual(8)
    });

    /**
     * @tc.name testArrayBufferFromObject0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0470
     * @tc.desc 验证 ArrayBuffer.fromObject(src as Object, Double.toInt(Number.NaN), 8) 在当前场景执行成功，返回值的 byteLength 为 8。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(16);
      try {
        let result = ArrayBuffer.fromObject(src as Object, Double.toInt(Number.NaN), 8);
        expect(result.byteLength).assertEqual(8);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0480
     * @tc.desc 验证 Utils.fromObjectWithBuffer(src, 0, copyLen) 在当前场景执行成功，返回值的 byteLength 为 copyLen。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const copyLen: int = 16;
      let src = new ArrayBuffer(copyLen);
      let w = new Uint8Array(src);
      w[0] = 41;
      const lastIdx: int = copyLen - 1;
      w[lastIdx] = 99;
      let result = Utils.fromObjectWithBuffer(src, 0, copyLen);
      expect(result.byteLength).assertEqual(copyLen);
      expect(result.at(0)).assertEqual(Int.toByte(41));
      expect(result.at(lastIdx)).assertEqual(Int.toByte(99));
    });

    /**
     * @tc.name testArrayBufferFromObject0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0490
     * @tc.desc 验证 Utils.fromObjectWithBuffer(src, 0, 1) 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(16);
      let result = Utils.fromObjectWithBuffer(src, 0, 1);
      expect(result.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromObject0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0500
     * @tc.desc 验证 Utils.fromObjectWithBuffer(src, 0, 0) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(16);
      let result = Utils.fromObjectWithBuffer(src, 0, 0);
      expect(result.byteLength).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferFromObject0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0510
     * @tc.desc 验证 new ArrayBuffer(16) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, 0, -1);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0520
     * @tc.desc 验证 new ArrayBuffer(16) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, 0, -100);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0530
     * @tc.desc 验证 new ArrayBuffer(16) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, 8, 20);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0540
     * @tc.desc 验证 Utils.fromObjectWithBuffer(src, 8, 8) 在当前场景执行成功，返回值的 byteLength 为 8。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(16);
      let result = Utils.fromObjectWithBuffer(src, 8, 8);
      expect(result.byteLength).assertEqual(8)
    });

    /**
     * @tc.name testArrayBufferFromObject0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0550
     * @tc.desc 验证 new ArrayBuffer(16) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, 0, 2147483647);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0560
     * @tc.desc 验证 new ArrayBuffer(16) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, 0, (null as int));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0570
     * @tc.desc 验证 new ArrayBuffer(16) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, 0, (undefined as int));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0580
     * @tc.desc 验证 new ArrayBuffer(16) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, 0, (("10" as string) as Object) as int);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0590
     * @tc.desc 验证 new ArrayBuffer(16) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, 0, (true as int));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0600
     * @tc.desc 验证 Utils.fromObjectWithBuffer(src, 0, Double.toInt(3.14)) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(16);
      try {
        let result = Utils.fromObjectWithBuffer(src, 0, Double.toInt(3.14));
        expect(result.byteLength).assertEqual(3);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0610
     * @tc.desc 验证 Utils.fromObjectWithBuffer(src, 0, Double.toInt(Number.NaN)) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(16);
      try {
        let result = Utils.fromObjectWithBuffer(src, 0, Double.toInt(Number.NaN));
        expect(result.byteLength).assertEqual(0);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0620
     * @tc.desc 验证 ArrayBuffer.fromObject("hello", "utf8", 5) 在当前场景执行成功，返回值的 byteLength 为 5。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("hello", "utf8", 5);
      expect(result.byteLength).assertEqual(5)
      expect(result.byteLength).assertEqual(5)
    });

    /**
     * @tc.name testArrayBufferFromObject0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0630
     * @tc.desc 验证 Utils.fromObjectWithBuffer(src, 0, 16) 在当前场景执行成功，返回值的 byteLength 为 16。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(16);
      let view = new Uint8Array(src);
      view[0] = 72;
      view[1] = 105;
      let result = Utils.fromObjectWithBuffer(src, 0, 16);
      expect(result.byteLength).assertEqual(16)
      expect(result.byteLength).assertEqual(16)
    });

    /**
     * @tc.name testArrayBufferFromObject0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0640
     * @tc.desc 验证 Utils.fromObjectWithBuffer(src, 4, 8) 在当前场景执行成功，返回值的 byteLength 为 8。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(16);
      let result = Utils.fromObjectWithBuffer(src, 4, 8);
      expect(result.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferFromObject0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0650
     * @tc.desc 验证 ArrayBuffer.fromObject("", "utf8", 0) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("", "utf8", 0);
      expect(result.byteLength).assertEqual(0);
      expect(result instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromObject0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0660
     * @tc.desc 验证 Utils.fromObjectWithBuffer(src, 0, 0) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(0);
      let result = Utils.fromObjectWithBuffer(src, 0, 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromObject0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0670
     * @tc.desc 验证 ArrayBuffer.fromObject("abc", "utf8", 3) 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("abc", "utf8", 3);
      expect(result instanceof ArrayBuffer).assertTrue();
      expect(result.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromObject0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0680
     * @tc.desc 验证 ArrayBuffer.fromObject("hello", "utf8", 5) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("hello", "utf8", 5);
      expect(typeof result).assertEqual("object");
    });

    /**
     * @tc.name testArrayBufferFromObject0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0690
     * @tc.desc 验证 ArrayBuffer.fromObject("hello", "utf8", 5) 在当前场景执行成功，返回值的 byteLength 为 5。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("hello", "utf8", 5);
      expect(result.getByteLength()).assertEqual(5);
      expect(result.byteLength).assertEqual(5);
      expect(result.at(3)).assertEqual(Int.toByte(108));
    });

    /**
     * @tc.name testArrayBufferFromObject0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0700
     * @tc.desc 验证 Utils.fromObjectWithBuffer(src, 0, 16) 在当前场景执行成功，等值关系判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(16);
      let result = Utils.fromObjectWithBuffer(src, 0, 16);
      expect(result !== src).assertTrue();
      expect(result.byteLength).assertEqual(16)
    });

    /**
     * @tc.name testArrayBufferFromObject0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0710
     * @tc.desc 验证 ArrayBuffer.fromObject("abc", "utf8", 3) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("abc", "utf8", 3);
      let view = new Uint8Array(result);
      expect(view[0]).assertEqual(97); // 'a'
      expect(view[1]).assertEqual(98); // 'b'
      expect(view[2]).assertEqual(99); // 'c'
    });

    /**
     * @tc.name testArrayBufferFromObject0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0720
     * @tc.desc 验证 ArrayBuffer.fromObject("你", "utf8", 3) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("你", "utf8", 3);
      let view = new Uint8Array(result);
      expect(view.length).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromObject0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0730
     * @tc.desc 验证 Utils.fromObjectWithBuffer(src, 0, 4) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(4);
      let srcView = new Uint8Array(src);
      srcView[0] = 10;
      srcView[1] = 20;
      srcView[2] = 30;
      srcView[3] = 40;
      let result = Utils.fromObjectWithBuffer(src, 0, 4);
      let resView = new Uint8Array(result);
      expect(resView[0]).assertEqual(10);
      expect(resView[1]).assertEqual(20);
      expect(resView[2]).assertEqual(30);
      expect(resView[3]).assertEqual(40);
    });

    /**
     * @tc.name testArrayBufferFromObject0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0740
     * @tc.desc 验证 Utils.fromObjectWithBuffer(src, 2, 4) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(8);
      let srcView = new Uint8Array(src);
      srcView[0] = 1;
      srcView[1] = 2;
      srcView[2] = 3;
      srcView[3] = 4;
      srcView[4] = 5;
      srcView[5] = 6;
      srcView[6] = 7;
      srcView[7] = 8;
      let result = Utils.fromObjectWithBuffer(src, 2, 4);
      let resView = new Uint8Array(result);
      expect(resView[0]).assertEqual(3);
      expect(resView[1]).assertEqual(4);
      expect(resView[2]).assertEqual(5);
      expect(resView[3]).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferFromObject0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0750
     * @tc.desc 验证 Utils.fromObjectWithBuffer(src, 0, 4) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(4);
      let srcView = new Uint8Array(src);
      srcView[0] = 100;
      let result = Utils.fromObjectWithBuffer(src, 0, 4);
      let resView = new Uint8Array(result);
      resView[0] = 200;
      expect(srcView[0]).assertEqual(100);
    });

    /**
     * @tc.name testArrayBufferFromObject0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0760
     * @tc.desc 验证 Utils.fromObjectWithBuffer(src, 0, 16) 在当前场景执行成功，返回值的 byteLength 为 16。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(32);
      let result = Utils.fromObjectWithBuffer(src, 0, 16);
      expect(result.byteLength).assertEqual(16);
    });

    /**
     * @tc.name testArrayBufferFromObject0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0770
     * @tc.desc 验证 Utils.fromObjectWithBuffer(src, 0, 0) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(16);
      let result = Utils.fromObjectWithBuffer(src, 0, 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromObject0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0780
     * @tc.desc 验证 Utils.fromObjectWithBuffer(src, 0, 8) 在当前场景执行成功，返回值的 byteLength 为 8。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(8);
      let w = new Uint8Array(src);
      w[7] = 88;
      let result = Utils.fromObjectWithBuffer(src, 0, 8);
      expect(result.byteLength).assertEqual(8);
      expect(result.at(7)).assertEqual(Int.toByte(88));
    });

    /**
     * @tc.name testArrayBufferFromObject0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0790
     * @tc.desc 验证 Utils.fromObjectWithBuffer(src, 7, 1) 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(8);
      let result = Utils.fromObjectWithBuffer(src, 7, 1);
      expect(result.byteLength).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferFromObject0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0800
     * @tc.desc 验证 Utils.fromObjectWithBuffer(src, 8, 0) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new ArrayBuffer(8);
      let result = Utils.fromObjectWithBuffer(src, 8, 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromObject0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0810
     * @tc.desc 验证 ArrayBuffer.fromObject("", "utf8", 0) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("", "utf8", 0);
      expect(result.getByteLength()).assertEqual(0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromObject0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0820
     * @tc.desc 验证 ArrayBuffer.fromObject("A", "utf8", 1) 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ArrayBuffer.fromObject("A", "utf8", 1);
      expect(result.byteLength).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferFromObject0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0830
     * @tc.desc 验证 ArrayBuffer.fromObject((42 as number) as Object, 0, 4) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject((42 as number) as Object, 0, 4);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0840
     * @tc.desc 验证 ArrayBuffer.fromObject((2.71 as number) as Object, 0, 4) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject((2.71 as number) as Object, 0, 4);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0850
     * @tc.desc 验证 ArrayBuffer.fromObject((true as Object), 0, 5) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject((true as Object), 0, 5);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0860
     * @tc.desc 验证 ArrayBuffer.fromObject((false as Object), 0, 5) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject((false as Object), 0, 5);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0087
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0870
     * @tc.desc 验证 ArrayBuffer.fromObject((new ArrayBufferFromObjectPlainForMindmap() as ESObject) as Obje... 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject((new ArrayBufferFromObjectPlainForMindmap() as ESObject) as Object, 0, 4);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0880
     * @tc.desc 验证 ArrayBuffer.fromObject((a as ESObject) as Object, 0, 4) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let a = new Array<number>();
        ArrayBuffer.fromObject((a as ESObject) as Object, 0, 4);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0089
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0890
     * @tc.desc 验证 new Uint8Array(16) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr = new Uint8Array(16);
        ArrayBuffer.fromObject((arr as ESObject) as Object, 0, 16);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0090
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0900
     * @tc.desc 验证 new ArrayBuffer(8) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(8);
        let dv = new DataView(src);
        ArrayBuffer.fromObject((dv as ESObject) as Object, 0, 8);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0091
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0910
     * @tc.desc 验证 ArrayBuffer.fromObject((arrayBufferFromObjectMindmapFn as ESObject) as Object, 0, 8) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject((arrayBufferFromObjectMindmapFn as ESObject) as Object, 0, 8);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0092
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0920
     * @tc.desc 验证 ArrayBuffer.fromObject((null as Object), 0, 8) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject((null as Object), 0, 8);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0093
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0930
     * @tc.desc 验证 ArrayBuffer.fromObject((undefined as Object), 0, 8) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject((undefined as Object), 0, 8);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0094
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0940
     * @tc.desc 验证 ArrayBuffer.fromObject("world", (null as string), 5) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject("world", (null as string), 5);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0095
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0950
     * @tc.desc 验证 ArrayBuffer.fromObject("world", (undefined as string), 5) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject("world", (undefined as string), 5);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0096
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0960
     * @tc.desc 验证 new ArrayBuffer(16) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, (null as int), 16);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0097
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0970
     * @tc.desc 验证 new ArrayBuffer(16) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, 4, (null as int));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0098
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0980
     * @tc.desc 验证 new ArrayBuffer(16) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, 4, (undefined as int));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0099
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0990
     * @tc.desc 验证 ArrayBuffer.fromObject((null as Object), (null as string), (null as int)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject((null as Object), (null as string), (null as int));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1000
     * @tc.desc 验证 ArrayBuffer.fromObject((undefined as Object), (undefined as string), (undefined as int)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject((undefined as Object), (undefined as string), (undefined as int));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0101
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1010
     * @tc.desc 验证 new ArrayBuffer(16) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, -1, 8);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0102
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1020
     * @tc.desc 验证 new ArrayBuffer(8) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(8);
        Utils.fromObjectWithBuffer(src, 100, 4);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0103
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1030
     * @tc.desc 验证 new ArrayBuffer(16) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, 0, -5);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0104
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1040
     * @tc.desc 验证 new ArrayBuffer(8) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(8);
        Utils.fromObjectWithBuffer(src, 4, 8);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0105
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1050
     * @tc.desc 验证 ArrayBuffer.fromObject("hi", "utf8", 100) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject("hi", "utf8", 100);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0106
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1060
     * @tc.desc 验证 new ArrayBuffer(16) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(16);
        Utils.fromObjectWithBuffer(src, -2147483648, 8);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromObject0107
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1070
     * @tc.desc 验证 new ArrayBuffer(8) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src = new ArrayBuffer(8);
        Utils.fromObjectWithBuffer(src, 0, 2147483647);
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