'use static';
/**
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "@ohos/hypium-static/src/main/indexStatic";
import baseProfile from '@ohos.bluetooth.baseProfile';
import a2dp from '@ohos.bluetooth.a2dp';
import pan from '@ohos.bluetooth.pan';
import hilog from '@ohos.hilog';

const PERMISSION_DENIED_CODE = 201
const PARAM_ERROR_CODE = 401
const OPERATION_FAILED_CODE = 2900099
const TAG: string = 'BtProfileTestTag';
const Domain: int = 0x0000;

export default function btProfileNopUiJsunit(): void {
  describe('btProfileNopUiJsunit', () => {

    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name SUB_COMMUNICATION_BLUETOOTH_PAN_ISTETHERINGON_NOP_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_PANISTETHERINGONNOP_0100
     * @tc.desc 测试 PanProfile 的 isTetheringOn 方法 - 缺少蓝牙访问权限
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('SUB_COMMUNICATION_BLUETOOTH_PAN_ISTETHERINGON_NOP_static_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let panProfile: pan.PanProfile = pan.createPanProfile();

        try {
          panProfile.isTetheringOn();
          expect().assertFail();
        } catch (err) {
          hilog.info(Domain, TAG, "[bt_arkts] isTetheringOn error: " + JSON.stringify(err));
          if (err.code === 801) {
            hilog.info(Domain, TAG, "设备 is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(201);
          }
        }
        done();
      });

  })
}