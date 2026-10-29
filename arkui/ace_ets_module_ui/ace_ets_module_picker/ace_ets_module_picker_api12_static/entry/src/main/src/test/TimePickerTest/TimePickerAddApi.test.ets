'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

const uiContext = AppStorage.get<UIContext>("uiContext")

export default function TimePickerAddApi() {
  describe('TimePickerAddApi', () => {
    beforeEach(async () => {
      console.info("TimePickerAddApi beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TimePicker/TimePickerAddApi',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TimePickerAddApi state pages: " + JSON.stringify(pages));
        if (!("TimePickerAddApi" == pages.name)) {
          console.info("get TimePickerAddApi state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options)
          // let result = await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TimePickerAddApi page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TimePickerAddApi page error: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   TimePickerAddApi_static_001
     * @tc.name     TimePickerAddApi_static_001
     * @tc.desc     TimePickerAddApi_static_001
     * @tc.level    Level.LEVEL3
     */
    it('TimePickerAddApi_static_001', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[TimePickerAddApi_static_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let timePickerComp = await driver.findComponent(ON.id('TimePickerAddApi'));
      let displayId = await timePickerComp!.getDisplayId();
      let rect = await timePickerComp!.getBounds();
      let left = rect.left;
      let top = rect.top;
      let right = rect.right;
      let bottom = rect.bottom;
      console.info('[TimePickerAddApi_static_001] rect is: ' + JSON.stringify(rect));
      await CommonFunc.sleep(500);
      let swipeX = Math.round(left + (right - left) / 6).toInt();
      let startY = Math.round(top + (bottom - top) / 2).toInt();
      let endY = Math.round(top).toInt();
      console.info(
        '[TimePickerAddApi_static_001] swipe from (' + swipeX + ',' + startY + ') to (' + swipeX + ',' + endY + ')');
      await driver.swipeBetween(
        {
          x: swipeX,
          y: startY,
          displayId: displayId
        },
        {
          x: swipeX,
          y: endY,
          displayId: displayId
        },
        600);
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('TimePickerAddApiText');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TimePicker_001] component obj is: " + JSON.stringifyJsonElement(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content')).assertEqual('second');
      console.info('[TimePicker_001] END');
      done();
    });

    /**
     * @tc.number   TimePickerAddApi_static_002
     * @tc.name     TimePickerAddApi_static_002
     * @tc.desc     TimePickerAddApi_static_002
     * @tc.level    Level.LEVEL3
     */
    it('TimePickerAddApi_static_002', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[TimePickerAddApi_static_001] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('TimePickerAddApi2');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TimePicker_001] component obj is: " + JSON.stringifyJsonElement(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('label')).assertEqual('TimePickerDialog');

      console.info('[TimePicker_001] END');
      done();
    });
  })
}
