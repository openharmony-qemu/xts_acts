'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '@ohos/hypium-binary/src/main/indexStatic';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { NavPathInfo, NavigationDividerStyle, ScrollEffectType } from '@ohos.arkui.component';

export default function configurationNav() {
  describe('configurationNav', () => {
    beforeAll(async (): Promise<void> => {
      console.info('configurationNav beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.navigation.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('configurationNav beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/navigationNavDestination/configurationNav',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get configurationNav state pages:' + JSON.stringify(pages));
        if (!('configurationNav' == pages.name)) {
          console.info('get configurationNav pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2500);
        }
      } catch (err) {
        console.error('push configurationNav page error:' + err);
      }
      console.info('configurationNav beforeEach end');
    });

    /**
     * @tc.name   configuration_stackSizeLimit_static_0100
     * @tc.number SUB_ARKUI_NAVIGATION_CONFIGURATION_STATIC_0100
     * @tc.desc   Test Navigation configuration stackSizeLimit property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('configuration_stackSizeLimit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[configuration_stackSizeLimit_static_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stack_limit_btn');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[configuration_stackSizeLimit_static_0100] label: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("limit [1]");
      console.info('[configuration_stackSizeLimit_static_0100] END');
      done();
    });
  });
}