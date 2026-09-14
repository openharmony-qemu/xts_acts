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
import * as test_primitives from '../ets/Index'

export default function primitiveVoidTest(): void {
  describe("ActsPrimitiveVoidTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    let primitivesTest: test_primitives.PrimitivesVoid = test_primitives.get_interface();

    /**
     * @tc.number    SUB_Taihe_PrimitivesVoid_FUNC1_STATIC_0100
     * @tc.name      test_TestBaseFunc1_Static_0001
     * @tc.desc      PrimitivesVoid TestBaseFunc1 with no argument
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseFunc1_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseFunc1_Static_0001 start');
      let pass: boolean = true;
      try {
        primitivesTest.testBaseFunc1();
      } catch (e) {
        pass = false;
        console.log('TestBaseFunc1 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_TestBaseFunc1_Static_0001 done');
      done();
      console.log('test_TestBaseFunc1_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesVoid_FUNC2_STATIC_0100
     * @tc.name      test_TestBaseFunc2_Static_0001
     * @tc.desc      PrimitivesVoid TestBaseFunc2 with int and boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseFunc2_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseFunc2_Static_0001 start');
      let pass: boolean = true;
      try {
        primitivesTest.testBaseFunc2(32, true);
        primitivesTest.testBaseFunc2(32, false);
      } catch (e) {
        pass = false;
        console.log('TestBaseFunc2 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_TestBaseFunc2_Static_0001 done');
      done();
      console.log('test_TestBaseFunc2_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesVoid_FUNC3_STATIC_0100
     * @tc.name      test_TestBaseFunc3_Static_0001
     * @tc.desc      PrimitivesVoid TestBaseFunc3 with int and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseFunc3_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseFunc3_Static_0001 start');
      let pass: boolean = true;
      try {
        primitivesTest.testBaseFunc3(-2147483648, 92233720368547758);
      } catch (e) {
        pass = false;
        console.log('TestBaseFunc3 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_TestBaseFunc3_Static_0001 done');
      done();
      console.log('test_TestBaseFunc3_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesVoid_FUNC4_STATIC_0100
     * @tc.name      test_TestBaseFunc4_Static_0001
     * @tc.desc      PrimitivesVoid TestBaseFunc4 with int and string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseFunc4_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseFunc4_Static_0001 start');
      let pass: boolean = true;
      try {
        primitivesTest.testBaseFunc4(2147483647, "testBaseFunc4");
      } catch (e) {
        pass = false;
        console.log('TestBaseFunc4 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_TestBaseFunc4_Static_0001 done');
      done();
      console.log('test_TestBaseFunc4_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesVoid_FUNC5_STATIC_0100
     * @tc.name      test_TestBaseFunc5_Static_0001
     * @tc.desc      PrimitivesVoid TestBaseFunc5 with long and boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseFunc5_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseFunc5_Static_0001 start');
      let pass: boolean = true;
      try {
        primitivesTest.testBaseFunc5(-92233720368547758, true);
        primitivesTest.testBaseFunc5(-92233720368547758, false);
      } catch (e) {
        pass = false;
        console.log('TestBaseFunc5 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_TestBaseFunc5_Static_0001 done');
      done();
      console.log('test_TestBaseFunc5_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesVoid_FUNC6_STATIC_0100
     * @tc.name      test_TestBaseFunc6_Static_0001
     * @tc.desc      PrimitivesVoid TestBaseFunc6 with long and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseFunc6_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseFunc6_Static_0001 start');
      let pass: boolean = true;
      try {
        primitivesTest.testBaseFunc6(32, 3.15f);
      } catch (e) {
        pass = false;
        console.log('TestBaseFunc6 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_TestBaseFunc6_Static_0001 done');
      done();
      console.log('test_TestBaseFunc6_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesVoid_FUNC7_STATIC_0100
     * @tc.name      test_TestBaseFunc7_Static_0001
     * @tc.desc      PrimitivesVoid TestBaseFunc7 with long and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseFunc7_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseFunc7_Static_0001 start');
      let pass: boolean = true;
      try {
        primitivesTest.testBaseFunc7(9223372036854775807, 3.141592653589793);
        primitivesTest.testBaseFunc7(-9223372036854775808, -3.141592653589793);
      } catch (e) {
        pass = false;
        console.log('TestBaseFunc7 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_TestBaseFunc7_Static_0001 done');
      done();
      console.log('test_TestBaseFunc7_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesVoid_FUNC8_STATIC_0100
     * @tc.name      test_TestBaseFunc8_Static_0001
     * @tc.desc      PrimitivesVoid TestBaseFunc8 with float and boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseFunc8_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseFunc8_Static_0001 start');
      let pass: boolean = true;
      try {
        primitivesTest.testBaseFunc8(123.456789f, true);
        primitivesTest.testBaseFunc8(3.1415978f, false);
      } catch (e) {
        pass = false;
        console.log('TestBaseFunc8 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_TestBaseFunc8_Static_0001 done');
      done();
      console.log('test_TestBaseFunc8_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesVoid_FUNC9_STATIC_0100
     * @tc.name      test_TestBaseFunc9_Static_0001
     * @tc.desc      PrimitivesVoid TestBaseFunc9 with float and string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseFunc9_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseFunc9_Static_0001 start');
      let pass: boolean = true;
      try {
        primitivesTest.testBaseFunc9(123.456789f, "testBaseFunc9");
        primitivesTest.testBaseFunc9(3.1415978f, "testBaseFunc9");
      } catch (e) {
        pass = false;
        console.log('TestBaseFunc9 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_TestBaseFunc9_Static_0001 done');
      done();
      console.log('test_TestBaseFunc9_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesVoid_FUNC10_STATIC_0100
     * @tc.name      test_TestBaseFunc10_Static_0001
     * @tc.desc      PrimitivesVoid TestBaseFunc10 with double and string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseFunc10_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseFunc10_Static_0001 start');
      let pass: boolean = true;
      try {
        primitivesTest.testBaseFunc10(-3.141592653589793, "testBaseFunc10");
      } catch (e) {
        pass = false;
        console.log('TestBaseFunc10 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_TestBaseFunc10_Static_0001 done');
      done();
      console.log('test_TestBaseFunc10_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesVoid_FUNC11_STATIC_0100
     * @tc.name      test_TestBaseFunc11_Static_0001
     * @tc.desc      PrimitivesVoid TestBaseFunc11 with double and boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseFunc11_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseFunc11_Static_0001 start');
      let pass: boolean = true;
      try {
        primitivesTest.testBaseFunc11(-3.141592653589793, true);
        primitivesTest.testBaseFunc11(-3.141592653589793, false);
      } catch (e) {
        pass = false;
        console.log('TestBaseFunc11 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_TestBaseFunc11_Static_0001 done');
      done();
      console.log('test_TestBaseFunc11_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesVoid_FUNC12_STATIC_0100
     * @tc.name      test_TestBaseFunc12_Static_0001
     * @tc.desc      PrimitivesVoid TestBaseFunc12 with optional int and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseFunc12_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseFunc12_Static_0001 start');
      let pass: boolean = true;
      try {
        primitivesTest.testBaseFunc12(256, (6553565536).toLong());
        primitivesTest.testBaseFunc12(undefined, (65535).toLong());
        primitivesTest.testBaseFunc12(undefined, undefined);
        primitivesTest.testBaseFunc12(-65535, undefined);
      } catch (e) {
        pass = false;
        console.log('TestBaseFunc12 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_TestBaseFunc12_Static_0001 done');
      done();
      console.log('test_TestBaseFunc12_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesVoid_FUNC13_STATIC_0100
     * @tc.name      test_TestBaseFunc13_Static_0001
     * @tc.desc      PrimitivesVoid TestBaseFunc13 with optional float and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseFunc13_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseFunc13_Static_0001 start');
      let pass: boolean = true;
      try {
        primitivesTest.testBaseFunc13(-3.1415952f, 3.141592653589793);
        primitivesTest.testBaseFunc13(undefined, 3.141592653589793);
        primitivesTest.testBaseFunc13(undefined, undefined);
        primitivesTest.testBaseFunc13(-3.1415952f, undefined);
      } catch (e) {
        pass = false;
        console.log('TestBaseFunc13 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_TestBaseFunc13_Static_0001 done');
      done();
      console.log('test_TestBaseFunc13_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesVoid_FUNC14_STATIC_0100
     * @tc.name      test_TestBaseFunc14_Static_0001
     * @tc.desc      PrimitivesVoid TestBaseFunc14 with optional string and boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseFunc14_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseFunc14_Static_0001 start');
      let pass: boolean = true;
      try {
        primitivesTest.testBaseFunc14("testBaseFunc23", true);
        primitivesTest.testBaseFunc14(undefined, false);
        primitivesTest.testBaseFunc14(undefined, undefined);
        primitivesTest.testBaseFunc14("testBaseFunc14", undefined);
      } catch (e) {
        pass = false;
        console.log('TestBaseFunc14 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_TestBaseFunc14_Static_0001 done');
      done();
      console.log('test_TestBaseFunc14_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesVoid_FUNC15_STATIC_0100
     * @tc.name      test_TestBaseFunc15_Static_0001
     * @tc.desc      PrimitivesVoid TestBaseFunc15 with optional short and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseFunc15_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseFunc15_Static_0001 start');
      let pass: boolean = true;
      try {
        primitivesTest.testBaseFunc15((32767).toShort(), 92233720368547758);
        primitivesTest.testBaseFunc15(undefined, 92233720368547758);
        primitivesTest.testBaseFunc15(undefined, undefined);
        primitivesTest.testBaseFunc15((-32768).toShort(), undefined);
      } catch (e) {
        pass = false;
        console.log('TestBaseFunc15 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_TestBaseFunc15_Static_0001 done');
      done();
      console.log('test_TestBaseFunc15_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesVoid_FUNC16_STATIC_0100
     * @tc.name      test_TestBaseFunc16_Static_0001
     * @tc.desc      PrimitivesVoid TestBaseFunc16 with byte and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseFunc16_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseFunc16_Static_0001 start');
      let pass: boolean = true;
      try {
        primitivesTest.testBaseFunc16((127).toByte(), (32765).toShort());
        primitivesTest.testBaseFunc16((-128).toByte(), (-32765).toShort());
      } catch (e) {
        pass = false;
        console.log('TestBaseFunc16 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_TestBaseFunc16_Static_0001 done');
      done();
      console.log('test_TestBaseFunc16_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesVoid_FUNC17_STATIC_0100
     * @tc.name      test_TestBaseFunc17_Static_0001
     * @tc.desc      PrimitivesVoid TestBaseFunc17 with int array and byte array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseFunc17_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseFunc17_Static_0001 start');
      let intArray: int[] = [1, 2, 3, 4, 5];
      let byteArray: byte[] = [100, 101, 102];
      let pass: boolean = true;
      try {
        primitivesTest.testBaseFunc17(intArray, byteArray);
      } catch (e) {
        pass = false;
        console.log('TestBaseFunc17 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_TestBaseFunc17_Static_0001 done');
      done();
      console.log('test_TestBaseFunc17_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesVoid_FUNC18_STATIC_0100
     * @tc.name      test_TestBaseFunc18_Static_0001
     * @tc.desc      PrimitivesVoid TestBaseFunc18 with short array and long array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseFunc18_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseFunc18_Static_0001 start');
      let shortArray: short[] = [32767, 32767, -32768, 4, 5];
      let longArray: long[] = [10086, 10010, 10000, 9223372036854775807, -9223372036854775808];
      let pass: boolean = true;
      try {
        primitivesTest.testBaseFunc18(shortArray, longArray);
      } catch (e) {
        pass = false;
        console.log('TestBaseFunc18 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_TestBaseFunc18_Static_0001 done');
      done();
      console.log('test_TestBaseFunc18_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesVoid_FUNC19_STATIC_0100
     * @tc.name      test_TestBaseFunc19_Static_0001
     * @tc.desc      PrimitivesVoid TestBaseFunc19 with float array and double array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseFunc19_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseFunc19_Static_0001 start');
      let floatArray: float[] = [3.14159f, 123.0f, -45678.5454f, 0.052f, 0.01f];
      let doubleArray: double[] = [10086.123456, -156.45678945, 3.141592345454545,
        9223372036.854775807, -922337203.6854775808];
      let pass: boolean = true;
      try {
        primitivesTest.testBaseFunc19(floatArray, doubleArray);
      } catch (e) {
        pass = false;
        console.log('TestBaseFunc19 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_TestBaseFunc19_Static_0001 done');
      done();
      console.log('test_TestBaseFunc19_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesVoid_FUNC20_STATIC_0100
     * @tc.name      test_TestBaseFunc20_Static_0001
     * @tc.desc      PrimitivesVoid TestBaseFunc20 with boolean array and string array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseFunc20_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseFunc20_Static_0001 start');
      let booleanArray: boolean[] = [true, false, false, true, true];
      let strArray: string[] = ["test1", "test111", "12345~!<>?|{}[]", "test333", "@#$$%^&&*123"];
      let pass: boolean = true;
      try {
        primitivesTest.testBaseFunc20(booleanArray, strArray);
      } catch (e) {
        pass = false;
        console.log('TestBaseFunc20 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_TestBaseFunc20_Static_0001 done');
      done();
      console.log('test_TestBaseFunc20_Static_0001 end');
    });
  })
}
