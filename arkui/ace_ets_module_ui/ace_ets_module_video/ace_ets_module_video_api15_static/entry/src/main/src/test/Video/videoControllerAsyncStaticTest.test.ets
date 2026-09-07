'use static';

/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Driver,
  ON
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'

export default function videoControllerAsyncStaticTest() {
  describe('videoControllerAsyncStaticTest', () => {
    beforeEach(async () => {
      console.info("videoControllerAsyncStaticTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Video/videoControllerAsyncStatic",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get videoControllerAsyncStatic state pages: " + JSON.stringify(pages));
        if (!("videoControllerAsyncStatic" == pages.name)) {
          console.info("get videoControllerAsyncStatic state pages.name: " + JSON.stringify(pages.name));
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push videoControllerAsyncStatic page error: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   videoControllerAsyncStaticTest_0100
     * @tc.number SUB_ARKUI_API_videoControllerAsyncStaticTest_0100
     * @tc.desc   VideoAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('videoControllerAsyncStaticTest_0100', Level.LEVEL0, async (done: () => void) => {
      console.info('videoControllerAsyncStaticTest_0100 START');
      try {
        let driver = Driver.create()
        await CommonFunc.sleep(2000);

        let button = await driver.findComponent(ON.id('videoControllerAsyncSetNull'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(2000);

        let button1 = await driver.findComponent(ON.id('videoControllerAsyncSetUndefined'));
        await (button1?.click() as Promise<void>);
        await CommonFunc.sleep(2000);

        let button2 = await driver.findComponent(ON.id('videoControllerAsyncSetFalse'));
        await (button2?.click() as Promise<void>);
        await CommonFunc.sleep(2000);

        let strJson = inspector.getInspectorByKey('videoControllerAsyncText');

        let button3 = await driver.findComponent(ON.id('videoControllerAsyncStart'));
        await (button3?.click() as Promise<void>);
        await CommonFunc.sleep(2000);
        let strJson1 = inspector.getInspectorByKey('videoControllerAsyncText');
        let strJson2 = inspector.getInspectorByKey('videoControllerAsyncText1');

        let button4 = await driver.findComponent(ON.id('videoControllerAsyncPause'));
        await (button4?.click() as Promise<void>);
        await CommonFunc.sleep(2000);
        let strJson3 = inspector.getInspectorByKey('videoControllerAsyncText');

        let button5 = await driver.findComponent(ON.id('videoControllerAsyncSetTime'));
        await (button5?.click() as Promise<void>);
        await CommonFunc.sleep(2000);
        let strJson4 = inspector.getInspectorByKey('videoControllerAsyncText');

        let button6 = await driver.findComponent(ON.id('videoControllerAsyncStop'));
        await (button6?.click() as Promise<void>);
        await CommonFunc.sleep(2000);
        let strJson5 = inspector.getInspectorByKey('videoControllerAsyncText');

        let button7 = await driver.findComponent(ON.id('videoControllerAsyncReset'));
        await (button7?.click() as Promise<void>);
        await CommonFunc.sleep(2000);
        let strJson6 = inspector.getInspectorByKey('videoControllerAsyncText');
        let strJson7 = inspector.getInspectorByKey('videoControllerAsyncText1');

        let button8 = await driver.findComponent(ON.id('videoControllerAsyncRequestFullscreen'));
        await (button8?.click() as Promise<void>);
        await CommonFunc.sleep(3000);
        let strJson8 = inspector.getInspectorByKey('videoControllerAsyncText');

        let button9 = await driver.findComponent(ON.id('videoControllerAsyncStart'));
        await (button9?.click() as Promise<void>);
        await CommonFunc.sleep(20000);
        let strJson9 = inspector.getInspectorByKey('videoControllerAsyncText');

        let button10 = await driver.findComponent(ON.id('videoControllerAsyncSetTime1'));
        await (button10?.click() as Promise<void>);
        await CommonFunc.sleep(1000);

        let button11 = await driver.findComponent(ON.id('videoControllerAsyncSetTime2'));
        await (button11?.click() as Promise<void>);
        await CommonFunc.sleep(1000);

        let button12 = await driver.findComponent(ON.id('videoControllerAsyncSetTime3'));
        await (button12?.click() as Promise<void>);
        await CommonFunc.sleep(1000);

        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('onPrepared');
        expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('onStart');
        expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('onUpdate');
        expect(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content')).assertEqual('onPause');
        expect(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content')).assertEqual('setCurrentTime');
        expect(JSON.parseJsonElement(strJson5).getElement('$attrs').getString('content')).assertEqual('onStop');
        expect(JSON.parseJsonElement(strJson6).getElement('$attrs').getString('content')).assertEqual('onPrepared');
        expect(JSON.parseJsonElement(strJson7).getElement('$attrs').getString('content')).assertEqual('reset');
        expect(JSON.parseJsonElement(strJson8).getElement('$attrs').getString('content')).assertEqual('onFullscreenChange_false');
        expect(JSON.parseJsonElement(strJson9).getElement('$attrs').getString('content')).assertEqual('onFinish');

        console.info('[videoControllerAsyncStaticTest_0100] END');
      } catch (error) {
        console.error('[videoControllerAsyncStaticTest_0100] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      done();
    });

  })
}
