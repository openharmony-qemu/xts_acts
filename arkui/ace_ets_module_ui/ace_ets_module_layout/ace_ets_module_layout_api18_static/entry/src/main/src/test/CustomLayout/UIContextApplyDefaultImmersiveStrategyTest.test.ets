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

import { describe, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index";
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog';

let domain: int = 0x0000;
let tag: string = 'UIContextApplyDefaultImmersiveStrategyTest';

export default function UIContextApplyDefaultImmersiveStrategyTest() {
  describe('UIContextApplyDefaultImmersiveStrategyTest', (): void => {

    beforeEach(async (): Promise<void> => {
      console.info(domain, tag, 'beforeEach start');
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CustomLayout/UIContextApplyDefaultImmersiveStrategy",
      };
      try {
        const testRouter = AppStorage.get<Router>("router") as Router;
        testRouter.clear();
        let pages: router.RouterState = testRouter.getState();
        console.info(domain, tag, 'get state pages: %{public}s', JSON.stringify(pages));
        if (!("UIContextApplyDefaultImmersiveStrategy" == pages.name)) {
          await testRouter.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        hilog.error(domain, tag, 'push page error: %{public}s', JSON.stringify(err) as string);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error(domain, tag, 'afterEach sleep error: ' + err);
      }
      console.info(domain, tag, 'afterEach end');
    });

    /**
     * @tc.name   UIContextApplyDefaultImmersiveStrategy_static_0100
     * @tc.number SUB_ARKUI_API_UIContextApplyDefaultImmersiveStrategy_static_0100
     * @tc.desc   verify applyDefaultImmersiveStrategy with ImmersiveStrategy.AVOID_CUTOUT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UIContextApplyDefaultImmersiveStrategy_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info(domain, tag, '[static_0100] START');
        await CommonFunc.sleep(1000);

        let strJson: string = inspector.getInspectorByKey('main_content');
        expect(strJson).not().assertUndefined();
        expect(strJson.length > 0).assertTrue();

        let obj_type = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$type'));
        expect(obj_type).assertEqual('"Column"');

        let rect = CommonFunc.getComponentRect('main_content');
        expect(rect.right > rect.left).assertTrue();
        expect(rect.bottom > rect.top).assertTrue();

        console.info(domain, tag, '[static_0100] END');
      } catch (err) {
        console.error(domain, tag, '[static_0100] err: ' + err);
        expect().assertFail();
      }
      done();
    });
  });
}
