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

function registerImmersiveEnumAndQueryCases(): void {
  describe('ImmersiveMaterialEnumAndQuery', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testImmersiveStyleEnumValues001
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_0100
     * @tc.desc   Verify immersive style enum constant values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImmersiveStyleEnumValues001', Level.LEVEL1, async (done: Function) => {
      runCase('testImmersiveStyleEnumValues001', done);
    });

    /**
     * @tc.name   testMaterialLevelEnumValues001
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_0200
     * @tc.desc   Verify material level enum constant values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMaterialLevelEnumValues001', Level.LEVEL1, async (done: Function) => {
      runCase('testMaterialLevelEnumValues001', done);
    });

    /**
     * @tc.name   testGetSystemMaterialSupported001
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_0300
     * @tc.desc   Call GetSystemMaterialSupported without error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetSystemMaterialSupported001', Level.LEVEL1, async (done: Function) => {
      runCase('testGetSystemMaterialSupported001', done);
    });

    /**
     * @tc.name   testGetGlobalMaterialLevel001
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_0400
     * @tc.desc   GetGlobalMaterialLevel returns value in valid range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGlobalMaterialLevel001', Level.LEVEL1, async (done: Function) => {
      runCase('testGetGlobalMaterialLevel001', done);
    });
  });
}

function registerImmersiveLifecycleCases(): void {
  describe('ImmersiveMaterialLifecycle', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testImmersiveMaterialCreateDestroy001
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_0500
     * @tc.desc   Create and destroy immersive material for all styles
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImmersiveMaterialCreateDestroy001', Level.LEVEL1, async (done: Function) => {
      runCase('testImmersiveMaterialCreateDestroy001', done);
    });

    /**
     * @tc.name   testImmersiveMaterialSetGetStyle001
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_0600
     * @tc.desc   Set and get immersive style on material handle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImmersiveMaterialSetGetStyle001', Level.LEVEL1, async (done: Function) => {
      runCase('testImmersiveMaterialSetGetStyle001', done);
    });

    /**
     * @tc.name   testImmersiveMaterialSetGetStyleInvalid001
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_0700
     * @tc.desc   Set invalid immersive style returns error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImmersiveMaterialSetGetStyleInvalid001', Level.LEVEL1, async (done: Function) => {
      runCase('testImmersiveMaterialSetGetStyleInvalid001', done);
    });

    /**
     * @tc.name   testImmersiveMaterialSetGetColor001
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_0800
     * @tc.desc   Set and get color on immersive material handle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImmersiveMaterialSetGetColor001', Level.LEVEL1, async (done: Function) => {
      runCase('testImmersiveMaterialSetGetColor001', done);
    });
  });
}

function registerImmersiveAttributeCases(): void {
  describe('ImmersiveMaterialAttribute', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testImmersiveMaterialSetGetApplyShadow001
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_0900
     * @tc.desc   Set and get apply shadow flag on material handle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImmersiveMaterialSetGetApplyShadow001', Level.LEVEL1, async (done: Function) => {
      runCase('testImmersiveMaterialSetGetApplyShadow001', done);
    });

    /**
     * @tc.name   testImmersiveMaterialSetGetInteractive001
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_1000
     * @tc.desc   Set and get interactive flag on material handle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImmersiveMaterialSetGetInteractive001', Level.LEVEL1, async (done: Function) => {
      runCase('testImmersiveMaterialSetGetInteractive001', done);
    });

    /**
     * @tc.name   testImmersiveMaterialGetInteractiveNotSet001
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_1100
     * @tc.desc   Get interactive flag when not set returns default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImmersiveMaterialGetInteractiveNotSet001', Level.LEVEL1, async (done: Function) => {
      runCase('testImmersiveMaterialGetInteractiveNotSet001', done);
    });

    /**
     * @tc.name   testLightEffectOptionsLifecycle001
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_1200
     * @tc.desc   Create and destroy light effect options handle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightEffectOptionsLifecycle001', Level.LEVEL1, async (done: Function) => {
      runCase('testLightEffectOptionsLifecycle001', done);
    });
  });
}

function registerImmersiveLightAndNodeCases(): void {
  describe('ImmersiveMaterialLightAndNode', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testImmersiveMaterialSetGetLightEffect001
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_1300
     * @tc.desc   Set and get light effect options on material handle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImmersiveMaterialSetGetLightEffect001', Level.LEVEL1, async (done: Function) => {
      runCase('testImmersiveMaterialSetGetLightEffect001', done);
    });

    /**
     * @tc.name   testImmersiveMaterialGetLightEffectNotSet001
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_1400
     * @tc.desc   Get light effect when not set returns null handle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImmersiveMaterialGetLightEffectNotSet001', Level.LEVEL1, async (done: Function) => {
      runCase('testImmersiveMaterialGetLightEffectNotSet001', done);
    });

    /**
     * @tc.name   testNodeSystemMaterialAttrId001
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_1500
     * @tc.desc   Verify NODE_SYSTEM_MATERIAL attribute id is valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeSystemMaterialAttrId001', Level.LEVEL1, async (done: Function) => {
      runCase('testNodeSystemMaterialAttrId001', done);
    });

    /**
     * @tc.name   testNodeSetSystemMaterial001
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_1600
     * @tc.desc   Set system material on node attribute handle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeSetSystemMaterial001', Level.LEVEL1, async (done: Function) => {
      runCase('testNodeSetSystemMaterial001', done);
    });
  });
}

export default function immersiveMaterialTest() {
  registerImmersiveEnumAndQueryCases();
  registerImmersiveLifecycleCases();
  registerImmersiveAttributeCases();
  registerImmersiveLightAndNodeCases();
}
