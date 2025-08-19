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

import events_emitter from '@ohos.events.emitter'
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../ets/MainAbility/common/Common';
import Utils from '../../ets/MainAbility/common/Utils';
import { Component, Driver, MouseButton, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from './Util.test';

export default function FrameNodeAnimation() {
  describe('FrameNodeAnimation', () => {
    beforeAll(() => {
      console.info("FrameNodeAnimation beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.animation20.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info('FrameNodeAnimation beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNodeAnimation',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get FrameNodeAnimation state pages:' + JSON.stringify(pages));
        if (!('FrameNodeAnimation' == pages.name)) {
          console.info('get FrameNodeAnimation pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push FrameNodeAnimation page error:' + err);
      }
      console.info('FrameNodeAnimation beforeEach end');
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('FrameNodeAnimation after each called');
    });


    /*
     * @tc.number   FrameNodeAnimation_static_001
     * @tc.name     FrameNodeAnimation_static_001
     * @tc.desc     FrameNodeAnimation_static_001
     * @tc.level    Level.LEVEL0
     */
    it('FrameNodeAnimation_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[FrameNodeAnimation_static_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let startBtn: Component = await driver.findComponent(ON.text('start')) as Component;
      startBtn?.click()
      console.info('[FrameNodeAnimation_static_001] startBtn click');
      await driver.delayMs(1000);

      let strJson: string = inspector.getInspectorByKey('CreateResultText');
      console.info('[FrameNodeAnimation_static_001] strJson: ' +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('Create:Success');
      console.info('FrameNodeAnimation_static_001 END');
      done();
    });


    /*
     * @tc.number   FrameNodeAnimation_static_002
     * @tc.name     FrameNodeAnimation_static_002
     * @tc.desc     FrameNodeAnimation_static_002
     * @tc.level    Level.LEVEL0
     */
    it('FrameNodeAnimation_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[FrameNodeAnimation_static_002] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let getBtn: Component = await driver.findComponent(ON.text('get')) as Component;
      getBtn?.click()
      console.info('[FrameNodeAnimation_static_002] getBtn click');
      await driver.delayMs(1000);

      let strJson: string = inspector.getInspectorByKey('GetResultText');
      console.info('[FrameNodeAnimation_static_002] strJson: ' +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('Get:Success');
      console.info('FrameNodeAnimation_static_002 END');
      done();
    });


    /*
     * @tc.number   FrameNodeAnimation_static_003
     * @tc.name     FrameNodeAnimation_static_003
     * @tc.desc     FrameNodeAnimation_static_003
     * @tc.level    Level.LEVEL0
     */
    it('FrameNodeAnimation_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[FrameNodeAnimation_static_003] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let cancelBtn: Component = await driver.findComponent(ON.text('cancel')) as Component;
      cancelBtn?.click()
      console.info('[FrameNodeAnimation_static_003] cancelBtn click');
      await driver.delayMs(1000);

      let strJson: string = inspector.getInspectorByKey('CancelResultText');
      console.info('[FrameNodeAnimation_static_003] strJson: ' +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('Cancel:Success');
      console.info('FrameNodeAnimation_static_003 END');
      done();
    });
  })
}