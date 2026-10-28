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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON, Component } from '@ohos.UiTest';

export default function UIAgentGetPageTextErrorCodeTest() {

  describe('UIAgentGetPageTextErrorCodeTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTGETPAGETEXT_INTERNAL_ERROR_0200
     * @tc.name   UIAgentGetPageTextErrorCodeTest002
     * @tc.desc   Inject non-finite geometry(translate Infinity) then collect, expect ARKUI_ERROR_CODE_INTERNAL_ERROR(100001) and null pageText
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIAgentGetPageTextErrorCodeTest002', Level.LEVEL1, async (done: Function) => {
      console.info('[UIAgentGetPageTextErrorCodeTest002] START');
      await Utils.pushPage('node/UIAgentGetPageTextErrorCodeTest');
      await Utils.sleep(1500);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('pageTextInternalErrorTrigger'));
      await btn.click();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('pageTextInternalErrorResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[UIAgentGetPageTextErrorCodeTest002] result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertContain('TC2=100001');
      console.info('[UIAgentGetPageTextErrorCodeTest002] END');
      done();
    })
  })
}
