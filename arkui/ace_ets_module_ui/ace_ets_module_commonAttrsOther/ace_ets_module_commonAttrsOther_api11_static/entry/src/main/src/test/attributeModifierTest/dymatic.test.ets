'use static';
/**
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
import { afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import { Driver } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'

export default function dymaticTest(): void {
  describe('dymaticTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("dymaticTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/attributeModifier/attribute',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get dymaticTest state pages:" + JSON.stringify(pages));
        if (!("attribute" == pages.name)) {
          console.info("get dymaticTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push dymaticTest page error:" + err);
      }
      console.info("dymaticTest beforeEach end");
    });


    afterEach(async () => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('dymaticTest afterEach sleep err: ' + JSON.stringify(err));
      }
      console.info("dymaticTest after each called");
    });

    

    
/**
     * @tc.number   dymaticTest_static_0100
     * @tc.name     dymaticTest_static_0100
     * @tc.desc     dymaticTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('dymaticTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[dymaticTest_0100] START');
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('dymaticTest sleep err: ' + JSON.stringify(err));
      }
      let btTop = CommonFunc.getComponentRect('pressedBt');
      let top = btTop.top
      let btBottom = CommonFunc.getComponentRect('pressedBt');
      let bottom = btBottom.bottom
      let btRight = CommonFunc.getComponentRect('pressedBt');
      let right = btRight.right
      let btLeft = CommonFunc.getComponentRect('pressedBt');
      let left = btLeft.left
      let xmiddle = Math.round(left + (right - left) / 2).toInt()
      let ymiddle = Math.round(top + (bottom - top) / 2).toInt()
      console.log('test result is: ' + btTop + btBottom + btRight + btLeft)

      let driver = Driver.create()
      driver.longClick(xmiddle, ymiddle);
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('dymaticTest sleep err: ' + JSON.stringify(err));
      }
      let json = inspector.getInspectorByKey('pressedBt');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('dymaticTest sleep err: ' + JSON.stringify(err));
      }
      let Obj1 = JSON.parseJsonElement(json);
      console.info("dymaticTest_0100 json info " + JSON.stringify(json));

      expect(Obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF000000');
      console.info('[dymaticTest_0100] END');
      done();
    });

  })
}
