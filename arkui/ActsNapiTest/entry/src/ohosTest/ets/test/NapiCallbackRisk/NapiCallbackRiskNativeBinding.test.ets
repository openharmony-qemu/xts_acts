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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import napicallbackriskndktest from 'libnapicallbackriskndktest.so';

function collectRisk(id: number, action: () => number): number[] {
  napicallbackriskndktest.resetRiskStatus(id);
  let resNum: number = action();
  let status: number = napicallbackriskndktest.getRiskStatus(id);
  return [resNum, status];
}

export default function napiCallbackRiskNativeBindingTest() {
  describe('NapiCallbackRiskNativeBindingTest', () => {
    /**
     * @tc.name   testNativeBindingDetachCallbackCreateObject
     * @tc.number SUB_THIRDPARTY_NAPI_CALLBACK_RISK_0044
     * @tc.desc   Test native binding detach callback that creates object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeBindingDetachCallbackCreateObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // Risk-044
      let result: number[] = collectRisk(44, (): number => napicallbackriskndktest.risk044());
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(0);
    });

    /**
     * @tc.name   testNativeBindingAttachCallbackReturnCurrentEnvValue
     * @tc.number SUB_THIRDPARTY_NAPI_CALLBACK_RISK_0045
     * @tc.desc   Test native binding attach callback after probing native thread runtime value creation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeBindingAttachCallbackReturnCurrentEnvValue',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // Risk-045
      let result: number[] = collectRisk(45, (): number => napicallbackriskndktest.risk045());
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(0);
    });
  })
}
