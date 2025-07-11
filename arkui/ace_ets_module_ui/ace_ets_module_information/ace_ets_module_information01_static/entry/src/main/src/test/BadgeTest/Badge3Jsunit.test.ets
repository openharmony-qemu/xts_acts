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
// import {Color} from '@ohos.arkui.component'

import { describe, beforeEach, afterEach, it, expect, beforeAll } from "../../../../hypium/index";
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { BusinessError } from '@ohos.base';
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Color } from '@ohos.arkui.component'
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

// const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.information.static';

export default function badge3Jsunit() {
  describe('badge3Jsunit', () => {
    beforeAll(() => {
      console.info("badge3Jsunit beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information01.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      // config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
      //   console.info(`enable success`);
      // }).catch((err: object) => {
      //   console.error(`failed to enable, ${err}`);
      // })
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("badge after each called");
    })

    /**
     * @tc.number testBadge_static_01
     * @tc.name testBadge_static_01
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testBadge_static_01', 0, async (done: () => void): Promise<void> => {
      console.info('[testBadge_static_01] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('badge');
      console.info("[testBadge_static_01] component JSON.parse(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs').getElement('style')) + "---" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('style'));
      expect(JSON.parseJsonElement(strJson).getElement('$type')).assertEqual('Badge');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('style').getElement('fontSize'))
        .assertEqual('20.00fp');
      done();
    });

    /**
     * @tc.number testBadge_static_03
     * @tc.name testBadge_static_03
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testBadge_static_03', 0, async (done: () => void): Promise<void> => {
      console.info('[testBadge_static_03] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontSizeValue": -1,
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 63,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testBadge_static_03] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testBadge_static_03] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('badge')
      console.info("[testBadge_static_03] component objNew is: " + JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs').getElement('style') + "--" +
      JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('style'));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('style').getElement('fontSize'))
        .assertEqual('10.00vp');
      done();
    });

    /**
     * @tc.number testBadge_static_02
     * @tc.name testBadge_static_02
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testBadge_static_02', 0, async (done: () => void): Promise<void> => {
      console.info('[testBadge_static_02] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontSizeValue": "30",
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 63,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testBadge_static_02] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testBadge_static_02] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('badge');
      console.info("[testBadge_static_02] component objNew is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('style').getElement('fontSize'))
        .assertEqual('30.00fp');
    });

    /**
     * @tc.number testBadge_static_04
     * @tc.name testBadge_static_04
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testBadge_static_04', 0, async (done: () => void): Promise<void> => {
      console.info('[testBadge_static_04] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontSizeValue": "121212121",
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 63,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testBadge_static_04] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testBadge_static_04] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('badge');
      console.info("[testBadge_static_04] component objNew is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('style').getElement('fontSize'))
        .assertEqual('121212121.00fp');
      done();
    });

    /**
     * @tc.number testBadge_static_05
     * @tc.name testBadge_static_05
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testBadge_static_05', 0, async (done: () => void): Promise<void> => {
      console.info('[testBadge_static_05] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontSizeValue": "121212121vaas",
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 63,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testBadge_static_05] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testBadge_static_05] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('badge');
      console.info("[testBadge_static_05] component objNew is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      console.info("[testBadge_static_05] component style is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('style')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('style').getElement('fontSize'))
        .assertEqual('10.00vp');
      done();
    });

    /**
     * @tc.number testBadge_static_06
     * @tc.name testBadge_static_06
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testBadge_static_06', 0, async (done: () => void): Promise<void> => {
      console.info('[testBadge_static_06] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('badge2');
      console.info("[testBadge_static_06] component JSON.parse(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs')).assertEqual('Badge');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('value')).assertEqual('new');
      done();
    });

    /**
     * @tc.number testBadge_static_07
     * @tc.name testBadge_static_07
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testBadge_static_07', 0, async (done: () => void): Promise<void> => {
      console.info('[testBadge_static_07] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('badge2');
      console.info("[testBadge_static_07] component JSON.parse(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$type')).assertEqual('Badge');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('style').getElement('color'))
        .assertEqual('#FFFF0000');
      done();
    });

    /**
     * @tc.number testBadge_static_08
     * @tc.name testBadge_static_08
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testBadge_static_08', 0, async (done: () => void): Promise<void> => {
      console.info('[testBadge_static_08] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "colorValue": Color.Blue,
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 63,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testBadge_static_08] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testBadge_static_08] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('badge2');
      console.info("[testBadge_static_08] component objNew is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('style').getElement('color'))
        .assertEqual('#FF0000FF');
      done();
    });

    /**
     * @tc.number testBadge_static_09
     * @tc.name testBadge_static_09
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testBadge_static_09', 0, async (done: () => void): Promise<void> => {
      console.info('[testBadge_static_09] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "message": "test",
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 63,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testBadge_static_09] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testBadge_static_09] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('badge2');
      console.info("[testBadge_static_09] component objNew is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('value')).assertEqual('test');
      done();
    });

    /**
     * @tc.number testBadge_static_10
     * @tc.name testBadge_static_10
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testBadge_static_10', 0, async (done: () => void): Promise<void> => {
      console.info('[testBadge_static_10] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "colorValue": '',
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 64,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testBadge_static_10] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testBadge_static_10] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('badge2');
      console.info("[testBadge_static_10] component objNew is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('value').getElement('color'))
        .assertEqual('#FF0000FF');
      done();
    });

    /**
     * @tc.number testBadge_static_11
     * @tc.name testBadge_static_11
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testBadge_static_11', 0, async (done: () => void): Promise<void> => {
      console.info('[testBadge_static_11] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "colorValue": -300,
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 65,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testBadge_static_11] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testBadge_static_11] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('badge2');
      console.info("[testBadge_static_11] component objNew is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('value').getElement('color'))
        .assertEqual('#FFFFFED4');
      done();
    });

  })
}