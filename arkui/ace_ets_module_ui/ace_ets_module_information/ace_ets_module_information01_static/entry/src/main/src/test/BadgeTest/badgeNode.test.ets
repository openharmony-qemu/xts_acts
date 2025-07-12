/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, it, expect, beforeAll } from "../../../../hypium/index";
import inspector from '@ohos.arkui.inspector'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function BadgeNodeTest() {
  describe('BadgeNodeTest', () => {

    beforeAll(() => {
      console.info("BadgeNodeTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information01.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info('badgeNodeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Badge/badgeNode',
      }
      try {
        const router = AppStorage.get<Router>("router",  Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info('get badgeNode state pages: ' + JSON.stringify(pages));
        if (!('badgeNode' == pages.name)) {
          console.info('get badgeNode pages.name: ' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push badgeNode page error: ' + err);
      }

      await CommonFunc.sleep(1000)
      console.info('badgeNode beforeEach end');
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('badgeNode after each called');
    })

    /**
     * @tc.number badgeNode0100
     * @tc.name badgeNode_static_0100
     * @tc.desc frameNode: createNodebadgeToWindow
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('badgeNode_static_0100', 0, async (done: () => void): Promise<void> => {

      let tagName = 'badgeNode_static_0100';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = inspector.getInspectorByKey('key_ badge_001');
      console.info('[' + tagName + '] Search is: ' +
      JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$type')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$type')).assertEqual("Badge");
      console.info('[' + tagName + '] END ===========================');
      done();
    });

  })
}
