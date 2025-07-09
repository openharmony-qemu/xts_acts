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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "../../../../hypium/index"
import Utils from '../../../ets/MainAbility/common/Utils'
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function scrollOnScrollBeginJsunit() {
  describe('scrollOnScrollBeginTest', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      await UtilsTest.msSleep(4000)

      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/scroll1',
      }
      try {
        const routerAlp = AppStorage.get<Router>("router",Type.from<Router>()) as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get scroll state success " + JSON.stringify(pages));
        if (!("scroll1" == pages.name)) {
          console.info("get scroll state success " + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options);
          routerAlp.pushUrl(options);
          await Utils.sleep(2000);
          // console.info("push scroll page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scroll page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("scrollOnScrollBegin after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testscrollOnScrollBegin0001
     * @tc.desic         acescrollOnScrollBeginEtsTest0001
     */
    it('testscrollOnScrollBegin0001_static_01', 0, async () => {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0001_static_01 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Scroll');
      console.info("[testscrollOnScrollBegin0001_static_01] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Scroll');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual("100.00%");
      console.info("[testscrollOnScrollBegin0001_static_01] width value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('width'));

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testscrollOnScrollBegin0002
     * @tc.desic         acescrollOnScrollBeginEtsTest0002
     */
    it('testscrollOnScrollBegin0002_static_02', 0, async () => {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0002_static_02 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Scroll');
      console.info("[testscrollOnScrollBegin0002_static_02] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Scroll');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual("100.00%");
      console.info("[testscrollOnScrollBegin0002_static_02] height value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('height'));

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testscrollOnScrollBegin0003
     * @tc.desic         acescrollOnScrollBeginEtsTest0003
     */
    it('testscrollOnScrollBegin0003_static_03', 0, async () => {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0003_static_03 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Scroll');
      console.info("[testscrollOnScrollBegin0003_static_03] component fontSize strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Scroll');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('scrollBar')).assertEqual("BarState.On");
      console.info("[testscrollOnScrollBegin0003_static_03] scrollBar value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('scrollBar'));

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testscrollOnScrollBegin0004
     * @tc.desic         acescrollOnScrollBeginEtsTest0004
     */
    it('testscrollOnScrollBegin0004_static_04', 0, async () => {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0004_static_04 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Scroll');
      console.info("[testscrollOnScrollBegin0004_static_04] component opacity strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Scroll');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('scrollBarColor')).assertEqual("#FF808080");
      console.info("[testscrollOnScrollBegin0004_static_04] scrollBarColor value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('scrollBarColor'));

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testscrollOnScrollBegin0005
     * @tc.desic         acescrollOnScrollBeginEtsTest0005
     */
    it('testscrollOnScrollBegin0005_static_05', 0, async () => {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0005_static_05 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Scroll');
      console.info("[testscrollOnScrollBegin0005_static_05] component align strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Scroll');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('scrollBarWidth')).assertEqual("30.00vp");
      console.info("[testscrollOnScrollBegin0005_static_05] scrollBarWidth value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('scrollBarWidth'));

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0012
     * @tc.name         testscrollOnScrollBegin0005
     * @tc.desic         acescrollOnScrollBeginEtsTest0006
     */
    it('testscrollOnScrollBegin0006_static_06', 0, async () => {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0006_static_06 START');
      await Utils.sleep(2000);

      let callback: (indexEvent: events_emitter.EventData) => void = (indexEvent: events_emitter.EventData) => {
        console.info("scrollOnScrollBegin get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data?.['STATUS']).assertEqual(true);
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 10086,
        priority: events_emitter.EventPriority.LOW
      }
      inspector.sendEventByKey('Scroll', 10, "")
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("scrollOnScrollBegin on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testscrollOnScrollBegin0006_static_06 END');

    });

    /**
     * @tc.number    : testscrollOnScrollBegin0007
     * @tc.name      : test edgeEffectOptions default
     * @tc.desc      : expect edgeEffectOptions.getBoolean('alwaysEnabled') false
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testscrollOnScrollBegin0007_static_07', 0, async () => {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0007_static_07 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Scroll');
      console.info("[testscrollOnScrollBegin0007_static_07] component align strJson:" + strJson);
      let obj7 = JSON.parseJsonElement(strJson);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('edgeEffectOptions').getBoolean('alwaysEnabled')).assertFalse();
      console.info("EdgeEffectOptions value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getElement('edgeEffectOptions').getBoolean('alwaysEnabled'));

    });

    /**
     * @tc.number    : testscrollOnScrollBegin0008
     * @tc.name      : test edgeEffectOptions set true
     * @tc.desc      : expect edgeEffectOptions.getBoolean('alwaysEnabled') true
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testscrollOnScrollBegin0008_static_08', 0, async () => {
      console.info('testEdgeEffectOptions testscrollOnScrollBegin0008_static_08 START');
      await Utils.sleep(2000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "getBoolean('alwaysEnabled')": true
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 323,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testscrollOnScrollBegin0008_static_08] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[testscrollOnScrollBegin0008_static_08] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Scroll');
      let obj1 = JSON.parseJsonElement(strJson);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('edgeEffectOptions').getBoolean('alwaysEnabled')).assertTrue();
      console.info("edgeEffectOptions value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getElement('edgeEffectOptions').getBoolean('alwaysEnabled'));

    });
  })
}
