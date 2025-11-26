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
import { $r, Color } from '@ohos.arkui.component'
import {
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Component, Driver, MouseButton, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function bindContentCoverTest() {
  describe('bindContentCoverTest', () => {
    beforeAll(() => {
      console.info("bindContentCoverTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.api20.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async () => {
      console.info('bindContentCoverTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/BindContentCover/bindContentCover',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear()
        let pages = routerInstance.getState();
        console.info('get bindContentCoverTest state pages: ' + JSON.stringify(pages));
        if (!('bindContentCoverTest' == pages.name)) {
          console.info('get BindPopupbindContentCoverTestTest pages.name: ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push bindContentCoverTest page error: ' + err);
      }

      await CommonFunc.sleep(1000)
      console.info('bindContentCoverTest beforeEach end');
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('bindContentCoverTest after each called');
    })


    /*
         * @tc.number   bindContentCoverTest_static_001
         * @tc.name     bindContentCoverTest_static_001
         * @tc.desc     bindContentCoverTest_static_001
         * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
         */
    it('bindContentCoverTest_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await CommonFunc.sleep(1000);
        let driver: Driver = Driver.create();
        let btn1 = await driver.findComponent(ON.id('safeArea')) as Component;
        await (btn1?.click() as Promise<void>)
        await CommonFunc.sleep(1000);

        let button1 = await driver.findComponent(ON.id('area1')) as Component;
        let toprect = await button1.getBounds();
        console.info("[bindContentCoverTest_001] rect is: " + JSON.stringify(toprect));
        console.info("[bindContentCoverTest_001] rect.top is: " + toprect.top);

        expect(toprect.top == 0).assertFalse();
        expect(toprect.top > 0).assertTrue();
        await CommonFunc.sleep(1000);

        console.info('bindContentCoverTest_001 END');
        done();
      });
  })
}