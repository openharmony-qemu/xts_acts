/*
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

import { describe, beforeEach, it, expect, Level, beforeAll, beforeEach, Size, TestType, afterEach } from '../../../../hypium/index';
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
const uiContext = AppStorage.get<UIContext>("uiContext")

export default function EnableSwipeBackPage() {
  describe('EnableSwipeBackPage', () => {

    beforeAll(() => {
      console.info("EnableSwipeBackPage beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.navigationwear18.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info('EnableSwipeBackPage beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/EnableSwipeBackPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get EnableSwipeBackPage state pages:' + JSON.stringify(pages));
        if (!('EnableSwipeBackPage' == pages.name)) {
          console.info('get EnableSwipeBackPage pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info('push EnableSwipeBackPage page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push EnableSwipeBackPage page error:' + err);
      }
      console.info('EnableSwipeBackPage beforeEach end');
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('EnableSwipeBackPage after each called');
    });


    /**
     * @tc.number    EnableSwipeBackPage_static_0100
     * @tc.name      EnableSwipeBackPage_static_0100
     * @tc.desc      Test enableSwipeBack test true
     * @tc.level     Level 0
     */
    it('EnableSwipeBackPage_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('EnableSwipeBackPage_static_0100 START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let btn1: Component = await driver.findComponent(ON.id('pushId')) as Component;
      await btn1!.click();
      console.info('[EnableSwipeBackPage_static_0100] btn1 click');
      await driver.delayMs(500);

      let navComponent: Component = await driver.findComponent(ON.id('navId')) as Component;
      console.info('[EnableSwipeBackPage_static_0100] navComponent is ', navComponent);
      let navRect = await navComponent!.getBounds();
      let right = navRect.right;
      let bottom = navRect.bottom;   
      console.info('[EnableSwipeBackPage_static_0100] right is ', right);
      console.info('[EnableSwipeBackPage_static_0100] bottom is ', bottom);
      await driver.fling({x: Math.round(uiContext!.vp2px(11)) as int, y: Math.round(bottom/2) as int}, {x: Math.round(right/3) as int, y: Math.round(bottom/2) as int}, 2, 40000);
      await driver.delayMs(1000)

      await driver.assertComponentExist(ON.id('pushId'));
      console.log('[EnableSwipeBackPage_static_0100] END');
      done();
    });

    /**
     * @tc.number    EnableSwipeBackPage_static_0200
     * @tc.name      EnableSwipeBackPage_static_0200
     * @tc.desc      Test enableSwipeBack test false
     * @tc.level     Level 0
     */
    it('EnableSwipeBackPage_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('EnableSwipeBackPage_static_0200 START');
      let driver = Driver.create();
      await driver.delayMs(500);

      let btn1: Component = await driver.findComponent(ON.id('pushId')) as Component;
      await btn1!.click();
      console.info('[EnableSwipeBackPage_static_0200] btn1 click');
      await driver.delayMs(500);

      let btn2: Component = await driver.findComponent(ON.id('enableId')) as Component;
      await btn2!.click();
      console.info('[EnableSwipeBackPage_static_0200] btn2 click');
      await driver.delayMs(1000);

      let navComponent: Component = await driver.findComponent(ON.id('navId')) as Component;
      console.info('[EnableSwipeBackPage_static_0200] navComponent is ', navComponent);
      let navRect = await navComponent!.getBounds();
      let right = navRect.right;
      let bottom = navRect.bottom;   
      console.info('[EnableSwipeBackPage_static_0200] right is ', right);
      console.info('[EnableSwipeBackPage_static_0200] bottom is ', bottom);
      await driver.fling({x: Math.round(uiContext!.vp2px(11)) as int, y: Math.round(bottom/2) as int} , {x: Math.round(right/3) as int, y: Math.round(bottom/2) as int}, 2, 40000);
      await driver.delayMs(1000)
      await driver.assertComponentExist(ON.id('enableId'));

      let btn3: Component = await driver.findComponent(ON.id('enableId')) as Component;
      await btn3!.click();
      console.info('[EnableSwipeBackPage_static_0200] btn3 click');
      await driver.delayMs(1000);
      console.log('[EnableSwipeBackPage_static_0200] END');
      done();
    });

  })
}