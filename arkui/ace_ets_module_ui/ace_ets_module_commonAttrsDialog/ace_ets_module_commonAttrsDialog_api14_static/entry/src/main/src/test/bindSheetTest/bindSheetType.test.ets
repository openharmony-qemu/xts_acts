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
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, Point, Rect, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import display from '@ohos.display';
// const uiContext = new UIContext()

export default function bindSheetType() {
  describe('bindSheetType', () => {
    beforeEach(async (): Promise<void> => {
      console.info("bindSheetType beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/bindSheetTest/bindSheetType',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get bindSheetType state pages:" + JSON.stringify(pages));
        if (!("bindSheetType" == pages.name)) {
          console.info("get bindSheetType pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push bindSheetType page error:" + err);
      }
      console.info("bindSheetType beforeEach end");
    });



/**
     * @tc.number   bindSheetType_static_0100
     * @tc.name     bindSheetType_static_0100
     * @tc.desc     bindSheetType_static_0100
     * @tc.level    Level.LEVEL0
     */
it('bindSheetType_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('bindSheetType_0100 START');
        let driver =  Driver.create()
        await CommonFunc.sleep(1000);
        let button = await driver.findComponent(ON.id('btn'));
         await (button?.click() as Promise<void>)
        await CommonFunc.sleep(1000);
        let col = await driver.findComponent(ON.id('col'));
        let rect = await (col?.getBounds() as Promise<Rect>);
        console.info(`rect is: ` + JSON.stringify(rect))
        let colWidth = rect.right - rect.left
        let button1 = await driver.findComponent(ON.id('changeType'));
         await (button1?.click() as Promise<void>)
        await CommonFunc.sleep(1000);
        let strJson = inspector.getInspectorByKey('sheetTypeValue');
        let obj = JSON.parseJsonElement(strJson);
        console.info("[bindSheetType_0100] component obj is: " + JSON.stringify(obj));
        console.info("[bindSheetType_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
        if (UIContext.resolveUIContext()!.px2vp(colWidth) - 840 >= 0) {
          expect(obj.getElement('$attrs').getString('content')).assertEqual("value SheetType:2");
          let button2 = await driver.findComponent(ON.id('close'));
           await (button2?.click() as Promise<void>)
          await CommonFunc.sleep(1000);
          console.info('[bindSheetType_0100] END');
        } else if (UIContext.resolveUIContext()!.px2vp(colWidth) - 840 < 0 && UIContext.resolveUIContext()!.px2vp(colWidth) - 600 >= 0 && display.isFoldable() &&
          (display.getFoldStatus() == 3 || display.getFoldStatus() == 1)) {
          expect(obj.getElement('$attrs').getString('content')).assertEqual("value SheetType:2");
          let button2 = await driver.findComponent(ON.id('close'));
           await (button2?.click() as Promise<void>)
          await CommonFunc.sleep(1000);
          console.info('[bindSheetType_0100] END');
        } else {
          expect(obj.getElement('$attrs').getString('content')).assertEqual("value SheetType:0");
          let button2 = await driver.findComponent(ON.id('close'));
           await (button2?.click() as Promise<void>)
          await CommonFunc.sleep(1000);
          console.info('[bindSheetType_0100] END');
        }
      } catch (err) {
        console.info('bindSheetType_0100 err: ' + JSON.stringify(err));
      }
      done();
    });
  })
}
