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

export default function RuntimeCheckModeTest() {

  describe('RuntimeCheckModeTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number SUB_ACE_ARKUI_RUNTIMECHECKMODE_0100
     * @tc.name   RuntimeCheckModeTest001
     * @tc.desc   Set CHECK_TYPE_UI_THREAD to CHECK_MODE_DISABLED, expect SUCCESS
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('RuntimeCheckModeTest001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RuntimeCheckModeTest001()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_RUNTIMECHECKMODE_0200
     * @tc.name   RuntimeCheckModeTest002
     * @tc.desc   Set CHECK_TYPE_UI_THREAD to CHECK_MODE_LOG, expect SUCCESS
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('RuntimeCheckModeTest002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RuntimeCheckModeTest002()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_RUNTIMECHECKMODE_0300
     * @tc.name   RuntimeCheckModeTest003
     * @tc.desc   Set CHECK_TYPE_UI_THREAD to CHECK_MODE_CRASH, expect SUCCESS
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('RuntimeCheckModeTest003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RuntimeCheckModeTest003()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_RUNTIMECHECKMODE_0400
     * @tc.name   RuntimeCheckModeTest004
     * @tc.desc   Set CHECK_TYPE_NODE_DISPOSED to CHECK_MODE_DISABLED, expect SUCCESS
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('RuntimeCheckModeTest004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RuntimeCheckModeTest004()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_RUNTIMECHECKMODE_0500
     * @tc.name   RuntimeCheckModeTest005
     * @tc.desc   Set CHECK_TYPE_NODE_DISPOSED to CHECK_MODE_LOG, expect SUCCESS
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('RuntimeCheckModeTest005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RuntimeCheckModeTest005()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_RUNTIMECHECKMODE_0600
     * @tc.name   RuntimeCheckModeTest006
     * @tc.desc   Set CHECK_TYPE_NODE_DISPOSED to CHECK_MODE_CRASH, expect SUCCESS
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('RuntimeCheckModeTest006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RuntimeCheckModeTest006()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_RUNTIMECHECKMODE_0700
     * @tc.name   RuntimeCheckModeTest007
     * @tc.desc   Set with invalid checkType, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RuntimeCheckModeTest007', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.RuntimeCheckModeTest007()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_RUNTIMECHECKMODE_0800
     * @tc.name   RuntimeCheckModeTest008
     * @tc.desc   Set with invalid mode, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RuntimeCheckModeTest008', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.RuntimeCheckModeTest008()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_RUNTIMECHECKMODE_0900
     * @tc.name   RuntimeCheckModeTest009
     * @tc.desc   Verify OH_ARKUI_NATIVEMODULE_CHECK_MODE_DISABLED equals 0
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('RuntimeCheckModeTest009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RuntimeCheckModeTest009()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_RUNTIMECHECKMODE_1000
     * @tc.name   RuntimeCheckModeTest010
     * @tc.desc   Verify OH_ARKUI_NATIVEMODULE_CHECK_MODE_LOG equals 1
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('RuntimeCheckModeTest010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RuntimeCheckModeTest010()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_RUNTIMECHECKMODE_1100
     * @tc.name   RuntimeCheckModeTest011
     * @tc.desc   Verify OH_ARKUI_NATIVEMODULE_CHECK_MODE_CRASH equals 2
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('RuntimeCheckModeTest011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RuntimeCheckModeTest011()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_RUNTIMECHECKMODE_1200
     * @tc.name   RuntimeCheckModeTest012
     * @tc.desc   Verify OH_ARKUI_NATIVEMODULE_CHECK_TYPE_UI_THREAD equals 0
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('RuntimeCheckModeTest012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RuntimeCheckModeTest012()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_RUNTIMECHECKMODE_1300
     * @tc.name   RuntimeCheckModeTest013
     * @tc.desc   Verify OH_ARKUI_NATIVEMODULE_CHECK_TYPE_NODE_DISPOSED equals 1
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('RuntimeCheckModeTest013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RuntimeCheckModeTest013()).assertEqual(0)
      done()
    })
  })
}
