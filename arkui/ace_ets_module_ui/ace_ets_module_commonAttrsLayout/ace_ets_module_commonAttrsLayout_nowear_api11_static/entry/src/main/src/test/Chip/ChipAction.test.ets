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
import { afterAll, afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, MouseButton, ON } from '@ohos.UiTest';
import { ComponentUtils, Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function ChipAction() {
  describe('ChipAction', () => {

    beforeEach(() => {
      console.info("ChipAction beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Chip/ChipAction',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ChipAction state pages: " + JSON.stringify(pages));
        if (!("ChipAction" == pages.name)) {
          console.info("get ChipAction state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push ChipAction page error: " + err);
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   ChipAction_static_001
     * @tc.name     ChipAction_static_001
     * @tc.desc     ChipAction_static_001
     * @tc.level    Level.LEVEL0
     */
it('ChipAction_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!;
      console.info('ChipAction_static_001 START');
      let ChipActionCol = CommonFunc.getComponentRect('ChipActionCol');
      try { await CommonFunc.sleep(200); } catch (err) { console.info('ChipAction sleep err: ' + JSON.stringify(err)); }
      let right: number = ChipActionCol.right - uiContext.vp2px(22) + Number(AppStorage.get<number>("winLeft") ?? 0);
      let top: number = ChipActionCol.top + uiContext.vp2px(60) + Number(AppStorage.get<number>("winTop") ?? 0);
      try { await CommonFunc.sleep(200); } catch (err) { console.info('ChipAction sleep err: ' + JSON.stringify(err)); }
      console.info('ChipAction_static_001 right：' + right + ',top:' + top);
      let driver = Driver.create();
      try {
        await driver.mouseClick({
          x: Math.round(right).toInt(), y: Math.round(top).toInt()
        }, MouseButton.MOUSE_BUTTON_LEFT);
      } catch (err) {
        console.info('ChipAction mouseClick err: ' + JSON.stringify(err));
      }
      try { await CommonFunc.sleep(1000); } catch (err) { console.info('ChipAction sleep err: ' + JSON.stringify(err)); }
      console.info('ChipAction_static_001 click success');

      let strJson1 = inspector.getInspectorByKey('ChipAction');
      try { await CommonFunc.sleep(1000); } catch (err) { console.info('ChipAction sleep err: ' + JSON.stringify(err)); }
      console.info("[ChipAction_static_001] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson1)));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('action');
      console.info('[ChipAction_static_001] END');

      done();
    });


  })
}
