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
import * as test from '../ets/Index'

export default function injectTest(): void {
  describe("ActsInjectTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_Inject_FUNC8_STATIC_0100
     * @tc.name      test_rgb_all_fields_Static_0001
     * @tc.desc      RGB struct with all fields set should preserve values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_rgb_all_fields_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_rgb_all_fields_Static_0001 start');
      let pass: boolean = true;
      try {
        let rgb: test.RGB = { r: 10, g: 20, b: 30, color: "green" };
        expect(rgb.r).assertEqual(10);
        expect(rgb.g).assertEqual(20);
        expect(rgb.b).assertEqual(30);
        expect(rgb.color).assertEqual("green");
      } catch (e) {
        pass = false;
        console.log('rgb_all_fields failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_rgb_all_fields_Static_0001 done');
      done();
      console.log('test_rgb_all_fields_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Inject_FUNC9_STATIC_0100
     * @tc.name      test_toplevel_func_Static_0001
     * @tc.desc      toplevelFunc(a) should return the input string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_toplevel_func_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_toplevel_func_Static_0001 start');
      let pass: boolean = true;
      try {
        let result = test.toplevelFunc("hello");
        expect(result).assertEqual("hello");
      } catch (e) {
        pass = false;
        console.log('toplevel_func failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_toplevel_func_Static_0001 done');
      done();
      console.log('test_toplevel_func_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Inject_FUNC10_STATIC_0100
     * @tc.name      test_module_foo_foo_Static_0001
     * @tc.desc      moduleA.foo.foo(int) should return the input int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_module_foo_foo_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_module_foo_foo_Static_0001 start');
      let pass: boolean = true;
      try {
        let result = test.foo.foo(42);
        expect(result).assertEqual(42);
      } catch (e) {
        pass = false;
        console.log('module_foo_foo failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_module_foo_foo_Static_0001 done');
      done();
      console.log('test_module_foo_foo_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Inject_FUNC11_STATIC_0100
     * @tc.name      test_toplevel_func_empty_string_Static_0001
     * @tc.desc      toplevelFunc("") with empty string should return empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("test_toplevel_func_empty_string_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.log('test_toplevel_func_empty_string_Static_0001 start');
      let pass: boolean = true;
      try {
        let result = test.toplevelFunc("");
        expect(result).assertEqual("");
      } catch (e) {
        pass = false;
        console.log('toplevel_func_empty_string failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_toplevel_func_empty_string_Static_0001 done');
      done();
      console.log('test_toplevel_func_empty_string_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Inject_FUNC12_STATIC_0100
     * @tc.name      test_foo_name_inject_interface_Static_0001
     * @tc.desc      Foo should have injected name property from sts_inject_into_interface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_foo_name_inject_interface_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_foo_name_inject_interface_Static_0001 start');
      let pass: boolean = true;
      try {
        let foo = new test.Foo();
        foo.name = "test_inject";
        let name: string = foo.name;
        expect(name).assertEqual("test_inject");
      } catch (e) {
        pass = false;
        console.log('foo_name_inject_interface failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_foo_name_inject_interface_Static_0001 done');
      done();
      console.log('test_foo_name_inject_interface_Static_0001 end');
    });
  });
}