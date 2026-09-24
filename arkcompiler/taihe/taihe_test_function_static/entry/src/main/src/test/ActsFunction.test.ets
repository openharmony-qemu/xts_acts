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

export default function functionTest(): void {
  describe("ActsFunctionTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_Function_FUNC1_STATIC_0100
     * @tc.name      test_func_no_input_no_output_Static_0001
     * @tc.desc      Foo.bar() with no input should not throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_func_no_input_no_output_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_func_no_input_no_output_Static_0001 start');
      let pass: boolean = true;
      try {
        let foo = test.makeFoo();
        foo.bar();
      } catch (e) {
        pass = false;
        console.log('func_no_input_no_output failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_func_no_input_no_output_Static_0001 done');
      done();
      console.log('test_func_no_input_no_output_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Function_FUNC2_STATIC_0100
     * @tc.name      test_func_int_input_no_output_Static_0001
     * @tc.desc      Foo.bar(int) with int input should not throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_func_int_input_no_output_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_func_int_input_no_output_Static_0001 start');
      let pass: boolean = true;
      try {
        let foo = test.makeFoo();
        foo.bar(12);
      } catch (e) {
        pass = false;
        console.log('func_int_input_no_output failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_func_int_input_no_output_Static_0001 done');
      done();
      console.log('test_func_int_input_no_output_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Function_FUNC3_STATIC_0100
     * @tc.name      test_func_string_input_no_output_Static_0001
     * @tc.desc      Foo.bar(String) with string input should not throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_func_string_input_no_output_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_func_string_input_no_output_Static_0001 start');
      let pass: boolean = true;
      try {
        let foo = test.makeFoo();
        foo.bar("zhangsan");
      } catch (e) {
        pass = false;
        console.log('func_string_input_no_output failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_func_string_input_no_output_Static_0001 done');
      done();
      console.log('test_func_string_input_no_output_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Function_FUNC4_STATIC_0100
     * @tc.name      test_func_union_string_Static_0001
     * @tc.desc      Foo.bar(String, MyUnion) with union string should not throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_func_union_string_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_func_union_string_Static_0001 start');
      let pass: boolean = true;
      try {
        let foo = test.makeFoo();
        foo.bar("lisi", "myunionStr");
      } catch (e) {
        pass = false;
        console.log('func_union_string failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_func_union_string_Static_0001 done');
      done();
      console.log('test_func_union_string_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Function_FUNC5_STATIC_0100
     * @tc.name      test_func_union_number_Static_0001
     * @tc.desc      Foo.bar(String, MyUnion) with union number should not throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_func_union_number_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_func_union_number_Static_0001 start');
      let pass: boolean = true;
      try {
        let foo = test.makeFoo();
        foo.bar("lisi", 18);
      } catch (e) {
        pass = false;
        console.log('func_union_number failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_func_union_number_Static_0001 done');
      done();
      console.log('test_func_union_number_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Function_FUNC6_STATIC_0100
     * @tc.name      test_func_optional_string_Static_0001
     * @tc.desc      Foo.baropt(String, Optional<String>) should not throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_func_optional_string_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_func_optional_string_Static_0001 start');
      let pass: boolean = true;
      try {
        let foo = test.makeFoo();
        foo.baropt("lisi", undefined);
      } catch (e) {
        pass = false;
        console.log('func_optional_string failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_func_optional_string_Static_0001 done');
      done();
      console.log('test_func_optional_string_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Function_FUNC7_STATIC_0100
     * @tc.name      test_callback_void_input_void_output_Static_0001
     * @tc.desc      Foo.test_cb_v with void callback should not throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_callback_void_input_void_output_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_callback_void_input_void_output_Static_0001 start');
      let pass: boolean = true;
      try {
        let foo = test.makeFoo();
        foo.test_cb_v((): void => {
          console.log("void input void output callback!");
        });
      } catch (e) {
        pass = false;
        console.log('callback_void_input_void_output failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_callback_void_input_void_output_Static_0001 done');
      done();
      console.log('test_callback_void_input_void_output_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Function_FUNC8_STATIC_0100
     * @tc.name      test_callback_int_input_void_output_Static_0001
     * @tc.desc      Foo.test_cb_i with callback receiving int should assert value 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_callback_int_input_void_output_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_callback_int_input_void_output_Static_0001 start');
      let pass: boolean = true;
      try {
        let foo = test.makeFoo();
        foo.test_cb_i((a: int): void => {
          expect(a).assertEqual(1);
        });
      } catch (e) {
        pass = false;
        console.log('callback_int_input_void_output failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_callback_int_input_void_output_Static_0001 done');
      done();
      console.log('test_callback_int_input_void_output_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Function_FUNC9_STATIC_0100
     * @tc.name      test_callback_string_boolean_input_Static_0001
     * @tc.desc      Foo.test_cb_s with callback receiving string and boolean should assert value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_callback_string_boolean_input_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_callback_string_boolean_input_Static_0001 start');
      let pass: boolean = true;
      try {
        let foo = test.makeFoo();
        foo.test_cb_s((a: string, b: boolean): void => {
          if (b) {
            expect(a).assertEqual("hello");
          }
        });
      } catch (e) {
        pass = false;
        console.log('callback_string_boolean_input failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_callback_string_boolean_input_Static_0001 done');
      done();
      console.log('test_callback_string_boolean_input_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Function_FUNC10_STATIC_0100
     * @tc.name      test_callback_string_return_value_Static_0001
     * @tc.desc      Foo.test_cb_rs with callback returning i64*2 should return "888"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_callback_string_return_value_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_callback_string_return_value_Static_0001 start');
      let pass: boolean = true;
      try {
        let foo = test.makeFoo();
        let result: string = foo.test_cb_rs((a: long): long => {
          return a * 2;
        });
        expect(result).assertEqual("888");
      } catch (e) {
        pass = false;
        console.log('callback_string_return_value failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_callback_string_return_value_Static_0001 done');
      done();
      console.log('test_callback_string_return_value_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Function_FUNC11_STATIC_0100
     * @tc.name      test_static_func_add_Static_0001
     * @tc.desc      FooCls.static_func_add(20, 10) should return 30
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_static_func_add_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_static_func_add_Static_0001 start');
      let pass: boolean = true;
      let result: int = 0;
      try {
        result = test.FooCls.static_func_add(20, 10);
        expect(result).assertEqual(30);
      } catch (e) {
        pass = false;
        console.log('static_func_add failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_static_func_add_Static_0001 done');
      done();
      console.log('test_static_func_add_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Function_FUNC12_STATIC_0100
     * @tc.name      test_static_func_sub_Static_0001
     * @tc.desc      FooCls.static_func_sub(20, 10) should return 10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_static_func_sub_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_static_func_sub_Static_0001 start');
      let pass: boolean = true;
      let result: int = 0;
      try {
        result = test.FooCls.static_func_sub(20, 10);
        expect(result).assertEqual(10);
      } catch (e) {
        pass = false;
        console.log('static_func_sub failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_static_func_sub_Static_0001 done');
      done();
      console.log('test_static_func_sub_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Function_FUNC13_STATIC_0100
     * @tc.name      test_static_property_Static_0001
     * @tc.desc      FooCls.static_property should be gettable/settable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_static_property_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_static_property_Static_0001 start');
      let pass: boolean = true;
      try {
        expect(test.FooCls.static_property).assertEqual(0);
        test.FooCls.static_property = 123;
        expect(test.FooCls.static_property).assertEqual(123);
      } catch (e) {
        pass = false;
        console.log('static_property failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_static_property_Static_0001 done');
      done();
      console.log('test_static_property_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Function_FUNC14_STATIC_0100
     * @tc.name      test_new_class_Static_0001
     * @tc.desc      new FooCls("hello") should return instance with get() returning "zhangsan"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_new_class_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_new_class_Static_0001 start');
      let pass: boolean = true;
      try {
        let cls = new test.FooCls("hello");
        console.log("test_new_class test is:", cls.get());
        expect(cls.get()).assertEqual("zhangsan");
      } catch (e) {
        pass = false;
        console.log('new_class failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_new_class_Static_0001 done');
      done();
      console.log('test_new_class_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Function_FUNC15_STATIC_0100
     * @tc.name      test_new_class_with_two_args_Static_0001
     * @tc.desc      new FooCls("hello", "test") should return instance with get() returning "zhangsan"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_new_class_with_two_args_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_new_class_with_two_args_Static_0001 start');
      let pass: boolean = true;
      try {
        let cls = new test.FooCls("hello", "test");
        console.log("test_new_class_with_two_args test is:", cls.get());
        expect(cls.get()).assertEqual("zhangsan");
      } catch (e) {
        pass = false;
        console.log('new_class_with_two_args failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_new_class_with_two_args_Static_0001 done');
      done();
      console.log('test_new_class_with_two_args_Static_0001 end');
    });
  });
}