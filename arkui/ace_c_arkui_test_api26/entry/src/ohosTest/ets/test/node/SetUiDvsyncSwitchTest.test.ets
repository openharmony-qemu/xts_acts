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

export default function SetUiDvsyncSwitchTest() {

  describe('SetUiDvsyncSwitchTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number SUB_ACE_ARKUI_SETUIDVSYNCSWITCH_0100
     * @tc.name   SetUiDvsyncSwitchTest001
     * @tc.desc   Enable Dvsync with valid context, expect SUCCESS
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('SetUiDvsyncSwitchTest001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.SetUiDvsyncSwitchTest001()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_SETUIDVSYNCSWITCH_0200
     * @tc.name   SetUiDvsyncSwitchTest002
     * @tc.desc   Disable Dvsync with valid context, expect SUCCESS
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('SetUiDvsyncSwitchTest002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.SetUiDvsyncSwitchTest002()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_SETUIDVSYNCSWITCH_0300
     * @tc.name   SetUiDvsyncSwitchTest003
     * @tc.desc   Toggle Dvsync enable/disable repeatedly, expect SUCCESS
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('SetUiDvsyncSwitchTest003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.SetUiDvsyncSwitchTest003()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_SETUIDVSYNCSWITCH_0400
     * @tc.name   SetUiDvsyncSwitchTest004
     * @tc.desc   Call with null context, expect INVALID_PARAM
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SetUiDvsyncSwitchTest004', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.SetUiDvsyncSwitchTest004()).assertEqual(0)
      done()
    })
  })
}