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

export default function dismissSheetActionTest() {
  describe('dismissSheetActionTest', () => {
    beforeAll(() => {
      console.info("dismissSheetActionTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.api20.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async () => {
      console.info('dismissSheetActionTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SheetType/dismissSheetAction',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear()
        let pages = routerInstance.getState();
        console.info('get dismissSheetActionTest state pages: ' + JSON.stringify(pages));
        if (!('dismissSheetActionTest' == pages.name)) {
          console.info('get dismissSheetActionTest pages.name: ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(5000);
        }
      } catch (err) {
        console.error('push dismissSheetActionTest page error: ' + err);
      }
    });

                                                                            
    /*
     * @tc.number   dismissSheetActionTest_static_001
     * @tc.name     dismissSheetActionTest_static_001
     * @tc.desc     dismissSheetActionTest_static_001
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('dismissSheetActionTest_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dismissSheetActionTest_001 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button:Component = await driver.findComponent(ON.id('dismissSheetAction')) as Component;
      await (button.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let col:Component = await driver.findComponent(ON.id('col')) as Component
      let height = await  col.getBoundsCenter()
      console.info("[dismissSheetActionTest_001] height is: " + JSON.stringify(height));
      console.info("[dismissSheetActionTest_001] height.y is: " + Math.round(height.y));
      console.info("[dismissSheetActionTest_001] height.x is: " + Math.round(height.x));
      await driver.swipe((Math.round(height.x - 200)).toInt(),(Math.round(height.y)).toInt(),(Math.round(height.x + 300)).toInt(),(Math.round(height.y)).toInt());
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('DismissReason');
      console.info("[dismissSheetActionTest_001] DismissReason obj is: " + JSON.stringify(JSON.parseJsonElement(strJson1)));
      console.info("[dismissSheetActionTest_001] $attrs obj is: " + JSON.parseJsonElement(strJson1).getElement('$attrs'));
      console.info("[dismissSheetActionTest_001] content obj is: " + JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'));

      
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('success');
      await CommonFunc.sleep(1000);
      console.info('dismissSheetActionTest_001 END');
      done();
    });
  })
}