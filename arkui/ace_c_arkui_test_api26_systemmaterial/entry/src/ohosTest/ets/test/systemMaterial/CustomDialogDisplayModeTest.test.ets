/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import nativeFunc from 'libnativefunc.so';

function runCase(name: string, done: Function): void {
  expect(nativeFunc[name]()).assertEqual(0);
  done();
}

export default function customDialogDisplayModeTest() {
  describe('CustomDialogDisplayModeTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_3100
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_3100
     * @tc.desc   Verify dialog display mode enum constant values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_3100', Level.LEVEL1, async (done: Function) => {
      runCase('testDialogDisplayModeEnumValues001', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_3200
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_3200
     * @tc.desc   Set screen based display mode in subwindow dialog options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_3200', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogSetDisplayModeInSubWindow001', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_3300
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_3300
     * @tc.desc   Set window based display mode in subwindow dialog options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_3300', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogSetDisplayModeInSubWindow002', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_3400
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_3400
     * @tc.desc   Set display mode with null options returns invalid param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_3400', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogSetDisplayModeInSubWindow003', done);
    });

  });
}
