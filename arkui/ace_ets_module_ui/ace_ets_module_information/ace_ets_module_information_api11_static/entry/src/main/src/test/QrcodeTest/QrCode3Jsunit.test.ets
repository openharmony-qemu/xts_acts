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
import { Component, Driver, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError, RecordData } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter';
import bundle from '@ohos.bundle.bundleManager';

import accessibility from '@ohos.accessibility';
const BUNDLE_NAME = 'com.arkui.ace.information/MainAbility';

export default function qrCodeJsunit() {
  describe('qrCodeTest', () => {
    beforeAll(() => {
      console.info("qrCodeTest beforeEach start");
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.information.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async (): Promise<void> => {
  
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Qrcode/QrCode3',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get QrCode state success " + JSON.stringify(pages));
        if (!("QrCode3" == pages.name)) {
          console.info("get QrCode pages success " + JSON.stringify(pages.name));
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push QrCode page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(2000);
      console.info("QrCode after each called");
    });

    /*
     * @tc.number   test_qrCode_static_001
     * @tc.name     test_qrCode_static_001
     * @tc.desc     test_qrCode_static_001
     * @tc.level    Level.LEVEL0
     */
it('test_qrCode_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_qrCode_001] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('QrCodeColor');

      console.info("[test_qrCode_001] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor')).assertEqual('#FF008000');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('color')).assertEqual('#FF0000FF');
      done();
    });

    /*
     * @tc.number   test_qrCode_static_002
     * @tc.name     test_qrCode_static_002
     * @tc.desc     test_qrCode_static_002
     * @tc.level    Level.LEVEL0
     */
it('test_qrCode_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_qrCode_002] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "color": "#FFB6C1"
          } as Record<String, RecordData>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 170,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_qrCode_002] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[test_qrCode_002] change component color error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('QrCodeColor');

      console.info("[test_qrCode_002] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('color')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('color')).assertEqual('#FFFFB6C1');
      done();
    });

    /*
     * @tc.number   test_qrCode_static_003
     * @tc.name     test_qrCode_static_003
     * @tc.desc     test_qrCode_static_003
     * @tc.level    Level.LEVEL0
     */
it('test_qrCode_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_qrCode_003] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "backgroundColor": "#FFB6C1"
          } as Record<String, RecordData>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 171,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_qrCode_003] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[test_qrCode_003] change component color error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('QrCodeBackgroundColor');

      console.info("[test_qrCode_003] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFFB6C1');
      done();
    });

    /*
     * @tc.number   test_qrCode_static_004
     * @tc.name     test_qrCode_static_004
     * @tc.desc     test_qrCode_static_004
     * @tc.level    Level.LEVEL0
     */
it('test_qrCode_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_qrCode_004] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "color": 'a'
          } as Record<String, RecordData>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1023,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_qrCode_004] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[test_qrCode_004] change component color error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('QrCodeColor');
      let strJsonDefault = inspector.getInspectorByKey('QrCodeDefault');
      console.info("[test_qrCode_004] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[test_qrCode_004] component objDefault is: " + JSON.stringify(JSON.parseJsonElement(strJsonDefault)));
      let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
      if (targetVersion < 11) {
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('color')).assertEqual('#FF000000');
      } else {
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('color')).assertEqual(JSON.parseJsonElement(strJsonDefault).getElement('$attrs').getString('color'));
      }
      done();
    });

    /*
     * @tc.number   test_qrCode_static_005
     * @tc.name     test_qrCode_static_005
     * @tc.desc     test_qrCode_static_005
     * @tc.level    Level.LEVEL0
     */
it('test_qrCode_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_qrCode_005] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "color": 332
          } as Record<String, RecordData>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1024,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_qrCode_005] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[test_qrCode_005] change component color error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('QrCodeColor');
      console.info("[test_qrCode_005] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('color')).assertEqual('#FF00014C');
      done();
    });

    /*
     * @tc.number   test_qrCode_static_006
     * @tc.name     test_qrCode_static_006
     * @tc.desc     test_qrCode_static_006
     * @tc.level    Level.LEVEL0
     */
it('test_qrCode_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_qrCode_006] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "backgroundColor": 'b'
          } as Record<String, RecordData>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1025,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_qrCode_006] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[test_qrCode_006] change component color error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('QrCodeColor');
      let strJsonDefault = inspector.getInspectorByKey('QrCodeDefault');

      console.info("[test_qrCode_006] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[test_qrCode_006] component objDefault is: " + JSON.stringify(JSON.parseJsonElement(strJsonDefault)));
      let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
      if (targetVersion < 11) {
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFFFFFF');
      } else {
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor'))
          .assertEqual(JSON.parseJsonElement(strJsonDefault).getElement('$attrs').getString('backgroundColor'));
      }
      done();
    });

    /*
     * @tc.number   test_qrCode_static_007
     * @tc.name     test_qrCode_static_007
     * @tc.desc     test_qrCode_static_007
     * @tc.level    Level.LEVEL0
     */
it('test_qrCode_static_007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_qrCode_007] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "backgroundColor": 333
          } as Record<String, RecordData>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1026,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_qrCode_007] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[test_qrCode_007] change component color error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('QrCodeColor');

      console.info("[test_qrCode_007] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00014D');
      done();
    });
  })
}
