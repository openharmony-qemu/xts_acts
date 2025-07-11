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


import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '../../../../hypium/index'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from "@ohos.arkui.inspector";
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

// const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.information.other/MainAbility';

export default function progressStyleJsunit() {
  describe('progressStyleTest', () => {
    beforeAll(() => {
      console.info("progressStyleTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("progressStyle after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testprogressStyle_static_0001
     * @tc.desic         aceprogressStyleEtsTest0001
     */
    it('testprogressStyle_static_0001', 0, async (done: () => void): Promise<void> => {
      console.info('progressStyle testprogressStyle0001 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('Progress');
      console.info("[testprogressStyle0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$type')).assertEqual('Progress');
      expect(obj.getElement('$attrs').getElement('width')).assertEqual("100.00vp");
      console.info("[testprogressStyle0001] width value :" + obj.getElement('$attrs').getElement('width'));

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testprogressStyle_static_0002
     * @tc.desic         aceprogressStyleEtsTest0002
     */
    it('testprogressStyle_static_0002', 0, async (done: () => void): Promise<void> => {
      console.info('progressStyle testprogressStyle0002 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('Progress');
      console.info("[testprogressStyle0002] component color strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$type')).assertEqual('Progress');
      expect(obj.getElement('$attrs').getElement('color')).assertEqual("#FF008000");
      console.info("[testprogressStyle0002] color value :" + obj.getElement('$attrs').getElement('color'));

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testprogressStyle_static_0003
     * @tc.desic         aceprogressStyleEtsTest0003
     */
    it('testprogressStyle_static_0003', 0, async (done: () => void): Promise<void> => {
      console.info('progressStyle testprogressStyle0003 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('Progress');
      console.info("[testprogressStyle0003] component value strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$type')).assertEqual('Progress');
      expect(obj.getElement('$attrs').getElement('value')).assertEqual("50.000000");
      console.info("[testprogressStyle0003] value value :" + obj.getElement('$attrs').getElement('value'));

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testprogressStyle_static_0004
     * @tc.desic         aceprogressStyleEtsTest0004
     */
    it('testprogressStyle_static_0004', 0, async (done: () => void): Promise<void> => {
      console.info('progressStyle testprogressStyle0004 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('Progress');
      console.info("[testprogressStyle0004] component style strokeWidth strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$type')).assertEqual('Progress');
      console.info("[testprogressStyle0004] component style strokeWidth strJson:" + obj.getElement('$attrs').getElement('style'));
      let jsonObject = obj.getElement('$attrs').getElement('style');
      expect(jsonObject.getElement('strokeWidth')).assertEqual("20.00vp");

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testprogressStyle_static_0005
     * @tc.desic         aceprogressStyleEtsTest0005
     */
    it('testprogressStyle_static_0005', 0, async (done: () => void): Promise<void> => {
      console.info('progressStyle testprogressStyle0005 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('Progress');
      console.info("[testprogressStyle0005] component style scaleCount strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$type')).assertEqual('Progress');
      let jsonObject = obj.getElement('$attrs').getElement('style');
      expect(jsonObject.getElement('scaleCount')).assertEqual("30");

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testprogressStyle_static_0006
     * @tc.desic         aceprogressStyleEtsTest0006
     */
    it('testprogressStyle_static_0006', 0, async (done: () => void): Promise<void> => {
      console.info('progressStyle testprogressStyle0006 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('Progress');
      console.info("[testprogressStyle0006] component style scaleWidth strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$type')).assertEqual('Progress');
      let jsonObject = obj.getElement('$attrs').getElement('style');
      expect(jsonObject.getElement('scaleWidth')).assertEqual("20.00vp");

    });
  })
}
