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
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function iconTabs() {
  describe('iconTabs', () => {
    beforeAll(() => {
      console.info("iconTabs beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.scroll18.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("iconTabs beforeEach start");
      const iconTabs = AppStorage.get<Router>("router",Type.from<Router>()) as Router
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/iconTabs",
      }
      try {
        iconTabs.clear();
        let pages = iconTabs.getState();
        console.info("get iconTabs state pages:" + JSON.stringify(pages));
        if (!("iconTabs" == pages.name)) {
          console.info("get iconTabs pages.name:" + JSON.stringify(pages.name));
          let result = await iconTabs.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push iconTabs page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push iconTabs page error:" + err);
      }
      console.info("iconTabs beforeEach end");
    });

    /**
     * @tc.number    iconTabs_static_001
     * @tc.name      iconTabs_static_0100
     * @tc.desc      Set the image and text content in the Tabs.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('iconTabs_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[iconTabs_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      let strJson = inspector.getInspectorByKey('tabs_icon_text');
      console.info("[iconTabs_static_0100] component obj1 is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[iconTabs_static_0100] Tabs: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[iconTabs_static_0100] cachedMaxCount2: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('cachedMaxCount')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Tabs');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('cachedMaxCount').getString('count')).assertEqual(2);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('cachedMaxCount').getString('mode')).assertEqual("TabsCacheMode.CACHE_BOTH_SIDE");

      let strJson2 = inspector.getInspectorByKey('green_icon_text');
      console.info("[iconTabs_static_0100] component obj2 is: " + JSON.stringify(JSON.parseJsonElement(strJson2)));
      console.info("[iconTabs_static_0100] TabContent: " + JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs')));
      console.info("[iconTabs_static_0100] text: " + JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('text')));
      console.info("[iconTabs_static_0100] tabBar: " + JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('tabBar')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson2).getString('$type')).assertEqual('TabContent');
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('text')).assertEqual('green');

      let btn: Component = await driver.findComponent(ON.id('cachedMaxCount_tabs_switched')) as Component;
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let strJson3 = inspector.getInspectorByKey('tabs_icon_text');
      console.info("[iconTabs_static_0100] component obj3 is: " + JSON.stringify(JSON.parseJsonElement(strJson3).getElement('$attrs')));
      console.info("[iconTabs_static_0100] cachedMaxCount2: " + JSON.stringify(JSON.parseJsonElement(strJson3).getElement('$attrs').getElement('cachedMaxCount')));
      expect(JSON.parseJsonElement(strJson3).getElement('$attrs').getElement('cachedMaxCount').getString('count')).assertEqual(2);
      expect(JSON.parseJsonElement(strJson3).getElement('$attrs').getElement('cachedMaxCount').getString('mode')).assertEqual("TabsCacheMode.CACHE_LATEST_SWITCHED");

      console.info('[iconTabs_static_0100] END');
      done();
    });
  })
}
