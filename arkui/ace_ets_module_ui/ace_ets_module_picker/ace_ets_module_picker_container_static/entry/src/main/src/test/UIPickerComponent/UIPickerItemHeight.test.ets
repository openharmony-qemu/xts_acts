'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeEach, it, expect, Level, beforeAll, Size, afterEach, TestType } from '../../../../hypium/index';
import { Color } from '@ohos.arkui.component'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
const SLEEP_TIME_L = 1000;
export default function UIPickerItemHeightTest() {
  describe('UIPickerItemHeightTest', () => {

    beforeAll(async (): Promise<void> => {
      console.info("UIPickerItemHeightTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.container.static", "EntryAbility")
      await UtilsTest.msSleep(1000)
    });

    beforeEach(async () => {
      console.info('UIPickerItemHeightTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIPickerComponent/UIPickerItemHeight',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get UIPickerItemHeightTest state pages:' + JSON.stringify(pages));
        if (!('UIPickerItemHeight' == pages.name)) {
          console.info('get UIPickerItemHeightTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(SLEEP_TIME_L);
        }
      } catch (err) {
        console.error('push UIPickerItemHeightTest page error:' + err);
      }
      console.info('UIPickerItemHeightTest beforeEach end');
    });

    /**
     * @tc.number   UIPickerItemHeight_static_001
     * @tc.name     UIPickerItemHeight_static_001
     * @tc.desc     Test UIPickerComponent itemHeight property with value 40vp
     * @tc.level    Level.LEVEL1
     */
    it('UIPickerItemHeight_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('UIPickerItemHeight40vp');
      let obj = JSON.parseJsonElement(strJson);
      let obj1: string = obj.getElement('$attrs').getString('itemHeight');
      expect(obj1).assertEqual('40.00vp');
      done();
    });

    /**
     * @tc.number   UIPickerItemHeight_static_002
     * @tc.name     UIPickerItemHeight_static_002
     * @tc.desc     Test UIPickerComponent itemHeight property with value 64vp
     * @tc.level    Level.LEVEL1
     */
    it('UIPickerItemHeight_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('UIPickerItemHeight64vp');
      let obj = JSON.parseJsonElement(strJson);
      let obj1: string = obj.getElement('$attrs').getString('itemHeight');
      expect(obj1).assertEqual('64.00vp');
      done();
    });

    /**
     * @tc.number   UIPickerItemHeight_static_003
     * @tc.name     UIPickerItemHeight_static_003
     * @tc.desc     Test UIPickerComponent itemHeight property with value 30vp (less than minimum 40vp, should use default 40vp)
     * @tc.level    Level.LEVEL1
     */
    it('UIPickerItemHeight_static_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('UIPickerItemHeight30vp');
      let obj = JSON.parseJsonElement(strJson);
      let obj1: string = obj.getElement('$attrs').getString('itemHeight');
      expect(obj1).assertEqual('40.00vp');
      done();
    });

    /**
     * @tc.number   UIPickerItemHeight_static_004
     * @tc.name     UIPickerItemHeight_static_004
     * @tc.desc     Test UIPickerComponent itemHeight property with value 70vp (greater than maximum 64vp, should use default 40vp)
     * @tc.level    Level.LEVEL1
     */
    it('UIPickerItemHeight_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('UIPickerItemHeight70vp');
      let obj = JSON.parseJsonElement(strJson);
      let obj1: string = obj.getElement('$attrs').getString('itemHeight');
      expect(obj1).assertEqual('40.00vp');
      done();
    });

    /**
     * @tc.number   UIPickerItemHeight_static_005
     * @tc.name     UIPickerItemHeight_static_005
     * @tc.desc     Test UIPickerComponent itemHeight property with undefined value (should use default 40vp)
     * @tc.level    Level.LEVEL1
     */
    it('UIPickerItemHeight_static_005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('UIPickerItemHeightUndefined');
      let obj = JSON.parseJsonElement(strJson);
      let obj1: string = obj.getElement('$attrs').getString('itemHeight');
      expect(obj1).assertEqual('40.00vp');
      done();
    });
  })
}