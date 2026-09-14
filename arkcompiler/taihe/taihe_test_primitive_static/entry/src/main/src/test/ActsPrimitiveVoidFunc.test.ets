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
import * as test_export from '../ets/void_func'

export default function primitiveVoidFuncTest(): void {
  describe("ActsPrimitiveVoidFuncTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_VoidFunc_FUNC1_STATIC_0100
     * @tc.name      test_Myfunc1_Static_0001
     * @tc.desc      VoidFunc Myfunc1 with no argument
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Myfunc1_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Myfunc1_Static_0001 start');
      let pass: boolean = true;
      try {
        test_export.mytest.myfunc1();
      } catch (e) {
        pass = false;
        console.log('Myfunc1 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_Myfunc1_Static_0001 done');
      done();
      console.log('test_Myfunc1_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_VoidFunc_FUNC2_STATIC_0100
     * @tc.name      test_Myfunc2_Static_0001
     * @tc.desc      VoidFunc Myfunc2 with byte and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Myfunc2_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Myfunc2_Static_0001 start');
      let pass: boolean = true;
      try {
        test_export.mytest.myfunc2((100).toByte(), (32767).toShort());
        test_export.mytest.myfunc2((-128).toByte(), (-32768).toShort());
      } catch (e) {
        pass = false;
        console.log('Myfunc2 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_Myfunc2_Static_0001 done');
      done();
      console.log('test_Myfunc2_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_VoidFunc_FUNC3_STATIC_0100
     * @tc.name      test_Myfunc3_Static_0001
     * @tc.desc      VoidFunc Myfunc3 with int and boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Myfunc3_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Myfunc3_Static_0001 start');
      let pass: boolean = true;
      try {
        test_export.mytest.myfunc3(2147483647, true);
        test_export.mytest.myfunc3(-2147483648, false);
      } catch (e) {
        pass = false;
        console.log('Myfunc3 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_Myfunc3_Static_0001 done');
      done();
      console.log('test_Myfunc3_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_VoidFunc_FUNC4_STATIC_0100
     * @tc.name      test_Myfunc4_Static_0001
     * @tc.desc      VoidFunc Myfunc4 with int and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Myfunc4_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Myfunc4_Static_0001 start');
      let pass: boolean = true;
      try {
        test_export.mytest.myfunc4(2147483647, 9223372036854775807);
        test_export.mytest.myfunc4(-2147483648, -9223372036854775808);
      } catch (e) {
        pass = false;
        console.log('Myfunc4 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_Myfunc4_Static_0001 done');
      done();
      console.log('test_Myfunc4_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_VoidFunc_FUNC5_STATIC_0100
     * @tc.name      test_Myfunc5_Static_0001
     * @tc.desc      VoidFunc Myfunc5 with int and string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Myfunc5_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Myfunc5_Static_0001 start');
      let pass: boolean = true;
      try {
        test_export.mytest.myfunc5(2147483647, "testMyfunc5");
        test_export.mytest.myfunc5(-2147483648, "testMyfunc5_1");
      } catch (e) {
        pass = false;
        console.log('Myfunc5 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_Myfunc5_Static_0001 done');
      done();
      console.log('test_Myfunc5_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_VoidFunc_FUNC6_STATIC_0100
     * @tc.name      test_Myfunc6_Static_0001
     * @tc.desc      VoidFunc Myfunc6 with long and boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Myfunc6_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Myfunc6_Static_0001 start');
      let pass: boolean = true;
      try {
        test_export.mytest.myfunc6(9223372036854775807, true);
        test_export.mytest.myfunc6(-9223372036854775808, false);
      } catch (e) {
        pass = false;
        console.log('Myfunc6 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_Myfunc6_Static_0001 done');
      done();
      console.log('test_Myfunc6_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_VoidFunc_FUNC7_STATIC_0100
     * @tc.name      test_Myfunc7_Static_0001
     * @tc.desc      VoidFunc Myfunc7 with long and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Myfunc7_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Myfunc7_Static_0001 start');
      let pass: boolean = true;
      try {
        test_export.mytest.myfunc7(9223372036854775807, 3.14159f);
        test_export.mytest.myfunc7(-9223372036854775808, -3.14159f);
      } catch (e) {
        pass = false;
        console.log('Myfunc7 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_Myfunc7_Static_0001 done');
      done();
      console.log('test_Myfunc7_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_VoidFunc_FUNC8_STATIC_0100
     * @tc.name      test_Myfunc8_Static_0001
     * @tc.desc      VoidFunc Myfunc8 with long and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Myfunc8_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Myfunc8_Static_0001 start');
      let pass: boolean = true;
      try {
        test_export.mytest.myfunc8(9223372036854775807, 3.141592653589793);
        test_export.mytest.myfunc8(-9223372036854775808, -3.141592653589793);
      } catch (e) {
        pass = false;
        console.log('Myfunc8 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_Myfunc8_Static_0001 done');
      done();
      console.log('test_Myfunc8_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_VoidFunc_FUNC9_STATIC_0100
     * @tc.name      test_Myfunc9_Static_0001
     * @tc.desc      VoidFunc Myfunc9 with float and boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Myfunc9_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Myfunc9_Static_0001 start');
      let pass: boolean = true;
      try {
        test_export.mytest.myfunc9(123.456f, true);
        test_export.mytest.myfunc9(-3.14159f, false);
      } catch (e) {
        pass = false;
        console.log('Myfunc9 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_Myfunc9_Static_0001 done');
      done();
      console.log('test_Myfunc9_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_VoidFunc_FUNC10_STATIC_0100
     * @tc.name      test_Myfunc10_Static_0001
     * @tc.desc      VoidFunc Myfunc10 with float and string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Myfunc10_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Myfunc10_Static_0001 start');
      let pass: boolean = true;
      try {
        test_export.mytest.myfunc10(123.456f, "testMyfunc10");
        test_export.mytest.myfunc10(-3.14159f, "testMyfunc10_1");
      } catch (e) {
        pass = false;
        console.log('Myfunc10 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_Myfunc10_Static_0001 done');
      done();
      console.log('test_Myfunc10_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_VoidFunc_FUNC11_STATIC_0100
     * @tc.name      test_Myfunc11_Static_0001
     * @tc.desc      VoidFunc Myfunc11 with double and string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Myfunc11_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Myfunc11_Static_0001 start');
      let pass: boolean = true;
      try {
        test_export.mytest.myfunc11(3.141592653589793, "testMyfunc11");
        test_export.mytest.myfunc11(-3.141592653589793, "testMyfunc11_1");
      } catch (e) {
        pass = false;
        console.log('Myfunc11 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_Myfunc11_Static_0001 done');
      done();
      console.log('test_Myfunc11_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_VoidFunc_FUNC12_STATIC_0100
     * @tc.name      test_Myfunc12_Static_0001
     * @tc.desc      VoidFunc Myfunc12 with optional int and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Myfunc12_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Myfunc12_Static_0001 start');
      let pass: boolean = true;
      try {
        test_export.mytest.myfunc12(256, (6553565536).toLong());
        test_export.mytest.myfunc12(undefined, (65535).toLong());
        test_export.mytest.myfunc12(undefined, undefined);
        test_export.mytest.myfunc12(-65535, undefined);
      } catch (e) {
        pass = false;
        console.log('Myfunc12 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_Myfunc12_Static_0001 done');
      done();
      console.log('test_Myfunc12_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_VoidFunc_FUNC13_STATIC_0100
     * @tc.name      test_Myfunc13_Static_0001
     * @tc.desc      VoidFunc Myfunc13 with optional float and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Myfunc13_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Myfunc13_Static_0001 start');
      let pass: boolean = true;
      try {
        test_export.mytest.myfunc13(-3.1415952f, 3.141592653589793);
        test_export.mytest.myfunc13(undefined, 3.141592653589793);
        test_export.mytest.myfunc13(undefined, undefined);
        test_export.mytest.myfunc13(-3.1415952f, undefined);
      } catch (e) {
        pass = false;
        console.log('Myfunc13 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_Myfunc13_Static_0001 done');
      done();
      console.log('test_Myfunc13_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_VoidFunc_FUNC14_STATIC_0100
     * @tc.name      test_Myfunc14_Static_0001
     * @tc.desc      VoidFunc Myfunc14 with optional string and boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Myfunc14_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Myfunc14_Static_0001 start');
      let pass: boolean = true;
      try {
        test_export.mytest.myfunc14("testMyfunc14", true);
        test_export.mytest.myfunc14(undefined, false);
        test_export.mytest.myfunc14(undefined, undefined);
        test_export.mytest.myfunc14("testMyfunc14", undefined);
      } catch (e) {
        pass = false;
        console.log('Myfunc14 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_Myfunc14_Static_0001 done');
      done();
      console.log('test_Myfunc14_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_VoidFunc_FUNC15_STATIC_0100
     * @tc.name      test_Myfunc15_Static_0001
     * @tc.desc      VoidFunc Myfunc15 with optional short and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Myfunc15_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Myfunc15_Static_0001 start');
      let pass: boolean = true;
      try {
        test_export.mytest.myfunc15((32767).toShort(), 92233720368547758);
        test_export.mytest.myfunc15(undefined, 92233720368547758);
        test_export.mytest.myfunc15(undefined, undefined);
        test_export.mytest.myfunc15((-32768).toShort(), undefined);
      } catch (e) {
        pass = false;
        console.log('Myfunc15 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_Myfunc15_Static_0001 done');
      done();
      console.log('test_Myfunc15_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_VoidFunc_FUNC16_STATIC_0100
     * @tc.name      test_Myfunc16_Static_0001
     * @tc.desc      VoidFunc Myfunc16 with optional short and BarTest enum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Myfunc16_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Myfunc16_Static_0001 start');
      let pass: boolean = true;
      try {
        test_export.mytest.myfunc16((32767).toShort(), test_export.mytest.BarTest.A);
        test_export.mytest.myfunc16(undefined, test_export.mytest.BarTest.B);
        test_export.mytest.myfunc16((-32768).toShort(), test_export.mytest.BarTest.C);
        test_export.mytest.myfunc16(undefined, test_export.mytest.BarTest.A);
      } catch (e) {
        pass = false;
        console.log('Myfunc16 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_Myfunc16_Static_0001 done');
      done();
      console.log('test_Myfunc16_Static_0001 end');
    });
  })
}