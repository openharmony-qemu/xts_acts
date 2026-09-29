/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic-dynamic';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, UIElementInfo} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function CustomEnvNearTest() {
  describe('CustomEnvNearTest', () => {
    beforeEach(async (done: Function) => {
      console.info('CustomEnvNearTest setup start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomEnv/CustomEnvNear',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get current pages:' + JSON.stringify(pages));
        if (!('CustomEnvNear' == pages.name)) {
          console.info('get CustomEnvNearTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push CustomEnvNearTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push CustomEnvNearTest page error:' + err);
      }
      console.info('CustomEnvNearTest beforeEach end');
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('CustomEnvNearTest after each called');
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENVNEAR_0100
     * @tc.name      SUB_ARKUI_COMPONENT_STATE_CUSTOMENVNEAR_0100
     * @tc.desc      Testing @CustomEnv nearest WithEnv principle - child gets value from nearest WithEnv
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SUB_ARKUI_COMPONENT_STATE_CUSTOMENVNEAR_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVNEAR_0100] START');
      await CommonFunc.sleep(2000);
      try{
        let driver: Driver = Driver.create();
        // Verify NearChild receives value from nearest WithEnv ('the nearest WithEnv') instead of outer one
        let text_1 = await (await driver.findComponent(ON.id('customEnvNear_dynamic_001'))).getText();
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVNEAR_0100] component text_1: ' + text_1);
        expect(text_1).assertEqual('Child: the nearest WithEnv');
      } catch (err){
        console.error("SUB_ARKUI_COMPONENT_STATE_CUSTOMENVNEAR_0100 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVNEAR_0100] END');
      done();
    });
  })
}
