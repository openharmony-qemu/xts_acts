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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index";
import CommonFunc from '../../../ets/MainAbility/common/Common';
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
import { UIContext, Router } from "@ohos.arkui.UIContext";
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
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
const BUNDLE_NAME = 'com.arkui.ace.information/MainAbility';

export default function gaugeColorsJsunit2() {
  describe('gaugeColorsTest', () => {
    beforeAll(() => {
      console.info("gaugeColorsJsunit2 beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information01.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextClockApiTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/gauge/gauge1",
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
      await CommonFunc.sleep(1000);
      console.info("gaugeColors after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testgaugeColors_static_0001
     * @tc.desic         acegaugeColorsEtsTest0001
     */
    it('testgaugeColors_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('gaugeColors testgaugeColors_static_0001 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('Gauge');
      console.info("[testgaugeColors_static_0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Gauge');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual('200.00vp');
      console.info("[testgaugeColors_static_0001] width value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('width'));

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testgaugeColors_static_0002
     * @tc.desic         acegaugeColorsEtsTest0002
     */
    it('testgaugeColors_static_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('gaugeColors testgaugeColors_static_0002 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('Gauge');
      console.info("[testgaugeColors_static_0002] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Gauge');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual('200.00vp');
      console.info("[testgaugeColors_static_0002] height value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('height'));

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testgaugeColors_static_0003
     * @tc.desic         acegaugeColorsEtsTest0003
     */
    it('testgaugeColors_static_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('gaugeColors testgaugeColors_static_0003 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('Gauge');
      console.info("[testgaugeColors_static_0003] component startAngle strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Gauge');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('startAngle')).assertEqual('210.00');
      console.info("[testgaugeColors_static_0003] startAngle value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('startAngle'));

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testgaugeColors_static_0004
     * @tc.desic         acegaugeColorsEtsTest0004
     */
    it('testgaugeColors_static_0004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('gaugeColors testgaugeColors_static_0004 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('Gauge');
      console.info("[testgaugeColors_static_0004] component endAngle strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Gauge');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('endAngle')).assertEqual('150.00');
      console.info("[testgaugeColors_static_0004] endAngle value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('endAngle'));

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testgaugeColors_static_0005
     * @tc.desic         acegaugeColorsEtsTest0005
     */
    it('testgaugeColors_static_0005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('gaugeColors testgaugeColors_static_0005 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('Gauge');
      console.info("[testgaugeColors_static_0005] component strokeWidth strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Gauge');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeWidth')).assertEqual('20.00vp');
      console.info("[testgaugeColors_static_0005] strokeWidth value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeWidth'));

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testgaugeColors_static_0006
     * @tc.desic         acegaugeColorsEtsTest0006
     */
    it('testgaugeColors_static_0006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('gaugeColors testgaugeColors_static_0006 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('Gauge');
      console.info("[testgaugeColors_static_0006] component colors strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Gauge');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors'))
        .assertEqual('[[[["#FF317AF7","0.000000"]],1],[[["#FF5BA854","0.000000"]],1],[[["#FFE08C3A","0.000000"]],1],[[["#FF9C554B","0.000000"]],1],[[["#FFD94838","0.000000"]],1]]');
      console.info("[testgaugeColors_static_0006] colors value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors'));

    });
  })
}
