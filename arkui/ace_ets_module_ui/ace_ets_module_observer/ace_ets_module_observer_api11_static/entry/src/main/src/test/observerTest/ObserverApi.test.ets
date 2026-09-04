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
import { describe, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';


export default function ObserverApi() {
  describe('ObserverApi', () => {
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/observer/ObserverApi',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ObserverApi state success " + JSON.stringify(pages));
        if (!("ObserverApi" == pages.name)) {
          console.info("get ObserverApi state success " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ObserverApi page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ObserverApi_test sleep err: ' + JSON.stringify(err));
      }
      console.info("ObserverApi after each called");
    });


    /**
     * @tc.number   ObserverApi_static_001
     * @tc.name     ObserverApi_static_001
     * @tc.desc     ObserverApi_static_001
     * @tc.level    Level.LEVEL0
     */
    it('ObserverApi_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ObserverApi_001] START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ObserverApi_test sleep err: ' + JSON.stringify(err));
      }

      let driver= Driver.create();
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ObserverApi_test sleep err: ' + JSON.stringify(err));
      }
      let btn1 = await driver.findComponent(ON.id('ObserverApi_ObserverOn'));
      try {
        await (btn1?.click() as Promise<void>)
      } catch (err) {
        console.info('ObserverApi_test click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('ObserverApi_test sleep err: ' + JSON.stringify(err));
      }
      console.info("[ObserverApi_001] btn1")

      let btn2 = await driver.findComponent(ON.id('ObserverApi_pushToPageTwo'));
      try {
        await (btn2?.click() as Promise<void>)
      } catch (err) {
        console.info('ObserverApi_test click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('ObserverApi_test sleep err: ' + JSON.stringify(err));
      }
      console.info("[ObserverApi_001] btn2")

      let btn3 = await driver.findComponent(ON.id('ObserverApi2_getText'));
      try {
        await (btn3?.click() as Promise<void>)
      } catch (err) {
        console.info('ObserverApi_test click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('ObserverApi_test sleep err: ' + JSON.stringify(err));
      }
      console.info("[ObserverApi_001] btn3")

      let strJson = inspector.getInspectorByKey('ObserverApi2_text');
      let obj = JSON.parseJsonElement(strJson);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ObserverApi_test sleep err: ' + JSON.stringify(err));
      }
      console.info("[ObserverApi_001] obj is: " + strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('HideAppearShow');

      let btn4 = await driver.findComponent(ON.id('ObserverApi2_backToPageOne'));
      try {
        await (btn4?.click() as Promise<void>)
      } catch (err) {
        console.info('ObserverApi_test click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('ObserverApi_test sleep err: ' + JSON.stringify(err));
      }
      console.info("[ObserverApi_001] btn4")

      let btn5 = await driver.findComponent(ON.id('ObserverApi_getText1'));
      try {
        await (btn5?.click() as Promise<void>)
      } catch (err) {
        console.info('ObserverApi_test click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('ObserverApi_test sleep err: ' + JSON.stringify(err));
      }
      console.info("[ObserverApi_001] btn5")

      let strJson2 = inspector.getInspectorByKey('ObserverApi_text1');
      let obj2 = JSON.parseJsonElement(strJson2);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ObserverApi_test sleep err: ' + JSON.stringify(err));
      }
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('Disappear');

      let btn6 = await driver.findComponent(ON.id('ObserverApi_ObserverOff'));
      try {
        await (btn6?.click() as Promise<void>)
      } catch (err) {
        console.info('ObserverApi_test click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('ObserverApi_test sleep err: ' + JSON.stringify(err));
      }

      console.info('[ObserverApi_001] END');
      done();

    });


    /**
     * @tc.number   ObserverApi_static_002
     * @tc.name     ObserverApi_static_002
     * @tc.desc     ObserverApi_static_002
     * @tc.level    Level.LEVEL0
     */
    it('ObserverApi_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ObserverApi_002] START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ObserverApi_test sleep err: ' + JSON.stringify(err));
      }

      let driver= Driver.create();
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ObserverApi_test sleep err: ' + JSON.stringify(err));
      }
      let btn1 = await driver.findComponent(ON.id('ObserverApi_ObserverOn'));
      try {
        await (btn1?.click() as Promise<void>)
      } catch (err) {
        console.info('ObserverApi_test click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('ObserverApi_test sleep err: ' + JSON.stringify(err));
      }
      console.info("[ObserverApi_002] btn1")

      let btn2 = await driver.findComponent(ON.id('ObserverApi_pushToPageTwo'));
      try {
        await (btn2?.click() as Promise<void>)
      } catch (err) {
        console.info('ObserverApi_test click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('ObserverApi_test sleep err: ' + JSON.stringify(err));
      }
      console.info("[ObserverApi_002] btn2")

      try {
        await driver.pressBack()
      } catch (err) {
        console.info('ObserverApi_test pressBack err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('ObserverApi_test sleep err: ' + JSON.stringify(err));
      }
      console.info("[ObserverApi_002] btn3")

      let btn4 = await driver.findComponent(ON.id('ObserverApi_getText2'));
      try {
        await (btn4?.click() as Promise<void>)
      } catch (err) {
        console.info('ObserverApi_test click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('ObserverApi_test sleep err: ' + JSON.stringify(err));
      }
      console.info("[ObserverApi_002] btn4")

      let strJson = inspector.getInspectorByKey('ObserverApi_text2');
      let obj = JSON.parseJsonElement(strJson);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ObserverApi_test sleep err: ' + JSON.stringify(err));
      }
      console.info("[ObserverApi_001] obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Back');

      let btn5 = await driver.findComponent(ON.id('ObserverApi_ObserverOff'));
      try {
        await (btn5?.click() as Promise<void>)
      } catch (err) {
        console.info('ObserverApi_test click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('ObserverApi_test sleep err: ' + JSON.stringify(err));
      }

      console.info('[ObserverApi_002] END');
      done();

    });

  })
}
