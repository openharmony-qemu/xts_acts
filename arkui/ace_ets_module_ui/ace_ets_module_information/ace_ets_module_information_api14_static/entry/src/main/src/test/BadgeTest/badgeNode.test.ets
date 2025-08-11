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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "../../../../hypium/index";
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { UtilsTest } from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function BadgeNodeTest() {
  describe('BadgeNodeTest', () => {
    beforeAll(() => {
      console.info("BadgeNodeTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info('BadgeNodeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Badge/badgeNode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get badgeNode state pages: ' + JSON.stringify(pages));
        if (!('badgeNode' == pages.name)) {
          console.info('get badgeNode pages.name: ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
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
     * @tc.number    badgeNode0100
     * @tc.name      badgeNode0100
     * @tc.desc      frameNode: createNodebadgeToWindow
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('badgeNode_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {

      let tagName = 'badgeNode0100';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = inspector.getInspectorByKey('key_ badge_001');
      console.info('[' + tagName + '] Search is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew).getString('$type')));
      expect(JSON.parseJsonElement(strJsonNew).getString('$type')).assertEqual("Badge");
      console.info('[' + tagName + '] END ===========================');
      done();
    });

  })
}
