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
import { describe, beforeEach, it, expect, Level } from '@ohos/hypium-static/src/main/indexStatic';
import { Color } from '@ohos.arkui.component'
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
const SLEEP_TIME_L = 1000;
export default function UIPickerDisplayedItemCountTest() {
  describe('UIPickerDisplayedItemCountTest', () => {
    beforeEach(async () => {
      console.info('UIPickerDisplayedItemCountTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIPickerComponent/UIPickerDisplayedItemCount',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get UIPickerDisplayedItemCountTest state pages:' + JSON.stringify(pages));
        if (!('UIPickerDisplayedItemCount' == pages.name)) {
          console.info('get UIPickerDisplayedItemCountTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(SLEEP_TIME_L);
        }
      } catch (err) {
        console.error('push UIPickerDisplayedItemCountTest page error:' + err);
      }
      console.info('UIPickerDisplayedItemCountTest beforeEach end');
    });

    /**
     * @tc.number   SUB_ARKUI_UIPICKER_DISPLAYEDITEMCOUNT_STATIC_0010
     * @tc.name     UIPickerDisplayedItemCount_static_001
     * @tc.desc     Test UIPickerComponent displayedItemCount property with value 2 (even number, should convert to 3)
     * @tc.level    Level.LEVEL1
     * @tc.require  issuesI9MJB3
     */
    it('UIPickerDisplayedItemCount_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('UIPickerDisplayedItemCount2');
      let obj = JSON.parseJsonElement(strJson);
      let obj1: string = obj.getElement('$attrs').getString('displayedItemCount');
      expect(obj1).assertEqual('3');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_UIPICKER_DISPLAYEDITEMCOUNT_STATIC_0020
     * @tc.name     UIPickerDisplayedItemCount_static_002
     * @tc.desc     Test UIPickerComponent displayedItemCount property with value 3 (odd number in range)
     * @tc.level    Level.LEVEL1
     * @tc.require  issuesI9MJB3
     */
    it('UIPickerDisplayedItemCount_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('UIPickerDisplayedItemCount3');
      let obj = JSON.parseJsonElement(strJson);
      let obj1: string = obj.getElement('$attrs').getString('displayedItemCount');
      expect(obj1).assertEqual('3');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_UIPICKER_DISPLAYEDITEMCOUNT_STATIC_0030
     * @tc.name     UIPickerDisplayedItemCount_static_003
     * @tc.desc     Test UIPickerComponent displayedItemCount property with value 5 (odd number in range)
     * @tc.level    Level.LEVEL1
     * @tc.require  issuesI9MJB3
     */
    it('UIPickerDisplayedItemCount_static_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('UIPickerDisplayedItemCount5');
      let obj = JSON.parseJsonElement(strJson);
      let obj1: string = obj.getElement('$attrs').getString('displayedItemCount');
      expect(obj1).assertEqual('5');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_UIPICKER_DISPLAYEDITEMCOUNT_STATIC_0040
     * @tc.name     UIPickerDisplayedItemCount_static_004
     * @tc.desc     Test UIPickerComponent displayedItemCount property with value 8 (even number, should convert to 9)
     * @tc.level    Level.LEVEL1
     * @tc.require  issuesI9MJB3
     */
    it('UIPickerDisplayedItemCount_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('UIPickerDisplayedItemCount8');
      let obj = JSON.parseJsonElement(strJson);
      let obj1: string = obj.getElement('$attrs').getString('displayedItemCount');
      expect(obj1).assertEqual('9');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_UIPICKER_DISPLAYEDITEMCOUNT_STATIC_0050
     * @tc.name     UIPickerDisplayedItemCount_static_005
     * @tc.desc     Test UIPickerComponent displayedItemCount property with value 9 (max boundary)
     * @tc.level    Level.LEVEL1
     * @tc.require  issuesI9MJB3
     */
    it('UIPickerDisplayedItemCount_static_005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('UIPickerDisplayedItemCount9');
      let obj = JSON.parseJsonElement(strJson);
      let obj1: string = obj.getElement('$attrs').getString('displayedItemCount');
      expect(obj1).assertEqual('9');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_UIPICKER_DISPLAYEDITEMCOUNT_STATIC_0060
     * @tc.name     UIPickerDisplayedItemCount_static_006
     * @tc.desc     Test UIPickerComponent displayedItemCount property with undefined value (should use default 7)
     * @tc.level    Level.LEVEL1
     * @tc.require  issuesI9MJB3
     */
    it('UIPickerDisplayedItemCount_static_006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('UIPickerDisplayedItemCountUndefined');
      let obj = JSON.parseJsonElement(strJson);
      let obj1: string = obj.getElement('$attrs').getString('displayedItemCount');
      expect(obj1).assertEqual('7');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_UIPICKER_DISPLAYEDITEMCOUNT_STATIC_0080
     * @tc.name     UIPickerDisplayedItemCount_static_008
     * @tc.desc     Test UIPickerComponent displayedItemCount property with value 1 (below min range, should use default 7)
     * @tc.level    Level.LEVEL1
     * @tc.require  issuesI9MJB3
     */
    it('UIPickerDisplayedItemCount_static_008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('UIPickerDisplayedItemCount1');
      let obj = JSON.parseJsonElement(strJson);
      let obj1: string = obj.getElement('$attrs').getString('displayedItemCount');
      expect(obj1).assertEqual('7');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_UIPICKER_DISPLAYEDITEMCOUNT_STATIC_0090
     * @tc.name     UIPickerDisplayedItemCount_static_009
     * @tc.desc     Test UIPickerComponent displayedItemCount property with value 10 (above max range, should use default 7)
     * @tc.level    Level.LEVEL1
     * @tc.require  issuesI9MJB3
     */
    it('UIPickerDisplayedItemCount_static_009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('UIPickerDisplayedItemCount10');
      let obj = JSON.parseJsonElement(strJson);
      let obj1: string = obj.getElement('$attrs').getString('displayedItemCount');
      expect(obj1).assertEqual('7');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_UIPICKER_DISPLAYEDITEMCOUNT_STATIC_0110
     * @tc.name     UIPickerDisplayedItemCount_static_011
     * @tc.desc     Test UIPickerComponent displayedItemCount property with negative value -1 (out of range, should use default 7)
     * @tc.level    Level.LEVEL1
     * @tc.require  issuesI9MJB3
     */
    it('UIPickerDisplayedItemCount_static_011', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('UIPickerDisplayedItemCountNegative');
      let obj = JSON.parseJsonElement(strJson);
      let obj1: string = obj.getElement('$attrs').getString('displayedItemCount');
      expect(obj1).assertEqual('7');
      done();
    });
  })
}