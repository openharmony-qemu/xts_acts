/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 **     http://www.apache.org/licenses/LICENSE-2.0
 **
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { startAbility, stopApplication, UtilsTest } from '../Util.test';
import router from '@ohos.router';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function SearchTypeTest() {
  describe('SearchTypeTest', (): void => {
    beforeAll(() => {
      console.info("activeTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsOther.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("SearchTypeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchType',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SearchTypeTest state pages:" + JSON.stringify(pages));
        if (!("SearchTypeTest" == pages.name)) {
          console.info("get SearchTypeTest pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push SearchTypeTest page error:" + err);
      }
      console.info("SearchTypeTest beforeEach end");
    });


    /*
     * @tc.number    SearchTypeTest_static_0010
     * @tc.name      SearchTypeTest_static_0010
     * @tc.desc      SearchTypeTest_static_0010
     * @tc.level     2
     */
    it('SearchTypeTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SearchTypeTest_0010] START');
      let strJson: string = inspector.getInspectorByKey('SearchType_ONE_TIME_CODE');
      // let obj = JSON.parseJsonElement(strJson);
      // console.info('[SearchTypeTest_0010] SearchType: ' + obj.getElement('attr').getString('type'));
      // expect(obj.getElement('attr').getString('type')).assertEqual('SearchType.ONE_TIME_CODE');
      // console.info('[SearchTypeTest_0010] END');
      done();
    });


    /*
     * @tc.number    SearchTypeTest_static_0020
     * @tc.name      SearchTypeTest_static_0020
     * @tc.desc      SearchTypeTest_static_0020
     * @tc.level     2
     */
    it('SearchTypeTest_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SearchTypeTest_0020] START');
      let strJson: string = inspector.getInspectorByKey('SearchType_undefined');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SearchTypeTest_0020] SearchType: ' + JSON.stringify(obj.getElement('$attrs').getString('type')));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('SearchType.NORMAL');
      console.info('[SearchTypeTest_0020] END');
      done();
    });


    /*
     * @tc.number    SearchTypeTest_static_0030
     * @tc.name      SearchTypeTest_static_0030
     * @tc.desc      SearchTypeTest_static_0030
     * @tc.level     2
     */
    it('SearchTypeTest_static_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SearchTypeTest_0030] START');
      let strJson: string = inspector.getInspectorByKey('SearchType_default');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SearchTypeTest_0030] SearchType: ' + JSON.stringify(obj.getElement('$attrs').getString('type')));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('SearchType.NORMAL');
      console.info('[SearchTypeTest_0030] END');
      done();
    });


    /*
     * @tc.number    SearchTypeTest_static_0040
     * @tc.name      SearchTypeTest_static_0040
     * @tc.desc      SearchTypeTest_static_0040
     * @tc.level     2
     */
    it('SearchTypeTest_static_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SearchTypeTest_0040] START');
      let strJson: string = inspector.getInspectorByKey('SearchType_Modifier');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SearchTypeTest_0040] SearchType: ' + JSON.stringify(obj.getElement('$attrs').getString('type')));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('SearchType.ONE_TIME_CODE');
      console.info('[SearchTypeTest_0040] END');
      done();
    });
  })
}