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
import { describe, beforeEach, it, expect, Level, beforeAll} from "../../../../hypium/index"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function SearchTypeTest() {
  describe('SearchTypeTest', (): void => {

    beforeAll(() => {
      console.info("SearchTypeTest beforeEach start");
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
          hilog.info(domain, tag, '%{public}s', 'onAbilityCreate end');
        },
      }, (err : BusinessError | null) : void => {
        if (err != null ) {
          hilog.info(domain, tag, '%{public}s', '-----'+ err.code);
        }
        hilog.info(domain, tag, '%{public}s', 'BusinessError  end');
      });
      await CommonFunc.sleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.arkui.ace.imageText.api20.static")
      await CommonFunc.sleep(2000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextClockApiTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Search/SearchType",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<common.Context>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextClockApiTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get TextClockApiTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释。
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TextClockApiTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextClockApiTest page error:" + err);
      }
      console.info("TextClockApiTest beforeEach end");
    });

    /**
     * @tc.number    SUB_ACE_SearchTypeTest_0020
     * @tc.name      SearchTypeTest_static_0020
     * @tc.desc      test the type of Search: undefined
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('SearchTypeTest_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SearchTypeTest_static_0020] START');
      let strJson:string = inspector.getInspectorByKey('SearchType_undefined');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SearchTypeTest_static_0020] SearchType: ' + obj.getElement('$attrs').getString('type'));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('SearchType.NORMAL');
      console.info('[SearchTypeTest_static_0020] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_SearchTypeTest_0030
     * @tc.name      SearchTypeTest_static_0030
     * @tc.desc      test the type of Search: default
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('SearchTypeTest_static_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SearchTypeTest_static_0030] START');
      let strJson:string = inspector.getInspectorByKey('SearchType_default');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SearchTypeTest_static_0030] SearchType: ' + obj.getElement('$attrs').getString('type'));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('SearchType.NORMAL');
      console.info('[SearchTypeTest_static_0030] END');
      done();
    });
  })
}