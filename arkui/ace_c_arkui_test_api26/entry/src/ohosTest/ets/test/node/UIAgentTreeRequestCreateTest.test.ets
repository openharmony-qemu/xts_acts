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

export default function UIAgentTreeRequestCreateTest() {

  describe('UIAgentTreeRequestCreateTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTTREEREQUESTCREATE_0100
     * @tc.name   UIAgentTreeRequestCreateTest001
     * @tc.desc   Create full UI tree request, expect NO_ERROR and non-null request
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIAgentTreeRequestCreateTest001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.UIAgentTreeRequestCreateTest001()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTTREEREQUESTCREATE_0200
     * @tc.name   UIAgentTreeRequestCreateTest002
     * @tc.desc   Create visible UI tree request, expect NO_ERROR and non-null request
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIAgentTreeRequestCreateTest002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.UIAgentTreeRequestCreateTest002()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTTREEREQUESTCREATE_0300
     * @tc.name   UIAgentTreeRequestCreateTest003
     * @tc.desc   Create request with null out param, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIAgentTreeRequestCreateTest003', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.UIAgentTreeRequestCreateTest003()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTTREEREQUESTCREATE_0400
     * @tc.name   UIAgentTreeRequestCreateTest004
     * @tc.desc   Create request with out-of-range tree type, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIAgentTreeRequestCreateTest004', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.UIAgentTreeRequestCreateTest004()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTTREEREQUESTCREATE_0500
     * @tc.name   UIAgentTreeRequestCreateTest005
     * @tc.desc   Create full and visible UI tree requests simultaneously, expect NO_ERROR each time
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIAgentTreeRequestCreateTest005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.UIAgentTreeRequestCreateTest005()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTTREEREQUESTCREATE_0600
     * @tc.name   UIAgentTreeRequestCreateTest006
     * @tc.desc   Verify UI agent tree type enum values, expect FULL 0 and VISIBLE 1
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIAgentTreeRequestCreateTest006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.UIAgentTreeRequestCreateTest006()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTTREEREQUESTCREATE_0700
     * @tc.name   UIAgentTreeRequestCreateTest007
     * @tc.desc   Destroy null request then create and destroy a valid request, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIAgentTreeRequestCreateTest007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.UIAgentTreeRequestCreateTest007()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTTREEREQUESTCREATE_0800
     * @tc.name   UIAgentTreeRequestCreateTest008
     * @tc.desc   Verify error code values, expect RESULT_TOO_LARGE 106411, RESOURCE_EXHAUSTED 106412,
     *            COLLECTION_PARTIAL_FAILED 106414
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIAgentTreeRequestCreateTest008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.UIAgentTreeRequestCreateTest008()).assertEqual(0)
      done()
    })
  })
}
