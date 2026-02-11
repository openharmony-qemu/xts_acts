/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level } from "@ohos/hypium"
import napitest from 'libnapifunctioncalltest.so'
import abcDefaultFunc from './Abc.test';

export default function napiFunctionCallTest() {
  describe('napiFunctionCallTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_UTIL_FUNCTION_CALL_0100
     * @tc.name      testFunctionCall0001
     * @tc.desc      Test Native Function Call Normal Function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFunctionCall0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      console.info('testFunctionCall0001 START');
      let sum: number = napitest.add(2, 3);
      let total: number = 5;
      expect(sum).assertEqual(total);
      console.info('testFunctionCall0001 END');
    });

    /**
     * @tc.number    SUB_UTIL_FUNCTION_CALL_0200
     * @tc.name      testFunctionCall0002
     * @tc.desc      Test Native Function Call Get Add Function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFunctionCall0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      console.info('testFunctionCall0002 START');
      const sum = napitest.getAddFunc();
      let total: number = 5;
      expect(sum(2,3)).assertEqual(total);
      console.info('testFunctionCall0002 END');
    });

    /**
     * @tc.number    SUB_UTIL_FUNCTION_CALL_0300
     * @tc.name      testFunctionCall0003
     * @tc.desc      Test Native Function Call Create Function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFunctionCall0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      console.info('testFunctionCall0003 START');
      const addFunObj = napitest.napiCreateFunction();
      const addFunc = addFunObj as Function;
      const res:number = addFunc(3, 4);
      expect(res).assertEqual(7);
      console.info('testFunctionCall0003 END');
    });

    /**
     * @tc.number    SUB_UTIL_FUNCTION_CALL_0400
     * @tc.name      testFunctionCall0004
     * @tc.desc      Test Native Function Call Mutiply
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFunctionCall0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      console.info('testFunctionCall0004 START');
      const multiplyRes = napitest.nativeMultiply(2,3);
      let total: number = 6;
      expect(multiplyRes).assertEqual(total);
      console.info('testFunctionCall0004 END');
    });

    /**
     * @tc.number    SUB_UTIL_FUNCTION_CALL_0500
     * @tc.name      testFunctionCall0005
     * @tc.desc      Test Native Function Call ArkTS Function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFunctionCall0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      console.info('testFunctionCall0005 START');
      const arktsSubtractionFunc = (a: number, b: number): number => {
        console.log(`The ArkTS function is called by C++ with parameters：a=${a}, b=${b}`);
        return a - b;
      };

      const callResult: number = napitest.callArkTS(arktsSubtractionFunc);
      let total: number = 2;
      expect(callResult).assertEqual(total);
      console.info('testFunctionCall0005 END');
    });

    /**
     * @tc.number    SUB_UTIL_FUNCTION_CALL_0600
     * @tc.name      testFunctionCall0006
     * @tc.desc      Test Native Function Call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFunctionCall0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      console.info('testFunctionCall0006 START');
      const resultObj = napitest.createAndCallInOneFunc();

      const dynamicFunc = resultObj.func as (x: number) => number;

      const inputVal = 8.5;
      const funcRes = dynamicFunc(inputVal);
      expect(funcRes === inputVal * 2).assertTrue();
      console.info('testFunctionCall0006 END');
    });

    /**
     * @tc.number    SUB_UTIL_FUNCTION_CALL_0700
     * @tc.name      testFunctionCall0007
     * @tc.desc      Test Native Function Call Chain
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFunctionCall0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      console.info('testFunctionCall0007 START');
      const addOneFunc = (x: number): number => {
        console.log(`The ArkTS accumulate function is called, with the following parameters:${x}`);
        return x + 1;
      };

      const finalResult = napitest.callChain(addOneFunc);
      const expectedResult = 8;
      expect(finalResult).assertEqual(expectedResult);
      console.info('testFunctionCall0007 START');
    });

    /**
     * @tc.number    SUB_UTIL_FUNCTION_CALL_0800
     * @tc.name      testFunctionCall0008
     * @tc.desc      Test Native Function Call Run ScriptPath
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFunctionCall0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      console.info('testFunctionCall0008 START');
      const finalResult = napitest.runScriptPath(abcDefaultFunc);

      expect(finalResult).assertTrue();
      console.info('testFunctionCall0008 END');
    });

    /**
     * @tc.number    SUB_UTIL_FUNCTION_CALL_0900
     * @tc.name      testFunctionCall0009
     * @tc.desc      Test Native Function Call And Call Getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFunctionCall0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      console.info('testFunctionCall0009 START');
      const finalResult = napitest.callGetter();
      expect(finalResult).assertTrue();
      console.info('testFunctionCall0009 END');
    });

    /**
     * @tc.number    SUB_UTIL_FUNCTION_CALL_1000
     * @tc.name      testFunctionCall0010
     * @tc.desc      Test Native Function Call And Call Setter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFunctionCall0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      console.info('testFunctionCall0010 START');
      const finalResult = napitest.callSetter();
      console.info('testFunctionCall0010 value is: ' + finalResult);
      expect(finalResult).assertTrue();
      console.info('testFunctionCall0010 END');
    });

    /**
     * @tc.number    SUB_UTIL_FUNCTION_CALL_1100
     * @tc.name      testFunctionCall0011
     * @tc.desc      Test Native Function Call Promise Resolve
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFunctionCall0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testFunctionCall0011 START');
        const promise = napitest.createPromiseResolve();

        promise
          .then((resolveResult: string) => {
            console.log(`Promise resolve Result：${resolveResult}`);
            expect(resolveResult).assertEqual('native_async_task_success');
          })
          .catch((error: Error) => {
            console.error(`Promise catch errormsg：${error.message}`);
            expect().assertFail();
          });
        done();
        console.info('testFunctionCall0011 END');
    });
  })
}