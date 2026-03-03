/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import touch from 'libtouchndk.so';

export default function MultimodalTouchNdkTest() {
  describe('MultimodalTouchNdkTest', () => {

    const ExpectTrue = (n: boolean) => {
      try {
        expect(n).assertTrue();
      } catch (err) {
        console.info("expectInfo", `test failed`);
      }
    }
    const ExpectFalse = (n: boolean) => {
      try {
        expect(n).assertFail();
      } catch (err) {
        console.info("expectInfo", `test failed`);
      }
    }

    /**
     * @tc.name   SUB_MMI_Input_Api_QueryMaxTouchPoints_0100
     * @tc.number SUB_MMI_Input_Api_QueryMaxTouchPoints_0100
     * @tc.desc   OH_Input_QueryMaxTouchPoints Interface testing to set count as nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_QueryMaxTouchPoints_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_QueryMaxTouchPoints_0100';
      console.info(`${caseName} start to test OH_Input_QueryMaxTouchPoints`);
      try {
        let data = touch.QueryMaxTouchPoints1();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        ExpectTrue(data == 1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_QueryMaxTouchPoints`);
    });    

    /**
     * @tc.name   SUB_MMI_Input_Api_QueryMaxTouchPoints_0200
     * @tc.number SUB_MMI_Input_Api_QueryMaxTouchPoints_0200
     * @tc.desc   OH_Input_QueryMaxTouchPoints Interface testing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_QueryMaxTouchPoints_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_QueryMaxTouchPoints_0200';
      console.info(`${caseName} start to test OH_Input_QueryMaxTouchPoints`);
      try {
        let data = touch.QueryMaxTouchPoints2();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        ExpectTrue(data == 1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_QueryMaxTouchPoints`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_InjectTouchEventGlobal_0100
     * @tc.number SUB_MMI_Input_Api_InjectTouchEventGlobal_0100
     * @tc.desc   OH_Input_InjectTouchEventGlobal Interface testing to set globalX globalY as 100.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_InjectTouchEventGlobal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_InjectTouchEventGlobal_0100';
      console.info(`${caseName} start to test OH_Input_InjectTouchEventGlobal`);
      try {
        let data = touch.InjectTouchEventGlobal1();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        ExpectTrue(data == 1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_InjectTouchEventGlobal`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_InjectTouchEventGlobal_0200
     * @tc.number SUB_MMI_Input_Api_InjectTouchEventGlobal_0200
     * @tc.desc   OH_Input_GetTouchEventGlobalX Interface testing to set globalX as 100.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_InjectTouchEventGlobal_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_InjectTouchEventGlobal_0200';
      console.info(`${caseName} start to test OH_Input_GetTouchEventGlobalX`);
      try {
        let data = touch.InjectTouchEventGlobal2();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        ExpectTrue(data == 1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetTouchEventGlobalX`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_InjectTouchEventGlobal_0300
     * @tc.number SUB_MMI_Input_Api_InjectTouchEventGlobal_0300
     * @tc.desc   OH_Input_GetTouchEventGlobalY Interface testing to set globalY as 100.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_InjectTouchEventGlobal_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_InjectTouchEventGlobal_0300';
      console.info(`${caseName} start to test OH_Input_GetTouchEventGlobalY`);
      try {
        let data = touch.InjectTouchEventGlobal3();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        ExpectTrue(data == 1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetTouchEventGlobalY`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_AxisEventGlobal_0100
     * @tc.number SUB_MMI_Input_Api_AxisEventGlobal_0100
     * @tc.desc   OH_Input_GetAxisEventGlobalX Interface testing to set globalX as 100 .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_AxisEventGlobal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_AxisEventGlobal_0100';
      console.info(`${caseName} start to test OH_Input_GetAxisEventGlobalX`);
      try {
        let data = touch.AxisEventGlobal1();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        ExpectTrue(data == 1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetAxisEventGlobalX`);
    });    

    /**
     * @tc.name   SUB_MMI_Input_Api_AxisEventGlobal_0200
     * @tc.number SUB_MMI_Input_Api_AxisEventGlobal_0200
     * @tc.desc   OH_Input_SetAxisEventGlobalY Interface testing to set globalY as 100.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_AxisEventGlobal_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_AxisEventGlobal_0200';
      console.info(`${caseName} start to test OH_Input_SetAxisEventGlobalY`);
      try {
        let data = touch.AxisEventGlobal2();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        ExpectTrue(data == 1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_SetAxisEventGlobalY`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_GetKeyEventId_0100
     * @tc.number SUB_MMI_Input_Api_GetKeyEventId_0100
     * @tc.desc   OH_Input_GetKeyEventId Interface testing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_GetKeyEventId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_GetKeyEventId_0100';
      console.info(`${caseName} start to test OH_Input_GetKeyEventId`);
      try {
        let data = touch.GetKeyEventId1();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        ExpectTrue(data == 1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetKeyEventId`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_AddKeyEventHook_0100
     * @tc.number SUB_MMI_Input_Api_AddKeyEventHook_0100
     * @tc.desc   OH_Input_AddKeyEventHook Interface testing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_AddKeyEventHook_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_AddKeyEventHook_0100';
      console.info(`${caseName} start to test OH_Input_AddKeyEventHook`);
      try {
        let data = touch.AddKeyEventHook1();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        ExpectTrue(data == 1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_AddKeyEventHook`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_RemoveKeyEventHook_0100
     * @tc.number SUB_MMI_Input_Api_RemoveKeyEventHook_0100
     * @tc.desc   OH_Input_RemoveKeyEventHook Interface testing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_RemoveKeyEventHook_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_RemoveKeyEventHook_0100';
      console.info(`${caseName} start to test OH_Input_RemoveKeyEventHook`);
      try {
        let data = touch.RemoveKeyEventHook1();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        ExpectTrue(data == 1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RemoveKeyEventHook`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_DispatchToNextHandler_0100
     * @tc.number SUB_MMI_Input_Api_DispatchToNextHandler_0100
     * @tc.desc   OH_Input_DispatchToNextHandler Interface testing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_DispatchToNextHandler_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_DispatchToNextHandler_0100';
      console.info(`${caseName} start to test OH_Input_DispatchToNextHandler`);
      try {
        let data = touch.DispatchToNextHandler1();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        ExpectTrue(data == 1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_DispatchToNextHandler`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_CreateTouchEvent_0100
     * @tc.number SUB_MMI_Input_Api_CreateTouchEvent_0100
     * @tc.desc   OH_Input_CreateTouchEvent Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CreateTouchEvent_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CreateTouchEvent_0100';
      console.info(`${caseName} start to test OH_Input_CreateTouchEvent`);
      try {
        let data = touch.createTouchEvent();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(0);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test OH_Input_CreateTouchEvent`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_DestroyTouchEvent_0100
     * @tc.number SUB_MMI_Input_Api_DestroyTouchEvent_0100
     * @tc.desc   OH_Input_DestroyTouchEvent Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_DestroyTouchEvent_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_DestroyTouchEvent_0100';
      console.info(`${caseName} start to test OH_Input_DestroyTouchEvent`);
      try {
        let data = touch.destroyTouchEvent();
        let touchFlag = 0;
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} destroy TouchEvent success`);
          touchFlag++;
          expect(touchFlag).assertEqual(1);
          done();
        } else {
          console.info(`${caseName} destroy TouchEvent fail`);
          expect().assertFail();
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test OH_Input_DestroyTouchEvent`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_TouchEventAction_0100
     * @tc.number SUB_MMI_Input_Api_TouchEventAction_0100
     * @tc.desc   OH_Input_GetTouchEventAction Interface testing, verify the set and get of touchEvent action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_TouchEventAction_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_TouchEventAction_0100';
      console.info(`${caseName} start to test OH_Input_GetTouchEventAction`);
      try {
        let data = touch.touchEventAction(1);
        let touchFlag = 0;
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          touchFlag++;
          expect(touchFlag).assertEqual(1);
          done();
        } else {
          console.info(`${caseName} fail`);
          expect().assertFail();
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetTouchEventAction`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_TouchEventFingerId_0100
     * @tc.number SUB_MMI_Input_Api_TouchEventFingerId_0100
     * @tc.desc   OH_Input_GetTouchEventFingerId Interface testing, verify the set and get of touchEvent id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_TouchEventFingerId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_TouchEventFingerId_0100';
      console.info(`${caseName} start to test OH_Input_GetTouchEventFingerId`);
      try {
        let data = touch.touchEventFingerId(0);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(0);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetTouchEventFingerId`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_TouchEventDisplayX_0100
     * @tc.number SUB_MMI_Input_Api_TouchEventDisplayX_0100
     * @tc.desc   OH_Input_GetTouchEventDisplayX Interface testing, verify the set and get of touchEvent displayX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_TouchEventDisplayX_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_TouchEventDisplayX_0100';
      console.info(`${caseName} start to test OH_Input_GetTouchEventDisplayX`);
      try {
        let data = touch.touchEventDisplayX(100);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(100);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetTouchEventDisplayX`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_TouchEventDisplayY_0100
     * @tc.number SUB_MMI_Input_Api_TouchEventDisplayY_0100
     * @tc.desc   OH_Input_GetTouchEventDisplayY Interface testing, verify the set and get of touchEvent displayY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_TouchEventDisplayY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_TouchEventDisplayY_0100';
      console.info(`${caseName} start to test OH_Input_GetTouchEventDisplayY`);
      try {
        let data = touch.touchEventDisplayY(100);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(100);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetTouchEventDisplayY`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_TouchEventActionTime_0100
     * @tc.number SUB_MMI_Input_Api_TouchEventActionTime_0100
     * @tc.desc   OH_Input_GetTouchEventActionTime Interface testing, verify the set and get of touchEvent actionTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_TouchEventActionTime_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_TouchEventActionTime_0100';
      console.info(`${caseName} start to test OH_Input_GetTouchEventActionTime`);
      try {
        let data = touch.touchEventActionTime(200);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(200);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetTouchEventActionTime`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_InjectTouchEvent_0100
     * @tc.number SUB_MMI_Input_Api_InjectTouchEvent_0100
     * @tc.desc   OH_Input_InjectTouchEvent Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_InjectTouchEvent_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_InjectTouchEvent_0100';
      console.info(`${caseName} start to test OH_Input_InjectTouchEvent`);
      try {
        let data = touch.injectTouchEvent(-671, -10);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(401);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test OH_Input_InjectTouchEvent`);
    });    
  });
}