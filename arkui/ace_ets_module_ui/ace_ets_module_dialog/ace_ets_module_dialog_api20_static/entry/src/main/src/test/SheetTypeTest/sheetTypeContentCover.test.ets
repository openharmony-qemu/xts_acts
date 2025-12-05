'use static';
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

import events_emitter from '@ohos.events.emitter';
import { Color,$r } from '@ohos.arkui.component'
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function sheetTypeContentCoverTest() {
  describe('sheetTypeContentCoverTest', () => {
    beforeAll(() => {
      console.info("sheetTypeContentCoverTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.api20.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info('sheetTypeContentCoverTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SheetType/sheetTypeContentCover',
      }
      try {
  const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear()
        let pages = routerInstance.getState();
        console.info('get sheetTypeContentCoverTest state pages: ' + JSON.stringify(pages));
        if (!('sheetTypeContentCoverTest' == pages.name)) {
          console.info('get sheetTypeContentCoverTest pages.name: ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(5000);
        }
      } catch (err) {
        console.error('push sheetTypeContentCoverTest page error: ' + err);
      }
    });

    
     /*
     * @tc.number   sheetTypeContentCoverTest_static_001
     * @tc.name     sheetTypeContentCoverTest_static_001
     * @tc.desc     sheetTypeContentCoverTest_static_001
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('sheetTypeContentCoverTest_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('sheetTypeContentCoverTest_001 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button:Component = await driver.findComponent(ON.id('sheetTypeContentCover')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);

      let button1:Component = await driver.findComponent(ON.id('close')) as Component;
      await button1.click();
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('text1');
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('4');
      await CommonFunc.sleep(1000);
      
      console.info('sheetTypeContentCoverTest_001 END');
      done();
    });
  })
}