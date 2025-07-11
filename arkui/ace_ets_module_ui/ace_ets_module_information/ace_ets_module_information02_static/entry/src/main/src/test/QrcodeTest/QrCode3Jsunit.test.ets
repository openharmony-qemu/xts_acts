/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, it, expect, beforeAll } from "../../../../hypium/index";
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import bundle from '@ohos.bundle.bundleManager';
import { BusinessError } from '@ohos.base';
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
import { Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector'
import { AppStorage } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Utils.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
const BUNDLE_NAME = 'com.arkui.ace.information/MainAbility';
// const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];

export default function qrCodeJsunit() {
  describe('qrCodeTest', () => {
    beforeAll(() => {
      console.info("qrCodeJsunit beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextClockApiTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Qrcode/QrCode3",
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

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("QrCode after each called");
    });

    it('test_qrCode_static_001', 0, async (done: () => void): Promise<void> => {
      console.info('[test_qrCode_static_001] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('QrCodeColor');

      console.info("[test_qrCode_static_001] component JSON.parse(strJson) is: " + 
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor')).assertEqual('#FF008000');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('color')).assertEqual('#FF0000FF');
      done();
    });

    it('test_qrCode_static_002', 0, async (done: () => void): Promise<void> => {
      console.info('[test_qrCode_static_002] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "color": "#FFB6C1"
          }as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 170,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_qrCode_static_002] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[test_qrCode_static_002] change component color error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson =inspector.getInspectorByKey('QrCodeColor');

      console.info("[test_qrCode_static_002] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('color')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('color')).assertEqual('#FFFFB6C1');
      done();
    });

    it('test_qrCode_static_003', 0, async (done: () => void): Promise<void> => {
      console.info('[test_qrCode_static_003] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "backgroundColor": "#FFB6C1",
          }as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 171,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_qrCode_static_003] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[test_qrCode_static_003] change component color error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson =inspector.getInspectorByKey('QrCodeBackgroundColor');

      console.info("[test_qrCode_static_003] component JSON.parse(strJson) is: " + 
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFFB6C1');
      done();
    });

    it('test_qrCode_static_004', 0, async (done: () => void): Promise<void> => {
      console.info('[test_qrCode_static_004] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "color": 'a'
          }as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1023,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_qrCode_static_004] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[test_qrCode_static_004] change component color error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('QrCodeColor');
      let strJsonDefault =inspector.getInspectorByKey('QrCodeDefault');
      console.info("[test_qrCode_static_004] component JSON.parse(strJson) is: " + strJson);
      console.info("[test_qrCode_static_004] component objDefault is: " + strJsonDefault);
      let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
      if (targetVersion < 11) {
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('color')).assertEqual('#FF000000');
      } else {
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('color')).
        assertEqual(JSON.parseJsonElement(strJsonDefault).getElement('$attrs').getString('color'));
      }
      done();
    });

    it('test_qrCode_static_005', 0, async (done: () => void): Promise<void> => {
      console.info('[test_qrCode_static_005] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "color": 332
          }as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1024,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_qrCode_static_005] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[test_qrCode_static_005] change component color error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('QrCodeColor');
      console.info("[test_qrCode_static_005] component JSON.parse(strJson) is: " + strJson);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('color')).assertEqual('#FF00014C');
      done();
    });

    it('test_qrCode_static_006', 0, async (done: () => void): Promise<void> => {
      console.info('[test_qrCode_static_006] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "backgroundColor": 'b'
          }as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1025,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_qrCode_static_006] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[test_qrCode_static_006] change component color error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson =inspector.getInspectorByKey('QrCodeColor');
      let strJsonDefault = inspector.getInspectorByKey('QrCodeDefault');

      console.info("[test_qrCode_static_006] component JSON.parse(strJson) is: " + strJson);
      console.info("[test_qrCode_static_006] component objDefault is: " + strJsonDefault);
      // 非法入参默认初始值
      let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
      if (targetVersion < 11) {
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFFFFFF');
      } else {
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor'))
          .assertEqual(JSON.parseJsonElement(strJsonDefault).getElement('$attrs').getString('backgroundColor'));
      }
      done();
    });

    it('test_qrCode_static_007', 0, async (done: () => void): Promise<void> => {
      console.info('[test_qrCode_static_007] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "backgroundColor": 333
          }as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1026,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_qrCode_static_007] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[test_qrCode_static_007] change component color error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson =inspector.getInspectorByKey('QrCodeColor');

      console.info("[test_qrCode_static_007] component JSON.parse(strJson) is: " + strJson);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00014D');
      done();
    });
  })
}
