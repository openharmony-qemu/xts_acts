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

import { describe, it, expect, TestType, Size, Level } from '../../../hypium/index';
import * as test from '../ets/my_ns';

export default function namespaceSupplementaryTest(): void {
  describe("ActsNamespaceSupplementaryTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    // ============ inner namespace - global function return values ============

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC31_STATIC_0100
     * @tc.name      test_inner_primitives_return_value_Static_0001
     * @tc.desc      inner.primitives_return() should return "primitives_return"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_primitives_return_value_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_primitives_return_value_Static_0001 start');
      let pass: boolean = true;
      try {
        let result = test.inner.primitives_return(1, 2.0, true, "hello", 127);
        expect(result).assertEqual("primitives_return");
      } catch (e) {
        pass = false;
        console.log('inner_primitives_return_value failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_primitives_return_value_Static_0001 done');
      done();
      console.log('test_inner_primitives_return_value_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC32_STATIC_0100
     * @tc.name      test_inner_containers_return_value_Static_0001
     * @tc.desc      inner.containers_return() should return "containers_return"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_containers_return_value_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_containers_return_value_Static_0001 start');
      let pass: boolean = true;
      try {
        let arr1: Array<byte> = [1, 2, 3];
        let arr2: Array<short> = [4, 5, 6];
        let arr3: Array<float> = [1.0, 2.0, 3.0];
        let arr4: Array<double> = [4.0, 5.0, 6.0];
        let result = test.inner.containers_return(arr1, arr2, arr3, arr4, "test");
        expect(result).assertEqual("containers_return");
      } catch (e) {
        pass = false;
        console.log('inner_containers_return_value failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_containers_return_value_Static_0001 done');
      done();
      console.log('test_inner_containers_return_value_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC33_STATIC_0100
     * @tc.name      test_inner_enum_return_value_Static_0001
     * @tc.desc      inner.enum_return() should return "enum_return"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_enum_return_value_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_enum_return_value_Static_0001 start');
      let pass: boolean = true;
      try {
        let result = test.inner.enum_return(test.inner.Color.red, test.inner.Color.yellow, test.inner.Color.blue, test.inner.Color.green, test.inner.Color.black);
        expect(result).assertEqual("enum_return");
      } catch (e) {
        pass = false;
        console.log('inner_enum_return_value failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_enum_return_value_Static_0001 done');
      done();
      console.log('test_inner_enum_return_value_Static_0001 end');
    });

    // ============ inner namespace - TestInterface method tests ============

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC34_STATIC_0100
     * @tc.name      test_inner_interface_primitives_noreturn_all_Static_0001
     * @tc.desc      TestInterface all Primitives_noreturn variants should not throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_interface_primitives_noreturn_all_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_interface_primitives_noreturn_all_Static_0001 start');
      let pass: boolean = true;
      try {
        let iface = test.inner.get_interface();
        iface.primitives_noreturn(127);
        iface.primitives_noreturn1(32767);
        iface.primitives_noreturn2(100000);
        iface.primitives_noreturn3(3.14f);
        iface.primitives_noreturn4(3.14159);
        iface.primitives_noreturn5(true);
        iface.primitives_noreturn6("hello");
        iface.primitives_noreturn7(1234567890);
      } catch (e) {
        pass = false;
        console.log('inner_interface_primitives_noreturn_all failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_interface_primitives_noreturn_all_Static_0001 done');
      done();
      console.log('test_inner_interface_primitives_noreturn_all_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC35_STATIC_0100
     * @tc.name      test_inner_interface_containers_noreturn_all_Static_0001
     * @tc.desc      TestInterface all Containers_noreturn variants should not throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_interface_containers_noreturn_all_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_interface_containers_noreturn_all_Static_0001 start');
      let pass: boolean = true;
      try {
        let iface = test.inner.get_interface();
        let arr1: Array<byte> = [1, 2, 3];
        iface.containers_noreturn1(arr1);
        iface.containers_noreturn2("test");
        let numbers2: byte[] = [10, 20, 30];
        let arr3: ArrayBuffer = new ArrayBuffer(numbers2.length);
        for (let i = 0; i < numbers2.length; i++) {
          arr3.set(i, numbers2[i]);
        }
        iface.containers_noreturn3(arr3);
        iface.containers_noreturn4(test.inner.Color.red);
        let record: Record<string, int> = { "key1": 1, "key2": 2 };
        iface.containers_noreturn5(record);
      } catch (e) {
        pass = false;
        console.log('inner_interface_containers_noreturn_all failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_interface_containers_noreturn_all_Static_0001 done');
      done();
      console.log('test_inner_interface_containers_noreturn_all_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC36_STATIC_0100
     * @tc.name      test_inner_interface_containers_return_value_Static_0001
     * @tc.desc      TestInterface.containers_return() should return "containers_return"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_interface_containers_return_value_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_interface_containers_return_value_Static_0001 start');
      let pass: boolean = true;
      try {
        let iface = test.inner.get_interface();
        let result = iface.containers_return("test");
        expect(result).assertEqual("containers_return");
      } catch (e) {
        pass = false;
        console.log('inner_interface_containers_return_value failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_interface_containers_return_value_Static_0001 done');
      done();
      console.log('test_inner_interface_containers_return_value_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC37_STATIC_0100
     * @tc.name      test_inner_interface_func_error_response_Static_0001
     * @tc.desc      TestInterface.Func_ErrorResponse() should return ErrorResponse
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_interface_func_error_response_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_interface_func_error_response_Static_0001 start');
      let pass: boolean = true;
      try {
        let iface = test.inner.get_interface();
        let result = iface.func_ErrorResponse();
        expect(result.success).assertTrue();
        expect(result.errorCode).assertEqual(10000);
        expect(result.errorMessage).assertEqual("test58");
      } catch (e) {
        pass = false;
        console.log('inner_interface_func_error_response failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_interface_func_error_response_Static_0001 done');
      done();
      console.log('test_inner_interface_func_error_response_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC38_STATIC_0100
     * @tc.name      test_inner_interface_overload_i16_value_Static_0001
     * @tc.desc      TestInterface.OverloadFunc(array, arraybuffer) should return "overload array"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_interface_overload_i16_value_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_interface_overload_i16_value_Static_0001 start');
      let pass: boolean = true;
      try {
        let iface = test.inner.get_interface();
        let arr1: Array<byte> = [1, 2, 3];
        let numbers2: byte[] = [3, 4, 5, 6, 7];
        let arr2: ArrayBuffer = new ArrayBuffer(numbers2.length);
        for (let i = 0; i < numbers2.length; i++) {
          arr2.set(i, numbers2[i]);
        }
        let result = iface.OverloadFunc(arr1, arr2);
        expect(result).assertEqual("overload array");
      } catch (e) {
        pass = false;
        console.log('inner_interface_overload_i16_value failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_interface_overload_i16_value_Static_0001 done');
      done();
      console.log('test_inner_interface_overload_i16_value_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC39_STATIC_0100
     * @tc.name      test_inner_interface_overload_f32_value_Static_0001
     * @tc.desc      TestInterface.OverloadFunc(Mystruct) should return Mystruct
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_interface_overload_f32_value_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_interface_overload_f32_value_Static_0001 start');
      let pass: boolean = true;
      try {
        let iface = test.inner.get_interface();
        let s: test.inner.Mystruct = { _string: "test", _i8: 42 };
        let result = iface.OverloadFunc(s);
        expect(result._string).assertEqual("test");
        expect(result._i8).assertEqual(42);
      } catch (e) {
        pass = false;
        console.log('inner_interface_overload_f32_value failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_interface_overload_f32_value_Static_0001 done');
      done();
      console.log('test_inner_interface_overload_f32_value_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC40_STATIC_0100
     * @tc.name      test_inner_interface_getter_values_Static_0001
     * @tc.desc      TestInterface all getter properties should return correct values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_interface_getter_values_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_interface_getter_values_Static_0001 start');
      let pass: boolean = true;
      try {
        let iface = test.inner.get_interface();
        let name: string = iface.name;
        expect(name).assertEqual("String");
        let i8: byte = iface.i8;
        expect(i8).assertEqual(-128);
        let i16: short = iface.i16;
        expect(i16).assertEqual(-32768);
        let i32: int = iface.i32;
        expect(i32).assertEqual(-2147483648);
        let i64: long = iface.i64;
        expect(i64).assertEqual(1000);
        let f32: float = iface.f32;
        expect(f32).assertEqual(3.14159265f);
        let f64: double = iface.f64;
        expect(f64).assertEqual(3.141592653589793);
        let flag: boolean = iface.bool;
        expect(flag).assertTrue();
      } catch (e) {
        pass = false;
        console.log('inner_interface_getter_values failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_interface_getter_values_Static_0001 done');
      done();
      console.log('test_inner_interface_getter_values_Static_0001 end');
    });

    // ============ inner namespace - PrintTestInterface* functions ============

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC41_STATIC_0100
     * @tc.name      test_inner_printTestInterface_number_i8_Static_0001
     * @tc.desc      inner.printTestInterfaceNumberi8() should return -128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_printTestInterface_number_i8_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_printTestInterface_number_i8_Static_0001 start');
      let pass: boolean = true;
      try {
        let iface = test.inner.get_interface();
        let result = test.inner.printTestInterfaceNumberi8(iface);
        expect(result).assertEqual(-128);
      } catch (e) {
        pass = false;
        console.log('inner_printTestInterface_number_i8 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_printTestInterface_number_i8_Static_0001 done');
      done();
      console.log('test_inner_printTestInterface_number_i8_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC42_STATIC_0100
     * @tc.name      test_inner_printTestInterface_number_i16_Static_0001
     * @tc.desc      inner.printTestInterfaceNumberi16() should return -32768
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_printTestInterface_number_i16_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_printTestInterface_number_i16_Static_0001 start');
      let pass: boolean = true;
      try {
        let iface = test.inner.get_interface();
        let result = test.inner.printTestInterfaceNumberi16(iface);
        expect(result).assertEqual(-32768);
      } catch (e) {
        pass = false;
        console.log('inner_printTestInterface_number_i16 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_printTestInterface_number_i16_Static_0001 done');
      done();
      console.log('test_inner_printTestInterface_number_i16_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC43_STATIC_0100
     * @tc.name      test_inner_printTestInterface_number_i32_Static_0001
     * @tc.desc      inner.printTestInterfaceNumberi32() should return -2147483648
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_printTestInterface_number_i32_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_printTestInterface_number_i32_Static_0001 start');
      let pass: boolean = true;
      try {
        let iface = test.inner.get_interface();
        let result = test.inner.printTestInterfaceNumberi32(iface);
        expect(result).assertEqual(-2147483648);
      } catch (e) {
        pass = false;
        console.log('inner_printTestInterface_number_i32 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_printTestInterface_number_i32_Static_0001 done');
      done();
      console.log('test_inner_printTestInterface_number_i32_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC44_STATIC_0100
     * @tc.name      test_inner_printTestInterface_bool_Static_0001
     * @tc.desc      inner.printTestInterfacebool() should return true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_printTestInterface_bool_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_printTestInterface_bool_Static_0001 start');
      let pass: boolean = true;
      try {
        let iface = test.inner.get_interface();
        let result = test.inner.printTestInterfacebool(iface);
        expect(result).assertTrue();
      } catch (e) {
        pass = false;
        console.log('inner_printTestInterface_bool failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_printTestInterface_bool_Static_0001 done');
      done();
      console.log('test_inner_printTestInterface_bool_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC45_STATIC_0100
     * @tc.name      test_inner_printTestInterface_number_i64_Static_0001
     * @tc.desc      inner.printTestInterfaceNumberi64() should return 1000
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_printTestInterface_number_i64_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_printTestInterface_number_i64_Static_0001 start');
      let pass: boolean = true;
      try {
        let iface = test.inner.get_interface();
        let result = test.inner.printTestInterfaceNumberi64(iface);
        expect(result).assertEqual(1000);
      } catch (e) {
        pass = false;
        console.log('inner_printTestInterface_number_i64 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_printTestInterface_number_i64_Static_0001 done');
      done();
      console.log('test_inner_printTestInterface_number_i64_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC46_STATIC_0100
     * @tc.name      test_inner_printTestInterface_number_f32_Static_0001
     * @tc.desc      inner.printTestInterfaceNumberf32() should return 3.14159265
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_printTestInterface_number_f32_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_printTestInterface_number_f32_Static_0001 start');
      let pass: boolean = true;
      try {
        let iface = test.inner.get_interface();
        let result = test.inner.printTestInterfaceNumberf32(iface);
        expect(result).assertEqual((3.14159265).toFloat());
      } catch (e) {
        pass = false;
        console.log('inner_printTestInterface_number_f32 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_printTestInterface_number_f32_Static_0001 done');
      done();
      console.log('test_inner_printTestInterface_number_f32_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC47_STATIC_0100
     * @tc.name      test_inner_printTestInterface_number_f64_Static_0001
     * @tc.desc      inner.printTestInterfaceNumberf64() should return 3.141592653589793
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_printTestInterface_number_f64_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_printTestInterface_number_f64_Static_0001 start');
      let pass: boolean = true;
      try {
        let iface = test.inner.get_interface();
        let result = test.inner.printTestInterfaceNumberf64(iface);
        expect(result).assertEqual(3.141592653589793);
      } catch (e) {
        pass = false;
        console.log('inner_printTestInterface_number_f64 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_printTestInterface_number_f64_Static_0001 done');
      done();
      console.log('test_inner_printTestInterface_number_f64_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC48_STATIC_0100
     * @tc.name      test_inner_printTestInterface_arraybuffer_Static_0001
     * @tc.desc      inner.printTestInterfaceArraybuffer() should return array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_printTestInterface_arraybuffer_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_printTestInterface_arraybuffer_Static_0001 start');
      let pass: boolean = true;
      try {
        let iface = test.inner.get_interface();
        let result = test.inner.printTestInterfaceArraybuffer(iface);
        expect(result.getByteLength()).assertEqual(5);
        for (let i = 0; i < result.getByteLength(); i++) {
          expect(result.at(i)).assertEqual(3);
        }
      } catch (e) {
        pass = false;
        console.log('inner_printTestInterface_arraybuffer failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_printTestInterface_arraybuffer_Static_0001 done');
      done();
      console.log('test_inner_printTestInterface_arraybuffer_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC49_STATIC_0100
     * @tc.name      test_inner_printTestInterface_array_union_record_enum_Static_0001
     * @tc.desc      inner printTestInterface array/union/record/enum should work
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_printTestInterface_array_union_record_enum_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_printTestInterface_array_union_record_enum_Static_0001 start');
      let pass: boolean = true;
      try {
        let iface = test.inner.get_interface();
        let arr = test.inner.printTestInterfaceArray(iface);
        expect(arr.length).assertEqual(5);
        for (let i = 0; i < arr.length; i++) {
          expect(arr[i]).assertEqual(3);
        }
        let union = test.inner.printTestInterfaceUnion(iface);
        expect(union).assertEqual("union string");
        let rec = test.inner.printTestInterfaceRecord(iface);
        expect(rec.get("key1")).assertEqual(1);
        expect(rec.get("key2")).assertEqual(2);
        expect(rec.get("key3")).assertEqual(3);
        let en = test.inner.printTestInterfaceEnum(iface);
        expect(en).assertEqual(test.inner.Color.yellow);
      } catch (e) {
        pass = false;
        console.log('inner_printTestInterface_array_union_record_enum failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_printTestInterface_array_union_record_enum_Static_0001 done');
      done();
      console.log('test_inner_printTestInterface_array_union_record_enum_Static_0001 end');
    });

    // ============ inner namespace - interface inheritance ============

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC50_STATIC_0100
     * @tc.name      test_inner_interface_inheritance_TestC_Static_0001
     * @tc.desc      TestC interface fun1 and fun3 should return values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_interface_inheritance_TestC_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_interface_inheritance_TestC_Static_0001 start');
      let pass: boolean = true;
      try {
        let ifaceC = test.inner.get_interface_C();
        let result1 = ifaceC.fun1();
        expect(result1).assertEqual("fun1");
        let result3 = ifaceC.fun3();
        expect(result3).assertEqual("fun3");
      } catch (e) {
        pass = false;
        console.log('inner_interface_inheritance_TestC failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_interface_inheritance_TestC_Static_0001 done');
      done();
      console.log('test_inner_interface_inheritance_TestC_Static_0001 end');
    });
  });
}