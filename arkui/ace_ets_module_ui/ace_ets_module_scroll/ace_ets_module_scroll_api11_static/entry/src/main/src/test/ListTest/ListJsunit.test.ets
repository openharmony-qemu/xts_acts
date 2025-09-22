/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError, RecordData } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
import events_emitter from '@ohos.events.emitter';
import { Axis } from '@ohos.arkui.component'
import { EdgeEffect } from '@ohos.arkui.component'

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function listJsunit() {
  describe('listTest', () => {
    beforeAll(() => {

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("list beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/list',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages: router.RouterState = router.getState();
        console.info("get list state pages:" + JSON.stringify(pages));
        if (!("list" == pages.name)) {
          console.info("get list state pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err: Error) {
        console.error("push list page error:" + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("list after each called");
    });

    /*
     * @tc.number    testList_static_01
     * @tc.name      testList_static_01
     * @tc.desc      testList_static_01
     * @tc.level     2
     */
    it('testList_static_01', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testList_static_01] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('list');

      console.info("[testList_static_01] JSON.parse(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('listDirection'))
        .assertEqual('Axis.Vertical');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('editMode')).assertFalse();
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('edgeEffect'))
        .assertEqual('EdgeEffect.None');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('chainAnimation')).assertFalse();
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider').getElement('strokeWidth'))
        .assertEqual("2.00vp");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider').getElement('color'))
        .assertEqual("#FFFFFFFF");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider').getElement('startMargin'))
        .assertEqual("20.00vp");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider').getElement('endMargin'))
        .assertEqual("20.00vp");
      console.info('[testList_static_01] END');
      done()
    });

    /*
     * @tc.number    testList_static_02
     * @tc.name      testList_static_02
     * @tc.desc      testList_static_02
     * @tc.level     2
     */
    it('testList_static_02', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testList_static_02] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "listDirection": Axis.Horizontal
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 124,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testList_static_02] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[testList_static_02] change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJson: string = inspector.getInspectorByKey('list');

      console.info("[testList_static_02] JSON.parse(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('listDirection'))
        .assertEqual('Axis.Horizontal');
      console.info('testList_static_02 END');
      done()
    });

    /*
     * @tc.number    testList_static_03
     * @tc.name      testList_static_03
     * @tc.desc      testList_static_03
     * @tc.level     2
     */
    it('testList_static_03', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testList_static_03] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "editMode": true
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 124,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testList_static_03] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[testList_static_03] change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJson: string = inspector.getInspectorByKey('list');

      console.info("[testList_static_03] JSON.parse(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('editMode')).assertTrue();
      console.info('testList_static_03 END');
      done()
    });

    /*
     * @tc.number    testList_static_04
     * @tc.name      testList_static_04
     * @tc.desc      testList_static_04
     * @tc.level     2
     */
    it('testList_static_04', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testList_static_04] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "edgeEffect": EdgeEffect.Spring
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 124,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testList_static_04] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[testList_static_04] change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJson: string = inspector.getInspectorByKey('list');

      console.info("[testList_static_04] JSON.parse(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('edgeEffect'))
        .assertEqual('EdgeEffect.Spring');
      console.info('testList_static_04 END');
      done()
    });

    /*
     * @tc.number    testList_static_05
     * @tc.name      testList_static_05
     * @tc.desc      testList_static_05
     * @tc.level     2
     */
    it('testList_static_05', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testList_static_05] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "chainAnimation": true
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 124,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testList_static_05] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[testList_static_05] change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJson: string = inspector.getInspectorByKey('list');

      console.info("[testList_static_05] JSON.parse(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('chainAnimation')).assertTrue();
      console.info('testList_static_05 END');
      done()
    });

    /*
     * @tc.number    testList_static_06
     * @tc.name      testList_static_06
     * @tc.desc      testList_static_06
     * @tc.level     2
     */
    it('testList_static_06', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testList_static_06] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidth": "3.000000vp"
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 125,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testList_static_06] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[testList_static_06] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('list');

      console.info("[testList_static_06] JSON.parse(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider').getElement('strokeWidth'))
        .assertEqual("3.00vp");
      console.info('testList_static_06 END');
      done()
    });

    /*
     * @tc.number    testList_static_07
     * @tc.name      testList_static_07
     * @tc.desc      testList_static_07
     * @tc.level     2
     */
    it('testList_static_07', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testList_static_07] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "color": "#FF0000FF"
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 125,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testList_static_07] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[testList_static_07] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('list');

      console.info("[testList_static_07] JSON.parse(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider').getElement('color'))
        .assertEqual("#FF0000FF");
      console.info('testList_static_07 END');
      done()
    });

    /*
     * @tc.number    testList_static_08
     * @tc.name      testList_static_08
     * @tc.desc      testList_static_08
     * @tc.level     2
     */
    it('testList_static_08', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testList_static_08] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "startMargin": "30.000000vp"
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 125,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testList_static_08] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[testList_static_08] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('list');

      console.info("[testList_static_08] JSON.parse(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider').getElement('startMargin'))
        .assertEqual("30.00vp");
      console.info('testList_static_08 END');
      done()
    });

    /*
     * @tc.number    testList_static_09
     * @tc.name      testList_static_09
     * @tc.desc      testList_static_09
     * @tc.level     2
     */
    it('testList_static_09', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testList_static_09] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "endMargin": "30.000000vp"
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 125,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testList_static_09] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[testList_static_09] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('list');

      console.info("[testList_static_09] JSON.parse(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider').getElement('endMargin'))
        .assertEqual("30.00vp");
      console.info('testList_static_09 END');
      done()
    });

    /*
     * @tc.number    testList_static_10
     * @tc.name      testList_static_10
     * @tc.desc      testList_static_10
     * @tc.level     2
     */
    it('testList_static_10', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testList_static_10] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "editMode": "true123"
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 901,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testList_static_10] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[testList_static_10] change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJson: string = inspector.getInspectorByKey('list');

      console.info("[testList_static_10] JSON.parse(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('editMode')).assertTrue();
      console.info('testList_static_10 END');
      done()
    });

    /*
     * @tc.number    testList_static_11
     * @tc.name      testList_static_11
     * @tc.desc      testList_static_11
     * @tc.level     2
     */
    it('testList_static_11', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testList_static_11] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "editMode": "39000000"
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 902,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testList_static_11] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[testList_static_11] change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJson: string = inspector.getInspectorByKey('list');

      console.info("[testList_static_11] JSON.parse(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('editMode')).assertTrue();
      console.info('testList_static_11 END');
      done()
    });

    /*
     * @tc.number    testList_static_12
     * @tc.name      testList_static_12
     * @tc.desc      testList_static_12
     * @tc.level     2
     */
    it('testList_static_12', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testList_static_12] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "chainAnimation": "true123"
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 903,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testList_static_12] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[testList_static_12] change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJson: string = inspector.getInspectorByKey('list');

      console.info("[testList_static_12] JSON.parse(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('chainAnimation')).assertTrue();
      console.info('testList_static_12 END');
      done()
    });
  })
}
