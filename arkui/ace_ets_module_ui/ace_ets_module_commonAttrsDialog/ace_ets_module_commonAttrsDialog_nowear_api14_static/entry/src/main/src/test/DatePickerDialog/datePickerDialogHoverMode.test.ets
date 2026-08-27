'use static';
/**
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
import { afterAll, afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  Point,
  PointerMatrix,
  Rect,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import display from '@ohos.display'
import { $r } from '@ohos.arkui.component'

export default function datePickerDialogHoverMode() {
  describe('datePickerDialogHoverMode', () => {
    beforeEach(async (): Promise<void> => {
      console.info("datePickerDialogHoverMode beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DatePickerDialog/datePickerDialogHoverMode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get datePickerDialogHoverMode state pages:" + JSON.stringify(pages));
        if (!("datePickerDialogHoverMode" == pages.name)) {
          console.info("get datePickerDialogHoverMode pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push datePickerDialogHoverMode page error:" + err);
      }
      console.info("datePickerDialogHoverMode beforeEach end");
    });

    afterEach(async () => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('datePickerDialogHoverMode sleep err: ' + JSON.stringify(err));
      }
      console.info("MultiNavigation after each called");
    });


    /**
     * @tc.number   datePickerDialogHoverMode_static_0100
     * @tc.name     datePickerDialogHoverMode_static_0100
     * @tc.desc     datePickerDialogHoverMode_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('datePickerDialogHoverMode_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('datePickerDialogHoverMode_0100 START');
      if (display.isFoldable() && display.getFoldStatus() == 3) {
        let driver = Driver.create()
        try {
          await CommonFunc.sleep(1000);
        } catch (err) {
          console.info('datePickerDialogHoverMode sleep err: ' + JSON.stringify(err));
        }
        let col = await driver.findComponent(ON.id('col'))
        let height = await (col?.getBoundsCenter() as Promise<Point>)
        console.info('col is' + height.y)
        let btn1 = await driver.findComponent(ON.id('btn1'));
        btn1!.click()
        try {
          await CommonFunc.sleep(1000);
        } catch (err) {
          console.info('datePickerDialogHoverMode sleep err: ' + JSON.stringify(err));
        }
        let btn2 = await driver.findComponent(ON.id('datePickerDialog'));
        btn2!.click()
        try {
          await CommonFunc.sleep(1000);
        } catch (err) {
          console.info('datePickerDialogHoverMode sleep err: ' + JSON.stringify(err));
        }
        let btn4 = await driver.findComponent(ON.text('确定'))
        let rect = await (btn4?.getBounds() as Promise<Rect>)
        console.info(`rect is: ` + JSON.stringify(rect))
        expect(rect.top - height.y < 0).assertTrue();
        try {
          await CommonFunc.sleep(1000);
        } catch (err) {
          console.info('datePickerDialogHoverMode sleep err: ' + JSON.stringify(err));
        }
        btn4!.click()
        try {
          await CommonFunc.sleep(1000);
        } catch (err) {
          console.info('datePickerDialogHoverMode sleep err: ' + JSON.stringify(err));
        }
      }
      console.info('[datePickerDialogHoverMode_0100] END');
      done();
    });


    /**
     * @tc.number   datePickerDialogHoverMode_static_0200
     * @tc.name     datePickerDialogHoverMode_static_0200
     * @tc.desc     datePickerDialogHoverMode_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('datePickerDialogHoverMode_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('datePickerDialogHoverMode_0200 START');
      if (display.isFoldable() && display.getFoldStatus() == 3) {
        let driver = Driver.create()
        try {
          await CommonFunc.sleep(1000);
        } catch (err) {
          console.info('datePickerDialogHoverMode sleep err: ' + JSON.stringify(err));
        }
        let col = await driver.findComponent(ON.id('col'))
        let height = await (col?.getBoundsCenter() as Promise<Point>)
        console.info('col is' + height.y)
        let btn1 = await driver.findComponent(ON.id('btn1'));
        btn1!.click()
        try {
          await CommonFunc.sleep(1000);
        } catch (err) {
          console.info('datePickerDialogHoverMode sleep err: ' + JSON.stringify(err));
        }
        let btn2 = await driver.findComponent(ON.id('btn2'));
        btn2!.click()
        try {
          await CommonFunc.sleep(1000);
        } catch (err) {
          console.info('datePickerDialogHoverMode sleep err: ' + JSON.stringify(err));
        }
        let btn3 = await driver.findComponent(ON.id('datePickerDialog'))
        btn3!.click()
        try {
          await CommonFunc.sleep(1000);
        } catch (err) {
          console.info('datePickerDialogHoverMode sleep err: ' + JSON.stringify(err));
        }
        let btn4 = await driver.findComponent(ON.text('确定'))
        let rect = await (btn4?.getBounds() as Promise<Rect>)
        console.info(`rect is: ` + JSON.stringify(rect))
        expect(rect.top - height.y > 0).assertTrue();
        try {
          await CommonFunc.sleep(1000);
        } catch (err) {
          console.info('datePickerDialogHoverMode sleep err: ' + JSON.stringify(err));
        }
        btn4!.click()
        try {
          await CommonFunc.sleep(1000);
        } catch (err) {
          console.info('datePickerDialogHoverMode sleep err: ' + JSON.stringify(err));
        }
      }
      console.info('[datePickerDialogHoverMode_0200] END');
      done();
    });
  })
}
