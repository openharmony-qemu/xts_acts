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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON,MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function APIgetUIFontConfigJsunit() {
  describe('APIgetUIFontConfigJsunit', () => {
    beforeAll(() => {
      console.info("APIgetUIFontConfigJsunit beforeEach start");

      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async (): Promise<void> => {
      console.info("APIgetUIFontConfigJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/font/APIgetUIFontConfig',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get APIgetUIFontConfigJsunit state pages:" + JSON.stringify(pages));
        if (!("APIgetUIFontConfig" == pages.name)) {
          console.info("get APIgetUIFontConfigJsunit state pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push APIgetUIFontConfigJsunit page error:" + err);
        expect().assertFail();
      }
    });

    /*
     * @tc.number   APIgetUIFontConfigJsunit_static_0100
     * @tc.name     APIgetUIFontConfigJsunit_static_0100
     * @tc.desc     APIgetUIFontConfigJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('APIgetUIFontConfigJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('APIgetUIFontConfigJsunit_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let btn1 = await driver.findComponent(ON.id('APIgetUIFontConfigButton'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strcontent = inspector.getInspectorByKey('APIgetUIFontConfigText');
      let obj = JSON.parseJsonElement(strcontent);
      await CommonFunc.sleep(1000);
      console.info('APIgetUIFontConfigJsunit_0100 component obj is: ' + obj);
      console.info('APIgetUIFontConfigJsunit_0100 component obj.$attrs.content is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('1');
      console.info('APIgetUIFontConfigJsunit_0100 END')
      done();
    });
  })
}