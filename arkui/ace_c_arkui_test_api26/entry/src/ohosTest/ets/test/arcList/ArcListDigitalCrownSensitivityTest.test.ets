/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

export default function arcListDigitalCrownSensitivityTest() {

  describe('ArcListDigitalCrownSensitivityTest', () => {

    /**
     * @tc.name   testArcListDigitalCrownSensitivitySet001
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_DIGITAL_CROWN_SENSITIVITY_SET_0001
     * @tc.desc   testing digital crown sensitivity set for arcList with value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListDigitalCrownSensitivitySet001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListDigitalCrownSensitivitySet001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListDigitalCrownSensitivitySet002
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_DIGITAL_CROWN_SENSITIVITY_SET_0002
     * @tc.desc   testing digital crown sensitivity set for arcList with value 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListDigitalCrownSensitivitySet002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListDigitalCrownSensitivitySet002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListDigitalCrownSensitivitySet003
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_DIGITAL_CROWN_SENSITIVITY_SET_0003
     * @tc.desc   testing digital crown sensitivity set for arcList with invalid value -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArcListDigitalCrownSensitivitySet003', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.testArcListDigitalCrownSensitivitySet003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListDigitalCrownSensitivityGet001
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_DIGITAL_CROWN_SENSITIVITY_GET_0001
     * @tc.desc   testing digital crown sensitivity get for arcList with value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListDigitalCrownSensitivityGet001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListDigitalCrownSensitivityGet001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListDigitalCrownSensitivityGet002
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_DIGITAL_CROWN_SENSITIVITY_GET_0002
     * @tc.desc   testing digital crown sensitivity get for arcList default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListDigitalCrownSensitivityGet002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListDigitalCrownSensitivityGet002()).assertEqual(0)
      done()
    })
  })
}