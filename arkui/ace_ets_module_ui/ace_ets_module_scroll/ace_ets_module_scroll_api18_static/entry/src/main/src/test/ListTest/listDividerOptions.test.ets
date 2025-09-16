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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { AppStorage } from '@ohos.arkui.stateManagement'
import {
  Entry,
  Text,
  TextAttribute,
  Column,
  Button,
  ButtonAttribute,
  ClickEvent,
  Image,
  ImageFit,
  Scroller,
} from '@ohos.arkui.component'
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test.ets';

export default function listDividerOptions() {
  describe('listDividerOptions', () => {
    beforeAll(() => {
      console.info("listDividerOptions beforeEach start");

      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.scroll18.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("listDividerOptions beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/listDividerOptions",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get listDividerOptions state pages:" + JSON.stringify(pages));
        if (!("listDividerOptions" == pages.name)) {
          console.info("get listDividerOptions pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push listDividerOptions page error:" + err);
      }
      console.info("listDividerOptions beforeEach end");

    });


    /*
     * @tc.number    listDividerOptions_static_0100
     * @tc.name      listDividerOptions_static_0100
     * @tc.desc      listDividerOptions_static_0100
     * @tc.level     2
     */
    it('listDividerOptions_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[listDividerOptions_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      let btnEvent: Component = await driver.findComponent(ON.id('set_DividerOptions')) as Component;
      await btnEvent.click();
      await CommonFunc.sleep(1500);
      let strJson = inspector.getInspectorByKey('list_DividerOptions');
      console.info("[listDividerOptions_static_0100] component obj is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      console.info("[listDividerOptions_static_0100] type: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$type')));
      console.info("[listDividerOptions_static_0100] divider: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$type')).assertEqual("List");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider').getElement('strokeWidth'))
        .assertEqual("2.00vp");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider').getElement('startMargin'))
        .assertEqual("10.00vp");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider').getElement('endMargin'))
        .assertEqual("10.00vp");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider').getElement('color'))
        .assertEqual("#FF0000FF");
      console.info('[listDividerOptions_static_0100] END');
      done();
    });
  })
}
