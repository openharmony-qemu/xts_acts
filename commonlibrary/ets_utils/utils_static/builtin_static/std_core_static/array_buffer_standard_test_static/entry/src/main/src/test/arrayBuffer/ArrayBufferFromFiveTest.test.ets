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

class ArrayBufferFromSixPlainForMindmap {
}

class ArrayBufferLikePlainForMindmap {
}


function fromFiveBuildLongA(n: int): string {
  let s: string = '';
  for (let i: int = 0; i < n; i++) {
    s += 'A';
  }
  return s;
}

export default function arrayBufferFromFiveTest(): void {
  describe('ArrayBufferFromFiveTest', (): void => {
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
     * @tc.name testArrayBufferFromFive0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0100
     * @tc.desc 验证 ArrayBuffer.from("ABC", "utf8") 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("ABC", "utf8");
      expect(buf.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromFive0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0200
     * @tc.desc 验证 ArrayBuffer.from("utf8", "utf8") 在当前场景执行成功，返回值的 byteLength 为 4。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("utf8", "utf8");
      expect(buf.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferFromFive0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0300
     * @tc.desc 验证 ArrayBuffer.from("AB", "utf8") 在当前场景执行成功，返回值的 byteLength 为 2。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("AB", "utf8");
      expect(buf.byteLength).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferFromFive0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0400
     * @tc.desc 验证 ArrayBuffer.from("x", "utf8") 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("x", "utf8");
      expect(buf.byteLength).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferFromFive0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0500
     * @tc.desc 验证 ArrayBuffer.from("XY", "utf8") 在当前场景执行成功，返回值的 byteLength 为 2。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("XY", "utf8");
      expect(buf.byteLength).assertEqual(2);
      expect(buf.at(1)).assertEqual(89);
    });

    /**
     * @tc.name testArrayBufferFromFive0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0600
     * @tc.desc 验证 ArrayBuffer.from("ABCD", "utf8") 在当前场景执行成功，返回值的 byteLength 为 4。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("ABCD", "utf8");
      expect(buf.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferFromFive0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0700
     * @tc.desc 验证 ArrayBuffer.from("WXYZ", "utf8") 在当前场景执行成功，返回值的 byteLength 为 4。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("WXYZ", "utf8");
      expect(buf.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferFromFive0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0800
     * @tc.desc 验证 ArrayBuffer.from("Hello123", "utf8") 在当前场景执行成功，返回值的 byteLength 为 8。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("Hello123", "utf8");
      expect(buf.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferFromFive0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0900
     * @tc.desc 验证 ArrayBuffer.from("", "utf8") 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("", "utf8");
      expect(buf.byteLength).assertEqual(0);
      expect(buf instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromFive0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1000
     * @tc.desc 验证 ArrayBuffer.from("你好", "utf8") 在当前场景执行成功，返回值的 byteLength 为 6。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("你好", "utf8");
      expect(buf.byteLength).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferFromFive0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1100
     * @tc.desc 验证 ArrayBuffer.from("こんにちは", "utf8") 在当前场景执行成功，返回值的 byteLength 为 15。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("こんにちは", "utf8");
      expect(buf.byteLength).assertEqual(15);
    });

    /**
     * @tc.name testArrayBufferFromFive0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1200
     * @tc.desc 验证 ArrayBuffer.from("😀", "utf8") 在当前场景执行成功，返回值的 byteLength 为 4。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("😀", "utf8");
      expect(buf.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferFromFive0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1300
     * @tc.desc 验证 ArrayBuffer.from("A😀B", "utf8") 在当前场景执行成功，返回值的 byteLength 为 6。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("A😀B", "utf8");
      expect(buf.byteLength).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferFromFive0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1400
     * @tc.desc 验证 ArrayBuffer.from("A\tB\nC", "utf8") 在当前场景执行成功，返回值的 byteLength 为 5。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("A\tB\nC", "utf8");
      expect(buf.byteLength).assertEqual(5);
    });

    /**
     * @tc.name testArrayBufferFromFive0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1500
     * @tc.desc 验证 ArrayBuffer.from("Hello, World!", "utf8") 在当前场景执行成功，返回值的 byteLength 为 13。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("Hello, World!", "utf8");
      expect(buf.byteLength).assertEqual(13);
    });

    /**
     * @tc.name testArrayBufferFromFive0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1600
     * @tc.desc 验证 ArrayBuffer.from("A\\B\\C", "utf8") 在当前场景执行成功，返回值的 byteLength 为 5。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("A\\B\\C", "utf8");
      expect(buf.byteLength).assertEqual(5);
    });

    /**
     * @tc.name testArrayBufferFromFive0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1700
     * @tc.desc 验证 ArrayBuffer.from(fromFiveBuildLongA(10000), "utf8") 在当前场景执行成功，返回值的 byteLength 为 10000。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "";
      for (let i: int = 0; i < 10000; i++) {
        longStr += "A";
      }
      const buf = ArrayBuffer.from(fromFiveBuildLongA(10000), "utf8");
      expect(buf.byteLength).assertEqual(10000);
    });

    /**
     * @tc.name testArrayBufferFromFive0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1800
     * @tc.desc 验证 ArrayBuffer.from(longStr, "utf8") 在当前场景执行成功，返回值的 byteLength 为 3000。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "";
      for (let i: int = 0; i < 1000; i++) {
        longStr += "你";
      }
      const buf = ArrayBuffer.from(longStr, "utf8");
      expect(buf.byteLength).assertEqual(3000);
    });

    /**
     * @tc.name testArrayBufferFromFive0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1900
     * @tc.desc 验证 ArrayBuffer.from("A", "utf8") 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("A", "utf8");
      expect(buf.byteLength).assertEqual(1);
      expect(buf.at(0)).assertEqual(65);
    });

    /**
     * @tc.name testArrayBufferFromFive0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2000
     * @tc.desc 验证 ArrayBuffer.from("A\B\C", "utf8") 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("A\B\C", "utf8");
      expect(buf.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromFive0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2100
     * @tc.desc 验证 ArrayBuffer.from(fromFiveBuildLongA(10000), "utf8") 在当前场景执行成功，返回值的 byteLength 为 10000。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const buf = ArrayBuffer.from(fromFiveBuildLongA(10000), "utf8");
      expect(buf.byteLength).assertEqual(10000);
    });

    /**
     * @tc.name testArrayBufferFromFive0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2200
     * @tc.desc 验证 ArrayBuffer.from("A", "utf8") 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const badNum: number = 1.5;
      const buf = ArrayBuffer.from("A", "utf8");
      expect(buf.byteLength).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferFromFive0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2300
     * @tc.desc 验证 ArrayBuffer.from(Utils.castToString(null as Object), "utf8") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const badBool: boolean = true;
      try {
        const buf = ArrayBuffer.from(Utils.castToString(null as Object), "utf8");
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFive0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2400
     * @tc.desc 验证 ArrayBuffer.from(Utils.castToString(undefined as Object), "utf8") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = ArrayBuffer.from(Utils.castToString(undefined as Object), "utf8");
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFive0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2500
     * @tc.desc 验证 ArrayBuffer.from(Utils.numberAsString(_badNum2), "utf8") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let badArr = new Array<number>();
      badArr.pushOne(1);
      badArr.pushOne(2);
      badArr.pushOne(3);
      try {
        const _badNum2: number = 123;
        const buf = ArrayBuffer.from(Utils.numberAsString(_badNum2), "utf8");
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFive0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2600
     * @tc.desc 验证 ArrayBuffer.from("Go", "utf8") 在当前场景执行成功，返回值的 byteLength 为 2。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("Go", "utf8");
      expect(buf.byteLength).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferFromFive0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2700
     * @tc.desc 验证 ArrayBuffer.from("ABC", "utf-8") 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("ABC", "utf-8");
      expect(buf.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromFive0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2800
     * @tc.desc 验证 ArrayBuffer.from("ABC", "ascii") 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("ABC", "ascii");
      expect(buf.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromFive0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2900
     * @tc.desc 验证 ArrayBuffer.from("ABC", "utf16le") 在当前场景执行成功，返回值的 byteLength 为 6。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("ABC", "utf16le");
      expect(buf.byteLength).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferFromFive0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3000
     * @tc.desc 验证 ArrayBuffer.from("ABC", "ucs2") 在当前场景执行成功，返回值的 byteLength 为 6。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("ABC", "ucs2");
      expect(buf.byteLength).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferFromFive0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3100
     * @tc.desc 验证 ArrayBuffer.from("QUJD", "base64") 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("QUJD", "base64");
      expect(buf.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromFive0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3200
     * @tc.desc 验证 ArrayBuffer.from("414243", "hex") 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("414243", "hex");
      expect(buf.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromFive0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3300
     * @tc.desc 验证 ArrayBuffer.from("ABC", "latin1") 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("ABC", "latin1");
      expect(buf.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromFive0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3400
     * @tc.desc 验证 ArrayBuffer.from("ABC", "binary") 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("ABC", "binary");
      expect(buf.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromFive0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3500
     * @tc.desc 验证 ArrayBuffer.from("414243", "hex") 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const buf = ArrayBuffer.from("414243", "hex");
      expect(buf.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromFive0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3600
     * @tc.desc 验证 ArrayBuffer.from("ABC", "latin1") 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const buf = ArrayBuffer.from("ABC", "latin1");
      expect(buf.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromFive0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3700
     * @tc.desc 验证 ArrayBuffer.from("ABC", "binary") 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const buf = ArrayBuffer.from("ABC", "binary");
      expect(buf.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromFive0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3800
     * @tc.desc 验证 ArrayBuffer.from("ABC", "UTF8") 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = ArrayBuffer.from("ABC", "UTF8");
        expect(buf.byteLength).assertEqual(3);
      } catch (e) {
        try {
          const buf = ArrayBuffer.from("ABC", "UTF8");
          expect(buf.byteLength).assertEqual(3);
        } catch (e) {
          expect(e !== null && e !== undefined).assertTrue();
          Utils.assertThrownErrorCodeIsNumber(e);
          const buf = ArrayBuffer.from("ABC", "utf8");
          expect(buf.byteLength).assertEqual(3);
        }
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3900
     * @tc.desc 验证 ArrayBuffer.from("ABC", "Utf8") 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = ArrayBuffer.from("ABC", "Utf8");
        expect(buf.byteLength).assertEqual(3);
      } catch (e) {
        try {
          const buf = ArrayBuffer.from("ABC", "Utf8");
          expect(buf.byteLength).assertEqual(3);
        } catch (e) {
          expect(e !== null && e !== undefined).assertTrue();
          Utils.assertThrownErrorCodeIsNumber(e);
          const buf = ArrayBuffer.from("ABC", "utf8");
          expect(buf.byteLength).assertEqual(3);
        }
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4000
     * @tc.desc 验证 ArrayBuffer.from("ABC", "UTF8") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: string = "ABC";
      try {
        const buf = ArrayBuffer.from("ABC", "UTF8");
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        expect(ArrayBuffer.bytesLength(text, "utf8")).assertEqual(3);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFive0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4100
     * @tc.desc 验证 ArrayBuffer.from("ABC", "Utf8") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: string = "ABC";
      try {
        const buf = ArrayBuffer.from("ABC", "Utf8");
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        expect(ArrayBuffer.bytesLength(text, "utf8")).assertEqual(3);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFive0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4200
     * @tc.desc 验证 ArrayBuffer.from("ABC", Utils.castToString(null as Object)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const badEnc: number = 123;
      try {
        const buf = ArrayBuffer.from("ABC", Utils.castToString(null as Object));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFive0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4300
     * @tc.desc 验证 ArrayBuffer.from("ABC", Utils.castToString(undefined as Object)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const badEnc: boolean = true;
      try {
        const buf = ArrayBuffer.from("ABC", Utils.castToString(undefined as Object));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFive0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4400
     * @tc.desc 验证 ArrayBuffer.from("ABC", Utils.numberAsString(_badNum4)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const _badNum4: number = 123;
        const buf = ArrayBuffer.from("ABC", Utils.numberAsString(_badNum4));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFive0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4500
     * @tc.desc 验证 ArrayBuffer.from("Test", "utf8") 在当前场景执行成功，返回值的 byteLength 为 4。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("Test", "utf8");
      expect(buf.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferFromFive0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4600
     * @tc.desc 验证 ArrayBuffer.from("你好世界", "utf8") 在当前场景执行成功，返回值的 byteLength 为 12。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("你好世界", "utf8");
      expect(buf.byteLength).assertEqual(12);
    });

    /**
     * @tc.name testArrayBufferFromFive0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4700
     * @tc.desc 验证 ArrayBuffer.from("😀🎉", "utf8") 在当前场景执行成功，返回值的 byteLength 为 8。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("😀🎉", "utf8");
      expect(buf.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferFromFive0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4800
     * @tc.desc 验证 ArrayBuffer.from("A你好B", "utf8") 在当前场景执行成功，返回值的 byteLength 为 8。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("A你好B", "utf8");
      expect(buf.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferFromFive0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4900
     * @tc.desc 验证 ArrayBuffer.from("A", "ascii") 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("A", "ascii");
      expect(buf.byteLength).assertEqual(1);
      expect(buf.at(0)).assertEqual(65);
    });

    /**
     * @tc.name testArrayBufferFromFive0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_5000
     * @tc.desc 验证 ArrayBuffer.from("ABC", "utf8") 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf1 = ArrayBuffer.from("ABC", "utf8");
      const buf2 = ArrayBuffer.from("ABC", "utf16le");
      expect(buf1.byteLength).assertEqual(3);
      expect(buf2.byteLength).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferFromFive0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_5100
     * @tc.desc 验证 ArrayBuffer.from("ABC", "utf8") 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("ABC", "utf8");
      expect(buf instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromFive0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_5200
     * @tc.desc 验证 ArrayBuffer.from("ABC", "utf8") 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("ABC", "utf8");
      expect(typeof buf === "object").assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromFive0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_5300
     * @tc.desc 验证 ArrayBuffer.from("ABC", "utf8") 在当前场景执行成功，空值有效性判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("ABC", "utf8");
      expect(buf !== null).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromFive0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_5400
     * @tc.desc 验证 ArrayBuffer.from("ABC", "utf8") 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("ABC", "utf8");
      expect(buf instanceof ArrayBuffer).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromFive0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_5500
     * @tc.desc 验证 ArrayBuffer.from("ABC", "utf8") 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("ABC", "utf8");
      expect(Utils.isRuntimeNumericOrIntTypeof(typeof buf.byteLength)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromFive0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_5600
     * @tc.desc 验证 ArrayBuffer.from("ABC", "utf8") 在当前场景执行成功，返回值的 byteLength 为 2。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("ABC", "utf8");
      const sliced = buf.slice(0, 2);
      expect(sliced.byteLength).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferFromFive0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_5700
     * @tc.desc 验证 ArrayBuffer.from("ABC", "utf8") 在当前场景执行成功，等值关系判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf1 = ArrayBuffer.from("ABC", "utf8");
      const buf2 = ArrayBuffer.from("ABC", "utf8");
      expect(buf1 !== buf2).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromFive0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_5800
     * @tc.desc 验证 ArrayBuffer.from(original, "utf8") 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: string = "ABC";
      const buf = ArrayBuffer.from(original, "utf8");
      const restored = ArrayBuffer.stringify(buf, "utf8", 0, buf.byteLength);
      expect(restored).assertEqual(original);
    });

    /**
     * @tc.name testArrayBufferFromFive0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_5900
     * @tc.desc 验证 ArrayBuffer.from(original, "utf8") 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: string = "你好世界";
      const buf = ArrayBuffer.from(original, "utf8");
      const restored = ArrayBuffer.stringify(buf, "utf8", 0, buf.byteLength);
      expect(restored).assertEqual(original);
    });

    /**
     * @tc.name testArrayBufferFromFive0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_6000
     * @tc.desc 验证 ArrayBuffer.from(original, "utf8") 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: string = "😀🎉";
      const buf = ArrayBuffer.from(original, "utf8");
      const restored = ArrayBuffer.stringify(buf, "utf8", 0, buf.byteLength);
      expect(restored).assertEqual(original);
    });

    /**
     * @tc.name testArrayBufferFromFive0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_6100
     * @tc.desc 验证 ArrayBuffer.from(original, "utf8") 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: string = "Hello你好😀";
      const buf = ArrayBuffer.from(original, "utf8");
      const restored = ArrayBuffer.stringify(buf, "utf8", 0, buf.byteLength);
      expect(restored).assertEqual(original);
    });

    /**
     * @tc.name testArrayBufferFromFive0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_6200
     * @tc.desc 验证 ArrayBuffer.from(original, "utf8") 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: string = "A\tB\nC";
      const buf = ArrayBuffer.from(original, "utf8");
      const restored = ArrayBuffer.stringify(buf, "utf8", 0, buf.byteLength);
      expect(restored).assertEqual(original);
    });

    /**
     * @tc.name testArrayBufferFromFive0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_6300
     * @tc.desc 验证 ArrayBuffer.from("ABCDE", "utf8") 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("ABCDE", "utf8");
      const partial = ArrayBuffer.stringify(buf, "utf8", 1, 3);
      expect(partial).assertEqual("BC");
    });

    /**
     * @tc.name testArrayBufferFromFive0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_6400
     * @tc.desc 验证 ArrayBuffer.from(original, "utf8") 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: string = "";
      for (let i: int = 0; i < 1000; i++) {
        original += "AB";
      }
      const buf = ArrayBuffer.from(original, "utf8");
      const restored = ArrayBuffer.stringify(buf, "utf8", 0, buf.byteLength);
      expect(restored).assertEqual(original);
    });

    /**
     * @tc.name testArrayBufferFromFive0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_6500
     * @tc.desc 验证 ArrayBuffer.from(original, "utf16le") 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: string = "ABC";
      const buf = ArrayBuffer.from(original, "utf16le");
      const restored = ArrayBuffer.stringify(buf, "utf16le", 0, buf.byteLength);
      expect(restored).assertEqual(original);
    });

    /**
     * @tc.name testArrayBufferFromFive0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_6600
     * @tc.desc 验证 ArrayBuffer.from("", "utf8") 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("", "utf8");
      expect(buf.byteLength).assertEqual(0);
      expect(ArrayBuffer.stringify(buf, "utf8", 0, 0)).assertEqual("");
    });

    /**
     * @tc.name testArrayBufferFromFive0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_6700
     * @tc.desc 验证 ArrayBuffer.from("", "utf8") 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("", "utf8");
      expect(buf instanceof ArrayBuffer).assertTrue();
      expect(buf.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromFive0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_6800
     * @tc.desc 验证 ArrayBuffer.from("", "utf8") 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("", "utf8");
      const restored = ArrayBuffer.stringify(buf, "utf8", 0, buf.byteLength);
      expect(restored).assertEqual("");
    });

    /**
     * @tc.name testArrayBufferFromFive0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_6900
     * @tc.desc 验证 ArrayBuffer.from("A", "utf8") 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("A", "utf8");
      expect(buf.byteLength).assertEqual(1);
      const restored = ArrayBuffer.stringify(buf, "utf8", 0, buf.byteLength);
      expect(restored).assertEqual("A");
    });

    /**
     * @tc.name testArrayBufferFromFive0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_7000
     * @tc.desc 验证 ArrayBuffer.from(bigStr, "utf8") 在当前场景执行成功，返回值的 byteLength 为 102400。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bigStr: string = "";
      for (let i: int = 0; i < 102400; i++) {
        bigStr += "X";
      }
      const buf = ArrayBuffer.from(bigStr, "utf8");
      expect(buf.byteLength).assertEqual(102400);
    });

    /**
     * @tc.name testArrayBufferFromFive0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_7100
     * @tc.desc 验证 ArrayBuffer.from("A", "utf8") 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from("A", "utf8");
      const restored = ArrayBuffer.stringify(buf, "utf8", 0, buf.byteLength);
      expect(restored).assertEqual("A");
    });

    /**
     * @tc.name testArrayBufferFromFive0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_7200
     * @tc.desc 验证 ArrayBuffer.from(fromFiveBuildLongA(100000), "utf8") 在当前场景执行成功，返回值的 byteLength 为 100000。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from(fromFiveBuildLongA(100000), "utf8");
      expect(buf.byteLength).assertEqual(100000);
    });

    /**
     * @tc.name testArrayBufferFromFive0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_7300
     * @tc.desc 验证 ArrayBuffer.from(Utils.castToString(null as Object), "utf8") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: string = "XY";
      try {
        const buf = ArrayBuffer.from(Utils.castToString(null as Object), "utf8");
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        expect(ArrayBuffer.bytesLength(text, "ascii")).assertEqual(2);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFive0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_7400
     * @tc.desc 验证 ArrayBuffer.from(Utils.castToString(undefined as Object), "utf8") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: string = "Z";
      try {
        const buf = ArrayBuffer.from(Utils.castToString(undefined as Object), "utf8");
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        expect(ArrayBuffer.bytesLength(text, "latin1")).assertEqual(1);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFive0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_7500
     * @tc.desc 验证 ArrayBuffer.from("ABC", Utils.castToString(undefined as Object)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = ArrayBuffer.from("ABC", Utils.castToString(undefined as Object));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFive0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_7600
     * @tc.desc 验证 ArrayBuffer.from(Utils.castToString(null as Object), Utils.castToString(null as Object)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = ArrayBuffer.from(Utils.castToString(null as Object), Utils.castToString(null as Object));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFive0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_7700
     * @tc.desc 验证 ArrayBuffer.from(Utils.castToString(undefined as Object), Utils.castToString(undefined as Ob... 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = ArrayBuffer.from(Utils.castToString(undefined as Object), Utils.castToString(undefined as Object));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFive0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_7800
     * @tc.desc 验证 ArrayBuffer.from("ABC", "notexist") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = ArrayBuffer.from("ABC", "notexist");
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        const fallback = ArrayBuffer.from("", "utf8");
        expect(fallback.byteLength).assertEqual(0);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFive0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_7900
     * @tc.desc 验证 ArrayBuffer.from("ABC", "") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = ArrayBuffer.from("ABC", "");
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFive0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_8000
     * @tc.desc 验证 ArrayBuffer.from("ABC", "12345") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = ArrayBuffer.from("ABC", "12345");
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFive0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_8100
     * @tc.desc 验证 ArrayBuffer.from("ABC", "!@#$%") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = ArrayBuffer.from("ABC", "!@#$%");
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFive0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_8200
     * @tc.desc 验证 ArrayBuffer.from("ABC", "   ") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const badNum: number = 456;
      try {
        const buf = ArrayBuffer.from("ABC", "   ");
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFive0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_8300
     * @tc.desc 验证 ArrayBuffer.from(Utils.numberAsString(_badNum6), "utf8") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const badBool: boolean = false;
      try {
        const _badNum6: number = 123;
        const buf = ArrayBuffer.from(Utils.numberAsString(_badNum6), "utf8");
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFive0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_8400
     * @tc.desc 验证 ArrayBuffer.from(Utils.castToString(true as Object), "utf8") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = ArrayBuffer.from(Utils.castToString(true as Object), "utf8");
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFive0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_8500
     * @tc.desc 验证 ArrayBuffer.from({}, "utf8") 在当前场景执行成功，空值有效性判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer;
      try {
        buf = ArrayBuffer.from({}, "utf8");
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(buf instanceof ArrayBuffer).assertEqual(true);
    });

    /**
     * @tc.name testArrayBufferFromFive0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_8600
     * @tc.desc 验证 ArrayBuffer.from(Utils.castToString(badArr as Object), "utf8") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let badArr = new Array<number>();
        badArr.pushOne(1);
        badArr.pushOne(2);
        badArr.pushOne(3);
        const buf = ArrayBuffer.from(Utils.castToString(badArr as Object), "utf8");
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFive0087
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_8700
     * @tc.desc 验证 ArrayBuffer.from(Utils.castToString(new ArrayBuffer(10) as Object), "utf8") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const badEnc: number = 789;
      try {
        const buf = ArrayBuffer.from(Utils.castToString(new ArrayBuffer(10) as Object), "utf8");
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        expect(ArrayBuffer.bytesLength("Hi", "utf8")).assertEqual(2);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFive0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_8800
     * @tc.desc 验证 ArrayBuffer.from("ABC", Utils.castToString(true as Object)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const badEnc: boolean = false;
      try {
        const buf = ArrayBuffer.from("ABC", Utils.castToString(true as Object));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        expect(ArrayBuffer.bytesLength("No", "utf8")).assertEqual(2);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFive0089
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_8900
     * @tc.desc 验证 ArrayBuffer.from("ABC", Utils.castToString(plainEnc as Object)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const plain = new ArrayBufferFromSixPlainForMindmap();
      try {
        const plainEnc = new ArrayBufferFromSixPlainForMindmap();
        const buf = ArrayBuffer.from("ABC", Utils.castToString(plainEnc as Object));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        expect(ArrayBuffer.bytesLength("Q", "utf8")).assertEqual(1);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFive0090
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_9000
     * @tc.desc 验证 ArrayBuffer.from("ABC", Utils.castToString(["utf8"] as Object)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = ArrayBuffer.from("ABC", Utils.castToString(["utf8"] as Object));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFive0091
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_9100
     * @tc.desc 验证 ArrayBuffer.from(Utils.numberAsString(_badNum9), Utils.numberAsString(_badNum10)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const _badNum9: number = 123;
        const _badNum10: number = 456;
        const buf = ArrayBuffer.from(Utils.numberAsString(_badNum9), Utils.numberAsString(_badNum10));
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