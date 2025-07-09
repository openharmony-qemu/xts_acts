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

import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "../../../../hypium/index"
import Utils from '../../../ets/MainAbility/common/Utils'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
export default function gridMaxCountJsunit() {
  describe('gridMaxCountTest', () => {
    beforeAll(async () => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      await UtilsTest.msSleep(4000)

      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/grid/gridAPI',
      }
      const routerAlp = AppStorage.get<Router>("router",Type.from<Router>()) as Router
      try {
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get grid state success " + JSON.stringify(pages));
        if (!("gridAPI" == pages.name)) {
          console.info("get grid state success " + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options);
          routerAlp.pushUrl(options);
          await Utils.sleep(2000);
          // console.info("push grid page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push grid page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("gridMaxCount after each called");
    });

    it('testcheckgridMaxCount0001_static_01', 0, async () => {
      console.info('testcheckgridMaxCount testcheckgridMaxCount0001_static_01 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('maxCountTest');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Grid');
      console.info("[testcheckgridMaxCount0001_static_01] selectedMaxCount value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('maxCount'));
      // let maxCount = obj.getElement('$attrs').maxCount;
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('maxCount') == 5).assertTrue();

    });

    it('testEdgeEffectOptions0002_static_02', 0, async () => {
      console.info('testEdgeEffectOptions testEdgeEffectOptions0002_static_02 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('maxCountTest');
      let obj1 = JSON.parseJsonElement(strJson);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('edgeEffectOptions').getBoolean('alwaysEnabled')).assertTrue();
      console.info("edgeEffectOptions value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getElement('edgeEffectOptions').getBoolean('alwaysEnabled'));
    });

    it('testEdgeEffectOptions0003_static_03', 0, async () => {
      console.info('testEdgeEffectOptions testEdgeEffectOptions0003_static_03 START');
      await Utils.sleep(2000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "alwaysEnabled": false
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 321,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testEdgeEffectOptions0003_static_03] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[testEdgeEffectOptions0003_static_03] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('maxCountTest');
      let obj1 = JSON.parseJsonElement(strJson);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('edgeEffectOptions').getBoolean('alwaysEnabled')).assertFalse();
      console.info("edgeEffectOptions value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getElement('edgeEffectOptions').getBoolean('alwaysEnabled'));

    });
  })
}
