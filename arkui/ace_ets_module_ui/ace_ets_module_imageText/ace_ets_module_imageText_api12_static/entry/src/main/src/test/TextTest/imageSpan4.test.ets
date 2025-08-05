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
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, loadAndSetUpUiTest} from '@ohos.UiTest';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
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


export default function imageSpanTest4() {
  describe('imageSpanTest4', () => {
    beforeAll(() => {
      console.info("imageSpanTest4 beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("imageSpanTest4 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/imageSpan4",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get imageSpanTest4 state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get imageSpanTest4 pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push imageSpanTest4 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push imageSpanTest4 page error:" + err);
      }
      console.info("imageSpanTest4 beforeEach end");
    }); 

    
     /**
     * @tc.number    SUB_ACE_imageSpanTest4_0100
     * @tc.name      imageSpanTest4_0100
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type : 
     * @tc.size :
     */
    it('imageSpanTest4_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info('imageSpanTest4_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ImageSpan_onComplete_41');
      let obj  = JSON.parseJsonElement(strJson);
      console.info("[imageSpanTest4_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('png onComplete succ');
      console.info('[imageSpanTest4_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_imageSpanTest4_0200
     * @tc.name      imageSpanTest4_0200
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('imageSpanTest4_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info('imageSpanTest4_0200 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ImageSpan_onComplete_42');
      let obj  = JSON.parseJsonElement(strJson);
      console.info("[imageSpanTest4_0200] component obj is: " + JSON.stringify(obj));
      console.info("[imageSpanTest4_0200] title: " + JSON.stringify(obj.getElement('$attrs').getString('imageSpanTest4Width')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('jpg onComplete succ');
      console.info('[imageSpanTest4_0200] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_imageSpanTest4_0300
     * @tc.name      imageSpanTest4_0300
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('imageSpanTest4_static_0300', 0, async (done: () => void) : Promise<void> => {
      console.info('imageSpanTest4_0300 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ImageSpan_onComplete_43');
      let obj  = JSON.parseJsonElement(strJson);
      console.info("[imageSpanTest4_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('gif onComplete succ');
      console.info('[imageSpanTest4_0300] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_imageSpanTest4_0400
     * @tc.name      imageSpanTest4_0400
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('imageSpanTest4_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info('imageSpanTest4_0400 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ImageSpan_onComplete_44');
      let obj  = JSON.parseJsonElement(strJson);
      console.info("[imageSpanTest4_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('svg onComplete succ');
      console.info('[imageSpanTest4_0400] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_imageSpanTest4_0500
     * @tc.name      imageSpanTest4_0500
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('imageSpanTest4_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info('imageSpanTest4_0500 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ImageSpan_onComplete_45');
      let obj  = JSON.parseJsonElement(strJson);
      console.info("[imageSpanTest4_0500] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('bmp onComplete succ');
      console.info('[imageSpanTest4_0500] END');
      done();
    });
  })
}

