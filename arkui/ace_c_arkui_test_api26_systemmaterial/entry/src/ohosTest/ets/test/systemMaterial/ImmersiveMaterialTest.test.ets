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

export default function immersiveMaterialTest() {
  describe('ImmersiveMaterialTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_0100
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_0100
     * @tc.desc   Verify immersive style enum constant values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_0100', Level.LEVEL1, async (done: Function) => {
      runCase('testImmersiveStyleEnumValues001', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_0200
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_0200
     * @tc.desc   Verify material level enum constant values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_0200', Level.LEVEL1, async (done: Function) => {
      runCase('testMaterialLevelEnumValues001', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_0300
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_0300
     * @tc.desc   Call GetSystemMaterialSupported without error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_0300', Level.LEVEL1, async (done: Function) => {
      runCase('testGetSystemMaterialSupported001', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_0400
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_0400
     * @tc.desc   GetGlobalMaterialLevel returns value in valid range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_0400', Level.LEVEL1, async (done: Function) => {
      runCase('testGetGlobalMaterialLevel001', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_0500
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_0500
     * @tc.desc   Create and destroy immersive material for all styles
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_0500', Level.LEVEL1, async (done: Function) => {
      runCase('testImmersiveMaterialCreateDestroy001', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_0600
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_0600
     * @tc.desc   Set and get immersive style on material handle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_0600', Level.LEVEL1, async (done: Function) => {
      runCase('testImmersiveMaterialSetGetStyle001', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_0700
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_0700
     * @tc.desc   Set invalid immersive style returns error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_0700', Level.LEVEL1, async (done: Function) => {
      runCase('testImmersiveMaterialSetGetStyleInvalid001', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_0800
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_0800
     * @tc.desc   Set and get color on immersive material handle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_0800', Level.LEVEL1, async (done: Function) => {
      runCase('testImmersiveMaterialSetGetColor001', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_0900
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_0900
     * @tc.desc   Set and get apply shadow flag on material handle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_0900', Level.LEVEL1, async (done: Function) => {
      runCase('testImmersiveMaterialSetGetApplyShadow001', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_1000
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_1000
     * @tc.desc   Set and get interactive flag on material handle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_1000', Level.LEVEL1, async (done: Function) => {
      runCase('testImmersiveMaterialSetGetInteractive001', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_1100
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_1100
     * @tc.desc   Get interactive flag when not set returns default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_1100', Level.LEVEL1, async (done: Function) => {
      runCase('testImmersiveMaterialGetInteractiveNotSet001', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_1200
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_1200
     * @tc.desc   Create and destroy light effect options handle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_1200', Level.LEVEL1, async (done: Function) => {
      runCase('testLightEffectOptionsLifecycle001', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_1300
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_1300
     * @tc.desc   Set and get light effect options on material handle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_1300', Level.LEVEL1, async (done: Function) => {
      runCase('testImmersiveMaterialSetGetLightEffect001', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_1400
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_1400
     * @tc.desc   Get light effect when not set returns null handle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_1400', Level.LEVEL1, async (done: Function) => {
      runCase('testImmersiveMaterialGetLightEffectNotSet001', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_1500
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_1500
     * @tc.desc   Verify NODE_SYSTEM_MATERIAL attribute id is valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_1500', Level.LEVEL1, async (done: Function) => {
      runCase('testNodeSystemMaterialAttrId001', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_1600
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_1600
     * @tc.desc   Set system material on node attribute handle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_1600', Level.LEVEL1, async (done: Function) => {
      runCase('testNodeSetSystemMaterial001', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_1700
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_1700
     * @tc.desc   Destroy immersive material with null handle does not crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_1700', Level.LEVEL1, async (done: Function) => {
      runCase('testImmersiveMaterialDestroyNull001', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_1800
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_1800
     * @tc.desc   Set and get material color boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_1800', Level.LEVEL1, async (done: Function) => {
      runCase('testImmersiveMaterialSetMaterialColorBoundary001', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_1900
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_1900
     * @tc.desc   Set material color with null handle returns invalid param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_1900', Level.LEVEL1, async (done: Function) => {
      runCase('testImmersiveMaterialSetMaterialColorInvalid001', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_2000
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_2000
     * @tc.desc   Set light effect color boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_2000', Level.LEVEL1, async (done: Function) => {
      runCase('testLightEffectOptionsSetColorBoundary001', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_2100
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_2100
     * @tc.desc   Set light effect color with null options returns invalid param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_2100', Level.LEVEL1, async (done: Function) => {
      runCase('testLightEffectOptionsSetColorInvalid001', done);
    });

  });
}
