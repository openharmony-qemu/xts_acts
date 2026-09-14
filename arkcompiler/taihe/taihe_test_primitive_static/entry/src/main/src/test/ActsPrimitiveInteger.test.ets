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

export default function primitiveIntegerTest(): void {
  describe("ActsPrimitiveIntegerTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    let primitivesIntegerTest: test_primitives.PrimitivesInteger = test_primitives.get_interface_interger();

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC1_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc1_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc1 normal and out of range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc1_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc1_Static_0001 start');
      let result = primitivesIntegerTest.testBaseIntegerFunc1((100).toByte())
      expect(result).assertEqual((101).toByte());
      let caught: boolean = false;
      try {
        primitivesIntegerTest.testBaseIntegerFunc1((-1).toByte());
      } catch (e) {
        caught = true;
        expect(e.toString())
          .assertEqual("Error: out of range The i8 maximum value is 127 and minnum values is -128");
      }
      expect(caught).assertTrue();
      console.log('test_TestBaseIntegerFunc1_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc1_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC2_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc2_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc2 normal and out of range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc2_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc2_Static_0001 start');
      let result = primitivesIntegerTest.testBaseIntegerFunc2((100).toByte(), (27).toShort())
      expect(result).assertEqual((127).toByte());
      result = primitivesIntegerTest.testBaseIntegerFunc2((100).toByte(), (32667).toShort())
      expect(result).assertEqual((-1).toByte());
      let caught: boolean = false;
      try {
        primitivesIntegerTest.testBaseIntegerFunc2((-1).toByte(), (100).toShort());
      } catch (e) {
        caught = true;
        expect(e.toString())
          .assertEqual("Error: out of range The i8 maximum value is 127 and minnum values is -128");
      }
      expect(caught).assertTrue();
      caught = false;
      try {
        primitivesIntegerTest.testBaseIntegerFunc2((100).toByte(), (-1).toShort());
      } catch (e) {
        caught = true;
        expect(e.toString())
          .assertEqual("Error: out of range The i16 maximum value is 32767 and minnum values is -32768");
      }
      expect(caught).assertTrue();
      console.log('test_TestBaseIntegerFunc2_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc2_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC3_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc3_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc3 returns void
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc3_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc3_Static_0001 start');
      let pass: boolean = true;
      try {
        primitivesIntegerTest.testBaseIntegerFunc3((100).toByte(), (27).toShort());
      } catch (e) {
        pass = false;
        console.log('TestBaseIntegerFunc3 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_TestBaseIntegerFunc3_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc3_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC4_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc4_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc4 returns short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc4_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc4_Static_0001 start');
      let result = primitivesIntegerTest.testBaseIntegerFunc4((100).toByte(), (32667).toShort())
      expect(result).assertEqual((32767).toShort());
      result = primitivesIntegerTest.testBaseIntegerFunc4((127).toByte(), (-32768).toShort())
      expect(result).assertEqual((-32641).toShort());
      result = primitivesIntegerTest.testBaseIntegerFunc4((0).toByte(), (0).toShort())
      expect(result).assertEqual((0).toShort());
      console.log('test_TestBaseIntegerFunc4_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc4_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC5_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc5_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc5 returns byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc5_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc5_Static_0001 start');
      let result = primitivesIntegerTest.testBaseIntegerFunc5((100).toByte(), 2147483547)
      expect(result).assertEqual((-1).toByte());
      result = primitivesIntegerTest.testBaseIntegerFunc5((-127).toByte(), -2147483648)
      expect(result).assertEqual((-127).toByte());
      result = primitivesIntegerTest.testBaseIntegerFunc5((0).toByte(), 100)
      expect(result).assertEqual((100).toByte());
      console.log('test_TestBaseIntegerFunc5_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc5_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC6_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc6_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc6 returns int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc6_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc6_Static_0001 start');
      let result = primitivesIntegerTest.testBaseIntegerFunc6((100).toByte(), 2147483547)
      expect(result).assertEqual(2147483647);
      result = primitivesIntegerTest.testBaseIntegerFunc6((-127).toByte(), -2147483648)
      expect(result).assertEqual(2147483521);
      result = primitivesIntegerTest.testBaseIntegerFunc6((0).toByte(), 0)
      expect(result).assertEqual(0);
      console.log('test_TestBaseIntegerFunc6_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc6_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC7_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc7_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc7 returns void and out of range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc7_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc7_Static_0001 start');
      let pass: boolean = true;
      try {
        primitivesIntegerTest.testBaseIntegerFunc7((100).toByte(), 2147483647);
      } catch (e) {
        pass = false;
        console.log('TestBaseIntegerFunc7 failed', e.message);
      }
      expect(pass).assertTrue();
      let caught: boolean = false;
      try {
        primitivesIntegerTest.testBaseIntegerFunc7((100).toByte(), -1);
      } catch (e) {
        caught = true;
        expect(e.toString())
          .assertEqual("Error: out of range The i32 maximum value is 2147483647 and minnum values is -2147483648");
      }
      expect(caught).assertTrue();
      console.log('test_TestBaseIntegerFunc7_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc7_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC8_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc8_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc8 returns long and out of range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc8_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc8_Static_0001 start');
      let result = primitivesIntegerTest.testBaseIntegerFunc8((100).toByte(), 9223372036854775807)
      expect(result).assertEqual(9223372036854775707);
      result = primitivesIntegerTest.testBaseIntegerFunc8((100).toByte(), -9223372036854775808)
      expect(result).assertEqual(9223372036854775708);
      let caught: boolean = false;
      try {
        primitivesIntegerTest.testBaseIntegerFunc8((100).toByte(), -1);
      } catch (e) {
        caught = true;
        expect(e.toString())
          .assertEqual("Error: out of range The i64 maximum value is 9223372036854775807 and minnum values is -9223372036854775808");
      }
      expect(caught).assertTrue();
      console.log('test_TestBaseIntegerFunc8_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc8_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC9_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc9_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc9 returns byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc9_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc9_Static_0001 start');
      let result = primitivesIntegerTest.testBaseIntegerFunc9((100).toByte(), 227)
      expect(result).assertEqual((127).toByte());
      result = primitivesIntegerTest.testBaseIntegerFunc9((-7).toByte(), -120)
      expect(result).assertEqual((-113).toByte());
      console.log('test_TestBaseIntegerFunc9_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc9_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC10_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc10_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc10 returns float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc10_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc10_Static_0001 start');
      let result = primitivesIntegerTest.testBaseIntegerFunc10((100).toByte(), 3.14f)
      expect(result).assertEqual(103.14f);
      result = primitivesIntegerTest.testBaseIntegerFunc10((-7).toByte(), -0.0005f)
      expect(result).assertEqual(-7.0005f);
      console.log('test_TestBaseIntegerFunc10_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc10_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC11_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc11_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc11 returns byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc11_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc11_Static_0001 start');
      let result = primitivesIntegerTest.testBaseIntegerFunc11((100).toByte(), 3.14f)
      expect(result).assertEqual((103).toByte());
      result = primitivesIntegerTest.testBaseIntegerFunc11((-7).toByte(), -0.0005f)
      expect(result).assertEqual((-7).toByte());
      console.log('test_TestBaseIntegerFunc11_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc11_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC12_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc12_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc12 returns double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc12_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc12_Static_0001 start');
      let result = primitivesIntegerTest.testBaseIntegerFunc12((100).toByte(), 3.1415926)
      expect(result).assertEqual(103.1415926);
      result = primitivesIntegerTest.testBaseIntegerFunc12((-7).toByte(), -0.0005)
      expect(result).assertEqual(-7.0005);
      console.log('test_TestBaseIntegerFunc12_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc12_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC13_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc13_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc13 returns byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc13_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc13_Static_0001 start');
      let result = primitivesIntegerTest.testBaseIntegerFunc13((100).toByte(), 27)
      expect(result).assertEqual((127).toByte());
      result = primitivesIntegerTest.testBaseIntegerFunc13((-7).toByte(), -121)
      expect(result).assertEqual((-128).toByte());
      console.log('test_TestBaseIntegerFunc13_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc13_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC14_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc14_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc14 returns string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc14_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc14_Static_0001 start');
      let result = primitivesIntegerTest.testBaseIntegerFunc14((100).toByte(), "TestBaseIntegerFunc14")
      expect(result).assertEqual("TestBaseIntegerFunc14100");
      result = primitivesIntegerTest.testBaseIntegerFunc14((-7).toByte(), "testBaseIntegerFunc14_1")
      expect(result).assertEqual("testBaseIntegerFunc14_1");
      console.log('test_TestBaseIntegerFunc14_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc14_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC15_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc15_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc15 returns byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc15_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc15_Static_0001 start');
      let result = primitivesIntegerTest.testBaseIntegerFunc15((100).toByte(), "TestBaseIntegerFunc15")
      expect(result).assertEqual((110).toByte());
      result = primitivesIntegerTest.testBaseIntegerFunc15((-7).toByte(), "testBaseIntegerFunc15_1")
      expect(result).assertEqual((-7).toByte());
      console.log('test_TestBaseIntegerFunc15_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc15_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC16_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc16_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc16 returns boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc16_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc16_Static_0001 start');
      let result = primitivesIntegerTest.testBaseIntegerFunc16((100).toByte(), true)
      expect(result).assertTrue();
      result = primitivesIntegerTest.testBaseIntegerFunc16((-7).toByte(), false)
      expect(result).assertFalse();
      console.log('test_TestBaseIntegerFunc16_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc16_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC17_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc17_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc17 returns byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc17_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc17_Static_0001 start');
      let result = primitivesIntegerTest.testBaseIntegerFunc17((126).toByte(), true)
      expect(result).assertEqual((127).toByte());
      result = primitivesIntegerTest.testBaseIntegerFunc17((-126).toByte(), false)
      expect(result).assertEqual((-126).toByte());
      console.log('test_TestBaseIntegerFunc17_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc17_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC18_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc18_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc18 normal and out of range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc18_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc18_Static_0001 start');
      let result = primitivesIntegerTest.testBaseIntegerFunc18((327).toShort())
      expect(result).assertEqual((3270).toShort());
      let caught: boolean = false;
      try {
        primitivesIntegerTest.testBaseIntegerFunc18((32767).toShort());
      } catch (e) {
        caught = true;
        expect(e.toString()).assertEqual("Error: TestBaseIntegerFunc18: result exceeds int16_t range");
      }
      expect(caught).assertTrue();
      console.log('test_TestBaseIntegerFunc18_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc18_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC19_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc19_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc19 returns void
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc19_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc19_Static_0001 start');
      let pass: boolean = true;
      try {
        primitivesIntegerTest.testBaseIntegerFunc19((32767).toShort());
        primitivesIntegerTest.testBaseIntegerFunc19((-32768).toShort());
      } catch (e) {
        pass = false;
        console.log('TestBaseIntegerFunc19 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_TestBaseIntegerFunc19_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc19_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC20_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc20_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc20 normal and out of range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc20_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc20_Static_0001 start');
      let result = primitivesIntegerTest.testBaseIntegerFunc20((30000).toShort(), 2767)
      expect(result).assertEqual((32767).toShort());
      let caught: boolean = false;
      try {
        primitivesIntegerTest.testBaseIntegerFunc20((32767).toShort(), 100);
      } catch (e) {
        caught = true;
        expect(e.toString()).assertEqual("Error: TestBaseIntegerFunc20: result exceeds int16_t range");
      }
      expect(caught).assertTrue();
      console.log('test_TestBaseIntegerFunc20_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc20_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC21_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc21_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc21 normal and out of range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc21_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc21_Static_0001 start');
      let result = primitivesIntegerTest.testBaseIntegerFunc21((-30000).toShort(), -2768)
      expect(result).assertEqual((-32768).toShort());
      let caught: boolean = false;
      try {
        primitivesIntegerTest.testBaseIntegerFunc21((100).toShort(), 9223372036854775807);
      } catch (e) {
        caught = true;
        expect(e.toString()).assertEqual("Error: TestBaseIntegerFunc21: result exceeds int16_t range");
      }
      expect(caught).assertTrue();
      console.log('test_TestBaseIntegerFunc21_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc21_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC22_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc22_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc22 normal and out of range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc22_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc22_Static_0001 start');
      let result = primitivesIntegerTest.testBaseIntegerFunc22(-21474836)
      expect(result).assertEqual(-2147483600);
      let caught: boolean = false;
      try {
        primitivesIntegerTest.testBaseIntegerFunc22(2147483647);
      } catch (e) {
        caught = true;
        expect(e.toString()).assertEqual("Error: TestBaseIntegerFunc22: result exceeds int32_t range");
      }
      expect(caught).assertTrue();
      console.log('test_TestBaseIntegerFunc22_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc22_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC23_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc23_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc23 returns void
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc23_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc23_Static_0001 start');
      let pass: boolean = true;
      try {
        primitivesIntegerTest.testBaseIntegerFunc23(2147483647);
      } catch (e) {
        pass = false;
        console.log('TestBaseIntegerFunc23 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_TestBaseIntegerFunc23_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc23_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC24_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc24_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc24 normal and out of range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc24_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc24_Static_0001 start');
      let result = primitivesIntegerTest.testBaseIntegerFunc24(2147483646, 1)
      expect(result).assertEqual(2147483647);
      let caught: boolean = false;
      try {
        primitivesIntegerTest.testBaseIntegerFunc24(32767, 9223372036854775807);
      } catch (e) {
        caught = true;
        expect(e.toString()).assertEqual("Error: TestBaseIntegerFunc24: result exceeds int32_t range");
      }
      expect(caught).assertTrue();
      console.log('test_TestBaseIntegerFunc24_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc24_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC25_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc25_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc25 normal and out of range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc25_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc25_Static_0001 start');
      let result = primitivesIntegerTest.testBaseIntegerFunc25(-2147483646, (-2).toByte())
      expect(result).assertEqual(-2147483648);
      let caught: boolean = false;
      try {
        primitivesIntegerTest.testBaseIntegerFunc25(2147483647, (127).toByte());
      } catch (e) {
        caught = true;
        expect(e.toString()).assertEqual("Error: TestBaseIntegerFunc25: result exceeds int32_t range");
      }
      expect(caught).assertTrue();
      console.log('test_TestBaseIntegerFunc25_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc25_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC26_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc26_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc26 normal and out of range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc26_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc26_Static_0001 start');
      let result = primitivesIntegerTest.testBaseIntegerFunc26(9223372036854775)
      expect(result).assertEqual(922337203685477500);
      let caught: boolean = false;
      try {
        primitivesIntegerTest.testBaseIntegerFunc26(9223372036854775807);
      } catch (e) {
        caught = true;
        expect(e.toString()).assertEqual("Error: TestBaseIntegerFunc26: result exceeds int64_t range");
      }
      expect(caught).assertTrue();
      console.log('test_TestBaseIntegerFunc26_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc26_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC27_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc27_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc27 returns void
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc27_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc27_Static_0001 start');
      let pass: boolean = true;
      try {
        primitivesIntegerTest.testBaseIntegerFunc27(-9223372036854775808);
      } catch (e) {
        pass = false;
        console.log('TestBaseIntegerFunc27 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_TestBaseIntegerFunc27_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc27_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC28_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc28_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc28 returns string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc28_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc28_Static_0001 start');
      let result = primitivesIntegerTest.testBaseIntegerFunc28(9223372036854775, "TestBaseIntegerFunc28")
      expect(result).assertEqual("TestBaseIntegerFunc289223372036854775");
      result = primitivesIntegerTest.testBaseIntegerFunc28(9223372036854775, "testCaseBaseIntegerFunc28_1")
      expect(result).assertEqual("testCaseBaseIntegerFunc28_1");
      console.log('test_TestBaseIntegerFunc28_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc28_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC29_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc29_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc29 normal and out of range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc29_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc29_Static_0001 start');
      let result = primitivesIntegerTest.testBaseIntegerFunc29(9223372036854, "TestBaseIntegerFunc29")
      expect(result).assertEqual(92233720368540);
      result = primitivesIntegerTest.testBaseIntegerFunc29(9223372036854775807, "testBaseIntegerFunc29_1")
      expect(result).assertEqual(9223372036854775807);
      let caught: boolean = false;
      try {
        primitivesIntegerTest.testBaseIntegerFunc29(9223372036854775807, "TestBaseIntegerFunc29");
      } catch (e) {
        caught = true;
        expect(e.toString()).assertEqual("Error: TestBaseIntegerFunc29: result exceeds int64_t range");
      }
      expect(caught).assertTrue();
      console.log('test_TestBaseIntegerFunc29_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc29_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC30_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc30_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc30 returns float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc30_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc30_Static_0001 start');
      let result: float = primitivesIntegerTest.testBaseIntegerFunc30(3.1415f)
      expect(result).assertEqual(4.1415f);
      result = primitivesIntegerTest.testBaseIntegerFunc30(-0.015f)
      expect(result).assertEqual(0.985f);
      console.log('test_TestBaseIntegerFunc30_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc30_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC31_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc31_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc31 returns void
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc31_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc31_Static_0001 start');
      let pass: boolean = true;
      try {
        primitivesIntegerTest.testBaseIntegerFunc31(-0.0151456f);
        primitivesIntegerTest.testBaseIntegerFunc31(1.000123456789f);
      } catch (e) {
        pass = false;
        console.log('TestBaseIntegerFunc31 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_TestBaseIntegerFunc31_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc31_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC32_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc32_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc32 returns float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc32_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc32_Static_0001 start');
      let result: float = primitivesIntegerTest.testBaseIntegerFunc32(-0.015f, 1.0)
      expect(result).assertEqual(0.985f);
      result = primitivesIntegerTest.testBaseIntegerFunc32(0.0001f, 100.12)
      expect(result).assertEqual(100.1201f);
      console.log('test_TestBaseIntegerFunc32_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc32_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC33_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc33_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc33 returns double with epsilon compare
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc33_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc33_Static_0001 start');
      let result: double = primitivesIntegerTest.testBaseIntegerFunc33(123.456f, 1000.11101)
      let temp: double = Math.abs(result - 1123.56701);
      const epsilon: double = Math.pow(10, -5);
      expect(temp < epsilon).assertTrue();
      result = primitivesIntegerTest.testBaseIntegerFunc33(-100.1111111f, 100)
      temp = Math.abs(result + 0.1111111);
      expect(temp < epsilon).assertTrue();
      console.log('test_TestBaseIntegerFunc33_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc33_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC34_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc34_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc34 returns double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc34_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc34_Static_0001 start');
      let result: double = primitivesIntegerTest.testBaseIntegerFunc34(3.141592653589793)
      expect(result).assertEqual(4.141592653589793);
      result = primitivesIntegerTest.testBaseIntegerFunc34(-0.000123456789)
      expect(result).assertEqual(0.999876543211);
      console.log('test_TestBaseIntegerFunc34_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc34_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_FUNC35_STATIC_0100
     * @tc.name      test_TestBaseIntegerFunc35_Static_0001
     * @tc.desc      PrimitivesInteger TestBaseIntegerFunc35 returns void
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseIntegerFunc35_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseIntegerFunc35_Static_0001 start');
      let pass: boolean = true;
      try {
        primitivesIntegerTest.testBaseIntegerFunc35(123456789.123456);
        primitivesIntegerTest.testBaseIntegerFunc35(123456789.123456789123456789);
      } catch (e) {
        pass = false;
        console.log('TestBaseIntegerFunc35 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_TestBaseIntegerFunc35_Static_0001 done');
      done();
      console.log('test_TestBaseIntegerFunc35_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesInteger_ATTR_STATIC_0100
     * @tc.name      test_IntegerAttributes_Static_0001
     * @tc.desc      PrimitivesInteger attribute getters return boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_IntegerAttributes_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_IntegerAttributes_Static_0001 start');
      let res: byte = primitivesIntegerTest.i8testattribute;
      expect(res).assertEqual((127).toByte());
      let res16: short = primitivesIntegerTest.i16testattribute;
      expect(res16).assertEqual((-32768).toShort());
      let res32: int = primitivesIntegerTest.i32testattribute;
      expect(res32).assertEqual(2147483647);
      let res64: long = primitivesIntegerTest.i64testattribute;
      expect(res64).assertEqual(9223372036854775807);
      let resf32: float = primitivesIntegerTest.f32testattribute;
      expect(resf32).assertEqual(3.14f);
      let resf64: double = primitivesIntegerTest.f64testattribute;
      expect(resf64).assertEqual(123.45678);
      console.log('test_IntegerAttributes_Static_0001 done');
      done();
      console.log('test_IntegerAttributes_Static_0001 end');
    });
  })
}
