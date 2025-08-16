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

export default function HomePage() {
  describe('HomePage', () => {
    beforeAll(() => {

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.navigation20.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info('HomePage beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/HomePage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get HomePage state pages:' + JSON.stringify(pages));
        if (!('HomePage' == pages.name)) {
          console.info('get HomePage pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options)
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push HomePage page error:' + err);
      }
      console.info('HomePage beforeEach end');
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('HomePage after each called');
    });


        /*
     * @tc.number   HomePage_static_0100
     * @tc.name     HomePage_static_0100
     * @tc.desc     HomePage_static_0100
     * @tc.level    Level.LEVEL0
     */
it('HomePage_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {      console.info('HomePage_0100 START');
      await CommonFunc.sleep(500);
      let driver = Driver.create();
      await driver.delayMs(1000);

      let name: string = AppStorage.get<string>('name') as string
      console.log('[HomePage_0100] name value : ' + name)
      expect(name).assertEqual('PageOne');
      AppStorage.delete('name');

      let param: string = AppStorage.get<string>('param') as string
      console.log('[HomePage_0100] param value : ' + param)
      expect(param).assertEqual('{"key":"value"}');
      AppStorage.delete('param');

      console.info('HomePage_0100 END');
      done();
    });

  })
}