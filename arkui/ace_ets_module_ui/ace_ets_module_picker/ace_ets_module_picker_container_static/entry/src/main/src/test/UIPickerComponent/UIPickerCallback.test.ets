'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeEach, it, expect, Level, beforeAll, afterEach, TestType } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Component, Driver, ON, MouseButton, Rect } from '@kit.TestKit';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

const SLEEP_TIME_L = 1000;
const ITEM_COUNT: int = 12;
export default function UIPickerCallbackTest() {
  describe('UIPickerCallbackTest', () => {

    beforeAll(async (): Promise<void> => {
      console.info("UIPickerCallbackTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.container.static", "EntryAbility")
      await UtilsTest.msSleep(SLEEP_TIME_L)
    });

    beforeEach(async (): Promise<void> => {
      console.info('UIPickerCallbackTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIPickerComponent/UIPickerCallback',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get UIPickerCallbackTest state pages:' + JSON.stringify(pages));
        if (!('UIPickerCallback' == pages.name)) {
          console.info('get UIPickerCallbackTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(SLEEP_TIME_L);
        }
      } catch (err) {
        console.error('push UIPickerCallbackTest page error:' + err);
      }
      console.info('UIPickerCallbackTest beforeEach end');
    });

    /**
     * @tc.number   SUB_ARKUI_UIPICKER_ONCHANGE_CALLBACK_STATIC_0010
     * @tc.name     UIPickerCallbackOnChange_static_001
     * @tc.desc     Test OnUIPickerComponentCallback via onChange - verify selectedIndex return value is within [0, itemCount-1]
     * @tc.level    Level.LEVEL1
     */
    it('UIPickerCallbackOnChange_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('UIPickerCallbackOnChange_static_001 START');
      const driver = Driver.create();
      const picker = await driver.findComponent(ON.id('uipicker_callback_onchange'));
      console.info('UIPickerCallbackOnChange_static_001 findComponent');
      const rect = await (picker?.getBounds() as Promise<Rect>);
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;
      console.info("rectValue is" + left + " --" + right + "--" + top + "--" + bottom);
      await driver.swipe(
        Math.round((left + right) / 2).toInt(),
        Math.round((top + bottom) / 2).toInt(),
        Math.round((left + right) / 2).toInt(),
        Math.round((top + bottom) / 4).toInt(),600
      );
      await Utils.sleep(SLEEP_TIME_L);
      const indexText = await driver.findComponent(ON.id('text_callback_onchange_index'));
      const indexStr = await indexText?.getText();
      console.info('UIPickerCallbackOnChange_static_001 indexStr: ' + indexStr);
      expect(indexStr).assertContain('onChangeIndex:');
      let numStr: string = indexStr!.replace('onChangeIndex:', '');
      let selectedIndex: Double = parseInt(numStr);
      expect(selectedIndex >= 0).assertTrue();
      expect(selectedIndex < ITEM_COUNT).assertTrue();
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_UIPICKER_ONSCROLLSTOP_CALLBACK_STATIC_0010
     * @tc.name     UIPickerCallbackOnScrollStop_static_001
     * @tc.desc     Test OnUIPickerComponentCallback via onScrollStop - verify selectedIndex return value is within [0, itemCount-1]
     * @tc.level    Level.LEVEL1
     */
    it('UIPickerCallbackOnScrollStop_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('UIPickerCallbackOnScrollStop_static_001 START');
      const driver = Driver.create();
      const picker = await driver.findComponent(ON.id('uipicker_callback_onscrollstop'));
      console.info('UIPickerCallbackOnScrollStop_static_001 findComponent');
      const rect = await (picker?.getBounds() as Promise<Rect>);
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;
      console.info("rectValue is" + left + " --" + right + "--" + top + "--" + bottom);
      await driver.swipe(
        Math.round((left + right) / 2).toInt(),
        Math.round((top + bottom) / 2).toInt(),
        Math.round((left + right) / 2).toInt(),
        Math.round((top + bottom) / 4).toInt(),600
      );
      await Utils.sleep(SLEEP_TIME_L);
      const indexText = await driver.findComponent(ON.id('text_callback_onscrollstop_index'));
      const indexStr = await indexText?.getText();
      console.info('UIPickerCallbackOnScrollStop_static_001 indexStr: ' + indexStr);
      expect(indexStr).assertContain('onScrollStopIndex:');
      let numStr: string = indexStr!.replace('onScrollStopIndex:', '');
      let selectedIndex: Double = parseInt(numStr);
      expect(selectedIndex >= 0).assertTrue();
      expect(selectedIndex < ITEM_COUNT).assertTrue();
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_UIPICKER_ONCHANGE_CALLBACK_STATIC_0020
     * @tc.name     UIPickerCallbackOnChangeUndefined_static_001
     * @tc.desc     Test OnUIPickerComponentCallback with onChange(undefined) - component renders without crash
     * @tc.level    Level.LEVEL1
     */
    it('UIPickerCallbackOnChangeUndefined_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('UIPickerCallbackOnChangeUndefined_static_001 START');
      let strJson = inspector.getInspectorByKey('uipicker_callback_onchange_undefined');
      console.info('UIPickerCallbackOnChangeUndefined_static_001 strJson: ' + strJson);
      expect(strJson).assertContain('UIPickerComponent');
      let obj = JSON.parseJsonElement(strJson);
      let id: string = obj.getString('id');
      expect(id).assertEqual('uipicker_callback_onchange_undefined');
      let compType: string = obj.getString('type');
      expect(compType).assertEqual('UIPickerComponent');
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_UIPICKER_ONSCROLLSTOP_CALLBACK_STATIC_0020
     * @tc.name     UIPickerCallbackOnScrollStopUndefined_static_001
     * @tc.desc     Test OnUIPickerComponentCallback with onScrollStop(undefined) - component renders without crash
     * @tc.level    Level.LEVEL1
     */
    it('UIPickerCallbackOnScrollStopUndefined_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('UIPickerCallbackOnScrollStopUndefined_static_001 START');
      let strJson = inspector.getInspectorByKey('uipicker_callback_onscrollstop_undefined');
      console.info('UIPickerCallbackOnScrollStopUndefined_static_001 strJson: ' + strJson);
      expect(strJson).assertContain('UIPickerComponent');
      let obj = JSON.parseJsonElement(strJson);
      let id: string = obj.getString('id');
      expect(id).assertEqual('uipicker_callback_onscrollstop_undefined');
      let compType: string = obj.getString('type');
      expect(compType).assertEqual('UIPickerComponent');
      done();
    })
  })
}
