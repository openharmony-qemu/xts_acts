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
  let called: number = napicallbackriskndktest.isRiskCalled(id);
  let status: number = napicallbackriskndktest.getRiskStatus(id);
  return [resNum, called, status];
}

export default function napiCallbackRiskLifecycleTest() {
  describe('NapiCallbackRiskLifecycleTest', () => {
    /**
     * @tc.name   testInstanceDataFinalizerDeleteReference
     * @tc.number SUB_THIRDPARTY_NAPI_CALLBACK_RISK_0001
     * @tc.desc   Test deleting a reference in instance data finalizer during runtime teardown.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testInstanceDataFinalizerDeleteReference', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // Risk-001
      let result: number[] = collectRisk(1, (): number => napicallbackriskndktest.risk001());
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(0);
    });

    // Disabled Risk-002: instance data finalizer creates object during teardown and may crash.

    /**
     * @tc.name   testInstanceDataReplacementFinalizerReferenceOperations
     * @tc.number SUB_THIRDPARTY_NAPI_CALLBACK_RISK_0003
     * @tc.desc   Test reference operations in old instance data finalizer during data replacement.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testInstanceDataReplacementFinalizerReferenceOperations',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // Risk-003
      let result: number[] = collectRisk(3, (): number => napicallbackriskndktest.risk003());
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.name   testCurrentEnvInstanceDataReplacementControl
     * @tc.number SUB_THIRDPARTY_NAPI_CALLBACK_RISK_0003_CONTROL_001
     * @tc.desc   Test current env instance data replacement control path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCurrentEnvInstanceDataReplacementControl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // Risk-003
      let result: number[] = collectRisk(3, (): number => napicallbackriskndktest.risk003CurrentEnvControl());
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.name   testNativeThreadRuntimeReferenceControl
     * @tc.number SUB_THIRDPARTY_NAPI_CALLBACK_RISK_0003_CONTROL_002
     * @tc.desc   Test creating and deleting reference on runtime created by native thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeThreadRuntimeReferenceControl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // Risk-003
      let result: number[] = collectRisk(3, (): number => napicallbackriskndktest.risk003RuntimeRefControl());
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.name   testEnvCleanupHookDeleteReference
     * @tc.number SUB_THIRDPARTY_NAPI_CALLBACK_RISK_0005
     * @tc.desc   Test deleting a reference in env cleanup hook during runtime teardown.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testEnvCleanupHookDeleteReference', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // Risk-005
      let result: number[] = collectRisk(5, (): number => napicallbackriskndktest.risk005());
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(0);
    });

  })
}
