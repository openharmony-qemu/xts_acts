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

export default function namespaceTest(): void {
  describe("ActsNamespaceTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC01_STATIC_0100
     * @tc.name      test_inner_primitives_noreturn_Static_0001
     * @tc.desc      inner.primitives_noreturn() with primitives should not throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_primitives_noreturn_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_primitives_noreturn_Static_0001 start');
      let pass: boolean = true;
      try {
        test.inner.primitives_noreturn(1, 2.0, true, "hello", 127);
      } catch (e) {
        pass = false;
        console.log('inner_primitives_noreturn failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_primitives_noreturn_Static_0001 done');
      done();
      console.log('test_inner_primitives_noreturn_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC02_STATIC_0100
     * @tc.name      test_inner_primitives_return_Static_0001
     * @tc.desc      inner.primitives_return() should return a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_primitives_return_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_primitives_return_Static_0001 start');
      let pass: boolean = true;
      try {
        let result = test.inner.primitives_return(1, 2.0, true, "hello", 127);
        expect(result).assertEqual("primitives_return");
      } catch (e) {
        pass = false;
        console.log('inner_primitives_return failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_primitives_return_Static_0001 done');
      done();
      console.log('test_inner_primitives_return_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC03_STATIC_0100
     * @tc.name      test_inner_containers_noreturn_Static_0001
     * @tc.desc      inner.containers_noreturn() with containers should not throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_containers_noreturn_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_containers_noreturn_Static_0001 start');
      let pass: boolean = true;
      try {
        let arr1: Array<byte> = [1, 2, 3];
        let arr2: Array<short> = [4, 5, 6];
        let arr3: Array<float> = [1.0, 2.0, 3.0];
        let arr4: Array<double> = [4.0, 5.0, 6.0];
        test.inner.containers_noreturn(arr1, arr2, arr3, arr4, "test");
      } catch (e) {
        pass = false;
        console.log('inner_containers_noreturn failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_containers_noreturn_Static_0001 done');
      done();
      console.log('test_inner_containers_noreturn_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC04_STATIC_0100
     * @tc.name      test_inner_containers_return_Static_0001
     * @tc.desc      inner.containers_return() should return a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_containers_return_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_containers_return_Static_0001 start');
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
        console.log('inner_containers_return failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_containers_return_Static_0001 done');
      done();
      console.log('test_inner_containers_return_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC05_STATIC_0100
     * @tc.name      test_inner_enum_noreturn_Static_0001
     * @tc.desc      inner.enum_noreturn() with enum values should not throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_enum_noreturn_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_enum_noreturn_Static_0001 start');
      let pass: boolean = true;
      try {
        test.inner.enum_noreturn(test.inner.Color.red, test.inner.Color.yellow, test.inner.Color.blue, test.inner.Color.green, test.inner.Color.black);
      } catch (e) {
        pass = false;
        console.log('inner_enum_noreturn failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_enum_noreturn_Static_0001 done');
      done();
      console.log('test_inner_enum_noreturn_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC06_STATIC_0100
     * @tc.name      test_inner_get_interface_Static_0001
     * @tc.desc      inner.get_interface() should return a TestInterface instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_get_interface_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_get_interface_Static_0001 start');
      let pass: boolean = true;
      try {
        let iface = test.inner.get_interface();
      } catch (e) {
        pass = false;
        console.log('inner_get_interface failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_get_interface_Static_0001 done');
      done();
      console.log('test_inner_get_interface_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC07_STATIC_0100
     * @tc.name      test_inner_interface_noparam_noreturn_Static_0001
     * @tc.desc      TestInterface.noparam_noreturn() should not throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_interface_noparam_noreturn_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_interface_noparam_noreturn_Static_0001 start');
      let pass: boolean = true;
      try {
        let iface = test.inner.get_interface();
        iface.noparam_noreturn();
      } catch (e) {
        pass = false;
        console.log('inner_interface_noparam_noreturn failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_interface_noparam_noreturn_Static_0001 done');
      done();
      console.log('test_inner_interface_noparam_noreturn_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC08_STATIC_0100
     * @tc.name      test_inner_interface_primitives_return_Static_0001
     * @tc.desc      TestInterface.primitives_return() should return int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_interface_primitives_return_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_interface_primitives_return_Static_0001 start');
      let pass: boolean = true;
      try {
        let iface = test.inner.get_interface();
        let result = iface.primitives_return(42);
        expect(result).assertEqual(1);
      } catch (e) {
        pass = false;
        console.log('inner_interface_primitives_return failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_interface_primitives_return_Static_0001 done');
      done();
      console.log('test_inner_interface_primitives_return_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC09_STATIC_0100
     * @tc.name      test_inner_interface_overload_Static_0001
     * @tc.desc      TestInterface.OverloadFunc() overloads should not throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_interface_overload_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_interface_overload_Static_0001 start');
      let pass: boolean = true;
      try {
        let iface = test.inner.get_interface();
        iface.OverloadFunc();
        iface.OverloadFunc(1, 2);
      } catch (e) {
        pass = false;
        console.log('inner_interface_overload failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_interface_overload_Static_0001 done');
      done();
      console.log('test_inner_interface_overload_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC10_STATIC_0100
     * @tc.name      test_inner_interface_getters_Static_0001
     * @tc.desc      TestInterface getter properties should return values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_interface_getters_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_interface_getters_Static_0001 start');
      let pass: boolean = true;
      try {
        let iface = test.inner.get_interface();
        let name: string = iface.name;
        expect(name).assertEqual("String");
        let i8: byte = iface.i8;
        expect(i8).assertEqual(-128);
        let i32: int = iface.i32;
        expect(i32).assertEqual(-2147483648);
      } catch (e) {
        pass = false;
        console.log('inner_interface_getters failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_interface_getters_Static_0001 done');
      done();
      console.log('test_inner_interface_getters_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC11_STATIC_0100
     * @tc.name      test_inner_printTestInterfaceName_Static_0001
     * @tc.desc      inner.printTestInterfaceName() should return a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_printTestInterfaceName_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_printTestInterfaceName_Static_0001 start');
      let pass: boolean = true;
      try {
        let iface = test.inner.get_interface();
        let result = test.inner.printTestInterfaceName(iface);
        expect(result).assertEqual("String");
      } catch (e) {
        pass = false;
        console.log('inner_printTestInterfaceName failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_printTestInterfaceName_Static_0001 done');
      done();
      console.log('test_inner_printTestInterfaceName_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC12_STATIC_0100
     * @tc.name      test_inner_get_interface_1_Static_0001
     * @tc.desc      inner.get_interface_1() should return a Test1 instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_get_interface_1_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_get_interface_1_Static_0001 start');
      let pass: boolean = true;
      try {
        let iface = test.inner.get_interface_1();
        iface.fun1();
        iface.fun2();
      } catch (e) {
        pass = false;
        console.log('inner_get_interface_1 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_get_interface_1_Static_0001 done');
      done();
      console.log('test_inner_get_interface_1_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC13_STATIC_0100
     * @tc.name      test_inner_get_interface_20_Static_0001
     * @tc.desc      inner.get_interface_20() should return a Test20 instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_get_interface_20_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_get_interface_20_Static_0001 start');
      let pass: boolean = true;
      try {
        let iface = test.inner.get_interface_20();
        iface.fun1();
        iface.fun2();
      } catch (e) {
        pass = false;
        console.log('inner_get_interface_20 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_get_interface_20_Static_0001 done');
      done();
      console.log('test_inner_get_interface_20_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC14_STATIC_0100
     * @tc.name      test_inner_interface_inheritance_Static_0001
     * @tc.desc      inner TestA/TestB/TestC interfaces should work
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_interface_inheritance_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_interface_inheritance_Static_0001 start');
      let pass: boolean = true;
      try {
        let ifaceA = test.inner.get_interface_A();
        let resultA = ifaceA.fun1();
        expect(resultA).assertEqual("fun1");
        let ifaceB = test.inner.get_interface_B();
        let resultB = ifaceB.fun2();
        expect(resultB).assertEqual("fun2");
      } catch (e) {
        pass = false;
        console.log('inner_interface_inheritance failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_interface_inheritance_Static_0001 done');
      done();
      console.log('test_inner_interface_inheritance_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC15_STATIC_0100
     * @tc.name      test_inner_enum_return_Static_0001
     * @tc.desc      inner.enum_return() should return a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_inner_enum_return_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_inner_enum_return_Static_0001 start');
      let pass: boolean = true;
      try {
        let result = test.inner.enum_return(test.inner.Color.red, test.inner.Color.yellow, test.inner.Color.blue, test.inner.Color.green, test.inner.Color.black);
        expect(result).assertEqual("enum_return");
      } catch (e) {
        pass = false;
        console.log('inner_enum_return failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_inner_enum_return_Static_0001 done');
      done();
      console.log('test_inner_enum_return_Static_0001 end');
    });

    // ============ deep namespace test5namespace5 tests ============

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC28_STATIC_0100
     * @tc.name      test_deep_namespace_funtest_Static_0001
     * @tc.desc      ns1.ns2.ns3.ns4.ns5.funtest(MyStruct) should not throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_deep_namespace_funtest_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_deep_namespace_funtest_Static_0001 start');
      let pass: boolean = true;
      try {
        let s: test.ns1.ns2.ns3.ns4.ns5.MyStruct = { a: 42, b: 3.14 };
        test.ns1.ns2.ns3.ns4.ns5.funtest(s);
      } catch (e) {
        pass = false;
        console.log('deep_namespace_funtest failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_deep_namespace_funtest_Static_0001 done');
      done();
      console.log('test_deep_namespace_funtest_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC29_STATIC_0100
     * @tc.name      test_deep_namespace_mystruct_fields_Static_0001
     * @tc.desc      ns1.ns2.ns3.ns4.ns5.MyStruct fields should be accessible
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_deep_namespace_mystruct_fields_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_deep_namespace_mystruct_fields_Static_0001 start');
      let pass: boolean = true;
      try {
        let s: test.ns1.ns2.ns3.ns4.ns5.MyStruct = { a: 100, b: 2.5 };
        expect(s.a).assertEqual(100);
        expect(s.b).assertEqual(2.5);
      } catch (e) {
        pass = false;
        console.log('deep_namespace_mystruct_fields failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_deep_namespace_mystruct_fields_Static_0001 done');
      done();
      console.log('test_deep_namespace_mystruct_fields_Static_0001 end');
    });
  });
}