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
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import {BusinessError} from '@ohos.base';
import * as overloadTest from '../ets/overloadTest';

export default function overloadInterfaceTest(): void {
  describe("ActsOverloadInterfaceTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    let instance: overloadTest.OverloadInterface = overloadTest.get_interface();

    /**
     * @tc.number    SUB_Taihe_Overload_Byte_Static_0100
     * @tc.name      test_Overload_Byte_Static_0001
     * @tc.desc      Test overloadFunc with byte parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Overload_Byte_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Overload_Byte_Static_0001 start');
      let res = instance.overloadFunc((5).toByte(), (5).toByte());
      expect(res).assertEqual(5);
      console.log('test_Overload_Byte_Static_0001 done');
      done();
      console.log('test_Overload_Byte_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Overload_Short_Static_0100
     * @tc.name      test_Overload_Short_Static_0001
     * @tc.desc      Test overloadFunc with short parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Overload_Short_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Overload_Short_Static_0001 start');
      let res = instance.overloadFunc((42).toShort(), (42).toShort());
      expect(res).assertEqual(42);
      console.log('test_Overload_Short_Static_0001 done');
      done();
      console.log('test_Overload_Short_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Overload_Int_Static_0100
     * @tc.name      test_Overload_Int_Static_0001
     * @tc.desc      Test overloadFunc with int parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Overload_Int_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Overload_Int_Static_0001 start');
      let res = instance.overloadFunc((1000).toInt(), (1000).toInt());
      expect(res).assertEqual(1000);
      console.log('test_Overload_Int_Static_0001 done');
      done();
      console.log('test_Overload_Int_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Overload_Float_Static_0100
     * @tc.name      test_Overload_Float_Static_0001
     * @tc.desc      Test overloadFunc with float parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Overload_Float_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Overload_Float_Static_0001 start');
      let res = instance.overloadFunc(3.14f, 3.14f);
      expect(res).assertEqual(3.14f);
      console.log('test_Overload_Float_Static_0001 done');
      done();
      console.log('test_Overload_Float_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Overload_Double_Static_0100
     * @tc.name      test_Overload_Double_Static_0001
     * @tc.desc      Test overloadFunc with double parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Overload_Double_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Overload_Double_Static_0001 start');
      let res = instance.overloadFunc((2.71828).toDouble(), (2.71828).toDouble());
      expect(res).assertEqual(2.71828);
      console.log('test_Overload_Double_Static_0001 done');
      done();
      console.log('test_Overload_Double_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Overload_String_Static_0100
     * @tc.name      test_Overload_String_Static_0001
     * @tc.desc      Test overloadFunc with string parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Overload_String_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Overload_String_Static_0001 start');
      let res = instance.overloadFunc("123", "123");
      expect(res).assertEqual("123");
      console.log('test_Overload_String_Static_0001 done');
      done();
      console.log('test_Overload_String_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Overload_ByteShort_Static_0100
     * @tc.name      test_Overload_ByteShort_Static_0001
     * @tc.desc      Test overloadFunc with byte and short parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Overload_ByteShort_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Overload_ByteShort_Static_0001 start');
      let res = instance.overloadFunc((5).toByte(), (42).toShort());
      expect(res).assertEqual(5);
      console.log('test_Overload_ByteShort_Static_0001 done');
      done();
      console.log('test_Overload_ByteShort_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Overload_ByteFloat_Static_0100
     * @tc.name      test_Overload_ByteFloat_Static_0001
     * @tc.desc      Test overloadFunc with byte and float parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Overload_ByteFloat_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Overload_ByteFloat_Static_0001 start');
      let res = instance.overloadFunc((5).toByte(), 3.14f);
      expect(res).assertEqual(5);
      console.log('test_Overload_ByteFloat_Static_0001 done');
      done();
      console.log('test_Overload_ByteFloat_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Overload_ByteString_Static_0100
     * @tc.name      test_Overload_ByteString_Static_0001
     * @tc.desc      Test overloadFunc with byte and string parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Overload_ByteString_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Overload_ByteString_Static_0001 start');
      let res = instance.overloadFunc((5).toByte(), "123");
      expect(res).assertEqual(5);
      console.log('test_Overload_ByteString_Static_0001 done');
      done();
      console.log('test_Overload_ByteString_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Overload_Enum_Static_0100
     * @tc.name      test_Overload_Enum_Static_0001
     * @tc.desc      Test overloadFunc with enum parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Overload_Enum_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Overload_Enum_Static_0001 start');
      let color = overloadTest.Color.red;
      let res = instance.overloadFunc(color);
      expect(res).assertEqual((1).toInt());
      console.log('test_Overload_Enum_Static_0001 done');
      done();
      console.log('test_Overload_Enum_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Overload_Struct_Static_0100
     * @tc.name      test_Overload_Struct_Static_0001
     * @tc.desc      Test overloadFunc with struct parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Overload_Struct_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Overload_Struct_Static_0001 start');
      let mystruct: overloadTest.Mystruct = {
        testNum: 2147483647,
        testStr: "path/to/source"
      };
      let res = instance.overloadFunc(mystruct);
      expect(res).assertEqual("path/to/source");
      console.log('test_Overload_Struct_Static_0001 done');
      done();
      console.log('test_Overload_Struct_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Overload_Array_Static_0100
     * @tc.name      test_Overload_Array_Static_0001
     * @tc.desc      Test overloadFunc with Array<int> parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Overload_Array_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Overload_Array_Static_0001 start');
      let numbers: int[] = [1, 2, 3, 4, 5];
      let ocp = instance.overloadFunc(numbers);
      expect(ocp).assertEqual((1).toInt());
      console.log('test_Overload_Array_Static_0001 done');
      done();
      console.log('test_Overload_Array_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Overload_Buffer_Static_0100
     * @tc.name      test_Overload_Buffer_Static_0001
     * @tc.desc      Test overloadFunc with ArrayBuffer parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Overload_Buffer_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Overload_Buffer_Static_0001 start');
      let numbersU8: byte[] = [1, 2, 3, 4, 5];
      let arrbuf1: ArrayBuffer = new ArrayBuffer(numbersU8.length);
      for (let i = 0; i < numbersU8.length; i++) {
        arrbuf1.set(i, numbersU8[i]);
      }
      let res = instance.overloadFunc(arrbuf1);
      expect(res).assertEqual(15);
      console.log('test_Overload_Buffer_Static_0001 done');
      done();
      console.log('test_Overload_Buffer_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Overload_5param_Static_0100
     * @tc.name      test_Overload_5param_Static_0001
     * @tc.desc      Test overloadFunc with 5 mixed parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Overload_5param_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Overload_5param_Static_0001 start');
      let caught: boolean = true;
      try {
        instance.overloadFunc(
          (1).toByte(), (1).toShort(), (1).toInt(), 1.1f, (1.123).toDouble());
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_Overload_5param_Static_0001 done');
      done();
      console.log('test_Overload_5param_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Overload_5param2_Static_0100
     * @tc.name      test_Overload_5param2_Static_0001
     * @tc.desc      Test overloadFunc with 5 mixed parameters (bool, string, byte, short, int)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Overload_5param2_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Overload_5param2_Static_0001 start');
      let res = instance.overloadFunc(
        true, "hello", (1).toByte(), (1).toShort(), (1).toInt());
      expect(res).assertTrue();
      console.log('test_Overload_5param2_Static_0001 done');
      done();
      console.log('test_Overload_5param2_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Overload_5param3_Static_0100
     * @tc.name      test_Overload_5param3_Static_0001
     * @tc.desc      Test overloadFunc with 5 mixed parameters (float, double, bool, string, byte)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Overload_5param3_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Overload_5param3_Static_0001 start');
      let res = instance.overloadFunc(1.0f, (1).toDouble(), true, "hello", (1).toByte());
      expect(res).assertEqual(1.0f);
      console.log('test_Overload_5param3_Static_0001 done');
      done();
      console.log('test_Overload_5param3_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Overload_5param4_Static_0100
     * @tc.name      test_Overload_5param4_Static_0001
     * @tc.desc      Test overloadFunc with 5 mixed parameters (string, short, int, float, bool)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Overload_5param4_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Overload_5param4_Static_0001 start');
      let res = instance.overloadFunc("1 as byte", (1).toShort(), (1).toInt(), 1.1f, true);
      expect(res).assertEqual("1 as byte");
      console.log('test_Overload_5param4_Static_0001 done');
      done();
      console.log('test_Overload_5param4_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Overload_5param5_Static_0100
     * @tc.name      test_Overload_5param5_Static_0001
     * @tc.desc      Test overloadFunc with 5 mixed parameters (3 strings, 2 bools)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Overload_5param5_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Overload_5param5_Static_0001 start');
      let res = instance.overloadFunc("1 as byte", "1 as short", "1 as int", true, false);
      expect(res).assertEqual("1 as byte");
      console.log('test_Overload_5param5_Static_0001 done');
      done();
      console.log('test_Overload_5param5_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Overload_5param6_Static_0100
     * @tc.name      test_Overload_5param6_Static_0001
     * @tc.desc      Test overloadFunc with 5 mixed parameters (short, int, float, double, bool)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Overload_5param6_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Overload_5param6_Static_0001 start');
      let res = instance.overloadFunc(
        (10).toShort(), (20).toInt(), 3.0f, (4.0).toDouble(), true);
      expect(res).assertEqual((10).toShort());
      console.log('test_Overload_5param6_Static_0001 done');
      done();
      console.log('test_Overload_5param6_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Overload_5param7_Static_0100
     * @tc.name      test_Overload_5param7_Static_0001
     * @tc.desc      Test overloadFunc with 5 mixed parameters (string, byte, short, float, bool)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Overload_5param7_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Overload_5param7_Static_0001 start');
      let res = instance.overloadFunc("hello", (1).toByte(), (2).toShort(), 3.0f, false);
      expect(res).assertEqual("hello");
      console.log('test_Overload_5param7_Static_0001 done');
      done();
      console.log('test_Overload_5param7_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Overload_5param8_Static_0100
     * @tc.name      test_Overload_5param8_Static_0001
     * @tc.desc      Test overloadFunc with 5 mixed parameters (bool, byte, int, double, string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Overload_5param8_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Overload_5param8_Static_0001 start');
      let res = instance.overloadFunc(
        true, (5).toByte(), (10).toInt(), (2.5).toDouble(), "world");
      expect(res).assertTrue();
      console.log('test_Overload_5param8_Static_0001 done');
      done();
      console.log('test_Overload_5param8_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Overload_5param9_Static_0100
     * @tc.name      test_Overload_5param9_Static_0001
     * @tc.desc      Test overloadFunc with 5 mixed parameters (double, bool, string, short, int)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Overload_5param9_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Overload_5param9_Static_0001 start');
      let res = instance.overloadFunc(
        (3.14).toDouble(), false, "test", (100).toShort(), (200).toInt());
      expect(res).assertEqual(3.14);
      console.log('test_Overload_5param9_Static_0001 done');
      done();
      console.log('test_Overload_5param9_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Overload_5param10_Static_0100
     * @tc.name      test_Overload_5param10_Static_0001
     * @tc.desc      Test overloadFunc with 5 mixed parameters (byte, float, bool, string, int)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Overload_5param10_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Overload_5param10_Static_0001 start');
      let res = instance.overloadFunc((42).toByte(), 1.5f, true, "example", (1000).toInt());
      expect(res).assertEqual((42).toByte());
      console.log('test_Overload_5param10_Static_0001 done');
      done();
      console.log('test_Overload_5param10_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Overload_EnumRecord_Static_0100
     * @tc.name      test_Overload_EnumRecord_Static_0001
     * @tc.desc      Test overloadFunc with Color and Record parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Overload_EnumRecord_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Overload_EnumRecord_Static_0001 start');
      const studentScores: Record<string, short> = {
        "math": (10).toShort(),
        "english": (85).toShort(),
        "science": (95).toShort(),
      };
      let color = overloadTest.Color.red;
      let caught: boolean = true;
      try {
        instance.overloadFunc(color, studentScores);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_Overload_EnumRecord_Static_0001 done');
      done();
      console.log('test_Overload_EnumRecord_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Overload_ArrayRecord_Static_0100
     * @tc.name      test_Overload_ArrayRecord_Static_0001
     * @tc.desc      Test overloadFunc with Array<int> and Record parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Overload_ArrayRecord_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Overload_ArrayRecord_Static_0001 start');
      const studentScores: Record<string, short> = {
        "math": (10).toShort(),
        "english": (85).toShort(),
        "science": (95).toShort(),
      };
      let numbers: int[] = [1, 2, 3, 4, 5];
      let caught: boolean = true;
      try {
        instance.overloadFunc(numbers, studentScores);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_Overload_ArrayRecord_Static_0001 done');
      done();
      console.log('test_Overload_ArrayRecord_Static_0001 end');
    });
  });
}