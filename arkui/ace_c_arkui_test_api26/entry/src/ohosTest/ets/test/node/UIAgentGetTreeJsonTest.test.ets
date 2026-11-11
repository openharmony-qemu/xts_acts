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

export default function UIAgentGetTreeJsonTest() {

  describe('UIAgentGetTreeJsonTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTGETTREEJSONASYNC_0100
     * @tc.name   UIAgentGetTreeJsonAsyncTest001
     * @tc.desc   Collect full UI tree asynchronously with valid params, expect request accepted (NO_ERROR)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIAgentGetTreeJsonAsyncTest001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.UIAgentGetTreeJsonAsyncTest001()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTGETTREEJSONASYNC_0200
     * @tc.name   UIAgentGetTreeJsonAsyncTest002
     * @tc.desc   Collect visible UI tree asynchronously with indented format, expect request accepted (NO_ERROR)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIAgentGetTreeJsonAsyncTest002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.UIAgentGetTreeJsonAsyncTest002()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTGETTREEJSONASYNC_0300
     * @tc.name   UIAgentGetTreeJsonAsyncTest003
     * @tc.desc   Collect with null context, expect UI_CONTEXT_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIAgentGetTreeJsonAsyncTest003', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.UIAgentGetTreeJsonAsyncTest003()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTGETTREEJSONASYNC_0400
     * @tc.name   UIAgentGetTreeJsonAsyncTest004
     * @tc.desc   Collect with null request, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIAgentGetTreeJsonAsyncTest004', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.UIAgentGetTreeJsonAsyncTest004()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTGETTREEJSONASYNC_0500
     * @tc.name   UIAgentGetTreeJsonAsyncTest005
     * @tc.desc   Collect with null callback, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIAgentGetTreeJsonAsyncTest005', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.UIAgentGetTreeJsonAsyncTest005()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTGETTREEJSONASYNC_0600
     * @tc.name   UIAgentGetTreeJsonAsyncTest006
     * @tc.desc   Collect with null requestId output param, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIAgentGetTreeJsonAsyncTest006', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.UIAgentGetTreeJsonAsyncTest006()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTGETTREEJSONASYNC_0700
     * @tc.name   UIAgentGetTreeJsonAsyncTest007
     * @tc.desc   Collect with invalid output format, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIAgentGetTreeJsonAsyncTest007', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.UIAgentGetTreeJsonAsyncTest007()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTGETTREEJSONASYNC_0800
     * @tc.name   UIAgentGetTreeJsonAsyncTest008
     * @tc.desc   Submit a second request before the previous one completes, expect COMMAND_UNFINISHED
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIAgentGetTreeJsonAsyncTest008', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.UIAgentGetTreeJsonAsyncTest008()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTGETTREEJSONASYNC_0900
     * @tc.name   UIAgentGetTreeJsonAsyncCallbackTest
     * @tc.desc   Verify the async callback is invoked once with NO_ERROR and a non-null JSON result
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIAgentGetTreeJsonAsyncCallbackTest', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.UIAgentGetTreeJsonAsyncTest001()).assertEqual(0)
      await Utils.sleep(2000)
      expect(nativeFunc.UIAgentGetTreeJsonAsyncCallbackResult()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTGETTREEJSON_0100
     * @tc.name   UIAgentGetTreeJsonTest001
     * @tc.desc   Collect full UI tree synchronously with valid params, expect NO_ERROR and non-null json
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIAgentGetTreeJsonTest001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.UIAgentGetTreeJsonTest001()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTGETTREEJSON_0200
     * @tc.name   UIAgentGetTreeJsonTest002
     * @tc.desc   Collect visible UI tree synchronously with indented format, expect NO_ERROR and non-null json
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIAgentGetTreeJsonTest002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.UIAgentGetTreeJsonTest002()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTGETTREEJSON_0300
     * @tc.name   UIAgentGetTreeJsonTest003
     * @tc.desc   Collect with null context, expect UI_CONTEXT_INVALID and null json
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIAgentGetTreeJsonTest003', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.UIAgentGetTreeJsonTest003()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTGETTREEJSON_0400
     * @tc.name   UIAgentGetTreeJsonTest004
     * @tc.desc   Collect with null request, expect PARAM_INVALID and null json
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIAgentGetTreeJsonTest004', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.UIAgentGetTreeJsonTest004()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTGETTREEJSON_0500
     * @tc.name   UIAgentGetTreeJsonTest005
     * @tc.desc   Collect with null json output param, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIAgentGetTreeJsonTest005', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.UIAgentGetTreeJsonTest005()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTGETTREEJSON_0600
     * @tc.name   UIAgentGetTreeJsonTest006
     * @tc.desc   Collect with invalid output format, expect PARAM_INVALID and null json
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIAgentGetTreeJsonTest006', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.UIAgentGetTreeJsonTest006()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTGETTREEJSON_0700
     * @tc.name   UIAgentGetTreeJsonTest007
     * @tc.desc   Collect synchronously repeatedly, expect NO_ERROR and non-null json each time
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIAgentGetTreeJsonTest007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.UIAgentGetTreeJsonTest007()).assertEqual(0)
      done()
    })
  })
}
