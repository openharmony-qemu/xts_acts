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

const NAPI_OK: number = 0;
const NAPI_PENDING_EXCEPTION: number = 10;

function collectRisk(id: number, action: () => number): number[] {
  napicallbackriskndktest.resetRiskStatus(id);
  let resNum: number = action();
  let called: number = napicallbackriskndktest.isRiskCalled(id);
  let status: number = napicallbackriskndktest.getRiskStatus(id);
  return [resNum, called, status];
}

export default function napiCallbackRiskJsModuleTest() {
  describe('NapiCallbackRiskJsModuleTest', () => {
    /**
     * @tc.name   testCallbackCreateAndDestroyRuntimeOnNativeThread
     * @tc.number SUB_THIRDPARTY_NAPI_CALLBACK_RISK_0033
     * @tc.desc   Test creating and destroying Ark runtime on native thread triggered by napi callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCallbackCreateAndDestroyRuntimeOnNativeThread',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // Risk-033
      let result: number[] = collectRisk(33, (): number => napicallbackriskndktest.risk033());
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(NAPI_OK);
    });

    /**
     * @tc.name   testGetterCallbackDeleteReference
     * @tc.number SUB_THIRDPARTY_NAPI_CALLBACK_RISK_0035
     * @tc.desc   Test deleting reference in property getter callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetterCallbackDeleteReference', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // Risk-035
      let result: number[] = collectRisk(35, (): number => napicallbackriskndktest.risk035());
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(NAPI_OK);
    });

    /**
     * @tc.name   testSetterCallbackThrowThenCreatePromise
     * @tc.number SUB_THIRDPARTY_NAPI_CALLBACK_RISK_0036
     * @tc.desc   Test creating promise after throwing error in property setter callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetterCallbackThrowThenCreatePromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // Risk-036
      let result: number[] = collectRisk(36, (): number => napicallbackriskndktest.risk036());
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(NAPI_PENDING_EXCEPTION);
    });

    /**
     * @tc.name   testConstructorCallbackWrapAndRemoveWrap
     * @tc.number SUB_THIRDPARTY_NAPI_CALLBACK_RISK_0037
     * @tc.desc   Test wrap and remove wrap operations in constructor callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConstructorCallbackWrapAndRemoveWrap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // Risk-037
      let result: number[] = collectRisk(37, (): number => napicallbackriskndktest.risk037());
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(NAPI_OK);
    });

    /**
     * @tc.name   testSendableConstructorCallbackMixedNormalNapi
     * @tc.number SUB_THIRDPARTY_NAPI_CALLBACK_RISK_0038
     * @tc.desc   Test creating normal object and reference in sendable constructor callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSendableConstructorCallbackMixedNormalNapi',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // Risk-038
      let result: number[] = collectRisk(38, (): number => napicallbackriskndktest.risk038());
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(NAPI_OK);
    });

  })
}
