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

import {BusinessError} from "@ohos.base";
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium-static/src/main/indexStatic';
import * as test from '../ets/Index'

export default function errorTest(): void {
  describe("ActsErrorTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    // ==================== 全局函数测试 ====================

    /**
     * @tc.number    SUB_Taihe_Error_FUNC1_STATIC_0100
     * @tc.name      test_sayHello_Error_Static_0001
     * @tc.desc      sayHello throws System initialization failed error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_sayHello_Error_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_sayHello_Error_Static_0001 start');
      let pass: boolean = true;
      let errorMsg: string = "";
      try {
        test.sayHello();
      } catch (error) {
        errorMsg = error.toString();
      }
      expect(errorMsg).assertEqual("Error: System initialization failed");
      console.log('test_sayHello_Error_Static_0001 done');
      done();
      console.log('test_sayHello_Error_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Error_FUNC2_STATIC_0100
     * @tc.name      test_sayHello_ii_Success_Static_0001
     * @tc.desc      sayHello_ii with valid input returns correct value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_sayHello_ii_Success_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_sayHello_ii_Success_Static_0001 start');
      let pass: boolean = true;
      let result: int = 0;
      try {
        result = test.sayHello_ii(5);
      } catch (error) {
        pass = false;
        console.log('sayHello_ii success failed', error.message);
      }
      expect(pass).assertTrue();
      expect(result).assertEqual(5);
      console.log('test_sayHello_ii_Success_Static_0001 done');
      done();
      console.log('test_sayHello_ii_Success_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Error_FUNC3_STATIC_0100
     * @tc.name      test_sayHello_ii_Error_Static_0001
     * @tc.desc      sayHello_ii with out-of-range input throws error with code 10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_sayHello_ii_Error_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_sayHello_ii_Error_Static_0001 start');
      let error_code: number = 0;
      let errorMsg: string = "";
      try {
        test.sayHello_ii(10);
      } catch (error) {
        errorMsg = error.toString();
        error = error as BusinessError;
        error_code = error.code;
      }
      expect(error_code).assertEqual(10);
      expect(errorMsg).assertEqual("Error: Index out of range");
      console.log('test_sayHello_ii_Error_Static_0001 done');
      done();
      console.log('test_sayHello_ii_Error_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Error_FUNC4_STATIC_0100
     * @tc.name      test_sayHelloParam_Static_0001
     * @tc.desc      sayHelloParam with valid input should not throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_sayHelloParam_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_sayHelloParam_Static_0001 start');
      let pass: boolean = true;
      try {
        test.sayHelloParam(100);
      } catch (error) {
        pass = false;
        console.log('sayHelloParam failed', error.message);
      }
      expect(pass).assertTrue();
      console.log('test_sayHelloParam_Static_0001 done');
      done();
      console.log('test_sayHelloParam_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Error_FUNC5_STATIC_0100
     * @tc.name      test_sayHelloReturn_Static_0001
     * @tc.desc      sayHelloReturn should return 123
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_sayHelloReturn_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_sayHelloReturn_Static_0001 start');
      let pass: boolean = true;
      let result: int = 0;
      try {
        result = test.sayHelloReturn();
      } catch (error) {
        pass = false;
        console.log('sayHelloReturn failed', error.message);
      }
      expect(pass).assertTrue();
      expect(result).assertEqual(123);
      console.log('test_sayHelloReturn_Static_0001 done');
      done();
      console.log('test_sayHelloReturn_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Error_FUNC6_STATIC_0100
     * @tc.name      test_callback_Static_0001
     * @tc.desc      callcb with callback that throws should return 100
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_callback_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_callback_Static_0001 start');
      let pass: boolean = true;
      let result: int = 0;
      try {
        result = test.callcb((): void => {
          console.log("Callback called");
        });
      } catch (error) {
        console.log('callback failed', error.message);
      }
      expect(result).assertEqual(100);
      console.log('test_callback_Static_0001 done');
      done();
      console.log('test_callback_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Error_FUNC7_STATIC_0100
     * @tc.name      test_callback_vi_Static_0001
     * @tc.desc      callcb_vi with callback returning int should succeed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_callback_vi_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_callback_vi_Static_0001 start');
      let pass: boolean = true;
      try {
        test.callcb_vi((): int => {
          console.log("Callback_vi called");
          return 1;
        });
      } catch (error) {
        pass = false;
        console.log('callback_vi failed', error.message);
      }
      expect(pass).assertTrue();
      console.log('test_callback_vi_Static_0001 done');
      done();
      console.log('test_callback_vi_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Error_FUNC8_STATIC_0100
     * @tc.name      test_callback_iv_Static_0001
     * @tc.desc      callcb_iv with callback receiving int parameter should set result to 10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_callback_iv_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_callback_iv_Static_0001 start');
      let pass: boolean = true;
      let result: int = 0;
      try {
        test.callcb_iv((a: int): void => {
          console.log("Callback_iv called", a);
          result = a;
        });
      } catch (error) {
        pass = false;
        console.log('callback_iv failed', error.message);
      }
      expect(pass).assertTrue();
      expect(result).assertEqual(10);
      console.log('test_callback_iv_Static_0001 done');
      done();
      console.log('test_callback_iv_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Error_FUNC9_STATIC_0100
     * @tc.name      test_callback_ii_Static_0001
     * @tc.desc      callcb_ii with callback returning a+1 should set result to 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_callback_ii_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_callback_ii_Static_0001 start');
      let pass: boolean = true;
      let result: int = 0;
      try {
        test.callcb_ii((a: int): int => {
          console.log("Callback_ii called", a);
          result = a;
          return a + 1;
        });
      } catch (error) {
        pass = false;
        console.log('callback_ii failed', error.message);
      }
      expect(pass).assertTrue();
      expect(result).assertEqual(1);
      console.log('test_callback_ii_Static_0001 done');
      done();
      console.log('test_callback_ii_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Error_FUNC10_STATIC_0100
     * @tc.name      test_callback_v_noexcept_Static_0001
     * @tc.desc      test_cb_v with noexcept void callback should succeed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_callback_v_noexcept_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_callback_v_noexcept_Static_0001 start');
      let pass: boolean = true;
      try {
        test.test_cb_v((): void => {
          console.log("test_cb_v in ets");
        });
      } catch (error) {
        pass = false;
        console.log('test_cb_v failed', error.message);
      }
      expect(pass).assertTrue();
      console.log('test_callback_v_noexcept_Static_0001 done');
      done();
      console.log('test_callback_v_noexcept_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Error_FUNC11_STATIC_0100
     * @tc.name      test_processGlobalNoexceptCallback_Static_0001
     * @tc.desc      processGlobalNoexceptCallback with callback returning a*3 should return 3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_processGlobalNoexceptCallback_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_processGlobalNoexceptCallback_Static_0001 start');
      let pass: boolean = true;
      let result: int = 0;
      try {
        result = test.processGlobalNoexceptCallback((a: int): int => {
          console.log("processGlobalNoexceptCallback called with:", a);
          return a * 3;
        });
      } catch (error) {
        pass = false;
        console.log('processGlobalNoexceptCallback failed', error.message);
      }
      expect(pass).assertTrue();
      expect(result).assertEqual(3);
      console.log('test_processGlobalNoexceptCallback_Static_0001 done');
      done();
      console.log('test_processGlobalNoexceptCallback_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Error_FUNC12_STATIC_0100
     * @tc.name      test_processGlobalVoidCallback_Static_0001
     * @tc.desc      processGlobalVoidCallback should invoke void callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_processGlobalVoidCallback_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_processGlobalVoidCallback_Static_0001 start');
      let pass: boolean = true;
      let called: boolean = false;
      try {
        test.processGlobalVoidCallback((): void => {
          console.log("processGlobalVoidCallback called");
          called = true;
        });
      } catch (error) {
        pass = false;
        console.log('processGlobalVoidCallback failed', error.message);
      }
      expect(pass).assertTrue();
      expect(called).assertTrue();
      console.log('test_processGlobalVoidCallback_Static_0001 done');
      done();
      console.log('test_processGlobalVoidCallback_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Error_FUNC13_STATIC_0100
     * @tc.name      test_processGlobalVoidNoexceptCallback_Static_0001
     * @tc.desc      processGlobalVoidNoexceptCallback should invoke void noexcept callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_processGlobalVoidNoexceptCallback_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_processGlobalVoidNoexceptCallback_Static_0001 start');
      let pass: boolean = true;
      let called: boolean = false;
      try {
        test.processGlobalVoidNoexceptCallback((): void => {
          console.log("processGlobalVoidNoexceptCallback called");
          called = true;
        });
      } catch (error) {
        pass = false;
        console.log('processGlobalVoidNoexceptCallback failed', error.message);
      }
      expect(pass).assertTrue();
      expect(called).assertTrue();
      console.log('test_processGlobalVoidNoexceptCallback_Static_0001 done');
      done();
      console.log('test_processGlobalVoidNoexceptCallback_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Error_FUNC14_STATIC_0100
     * @tc.name      test_processGlobalReturnNoexceptCallback_Static_0001
     * @tc.desc      processGlobalReturnNoexceptCallback should return 111
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_processGlobalReturnNoexceptCallback_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_processGlobalReturnNoexceptCallback_Static_0001 start');
      let pass: boolean = true;
      let result: int = 0;
      try {
        result = test.processGlobalReturnNoexceptCallback();
      } catch (error) {
        pass = false;
        console.log('processGlobalReturnNoexceptCallback failed', error.message);
      }
      expect(pass).assertTrue();
      expect(result).assertEqual(111);
      console.log('test_processGlobalReturnNoexceptCallback_Static_0001 done');
      done();
      console.log('test_processGlobalReturnNoexceptCallback_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Error_FUNC15_STATIC_0100
     * @tc.name      test_processGlobalNoexceptNoParamNoReturn_Static_0001
     * @tc.desc      processGlobalNoexceptNoParamNoReturn should not throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_processGlobalNoexceptNoParamNoReturn_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_processGlobalNoexceptNoParamNoReturn_Static_0001 start');
      let pass: boolean = true;
      try {
        test.processGlobalNoexceptNoParamNoReturn();
      } catch (error) {
        pass = false;
        console.log('processGlobalNoexceptNoParamNoReturn failed', error.message);
      }
      expect(pass).assertTrue();
      console.log('test_processGlobalNoexceptNoParamNoReturn_Static_0001 done');
      done();
      console.log('test_processGlobalNoexceptNoParamNoReturn_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Error_FUNC16_STATIC_0100
     * @tc.name      test_processGlobalNoexceptParamNoReturn_Static_0001
     * @tc.desc      processGlobalNoexceptParamNoReturn should not throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_processGlobalNoexceptParamNoReturn_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_processGlobalNoexceptParamNoReturn_Static_0001 start');
      let pass: boolean = true;
      try {
        test.processGlobalNoexceptParamNoReturn(500);
      } catch (error) {
        pass = false;
        console.log('processGlobalNoexceptParamNoReturn failed', error.message);
      }
      expect(pass).assertTrue();
      console.log('test_processGlobalNoexceptParamNoReturn_Static_0001 done');
      done();
      console.log('test_processGlobalNoexceptParamNoReturn_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Error_FUNC17_STATIC_0100
     * @tc.name      test_processGlobalNoexceptParamReturn_Static_0001
     * @tc.desc      processGlobalNoexceptParamReturn(250) should return 500
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_processGlobalNoexceptParamReturn_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_processGlobalNoexceptParamReturn_Static_0001 start');
      let pass: boolean = true;
      let result: int = 0;
      try {
        result = test.processGlobalNoexceptParamReturn(250);
      } catch (error) {
        pass = false;
        console.log('processGlobalNoexceptParamReturn failed', error.message);
      }
      expect(pass).assertTrue();
      expect(result).assertEqual(500);
      console.log('test_processGlobalNoexceptParamReturn_Static_0001 done');
      done();
      console.log('test_processGlobalNoexceptParamReturn_Static_0001 end');
    });

    // ==================== 接口方法测试 ====================

    /**
     * @tc.number    SUB_Taihe_Error_FUNC18_STATIC_0100
     * @tc.name      test_foo_bar_Error_Static_0001
     * @tc.desc      Foo.bar throws error with code 12 and message "A Error in bar"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_foo_bar_Error_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_foo_bar_Error_Static_0001 start');
      let error_code: number = 0;
      let errorMsg: string = "";
      try {
        let x = test.createFoo();
        x.bar();
      } catch (error) {
        errorMsg = error.toString();
        error = error as BusinessError;
        error_code = error.code;
      }
      expect(error_code).assertEqual(12);
      expect(errorMsg).assertEqual("Error: A Error in bar");
      console.log('test_foo_bar_Error_Static_0001 done');
      done();
      console.log('test_foo_bar_Error_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Error_FUNC19_STATIC_0100
     * @tc.name      test_foo_bar_ii_Static_0001
     * @tc.desc      Foo.bar_ii(20) should return 21
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_foo_bar_ii_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_foo_bar_ii_Static_0001 start');
      let pass: boolean = true;
      let result: int = 0;
      try {
        let x = test.createFoo();
        result = x.bar_ii(20);
      } catch (error) {
        pass = false;
        console.log('foo_bar_ii failed', error.message);
      }
      expect(pass).assertTrue();
      expect(result).assertEqual(21);
      console.log('test_foo_bar_ii_Static_0001 done');
      done();
      console.log('test_foo_bar_ii_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Error_FUNC20_STATIC_0100
     * @tc.name      test_foo_bar_iv_Static_0001
     * @tc.desc      Foo.bar_iv(789) should not throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_foo_bar_iv_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_foo_bar_iv_Static_0001 start');
      let pass: boolean = true;
      try {
        let x = test.createFoo();
        x.bar_iv(789);
      } catch (error) {
        pass = false;
        console.log('foo_bar_iv failed', error.message);
      }
      expect(pass).assertTrue();
      console.log('test_foo_bar_iv_Static_0001 done');
      done();
      console.log('test_foo_bar_iv_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Error_FUNC21_STATIC_0100
     * @tc.name      test_foo_bar_vi_Static_0001
     * @tc.desc      Foo.bar_vi() should return 123
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_foo_bar_vi_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_foo_bar_vi_Static_0001 start');
      let pass: boolean = true;
      let result: int = 0;
      try {
        let x = test.createFoo();
        result = x.bar_vi();
      } catch (error) {
        pass = false;
        console.log('foo_bar_vi failed', error.message);
      }
      expect(pass).assertTrue();
      expect(result).assertEqual(123);
      console.log('test_foo_bar_vi_Static_0001 done');
      done();
      console.log('test_foo_bar_vi_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Error_FUNC22_STATIC_0100
     * @tc.name      test_foo_test_bar_Static_0001
     * @tc.desc      Foo.test_bar (noexcept) should not throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_foo_test_bar_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_foo_test_bar_Static_0001 start');
      let pass: boolean = true;
      try {
        let x = test.createFoo();
        x.test_bar();
      } catch (error) {
        pass = false;
        console.log('foo_test_bar failed', error.message);
      }
      expect(pass).assertTrue();
      console.log('test_foo_test_bar_Static_0001 done');
      done();
      console.log('test_foo_test_bar_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Error_FUNC23_STATIC_0100
     * @tc.name      test_foo_test_bar_ii_Static_0001
     * @tc.desc      Foo.test_bar_ii(20) should return 40
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_foo_test_bar_ii_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_foo_test_bar_ii_Static_0001 start');
      let pass: boolean = true;
      let result: int = 0;
      try {
        let x = test.createFoo();
        result = x.test_bar_ii(20);
      } catch (error) {
        pass = false;
        console.log('foo_test_bar_ii failed', error.message);
      }
      expect(pass).assertTrue();
      expect(result).assertEqual(40);
      console.log('test_foo_test_bar_ii_Static_0001 done');
      done();
      console.log('test_foo_test_bar_ii_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Error_FUNC24_STATIC_0100
     * @tc.name      test_foo_test_bar_iv_Static_0001
     * @tc.desc      Foo.test_bar_iv(789) (noexcept) should not throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_foo_test_bar_iv_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_foo_test_bar_iv_Static_0001 start');
      let pass: boolean = true;
      try {
        let x = test.createFoo();
        x.test_bar_iv(789);
      } catch (error) {
        pass = false;
        console.log('foo_test_bar_iv failed', error.message);
      }
      expect(pass).assertTrue();
      console.log('test_foo_test_bar_iv_Static_0001 done');
      done();
      console.log('test_foo_test_bar_iv_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Error_FUNC25_STATIC_0100
     * @tc.name      test_foo_test_bar_vi_Static_0001
     * @tc.desc      Foo.test_bar_vi() (noexcept) should return 456
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_foo_test_bar_vi_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_foo_test_bar_vi_Static_0001 start');
      let pass: boolean = true;
      let result: int = 0;
      try {
        let x = test.createFoo();
        result = x.test_bar_vi();
      } catch (error) {
        pass = false;
        console.log('foo_test_bar_vi failed', error.message);
      }
      expect(pass).assertTrue();
      expect(result).assertEqual(456);
      console.log('test_foo_test_bar_vi_Static_0001 done');
      done();
      console.log('test_foo_test_bar_vi_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Error_FUNC26_STATIC_0100
     * @tc.name      test_foo_callcb_Static_0001
     * @tc.desc      Foo.callcb with callback that throws should return 100
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_foo_callcb_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_foo_callcb_Static_0001 start');
      let pass: boolean = true;
      let result: int = 0;
      try {
        let x = test.createFoo();
        result = x.callcb((): void => {
          console.log("Foo callcb called");
        });
      } catch (error) {
        pass = false;
        console.log('foo_callcb failed', error.message);
      }
      expect(result).assertEqual(100);
      console.log('test_foo_callcb_Static_0001 done');
      done();
      console.log('test_foo_callcb_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Error_FUNC27_STATIC_0100
     * @tc.name      test_foo_callcb_ii_Static_0001
     * @tc.desc      Foo.callcb_ii with callback returning a+1 should return 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_foo_callcb_ii_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_foo_callcb_ii_Static_0001 start');
      let pass: boolean = true;
      let result: int = 0;
      try {
        let x = test.createFoo();
        result = x.callcb_ii((a: int): int => {
          console.log("Foo callcb_ii called", a);
          return a + 1;
        });
      } catch (error) {
        pass = false;
        console.log('foo_callcb_ii failed', error.message);
      }
      expect(result).assertEqual(2);
      console.log('test_foo_callcb_ii_Static_0001 done');
      done();
      console.log('test_foo_callcb_ii_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Error_FUNC28_STATIC_0100
     * @tc.name      test_foo_test_cb_v_Static_0001
     * @tc.desc      Foo.test_cb_v (noexcept) with void callback should succeed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_foo_test_cb_v_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_foo_test_cb_v_Static_0001 start');
      let pass: boolean = true;
      try {
        let x = test.createFoo();
        x.test_cb_v((): void => {
          console.log("Foo test_cb_v in ets");
        });
      } catch (error) {
        pass = false;
        console.log('foo_test_cb_v failed', error.message);
      }
      expect(pass).assertTrue();
      console.log('test_foo_test_cb_v_Static_0001 done');
      done();
      console.log('test_foo_test_cb_v_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Error_FUNC29_STATIC_0100
     * @tc.name      test_foo_test_cb_ii_Static_0001
     * @tc.desc      Foo.test_cb_ii (noexcept) with callback returning a+1 should return 101
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_foo_test_cb_ii_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_foo_test_cb_ii_Static_0001 start');
      let pass: boolean = true;
      let result: int = 0;
      try {
        let x = test.createFoo();
        result = x.test_cb_ii((a: int): int => {
          console.log("Foo test_cb_ii called", a);
          return a + 1;
        });
      } catch (error) {
        pass = false;
        console.log('foo_test_cb_ii failed', error.message);
      }
      expect(result).assertEqual(101);
      console.log('test_foo_test_cb_ii_Static_0001 done');
      done();
      console.log('test_foo_test_cb_ii_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Error_FUNC30_STATIC_0100
     * @tc.name      test_callFoo_Static_0001
     * @tc.desc      callFoo with Foo instance should return error message "A Error in bar"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_callFoo_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_callFoo_Static_0001 start');
      let pass: boolean = true;
      try {
        let x = test.createFoo();
        const str = test.callFoo(x);
        expect(str).assertEqual("A Error in bar");
      } catch (error) {
        pass = false;
        console.log('callFoo failed', error.message);
      }
      expect(pass).assertTrue();
      console.log('test_callFoo_Static_0001 done');
      done();
      console.log('test_callFoo_Static_0001 end');
    });
  });
}