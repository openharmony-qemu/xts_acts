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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from "@ohos.arkui.UIContext";
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';


export default function search_top() {
  describe('search_top', () => {
    beforeAll(() => {
      console.info("search_top beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("search_top beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/search_top',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get search_top state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get search_top pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push search_top page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push search_top page error:" + err);
      }
      console.info("search_top beforeEach end");
    });
    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_search_top_static_001
    * @tc.name  : search_top_static_001
    * @tc.desc  : Click to trigger the keyboard when search is at the top
    * @tc.level : Level 2
    */
    it('search_top_static_001', Level.LEVEL2, async (done: () => void): Promise<void> => {

      console.info('[search_top_001] START');
      await CommonFunc.sleep(1000);

      if (AppStorage.get<number>('winLeft', Type.from<number>()) ?? 0 == 0) {
        console.log('get Initial value')
        let text_01 = CommonFunc.getComponentRect('search_top_text_01');
        let text_02 = CommonFunc.getComponentRect('search_top_text_02');
        let text_03 = CommonFunc.getComponentRect('search_top_text_03');
        let search_01 = CommonFunc.getComponentRect('search_top_search_01');
        let Column_1 = CommonFunc.getComponentRect('search_top_Column_1');

        console.log('assert position')
        expect(search_01.top).assertEqual(Column_1.top);
        console.log('search_01.top' + search_01.top)
        console.log('Column_1.top' + Column_1.top)

        let driver = Driver.create();
        await CommonFunc.sleep(500);
        const uiContext = new UIContext();
        await (driver.click(Math.round(uiContext.vp2px(200)), Math.round(uiContext.vp2px(20))) as Promise<void>);
        await CommonFunc.sleep(1000);

        expect(search_01.top).assertEqual(Column_1.top);
        console.log('search_01.top' + search_01.top)
        console.log('Column_1.top' + Column_1.top)
      }
      done();
    });
  })
}
