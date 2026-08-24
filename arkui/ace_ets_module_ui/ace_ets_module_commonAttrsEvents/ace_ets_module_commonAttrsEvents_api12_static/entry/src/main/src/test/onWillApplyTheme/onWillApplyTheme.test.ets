'use static';
/*
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
import { afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import { Component, Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function onWillApplyTheme() {
  describe('onWillApplyTheme', () => {
    beforeEach(async (): Promise<void> => {
      console.info("onWillApplyTheme beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get onWillApplyTheme state pages:" + JSON.stringify(pages));
        if (!("onWillApplyTheme" == pages.name)) {
          console.info("get  onWillApplyTheme pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: "MainAbility/pages/onWillApplyTheme/onWillApplyTheme"
          })
        }
      } catch (err) {
        console.error("push onWillApplyTheme page error:" + err);
      }
      console.info("onWillApplyTheme foreEach end");
    });
    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      console.info("onWillApplyTheme after each called");
    });

    /**
     * @tc.number onWillApplyTheme_static_001
     * @tc.name   onWillApplyTheme_static_001
     * @tc.desc onWillApplyTheme test
     * @tc.level Level 3
     * @tc.type
     */
    it('onWillApplyTheme_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[onWillApplyTheme_static_001] START');

      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('onWillApplyThemeText');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      console.info("[onWillApplyTheme_static_001] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      try {
        await CommonFunc.sleep(200);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('onWillApplyTheme');
      console.info('[onWillApplyTheme_static_001] END');
      done();
    });
  })
}