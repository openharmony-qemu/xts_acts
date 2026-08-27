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
import { describe, beforeEach, it, expect, Level, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function SelectOptionSymbolIconTest() {
  describe('SelectOptionSymbolIconTest', () => {
    const SLEEP_TIME_1000 = 1000;
    const SLEEP_TIME_500 = 500;
    beforeEach(async (): Promise<void> => {
      console.info("SelectOptionSymbolIconTest beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SelectOptionSymbolIconTest state pages:" + JSON.stringify(pages));
        if (!("selectOptionSymbolIcon" == pages.name)) {
          console.info("get  SelectOptionSymbolIconTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: 'MainAbility/pages/select/selectOptionSymbolIcon',
          })
        }
      } catch (err) {
        console.error("push SelectOptionSymbolIconTest page error:" + err);
      }
      console.info("SelectOptionSymbolIconTest foreEach end");
    });

    /**
     * @tc.number   selectOptionSymbolIcon_static_0100
     * @tc.name     selectOptionSymbolIcon_static_0100
     * @tc.desc     Test the symbolIcon interface
     * @tc.level    LEVEL2
     */
    it('selectOptionSymbolIcon_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'selectOptionSymbolIcon_static_0100';
      console.info('[' + tagName + '] START============================');
      let driver =  Driver.create();
      let btn = await driver.findComponent(ON.id('selectOptions001'));
      btn?.click();
      try {
        await Utils.sleep(SLEEP_TIME_500);
      } catch (err) {
        console.info('SelectOptionSymbolIconTest sleep err: ' + JSON.stringify(err));
      }
      let select = await driver.findComponent(ON.text('aaa'));
      select?.click();
      try {
        await Utils.sleep(SLEEP_TIME_500);
      } catch (err) {
        console.info('SelectOptionSymbolIconTest sleep err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('symbolIconValue');
      let obj = JSON.parseJsonElement(strJson);
      let content1 = obj.getElement('$attrs').getString('content');
      console.info("[selectOptionSymbolIcon_static_0100] selectOptionSymbolIcon is: " + content1);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('sys.symbol.ohos_wifi');
      btn?.click();
      try {
        await Utils.sleep(SLEEP_TIME_500);
      } catch (err) {
        console.info('SelectOptionSymbolIconTest sleep err: ' + JSON.stringify(err));
      }
      let select1 = await driver.findComponent(ON.text('bbb'));
      select1?.click();
      try {
        await Utils.sleep(SLEEP_TIME_500);
      } catch (err) {
        console.info('SelectOptionSymbolIconTest sleep err: ' + JSON.stringify(err));
      }
      let strJson1 = inspector.getInspectorByKey('symbolIconValue');
      let obj1 = JSON.parseJsonElement(strJson1);
      let content2 = obj1.getElement('$attrs').getString('content');
      console.info("[selectOptionSymbolIcon_static_0100] selectOptionSymbolIcon is: " + content2);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('');
      btn?.click();
      try {
        await Utils.sleep(SLEEP_TIME_500);
      } catch (err) {
        console.info('SelectOptionSymbolIconTest sleep err: ' + JSON.stringify(err));
      }
      let select2 = await driver.findComponent(ON.text('ccc'));
      select2?.click();
      try {
        await Utils.sleep(SLEEP_TIME_500);
      } catch (err) {
        console.info('SelectOptionSymbolIconTest sleep err: ' + JSON.stringify(err));
      }
      let strJson2 = inspector.getInspectorByKey('symbolIconValue');
      let obj2 = JSON.parseJsonElement(strJson2);
      let content3 = obj2.getElement('$attrs').getString('content');
      console.info("[selectOptionSymbolIcon_static_0100] selectOptionSymbolIcon is: " + content3);
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('sys.symbol.ohos_star');
      btn?.click();
      try {
        await Utils.sleep(SLEEP_TIME_500);
      } catch (err) {
        console.info('SelectOptionSymbolIconTest sleep err: ' + JSON.stringify(err));
      }
      let select3 = await driver.findComponent(ON.text('ddd'));
      select3?.click();
      try {
        await Utils.sleep(SLEEP_TIME_500);
      } catch (err) {
        console.info('SelectOptionSymbolIconTest sleep err: ' + JSON.stringify(err));
      }
      let strJson3 = inspector.getInspectorByKey('symbolIconValue');
      let obj3 = JSON.parseJsonElement(strJson3);
      let content4 = obj3.getElement('$attrs').getString('content');
      console.info("[selectOptionSymbolIcon_static_0100] selectOptionSymbolIcon is: " + content4);
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('');
      console.info('[' + tagName + '] END============================');
      done();
    });
  })
}
