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

import { describe, beforeEach, it, expect, Level, beforeAll} from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
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


export default function SearchTypeTest() {
  describe('SearchTypeTest', () => {
    beforeAll(() => {
      console.info("SearchTypeTest beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("SearchTypeTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/SearchTypeTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SearchTypeTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get SearchTypeTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push SearchTypeTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SearchTypeTest page error:" + err);
      }
      console.info("SearchTypeTest beforeEach end");
    });

    /**
     * @tc.number SUB_ACE_SearchTypeTest_static_0010
     * @tc.name SearchTypeTest_static_0010
     * @tc.desc test Search: SearchType.NORMAL
     * @tc.level: Level 0
     * @tc.type :
     * @tc.size :
     */
    it('SearchTypeTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SearchTypeTest_static_0010] START');
      let strJson = inspector.getInspectorByKey('SearchType_NORMAL');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SearchTypeTest_static_0010] SearchType: ' +
      JSON.stringify(obj.getElement('$attrs').getString('type')));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('SearchType.NORMAL');
      console.info('[SearchTypeTest_static_0010] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_SearchTypeTest_static_0020
     * @tc.name SearchTypeTest_static_0020
     * @tc.desc test Search: SearchType.NUMBER
     * @tc.level: Level 0
     * @tc.type :
     * @tc.size :
     */
    it('SearchTypeTest_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SearchTypeTest_static_0020] START');
      let strJson = inspector.getInspectorByKey('SearchType_NUMBER');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SearchTypeTest_static_0020] SearchType: ' +
      JSON.stringify(obj.getElement('$attrs').getString('type')));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('SearchType.NUMBER');
      console.info('[SearchTypeTest_static_0020] END');
      done();
    });
  })
}