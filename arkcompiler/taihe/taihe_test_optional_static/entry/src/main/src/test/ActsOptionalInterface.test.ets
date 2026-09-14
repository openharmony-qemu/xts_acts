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
import * as optional from '../ets/optional';

export default function optionalInterfaceTest(): void {
  describe("ActsOptionalInterfaceTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_Optional_GetInterfaceAndFuncPrimitiveI8_STATIC_0100
     * @tc.name      test_Optional_GetInterfaceAndFuncPrimitiveI8_Static_0001
     * @tc.desc      getInterface should return an instance, funcPrimitiveI8 works
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Optional_GetInterfaceAndFuncPrimitiveI8_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Optional_GetInterfaceAndFuncPrimitiveI8_Static_0001 start');
      let instance: optional.ExampleInterface = optional.getInterface();
      let caught: boolean = true;
      try {
        instance.funcPrimitiveI8(5);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_Optional_GetInterfaceAndFuncPrimitiveI8_Static_0001 done');
      done();
      console.log('test_Optional_GetInterfaceAndFuncPrimitiveI8_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Optional_FuncPrimitiveI16_STATIC_0100
     * @tc.name      test_Optional_FuncPrimitiveI16_Static_0001
     * @tc.desc      funcPrimitiveI16 should work with optional i16 value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Optional_FuncPrimitiveI16_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Optional_FuncPrimitiveI16_Static_0001 start');
      let instance: optional.ExampleInterface = optional.getInterface();
      let caught: boolean = true;
      try {
        instance.funcPrimitiveI16(42);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_Optional_FuncPrimitiveI16_Static_0001 done');
      done();
      console.log('test_Optional_FuncPrimitiveI16_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Optional_FuncPrimitiveI32_STATIC_0100
     * @tc.name      test_Optional_FuncPrimitiveI32_Static_0001
     * @tc.desc      funcPrimitiveI32 should work with optional i32 value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Optional_FuncPrimitiveI32_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Optional_FuncPrimitiveI32_Static_0001 start');
      let instance: optional.ExampleInterface = optional.getInterface();
      let caught: boolean = true;
      try {
        instance.funcPrimitiveI32(1000);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_Optional_FuncPrimitiveI32_Static_0001 done');
      done();
      console.log('test_Optional_FuncPrimitiveI32_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Optional_FuncPrimitiveI64_STATIC_0100
     * @tc.name      test_Optional_FuncPrimitiveI64_Static_0001
     * @tc.desc      funcPrimitiveI64 should work with optional i64 value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Optional_FuncPrimitiveI64_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Optional_FuncPrimitiveI64_Static_0001 start');
      let instance: optional.ExampleInterface = optional.getInterface();
      let caught: boolean = true;
      try {
        instance.funcPrimitiveI64(1000000);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_Optional_FuncPrimitiveI64_Static_0001 done');
      done();
      console.log('test_Optional_FuncPrimitiveI64_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Optional_FuncPrimitiveF32_STATIC_0100
     * @tc.name      test_Optional_FuncPrimitiveF32_Static_0001
     * @tc.desc      funcPrimitiveF32 should work with optional f32 value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Optional_FuncPrimitiveF32_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Optional_FuncPrimitiveF32_Static_0001 start');
      let instance: optional.ExampleInterface = optional.getInterface();
      let caught: boolean = true;
      try {
        instance.funcPrimitiveF32(3.14f);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_Optional_FuncPrimitiveF32_Static_0001 done');
      done();
      console.log('test_Optional_FuncPrimitiveF32_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Optional_FuncPrimitiveF64_STATIC_0100
     * @tc.name      test_Optional_FuncPrimitiveF64_Static_0001
     * @tc.desc      funcPrimitiveF64 should work with optional f64 value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Optional_FuncPrimitiveF64_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Optional_FuncPrimitiveF64_Static_0001 start');
      let instance: optional.ExampleInterface = optional.getInterface();
      let caught: boolean = true;
      try {
        instance.funcPrimitiveF64(2.71828);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_Optional_FuncPrimitiveF64_Static_0001 done');
      done();
      console.log('test_Optional_FuncPrimitiveF64_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Optional_FuncPrimitiveBool_STATIC_0100
     * @tc.name      test_Optional_FuncPrimitiveBool_Static_0001
     * @tc.desc      funcPrimitiveBool should work with optional bool value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Optional_FuncPrimitiveBool_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Optional_FuncPrimitiveBool_Static_0001 start');
      let instance: optional.ExampleInterface = optional.getInterface();
      let caught: boolean = true;
      try {
        instance.funcPrimitiveBool(true);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_Optional_FuncPrimitiveBool_Static_0001 done');
      done();
      console.log('test_Optional_FuncPrimitiveBool_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Optional_FuncPrimitiveString_STATIC_0100
     * @tc.name      test_Optional_FuncPrimitiveString_Static_0001
     * @tc.desc      funcPrimitiveString should work with optional string value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Optional_FuncPrimitiveString_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Optional_FuncPrimitiveString_Static_0001 start');
      let instance: optional.ExampleInterface = optional.getInterface();
      let caught: boolean = true;
      try {
        instance.funcPrimitiveString("test_string");
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_Optional_FuncPrimitiveString_Static_0001 done');
      done();
      console.log('test_Optional_FuncPrimitiveString_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Optional_FuncArray_STATIC_0100
     * @tc.name      test_Optional_FuncArray_Static_0001
     * @tc.desc      funcArray should work with optional array value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Optional_FuncArray_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Optional_FuncArray_Static_0001 start');
      let instance: optional.ExampleInterface = optional.getInterface();
      let numbers: int[] = [1, 2, 3, 4, 5];
      let caught: boolean = true;
      try {
        instance.funcArray(numbers);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_Optional_FuncArray_Static_0001 done');
      done();
      console.log('test_Optional_FuncArray_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Optional_FuncBuffer_STATIC_0100
     * @tc.name      test_Optional_FuncBuffer_Static_0001
     * @tc.desc      funcBuffer should work with optional ArrayBuffer value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Optional_FuncBuffer_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Optional_FuncBuffer_Static_0001 start');
      let instance: optional.ExampleInterface = optional.getInterface();
      let numbersU8: byte[] = [1, 2, 3, 4, 5];
      let arrbuf1: ArrayBuffer = new ArrayBuffer(numbersU8.length);
      for (let i = 0; i < numbersU8.length; i++) {
        arrbuf1.set(i, numbersU8[i]);
      }
      let caught: boolean = true;
      try {
        instance.funcBuffer(arrbuf1);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_Optional_FuncBuffer_Static_0001 done');
      done();
      console.log('test_Optional_FuncBuffer_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Optional_FuncUnion_STATIC_0100
     * @tc.name      test_Optional_FuncUnion_Static_0001
     * @tc.desc      funcUnion should work with optional union value (string or int)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Optional_FuncUnion_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Optional_FuncUnion_Static_0001 start');
      let instance: optional.ExampleInterface = optional.getInterface();
      let caught: boolean = true;
      try {
        instance.funcUnion("hello");
        instance.funcUnion(1024);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_Optional_FuncUnion_Static_0001 done');
      done();
      console.log('test_Optional_FuncUnion_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Optional_FuncMap_STATIC_0100
     * @tc.name      test_Optional_FuncMap_Static_0001
     * @tc.desc      funcMap should work with optional record/map value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Optional_FuncMap_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Optional_FuncMap_Static_0001 start');
      let instance: optional.ExampleInterface = optional.getInterface();
      let cpus: Record<string, int> = {
        "cpu0": 10,
        "cpu1": 20,
      };
      let caught: boolean = true;
      try {
        instance.funcMap(cpus);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_Optional_FuncMap_Static_0001 done');
      done();
      console.log('test_Optional_FuncMap_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Optional_PrintTestInterfaceName_STATIC_0100
     * @tc.name      test_Optional_PrintTestInterfaceName_Static_0001
     * @tc.desc      printTestInterfaceName should get name from ExampleInterface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Optional_PrintTestInterfaceName_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Optional_PrintTestInterfaceName_Static_0001 start');
      let instance: optional.ExampleInterface = optional.getInterface();
      let caught: boolean = true;
      try {
        optional.printTestInterfaceName(instance);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_Optional_PrintTestInterfaceName_Static_0001 done');
      done();
      console.log('test_Optional_PrintTestInterfaceName_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Optional_PrintTestInterfaceNumberi8_STATIC_0100
     * @tc.name      test_Optional_PrintTestInterfaceNumberi8_Static_0001
     * @tc.desc      printTestInterfaceNumberi8 should get i8 from ExampleInterface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Optional_PrintTestInterfaceNumberi8_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Optional_PrintTestInterfaceNumberi8_Static_0001 start');
      let instance: optional.ExampleInterface = optional.getInterface();
      let caught: boolean = true;
      try {
        optional.printTestInterfaceNumberi8(instance);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_Optional_PrintTestInterfaceNumberi8_Static_0001 done');
      done();
      console.log('test_Optional_PrintTestInterfaceNumberi8_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Optional_PrintTestInterfaceNumberi16_STATIC_0100
     * @tc.name      test_Optional_PrintTestInterfaceNumberi16_Static_0001
     * @tc.desc      printTestInterfaceNumberi16 should get i16 from ExampleInterface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Optional_PrintTestInterfaceNumberi16_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Optional_PrintTestInterfaceNumberi16_Static_0001 start');
      let instance: optional.ExampleInterface = optional.getInterface();
      let caught: boolean = true;
      try {
        optional.printTestInterfaceNumberi16(instance);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_Optional_PrintTestInterfaceNumberi16_Static_0001 done');
      done();
      console.log('test_Optional_PrintTestInterfaceNumberi16_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Optional_PrintTestInterfaceNumberi32_STATIC_0100
     * @tc.name      test_Optional_PrintTestInterfaceNumberi32_Static_0001
     * @tc.desc      printTestInterfaceNumberi32 should get i32 from ExampleInterface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Optional_PrintTestInterfaceNumberi32_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Optional_PrintTestInterfaceNumberi32_Static_0001 start');
      let instance: optional.ExampleInterface = optional.getInterface();
      let caught: boolean = true;
      try {
        optional.printTestInterfaceNumberi32(instance);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_Optional_PrintTestInterfaceNumberi32_Static_0001 done');
      done();
      console.log('test_Optional_PrintTestInterfaceNumberi32_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Optional_PrintTestInterfaceNumberi64_STATIC_0100
     * @tc.name      test_Optional_PrintTestInterfaceNumberi64_Static_0001
     * @tc.desc      printTestInterfaceNumberi64 should get i64 from ExampleInterface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Optional_PrintTestInterfaceNumberi64_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Optional_PrintTestInterfaceNumberi64_Static_0001 start');
      let instance: optional.ExampleInterface = optional.getInterface();
      let caught: boolean = true;
      try {
        optional.printTestInterfaceNumberi64(instance);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_Optional_PrintTestInterfaceNumberi64_Static_0001 done');
      done();
      console.log('test_Optional_PrintTestInterfaceNumberi64_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Optional_PrintTestInterfaceNumberf32_STATIC_0100
     * @tc.name      test_Optional_PrintTestInterfaceNumberf32_Static_0001
     * @tc.desc      printTestInterfaceNumberf32 should get f32 from ExampleInterface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Optional_PrintTestInterfaceNumberf32_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Optional_PrintTestInterfaceNumberf32_Static_0001 start');
      let instance: optional.ExampleInterface = optional.getInterface();
      let caught: boolean = true;
      try {
        optional.printTestInterfaceNumberf32(instance);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_Optional_PrintTestInterfaceNumberf32_Static_0001 done');
      done();
      console.log('test_Optional_PrintTestInterfaceNumberf32_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Optional_PrintTestInterfaceNumberf64_STATIC_0100
     * @tc.name      test_Optional_PrintTestInterfaceNumberf64_Static_0001
     * @tc.desc      printTestInterfaceNumberf64 should get f64 from ExampleInterface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Optional_PrintTestInterfaceNumberf64_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Optional_PrintTestInterfaceNumberf64_Static_0001 start');
      let instance: optional.ExampleInterface = optional.getInterface();
      let caught: boolean = true;
      try {
        optional.printTestInterfaceNumberf64(instance);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_Optional_PrintTestInterfaceNumberf64_Static_0001 done');
      done();
      console.log('test_Optional_PrintTestInterfaceNumberf64_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Optional_PrintTestInterfacebool_STATIC_0100
     * @tc.name      test_Optional_PrintTestInterfacebool_Static_0001
     * @tc.desc      printTestInterfacebool should get bool from ExampleInterface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Optional_PrintTestInterfacebool_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Optional_PrintTestInterfacebool_Static_0001 start');
      let instance: optional.ExampleInterface = optional.getInterface();
      let caught: boolean = true;
      try {
        optional.printTestInterfacebool(instance);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_Optional_PrintTestInterfacebool_Static_0001 done');
      done();
      console.log('test_Optional_PrintTestInterfacebool_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Optional_PrintTestInterfaceArraybuffer_STATIC_0100
     * @tc.name      test_Optional_PrintTestInterfaceArraybuffer_Static_0001
     * @tc.desc      printTestInterfaceArraybuffer should get arraybuffer from ExampleInterface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Optional_PrintTestInterfaceArraybuffer_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Optional_PrintTestInterfaceArraybuffer_Static_0001 start');
      let instance: optional.ExampleInterface = optional.getInterface();
      let caught: boolean = true;
      try {
        optional.printTestInterfaceArraybuffer(instance);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_Optional_PrintTestInterfaceArraybuffer_Static_0001 done');
      done();
      console.log('test_Optional_PrintTestInterfaceArraybuffer_Static_0001 end');
    });
  })
}