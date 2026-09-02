/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

export default function TestSetForceDarkConfig(){

  describe('TestSetForceDarkConfig', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   TestSetForceDarkConfig_001
     * @tc.number SUB_ARKUI_CAPI_TestSetForceDarkConfig_0100
     * @tc.desc   Test Sets the inverse color algorithm for components and instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestSetForceDarkConfig_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestSetForceDarkConfig()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestSetForceDarkConfig_003
     * @tc.number SUB_ARKUI_CAPI_TestSetForceDarkConfig_0300
     * @tc.desc   Test Sets the inverse color algorithm with invalid nodeType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestSetForceDarkConfig_003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestSetForceDarkConfigNodeTypeInvalid()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestSetForceDarkConfig_005
     * @tc.number SUB_ARKUI_CAPI_TestSetForceDarkConfig_0500
     * @tc.desc   Test Sets the inverse color algorithm with ARKUI_NODE_CUSTOM.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestSetForceDarkConfig_005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestSetForceDarkConfigNodeTypeCustom()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestSetForceDarkConfig_016
     * @tc.number SUB_ARKUI_CAPI_TestSetForceDarkConfig_1600
     * @tc.desc   Test Sets the inverse color algorithm with ARKUI_NODE_DATE_PICKER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestSetForceDarkConfig_016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestSetForceDarkConfigNodeTypeDatePicker()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestSetForceDarkConfig_027
     * @tc.number SUB_ARKUI_CAPI_TestSetForceDarkConfig_2700
     * @tc.desc   Test Sets the inverse color algorithm with ARKUI_NODE_STACK.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestSetForceDarkConfig_027', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestSetForceDarkConfigNodeTypeStack()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestSetForceDarkConfig_039
     * @tc.number SUB_ARKUI_CAPI_TestSetForceDarkConfig_3900
     * @tc.desc   Test Sets the inverse color algorithm with ARKUI_NODE_GRID.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestSetForceDarkConfig_039', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestSetForceDarkConfigNodeTypeGrid()).assertEqual(0)
      done();
    })
  })
}