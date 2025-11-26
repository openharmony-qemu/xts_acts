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
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
export default function bindSheetKeyboardAvoidMode(){
  describe('bindSheetKeyboardAvoidMode',  () =>{
    beforeAll(() => {
      console.info("bindSheetKeyboardAvoidMode beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.api20.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async () => {
      console.info("bindSheetKeyboardAvoidMode beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/SheetType/keyboardAvoidMode',
      }
      try {
  const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear()
        let pages = routerInstance.getState();
        console.info("get keyboardAvoidMode state pages: " + JSON.stringify(pages));
        if (!("keyboardAvoidMode" == pages.name)) {
          console.info("get keyboardAvoidMode state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push bindSheetKeyboardAvoidMode page error: " + err);
        expect().assertFail();
      }
    });
    
    /*
     * @tc.number   bindSheetKeyboardAvoidMode_static_0100
     * @tc.name     bindSheetKeyboardAvoidMode_static_0100
     * @tc.desc     bindSheetKeyboardAvoidMode_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('bindSheetKeyboardAvoidMode_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('bindSheetKeyboardAvoidMode_0100 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(2000);
      let btn1:Component= await driver.findComponent(ON.id('popupButton')) as Component;
      await btn1.click()
      await CommonFunc.sleep(2000);
      let btn2:Component = await driver.findComponent(ON.id('ipt')) as Component;
      await btn2.click()
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('text');
      console.info("[bindSheetKeyboardAvoidMode_0100] bindSheetKeyboardAvoidMode JSON.parse(strJson) is: " + JSON.stringify(strJson));
      console.info("[bindSheetKeyboardAvoidMode_0100] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[bindSheetKeyboardAvoidMode_0100] title: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('4');
      await CommonFunc.sleep(2000);
      let btn3:Component = await driver.findComponent(ON.id('close')) as Component;
      await btn3.click()
      await CommonFunc.sleep(2000);
      console.info('[bindSheetKeyboardAvoidMode_0100] END');
      done();
    });
  })
}
