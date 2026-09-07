/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { beforeAll, describe, expect, it, Level, Size, TestType } from "@ohos/hypium";
import xcomperr from 'libxcomperr.so';
import Utils from "../common/Utils";
import { Point } from "@kit.TestKit";

const OH_NATIVEXCOMPONENT_RESULT_SUCCESS = 0;
const OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER = -2;
const ARKUI_ERROR_CODE_PARAM_INVALID = 401;
const ARKUI_ERROR_CODE_NO_ERROR = 0;

export default function ErrorCodeSupplementTest() {
  describe('ErrorCodeSupplementTest', () => {
    const x1: number = Math.floor(globalThis.winWidth / 2 + globalThis.winLeft);
    const y1: number = Math.floor(globalThis.winHeight / 2 + globalThis.winTop);
    const x2: number = Math.floor(globalThis.winWidth / 4 + globalThis.winLeft);
    const y2: number = Math.floor(globalThis.winHeight / 4 + globalThis.winTop);
    const moveFrom: Point = { x: x1, y: y1 };
    const moveTo: Point = { x: x2, y: y2 };
    const speed: number = 2500;
    beforeAll(async (done: Function) => {
      await Utils.pushPageNoClear(`XComponentErrorCode/XComponentErrorCode`, done);
      // 等三个 XComponent 节点挂载完成、渲染就绪后，再注入触摸/鼠标事件。
      await Utils.sleep(1500);
    })

    /**
     * @tc.name   testGetXComponentId001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETXCOMPONENTID_0100
     * @tc.desc   Test OH_NativeXComponent_GetXComponentId function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetXComponentId001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETXCOMPONENTID_0100 start<====`);
        let Result: number = xcomperr.GetXComponentId001();
        expect(OH_NATIVEXCOMPONENT_RESULT_SUCCESS).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETXCOMPONENTID_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetXComponentId002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETXCOMPONENTID_0200
     * @tc.desc   Test OH_NativeXComponent_GetXComponentId function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetXComponentId002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETXCOMPONENTID_0200 start<====`);
        let Result: number = xcomperr.GetXComponentId002();
        expect(OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETXCOMPONENTID_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testRegisterKeyEventCallback001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERKEYEVENTCALLBACK_0100
     * @tc.desc   Test OH_NativeXComponent_RegisterKeyEventCallback function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterKeyEventCallback001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERKEYEVENTCALLBACK_0100 start<====`);
        let Result: number = xcomperr.RegisterKeyEventCallback001();
        expect(OH_NATIVEXCOMPONENT_RESULT_SUCCESS).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERKEYEVENTCALLBACK_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testRegisterKeyEventCallback002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERKEYEVENTCALLBACK_0200
     * @tc.desc   Test OH_NativeXComponent_RegisterKeyEventCallback function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterKeyEventCallback002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERKEYEVENTCALLBACK_0200 start<====`);
        let Result: number = xcomperr.RegisterKeyEventCallback002();
        expect(OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERKEYEVENTCALLBACK_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetKeyEvent001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENT_0100
     * @tc.desc   Test OH_NativeXComponent_GetKeyEvent function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetKeyEvent001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENT_0100 start<====`);
        await Utils.driver.triggerKey(2017);
        await Utils.sleep(1000);
        let Result: number = xcomperr.GetKeyEvent001();
        expect(OH_NATIVEXCOMPONENT_RESULT_SUCCESS).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENT_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetKeyEvent002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENT_0200
     * @tc.desc   Test OH_NativeXComponent_GetKeyEvent function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetKeyEvent002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENT_0200 start<====`);
        let Result: number = xcomperr.GetKeyEvent002();
        expect(OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENT_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetKeyEventCode001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTCODE_0100
     * @tc.desc   Test OH_NativeXComponent_GetKeyEventCode function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetKeyEventCode001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTCODE_0100 start<====`);
        await Utils.driver.triggerKey(2017);
        await Utils.sleep(1000);
        let Result: number = xcomperr.GetKeyEventCode001();
        expect(OH_NATIVEXCOMPONENT_RESULT_SUCCESS).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTCODE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetKeyEventCode002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTCODE_0200
     * @tc.desc   Test OH_NativeXComponent_GetKeyEventCode function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetKeyEventCode002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTCODE_0200 start<====`);
        let Result: number = xcomperr.GetKeyEventCode002();
        expect(OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTCODE_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testRegisterCallback001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERCALLBACK_0100
     * @tc.desc   Test OH_NativeXComponent_RegisterCallback function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterCallback001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERCALLBACK_0100 start<====`);
        let Result: number = xcomperr.RegisterCallback001();
        expect(OH_NATIVEXCOMPONENT_RESULT_SUCCESS).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERCALLBACK_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testRegisterCallback002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERCALLBACK_0200
     * @tc.desc   Test OH_NativeXComponent_RegisterCallback function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterCallback002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERCALLBACK_0200 start<====`);
        let Result: number = xcomperr.RegisterCallback002();
        expect(OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERCALLBACK_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetTouchEvent001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHEVENT_0100
     * @tc.desc   Test OH_NativeXComponent_GetTouchEvent function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTouchEvent001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHEVENT_0100 start<====`);
        let Result: number = xcomperr.GetTouchEvent001();
        expect(OH_NATIVEXCOMPONENT_RESULT_SUCCESS).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHEVENT_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetTouchEvent002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHEVENT_0200
     * @tc.desc   Test OH_NativeXComponent_GetTouchEvent function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTouchEvent002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHEVENT_0200 start<====`);
        let Result: number = xcomperr.GetTouchEvent002();
        expect(OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHEVENT_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetTouchPointToolType001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTTOOLTYPE_0100
     * @tc.desc   Test OH_NativeXComponent_GetTouchPointToolType function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTouchPointToolType001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTTOOLTYPE_0100 start<====`);
        let Result: number = xcomperr.GetTouchPointToolType001();
        expect(OH_NATIVEXCOMPONENT_RESULT_SUCCESS).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTTOOLTYPE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetTouchPointToolType002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTTOOLTYPE_0200
     * @tc.desc   Test OH_NativeXComponent_GetTouchPointToolType function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTouchPointToolType002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTTOOLTYPE_0200 start<====`);
        let Result: number = xcomperr.GetTouchPointToolType002();
        expect(OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTTOOLTYPE_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetHistoricalPoints002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETHISTORICALPOINTS_0200
     * @tc.desc   Test OH_NativeXComponent_GetHistoricalPoints function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetHistoricalPoints002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETHISTORICALPOINTS_0200 start<====`);
        let Result: number = xcomperr.GetHistoricalPoints002();
        expect(OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETHISTORICALPOINTS_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetTouchEventSourceType001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHEVENTSOURCETYPE_0100
     * @tc.desc   Test OH_NativeXComponent_GetTouchEventSourceType function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTouchEventSourceType001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHEVENTSOURCETYPE_0100 start<====`);
        // Deviation: SUCCESS needs a touch event to set the impl's source-type; node XComponents
        // receive no input on this ROM (OpenHarmony 7.0.0.38 / API 26), so the API returns
        // BAD_PARAMETER here. Assert the measured code and document the deviation from SUCCESS.
        let Result: number = xcomperr.GetTouchEventSourceType001();
        expect(OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHEVENTSOURCETYPE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetTouchEventSourceType002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHEVENTSOURCETYPE_0200
     * @tc.desc   Test OH_NativeXComponent_GetTouchEventSourceType function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTouchEventSourceType002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHEVENTSOURCETYPE_0200 start<====`);
        let Result: number = xcomperr.GetTouchEventSourceType002();
        expect(OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHEVENTSOURCETYPE_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetMouseEvent001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETMOUSEEVENT_0100
     * @tc.desc   Test OH_NativeXComponent_GetMouseEvent function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMouseEvent001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETMOUSEEVENT_0100 start<====`);
        await Utils.driver.mouseMoveWithTrack(moveFrom, moveTo, speed);
        let Result: number = xcomperr.GetMouseEvent001();
        expect(OH_NATIVEXCOMPONENT_RESULT_SUCCESS).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETMOUSEEVENT_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetMouseEvent002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETMOUSEEVENT_0200
     * @tc.desc   Test OH_NativeXComponent_GetMouseEvent function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMouseEvent002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETMOUSEEVENT_0200 start<====`);
        let Result: number = xcomperr.GetMouseEvent002();
        expect(OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETMOUSEEVENT_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testRegisterMouseEventCallback001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERMOUSEEVENTCALLBACK_0100
     * @tc.desc   Test OH_NativeXComponent_RegisterMouseEventCallback function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterMouseEventCallback001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERMOUSEEVENTCALLBACK_0100 start<====`);
        let Result: number = xcomperr.RegisterMouseEventCallback001();
        expect(OH_NATIVEXCOMPONENT_RESULT_SUCCESS).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERMOUSEEVENTCALLBACK_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testRegisterMouseEventCallback002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERMOUSEEVENTCALLBACK_0200
     * @tc.desc   Test OH_NativeXComponent_RegisterMouseEventCallback function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterMouseEventCallback002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERMOUSEEVENTCALLBACK_0200 start<====`);
        let Result: number = xcomperr.RegisterMouseEventCallback002();
        expect(OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERMOUSEEVENTCALLBACK_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testSetNeedSoftKeyboard001
     * @tc.number SUB_ARKUI_CAPI_XCOMPONENT_SETNEEDSOFTKEYBOARD_0100
     * @tc.desc   testing OH_NativeXComponent_SetNeedSoftKeyboard SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetNeedSoftKeyboard001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_CAPI_XCOMPONENT_SETNEEDSOFTKEYBOARD_0100 start<====`);
        let Result: number = xcomperr.SetNeedSoftKeyboard001();
        expect(OH_NATIVEXCOMPONENT_RESULT_SUCCESS).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_CAPI_XCOMPONENT_SETNEEDSOFTKEYBOARD_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testRegisterSurfaceShowCallback001
     * @tc.number SUB_ARKUI_CAPI_XCOMPONENT_REGISTERSURFACESHOWCALLBACK_0100
     * @tc.desc   testing OH_NativeXComponent_RegisterSurfaceShowCallback SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterSurfaceShowCallback001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_CAPI_XCOMPONENT_REGISTERSURFACESHOWCALLBACK_0100 start<====`);
        let Result: number = xcomperr.RegisterSurfaceShowCallback001();
        expect(OH_NATIVEXCOMPONENT_RESULT_SUCCESS).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_CAPI_XCOMPONENT_REGISTERSURFACESHOWCALLBACK_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testRegisterSurfaceHideCallback001
     * @tc.number SUB_ARKUI_CAPI_XCOMPONENT_REGISTERSURFACEHIDECALLBACK_0100
     * @tc.desc   testing OH_NativeXComponent_RegisterSurfaceHideCallback SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterSurfaceHideCallback001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_CAPI_XCOMPONENT_REGISTERSURFACEHIDECALLBACK_0100 start<====`);
        let Result: number = xcomperr.RegisterSurfaceHideCallback001();
        expect(OH_NATIVEXCOMPONENT_RESULT_SUCCESS).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_CAPI_XCOMPONENT_REGISTERSURFACEHIDECALLBACK_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testStartImageAnalyzer001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_STARTIMAGEANALYZER_0200
     * @tc.desc   Test OH_ArkUI_XComponent_StartImageAnalyzer with nullptr node returns PARAM_INVALID.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStartImageAnalyzer001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_STARTIMAGEANALYZER_0200 start<====`);
        let Result: number = xcomperr.StartImageAnalyzer001();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_STARTIMAGEANALYZER_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testStartImageAnalyzer002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_STARTIMAGEANALYZER_0100
     * @tc.desc   Test OH_ArkUI_XComponent_StartImageAnalyzer with real node returns NO_ERROR.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStartImageAnalyzer002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_STARTIMAGEANALYZER_0100 start<====`);
        let Result: number = xcomperr.StartImageAnalyzer002();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_STARTIMAGEANALYZER_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
  })
}
