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
const NAPI_INVALID_ARG: number = 1;

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

async function waitRiskCalled(id: number): Promise<number> {
  for (let i = 0; i < 60; i++) {
    if (napicallbackriskndktest.isRiskCalled(id) === 1) {
      return 1;
    }
    await sleep(100);
  }
  return napicallbackriskndktest.isRiskCalled(id);
}

async function collectAsyncRisk(id: number, action: () => number): Promise<number[]> {
  napicallbackriskndktest.resetRiskStatus(id);
  let resNum: number = action();
  let called: number = await waitRiskCalled(id);
  let status: number = napicallbackriskndktest.getRiskStatus(id);
  return [resNum, called, status];
}

export default function napiCallbackRiskAsyncTest() {
  describe('NapiCallbackRiskAsyncTest', () => {

    /**
     * @tc.name   testAsyncWorkCompleteCallbackDeleteWorkAndReference
     * @tc.number SUB_THIRDPARTY_NAPI_CALLBACK_RISK_0025
     * @tc.desc   Test deleting async work and reference in async work complete callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAsyncWorkCompleteCallbackDeleteWorkAndReference',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Risk-025
      let result: number[] = await collectAsyncRisk(25, (): number => napicallbackriskndktest.risk025());
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(NAPI_OK);
    });

    /**
     * @tc.name   testAsyncWorkCompleteCallbackCreateObject
     * @tc.number SUB_THIRDPARTY_NAPI_CALLBACK_RISK_0026
     * @tc.desc   Test creating object in async work complete callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAsyncWorkCompleteCallbackCreateObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Risk-026
      let result: number[] = await collectAsyncRisk(26, (): number => napicallbackriskndktest.risk026());
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(NAPI_OK);
    });

    // Disabled Risk-026 pending destroy runtime variant: pending async work during runtime teardown may crash.

    /**
     * @tc.name   testThreadsafeFunctionCallJsCallbackCallFunction
     * @tc.number SUB_THIRDPARTY_NAPI_CALLBACK_RISK_0027
     * @tc.desc   Test calling JS function in threadsafe function call js callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testThreadsafeFunctionCallJsCallbackCallFunction',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Risk-027
      let result: number[] = await collectAsyncRisk(27, (): number => napicallbackriskndktest.risk027());
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(NAPI_OK);
    });

    /**
     * @tc.name   testThreadsafeFunctionAbortCallJsCallbackInvalidArg
     * @tc.number SUB_THIRDPARTY_NAPI_CALLBACK_RISK_0028
     * @tc.desc   Test NAPI call in aborted threadsafe function call js callback returns invalid arg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testThreadsafeFunctionAbortCallJsCallbackInvalidArg',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Risk-028
      let result: number[] = await collectAsyncRisk(28, (): number => napicallbackriskndktest.risk028());
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(NAPI_INVALID_ARG);
    });

    /**
     * @tc.name   testThreadsafeFunctionFinalizeCallbackCreateThreadsafeFunction
     * @tc.number SUB_THIRDPARTY_NAPI_CALLBACK_RISK_0029
     * @tc.desc   Test creating threadsafe function in threadsafe function finalize callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testThreadsafeFunctionFinalizeCallbackCreateThreadsafeFunction',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Risk-029
      let result: number[] = await collectAsyncRisk(29, (): number => napicallbackriskndktest.risk029());
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(NAPI_OK);
    });

  })
}
