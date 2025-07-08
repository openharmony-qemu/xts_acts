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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

function sleep(time: number) {
  return new Promise<string>((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok")
    }, time * 1000)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function tabJsunit() {


  describe('tabTest', () => {

    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/Tab',
      }
      try {
        const routerAlp = AppStorage.get<Router>("router",Type.from<Router>()) as Router
        routerAlp.clear();
        await sleep(1);
        let pages = routerAlp.getState();
        console.info("get Tab state success " + JSON.stringify(pages));
        if (!("Tab" == pages.name)) {
          console.info("get Tab state success " + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options)
          routerAlp.pushUrl(options)
          // console.info("push Tab page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Tab page error " + JSON.stringify(err));
      }
      await sleep(2)
    });

    afterEach(async () => {
      await sleep(1)
      console.info("Tab after each called");
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0510
     * @tc.name tabTest001
     * @tc.desc aceEtsTest
     */
    it('tabTest001_static_01', 0, async () => {
      console.info('++++++++++++++++ Tab TestCase 1 START ++++++++++++++++');
      let strJson = inspector.getInspectorByKey('tab');
      let obj = JSON.parseJsonElement(strJson);
      console.info("get inspector value is: " + JSON.stringify(obj));
      console.log(JSON.stringify(obj.getString('$type')))
      console.log('obj.$attrs.scrollable' + typeof (JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')))
      console.log('obj.$attrs.vertical' + typeof (JSON.parseJsonElement(strJson).getElement('$attrs').getString('vertical')))
      expect(obj.getString('$type')).assertEqual('Tabs')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition')).assertEqual('BarPosition.Start')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')).assertEqual('1')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('vertical')).assertEqual('true')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')).assertTrue()
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed')
      expect(Math.abs(Number(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('barWidth')) - Number(70.000000.toFixed(6))) <=1 ).assertTrue();
      expect(Math.abs(Number(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('barHeight')) - Number(150.000000.toFixed(6))) <=1 ).assertTrue();
      
      console.info('++++++++++++++++ Tab TestCase 1 End ++++++++++++++++');
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0530
     * @tc.name tabTest003
     * @tc.desc aceEtsTest
     */
    it('tabTest003_static_02', 0, async () => {
      console.info('++++++++++++++++ Tab TestCase 3 START ++++++++++++++++');
      let strJson = inspector.getInspectorByKey('tab2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("get inspector value is: " + JSON.stringify(obj));
      console.log(JSON.stringify(obj.getString('$type')))
      expect(obj.getString('$type')).assertEqual('Tabs')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition')).assertEqual('BarPosition.End')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode'))
        .assertEqual('BarMode.Scrollable,{"margin":"0.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('vertical')).assertEqual('false')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')).assertFalse()
      console.info('++++++++++++++++ Tab TestCase 3 End ++++++++++++++++');
    });
  })
}
