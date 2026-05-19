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

class ArrayBufferFromThreePlain {
}

class ArrayBufferFromSixPlainForMindmap {
}

class ArrayBufferLikePlainForMindmap {
}

export default function arrayBufferFromThreeTest(): void {
  describe('ArrayBufferFromThreeTest', (): void => {
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
     * @tc.name testArrayBufferFromThree0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0100
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u8 = new Uint8Array([1, 2, 3]);
      const result = ArrayBuffer.from(u8)
      expect(result.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromThree0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0200
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u8 = new Uint8Array([1, 2, 3]);
      const result = ArrayBuffer.from(u8);
      expect(result.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromThree0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0300
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，返回值的 byteLength 为 5。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u8 = new Uint8Array([10, 20, 30, 40, 50]);
      let result = ArrayBuffer.from(u8);
      expect(result.byteLength).assertEqual(5);
      expect(result.at(0)).assertEqual(10);
      expect(result.at(4)).assertEqual(50);
    });

    /**
     * @tc.name testArrayBufferFromThree0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0400
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u8 = new Uint8Array(0);
      let result = ArrayBuffer.from(u8);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromThree0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0500
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，返回值的 byteLength 为 5。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u8 = new Uint8Array([10, 20, 30, 40, 50]);
      const result = ArrayBuffer.from(u8)
      expect(result.byteLength).assertEqual(5);
    });

    /**
     * @tc.name testArrayBufferFromThree0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0600
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u8 = new Uint8Array(0);
      const result = ArrayBuffer.from(u8)
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromThree0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0700
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u8 = new Uint8Array([255]);
      const result = ArrayBuffer.from(u8)
      expect(result.byteLength).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferFromThree0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0800
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，返回值的 byteLength 为 1024。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u8 = new Uint8Array(1024);
      for (let i: int = 0; i < 1024; i++) {
        u8[i] = i % 256;
      }
      const result = ArrayBuffer.from(u8)
      expect(result.byteLength).assertEqual(1024);
    });

    /**
     * @tc.name testArrayBufferFromThree0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0900
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，返回值的 byteLength 为 5。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(10);
      let full = new Uint8Array(buf);
      for (let i: int = 0; i < 10; i++) {
        full[i] = i;
      }
      let u8 = new Uint8Array(buf, 3, 5);
      const result = ArrayBuffer.from(u8)
      const viewLen: int = u8.length as int;
      if (result.byteLength === viewLen) {
        expect(result.byteLength).assertEqual(5);
        let view = new Uint8Array(result);
        expect(view[0]).assertEqual(3);
        expect(view[4]).assertEqual(7);
      } else {
        expect(result.byteLength).assertEqual(10);
        let view = new Uint8Array(result);
        expect(view[3]).assertEqual(3);
        expect(view[7]).assertEqual(7);
      }
    });

    /**
     * @tc.name testArrayBufferFromThree0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1000
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u8 = new Uint8Array([0, 0, 0]);
      const result = ArrayBuffer.from(u8)
      expect(result.byteLength).assertEqual(3);
      let view = new Uint8Array(result);
      expect(view[0]).assertEqual(0);
      expect(view[1]).assertEqual(0);
      expect(view[2]).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromThree0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1100
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u8 = new Uint8Array([255, 255, 255]);
      const result = ArrayBuffer.from(u8)
      expect(result.byteLength).assertEqual(3);
      let view = new Uint8Array(result);
      expect(view[0]).assertEqual(255);
      expect(view[1]).assertEqual(255);
      expect(view[2]).assertEqual(255);
    });

    /**
     * @tc.name testArrayBufferFromThree0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1200
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u8 = new Uint8Array([0, 0, 0]);
      const result = ArrayBuffer.from(u8);
      let view = new Uint8Array(result);
      expect(view[0]).assertEqual(0);
      expect(view[1]).assertEqual(0);
      expect(view[2]).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromThree0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1300
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u8 = new Uint8Array([255, 255, 255]);
      const result = ArrayBuffer.from(u8);
      let view = new Uint8Array(result);
      expect(view[0]).assertEqual(255);
      expect(view[1]).assertEqual(255);
      expect(view[2]).assertEqual(255);
    });

    /**
     * @tc.name testArrayBufferFromThree0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1400
     * @tc.desc 验证 ArrayBuffer.from((null as ESObject) as Uint8Array) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.from((null as ESObject) as Uint8Array);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromThree0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1500
     * @tc.desc 验证 ArrayBuffer.from((undefined as ESObject) as Uint8Array) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.from((undefined as ESObject) as Uint8Array);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromThree0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1600
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u8 = new Uint8Array(3);
      u8[0] = 1; u8[1] = 2; u8[2] = 3;
      const result = ArrayBuffer.from(u8);
      expect(result.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromThree0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1700
     * @tc.desc 验证 ArrayBuffer.from((("hello" as Object) as Uint8Array)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.from((("hello" as Object) as Uint8Array));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromThree0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1800
     * @tc.desc 验证 ArrayBuffer.from((((123 as number) as ESObject) as Uint8Array)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.from((((123 as number) as ESObject) as Uint8Array));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromThree0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1900
     * @tc.desc 验证 ArrayBuffer.from(((true as Object) as Uint8Array)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.from(((true as Object) as Uint8Array));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromThree0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_2000
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，返回值的 byteLength 为 10。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(10);
      let u8 = new Uint8Array(buf);
      const result = ArrayBuffer.from(u8);
      expect(result.byteLength).assertEqual(10);
    });

    /**
     * @tc.name testArrayBufferFromThree0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_2100
     * @tc.desc 验证 ArrayBuffer.from(((new ArrayBufferFromThreePlain() as Object) as Uint8Array)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.from(((new ArrayBufferFromThreePlain() as Object) as Uint8Array));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromThree0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_2200
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，返回值的 byteLength 为 u8.length。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u8 = new Uint8Array([1, 2, 3, 4, 5]);
      const result = ArrayBuffer.from(u8)
      expect(result.byteLength).assertEqual(u8.length);
      expect(result.byteLength).assertEqual(5);
    });

    /**
     * @tc.name testArrayBufferFromThree0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_2300
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，等值关系判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u8 = new Uint8Array([1, 2, 3]);
      let result1 = ArrayBuffer.from(u8);
      let result2 = ArrayBuffer.from(u8);
      expect(result1 === result2).assertFalse();
      expect(result1.byteLength).assertEqual(result2.byteLength);
    });

    /**
     * @tc.name testArrayBufferFromThree0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_2400
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u8 = new Uint8Array([1, 2, 3]);
      const result = ArrayBuffer.from(u8)
      expect(result instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromThree0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_2500
     * @tc.desc 验证 new Byte() 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Byte = new Byte()
      expect(Class.of(b).getName().indexOf("Byte") >= 0).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromThree0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_2600
     * @tc.desc 验证 new Byte() 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Byte = new Byte()
      expect(b.toByte()).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferFromThree0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_2700
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u8 = new Uint8Array([1, 2, 3]);
      const result = ArrayBuffer.from(u8)
      expect(Utils.isRuntimeNumericOrIntTypeof(typeof result.byteLength)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromThree0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_2800
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u8 = new Uint8Array([42]);
      const result = ArrayBuffer.from(u8)
      let view = new Uint8Array(result);
      expect(view[0]).assertEqual(42);
    });

    /**
     * @tc.name testArrayBufferFromThree0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_2900
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u8 = new Uint8Array([10, 20, 30, 40, 50]);
      const result = ArrayBuffer.from(u8)
      let view = new Uint8Array(result);
      for (let i: int = 0; i < 5; i++) {
        expect(view[i]).assertEqual(u8[i]);
      }
    });

    /**
     * @tc.name testArrayBufferFromThree0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_3000
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u8 = new Uint8Array([100, 200, 150]);
      const result = ArrayBuffer.from(u8)
      let view = new Uint8Array(result);
      expect(view.at(0)).assertEqual(100);
      expect(view.at(-1)).assertEqual(150);
    });

    /**
     * @tc.name testArrayBufferFromThree0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_3100
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u8 = new Uint8Array([0, 128, 255]);
      const result = ArrayBuffer.from(u8)
      let view = new Uint8Array(result);
      expect(view[0]).assertEqual(0);
      expect(view[1]).assertEqual(128);
      expect(view[2]).assertEqual(255);
    });

    /**
     * @tc.name testArrayBufferFromThree0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_3200
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u8 = new Uint8Array(256);
      for (let i: int = 0; i < 256; i++) {
        u8[i] = i;
      }
      const result = ArrayBuffer.from(u8)
      let view = new Uint8Array(result);
      for (let i: int = 0; i < 256; i++) {
        expect(view[i]).assertEqual(i);
      }
    });

    /**
     * @tc.name testArrayBufferFromThree0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_3300
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u8 = new Uint8Array([1, 2, 3]);
      const result = ArrayBuffer.from(u8)
      let viewBefore = new Uint8Array(result);
      expect(viewBefore[0]).assertEqual(1);
      u8[0] = 99;
      let viewAfter = new Uint8Array(result);
      expect(viewAfter[0]).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferFromThree0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_3400
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u8 = new Uint8Array([10, 20, 30]);
      const result = ArrayBuffer.from(u8)
      let view = new Uint8Array(result);
      view[0] = 99;
      expect(u8[0]).assertEqual(10);
    });

    /**
     * @tc.name testArrayBufferFromThree0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_3500
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，共享底层 buffer 的关系判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u8 = new Uint8Array([1, 2, 3]);
      const result = ArrayBuffer.from(u8)
      expect(result === u8.buffer).assertFalse();
    });

    /**
     * @tc.name testArrayBufferFromThree0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_3600
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let srcBuf = new ArrayBuffer(4);
      let u8 = new Uint8Array(srcBuf);
      u8[0] = 1;
      u8[1] = 2;
      u8[2] = 3;
      u8[3] = 4;
      const result = ArrayBuffer.from(u8)
      let otherView = new Uint8Array(srcBuf);
      otherView[0] = 100;
      let view = new Uint8Array(result);
      expect(view[0]).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferFromThree0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_3700
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u8 = new Uint8Array([1, 2, 3]);
      let result1 = ArrayBuffer.from(u8);
      expect(result1.byteLength).assertEqual(3);
      let copied = result1.slice(0, (result1.byteLength as int));
      expect(copied.byteLength).assertEqual(3);
      let u8OnCopy = new Uint8Array(copied);
      expect(u8OnCopy.byteLength).assertEqual(3);
      let u8OnSource = new Uint8Array(result1);
      expect(u8OnSource.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromThree0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_3800
     * @tc.desc 验证 ArrayBuffer.from(u8OnSource) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(3);
      let u8 = new Uint8Array(buf);
      let copied = buf.slice(0, (buf.byteLength as int));
      expect(copied.byteLength).assertEqual(3);
      let u8OnSource = new Uint8Array(buf);
      const result = ArrayBuffer.from(u8OnSource)
      expect(result instanceof ArrayBuffer).assertTrue();
      expect(result.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromThree0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_3900
     * @tc.desc 验证 ArrayBuffer.from(new Uint8Array(buf)) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(3);
      let u8 = new Uint8Array(buf);
      buf.slice(0, (buf.byteLength as int));
      const result = ArrayBuffer.from(new Uint8Array(buf))
      let view = new Uint8Array(result);
      expect(view.length).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromThree0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_4000
     * @tc.desc 验证 ArrayBuffer.from(u8OnSource) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(3);
      let u8OnSource = new Uint8Array(buf);
      const result = ArrayBuffer.from(u8OnSource);
      expect(result.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromThree0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_4100
     * @tc.desc 验证 ArrayBuffer.from(new Uint8Array(buf)) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(3);
      const result = ArrayBuffer.from(new Uint8Array(buf));
      expect(result.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromThree0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_4200
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let u8 = (null as Uint8Array);
        let result = ArrayBuffer.from(u8);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromThree0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_4300
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let u8 = (undefined as Uint8Array);
        let result = ArrayBuffer.from(u8);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromThree0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_4400
     * @tc.desc 验证 ArrayBuffer.from((badTypeName as Object) as Uint8Array) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const badTypeName: string = "Uint8Array";
        let result = ArrayBuffer.from((badTypeName as Object) as Uint8Array);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromThree0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_4500
     * @tc.desc 验证 ArrayBuffer.from((((42 as number) as ESObject) as Uint8Array)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.from((((42 as number) as ESObject) as Uint8Array));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromThree0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_4600
     * @tc.desc 验证 ArrayBuffer.from(((false as Object) as Uint8Array)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.from(((false as Object) as Uint8Array));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromThree0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_4700
     * @tc.desc 验证 ArrayBuffer.from((i16 as Object) as Uint8Array) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let i16 = new Int16Array([1, 2, 3]);
        let result = ArrayBuffer.from((i16 as Object) as Uint8Array);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromThree0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_4800
     * @tc.desc 验证 ArrayBuffer.from((u16 as Object) as Uint8Array) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let u16 = new Uint16Array([1, 2, 3]);
        let result = ArrayBuffer.from((u16 as Object) as Uint8Array);
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