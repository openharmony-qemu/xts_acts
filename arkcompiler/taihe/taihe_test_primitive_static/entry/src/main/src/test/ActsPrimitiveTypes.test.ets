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
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import * as test_primitives from '../ets/Index'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function primitiveTypesTest(): void {
  describe("ActsPrimitiveTypesTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_Multiply_STATIC_0100
     * @tc.name      test_Multiply_Static_0001
     * @tc.desc      multiply valid argument
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Multiply_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Multiply_Static_0001 start');
      let result = test_primitives.multiply(2, 4)
      expect(result).assertEqual(8);
      console.log('test_Multiply_Static_0001 done');
      done();
      console.log('test_Multiply_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BaseBFunc_STATIC_0100
     * @tc.name      test_BaseBFunc_Static_0001
     * @tc.desc      multiply valid argument
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BaseBFunc_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BaseBFunc_Static_0001 start');
      let result = test_primitives.baseBFunc(false)
      expect(result).assertTrue();
      console.log('test_BaseBFunc_Static_0001 done');
      done();
      console.log('test_BaseBFunc_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BaseCFunc_STATIC_0100
     * @tc.name      test_BaseCFunc_Static_0001
     * @tc.desc      baseCFunc valid and invalid argument
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BaseCFunc_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BaseCFunc_Static_0001 start');
      let result = test_primitives.baseCFunc(10)
      expect(result).assertTrue();
      result = test_primitives.baseCFunc(5)
      expect(result).assertFalse();
      console.log('test_BaseCFunc_Static_0001 done');
      done();
      console.log('test_BaseCFunc_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BaseDFunc_STATIC_0100
     * @tc.name      test_BaseDFunc_Static_0001
     * @tc.desc      baseDFunc valid and invalid argument
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BaseDFunc_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BaseDFunc_Static_0001 start');
      let result = test_primitives.baseDFunc("test123")
      expect(result).assertTrue();
      result = test_primitives.baseDFunc("test1231")
      expect(result).assertFalse();
      console.log('test_BaseDFunc_Static_0001 done');
      done();
      console.log('test_BaseDFunc_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BaseEFunc_STATIC_0100
     * @tc.name      test_BaseEFunc_Static_0001
     * @tc.desc      baseEFunc with struct argument
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BaseEFunc_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BaseEFunc_Static_0001 start');
      const option: test_primitives.Foo = {testNum: 2147483647, testStr: "path/to/source"};
      let result = test_primitives.baseEFunc(option)
      expect(result).assertEqual("success");
      console.log('test_BaseEFunc_Static_0001 done');
      done();
      console.log('test_BaseEFunc_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesBoolean_STATIC_0100
     * @tc.name      test_PrimitivesBoolean_Static_0001
     * @tc.desc      PrimitivesBoolean interface methods and getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_PrimitivesBoolean_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_PrimitivesBoolean_Static_0001 start');
      let primitivesBoolTest: test_primitives.PrimitivesBoolean = test_primitives.get_interface_bool();
      let boolFunc2Result = primitivesBoolTest.testBaseBoolFunc2(true)
      expect(boolFunc2Result).assertEqual(65535);
      let boolFunc3Result = primitivesBoolTest.testBaseBoolFunc3(true)
      expect(boolFunc3Result).assertFalse();
      expect(primitivesBoolTest.boolTest).assertTrue();
      console.log('test_PrimitivesBoolean_Static_0001 done');
      done();
      console.log('test_PrimitivesBoolean_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_STATIC_0100
     * @tc.name      test_PrimitivesInteger_Static_0001
     * @tc.desc      PrimitivesInteger interface method and attribute getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_PrimitivesInteger_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_PrimitivesInteger_Static_0001 start');
      let primitivesIntegerTest: test_primitives.PrimitivesInteger = test_primitives.get_interface_interger();
      let result = primitivesIntegerTest.testBaseIntegerFunc22(100)
      expect(result).assertEqual(10000);
      expect(primitivesIntegerTest.i32testattribute).assertEqual(2147483647);
      console.log('test_PrimitivesInteger_Static_0001 done');
      done();
      console.log('test_PrimitivesInteger_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BaseAFunc_STATIC_0100
     * @tc.name      test_BaseAFunc_Static_0001
     * @tc.desc      baseAFunc with valid boolean arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BaseAFunc_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BaseAFunc_Static_0001 start');
      let pass: boolean = true;
      try {
        test_primitives.baseAFunc(true);
        test_primitives.baseAFunc(false);
      } catch (e) {
        pass = false;
        console.log('baseAFunc failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_BaseAFunc_Static_0001 done');
      done();
      console.log('test_BaseAFunc_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BaseHFunc_STATIC_0100
     * @tc.name      test_BaseHFunc_Static_0001
     * @tc.desc      baseHFunc with int and long arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BaseHFunc_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BaseHFunc_Static_0001 start');
      let result = test_primitives.baseHFunc(2147483647, 9223372036854775807)
      expect(result).assertEqual("-9223372034707292162");
      console.log('test_BaseHFunc_Static_0001 done');
      done();
      console.log('test_BaseHFunc_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BaseHFunc_STATIC_0200
     * @tc.name      test_BaseHFunc_Static_0002
     * @tc.desc      baseHFunc with negative int and long arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BaseHFunc_Static_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BaseHFunc_Static_0002 start');
      let result = test_primitives.baseHFunc(-2147483648, -9223372036854775808)
      expect(result).assertEqual("9223372034707292160");
      console.log('test_BaseHFunc_Static_0002 done');
      done();
      console.log('test_BaseHFunc_Static_0002 end');
    });

    /**
     * @tc.number    SUB_Taihe_BaseIFunc_STATIC_0100
     * @tc.name      test_BaseIFunc_Static_0001
     * @tc.desc      baseIFunc with double and float arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BaseIFunc_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BaseIFunc_Static_0001 start');
      let result = test_primitives.baseIFunc(3.1415926535897931, 4.3f)
      expect(result).assertEqual("7.441593");
      console.log('test_BaseIFunc_Static_0001 done');
      done();
      console.log('test_BaseIFunc_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BaseFunc1_STATIC_0100
     * @tc.name      test_BaseFunc1_Static_0001
     * @tc.desc      baseFunc1 with float argument returns float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BaseFunc1_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BaseFunc1_Static_0001 start');
      let result = test_primitives.baseFunc1(3.0f)
      expect(result).assertEqual(4.0f);
      console.log('test_BaseFunc1_Static_0001 done');
      done();
      console.log('test_BaseFunc1_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BaseFunc2_STATIC_0100
     * @tc.name      test_BaseFunc2_Static_0001
     * @tc.desc      baseFunc2 with float argument returns void
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BaseFunc2_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BaseFunc2_Static_0001 start');
      let pass: boolean = true;
      try {
        test_primitives.baseFunc2(3.0f);
      } catch (e) {
        pass = false;
        console.log('baseFunc2 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_BaseFunc2_Static_0001 done');
      done();
      console.log('test_BaseFunc2_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BaseFunc3_STATIC_0100
     * @tc.name      test_BaseFunc3_Static_0001
     * @tc.desc      baseFunc3 with float and double arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BaseFunc3_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BaseFunc3_Static_0001 start');
      let result = test_primitives.baseFunc3(3.0f, 3.14159265)
      expect(result).assertEqual(6.14159265);
      console.log('test_BaseFunc3_Static_0001 done');
      done();
      console.log('test_BaseFunc3_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BaseFunc4_STATIC_0100
     * @tc.name      test_BaseFunc4_Static_0001
     * @tc.desc      baseFunc4 with double argument returns double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BaseFunc4_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BaseFunc4_Static_0001 start');
      let result = test_primitives.baseFunc4(3.0)
      expect(result).assertEqual(4.0);
      console.log('test_BaseFunc4_Static_0001 done');
      done();
      console.log('test_BaseFunc4_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BaseFunc5_STATIC_0100
     * @tc.name      test_BaseFunc5_Static_0001
     * @tc.desc      baseFunc5 with double argument returns void
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BaseFunc5_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BaseFunc5_Static_0001 start');
      let pass: boolean = true;
      try {
        test_primitives.baseFunc5(3.14159);
      } catch (e) {
        pass = false;
        console.log('baseFunc5 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_BaseFunc5_Static_0001 done');
      done();
      console.log('test_BaseFunc5_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BaseFunc6_STATIC_0100
     * @tc.name      test_BaseFunc6_Static_0001
     * @tc.desc      baseFunc6 with string argument returns void
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BaseFunc6_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BaseFunc6_Static_0001 start');
      let pass: boolean = true;
      try {
        test_primitives.baseFunc6("testbaseFunc6");
        test_primitives.baseFunc6("testbaseFunc66");
      } catch (e) {
        pass = false;
        console.log('baseFunc6 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_BaseFunc6_Static_0001 done');
      done();
      console.log('test_BaseFunc6_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BaseFunc7_STATIC_0100
     * @tc.name      test_BaseFunc7_Static_0001
     * @tc.desc      baseFunc7 with string argument returns string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BaseFunc7_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BaseFunc7_Static_0001 start');
      let result = test_primitives.baseFunc7("TestbaseFunc7")
      expect(result).assertEqual("TestbaseFunc7");
      result = test_primitives.baseFunc7("testbaseFunc77")
      expect(result).assertEqual("testbaseFunc77false");
      console.log('test_BaseFunc7_Static_0001 done');
      done();
      console.log('test_BaseFunc7_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BaseFunc8_STATIC_0100
     * @tc.name      test_BaseFunc8_Static_0001
     * @tc.desc      baseFunc8 with string and int arguments returns string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BaseFunc8_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BaseFunc8_Static_0001 start');
      let result = test_primitives.baseFunc8("TestBaseFunc8", 32)
      expect(result).assertEqual("TestBaseFunc832");
      result = test_primitives.baseFunc8("testbaseFunc88", 32)
      expect(result).assertEqual("testbaseFunc88");
      console.log('test_BaseFunc8_Static_0001 done');
      done();
      console.log('test_BaseFunc8_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BaseFunc9_STATIC_0100
     * @tc.name      test_BaseFunc9_Static_0001
     * @tc.desc      baseFunc9 with multiple arguments returns void
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BaseFunc9_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BaseFunc9_Static_0001 start');
      let pass: boolean = true;
      try {
        test_primitives.baseFunc9("testbaseFunc9", 32, 9223372036854775807, true, 3.1f);
      } catch (e) {
        pass = false;
        console.log('baseFunc9 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_BaseFunc9_Static_0001 done');
      done();
      console.log('test_BaseFunc9_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BaseFunc10_STATIC_0100
     * @tc.name      test_BaseFunc10_Static_0001
     * @tc.desc      baseFunc10 with no argument returns void
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BaseFunc10_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BaseFunc10_Static_0001 start');
      let pass: boolean = true;
      try {
        test_primitives.baseFunc10();
      } catch (e) {
        pass = false;
        console.log('baseFunc10 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_BaseFunc10_Static_0001 done');
      done();
      console.log('test_BaseFunc10_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BaseFunc11_STATIC_0100
     * @tc.name      test_BaseFunc11_Static_0001
     * @tc.desc      baseFunc11 with int and boolean returns void
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BaseFunc11_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BaseFunc11_Static_0001 start');
      let pass: boolean = true;
      try {
        test_primitives.baseFunc11(32, true);
        test_primitives.baseFunc11(32, false);
      } catch (e) {
        pass = false;
        console.log('baseFunc11 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_BaseFunc11_Static_0001 done');
      done();
      console.log('test_BaseFunc11_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BaseFunc12_STATIC_0100
     * @tc.name      test_BaseFunc12_Static_0001
     * @tc.desc      baseFunc12 with int and long returns void
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BaseFunc12_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BaseFunc12_Static_0001 start');
      let pass: boolean = true;
      try {
        test_primitives.baseFunc12(32, 92233720368547758);
      } catch (e) {
        pass = false;
        console.log('baseFunc12 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_BaseFunc12_Static_0001 done');
      done();
      console.log('test_BaseFunc12_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BaseFunc13_STATIC_0100
     * @tc.name      test_BaseFunc13_Static_0001
     * @tc.desc      baseFunc13 with int and string returns void
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BaseFunc13_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BaseFunc13_Static_0001 start');
      let pass: boolean = true;
      try {
        test_primitives.baseFunc13(32, "testbaseFunc13");
      } catch (e) {
        pass = false;
        console.log('baseFunc13 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_BaseFunc13_Static_0001 done');
      done();
      console.log('test_BaseFunc13_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BaseFunc14_STATIC_0100
     * @tc.name      test_BaseFunc14_Static_0001
     * @tc.desc      baseFunc14 with long and boolean returns void
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BaseFunc14_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BaseFunc14_Static_0001 start');
      let pass: boolean = true;
      try {
        test_primitives.baseFunc14(92233720368547758, true);
        test_primitives.baseFunc14(92233720368547758, false);
      } catch (e) {
        pass = false;
        console.log('baseFunc14 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_BaseFunc14_Static_0001 done');
      done();
      console.log('test_BaseFunc14_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BaseFunc15_STATIC_0100
     * @tc.name      test_BaseFunc15_Static_0001
     * @tc.desc      baseFunc15 with long and float returns void
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BaseFunc15_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BaseFunc15_Static_0001 start');
      let pass: boolean = true;
      try {
        test_primitives.baseFunc15(32, 3.15f);
      } catch (e) {
        pass = false;
        console.log('baseFunc15 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_BaseFunc15_Static_0001 done');
      done();
      console.log('test_BaseFunc15_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BaseFunc16_STATIC_0100
     * @tc.name      test_BaseFunc16_Static_0001
     * @tc.desc      baseFunc16 with long and double returns void
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BaseFunc16_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BaseFunc16_Static_0001 start');
      let pass: boolean = true;
      try {
        test_primitives.baseFunc16(32, 3.141592653589793);
        test_primitives.baseFunc16(32, -3.141592653589793);
      } catch (e) {
        pass = false;
        console.log('baseFunc16 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_BaseFunc16_Static_0001 done');
      done();
      console.log('test_BaseFunc16_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BaseFunc17_STATIC_0100
     * @tc.name      test_BaseFunc17_Static_0001
     * @tc.desc      baseFunc17 with float and boolean returns void
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BaseFunc17_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BaseFunc17_Static_0001 start');
      let pass: boolean = true;
      try {
        test_primitives.baseFunc17(123.456f, true);
        test_primitives.baseFunc17(3.14159f, false);
      } catch (e) {
        pass = false;
        console.log('baseFunc17 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_BaseFunc17_Static_0001 done');
      done();
      console.log('test_BaseFunc17_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BaseFunc18_STATIC_0100
     * @tc.name      test_BaseFunc18_Static_0001
     * @tc.desc      baseFunc18 with float and string returns void
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BaseFunc18_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BaseFunc18_Static_0001 start');
      let pass: boolean = true;
      try {
        test_primitives.baseFunc18(123.456f, "testbaseFunc18");
        test_primitives.baseFunc18(3.14159f, "testbaseFunc18");
      } catch (e) {
        pass = false;
        console.log('baseFunc18 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_BaseFunc18_Static_0001 done');
      done();
      console.log('test_BaseFunc18_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BaseFunc19_STATIC_0100
     * @tc.name      test_BaseFunc19_Static_0001
     * @tc.desc      baseFunc19 with double and string returns void
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BaseFunc19_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BaseFunc19_Static_0001 start');
      let pass: boolean = true;
      try {
        test_primitives.baseFunc19(3.141592653589793, "testbaseFunc19");
      } catch (e) {
        pass = false;
        console.log('baseFunc19 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_BaseFunc19_Static_0001 done');
      done();
      console.log('test_BaseFunc19_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BaseFunc20_STATIC_0100
     * @tc.name      test_BaseFunc20_Static_0001
     * @tc.desc      baseFunc20 with double and boolean returns void
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BaseFunc20_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BaseFunc20_Static_0001 start');
      let pass: boolean = true;
      try {
        test_primitives.baseFunc20(3.141592653589793, true);
        test_primitives.baseFunc20(3.141592653589793, false);
      } catch (e) {
        pass = false;
        console.log('baseFunc20 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_BaseFunc20_Static_0001 done');
      done();
      console.log('test_BaseFunc20_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BaseFunc21_STATIC_0100
     * @tc.name      test_BaseFunc21_Static_0001
     * @tc.desc      baseFunc21 with optional int and long returns void
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BaseFunc21_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BaseFunc21_Static_0001 start');
      let pass: boolean = true;
      try {
        test_primitives.baseFunc21(32, (65535).toLong());
        test_primitives.baseFunc21(undefined, (65535).toLong());
        test_primitives.baseFunc21(undefined, undefined);
        test_primitives.baseFunc21(32, undefined);
      } catch (e) {
        pass = false;
        console.log('baseFunc21 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_BaseFunc21_Static_0001 done');
      done();
      console.log('test_BaseFunc21_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BaseFunc22_STATIC_0100
     * @tc.name      test_BaseFunc22_Static_0001
     * @tc.desc      baseFunc22 with optional float and double returns void
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BaseFunc22_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BaseFunc22_Static_0001 start');
      let pass: boolean = true;
      try {
        test_primitives.baseFunc22(3.14159f, 3.141592653589793);
        test_primitives.baseFunc22(undefined, 3.141592653589793);
        test_primitives.baseFunc22(undefined, undefined);
        test_primitives.baseFunc22(3.14159f, undefined);
      } catch (e) {
        pass = false;
        console.log('baseFunc22 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_BaseFunc22_Static_0001 done');
      done();
      console.log('test_BaseFunc22_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BaseFunc23_STATIC_0100
     * @tc.name      test_BaseFunc23_Static_0001
     * @tc.desc      baseFunc23 with optional string and boolean returns void
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BaseFunc23_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BaseFunc23_Static_0001 start');
      let pass: boolean = true;
      try {
        test_primitives.baseFunc23("testBaseFunc23", true);
        test_primitives.baseFunc23(undefined, false);
        test_primitives.baseFunc23(undefined, undefined);
        test_primitives.baseFunc23("testBaseFunc23", undefined);
      } catch (e) {
        pass = false;
        console.log('baseFunc23 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_BaseFunc23_Static_0001 done');
      done();
      console.log('test_BaseFunc23_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BaseFunc24_STATIC_0100
     * @tc.name      test_BaseFunc24_Static_0001
     * @tc.desc      baseFunc24 with optional short and long returns void
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BaseFunc24_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BaseFunc24_Static_0001 start');
      let pass: boolean = true;
      try {
        test_primitives.baseFunc24((32767).toShort(), 92233720368547758);
        test_primitives.baseFunc24(undefined, 92233720368547758);
        test_primitives.baseFunc24(undefined, undefined);
        test_primitives.baseFunc24((32767).toShort(), undefined);
      } catch (e) {
        pass = false;
        console.log('baseFunc24 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_BaseFunc24_Static_0001 done');
      done();
      console.log('test_BaseFunc24_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_EnumBar_STATIC_0100
     * @tc.name      test_EnumBar_Static_0001
     * @tc.desc      Bar enum values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_EnumBar_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_EnumBar_Static_0001 start');
      let red: byte = test_primitives.Bar.RED.valueOf();
      let green: byte = test_primitives.Bar.GREEN.valueOf();
      let blue: byte = test_primitives.Bar.BLUE.valueOf();
      expect(red).assertEqual((0).toByte());
      expect(green).assertEqual((1).toByte());
      expect(blue).assertEqual((2).toByte());
      console.log('test_EnumBar_Static_0001 done');
      done();
      console.log('test_EnumBar_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Constants_STATIC_0100
     * @tc.name      test_Constants_Static_0001
     * @tc.desc      const enum and injected constants
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Constants_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Constants_Static_0001 start');
      expect(test_primitives.CONSTANT_BOOL_TRUE).assertTrue();
      expect(test_primitives.CONSTANT_BOOL_FALSE).assertFalse();
      expect(test_primitives.CONSTANT_I32_001).assertEqual(10000);
      expect(test_primitives.CONSTANT_I32_002).assertEqual(10001);
      console.log('test_Constants_Static_0001 done');
      done();
      console.log('test_Constants_Static_0001 end');
    });
  })
}
