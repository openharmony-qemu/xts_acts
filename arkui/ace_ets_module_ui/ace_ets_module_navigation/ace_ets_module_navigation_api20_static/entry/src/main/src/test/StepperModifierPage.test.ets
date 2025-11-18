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

export default function StepperModifierPage() {
  describe('StepperModifierPage', () => {
    beforeAll(() => {

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.navigation20.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info('StepperModifierPage beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StepperModifierPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get StepperModifierPage state pages:' + JSON.stringify(pages));
        if (!('StepperModifierPage' == pages.name)) {
          console.info('get StepperModifierPage pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options)
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push StepperModifierPage page error:' + err);
      }
      console.info('StepperModifierPage beforeEach end');
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('StepperModifierPage after each called');
    });


        
/*
     * @tc.number   StepperModifierPage_static_0100
     * @tc.name     StepperModifierPage_static_0100
     * @tc.desc     StepperModifierPage_static_0100
     * @tc.level    Level.LEVEL0
     */
it('StepperModifierPage_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {      console.info('StepperModifierPage_0100 START');
      await CommonFunc.sleep(500);
      let driver = Driver.create();
      await driver.delayMs(1000);

      let changeId1= await driver!.findComponent(ON.id('changeId1'));
      await changeId1!.click()
      console.info('[StepperModifierPage_0100] changeId1 click');
      await driver.delayMs(1000);

      let StepperNext1 = await driver!.findComponent(ON.text('StepperNext1'));
      await StepperNext1!.click()
      console.info('[StepperModifierPage_0100] StepperNext1 click');
      await driver.delayMs(2000);

      let currentIndex: number = AppStorage.get<number>('currentIndex') as number
      console.log('[StepperModifierPage_0100] currentIndex value : ' + currentIndex)
      expect(currentIndex).assertEqual(3);
      AppStorage.delete('currentIndex');

      console.info('StepperModifierPage_0100 END');
      done();
    });

        
/*
     * @tc.number   StepperModifierPage_static_0200
     * @tc.name     StepperModifierPage_static_0200
     * @tc.desc     StepperModifierPage_static_0200
     * @tc.level    Level.LEVEL0
     */
it('StepperModifierPage_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {      console.info('StepperModifierPage_0200 START');
      await CommonFunc.sleep(500);
      let driver = Driver.create();
      await driver.delayMs(1000);

      let fourFinish = await driver!.findComponent(ON.text('fourFinish'));
      await fourFinish!.click()
      console.info('[StepperModifierPage_0200] fourFinish click');
      await driver.delayMs(2000);

      let currentIndex: number = AppStorage.get<number>('currentIndex') as number
      console.log('[StepperModifierPage_0200] currentIndex value : ' + currentIndex)
      expect(currentIndex).assertEqual(0);
      AppStorage.delete('currentIndex');

      console.info('StepperModifierPage_0200 END');
      done();
    });

        
/*
     * @tc.number   StepperModifierPage_static_0300
     * @tc.name     StepperModifierPage_static_0300
     * @tc.desc     StepperModifierPage_static_0300
     * @tc.level    Level.LEVEL0
     */
it('StepperModifierPage_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {      console.info('StepperModifierPage_0300 START');
      await CommonFunc.sleep(500);
      let driver = Driver.create();
      await driver.delayMs(1000);

      let changeId1 = await driver!.findComponent(ON.id('changeId1'));
      await changeId1!.click()
      console.info('[StepperModifierPage_0300] changeId1 click');
      await driver.delayMs(1000);

      let StepperNext1 = await driver!.findComponent(ON.text('StepperNext1'));
      await StepperNext1!.click()
      console.info('[StepperModifierPage_0300] StepperNext1 click');
      await driver.delayMs(1000);

      let currentIndex: number = AppStorage.get<number>('currentIndex') as number
      console.log('[StepperModifierPage_0200] currentIndex value : ' + currentIndex)
      expect(currentIndex).assertEqual(1);
      AppStorage.delete('currentIndex');

      let pendingIndex: number = AppStorage.get<number>('pendingIndex') as number
      console.log('[StepperModifierPage_0200] pendingIndex value : ' + pendingIndex)
      expect(pendingIndex).assertEqual(1);
      AppStorage.delete('pendingIndex');

      console.info('StepperModifierPage_0300 END');
      done();
    });

        
/*
     * @tc.number   StepperModifierPage_static_0400
     * @tc.name     StepperModifierPage_static_0400
     * @tc.desc     StepperModifierPage_static_0400
     * @tc.level    Level.LEVEL0
     */
it('StepperModifierPage_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {      console.info('StepperModifierPage_0400 START');
      await CommonFunc.sleep(500);
      let driver = Driver.create();
      await driver.delayMs(1000);

      let previousBtn = await driver!.findComponent(ON.text('StepperPrevious'));
      await previousBtn!.click()
      console.info('[StepperModifierPage_0400] previousBtn click');
      await driver.delayMs(1000);

      let currentIndex: number = AppStorage.get<number>('currentIndex') as number
      console.log('[StepperModifierPage_0400] currentIndex value : ' + currentIndex)
      expect(currentIndex).assertEqual(0);
      AppStorage.delete('currentIndex');

      let pendingIndex: number = AppStorage.get<number>('pendingIndex') as number
      console.log('[StepperModifierPage_0400] pendingIndex value : ' + pendingIndex)
      expect(pendingIndex).assertEqual(0);
      AppStorage.delete('pendingIndex');

      console.info('StepperModifierPage_0400 END');
      done();
    });

  })
}