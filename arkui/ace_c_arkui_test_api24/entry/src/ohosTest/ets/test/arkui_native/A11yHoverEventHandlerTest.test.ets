/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import arkuiCapiTest from 'libarkuicapigen.so'


export default function arkuiNativeCapiNativeInterfaceA11yHover() {
  describe('NativeInterfaceA11yHover (native_interface_a11y_hover)', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(50);
      done();
    });

    /**
     * @tc.number SUB_ACE_ARKUI_A11Y_REGISTERHOVEREVENTHANDLER_0100
     * @tc.name   RegisterHoverEventHandlerTest001
     * @tc.desc   Case: RegisterHoverEventHandlerTest001. C API: register hover event handler on a
     *             custom host node. Expect success code on registering callback with user data.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('RegisterHoverEventHandlerTest001', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_513()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_A11Y_REGISTERHOVEREVENTHANDLER_0200
     * @tc.name   RegisterHoverEventHandlerTest002
     * @tc.desc   Case: RegisterHoverEventHandlerTest002. C API: register hover event handler with
     *             null host node. Expect param invalid error code 401.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL2
     * @tc.size    MEDIUMTEST
     */
    it('RegisterHoverEventHandlerTest002', Level.LEVEL2, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_514()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_A11Y_REGISTERHOVEREVENTHANDLER_0300
     * @tc.name   RegisterHoverEventHandlerTest003
     * @tc.desc   Case: RegisterHoverEventHandlerTest003. C API: register hover event handler with
     *             null callback. Expect param error code 100023.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL2
     * @tc.size    MEDIUMTEST
     */
    it('RegisterHoverEventHandlerTest003', Level.LEVEL2, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_515()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_A11Y_REGISTERHOVEREVENTHANDLER_0400
     * @tc.name   RegisterHoverEventHandlerTest004
     * @tc.desc   Case: RegisterHoverEventHandlerTest004. C API: register hover event handler on an
     *             unsupported column node. Expect type not supported error code 106102.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL2
     * @tc.size    MEDIUMTEST
     */
    it('RegisterHoverEventHandlerTest004', Level.LEVEL2, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_516()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_A11Y_REGISTERHOVEREVENTHANDLER_0500
     * @tc.name   RegisterHoverEventHandlerTest005
     * @tc.desc   Case: RegisterHoverEventHandlerTest005. C API: register hover event handler twice
     *             on the same custom host node. The second register overrides the first one and
     *             both return success.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('RegisterHoverEventHandlerTest005', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_517()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_A11Y_REGISTERHOVEREVENTHANDLER_0600
     * @tc.name   RegisterHoverEventHandlerTest006
     * @tc.desc   Case: RegisterHoverEventHandlerTest006. C API: register hover event handler on an
     *             xcomponent host node. Expect success code.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('RegisterHoverEventHandlerTest006', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_518()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_A11Y_REGISTERHOVEREVENTHANDLER_0700
     * @tc.name   RegisterHoverEventHandlerTest007
     * @tc.desc   Case: RegisterHoverEventHandlerTest007. C API: register hover event handler on an
     *             xcomponent texture host node. Expect success code.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('RegisterHoverEventHandlerTest007', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_519()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_A11Y_UNREGISTERHOVEREVENTHANDLER_0100
     * @tc.name   UnregisterHoverEventHandlerTest001
     * @tc.desc   Case: UnregisterHoverEventHandlerTest001. C API: unregister hover event handler
     *             after registering on a custom host node. Expect success code.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('UnregisterHoverEventHandlerTest001', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_520()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_A11Y_UNREGISTERHOVEREVENTHANDLER_0200
     * @tc.name   UnregisterHoverEventHandlerTest002
     * @tc.desc   Case: UnregisterHoverEventHandlerTest002. C API: unregister hover event handler on
     *             a supported host node without previous registration. Expect success code.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('UnregisterHoverEventHandlerTest002', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_521()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_A11Y_UNREGISTERHOVEREVENTHANDLER_0300
     * @tc.name   UnregisterHoverEventHandlerTest003
     * @tc.desc   Case: UnregisterHoverEventHandlerTest003. C API: unregister hover event handler
     *             with null host node. Expect param invalid error code 401.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL2
     * @tc.size    MEDIUMTEST
     */
    it('UnregisterHoverEventHandlerTest003', Level.LEVEL2, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_522()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_A11Y_UNREGISTERHOVEREVENTHANDLER_0400
     * @tc.name   UnregisterHoverEventHandlerTest004
     * @tc.desc   Case: UnregisterHoverEventHandlerTest004. C API: unregister hover event handler on
     *             an unsupported column node. Expect type not supported error code 106102.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL2
     * @tc.size    MEDIUMTEST
     */
    it('UnregisterHoverEventHandlerTest004', Level.LEVEL2, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_523()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_A11Y_UNREGISTERHOVEREVENTHANDLER_0500
     * @tc.name   UnregisterHoverEventHandlerTest005
     * @tc.desc   Case: UnregisterHoverEventHandlerTest005. C API: unregister hover event handler
     *             twice on the same custom host node. Repeat unregister is idempotent and both
     *             return success.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('UnregisterHoverEventHandlerTest005', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_524()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_A11Y_UNREGISTERHOVEREVENTHANDLER_0600
     * @tc.name   UnregisterHoverEventHandlerTest006
     * @tc.desc   Case: UnregisterHoverEventHandlerTest006. C API: register, unregister and register
     *             again the hover event handler on the same custom host node. All steps return
     *             success.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('UnregisterHoverEventHandlerTest006', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_525()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_A11Y_REGISTERHOVEREVENTHANDLER_0800
     * @tc.name   RegisterHoverEventHandlerTest008
     * @tc.desc   Case: RegisterHoverEventHandlerTest008. C API: register hover event handler with
     *             null user data. User data has no non-null constraint, expect success code.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('RegisterHoverEventHandlerTest008', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_526()).assertEqual(0)
      done()
    })

  });
}
