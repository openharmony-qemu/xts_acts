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

    const cases = [
      'testImmersiveStyleEnumValues001',
      'testMaterialLevelEnumValues001',
      'testGetSystemMaterialSupported001',
      'testGetGlobalMaterialLevel001',
      'testImmersiveMaterialCreateDestroy001',
      'testImmersiveMaterialSetGetStyle001',
      'testImmersiveMaterialSetGetStyleInvalid001',
      'testImmersiveMaterialSetGetColor001',
      'testImmersiveMaterialSetGetApplyShadow001',
      'testImmersiveMaterialSetGetInteractive001',
      'testImmersiveMaterialGetInteractiveNotSet001',
      'testLightEffectOptionsLifecycle001',
      'testImmersiveMaterialSetGetLightEffect001',
      'testImmersiveMaterialGetLightEffectNotSet001',
      'testNodeSystemMaterialAttrId001',
      'testNodeSetSystemMaterial001',
    ];

    cases.forEach((caseName: string) => {
      it(caseName, Level.LEVEL1, async (done: Function) => {
        runCase(caseName, done);
      });
    });
  });
}
