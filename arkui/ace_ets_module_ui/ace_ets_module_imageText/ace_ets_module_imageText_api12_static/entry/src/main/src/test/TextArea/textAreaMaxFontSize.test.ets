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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '../../../../hypium/index'
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext,Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function textAreaMaxFontSize() {
  describe('textAreaMaxFontSize', () => {
    beforeAll(() => {
      console.info("textAreaMaxFontSize beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("textAreaMaxFontSize beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/textAreaMaxFontSize",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textAreaMaxFontSize state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get textAreaMaxFontSize pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push textAreaMaxFontSize page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textAreaMaxFontSize page error:" + err);
      }
      console.info("textAreaMaxFontSize beforeEach end");
    }); 


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textAreaMaxFontSize after each called");
    })

    /**
     * @tc.number textAreaMaxFontSize0100
     * @tc.name Test the maxFontSize property of the textArea component
     * @tc.desc set the maxFontSize property value is  21
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textAreaMaxFontSize_static_0100', 0, async (done: () => void): Promise<void> => {
      let tagName = 'textAreaMaxFontSize0100';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = inspector.getInspectorByKey('key_textArea_maxFontSize_001');
      console.info('[' + tagName + '] Search maxFontSize is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('maxFontSize')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('maxFontSize')).assertEqual('21.00fp');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
