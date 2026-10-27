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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function UIEventInjectionTest() {

  describe('UIEventInjectionTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number SUB_ACE_ARKUI_UIEVENTINJECTION_RESULTCODE_0100
     * @tc.name   UIEventInjectionResultCodeTest001
     * @tc.desc   Verify OH_ARKUI_NATIVE_MODULE_UI_EVENT_INJECTION_RESULT_SUCCESS equals 0
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIEventInjectionResultCodeTest001', Level.LEVEL1, async (done: Function) => {
      console.info('[UIEventInjectionResultCodeTest001] START');
      expect(nativeFunc.UIEventInjectionResultCodeTest001()).assertEqual(0);
      console.info('[UIEventInjectionResultCodeTest001] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIEVENTINJECTION_RESULTCODE_0200
     * @tc.name   UIEventInjectionResultCodeTest002
     * @tc.desc   Verify OH_ARKUI_NATIVE_MODULE_UI_EVENT_INJECTION_RESULT_TARGET_NOT_FOUND equals 1
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIEventInjectionResultCodeTest002', Level.LEVEL1, async (done: Function) => {
      console.info('[UIEventInjectionResultCodeTest002] START');
      expect(nativeFunc.UIEventInjectionResultCodeTest002()).assertEqual(0);
      console.info('[UIEventInjectionResultCodeTest002] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIEVENTINJECTION_RESULTCODE_0300
     * @tc.name   UIEventInjectionResultCodeTest003
     * @tc.desc   Verify OH_ARKUI_NATIVE_MODULE_UI_EVENT_INJECTION_RESULT_COMMAND_NOT_SUPPORTED equals 2
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIEventInjectionResultCodeTest003', Level.LEVEL1, async (done: Function) => {
      console.info('[UIEventInjectionResultCodeTest003] START');
      expect(nativeFunc.UIEventInjectionResultCodeTest003()).assertEqual(0);
      console.info('[UIEventInjectionResultCodeTest003] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIEVENTINJECTION_RESULTCODE_0400
     * @tc.name   UIEventInjectionResultCodeTest004
     * @tc.desc   Verify OH_ARKUI_NATIVE_MODULE_UI_EVENT_INJECTION_RESULT_INTERRUPTED_BY_USER equals 3
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIEventInjectionResultCodeTest004', Level.LEVEL1, async (done: Function) => {
      console.info('[UIEventInjectionResultCodeTest004] START');
      expect(nativeFunc.UIEventInjectionResultCodeTest004()).assertEqual(0);
      console.info('[UIEventInjectionResultCodeTest004] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIEVENTINJECTION_COMPOSITE_0100
     * @tc.name   UIEventInjectCompositeCommandTest001
     * @tc.desc   Inject composite command with valid params, expect request accepted (NO_ERROR or COMMAND_UNFINISHED)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIEventInjectCompositeCommandTest001', Level.LEVEL1, async (done: Function) => {
      console.info('[UIEventInjectCompositeCommandTest001] START');
      expect(nativeFunc.UIEventInjectCompositeCommandTest001()).assertEqual(0);
      console.info('[UIEventInjectCompositeCommandTest001] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIEVENTINJECTION_COMPOSITE_0200
     * @tc.name   UIEventInjectCompositeCommandTest002
     * @tc.desc   Inject with NULL uiContext, expect UI_CONTEXT_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIEventInjectCompositeCommandTest002', Level.LEVEL2, async (done: Function) => {
      console.info('[UIEventInjectCompositeCommandTest002] START');
      expect(nativeFunc.UIEventInjectCompositeCommandTest002()).assertEqual(0);
      console.info('[UIEventInjectCompositeCommandTest002] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIEVENTINJECTION_COMPOSITE_0300
     * @tc.name   UIEventInjectCompositeCommandTest003
     * @tc.desc   Inject with NULL command, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIEventInjectCompositeCommandTest003', Level.LEVEL2, async (done: Function) => {
      console.info('[UIEventInjectCompositeCommandTest003] START');
      expect(nativeFunc.UIEventInjectCompositeCommandTest003()).assertEqual(0);
      console.info('[UIEventInjectCompositeCommandTest003] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIEVENTINJECTION_COMPOSITE_0400
     * @tc.name   UIEventInjectCompositeCommandTest004
     * @tc.desc   Inject with NULL callback, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIEventInjectCompositeCommandTest004', Level.LEVEL2, async (done: Function) => {
      console.info('[UIEventInjectCompositeCommandTest004] START');
      expect(nativeFunc.UIEventInjectCompositeCommandTest004()).assertEqual(0);
      console.info('[UIEventInjectCompositeCommandTest004] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIEVENTINJECTION_COMPOSITE_0500
     * @tc.name   UIEventInjectCompositeCommandTest005
     * @tc.desc   Inject with invalid uniqueId (not a real node), expect NODE_NOT_FOUND
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIEventInjectCompositeCommandTest005', Level.LEVEL2, async (done: Function) => {
      console.info('[UIEventInjectCompositeCommandTest005] START');
      expect(nativeFunc.UIEventInjectCompositeCommandTest005()).assertEqual(0);
      console.info('[UIEventInjectCompositeCommandTest005] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIEVENTINJECTION_COMPOSITE_0600
     * @tc.name   UIEventInjectCompositeCommandTest006
     * @tc.desc   Inject with NULL userData (valid case), expect request accepted
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIEventInjectCompositeCommandTest006', Level.LEVEL1, async (done: Function) => {
      console.info('[UIEventInjectCompositeCommandTest006] START');
      expect(nativeFunc.UIEventInjectCompositeCommandTest006()).assertEqual(0);
      console.info('[UIEventInjectCompositeCommandTest006] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIEVENTINJECTION_COMPOSITE_0700
     * @tc.name   UIEventInjectCompositeCommandTest007
     * @tc.desc   Inject with invalid command JSON, expect PARAM_INVALID or NODE_NOT_FOUND
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIEventInjectCompositeCommandTest007', Level.LEVEL2, async (done: Function) => {
      console.info('[UIEventInjectCompositeCommandTest007] START');
      expect(nativeFunc.UIEventInjectCompositeCommandTest007()).assertEqual(0);
      console.info('[UIEventInjectCompositeCommandTest007] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIEVENTINJECTION_COMPOSITE_0800
     * @tc.name   UIEventInjectCompositeCommandTest008
     * @tc.desc   Inject with all NULL params (uiContext, command, callback), expect UI_CONTEXT_INVALID or PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIEventInjectCompositeCommandTest008', Level.LEVEL2, async (done: Function) => {
      console.info('[UIEventInjectCompositeCommandTest008] START');
      expect(nativeFunc.UIEventInjectCompositeCommandTest008()).assertEqual(0);
      console.info('[UIEventInjectCompositeCommandTest008] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIEVENTINJECTION_COMPOSITE_0900
     * @tc.name   UIEventInjectCompositeCommandTest009
     * @tc.desc   Inject with NULL command and NULL callback (both required params), expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIEventInjectCompositeCommandTest009', Level.LEVEL2, async (done: Function) => {
      console.info('[UIEventInjectCompositeCommandTest009] START');
      expect(nativeFunc.UIEventInjectCompositeCommandTest009()).assertEqual(0);
      console.info('[UIEventInjectCompositeCommandTest009] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIEVENTINJECTION_COMPOSITE_1000
     * @tc.name   UIEventInjectCompositeCommandTest010
     * @tc.desc   Inject with valid params and non-NULL userData, expect request accepted
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIEventInjectCompositeCommandTest010', Level.LEVEL1, async (done: Function) => {
      console.info('[UIEventInjectCompositeCommandTest010] START');
      expect(nativeFunc.UIEventInjectCompositeCommandTest010()).assertEqual(0);
      console.info('[UIEventInjectCompositeCommandTest010] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIEVENTINJECTION_COMPOSITE_1100
     * @tc.name   UIEventInjectCompositeCommandTest011
     * @tc.desc   Inject same command twice consecutively, expect NO_ERROR or COMMAND_UNFINISHED for second
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIEventInjectCompositeCommandTest011', Level.LEVEL2, async (done: Function) => {
      console.info('[UIEventInjectCompositeCommandTest011] START');
      expect(nativeFunc.UIEventInjectCompositeCommandTest011()).assertEqual(0);
      console.info('[UIEventInjectCompositeCommandTest011] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIEVENTINJECTION_CALLBACK_0100
     * @tc.name   UIEventInjectionCallbackTest001
     * @tc.desc   Verify injection callback was invoked with a valid result code
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIEventInjectionCallbackTest001', Level.LEVEL2, async (done: Function) => {
      console.info('[UIEventInjectionCallbackTest001] START');
      expect(nativeFunc.UIEventInjectionCallbackTest001()).assertEqual(0);
      console.info('[UIEventInjectionCallbackTest001] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIEVENTINJECTION_CALLBACK_0200
     * @tc.name   UIEventInjectionCallbackTest002
     * @tc.desc   Verify injection callback result is within valid enum range [0, 3]
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIEventInjectionCallbackTest002', Level.LEVEL2, async (done: Function) => {
      console.info('[UIEventInjectionCallbackTest002] START');
      expect(nativeFunc.UIEventInjectionCallbackTest002()).assertEqual(0);
      console.info('[UIEventInjectionCallbackTest002] END');
      done();
    })
  })
}
