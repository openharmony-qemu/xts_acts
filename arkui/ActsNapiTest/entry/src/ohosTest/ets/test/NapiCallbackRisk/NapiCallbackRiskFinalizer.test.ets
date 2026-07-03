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

function forceFullGC(): void {
  globalThis.ArkTools.forceFullGC();
}

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

async function waitFinalizerCalled(id: number): Promise<number> {
  for (let i = 0; i < 8; i++) {
    forceFullGC();
    await sleep(50);
    if (napicallbackriskndktest.isRiskCalled(id) === 1) {
      return 1;
    }
  }
  return napicallbackriskndktest.isRiskCalled(id);
}

async function collectFinalizerRisk(id: number, action: () => number): Promise<number[]> {
  napicallbackriskndktest.resetRiskStatus(id);
  let resNum: number = action();
  let called: number = await waitFinalizerCalled(id);
  let status: number = napicallbackriskndktest.getRiskStatus(id);
  return [resNum, called, status];
}

function collectRemoveWrapSpecRisk(id: number, action: () => number): number[] {
  napicallbackriskndktest.resetRiskStatus(id);
  let resNum: number = action();
  let called: number = napicallbackriskndktest.isRiskCalled(id);
  let status: number = napicallbackriskndktest.getRiskStatus(id);
  return [resNum, called, status];
}

async function collectRemoveWrapSendableSpecRisk(id: number, action: () => number): Promise<number[]> {
  napicallbackriskndktest.resetRiskStatus(id);
  let resNum: number = action();
  forceFullGC();
  await sleep(50);
  let called: number = napicallbackriskndktest.isRiskCalled(id);
  let status: number = napicallbackriskndktest.getRiskStatus(id);
  return [resNum, called, status];
}

async function collectSendableGcProbeRisk(id: number, action: () => number): Promise<number[]> {
  napicallbackriskndktest.resetRiskStatus(id);
  let resNum: number = action();
  forceFullGC();
  await sleep(50);
  let called: number = napicallbackriskndktest.isRiskCalled(id);
  let status: number = napicallbackriskndktest.getRiskStatus(id);
  return [resNum, called, status];
}

async function collectSendableNoGcWaitProbeRisk(id: number, action: () => number): Promise<number[]> {
  napicallbackriskndktest.resetRiskStatus(id);
  let resNum: number = action();
  await sleep(300);
  let called: number = napicallbackriskndktest.isRiskCalled(id);
  let status: number = napicallbackriskndktest.getRiskStatus(id);
  return [resNum, called, status];
}

export default function napiCallbackRiskFinalizerTest() {
  describe('NapiCallbackRiskFinalizerTest', () => {
    /**
     * @tc.name   testWrapFinalizerDeleteOtherReference
     * @tc.number SUB_THIRDPARTY_NAPI_CALLBACK_RISK_0009
     * @tc.desc   Test deleting another strong reference in napi wrap finalizer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrapFinalizerDeleteOtherReference', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Risk-009
      let result: number[] = await collectFinalizerRisk(9, (): number => napicallbackriskndktest.risk009());
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(NAPI_OK);
    });

    // Disabled Risk-010: wrap finalizer deletes the same dangling reference and may crash.

    /**
     * @tc.name   testWrapEnhanceSyncFinalizerCreateObject
     * @tc.number SUB_THIRDPARTY_NAPI_CALLBACK_RISK_0011
     * @tc.desc   Test creating object in synchronous napi wrap enhance finalizer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrapEnhanceSyncFinalizerCreateObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Risk-011
      let result: number[] = await collectFinalizerRisk(11, (): number => napicallbackriskndktest.risk011());
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(NAPI_OK);
    });

    /**
     * @tc.name   testWrapEnhanceAsyncFinalizerCreateObjectInvalidArg
     * @tc.number SUB_THIRDPARTY_NAPI_CALLBACK_RISK_0012
     * @tc.desc   Test creating object in asynchronous wrap enhance finalizer returns invalid arg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrapEnhanceAsyncFinalizerCreateObjectInvalidArg',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Risk-012
      let result: number[] = await collectFinalizerRisk(12, (): number => napicallbackriskndktest.risk012());
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(NAPI_INVALID_ARG);
    });

    /**
     * @tc.name   testExternalFinalizerGetValue
     * @tc.number SUB_THIRDPARTY_NAPI_CALLBACK_RISK_0015
     * @tc.desc   Test getting external value in external finalizer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testExternalFinalizerGetValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Risk-015
      let result: number[] = await collectFinalizerRisk(15, (): number => napicallbackriskndktest.risk015());
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(NAPI_OK);
    });

    /**
     * @tc.name   testExternalArrayBufferFinalizerGetInfo
     * @tc.number SUB_THIRDPARTY_NAPI_CALLBACK_RISK_0018
     * @tc.desc   Test getting array buffer info in external array buffer finalizer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testExternalArrayBufferFinalizerGetInfo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Risk-018
      let result: number[] = await collectFinalizerRisk(18, (): number => napicallbackriskndktest.risk018());
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(NAPI_OK);
    });

    /**
     * @tc.name   testExternalBufferFinalizerGetInfo
     * @tc.number SUB_THIRDPARTY_NAPI_CALLBACK_RISK_0019
     * @tc.desc   Test getting buffer info in external buffer finalizer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testExternalBufferFinalizerGetInfo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Risk-019
      let result: number[] = await collectFinalizerRisk(19, (): number => napicallbackriskndktest.risk019());
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(NAPI_OK);
    });

    /**
     * @tc.name   testSendableFinalizerUnwrapInvalidArg
     * @tc.number SUB_THIRDPARTY_NAPI_CALLBACK_RISK_0022
     * @tc.desc   Test unwrapping sendable object in sendable finalizer returns invalid arg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSendableFinalizerUnwrapInvalidArg', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Risk-022
      let result: number[] = await collectFinalizerRisk(22, (): number => napicallbackriskndktest.risk022());
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(NAPI_INVALID_ARG);
    });

    /**
     * @tc.name   testSendableFinalizerCreateArrayInvalidArg
     * @tc.number SUB_THIRDPARTY_NAPI_CALLBACK_RISK_0023
     * @tc.desc   Test creating sendable array in sendable finalizer returns invalid arg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSendableFinalizerCreateArrayInvalidArg', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Risk-023
      let result: number[] = await collectFinalizerRisk(23, (): number => napicallbackriskndktest.risk023());
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(NAPI_INVALID_ARG);
    });

    /**
     * @tc.name   testRemoveWrapCallsFinalizeBeforeRemovingWrap
     * @tc.number SUB_THIRDPARTY_NAPI_CALLBACK_RISK_REMOVE_WRAP_SPEC_0100
     * @tc.desc   Test OpenHarmony napi remove wrap calls finalize before removing wrapped data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveWrapCallsFinalizeBeforeRemovingWrap',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // Risk-remove-wrap-spec
      let result: number[] = collectRemoveWrapSpecRisk(
        46,
        (): number => napicallbackriskndktest.removeWrapCallsFinalizer()
      );
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(NAPI_OK);
    });

  })
}
