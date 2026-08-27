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

import Utils from '../../../ets/MainAbility/common/Utils';
import {
  afterEach,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import { Component, Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function CustomDialogGetStateTest() {
  describe('CustomDialogGetStateTest', () => {
    const SLEEP_TIME_1000 = 1000;
    beforeEach(async (): Promise<void> => {
      console.info("CustomDialogGetStateTest beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CustomDialogGetStateTest state pages:" + JSON.stringify(pages));
        if (!("customDialogGetState" == pages.name)) {
          console.info("get  CustomDialogGetStateTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: 'MainAbility/pages/customDialog/customDialogGetState',
          })
        }
      } catch (err) {
        console.error("push CustomDialogGetStateTest page error:" + err);
      }
      console.info("CustomDialogGetStateTest foreEach end");
    });

    /**
     * @tc.number   CustomDialogGetStateTest_static_0100
     * @tc.name     CustomDialogGetStateTest_static_0100
     * @tc.desc     Test the getState interface
     * @tc.level    LEVEL0
     */
    it('CustomDialogGetStateTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'CustomDialogGetStateTest_static_0100';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create()
      try {
        await CommonFunc.sleep(SLEEP_TIME_1000);
      } catch (err) {
        console.info('CustomDialogGetStateTest sleep err: ' + JSON.stringify(err));
      }
      let btn = await driver.findComponent(ON.id('customDialog001'));
      await (btn?.click() as Promise<void>);
      try {
        await CommonFunc.sleep(SLEEP_TIME_1000);
      } catch (err) {
        console.info('CustomDialogGetStateTest sleep err: ' + JSON.stringify(err));
      }
      let strJson1 = inspector.getInspectorByKey('customDialogFlag1');
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('0');
      try {
        await Utils.sleep(SLEEP_TIME_1000)
      } catch (err) {
        console.info('CustomDialogGetStateTest sleep err: ' + JSON.stringify(err));
      }
      let strJson2 = inspector.getInspectorByKey('customDialogFlag2');
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('2');
      let btn2 = await driver.findComponent(ON.text('close dialog'));
      await (btn2?.click() as Promise<void>);
      try {
        await Utils.sleep(SLEEP_TIME_1000)
      } catch (err) {
        console.info('CustomDialogGetStateTest sleep err: ' + JSON.stringify(err));
      }
      let strJson3 = inspector.getInspectorByKey('customDialogFlag3');
      expect(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content')).assertEqual('3');
      try {
        await Utils.sleep(SLEEP_TIME_1000)
      } catch (err) {
        console.info('CustomDialogGetStateTest sleep err: ' + JSON.stringify(err));
      }
      let strJson4 = inspector.getInspectorByKey('customDialogFlag4');
      expect(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content')).assertEqual('4');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}