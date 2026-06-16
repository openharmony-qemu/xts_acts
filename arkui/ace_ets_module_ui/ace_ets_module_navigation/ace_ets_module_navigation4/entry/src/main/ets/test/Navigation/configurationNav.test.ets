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

import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { Component, Driver, MouseButton, ON, BY, WindowMode } from '@ohos.UiTest';

export default function configurationNav() {
  describe('configurationNav', () => {
    beforeEach(async (done: Function) => {
      console.info('configurationNav beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/configurationNav',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get configurationNav state pages:' + JSON.stringify(pages));
        if (!('configurationNav' == pages.name)) {
          console.info('get configurationNav pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push configurationNav page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push configurationNav page error:' + err);
      }
      console.info('configurationNav beforeEach end');
      done();
    });

    /**
     * @tc.name   configuration_stackSizeLimit_0100
     * @tc.number SUB_ARKUI_NAVIGATION_CONFIGURATION_PARAM_0100
     * @tc.desc   Test Navigation configuration stackSizeLimit property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('configuration_stackSizeLimit_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[configuration_stackSizeLimit_0100] START');
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('stack_limit_btn');
      console.info("[configuration_stackSizeLimit_0100] label: " + JSON.stringify(JSON.parse(strJson).$attrs.label));
      expect(JSON.parse(strJson).$attrs.label).assertEqual("limit [1]");
      console.info('[configuration_stackSizeLimit_0100] END');
      done();
    });

    /**
     * @tc.name   navigation_pushPath_0100
     * @tc.number SUB_ARKUI_NAVIGATION_PUSHPATH_0100
     * @tc.desc   Test Navigation pushPath with stackSizeLimit configuration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigation_pushPath_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[navigation_pushPath_0100] START');
      await CommonFunc.sleep(500);
      let driver = await Driver.create();
      let pushBtn = await driver.findComponent(ON.id('push_standard_btn'));
      await pushBtn.click();
      await CommonFunc.sleep(1500);

      let strJson = getInspectorByKey('all_destinations_text');
      console.info("[navigation_pushPath_0100] destinations: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      let destinations:string = JSON.parse(JSON.parse(strJson).$attrs.content);
      expect(destinations.length).assertEqual(1);
      expect(destinations[0].includes('STANDARD')).assertTrue();

      console.info('[navigation_pushPath_0100] END');
      done();
    });

    /**
     * @tc.name   onSaveState_onRestoreState_0100
     * @tc.number SUB_ARKUI_NAVDEST_SAVESTATE_0100
     * @tc.desc   Test NavDestination onSaveState and onRestoreState callbacks
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('onSaveState_onRestoreState_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[onSaveState_onRestoreState_0100] START');
      await CommonFunc.sleep(500);
      let driver = await Driver.create();
      let pushBtn = await driver.findComponent(ON.id('push_standard_btn'));
      await pushBtn.click();
      await CommonFunc.sleep(1000);
      let pushBtn2 = await driver.findComponent(ON.id('push_standard_btn'));
      await pushBtn2.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('nav_save_state_text');
      console.info("[onSaveState_onRestoreState_0100] saveState: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual("onSaveState: success");

      let replaceBtn = await driver.findComponent(ON.id('replace_restore_btn'));
      await replaceBtn.click();
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('nav_restore_state_text');
      console.info("[onSaveState_onRestoreState_0100] restoreState: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual("onRestoreState: success");
      console.info('[onSaveState_onRestoreState_0100] END');
      done();
    });
  })
}