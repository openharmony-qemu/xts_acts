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
import * as test from '../ets/Index'

export default function callbackManagerTest(): void {
  describe("ActsCallbackManagerTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_CallbackManager_FUNC1_STATIC_0100
     * @tc.name      test_CallbackManager_AddCallback_Static_0001
     * @tc.desc      CallbackManager addCallback with valid callbacks
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CallbackManager_AddCallback_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CallbackManager_AddCallback_Static_0001 start');
      let pass: boolean = true;
      try {
        let manager = new test.CallbackManager();
        let callback1 = (): string => {
          return "Callback 1 result";
        };
        let callback2 = (): string => {
          return "Callback 2 result";
        };
        let result1 = manager.addCallback(callback1);
        let result2 = manager.addCallback(callback2);
        let result3 = manager.addCallback(callback1);
        expect(result1).assertTrue();
        expect(result2).assertTrue();
        expect(result3).assertFalse();
      } catch (e) {
        pass = false;
        console.log('AddCallback failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_CallbackManager_AddCallback_Static_0001 done');
      done();
      console.log('test_CallbackManager_AddCallback_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_CallbackManager_FUNC2_STATIC_0100
     * @tc.name      test_CallbackManager_InvokeCallbacks_Static_0001
     * @tc.desc      CallbackManager invokeCallbacks returns correct results
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CallbackManager_InvokeCallbacks_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CallbackManager_InvokeCallbacks_Static_0001 start');
      let pass: boolean = true;
      try {
        let manager = new test.CallbackManager();
        let callback1 = (): string => {
          return "Callback 1 result";
        };
        let callback2 = (): string => {
          return "Callback 2 result";
        };
        let callback3 = (): string => {
          return "Callback 3 result";
        };
        let str1 = callback1();
        let str2 = callback2();
        let str3 = callback3();

        manager.addCallback(callback1);
        manager.addCallback(callback2);
        manager.addCallback(callback3);

        let arr = manager.invokeCallbacks();
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(str1);
        expect(arr[1]).assertEqual(str2);
        expect(arr[2]).assertEqual(str3);
      } catch (e) {
        pass = false;
        console.log('InvokeCallbacks failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_CallbackManager_InvokeCallbacks_Static_0001 done');
      done();
      console.log('test_CallbackManager_InvokeCallbacks_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_CallbackManager_FUNC3_STATIC_0100
     * @tc.name      test_CallbackManager_RemoveCallback_Static_0001
     * @tc.desc      CallbackManager removeCallback removes callback correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CallbackManager_RemoveCallback_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CallbackManager_RemoveCallback_Static_0001 start');
      let pass: boolean = true;
      try {
        let manager = new test.CallbackManager();
        let callback1 = (): string => {
          return "Callback 1 result";
        };
        let callback2 = (): string => {
          return "Callback 2 result";
        };
        manager.addCallback(callback1);
        manager.addCallback(callback2);

        let arrBefore = manager.invokeCallbacks();
        expect(arrBefore.length).assertEqual(2);

        let removed = manager.removeCallback(callback1);
        expect(removed).assertTrue();

        let arrAfter = manager.invokeCallbacks();
        expect(arrAfter.length).assertEqual(1);
        expect(arrAfter[0]).assertEqual(callback2());
      } catch (e) {
        pass = false;
        console.log('RemoveCallback failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_CallbackManager_RemoveCallback_Static_0001 done');
      done();
      console.log('test_CallbackManager_RemoveCallback_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_CallbackManager_FUNC4_STATIC_0100
     * @tc.name      test_CallbackManager_RemoveNonexistent_Static_0001
     * @tc.desc      CallbackManager removeCallback returns false for non-existent callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CallbackManager_RemoveNonexistent_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CallbackManager_RemoveNonexistent_Static_0001 start');
      let pass: boolean = true;
      try {
        let manager = new test.CallbackManager();
        let callback1 = (): string => {
          return "Callback 1 result";
        };
        let callback2 = (): string => {
          return "Callback 2 result";
        };
        manager.addCallback(callback1);

        let result = manager.removeCallback(callback2);
        expect(result).assertFalse();
      } catch (e) {
        pass = false;
        console.log('RemoveNonexistent failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_CallbackManager_RemoveNonexistent_Static_0001 done');
      done();
      console.log('test_CallbackManager_RemoveNonexistent_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_CallbackManager_FUNC5_STATIC_0100
     * @tc.name      test_CallbackManager_EmptyInvoke_Static_0001
     * @tc.desc      CallbackManager invokeCallbacks returns empty array when no callbacks
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CallbackManager_EmptyInvoke_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CallbackManager_EmptyInvoke_Static_0001 start');
      let pass: boolean = true;
      try {
        let manager = new test.CallbackManager();
        let arr = manager.invokeCallbacks();
        expect(arr.length).assertEqual(0);
      } catch (e) {
        pass = false;
        console.log('EmptyInvoke failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_CallbackManager_EmptyInvoke_Static_0001 done');
      done();
      console.log('test_CallbackManager_EmptyInvoke_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_CallbackManager_FUNC6_STATIC_0100
     * @tc.name      test_CallbackManager_AddRemoveAdd_Static_0001
     * @tc.desc      CallbackManager add, remove, then add same callback again
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CallbackManager_AddRemoveAdd_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CallbackManager_AddRemoveAdd_Static_0001 start');
      let pass: boolean = true;
      try {
        let manager = new test.CallbackManager();
        let callback1 = (): string => {
          return "Callback 1 result";
        };
        manager.addCallback(callback1);
        manager.removeCallback(callback1);
        let result = manager.addCallback(callback1);
        expect(result).assertTrue();

        let arr = manager.invokeCallbacks();
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(callback1());
      } catch (e) {
        pass = false;
        console.log('AddRemoveAdd failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_CallbackManager_AddRemoveAdd_Static_0001 done');
      done();
      console.log('test_CallbackManager_AddRemoveAdd_Static_0001 end');
    });
  });
}