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

import { describe, beforeEach, afterEach, afterAll, it, expect,Level } from '../../../../../hypium/index';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import RectValue  from '../../../../ets/MainAbility/common/Rect';
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import router from '@ohos.router';

import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function StartAndEnd() {
  describe('StartAndEnd', () => {
    beforeEach(async (): Promise<void> => {
      console.info("StartAndEnd beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_iiregular/StartAndEnd",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get StartAndEnd state pages:" + JSON.stringify(pages));
        if (!("StartAndEnd" == pages.name)) {
          console.info("get StartAndEnd pages.name:" + JSON.stringify(pages.name));
           routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push StartAndEnd page error:" + err);
      }
      console.info("StartAndEnd beforeEach end");
    });

    
    
    



/**
     * @tc.number   StartAndEnd_static_0001
     * @tc.name     StartAndEnd_static_0001
     * @tc.desc     StartAndEnd_static_0001
     * @tc.level    Level.LEVEL0
     */
it('StartAndEnd_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[StartAndEnd_0001] START');
      let gridRect: RectValue = CommonFunc.getComponentRectOnScreen('StartAndEnd')
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      await driver.swipe(
        (Number.parseInt(`${`${`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`}`}`)).toInt(),
        (Number.parseInt(`${`${`${(gridRect.bottom - gridRect.top) * 0.9 + gridRect.top}`}`}`)).toInt(),
        (Number.parseInt(`${`${`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`}`}`)).toInt(),
        (Number.parseInt(`${`${(gridRect.bottom - gridRect.top) * 0.1 + gridRect.top}`}`)).toInt(),
        1000);
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('StartAndEnd_end');

      console.info("[StartAndEnd_0001] component obj1 is: " + JSON.stringify(JSON.parseJsonElement(strJson1)))
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('onReachEnd');

      await driver.swipe(
        (Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`)).toInt(),
        (Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.1 + gridRect.top}`)).toInt(),
        (Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`)).toInt(),
        (Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.9 + gridRect.top}`)).toInt(),
        1000);
      await CommonFunc.sleep(2000);

      let strJson2 = inspector.getInspectorByKey('StartAndEnd_start')

      console.info("[StartAndEnd_0001] component obj2 is: " + JSON.stringify(JSON.parseJsonElement(strJson1)))
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('onReachStart2');

      console.info('[StartAndEnd_0001] END');
      done();
    });
  })
}
