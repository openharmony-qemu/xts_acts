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
import { BusinessError } from '@ohos.base';
import * as test_primitives from '../ets/Index'

export default function primitiveBooleanTest(): void {
  describe("ActsPrimitiveBooleanTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    let primitivesBoolTest: test_primitives.PrimitivesBoolean = test_primitives.get_interface_bool();

    /**
     * @tc.number    SUB_Taihe_PrimitivesBoolean_FUNC1_STATIC_0100
     * @tc.name      test_TestBaseBoolFunc1_Static_0001
     * @tc.desc      PrimitivesBoolean TestBaseBoolFunc1 with boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseBoolFunc1_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseBoolFunc1_Static_0001 start');
      let pass: boolean = true;
      try {
        primitivesBoolTest.testBaseBoolFunc1(true);
        primitivesBoolTest.testBaseBoolFunc1(false);
      } catch (e) {
        pass = false;
        console.log('TestBaseBoolFunc1 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_TestBaseBoolFunc1_Static_0001 done');
      done();
      console.log('test_TestBaseBoolFunc1_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesBoolean_FUNC2_STATIC_0100
     * @tc.name      test_TestBaseBoolFunc2_Static_0001
     * @tc.desc      PrimitivesBoolean TestBaseBoolFunc2 returns int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseBoolFunc2_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseBoolFunc2_Static_0001 start');
      let result = primitivesBoolTest.testBaseBoolFunc2(true)
      expect(result).assertEqual(65535);
      result = primitivesBoolTest.testBaseBoolFunc2(false)
      expect(result).assertEqual(0);
      console.log('test_TestBaseBoolFunc2_Static_0001 done');
      done();
      console.log('test_TestBaseBoolFunc2_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesBoolean_FUNC3_STATIC_0100
     * @tc.name      test_TestBaseBoolFunc3_Static_0001
     * @tc.desc      PrimitivesBoolean TestBaseBoolFunc3 returns boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseBoolFunc3_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseBoolFunc3_Static_0001 start');
      let result = primitivesBoolTest.testBaseBoolFunc3(true)
      expect(result).assertFalse();
      result = primitivesBoolTest.testBaseBoolFunc3(false)
      expect(result).assertTrue();
      console.log('test_TestBaseBoolFunc3_Static_0001 done');
      done();
      console.log('test_TestBaseBoolFunc3_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesBoolean_FUNC4_STATIC_0100
     * @tc.name      test_TestBaseBoolFunc4_Static_0001
     * @tc.desc      PrimitivesBoolean TestBaseBoolFunc4 with optional boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseBoolFunc4_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseBoolFunc4_Static_0001 start');
      let result = primitivesBoolTest.testBaseBoolFunc4(true)
      expect(result).assertFalse();
      result = primitivesBoolTest.testBaseBoolFunc4(false)
      expect(result).assertFalse();
      result = primitivesBoolTest.testBaseBoolFunc4(undefined)
      expect(result).assertTrue();
      console.log('test_TestBaseBoolFunc4_Static_0001 done');
      done();
      console.log('test_TestBaseBoolFunc4_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesBoolean_FUNC5_STATIC_0100
     * @tc.name      test_TestBaseBoolFunc5_Static_0001
     * @tc.desc      PrimitivesBoolean TestBaseBoolFunc5 returns boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseBoolFunc5_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseBoolFunc5_Static_0001 start');
      let result = primitivesBoolTest.testBaseBoolFunc5(true)
      expect(result).assertTrue();
      console.log('test_TestBaseBoolFunc5_Static_0001 done');
      done();
      console.log('test_TestBaseBoolFunc5_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesBoolean_FUNC5PROMISE_STATIC_0100
     * @tc.name      test_TestBaseBoolFunc5Promise_Static_0001
     * @tc.desc      PrimitivesBoolean TestBaseBoolFunc5Promise returns promise
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseBoolFunc5Promise_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseBoolFunc5Promise_Static_0001 start');
      let result = await primitivesBoolTest.TestBaseBoolFunc5Promise(true);
      expect(result).assertTrue();
      console.log('test_TestBaseBoolFunc5Promise_Static_0001 done');
      done();
      console.log('test_TestBaseBoolFunc5Promise_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesBoolean_FUNC5ASYNC_STATIC_0100
     * @tc.name      test_TestBaseBoolFunc5Async_Static_0001
     * @tc.desc      PrimitivesBoolean TestBaseBoolFunc5Async with callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseBoolFunc5Async_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseBoolFunc5Async_Static_0001 start');
      let asyncResult: boolean = false;
      await new Promise<boolean>((resolve, reject): void => {
        primitivesBoolTest.TestBaseBoolFunc5Async(true,
          (err: BusinessError | null, data?: boolean): void => {
            if (err !== null && err.code !== 0) {
              reject(err as Error);
            } else {
              asyncResult = data!;
              resolve(asyncResult);
            }
          });
      });
      expect(asyncResult).assertTrue();
      console.log('test_TestBaseBoolFunc5Async_Static_0001 done');
      done();
      console.log('test_TestBaseBoolFunc5Async_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesBoolean_BOOLTEST_STATIC_0100
     * @tc.name      test_BoolTest_Static_0001
     * @tc.desc      PrimitivesBoolean boolTest getter returns true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BoolTest_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_BoolTest_Static_0001 start');
      expect(primitivesBoolTest.boolTest).assertTrue();
      console.log('test_BoolTest_Static_0001 done');
      done();
      console.log('test_BoolTest_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesBoolean_FUNC7_STATIC_0100
     * @tc.name      test_TestBaseBoolFunc7_Static_0001
     * @tc.desc      PrimitivesBoolean TestBaseBoolFunc7 with record argument
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseBoolFunc7_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseBoolFunc7_Static_0001 start');
      let testRecord1: Record<string, boolean> = {
        "test1": false,
        "test2": false,
        "test3": false,
        "test4": true,
      };
      let result = primitivesBoolTest.testBaseBoolFunc7(testRecord1)
      expect(result).assertFalse();
      let testRecord2: Record<string, boolean> = {
        "test1": false,
        "test2": false,
        "test3": false,
        "test4": false,
      };
      result = primitivesBoolTest.testBaseBoolFunc7(testRecord2)
      expect(result).assertTrue();
      console.log('test_TestBaseBoolFunc7_Static_0001 done');
      done();
      console.log('test_TestBaseBoolFunc7_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrimitivesBooleanClass_FUNC6_STATIC_0100
     * @tc.name      test_TestBaseBoolFunc6_Static_0001
     * @tc.desc      PrimitivesBooleanClass static TestBaseBoolFunc6 returns boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TestBaseBoolFunc6_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_TestBaseBoolFunc6_Static_0001 start');
      let result = test_primitives.PrimitivesBooleanClass.testBaseBoolFunc6()
      expect(result).assertFalse();
      console.log('test_TestBaseBoolFunc6_Static_0001 done');
      done();
      console.log('test_TestBaseBoolFunc6_Static_0001 end');
    });
  })
}
