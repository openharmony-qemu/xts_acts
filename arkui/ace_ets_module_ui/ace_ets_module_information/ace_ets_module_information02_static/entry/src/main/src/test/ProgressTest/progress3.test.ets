/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '../../../../hypium/index'
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Utils.test';
import inspector from "@ohos.arkui.inspector";
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
// const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.information.other/MainAbility';

export default function progressScaleCountJsunit() {
  describe('progressScaleCountTest', () => {
    beforeAll(() => {
      console.info("progressScaleCountTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("progressScaleCount after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testprogressScaleCount_static_0001
     * @tc.desic         aceprogressScaleCountEtsTest0001
     */
    it('testprogressScaleCount_static_0001', 0, async (done: () => void): Promise<void> => {
      console.info('progressScaleCount testprogressScaleCount0001 START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('progressStyleOptions');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testprogressScaleCount0001] component width strJson:" + strJson);
      expect(obj.getElement('$type')).assertEqual('Progress');
      console.info("[testprogressScaleCount0001] style.scaleCount value :" + obj.getElement('$attrs').getElement('style'));
      expect(obj.getElement('$attrs').getElement('style').getElement('scaleCount')).assertEqual("15");
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testprogressScaleCount_static_0002
     * @tc.desic         aceprogressScaleCountEtsTest0002
     */
    it('testprogressScaleCount_static_0002', 0, async (done: () => void): Promise<void> => {
      console.info('progressScaleCount testprogressScaleCount0002 START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('progressStyleOptions');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testprogressScaleCount0002] component height strJson:" + strJson);
      expect(obj.getElement('$type')).assertEqual('Progress');
      console.info("[testprogressScaleCount0002] style.scaleWidth value :" + obj.getElement('$attrs').getElement('style'));
      expect(obj.getElement('$attrs').getElement('style').getElement('scaleWidth')).assertEqual('5.00vp');
      done();
    });
  })
}
