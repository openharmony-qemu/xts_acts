'use static'
/*
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

import { describe, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
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
  PointerMatrix,
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
export default function bindContextMenuUndefinedTest() {
  describe('commonMenu', () => {

    beforeEach(async (): Promise<void> => {
      console.info("commonMenu beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Common/bindContextMenu',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get bindContextMenu state pages:" + JSON.stringify(pages));
        if (!("bindContextMenu" == pages.name)) {
          console.info("get bindContextMenu pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push bindContextMenu page error:" + err);
      }
      console.info("bindContextMenu beforeEach end");

    });
    afterEach(async () => {
    });

    /**
     * @tc.number    commonMenu_static_0001
     * @tc.name      commonMenu_static_0001
     * @tc.desc      test bindContextMenu
     * @tc.level     Level.LEVEL1
     */
    it('commonMenu_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[commonMenu_static_0001] START');
      let driver: Driver = Driver.create();
      let clickBtn = await driver.findComponent(ON.id('Btn_show_Click'));
      await (clickBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('Text_bindContextMenu'));
      expect(text === null).assertTrue();

      let changeBtn = await driver.findComponent(ON.id('Btn_bindContextMenu'));
      await (changeBtn?.click() as Promise<void>);
      console.info('[commonMenu_static_0001] START 000 333');
      await CommonFunc.sleep(1000);
      text = await driver.findComponent(ON.id('Text_bindContextMenu'));
      expect(await (text?.getText() as Promise<string>)).assertEqual('bindContextMenu');

      let menuItemBtn = await driver.findComponent(ON.id('menuItem'));
      await (menuItemBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (clickBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      text = await driver.findComponent(ON.id('Text_bindContextMenu'));
      expect(text === null).assertTrue();
      console.info('[commonMenu_static_0001] END');
      done();
    });
  })
}