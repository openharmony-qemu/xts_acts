'use static';
/*
 * Copyright (c) 2026 Kaihong Co., Ltd.
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
import { describe, expect, it, Level } from '@ohos/hypium-static/src/main/indexStatic';
import { Configuration, common } from '@kit.AbilityKit';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function configurationHasBrandColorStaticTest(): void {
  describe('ConfigurationHasBrandColorStaticTest', () => {
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Configuration_HasBrandColorChanged_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_Configuration_HasBrandColorChanged_static_0100
     * @tc.desc   Live UIAbilityContext.config.hasBrandColorChanged is boolean or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Configuration_HasBrandColorChanged_static_0100', Level.LEVEL0,
      (): void => {
        let uiCtx = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as
          common.UIAbilityContext;
        expect(uiCtx !== undefined).assertTrue();
        let cfg: Configuration = uiCtx.config;
        expect(cfg !== undefined).assertTrue();
        let val = cfg.hasBrandColorChanged;
        expect(val === undefined || typeof val === 'boolean').assertTrue();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Configuration_HasBrandColorChanged_static_0200
     * @tc.number SUB_Ability_AbilityRuntime_Configuration_HasBrandColorChanged_static_0200
     * @tc.desc   hasBrandColorChanged literal true/false/unset triad
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Configuration_HasBrandColorChanged_static_0200', Level.LEVEL0,
      (): void => {
        let t: Configuration = { hasBrandColorChanged: true };
        let f: Configuration = { hasBrandColorChanged: false };
        let u: Configuration = {};
        expect(t.hasBrandColorChanged).assertEqual(true);
        expect(f.hasBrandColorChanged).assertEqual(false);
        expect(u.hasBrandColorChanged === undefined).assertTrue();
      });
  });
}
