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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import { Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from "@ohos.arkui.inspector";
import { Color } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Utils.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function loadingProgressJsunit2() {
  console.info("test start loadingProgressJsunit2");
  describe('loadingProgressTest2', () => {
    beforeAll(() => {
      console.info("loadingProgressTest2 beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("loadingProgress after each called");
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name testLoadingProgress_static_100
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testLoadingProgress_static_100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testLoadingProgress_100] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('LP');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testLoadingProgress_100 component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getElement('borderColor')).assertEqual("#FF000000");
      console.info('testLoadingProgress_100 END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name testLoadingProgress_static_200
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testLoadingProgress_static_200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testLoadingProgress_200] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('LP');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testLoadingProgress_200 component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getElement('borderRadius') instanceof Object).assertTrue();
      console.info('testLoadingProgress_200 END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name testLoadingProgress_static_300
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testLoadingProgress_static_300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testLoadingProgress_300] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('LP');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testLoadingProgress_300 component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getElement('height')).assertEqual("50.00vp");
      console.info('testLoadingProgress_300 END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name testLoadingProgress_static_400
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testLoadingProgress_static_400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testLoadingProgress_400] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('LP');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testLoadingProgress_400 component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getElement('borderWidth')).assertEqual("0.00vp");
      console.info('testLoadingProgress_400 END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name testLoadingProgress_static_500
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testLoadingProgress_static_500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testLoadingProgress_500] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('LP');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testLoadingProgress_500 component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getElement('borderStyle')).assertEqual("BorderStyle.Solid");
      console.info('testLoadingProgress_500 END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name testLoadingProgress_static_600
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testLoadingProgress_static_600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testLoadingProgress_600] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('LP');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testLoadingProgress_600 component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getElement('backgroundColor')).assertEqual("#00000000");
      console.info('testLoadingProgress_600 END');
      done();
    });
  })
}
