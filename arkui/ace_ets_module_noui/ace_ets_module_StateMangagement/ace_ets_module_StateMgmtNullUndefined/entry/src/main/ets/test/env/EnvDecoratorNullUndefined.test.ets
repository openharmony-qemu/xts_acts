/**
 * Copyright (c) 2026 Kaihong Digital Industry Development Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import { pushPage, assertTitleVisible } from '../common/PagePushHelper';

export default function envDecoratorNullUndefinedTest() {
  describe('EnvDecoratorNullUndefinedTest', () => {
    beforeEach(() => {
      console.info('[EnvDecoratorNullUndefinedTest] beforeEach');
    });
    afterEach(() => {
      console.info('[EnvDecoratorNullUndefinedTest] afterEach');
    });

    /**
     * @tc.number EnvDecorator_page_load_001
     * @tc.name EnvDecorator_page_load_001
     * @tc.desc Cover @Env(SystemProperties) and Method Env(null|undefined)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('EnvDecorator_page_load_001', Level.LEVEL2, async () => {
      console.info('[EnvDecorator_page_load_001] START');
      try {
        await pushPage('MainAbility/pages/env/EnvDecoratorCover', 'EnvDecoratorCover');
        await assertTitleVisible('env_deco_cover_title');
        const driver: Driver = await Driver.create();
        const fnText: string =
          await (await driver.findComponent(ON.id('env_deco_cover_fn'))).getText();
        expect(fnText.indexOf('envFn:') === 0).assertTrue();
      } catch (err) {
        console.error('[EnvDecorator_page_load_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[EnvDecorator_page_load_001] END');
    });

    /**
     * @tc.number Env_key_null_undefined_001
     * @tc.name Env_key_null_undefined_001
     * @tc.desc Test Method Env(key) with null/undefined via EnvDecoratorCover
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('Env_key_null_undefined_001', Level.LEVEL2, async () => {
      console.info('[Env_key_null_undefined_001] START');
      try {
        await pushPage('MainAbility/pages/env/EnvDecoratorCover', 'EnvDecoratorCover');
        const driver: Driver = await Driver.create();
        const fnText: string =
          await (await driver.findComponent(ON.id('env_deco_cover_fn'))).getText();
        expect(fnText).assertEqual('envFn:2');
      } catch (err) {
        console.error('[Env_key_null_undefined_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[Env_key_null_undefined_001] END');
    });

    /**
     * @tc.number CustomEnvKey_SystemProperties_page_load_001
     * @tc.name CustomEnvKey_SystemProperties_page_load_001
     * @tc.desc Cover CustomEnvKey.create and SystemProperties via page
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('CustomEnvKey_SystemProperties_page_load_001', Level.LEVEL2, async () => {
      console.info('[CustomEnvKey_SystemProperties_page_load_001] START');
      try {
        await pushPage('MainAbility/pages/env/CustomEnvCover', 'CustomEnvCover');
        await assertTitleVisible('custom_env_cover_title');
        const driver: Driver = await Driver.create();
        const keyText: string =
          await (await driver.findComponent(ON.id('custom_env_cover_key'))).getText();
        expect(keyText.indexOf('key:') === 0).assertTrue();
      } catch (err) {
        console.error('[CustomEnvKey_SystemProperties_page_load_001] Error: ' +
          JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[CustomEnvKey_SystemProperties_page_load_001] END');
    });
  });
}
