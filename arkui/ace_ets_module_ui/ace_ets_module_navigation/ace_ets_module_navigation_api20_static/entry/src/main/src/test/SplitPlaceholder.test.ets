'use static';
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

export default function SplitPlaceholder() {
  describe('SplitPlaceholder', () => {
    beforeAll(() => {

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.navigation20.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info('SplitPlaceholder beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SplitPlaceholder',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get SplitPlaceholder state pages:' + JSON.stringify(pages));
        if (!('SplitPlaceholder' == pages.name)) {
          console.info('get SplitPlaceholder pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push SplitPlaceholder page error:' + err);
      }
      console.info('SplitPlaceholder beforeEach end');
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('SplitPlaceholder after each called');
    });


        
/*
     * @tc.number   SplitPlaceholder_static_0100
     * @tc.name     SplitPlaceholder_static_0100
     * @tc.desc     SplitPlaceholder_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SplitPlaceholder_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {      console.info('[SplitPlaceholder_static_0100] START');
      await CommonFunc.sleep(500);
      let driver = Driver.create();
      await driver.delayMs(1000);

      let obj1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);

      console.log('SplitPlaceholder_static_0100: ', JSON.stringify(obj1.getArray('$children')[0]
          .getArray('$children')[3]))
      console.log('SplitPlaceholder_static_0100]: ', obj1.getArray('$children')[0]
          .getArray('$children')[3].getString('$type'))

      await driver.assertComponentExist(ON.type('SplitPlaceholderContentNode'));

      console.info('[SplitPlaceholder_static_0100] END');
      done();
    });

        
/*
     * @tc.number   SplitPlaceholder_static_0200
     * @tc.name     SplitPlaceholder_static_0200
     * @tc.desc     SplitPlaceholder_static_0200
     * @tc.level    Level.LEVEL0
     */
it('SplitPlaceholder_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {      console.info('[SplitPlaceholder_static_0200] START');
      await CommonFunc.sleep(500);
      let driver = Driver.create();
      await driver.delayMs(1000);

      let btn4 = await (driver.findComponent(ON.id('btn4')) as Promise<Component>);
      await btn4.click()
      console.info('[SplitPlaceholder_static_0200] btn4 click');
      await driver.delayMs(1000);

      let splitPlaceholderContentNode = await (driver.findComponent(ON.type('SplitPlaceholderContentNode')) as Promise<Component>);
      expect(splitPlaceholderContentNode).assertEqual(null);

      console.info('[SplitPlaceholder_static_0200] END');
      done();
    });

        
/*
     * @tc.number   SplitPlaceholder_static_0300
     * @tc.name     SplitPlaceholder_static_0300
     * @tc.desc     SplitPlaceholder_static_0300
     * @tc.level    Level.LEVEL0
     */
it('SplitPlaceholder_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {      console.info('[SplitPlaceholder_static_0300] START');
      await CommonFunc.sleep(500);
      let driver = Driver.create();
      await driver.delayMs(1000);

      let btn5 = await (driver.findComponent(ON.id('btn5')) as Promise<Component>);
      await btn5.click()
      console.info('[SplitPlaceholder_static_0300] btn5 click');
      await driver.delayMs(1000);

      let splitPlaceholderContentNode = await (driver.findComponent(ON.type('SplitPlaceholderContentNode')) as Promise<Component>);
      expect(splitPlaceholderContentNode).assertEqual(null);
      console.info('[SplitPlaceholder_static_0300] END');
      done();
    });

        
/*
     * @tc.number   SplitPlaceholder_static_0400
     * @tc.name     SplitPlaceholder_static_0400
     * @tc.desc     SplitPlaceholder_static_0400
     * @tc.level    Level.LEVEL0
     */
it('SplitPlaceholder_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {      console.info('[SplitPlaceholder_static_0400] START');
      await CommonFunc.sleep(500);
      let driver = Driver.create();
      await driver.delayMs(1000);

      let btn3 = await (driver.findComponent(ON.id('btn3')) as Promise<Component>);
      await btn3.click()
      console.info('[SplitPlaceholder_static_0400] btn3 click');
      await driver.delayMs(1000);

      let splitPlaceholderContentNode = await (driver.findComponent(ON.type('SplitPlaceholderContentNode')) as Promise<Component>);
      expect(splitPlaceholderContentNode).assertEqual(null);
      console.info('[SplitPlaceholder_static_0400] END');
      done();
    });

  })
}