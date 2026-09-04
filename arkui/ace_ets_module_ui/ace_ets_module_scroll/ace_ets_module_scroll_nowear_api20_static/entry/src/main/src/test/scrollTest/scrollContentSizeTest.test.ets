'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import events_emitter from '@ohos.events.emitter';
import { Color, $r } from '@ohos.arkui.component'
import {
  describe,
  beforeEach,
  it,
  expect,
  Level,
  Size,
  TestType,
  afterEach
} from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../common/Common';

import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

const HEIGHT = 500;
const WIDTH = 200;

export default function ScrollContentSizeTest() {
  describe('ScrollContentSizeTest', () => {
    const SLEEP_TIME_1000 = 1000;
    beforeEach(async (): Promise<void> => {
      console.info('ScrollContentSizeTest beforeEach start');
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get ScrollContentSizeTest state pages:' + JSON.stringify(pages));
        if (!('scrollContentSize' == pages.name)) {
          console.info('get  ScrollContentSizeTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.replaceUrl({
            url: 'MainAbility/pages/scroll/scrollContentSize',
          })
        }
      } catch (err) {
        console.error('push ScrollContentSizeTest page error:' + err);
      }
      console.info('ScrollContentSizeTest foreEach end');
    });

    /**
     * @tc.number   ScrollContentSize_static_0100
     * @tc.name     ScrollContentSize_static_0100
     * @tc.desc     ScrollContentSize_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('ScrollContentSize_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'ScrollContentSize_static_0100';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create()
      let getContentSize = await driver.findComponent(ON.id('GetContentSize'));
      await (getContentSize?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_1000);
      let strJson = inspector.getInspectorByKey('ScrollContentHeight');
      let obj = JSON.parseJsonElement(strJson);
      let contentSizeStr = obj.getElement('$attrs').getString('content');
      console.info('[ScrollContentSize_static_0100] contentSize obj is: ' + contentSizeStr);
      let contentSizeNum = Number(contentSizeStr);
      console.info('[ScrollContentSize_static_0100] contentSize number is: ' + contentSizeNum);
      let uiContext = AppStorage.get<UIContext>('uiContext')!;
      console.info('[ScrollContentSize_static_0100] contentSizeNum ' + uiContext.vp2px(contentSizeNum));
      console.info('[ScrollContentSize_static_0100] HEIGHT ' + uiContext.vp2px(HEIGHT));
      expect(Math.abs(uiContext.vp2px(contentSizeNum) - uiContext.vp2px(HEIGHT)) <= 1).assertTrue();
      console.info('[' + tagName + '] END============================');
      done();
    });

    /**
     * @tc.number   ScrollContentSize_static_0200
     * @tc.name     ScrollContentSize_static_0200
     * @tc.desc     ScrollContentSize_static_0200
     * @tc.level    Level.LEVEL2
     */
    it('ScrollContentSize_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'ScrollContentSize_static_0200';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create()
      let getContentSize = await driver.findComponent(ON.id('GetContentSize'));
      await (getContentSize?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_1000);
      let strJson = inspector.getInspectorByKey('ScrollContentWidth');
      let obj = JSON.parseJsonElement(strJson);
      let contentSizeStr = obj.getElement('$attrs').getString('content');
      console.info('[ScrollContentSize_static_0200] contentSize obj is: ' + contentSizeStr);
      let contentSizeNum = Number(contentSizeStr);
      console.info('[ScrollContentSize_static_0200] contentSize number is: ' + contentSizeNum);
      let uiContext = AppStorage.get<UIContext>('uiContext')!;
      console.info('[ScrollContentSize_static_0200] contentSizeNum ' + uiContext.vp2px(contentSizeNum));
      console.info('[ScrollContentSize_static_0200] WIDTH ' + uiContext.vp2px(WIDTH));
      expect(Math.abs(uiContext.vp2px(contentSizeNum) - uiContext.vp2px(WIDTH)) <= 1).assertTrue();
      console.info('[' + tagName + '] END============================');
      done();
    });

  })
}
