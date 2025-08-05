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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, loadAndSetUpUiTest} from '@ohos.UiTest';
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

export default function TextDataDetectorConfig() {
  describe('TextDataDetectorConfig', () => {
    beforeAll(() => {
      console.info("TextDataDetectorConfig beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextDataDetectorConfig beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/TextDataDetectorConfig",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextDataDetectorConfig state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get TextDataDetectorConfig pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TextDataDetectorConfig page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextDataDetectorConfig page error:" + err);
      }
      console.info("TextDataDetectorConfig beforeEach end");
    }); 


    /**
     * @tc.number: TextDataDetectorConfig_0010
     * @tc.name  : TextDataDetectorConfig_0010
     * @tc.desc  : set Text: TextDataDetectorConfig
     * @tc.level : Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextDataDetectorConfig_static_0010', 0, async (done: () => void): Promise<void> => {
      console.info('TextDataDetectorConfig_0010 START');
      let TextDataDetectorConfig_1 = inspector.getInspectorByKey('text_dataDetectorConfig');
      expect(""+JSON.parseJsonElement(JSON.parseJsonElement(TextDataDetectorConfig_1).getElement('$attrs').getString('dataDetectorConfig')).getString('color')).assertEqual('#FF0000FF');
      console.info('TextDataDetectorConfig_0010 END');
      done();
    });
	
	/**
     * @tc.number: TextDataDetectorConfig_0020
     * @tc.name  : TextDataDetectorConfig_0020
     * @tc.desc  : set Text: TextDataDetectorConfig
     * @tc.level : Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextDataDetectorConfig_static_0020', 0, async (done: () => void): Promise<void> => {
      console.info('TextDataDetectorConfig_0020 START');
      let TextDataDetectorConfig_1 = inspector.getInspectorByKey('text_dataDetectorConfig');
      expect(""+JSON.parseJsonElement(JSON.parseJsonElement(TextDataDetectorConfig_1).getElement('$attrs').getString('dataDetectorConfig')).getElement('decoration').getString('type')).assertEqual('1');
      console.info('TextDataDetectorConfig_0020 END');
      done();
    });
	
	/**
     * @tc.number: TextDataDetectorConfig_0030
     * @tc.name  : TextDataDetectorConfig_0030
     * @tc.desc  : set Text: TextDataDetectorConfig
     * @tc.level : Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextDataDetectorConfig_static_0030', 0, async (done: () => void): Promise<void> => {
      console.info('TextDataDetectorConfig_0030 START');
      let TextDataDetectorConfig_1 = inspector.getInspectorByKey('text_dataDetectorConfig');
      expect(""+JSON.parseJsonElement(JSON.parseJsonElement(TextDataDetectorConfig_1).getElement('$attrs').getString('dataDetectorConfig')).getElement('decoration').getString('color')).assertEqual('#FFFF0000');
      console.info('TextDataDetectorConfig_0030 END');
      done();
    });
	
	/**
     * @tc.number: TextDataDetectorConfig_0040
     * @tc.name  : TextDataDetectorConfig_0040
     * @tc.desc  : set Text: TextDataDetectorConfig
     * @tc.level : Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextDataDetectorConfig_static_0040', 0, async (done: () => void): Promise<void> => {
      console.info('TextDataDetectorConfig_0040 START');
      let TextDataDetectorConfig_1 = inspector.getInspectorByKey('text_dataDetectorConfig');
      expect(""+JSON.parseJsonElement(JSON.parseJsonElement(TextDataDetectorConfig_1).getElement('$attrs').getString('dataDetectorConfig')).getElement('decoration').getString('style')).assertEqual('0');
      console.info('TextDataDetectorConfig_0040 END');
      done();
    });
  })
}