'use static';
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

import { describe, beforeAll, beforeEach, afterAll, it, expect, Level } from '@ohos/hypium-static/src/main/indexStatic';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME = 500;

export default function ParticleModifierTest(): void {
  describe('ParticleModifierTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('ParticleModifierTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.richeditor.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('ParticleModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Coverage/ParticleModifierPage',
      };
      try {
        const routerInstance: Router = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        if (pages.name !== 'ParticleModifierPage') {
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error('ParticleModifierTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterAll(() => {
      AppStorage.delete('particle_page_ready');
    });

    /**
     * @tc.name   SUB_ARKUI_PARTICLE_MODIFIER_0100
     * @tc.number SUB_ARKUI_PARTICLE_MODIFIER_0100
     * @tc.desc   Test Particle with attributeModifier(ParticleModifier) backgroundColor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_PARTICLE_MODIFIER_0100', Level.LEVEL2, async (): Promise<void> => {
      console.info('[particle_modifier_background_0100] START');
      await CommonFunc.sleep(SLEEP_TIME);
      expect(AppStorage.get<string>('particle_page_ready')).assertEqual('ready');
      let strJson = inspector.getInspectorByKey('particle_with_modifier');
      let bg: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor');
      console.info('[particle_modifier_background_0100] bg=' + bg);
      expect(bg === '#EEEEA500' || bg.toUpperCase() === '#EEEEA500').assertTrue();
      console.info('[particle_modifier_background_0100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_PARTICLE_MODIFIER_0200
     * @tc.number SUB_ARKUI_PARTICLE_MODIFIER_0200
     * @tc.desc   Test Particle attributeModifier(undefined) abnormal param
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_PARTICLE_MODIFIER_0200', Level.LEVEL2, async (): Promise<void> => {
      console.info('[particle_undefined_modifier_0100] START');
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = inspector.getInspectorByKey('particle_undefined_modifier');
      expect(strJson.length > 0).assertTrue();
      let typeStr: string = JSON.parseJsonElement(strJson).getElement('$type').toString();
      console.info('[particle_undefined_modifier_0100] type=' + typeStr);
      expect(typeStr.length > 0).assertTrue();
      console.info('[particle_undefined_modifier_0100] END');
    });
  });
}
