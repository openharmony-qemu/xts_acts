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

import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../../hypium/index';
import router from '@ohos.router';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON,Component } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter'
import { BusinessError, RecordData } from '@ohos.base';
import { PlaybackSpeed } from '@ohos.arkui.component';

export default function videoJsunit2() {
  describe('videoTest', () => {
    beforeAll(() => {
      
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.platform.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("video beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/video/video2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get video state pages:" + JSON.stringify(pages));
        if (!("video" == pages.name)) {
          console.info("get video state pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push video page error:" + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info("video after each called");
    });

    it('testVideoStatic01', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testVideo01] START');
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('video');
      expect(JSON.parseJsonElement(strJsonNew).getString('$type')).assertEqual('Video');
      console.info('[testVideo01] END');
      done();
    });

    it('testVideoStatic02', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testVideo02] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progressRates": PlaybackSpeed.Speed_Forward_2_00_X,
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 235,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testVideo02] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testVideo02] change component data error: " + JSON.stringify((err as BusinessError)?.message));
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('video');
      console.info("[testVideo02] component JSON.parseJsonElement(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      console.info('[testVideo02] END');
      done();
    });

    it('testVideoStatic03', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testVideo03] START ');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progressRates": PlaybackSpeed.Speed_Forward_1_75_X,
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 235,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testVideo03] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testVideo03] change component data error: " + JSON.stringify((err as BusinessError)?.message));
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('video');
      console.info("[testVideo03] component JSON.parseJsonElement(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      console.info('[testVideo03] END');
      done();
    });

    it('testVideoStatic04', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testVideo04] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progressRates": PlaybackSpeed.Speed_Forward_1_25_X,
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 235,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testVideo04] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testVideo04] change component data error: " + JSON.stringify((err as BusinessError)?.message));
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('video');
      console.info("[testVideo04] component JSON.parseJsonElement(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      console.info('[testVideo04] END');
      done();
    });

    it('testVideoStatic05', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testVideo05] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progressRates": PlaybackSpeed.Speed_Forward_1_00_X,
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 235,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testVideo05] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testVideo05] change component data error: " + JSON.stringify((err as BusinessError)?.message));
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('video');

      console.info("[testVideo05] component JSON.parseJsonElement(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      console.info('[testVideo05] END');
      done();
    });

    it('testVideoStatic06', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testVideo06] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progressRates": PlaybackSpeed.Speed_Forward_0_75_X,
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 235,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testVideo06] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testVideo06] change component data error: " + JSON.stringify((err as BusinessError)?.message));
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('video');

      console.info("[testVideo06] component JSON.parseJsonElement(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      console.info('[testVideo06] END');
      done();
    });

    it('testVideoStatic07', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testVideo07] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "isStopped": true,
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 235,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testVideo07] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testVideo07] change component data error: " + JSON.stringify((err as BusinessError)?.message));
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('video');

      console.info("[testVideo07] component JSON.parseJsonElement(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      console.info('[testVideo07] END');
      done();
    });

  });
}
