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
import * as opt from '../ets/opt';

export default function optGlobalTest(): void {
  describe("ActsOptGlobalTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_Opt_ShowOptionalIntWithValue_STATIC_0100
     * @tc.name      test_Opt_ShowOptionalIntWithValue_Static_0001
     * @tc.desc      showOptionalInt with a value should not throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Opt_ShowOptionalIntWithValue_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Opt_ShowOptionalIntWithValue_Static_0001 start');
      let caught: boolean = true;
      try {
        opt.showOptionalInt(100);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_Opt_ShowOptionalIntWithValue_Static_0001 done');
      done();
      console.log('test_Opt_ShowOptionalIntWithValue_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Opt_ShowOptionalIntWithoutValue_STATIC_0100
     * @tc.name      test_Opt_ShowOptionalIntWithoutValue_Static_0001
     * @tc.desc      showOptionalInt without value should not throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Opt_ShowOptionalIntWithoutValue_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Opt_ShowOptionalIntWithoutValue_Static_0001 start');
      let caught: boolean = true;
      try {
        opt.showOptionalInt(undefined);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_Opt_ShowOptionalIntWithoutValue_Static_0001 done');
      done();
      console.log('test_Opt_ShowOptionalIntWithoutValue_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Opt_MakeOptionalIntTrue_STATIC_0100
     * @tc.name      test_Opt_MakeOptionalIntTrue_Static_0001
     * @tc.desc      makeOptionalInt(true) should return a value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Opt_MakeOptionalIntTrue_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Opt_MakeOptionalIntTrue_Static_0001 start');
      let res = opt.makeOptionalInt(true);
      expect(res!).assertEqual(10);
      console.log('test_Opt_MakeOptionalIntTrue_Static_0001 done');
      done();
      console.log('test_Opt_MakeOptionalIntTrue_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Opt_MakeOptionalIntFalse_STATIC_0100
     * @tc.name      test_Opt_MakeOptionalIntFalse_Static_0001
     * @tc.desc      makeOptionalInt(false) should return undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Opt_MakeOptionalIntFalse_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Opt_MakeOptionalIntFalse_Static_0001 start');
      let res = opt.makeOptionalInt(false);
      expect(res).assertUndefined();
      console.log('test_Opt_MakeOptionalIntFalse_Static_0001 done');
      done();
      console.log('test_Opt_MakeOptionalIntFalse_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Opt_MakeOptionalArrayTrue_STATIC_0100
     * @tc.name      test_Opt_MakeOptionalArrayTrue_Static_0001
     * @tc.desc      makeOptionalArray(true, 5, 3) should return a value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Opt_MakeOptionalArrayTrue_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Opt_MakeOptionalArrayTrue_Static_0001 start');
      let res = opt.makeOptionalArray(true, 5, 3);
      const arr = res! as Array<int>;
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(3);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(3);
      expect(arr[4]).assertEqual(3);
      console.log('test_Opt_MakeOptionalArrayTrue_Static_0001 done');
      done();
      console.log('test_Opt_MakeOptionalArrayTrue_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Opt_MakeOptionalArrayFalse_STATIC_0100
     * @tc.name      test_Opt_MakeOptionalArrayFalse_Static_0001
     * @tc.desc      makeOptionalArray(false, 5, 3) should return undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Opt_MakeOptionalArrayFalse_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Opt_MakeOptionalArrayFalse_Static_0001 start');
      let res = opt.makeOptionalArray(false, 5, 3);
      expect(res).assertUndefined();
      console.log('test_Opt_MakeOptionalArrayFalse_Static_0001 done');
      done();
      console.log('test_Opt_MakeOptionalArrayFalse_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Opt_SendReturnResultWithResults_STATIC_0100
     * @tc.name      test_Opt_SendReturnResultWithResults_Static_0001
     * @tc.desc      sendReturnResult with results field should return a value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Opt_SendReturnResultWithResults_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Opt_SendReturnResultWithResults_Static_0001 start');
      let result: opt.ReturnResult = {results: ["ab", "cd", "ef"]};
      let res = opt.sendReturnResult(result);
      expect(res!).assertEqual("abcdef");
      console.log('test_Opt_SendReturnResultWithResults_Static_0001 done');
      done();
      console.log('test_Opt_SendReturnResultWithResults_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Opt_SendReturnResultWithoutResults_STATIC_0100
     * @tc.name      test_Opt_SendReturnResultWithoutResults_Static_0001
     * @tc.desc      sendReturnResult without results field should return undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Opt_SendReturnResultWithoutResults_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Opt_SendReturnResultWithoutResults_Static_0001 start');
      let result: opt.ReturnResult = {};
      let res = opt.sendReturnResult(result);
      expect(res).assertUndefined();
      console.log('test_Opt_SendReturnResultWithoutResults_Static_0001 done');
      done();
      console.log('test_Opt_SendReturnResultWithoutResults_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Opt_CallCallbackWithSecond_STATIC_0100
     * @tc.name      test_Opt_CallCallbackWithSecond_Static_0001
     * @tc.desc      callCallback(true) should pass "Hello" and "World" to callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Opt_CallCallbackWithSecond_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Opt_CallCallbackWithSecond_Static_0001 start');
      opt.callCallback(true, (a: string, b?: string): void => {
        expect(a).assertEqual("Hello");
        expect(b).assertEqual("World");
      });
      console.log('test_Opt_CallCallbackWithSecond_Static_0001 done');
      done();
      console.log('test_Opt_CallCallbackWithSecond_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Opt_CallCallbackWithoutSecond_STATIC_0100
     * @tc.name      test_Opt_CallCallbackWithoutSecond_Static_0001
     * @tc.desc      callCallback(false) should pass "Hello" and undefined to callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Opt_CallCallbackWithoutSecond_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Opt_CallCallbackWithoutSecond_Static_0001 start');
      opt.callCallback(false, (a: string, b?: string): void => {
        expect(a).assertEqual("Hello");
        expect(b).assertUndefined();
      });
      console.log('test_Opt_CallCallbackWithoutSecond_Static_0001 done');
      done();
      console.log('test_Opt_CallCallbackWithoutSecond_Static_0001 end');
    });
  })
}