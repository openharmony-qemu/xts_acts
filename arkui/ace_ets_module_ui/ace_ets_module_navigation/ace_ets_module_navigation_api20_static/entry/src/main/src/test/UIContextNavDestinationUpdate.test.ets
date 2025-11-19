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

import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../hypium/index';
import router from '@ohos.router';
import { UtilsTest } from './Util.test';
import Utils from '../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON,Component } from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../ets/MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
export default function UIContextNavDestinationUpdate() {
  describe('UIContextNavDestinationUpdate', () => {
    beforeAll(() => {

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.navigation20.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info('UIContextNavDestinationUpdate beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIContextNavDestinationUpdate',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get UIContextNavDestinationUpdate state pages:' + JSON.stringify(pages));
        if (!('UIContextNavDestinationUpdate' == pages.name)) {
          console.info('get UIContextNavDestinationUpdate pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push UIContextNavDestinationUpdate page error:' + err);
      }
      console.info('UIContextNavDestinationUpdate beforeEach end');
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('UIContextNavDestinationUpdate after each called');
    });


        
/*
     * @tc.number   UIContextNavDestinationUpdate_static_0100
     * @tc.name     UIContextNavDestinationUpdate_static_0100
     * @tc.desc     UIContextNavDestinationUpdate_static_0100
     * @tc.level    Level.LEVEL0
     */
it('UIContextNavDestinationUpdate_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {      console.info('UIContextNavDestinationUpdate_static_0100 START');
      await CommonFunc.sleep(500);
      let driver = Driver.create();
      await driver.delayMs(1000);

      let pushOneBtn = await (driver.findComponent(ON.id('pushOneId')) as Promise<Component>);
      await pushOneBtn.click()
      console.info('[UIContextNavDestinationUpdate_static_0100] pushOneBtn click');
      await driver.delayMs(1000);

      let uniqueId = AppStorage.get('uniqueId')
      console.log('[UIContextNavDestinationUpdate_static_0100] uniqueId value : ' + uniqueId)
      expect(uniqueId !== '').assertTrue();
      AppStorage.delete('uniqueId');

      console.info('UIContextNavDestinationUpdate_static_0100 END');
      done();
    });

        
/*
     * @tc.number   UIContextNavDestinationUpdate_static_0200
     * @tc.name     UIContextNavDestinationUpdate_static_0200
     * @tc.desc     UIContextNavDestinationUpdate_static_0200
     * @tc.level    Level.LEVEL0
     */
it('UIContextNavDestinationUpdate_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {      console.info('UIContextNavDestinationUpdate_static_0200 START');
      await CommonFunc.sleep(500);
      let driver = Driver.create();
      await driver.delayMs(1000);

      let onBtn = await (driver.findComponent(ON.id('onId')) as Promise<Component>);
      await onBtn.click()
      console.info('[UIContextNavDestinationUpdate_static_0200] onBtn click');
      await driver.delayMs(1000);

      let pushTwoBtn = await (driver.findComponent(ON.id('pushTwoId')) as Promise<Component>);
      await pushTwoBtn.click()
      console.info('[UIContextNavDestinationUpdate_static_0200] pushTwoBtn click');
      await driver.delayMs(3000);

      let navDestinationName = AppStorage.get('navDestinationName')
      console.log('[UIContextNavDestinationUpdate_static_0200] navDestinationName value : ' + navDestinationName)
      expect(navDestinationName).assertEqual('pageTwo')
      AppStorage.delete('navDestinationName');

      let backBtn = await (driver.findComponent(ON.id('backId')) as Promise<Component>);
      await backBtn.click()
      console.info('[UIContextNavDestinationUpdate_static_0200] backBtn click');
      await driver.delayMs(1000);

      console.info('UIContextNavDestinationUpdate_static_0200 END');
      done();
    });

        
/*
     * @tc.number   UIContextNavDestinationUpdate_static_0300
     * @tc.name     UIContextNavDestinationUpdate_static_0300
     * @tc.desc     UIContextNavDestinationUpdate_static_0300
     * @tc.level    Level.LEVEL0
     */
it('UIContextNavDestinationUpdate_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {      console.info('UIContextNavDestinationUpdate_static_0300 START');
      await CommonFunc.sleep(500);
      let driver = Driver.create();
      await driver.delayMs(1000);

      let offBtn = await (driver.findComponent(ON.id('offId')) as Promise<Component>);
      await offBtn.click()
      console.info('[UIContextNavDestinationUpdate_static_0300] offBtn click');
      await driver.delayMs(1000);

      AppStorage.delete('navDestinationName');
      await driver.delayMs(1000);

      let pushTwoBtn = await (driver.findComponent(ON.id('pushTwoId')) as Promise<Component>);
      await pushTwoBtn.click()
      console.info('[UIContextNavDestinationUpdate_static_0300] pushTwoBtn click');
      await driver.delayMs(3000);

      let navDestinationName = AppStorage.get('navDestinationName')
      console.log('[UIContextNavDestinationUpdate_static_0300] navDestinationName value : ' + navDestinationName)
      expect(navDestinationName).assertEqual(undefined)

      console.info('UIContextNavDestinationUpdate_static_0300 END');
      done();
    });

  })
}