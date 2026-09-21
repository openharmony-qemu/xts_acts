'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeEach, it, expect, Level, Size, TestType } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function timePickerSelectedAreaTest() {
  describe('timePickerSelectedAreaTest', () => {
    beforeEach(async (done: () => void): Promise<void> => {
      console.info('timePickerSelectedAreaTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/timePicker/timePickerSelectedArea',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get timePickerSelectedAreaTest state pages:' + JSON.stringify(pages));
        if (!('timePickerSelectedArea' == pages.name)) {
          console.info('get timePickerSelectedAreaTest pages.name:' + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await Utils.sleep(2500);
          // console.info('push timePickerSelectedAreaTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push timePickerSelectedAreaTest page error:' + err);
      }
      console.info('timePickerSelectedAreaTest beforeEach end');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_ACE_ENGINE_TIMEPICKER_SELECTEDAREA_0001
     * @tc.name     SUB_ARKUI_ACE_ENGINE_TIMEPICKER_SELECTEDAREA_0001
     * @tc.desc     SUB_ARKUI_ACE_ENGINE_TIMEPICKER_SELECTEDAREA_0001
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_ACE_ENGINE_TIMEPICKER_SELECTEDAREA_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('SUB_ARKUI_ACE_ENGINE_TIMEPICKER_SELECTEDAREA_0001 START');
        let driver = Driver.create();
        await Utils.sleep(2000);
        let timePicker = await driver.findComponent(ON.id('timePicker'));
        let rect = await timePicker!.getBounds();
        let top = rect.top;
        let left = rect.left;
        let right = rect.right;
        let bottom = rect.bottom;
        let middle = (top + bottom) / 2

        await driver.swipe(
          Math.round(left + (right - left) / 6).toInt(),
          Math.round(top + (bottom - top) / 2).toInt(),
          Math.round(left + (right - left) / 6).toInt(),
          Math.round(top).toInt());
        await Utils.sleep(6000);

        let textStr = await driver.findComponent(ON.id('textFlag'));
        let eText = await textStr!.getText();
        console.info("[SUB_ARKUI_ACE_ENGINE_TIMEPICKER_SELECTEDAREA_0001] text: " + JSON.stringify(eText));
        expect(eText).assertEqual('enter');
        console.info('[SUB_ARKUI_ACE_ENGINE_TIMEPICKER_SELECTEDAREA_0001] END');
        done();
      } catch (err) {
        console.info('SUB_ARKUI_ACE_ENGINE_TIMEPICKER_SELECTEDAREA_0001 err: ' + JSON.stringify(err));
        done();
      }
    });
  })
}
