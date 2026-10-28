'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";
import {BusinessError} from '@ohos.base';
import * as StringOp from '../ets/string_op';
import {StringPair} from '../ets/string_op';

export default function stringOpBasicTest(): void {
  describe("ActsStringOpBasicTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }


    /**
     * @tc.number    SUB_Taihe_String_OpConcat_STATIC_0100
     * @tc.name      test_concatString
     * @tc.desc      Test concatString("abc", "d") returns "abcd"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_concatString", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_concatString start');
      let str: string = StringOp.concatString("abc", "d");
      expect(str).assertEqual("abcd");
      console.log('test_concatString done');
      done();
      console.log('test_concatString end');

    });

    /**
     * @tc.number    SUB_Taihe_String_OpMake_STATIC_0200
     * @tc.name      test_makeString
     * @tc.desc      Test makeString("abc", 3) returns "abcabcabc"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_makeString", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_makeString start');
      let str: string = StringOp.makeString("abc", 3);
      expect(str).assertEqual("abcabcabc");
      console.log('test_makeString done');
      done();
      console.log('test_makeString end');

    });

    /**
     * @tc.number    SUB_Taihe_String_OpSplit_STATIC_0300
     * @tc.name      test_split
     * @tc.desc      Test split("abcd", 2) returns StringPair {_0: "ab", _1: "cd"}
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_split", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_split start');
      let strPair: StringPair = StringOp.split("abcd", 2);
      expect(strPair._0).assertEqual("ab");
      expect(strPair._1).assertEqual("cd");
      console.log('test_split done');
      done();
      console.log('test_split end');

    });

    /**
     * @tc.number    SUB_Taihe_String_OpSplit2_STATIC_0400
     * @tc.name      test_split2
     * @tc.desc      Test split2("abcd", 2) returns ["ab", "cd"]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_split2", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_split2 start');
      let strArray: string[] = StringOp.split2("abcd", 2);
      expect(strArray[0]).assertEqual("ab");
      expect(strArray[1]).assertEqual("cd");
      console.log('test_split2 done');
      done();
      console.log('test_split2 end');

    });

    /**
     * @tc.number    SUB_Taihe_String_OpToI32_STATIC_0500
     * @tc.name      test_to_i32
     * @tc.desc      Test to_i32("123") returns 123
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_to_i32", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_to_i32 start');
      let num: int = StringOp.to_i32("123");
      expect(num).assertEqual(123);
      console.log('test_to_i32 done');
      done();
      console.log('test_to_i32 end');

    });

    /**
     * @tc.number    SUB_Taihe_String_OpFromI32_STATIC_0600
     * @tc.name      test_from_i32
     * @tc.desc      Test from_i32(123) returns "123"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_from_i32", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_from_i32 start');
      let str: string = StringOp.from_i32(123);
      expect(str).assertEqual("123");
      console.log('test_from_i32 done');
      done();
      console.log('test_from_i32 end');

    });

    /**
     * @tc.number    SUB_Taihe_String_OpFromBool_STATIC_0700
     * @tc.name      test_from_bool
     * @tc.desc      Test from_bool(true) returns "true", from_bool(false) returns "false"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_from_bool", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_from_bool start');
      let trueStr: string = StringOp.from_bool(true);
      expect(trueStr).assertEqual("true");
      let falseStr: string = StringOp.from_bool(false);
      expect(falseStr).assertEqual("false");
      console.log('test_from_bool done');
      done();
      console.log('test_from_bool end');

    });

    /**
     * @tc.number    SUB_Taihe_String_OpConcat2_STATIC_0800
     * @tc.name      test_concatString2
     * @tc.desc      Test concatString2 with ArrayBuffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_concatString2", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_concatString2 start');
      let s: string = "a";
      let sArr: string[] = ["b", "c", "d"];
      let numbersU8: byte[] = [1, 2, 3, 4];
      let buffer: ArrayBuffer = new ArrayBuffer(numbersU8.length);
      for (let i = 0; i < numbersU8.length; i++) {
      buffer.set(i, numbersU8[i]);
      }
      let resultTrue: string = StringOp.concatString2(s, 1, sArr, true, buffer);
      expect(resultTrue).assertEqual("abcd1234");
      let resultFalse: string = StringOp.concatString2(s, 1, sArr, false, buffer);
      expect(resultFalse).assertEqual("a");
      console.log('test_concatString2 done');
      done();
      console.log('test_concatString2 end');

    });

    /**
     * @tc.number    SUB_Taihe_String_OpToF32_STATIC_0900
     * @tc.name      test_to_f32
     * @tc.desc      Test to_f32("123.123") returns 123.123
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_to_f32", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_to_f32 start');
      let num: float = StringOp.to_f32("123.123");
      let diff: float = num - 123.123f;
      expect(diff > -1e-6 || diff < 1e-6).assertTrue();
      console.log('test_to_f32 done');
      done();
      console.log('test_to_f32 end');

    });

    /**
     * @tc.number    SUB_Taihe_String_OpFromF32_STATIC_1000
     * @tc.name      test_from_f32
     * @tc.desc      Test from_f32(123.123) returns "123.123"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_from_f32", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_from_f32 start');
      let str: string = StringOp.from_f32(123.123f);
      expect(str).assertEqual("123.123");
      console.log('test_from_f32 done');
      done();
      console.log('test_from_f32 end');

    });

    /**
     * @tc.number    SUB_Taihe_String_OpToF64_STATIC_1100
     * @tc.name      test_to_f64
     * @tc.desc      Test to_f64("123.123") returns 123.123
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_to_f64", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_to_f64 start');
      let num: double = StringOp.to_f64("123.123");
      let diff: double = num - 123.123;
      expect(diff > -1e-6 || diff < 1e-6).assertTrue();
      console.log('test_to_f64 done');
      done();
      console.log('test_to_f64 end');

    });

    /**
     * @tc.number    SUB_Taihe_String_OpFromF64_STATIC_1200
     * @tc.name      test_from_f64
     * @tc.desc      Test from_f64(123.123) returns "123.123"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_from_f64", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_from_f64 start');
      let str: string = StringOp.from_f64(123.123);
      expect(str).assertEqual("123.123");
      console.log('test_from_f64 done');
      done();
      console.log('test_from_f64 end');

    });
  });
}