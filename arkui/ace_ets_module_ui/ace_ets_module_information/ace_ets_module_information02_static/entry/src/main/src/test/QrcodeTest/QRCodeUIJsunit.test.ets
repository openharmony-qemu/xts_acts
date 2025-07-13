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
import {Color} from '@ohos.arkui.component'
import inspector from '@ohos.arkui.inspector'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "../../../../hypium/index";
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import bundle from '@ohos.bundle.bundleManager';
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { QRCodePageMessage } from "../../../ets/MainAbility/pages/Qrcode/QRCodePage";
import { UtilsTest } from '../Utils.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
const BUNDLE_NAME = 'com.arkui.ace.information02.qrcode.static/MainAbility';

// const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
export default function QRCodeUIJsunit() {
  describe('QRCodeUIJsunit', () => {
    beforeAll(() => {
      console.info("QRCodeUIJsunit beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextClockApiTest beforeEach start");
      // config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
      //   console.info(`enable success`);
      // }).catch((err: object) => {
      //   console.error(`failed to enable, ${err}`);
      // })
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Qrcode/QRCodePage",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router",  Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextClockApiTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get TextClockApiTest pages.name:" + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TextClockApiTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextClockApiTest page error:" + err);
      }
      console.info("TextClockApiTest beforeEach end");
    });
    

    it('QRCodeUIJsunit_static_0100', 0, async (done: () => void): Promise<void> => {
      // Get the information of the QRCode component
      console.info('[QRCodeUIJsunit_static_0100] START');
      let strJson = inspector.getInspectorByKey('qr');
      let strJsonDefault = inspector.getInspectorByKey('qrDefault');
      let obj = JSON.parseJsonElement(strJson);
      let objDefault = JSON.parseJsonElement(strJsonDefault);
      console.info("[QRCodeUIJsunit_static_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[QRCodeUIJsunit_static_0100] component objDefault is: " + JSON.stringifyJsonElement(objDefault));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('value')).assertEqual('normal');
      let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
      if (targetVersion < 11) {
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('color')).assertEqual('#FF000000');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFFFFFF');
      } else {
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('color')).assertEqual(objDefault.getElement('$attrs').getString('color'));
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor')).assertEqual(objDefault.getElement('$attrs').getString('backgroundColor'));
      }
      console.info('[QRCodeUIJsunit_static_0100] END');
      done();
    });

    it('QRCodeUIJsunit_static_0200', 0, async (done: () => void): Promise<void> => {
      // Modify the color of the QRCode component
      console.info('[QRCodeUIJsunit_static_0200] START');
      let qrCodePageMessage = AppStorage.get<QRCodePageMessage>("QRCodePage", Type.from<QRCodePageMessage>()) as QRCodePageMessage
      qrCodePageMessage.message.notify({name:'QRCodeColor',value:Color.Yellow})
      await CommonFunc.sleep(2000);
      // Get the color of the QRCode component
      let strJson = inspector.getInspectorByKey('qr1');
      let obj = JSON.parseJsonElement(strJson);;
      console.info("[QRCodeUIJsunit_static_0200] component obj is: " + JSON.stringifyJsonElement(obj));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('color')).assertEqual('#FFFFFF00');
      console.info('[QRCodeUIJsunit_static_0200] END');
      done();
    });

    it('QRCodeUIJsunit_static_0300', 0, async (done: () => void): Promise<void> => {
      // Modify the backgroundColor of the QRCode component
      console.info('[QRCodeUIJsunit_static_0300] START');
      let qrCodePageMessage = AppStorage.get<QRCodePageMessage>("QRCodePage", Type.from<QRCodePageMessage>()) as QRCodePageMessage
      qrCodePageMessage.message.notify({name:'backgroundColor',value:Color.Green})
      await CommonFunc.sleep(1000);
      // Get the backgroundColor of the QRCode component
      let strJson = inspector.getInspectorByKey('qr2');
      let obj = JSON.parseJsonElement(strJson);;
      console.info("[QRCodeUIJsunit_static_0300] component obj is: " + JSON.stringifyJsonElement(obj));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor')).assertEqual('#FF008000');
      console.info('[QRCodeUIJsunit_static_0300] END');
      done();
    });

    it('QRCodeUIJsunit_static_0400', 0, async (done: () => void): Promise<void> => {
      // Modify the value of the QRCode component
      console.info('[QRCodeUIJsunit_static_0400] START');
      let qrCodePageMessage = AppStorage.get<QRCodePageMessage>("QRCodePage", Type.from<QRCodePageMessage>()) as QRCodePageMessage
      qrCodePageMessage.message.notify({name:'QRCodeValue',value:'myTest'})
      await CommonFunc.sleep(2000);
      // Get the value of the QRCode component
      let strJson = inspector.getInspectorByKey('qr1');
      let obj = JSON.parseJsonElement(strJson);;
      console.info("[QRCodeUIJsunit_static_0400] component obj is: " + JSON.stringifyJsonElement(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('value')).assertEqual('myTest');
      console.info('[QRCodeUIJsunit_static_0400] END');
      done();
    });

    it('QRCodeUIJsunit_static_0500', 0, async (done: () => void): Promise<void> => {
      // Illegal modification of the QRCode component value
      console.info('[QRCodeUIJsunit_static_0500] START');
      let qrCodePageMessage = AppStorage.get<QRCodePageMessage>("QRCodePage", Type.from<QRCodePageMessage>()) as QRCodePageMessage
      qrCodePageMessage.message.notify({name:'QRCodeColor',value:1})
      await CommonFunc.sleep(1000);
      qrCodePageMessage.message.notify({name:'QRCodeValue',value:-10})
      await CommonFunc.sleep(1000);
      // Get the color and value of the QRCode component
      let strJson = inspector.getInspectorByKey('qr1');
      let obj = JSON.parseJsonElement(strJson);;
      console.info("[QRCodeUIJsunit_static_0500] component obj is: " + JSON.stringifyJsonElement(obj));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('color')).assertEqual('#FF000001');
      expect(obj.getElement('$attrs').getString('value')).assertEqual('-10');

      // Get the backgroundColor of the QRCode component
      qrCodePageMessage.message.notify({name:'backgroundColor',value:'test'})

      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('qr2');
      let strJsonDefault = inspector.getInspectorByKey('qrDefault');
      let obj1 = JSON.parseJsonElement(strJson1);
      let objDefault = JSON.parseJsonElement(strJsonDefault);
      console.info("[QRCodeUIJsunit_static_0500] component obj1 is: " + JSON.stringifyJsonElement(obj1));
      console.info("[QRCodeUIJsunit_static_0500] component objDefault is: " + JSON.stringifyJsonElement(objDefault));
      let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
      if (targetVersion < 11) {
        expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFFFFFF');
      } else {
        expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual(objDefault.getElement('$attrs').getString('backgroundColor'));
      }
      console.info('[QRCodeUIJsunit_static_0500] END');
      done();
    });

    it('QRCodeUIJsunit_static_0600', 0, async (done: () => void): Promise<void> => {
      // Verify that component QRCode only supports click events
      console.info('[QRCodeUIJsunit_static_0600] START');
      let driver =  Driver.create()
      let qrComponent = await driver!.findComponent(ON.id('qr'));
      await (qrComponent?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let textComponent = await driver.findComponent(ON.id('text'));
      let text = await textComponent!.getText();
      expect(text).assertEqual('click succ');
      console.info('[QRCodeUIJsunit_static_0600] END');
      done();
    });
  })
}
