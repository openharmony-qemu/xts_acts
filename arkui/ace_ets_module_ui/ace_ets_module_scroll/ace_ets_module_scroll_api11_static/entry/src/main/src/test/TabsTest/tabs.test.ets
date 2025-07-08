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
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function tabsBarPositionJsunit() {
  describe('tabsBarPositionTest2', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      await UtilsTest.msSleep(4000)

      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/tabs2',
      }
      try {
        const routerAlp = AppStorage.get<Router>("router",Type.from<Router>()) as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get tabs state success " + JSON.stringify(pages));
        if (!("tabs2" == pages.name)) {
          console.info("get tabs state success " + JSON.stringify(pages.name));
          // let result = await routerAlp.push(options);
          routerAlp.pushUrl(options);
          await Utils.sleep(2000);
          // console.info("push tabs page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabs page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("tabsBarPosition after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testtabsBarPosition0001_static_01
     * @tc.desic         acetabsBarPositionEtsTest0001
     */
    it('testtabsBarPosition0001_static_01', 0, async () => {
      console.info('tabsBarPosition testtabsBarPosition0001_static_01 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0001_static_01] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual("100.00vp");
      console.info("[testtabsBarPosition0001_static_01] width value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('width'));

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testtabsBarPosition0002_static_02
     * @tc.desic         acetabsBarPositionEtsTest0002
     */
    it('testtabsBarPosition0002_static_02', 0, async () => {
      console.info('tabsBarPosition testtabsBarPosition0002_static_02 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0002_static_02] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual("70.00vp");
      console.info("[testtabsBarPosition0002_static_02] height value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('height'));

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testtabsBarPosition0003_static_03
     * @tc.desic         acetabsBarPositionEtsTest0003
     */
    it('testtabsBarPosition0003_static_03', 0, async () => {
      console.info('tabsBarPosition testtabsBarPosition0003_static_03 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0003_static_03] component fontSize strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontSize')).assertEqual("20.00fp");
      console.info("[testtabsBarPosition0003_static_03] fontSize value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontSize'));

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testtabsBarPosition0004_static_04
     * @tc.desic         acetabsBarPositionEtsTest0004
     */
    it('testtabsBarPosition0004_static_04', 0, async () => {
      console.info('tabsBarPosition testtabsBarPosition0004_static_04 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0004_static_04] component opacity strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('opacity')).assertEqual(1);
      console.info("[testtabsBarPosition0004_static_04] opacity value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('opacity'));

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testtabsBarPosition0005_static_05
     * @tc.desic         acetabsBarPositionEtsTest0005
     */
    it('testtabsBarPosition0005_static_05', 0, async () => {
      console.info('tabsBarPosition testtabsBarPosition0005_static_05 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0005_static_05] component align strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart");
      console.info("[testtabsBarPosition0005_static_05] align value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('align'));

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testtabsBarPosition0006_static_06
     * @tc.desic         acetabsBarPositionEtsTest0006
     */
    it('testtabsBarPosition0006_static_06', 0, async () => {
      console.info('tabsBarPosition testtabsBarPosition0006_static_06 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0006_static_06] component fontColor strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor')).assertEqual("#FFCCCCCC");
      console.info("[testtabsBarPosition0006_static_06] fontColor value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor'));

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testtabsBarPosition0007_static_07
     * @tc.desic         acetabsBarPositionEtsTest0007
     */
    it('testtabsBarPosition0007_static_07', 0, async () => {
      console.info('tabsBarPosition testtabsBarPosition0007_static_07 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0007_static_07] component lineHeight strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('lineHeight')).assertEqual("25.00fp");
      console.info("[testtabsBarPosition0007_static_07] lineHeight value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('lineHeight'));

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testtabsBarPosition0009
     * @tc.desic         acetabsBarPositionEtsTest0009
     */
    it('testtabsBarPosition0009_static_09', 0, async () => {
      console.info('tabsBarPosition testtabsBarPosition0009_static_09 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0009_static_09] component padding strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('padding')).assertEqual("10.00vp");
      console.info("[testtabsBarPosition0009_static_09] padding value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('padding'));

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testtabsBarPosition0010_static_10
     * @tc.desic         acetabsBarPositionEtsTest0010
     */
    it('testtabsBarPosition0010_static_10', 0, async () => {
      console.info('tabsBarPosition testtabsBarPosition0010_static_10 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0010_static_10] component textAlign strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.Center");
      console.info("[testtabsBarPosition0010_static_10] textAlign value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('textAlign'));

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0011
     * @tc.name         testtabsBarPosition0011_static_11
     * @tc.desic         acetabsBarPositionEtsTest0011
     */
    it('testtabsBarPosition0011_static_11', 0, async () => {
      console.info('tabsBarPosition testtabsBarPosition0011_static_11 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('barPositionTabs');
      console.info("[testtabsBarPosition0011_static_11] component barPosition strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Tabs');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition')).assertEqual("BarPosition.Start");
      console.info("[testtabsBarPosition0011_static_11] barPosition value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition'));

    });
  })
}
