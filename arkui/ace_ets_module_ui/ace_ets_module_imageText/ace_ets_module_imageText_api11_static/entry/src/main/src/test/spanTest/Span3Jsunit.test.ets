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

import { describe, beforeEach, afterEach, it, expect, Level,beforeAll } from '../../../../hypium/index';
import { TextCase } from '@ohos.arkui.component';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from "@ohos.arkui.UIContext";
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';


export default function span3Jsunit() {
  describe('span3Jsunit', () => {
    beforeAll(() => {
      console.info("span3Jsunit beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("span3Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/span3Jsunit',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get span3Jsunit state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get span3Jsunit pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push span3Jsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push span3Jsunit page error:" + err);
      }
      console.info("span3Jsunit beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(2000);
      console.info("span after each called");
    });

    it('testSpan_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testSpan001] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('decoration');
      console.info("[testSpan001] component strJson:" + strJson);

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('decoration').getString('type'))
        .assertEqual('TextDecorationType.None');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('decoration').getString('color'))
        .assertEqual('#FFFF0000');
      done();
    });

    it('testSpan_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testSpan002] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('decoration');
      console.info("[testSpan002] component strJson:" + strJson);

      console.info("[testSpan002] textCase:" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('textCase'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('textCase')).assertEqual('TextCase.Normal');
      done();
    });

    it('testSpan_static_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testSpan003] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textCaseValue": TextCase.UpperCase
          } as Record<String, Object>
        }

        let indexEvent: events_emitter.InnerEvent = {
          eventId: 200,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSpan003] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err: Error) {
        console.log("[testSpan003] change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJson = inspector.getInspectorByKey('decoration');
      console.info("[testSpan003] component strJson:" + strJson);

      console.info("[testSpan003] textCase:" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('textCase'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('textCase'))
        .assertEqual('TextCase.UpperCase');
      done();
    });

    it('testSpan_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testSpan004] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('fontColor');
      console.info("[testSpan004] component strJson:" + strJson);

      console.info("[testSpan004] fontColor:" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor')).assertEqual('#FFCCCCCC');
      done();
    });

    it('testSpan_static_005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testSpan005] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontColorValue": '#FF000990'
          } as Record<String, Object>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 201,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSpan005] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err: Error) {
        console.log("[testSpan005] change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJson = inspector.getInspectorByKey('fontColor');
      console.info("[testSpan005] component strJson:" + strJson);

      console.info("[testSpan005] fontColor:" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor')).assertEqual('#FF000990');
      done();
    });

    it('testSpan_static_006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testSpan006] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textCaseValue": undefined!
          } as Record<String, Object>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 1029,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSpan006] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err: Error) {
        console.log("[testSpan006] change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJson = inspector.getInspectorByKey('decoration');
      console.info("[testSpan006] component strJson:" + strJson);

      console.info("[testSpan006] textCase:" + JSON.parseJsonElement(strJson));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('textCase'))
        .assertEqual('TextCase.UpperCase');
      done();
    });

    it('testSpan_static_007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testSpan007] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textCaseValue": -1
          } as Record<String, Object>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 1030,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSpan007] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err: Error) {
        console.log("[testSpan007] change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJson = inspector.getInspectorByKey('decoration');
      console.info("[testSpan007] component strJson:" + strJson);

      console.info("[testSpan007] textCase:" + JSON.parseJsonElement(strJson));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('textCase'))
        .assertEqual('TextCase.UpperCase');
      done();
    });
  })
}