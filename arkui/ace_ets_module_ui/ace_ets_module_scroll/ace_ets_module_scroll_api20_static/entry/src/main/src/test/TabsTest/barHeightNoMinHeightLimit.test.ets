'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level, afterAll } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';

const MULTI_DEVICE_DEVIATION = 1;

export default function barHeightNoMinHeightLimit() {
  describe('barHeightNoMinHeightLimit', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll.api20.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('barHeightNoMinHeightLimit beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/barHeightNoMinHeightLimit',
      };
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info('get barHeightNoMinHeightLimit state pages:' + JSON.stringify(pages));
        if (!('MainAbility/pages/Tabs/barHeightNoMinHeightLimit' === pages.name)) {
          console.info('get barHeightNoMinHeightLimit pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info('push barHeightNoMinHeightLimit page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push barHeightNoMinHeightLimit page error:' + err);
      }
      console.info('barHeightNoMinHeightLimit beforeEach end');
    });

    afterAll(() => {
      const router = AppStorage.get<Router>("router") as Router
      router.back()
    });
    
    /*
     * @tc.number   barHeightNoMinHeightLimit_static_0100
     * @tc.name     barHeightNoMinHeightLimit_static_0100
     * @tc.desc     barHeightNoMinHeightLimit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('barHeightNoMinHeightLimit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[barHeightNoMinHeightLimit_static_0100] START');
      let tabContent: string = JSON.parseJsonElement(inspector.getInspectorByKey('TabContent')).getElement('$attrs').getElement('height').asString();
      let tabs: string = JSON.parseJsonElement(inspector.getInspectorByKey('Tabs')).getElement('$attrs').getElement('height').asString();
      console.info('[barHeightNoMinHeightLimit_static_0100] value:' + tabContent);
      console.info('[barHeightNoMinHeightLimit_static_0100] value:' + tabs);
      const uiContext = AppStorage.get<UIContext>('uiContext')!;
      let num1: number = Math.abs(Math.round(uiContext.vp2px(parseFloat(tabContent.split('.')[0]))));
      let num2: number = Math.abs(Math.round(uiContext.vp2px(parseFloat(tabs.split('.')[0]))));
      console.info('[barHeightNoMinHeightLimit_static_0100] value:' + JSON.stringify(num2 - num1));
      expect((num2 - num1 - Math.round(uiContext.vp2px(13))) <= MULTI_DEVICE_DEVIATION).assertTrue();
      console.info('[barHeightNoMinHeightLimit_static_0100] END');
      done();
    });

    
    /*
     * @tc.number   barHeightNoMinHeightLimit_static_0200
     * @tc.name     barHeightNoMinHeightLimit_static_0200
     * @tc.desc     barHeightNoMinHeightLimit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('barHeightNoMinHeightLimit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[barHeightNoMinHeightLimit_static_0200] START');
      let tabContent: string = JSON.parseJsonElement(inspector.getInspectorByKey('TabContent2')).getElement('$attrs').getElement('height').asString();
      let tabs: string = JSON.parseJsonElement(inspector.getInspectorByKey('Tabs2')).getElement('$attrs').getElement('height').asString();
      console.info('[barHeightNoMinHeightLimit_static_0200] value:' + tabContent);
      console.info('[barHeightNoMinHeightLimit_static_0200] value:' + tabs);
      const uiContext = AppStorage.get<UIContext>('uiContext')!;
      let num1: number = Math.abs(Math.round(uiContext.vp2px(parseFloat(tabContent.split('.')[0]))));
      let num2: number = Math.abs(Math.round(uiContext.vp2px(parseFloat(tabs.split('.')[0]))));
      console.info('[barHeightNoMinHeightLimit_static_0200] value:' + JSON.stringify(num2 - num1));
      expect((num2 - num1 - Math.round(uiContext.vp2px(56))) <= MULTI_DEVICE_DEVIATION).assertTrue();
      console.info('[barHeightNoMinHeightLimit_static_0200] END');
      done();
    });

    
    /*
     * @tc.number   barHeightNoMinHeightLimit_static_0300
     * @tc.name     barHeightNoMinHeightLimit_static_0300
     * @tc.desc     barHeightNoMinHeightLimit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('barHeightNoMinHeightLimit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[barHeightNoMinHeightLimit_static_0300] START');
      let tabContent: string = JSON.parseJsonElement(inspector.getInspectorByKey('TabContent3')).getElement('$attrs').getElement('height').asString();
      let tabs: string = JSON.parseJsonElement(inspector.getInspectorByKey('Tabs3')).getElement('$attrs').getElement('height').asString();
      console.info('[barHeightNoMinHeightLimit_static_0300] value:' + tabContent);
      console.info('[barHeightNoMinHeightLimit_static_0300] value:' + tabs);
      const uiContext = AppStorage.get<UIContext>('uiContext')!;
      let num1: number = Math.abs(Math.round(uiContext.vp2px(parseFloat(tabContent.split('.')[0]))));
      let num2: number = Math.abs(Math.round(uiContext.vp2px(parseFloat(tabs.split('.')[0]))));
      console.info('[barHeightNoMinHeightLimit_static_0300] value:' + JSON.stringify(num2 - num1));
      expect((num2 - num1 - Math.round(uiContext.vp2px(56))) <= MULTI_DEVICE_DEVIATION).assertTrue();
      console.info('[barHeightNoMinHeightLimit_static_0300] END');
      done();
    });

    
    /*
     * @tc.number   barHeightNoMinHeightLimit_static_0400
     * @tc.name     barHeightNoMinHeightLimit_static_0400
     * @tc.desc     barHeightNoMinHeightLimit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('barHeightNoMinHeightLimit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[barHeightNoMinHeightLimit_static_0400] START');
      let tabContent: string = JSON.parseJsonElement(inspector.getInspectorByKey('TabContent4')).getElement('$attrs').getElement('height').asString();
      let tabs: string = JSON.parseJsonElement(inspector.getInspectorByKey('Tabs4')).getElement('$attrs').getElement('height').asString();
      console.info('[barHeightNoMinHeightLimit_static_0400] value:' + tabContent);
      console.info('[barHeightNoMinHeightLimit_static_0400] value:' + tabs);
      const uiContext = AppStorage.get<UIContext>('uiContext')!;
      let num1: number = Math.abs(Math.round(uiContext.vp2px(parseFloat(tabContent.split('.')[0]))));
      let num2: number = Math.abs(Math.round(uiContext.vp2px(parseFloat(tabs.split('.')[0]))));
      console.info('[barHeightNoMinHeightLimit_static_0400] value:' + JSON.stringify(num2 - num1));
      expect((num2 - num1 - Math.round(uiContext.vp2px(56))) <= MULTI_DEVICE_DEVIATION).assertTrue();
      console.info('[barHeightNoMinHeightLimit_static_0400] END');
      done();
    });
  })
}
