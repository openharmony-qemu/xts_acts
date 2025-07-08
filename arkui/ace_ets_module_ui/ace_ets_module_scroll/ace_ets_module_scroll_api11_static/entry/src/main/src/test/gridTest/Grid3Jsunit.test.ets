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
import { describe, beforeEach, afterEach, it, expect, beforeAll } from "../../../../hypium/index"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
export default function gridJsunit() {
  describe('grid3Test', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info('beforeEach ===================grid test beforeEach called===================');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/grid/gridPage',
      }
      const routerAlp = AppStorage.get<Router>("router",Type.from<Router>()) as Router
      try {
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info('beforeEach get prompt state pages:' + JSON.stringify(pages));
        if (!('gridPage' == pages.name)) {
          console.info('beforeEach get prompt state pages.name:' + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options);
          routerAlp.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info('beforeEach push prompt page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('beforeEach push prompt page error:' + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('[ afterEach ] ===================grid test after each called===================');
    });

    it('gridTest01_static_01', 0, async (done: () => void): Promise<void> => {
      console.info('gridTest01_static_01==================== start');
      await CommonFunc.sleep(1000)
      let strJson = inspector.getInspectorByKey('grid');

      console.info('gridTest01 all attribute before change is: ' + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('columnsGap')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnsGap')).assertEqual('2.00px')
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "columnsGap": '3px'
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 110,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('gridTest01 start to publish emit')
        events_emitter.emit(innerEvent, eventData)
      } catch (err: Error) {
        console.log('gridTest01 change component data error: ' + err.message)
      }
      await CommonFunc.sleep(1000)
      let strJsonAfterChange = inspector.getInspectorByKey('grid');
      console.info('gridTest01 columnsGap attribute after change is: ' + JSON.stringify(JSON.parseJsonElement(strJsonAfterChange)
        .getElement('$attrs')
        .getString('columnsGap')));
      expect(JSON.parseJsonElement(strJsonAfterChange).getElement('$attrs').getString('columnsGap')).assertEqual('3.00px')
      console.info('[gridTest01_static_01] ==================== end');
      done();
    });

    it('gridTest02_static_02', 0, async (done: () => void): Promise<void> => {
      console.info('[ gridTest02_static_02 ] ==================== start');
      await CommonFunc.sleep(1000)
      let strJson = inspector.getInspectorByKey('grid');

      console.info('[ gridTest02 ] attribute rowsGap before change is: ' + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('rowsGap')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('rowsGap')).assertEqual('2.00px')
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rowsGap": '3px'
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 111,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[ gridTest02 ] start to publish emit')
        events_emitter.emit(innerEvent, eventData)
      } catch (err: Error) {
        console.log('[ gridTest02 ] change component data error: ' + err.message)
      }
      await CommonFunc.sleep(1000)
      let strJsonAfterChange = inspector.getInspectorByKey('grid');
      console.info('[ gridTest02 ] attribute rowsGap after change is: ' + JSON.stringify(JSON.parseJsonElement(strJsonAfterChange)
        .getElement('$attrs')
        .getString('rowsGap')));
      expect(JSON.parseJsonElement(strJsonAfterChange).getElement('$attrs').getString('rowsGap')).assertEqual('3.00px')
      console.info('[ gridTest02_static_02 ] ==================== end');
      done();
    });

    it('gridTest03_static_03', 0, async (done: () => void): Promise<void> => {
      console.info('[ gridTest03_static_03 ] ==================== start');
      await CommonFunc.sleep(1000)
      let strJson = inspector.getInspectorByKey('grid');

      console.info('[ gridTest03 ] attribute columnsTemplate before change is: ' + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('columnsTemplate')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnsTemplate')).assertEqual('1fr 1fr 1fr 1fr 1fr')
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "columnsTemplate": '1fr 1fr 1fr 1fr'
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 112,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[ gridTest03 ] start to publish emit')
        events_emitter.emit(innerEvent, eventData)
      } catch (err: Error) {
        console.log('[ gridTest03 ] change component data error: ' + err.message)
      }
      await CommonFunc.sleep(1000)
      let strJsonAfterChange = inspector.getInspectorByKey('grid');
      console.info('[ gridTest03 ] attribute columnsTemplate after change is: ' + JSON.stringify(JSON.parseJsonElement(strJsonAfterChange)
        .getElement('$attrs')
        .getString('columnsTemplate')));
      expect(JSON.parseJsonElement(strJsonAfterChange).getElement('$attrs').getString('columnsTemplate')).assertEqual('1fr 1fr 1fr 1fr')
      console.info('[ gridTest03_static_03 ] ==================== end');
      done();
    });

    it('gridTest04_static_04', 0, async (done: () => void): Promise<void> => {
      console.info('[ gridTest04_static_04 ] ==================== start');
      await CommonFunc.sleep(1000)
      let strJson = inspector.getInspectorByKey('grid');

      console.info('[ gridTest04 ] attribute rowsTemplate before change is: ' + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('rowsTemplate')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('rowsTemplate')).assertEqual('1fr 1fr 1fr 1fr 1fr')
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rowsTemplate": '1fr 1fr 1fr 1fr'
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 113,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[ gridTest04 ] start to publish emit')
        events_emitter.emit(innerEvent, eventData)
      } catch (err: Error) {
        console.log('[ gridTest04 ] change component data error: ' + err.message)
      }
      await CommonFunc.sleep(1000)
      let strJsonAfterChange = inspector.getInspectorByKey('grid');
      console.info('[ gridTest04 ] attribute rowsTemplate after change is: ' + JSON.stringify(JSON.parseJsonElement(strJsonAfterChange)
        .getElement('$attrs')
        .getString('rowsTemplate')));
      expect(JSON.parseJsonElement(strJsonAfterChange).getElement('$attrs').getString('rowsTemplate')).assertEqual('1fr 1fr 1fr 1fr')
      console.info('[ gridTest04_static_04 ] ==================== end');
      done();
    });
  })
}
