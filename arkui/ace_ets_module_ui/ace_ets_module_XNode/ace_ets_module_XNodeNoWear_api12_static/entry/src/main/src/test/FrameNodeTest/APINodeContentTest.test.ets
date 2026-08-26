'use static';
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
import { describe, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import { Router } from '@ohos.arkui.UIContext';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'

export default function APINodeContentTest() {
  describe('APINodeContentTest', (): void => {

    beforeEach(async (): Promise<void> => {
      console.info("APINodeContentTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/FrameNode/APINodeContent",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get APINodeContentTest state pages:" + JSON.stringify(pages));
        if (!("APINodeContent" == pages.name)) {
          console.info("get APINodeContentTest pages.name:" + JSON.stringify(pages.name));
          await routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push APINodeContentTest page error:" + err);
        expect().assertFail();
      }
      console.info("APINodeContentTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('APINodeContentTest afterEach sleep err: ' + JSON.stringify(err));
      }
      console.info('AxisEvent after each called');
    })

    /**
     * @tc.number   APINodeContentTest_static_0100
     * @tc.name     APINodeContentTest_static_0100
     * @tc.desc     APINodeContentTest_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('APINodeContentTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('APINodeContentTest_static_0100 START');
      try {
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
        let button = await driver.findComponent(ON.id('APINodeContent_Button_AddToSlot'));
        await (button!.click() as Promise<void>);
        await CommonFunc.sleep(2000);
        let button2 = await driver.findComponent(ON.id('APINodeContent_Button_get'));
        await (button2!.click() as Promise<void>);
        await CommonFunc.sleep(2000);
        let strJson: string = inspector.getInspectorByKey('APINodeContent_Text');
        let obj = JSON.parseJsonElement(strJson)
        console.info("[APINodeContentTest_static_0100] component obj is: ", obj.getElement('$attrs').getString('content'))
        console.info("[APINodeContentTest_static_0100] component obj is1: ", JSON.stringifyJsonElement(obj.getElement('$attrs')))
        expect(obj.getElement('$attrs').getString('content')).assertEqual('1');
        console.info('[APINodeContentTest_static_0100] END');
      } catch (error) {
        console.error('[APINodeContentTest_static_0100] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number   APINodeContentTest_static_0200
     * @tc.name     APINodeContentTest_static_0200
     * @tc.desc     APINodeContentTest_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('APINodeContentTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('APINodeContentTest_static_0200 START');
      try {
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
        let button1 = await driver.findComponent(ON.id('APINodeContent_Button_RemoveBack'));
        await (button1!.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let button2 = await driver.findComponent(ON.id('APINodeContent_Button_RemoveBack'));
        await (button2!.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let button3 = await driver.findComponent(ON.id('APINodeContent_Button_RemoveBack'));
        await (button3!.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let button9 = await driver.findComponent(ON.id('APINodeContent_Button_get'));
        await (button9!.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let strJson: string = inspector.getInspectorByKey('APINodeContent_Text');
        let obj = JSON.parseJsonElement(strJson);
        console.info("[APINodeContentTest_static_0200] component obj is 1 : ", obj.getElement('$attrs').getString('content'));
        expect(obj.getElement('$attrs').getString('content')).assertEqual('0');
        await CommonFunc.sleep(500);
        let button4 = await driver.findComponent(ON.id('APINodeContent_Button_AddToSlot'));
        await (button4!.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let button5 = await driver.findComponent(ON.id('APINodeContent_Button_AddToSlot'));
        await (button5!.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let button8 = await driver.findComponent(ON.id('APINodeContent_Button_get'));
        await (button8!.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let strJson2 = inspector.getInspectorByKey('APINodeContent_Text');
        let obj2 = JSON.parseJsonElement(strJson2)
        console.info("[APINodeContentTest_static_0200] component obj is 2 : ", obj2.getElement('$attrs').getString('content'));
        expect(obj2.getElement('$attrs').getString('content')).assertEqual('0');  //值是2，取到的是0
        console.info('[APINodeContentTest_static_0200] END');
      } catch (error) {
        console.error('[APINodeContentTest_static_0200] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      done();
    });
  })
}
