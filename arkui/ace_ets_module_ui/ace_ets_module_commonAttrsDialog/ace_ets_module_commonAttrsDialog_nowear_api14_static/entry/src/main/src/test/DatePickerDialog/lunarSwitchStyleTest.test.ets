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
import { afterAll, afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  Point,
  PointerMatrix,
  Rect,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import display from '@ohos.display'
import { $r } from '@ohos.arkui.component'

export default function lunarSwitchStyleTest() {
  describe('lunarSwitchStyleTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("lunarSwitchStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DatePickerDialog/lunarSwitchStyleTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get lunarSwitchStyleTest state pages:" + JSON.stringify(pages));
        if (!("lunarSwitchStyleTest" == pages.name)) {
          console.info("get lunarSwitchStyleTest pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push lunarSwitchStyleTest page error:" + err);
      }
      console.info("lunarSwitchStyleTest beforeEach end");
    });

    /**
     * @tc.number   lunarSwitchStyleTest_static_0100
     * @tc.name     lunarSwitchStyleTest_static_0100
     * @tc.desc     lunarSwitchStyleTest_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('lunarSwitchStyleTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('lunarSwitchStyleTest_0100 START');
      let driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('lunarSwitchStyleTest sleep err: ' + JSON.stringify(err));
      }
      let btn1 = await driver.findComponent(ON.id('btn'));
      btn1!.click()
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('lunarSwitchStyleTest sleep err: ' + JSON.stringify(err));
      }
      let btn2 = await driver.findComponent(ON.text('确定'));
      btn2!.click()
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('lunarSwitchStyleTest sleep err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('text');
      console.info('[lunarSwitchStyleTest_0100] lunarSwitchStyleTest JSON.parseJsonElement(strJson) is: ' +
      JSON.stringify(strJson));
      console.info('[lunarSwitchStyleTest_0100] component JSON.parseJsonElement(strJson) is: ' +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info('[lunarSwitchStyleTest_0100] title: ' +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('lunarSwitchStyle');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('lunarSwitchStyleTest sleep err: ' + JSON.stringify(err));
      }
      console.info('[lunarSwitchStyleTest_0100] END');
      done();
    });
  })
}
