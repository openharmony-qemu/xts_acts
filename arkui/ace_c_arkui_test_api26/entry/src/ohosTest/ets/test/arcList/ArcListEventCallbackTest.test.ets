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

import { beforeAll, describe, expect, it, Level, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON } from '@ohos.UiTest';

export default function ArcListEventCallbackTest() {

  describe('ArcListEventCallbackTest', () => {

    let PAGE_TAG = 'ArcListEventCallbackTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`arcList/${PAGE_TAG}`, done);
    });

    /**
    * @tc.name   ArcListEventCallbackTest_0010
    * @tc.number SUB_ARKUI_ARCLISTEVENTCALLBACK_TEST_0100
    * @tc.desc   ArcListEventCallbackTest_0010
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('ArcListEventCallbackTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('[ArcListEventCallbackTest_0010] START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('arc_list_call');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[ArcListEventCallbackTest_0010] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ArcListEventCallbackTest_0010] type is: " + JSON.stringify(obj1.$type));
      expect(obj1.$type).assertEqual("ArcList");
      console.info('[ArcListEventCallbackTest_0010] END');
      done();
      });
  })
}