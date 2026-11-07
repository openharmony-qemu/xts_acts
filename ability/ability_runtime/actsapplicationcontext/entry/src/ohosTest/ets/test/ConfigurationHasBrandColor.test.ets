/**
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

import { describe, it, expect, Level } from '@ohos/hypium-dynamic';
import { Configuration, common } from '@kit.AbilityKit';

export default function ConfigurationHasBrandColorTest() {
  describe('ConfigurationHasBrandColorTest', () => {
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Configuration_HasBrandColorChanged_0100
     * @tc.number SUB_Ability_AbilityRuntime_Configuration_HasBrandColorChanged_0100
     * @tc.desc   Configuration.hasBrandColorChanged: live TestAbility config is boolean|undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Configuration_HasBrandColorChanged_0100', Level.LEVEL0,
      (done: Function) => {
        let tag = 'SUB_Ability_AbilityRuntime_Configuration_HasBrandColorChanged_0100';
        let uiCtx = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
        expect(uiCtx !== undefined).assertTrue();
        let cfg: Configuration = uiCtx.config;
        expect(cfg !== undefined).assertTrue();
        let val = cfg.hasBrandColorChanged;
        console.info(`${tag} hasBrandColorChanged=${val}`);
        expect(val === undefined || typeof val === 'boolean').assertTrue();
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Configuration_HasBrandColorChanged_0200
     * @tc.number SUB_Ability_AbilityRuntime_Configuration_HasBrandColorChanged_0200
     * @tc.desc   Configuration.hasBrandColorChanged: true means brand color has changed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Configuration_HasBrandColorChanged_0200', Level.LEVEL0,
      (done: Function) => {
        let cfg: Configuration = { hasBrandColorChanged: true };
        expect(cfg.hasBrandColorChanged).assertEqual(true);
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Configuration_HasBrandColorChanged_0300
     * @tc.number SUB_Ability_AbilityRuntime_Configuration_HasBrandColorChanged_0300
     * @tc.desc   Configuration.hasBrandColorChanged: false means brand color has not changed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Configuration_HasBrandColorChanged_0300', Level.LEVEL0,
      (done: Function) => {
        let cfg: Configuration = { hasBrandColorChanged: false };
        expect(cfg.hasBrandColorChanged).assertEqual(false);
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Configuration_HasBrandColorChanged_0400
     * @tc.number SUB_Ability_AbilityRuntime_Configuration_HasBrandColorChanged_0400
     * @tc.desc   Configuration.hasBrandColorChanged: optional unset stays undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Configuration_HasBrandColorChanged_0400', Level.LEVEL0,
      (done: Function) => {
        let cfg: Configuration = {};
        expect(cfg.hasBrandColorChanged === undefined).assertTrue();
        done();
      });
  });
}
