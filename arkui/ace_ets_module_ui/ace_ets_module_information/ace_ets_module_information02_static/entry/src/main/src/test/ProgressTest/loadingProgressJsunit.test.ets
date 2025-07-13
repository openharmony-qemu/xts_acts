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
import { LoadingProgress1 } from "../../../ets/MainAbility/pages/Progress/loadingprogress";
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

const waitUiReadyMs = 1000;

export default function loadingProgressJsunit() {
  console.info("test start loadingProgressJsunit");
  describe('loadingProgressJsunit', () => {
    beforeAll(() => {
      console.info("loadingProgressJsunit beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name loadingProgressJsunit_static_0100
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('loadingProgressJsunit_static_0100', Level.LEVEL2,async (done: () => void): Promise<void> => {
       console.info('loadingProgressJsunit_0100 START');
       await CommonFunc.sleep(1000);
       // get the gauge component and test attribute
       let strJson = inspector.getInspectorByKey('loadingProgress');
       let obj = JSON.parseJsonElement(strJson);
       console.info('loadingProgressJsunit_0100 component obj is:' + JSON.stringifyJsonElement(obj));
       expect(obj.getElement('$attrs').getElement('color')).assertEqual('#FF0000FF');
       done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name loadingProgressJsunit_static_0200
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
   it('loadingProgressJsunit_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('loadingProgressJsunit_0200 START');
      await CommonFunc.sleep(1000);
      // modify the color attribute normal value of loadingProgress dynamically
     let loadingProgress1 = AppStorage.get<LoadingProgress1>("LoadingProgressExample", Type.from<LoadingProgress1>()) as LoadingProgress1
     loadingProgress1.message.notify({name:'color',value:Color.Green})
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = inspector.getInspectorByKey('loadingProgress');
      let obj = JSON.parseJsonElement(strJson);
      console.info('loadingProgressJsunit_0200 component obj is: ' + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getElement('color')).assertEqual('#FF008000');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name loadingProgressJsunit_static_0300
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
  it('loadingProgressJsunit_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('loadingProgressJsunit_0300 START');
      await CommonFunc.sleep(1000);
      // modify the values attribute illegal value of loadingProgress dynamically
      let loadingProgress1 = AppStorage.get<LoadingProgress1>("LoadingProgressExample", Type.from<LoadingProgress1>()) as LoadingProgress1
      loadingProgress1.message.notify({name:'color',value:'-20'})

      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('loadingProgress');
      let obj = JSON.parseJsonElement(strJson);
	    // let resourceColor = getContext().resourceManager.getColorSync($r('sys.color.ohos_id_color_progress').id).toString(16).toUpperCase()
      console.info('loadingProgressJsunit_0300  component obj is: ' + JSON.stringifyJsonElement(obj));
      // expect(obj.getElement('$attrs').getElement('color')).assertEqual('#'+resourceColor);
      done();
   });
  })
}