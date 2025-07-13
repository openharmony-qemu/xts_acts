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

import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import { Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from "@ohos.arkui.inspector";
import { Color } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Utils.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function progressJsunit() {
  describe('progressTest', () => {
    beforeAll(() => {
      console.info("progressTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("progress after each called");
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name testProgress_static_100
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testProgress_static_100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testProgress_100 START');
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('LPValue');
      console.info("testProgress_100 component objLP is: " + JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('value'));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "value": 100
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 164,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testProgress_100 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("testProgress_100 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('LPValue');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testProgress_100 component JSON.parse(strJson) is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('value')));
      expect(obj.getElement('$attrs').getElement('value')).assertEqual("100.000000");
      console.info('testProgress_100 END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name testProgress_static_200
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testProgress_static_200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testProgress_200] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('LPValue');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testProgress_200 component JSON.parse(strJson) is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(obj.getElement('$attrs').getElement('width')).assertEqual("200.00vp");
      console.info('testProgress_200 END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name testProgress_static_300
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testProgress_static_300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testProgress_300 START');
      let strJson1 = inspector.getInspectorByKey('EPValue');
      console.info("testProgress_300 component objEP is: " + JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('value'));
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "value": 100
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 165,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testProgress_300 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("testProgress_300 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('EPValue');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testProgress_300 component JSON.parse(strJson) is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(obj.getElement('$attrs').getElement('value')).assertEqual("100.000000");
      console.info('testProgress_300 END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name testProgress_static_400
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testProgress_static_400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testProgress_400] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('LPValue');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testProgress_400 component JSON.parse(strJson) is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(obj.getElement('$attrs').getElement('width')).assertEqual("200.00vp");
      console.info('testProgress_400 END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name testProgress_static_500
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testProgress_static_500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testProgress_500 START');
      let strJson1 = inspector.getInspectorByKey('CPValue');
      console.info("testProgress_500 component objCP is: " + JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('value'));
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "value": 100
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 166,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testProgress_500 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("testProgress_500 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('EPValue');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testProgress_500 component JSON.parse(strJson) is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(obj.getElement('$attrs').getElement('value')).assertEqual("100.000000");
      console.info('testProgress_500 END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name testProgress_static_600
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testProgress_static_600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testProgress_600] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('CPValue');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testProgress_600 component JSON.parse(strJson) is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(obj.getElement('$attrs').getElement('width')).assertEqual("100.00vp");
      console.info('testProgress_600 END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name testProgress_static_700
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testProgress_static_700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testProgress_700 START');
      let strJson1 = inspector.getInspectorByKey('LPValue');
      console.info("testProgress_700 component objLP is: " + JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('value'));
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "value": 0
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 167,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testProgress_700 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("testProgress_700 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('LPValue');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testProgress_700 component JSON.parse(strJson) is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(obj.getElement('$attrs').getElement('value')).assertEqual("0.000000");
      console.info('testProgress_700 END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name testProgress_static_800
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testProgress_static_800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testProgress_800 START');
      let strJson1 = inspector.getInspectorByKey('EPValue');
      console.info("testProgress_800 component objEP is: " + JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('value'));
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "value": 0
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 168,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testProgress_800 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("testProgress_800 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('EPValue');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testProgress_800 component JSON.parse(strJson) is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(obj.getElement('$attrs').getElement('value')).assertEqual("0.000000");
      console.info('testProgress_800 END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name testProgress_static_900
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testProgress_static_900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testProgress_900 START');
      let strJson1 = inspector.getInspectorByKey('CPValue');
      console.info("testProgress_900 component objCP is: " + JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('value'));
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "value": 0
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 169,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testProgress_900 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("testProgress_900 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('EPValue');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testProgress_900 component JSON.parse(strJson) is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(obj.getElement('$attrs').getElement('value')).assertEqual("0.000000");
      console.info('testProgress_900 END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name testProgress_static_1000
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testProgress_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testProgress_1000 START');
      let strJson1 = inspector.getInspectorByKey('LPValue');
      console.info("testProgress_1000 component objLP is: " + JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('value'));
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "value": -5
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1021,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testProgress_1000 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("testProgress_1000 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('LPValue');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testProgress_1000 component JSON.parse(strJson) is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      // 非法入参默认初始值
      expect(obj.getElement('$attrs').getElement('value')).assertEqual("0.000000");
      console.info('testProgress_1000 END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name testProgress_static_1100
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testProgress_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testProgress_1100 START');
      let strJson1 = inspector.getInspectorByKey('LPValue');
      console.info("testProgress_1100 component objLP is: " + JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('value'));
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "value": 121212121
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1022,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testProgress_1100 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("testProgress_1100 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('LPValue');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testProgress_1100 component JSON.parse(strJson) is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      // 非法入参默认初始值
      expect(obj.getElement('$attrs').getElement('value')).assertEqual("100.000000");
      console.info('testProgress_1100 END');
      done();
    });
  })
}