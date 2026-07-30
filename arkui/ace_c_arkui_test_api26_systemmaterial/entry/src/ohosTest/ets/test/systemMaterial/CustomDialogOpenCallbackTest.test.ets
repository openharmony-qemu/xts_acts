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

export default function customDialogOpenCallbackTest() {
  describe('CustomDialogOpenCallbackTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_3500
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_3500
     * @tc.desc   Verify dialog open callback error enum named constants
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_3500', Level.LEVEL1, async (done: Function) => {
      runCase('testDialogOpenCallbackErrorEnumValues001', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_3600
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_3600
     * @tc.desc   OpenDialogWithCallback null options invokes callback with INVALID_PARAM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_3600', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogOpenDialogWithCallbackNullOptions001', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_3700
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_3700
     * @tc.desc   OpenDialogWithCallback passes userData pointer through to callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_3700', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogOpenDialogWithCallbackUserData001', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_3800
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_3800
     * @tc.desc   OpenDialogWithCallback with valid options reports documented error or success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_3800', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogOpenDialogWithCallbackValidOptions001', done);
    });

  });
}
