/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "../../../../hypium/index";
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import curves from '@ohos.curves';
import {PlayMode} from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest,startAbility} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function animatorOnframeJsunit() {
  describe('animatorOnframeTest', () => {

    beforeAll(() => {
      console.info("playModeReverseTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.animation.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("playModeReverseTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Animation/animator",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get playModeReverseTest state pages:" + JSON.stringify(pages));
        if (!("animator" == pages.name)) {
          console.info("get playModeReverseTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push playModeReverseTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push playModeReverseTest page error:" + err);
      }
      console.info("playModeReverseTest beforeEach end");
    });


    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("animatorOnframe after each called");
    });
    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testanimatorOnframeStatic0001
     * @tc.desic         aceanimatorOnframeEtsTest0001
     */
    it('testanimatorOnframe_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animatorOnframe testanimatorOnframe0001 START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('onframeText');
      console.info("[testanimatorOnframe0001] component width strJson:" + strJson);
      let typeParam = JSON.parseJsonElement(strJson);
      expect(typeParam.getElement('$type')).assertEqual('Text');
      expect(typeParam.getElement('$attrs').getString('width')).assertEqual("100.00vp");
      console.info("[testanimatorOnframe0001] width value :" + typeParam.getElement('$attrs').getString('width'));
      done();
    });
    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testanimatorOnframeStatic0002
     * @tc.desic         aceanimatorOnframeEtsTest0002
     */
    it('testanimatorOnframe_static_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animatorOnframe testanimatorOnframe0002 START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('onframeText');
      console.info("[testanimatorOnframe0002] component height strJson:" + strJson);
      let typeParam = JSON.parseJsonElement(strJson);
      expect(typeParam.getElement('$type')).assertEqual('Text');
      expect(typeParam.getElement('$attrs').getString('height')).assertEqual("70.00vp");
      console.info("[testanimatorOnframe0002] height value :" + typeParam.getElement('$attrs').getString('height'));
      done();
    });
    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testanimatorOnframeStatic0003
     * @tc.desic         aceanimatorOnframeEtsTest0003
     */
    it('testanimatorOnframe_static_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animatorOnframe testanimatorOnframe0003 START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('onframeText');
      console.info("[testanimatorOnframe0003] component fontSize strJson:" + strJson);
      let typeParam = JSON.parseJsonElement(strJson);
      
      expect(typeParam.getElement('$type')).assertEqual('Text');
      expect(typeParam.getElement('$attrs').getString('fontSize')).assertEqual("20.00fp");
      console.info("[testanimatorOnframe0003] fontSize value :" + typeParam.getElement('$attrs').getString('fontSize'));
      done();
    });
    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testanimatorOnframeStatic0004
     * @tc.desic         aceanimatorOnframeEtsTest0004
     */
    it('testanimatorOnframe_static_0004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animatorOnframe testanimatorOnframe0004 START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('onframeText');
      console.info("[testanimatorOnframe0004] component opacity strJson:" + strJson);
      let typeParam = JSON.parseJsonElement(strJson);
      
      expect(typeParam.getElement('$type')).assertEqual('Text');
      expect(typeParam.getElement('$attrs').getString('opacity')).assertEqual(1);
      console.info("[testanimatorOnframe0004] opacity value :" + typeParam.getElement('$attrs').getString('opacity'));
      done();
    });
    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testanimatorOnframeStatic0005
     * @tc.desic         aceanimatorOnframeEtsTest0005
     */
    it('testanimatorOnframe_static_0005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animatorOnframe testanimatorOnframe0005 START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('onframeText');
      console.info("[testanimatorOnframe0005] component align strJson:" + strJson);
      let typeParam = JSON.parseJsonElement(strJson);
      
      expect(typeParam.getElement('$type')).assertEqual('Text');
      expect(typeParam.getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart");
      console.info("[testanimatorOnframe0005] align value :" + typeParam.getElement('$attrs').getString('align'));
      done();
    });
    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testanimatorOnframeStatic0006
     * @tc.desic         aceanimatorOnframeEtsTest0006
     */
    it('testanimatorOnframe_static_0006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animatorOnframe testanimatorOnframe0006 START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('onframeText');
      console.info("[testanimatorOnframe0006] component fontColor strJson:" + strJson);
      let typeParam = JSON.parseJsonElement(strJson);
      
      expect(typeParam.getElement('$type')).assertEqual('Text');
      expect(typeParam.getElement('$attrs').getString('fontColor')).assertEqual("#FFCCCCCC");
      console.info("[testanimatorOnframe0006] fontColor value :" + typeParam.getElement('$attrs').getString('fontColor'));
      done();
    });
    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testanimatorOnframeStatic0007
     * @tc.desic         aceanimatorOnframeEtsTest0007
     */
    it('testanimatorOnframe_static_0007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animatorOnframe testanimatorOnframe0007 START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('onframeText');
      console.info("[testanimatorOnframe0007] component lineHeight strJson:" + strJson);
      let typeParam = JSON.parseJsonElement(strJson);
      
      expect(typeParam.getElement('$type')).assertEqual('Text');
      expect(typeParam.getElement('$attrs').getString('lineHeight')).assertEqual("25.00fp");
      console.info("[testanimatorOnframe0007] lineHeight value :" + typeParam.getElement('$attrs').getString('lineHeight'));
      done();
    });
    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testanimatorOnframeStatic0009
     * @tc.desic         aceanimatorOnframeEtsTest0009
     */
    it('testanimatorOnframe_static_0009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animatorOnframe testanimatorOnframe009 START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('onframeText');
      console.info("[testanimatorOnframe0009] component padding strJson:" + strJson);
      let typeParam = JSON.parseJsonElement(strJson);
      
      expect(typeParam.getElement('$type')).assertEqual('Text');
      expect(typeParam.getElement('$attrs').getString('padding')).assertEqual("10.00vp");
      console.info("[testanimatorOnframe0009] padding value :" + typeParam.getElement('$attrs').getString('padding'));
      done();
    });
    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testanimatorOnframeStatic0010
     * @tc.desic         aceanimatorOnframeEtsTest0010
     */
    it('testanimatorOnframe_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animatorOnframe testanimatorOnframe0010 START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('onframeText');
      console.info("[testanimatorOnframe0010] component textAlign strJson:" + strJson);
      let typeParam = JSON.parseJsonElement(strJson);
      
      expect(typeParam.getElement('$type')).assertEqual('Text');
      expect(typeParam.getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.Center");
      console.info("[testanimatorOnframe0010] textAlign value :" + typeParam.getElement('$attrs').getString('textAlign'));
      done();
    });

    /*
     * @tc.number       testanimatorOnframe0011
     * @tc.name         testanimatorOnframeStatic0011
     * @tc.desc         test animator OnFrame
     */
    it('testanimatorOnframe_static_0011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animatorOnframe testanimatorOnframe0011 START');
      await CommonFunc.sleep(2000);

      let driver = Driver.create();
      await driver.delayMs(1000);
      let playBtn = await driver.findComponent(ON.id('Play'));
      await (playBtn?.click() as Promise<void>);
      console.info('[testanimatorOnframe0011] playBtn click');
      await driver.delayMs(5000);

      let strJson3: string = inspector.getInspectorByKey('Test003');
      let typeParam = JSON.parseJsonElement(strJson3);
      
      console.info('[testanimatorOnframe_static_0011] strJson3: ' + typeParam.getElement('$attrs').getString('content'));
      expect(typeParam.getElement('$attrs').getString('content')).assertEqual('250');
      done();

      console.info('testanimatorOnframe0011 END');
      done();
    });

    /*
     * @tc.number       testanimatorOnframeStatic012
     * @tc.name         testanimatorOnframeStatic012
     * @tc.desc         test animator onRepeat
     */
    it('testanimatorOnframe_static_012', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animatorOnframe testanimatorOnframe0011 START');
      await CommonFunc.sleep(2000);

      let strJson4: string = inspector.getInspectorByKey('Test004');
      let typeParam = JSON.parseJsonElement(strJson4);

      console.info('[testanimatorOnframe012] strJson4: ' + typeParam.getElement('$attrs').getString('content'));
      expect(typeParam.getElement('$attrs').getString('content')).assertEqual('animator-Test004:1');
      console.info('testanimatorOnframe012 END');
      done();
    });

    /*
     * @tc.number       testanimatorOnframeStatic013
     * @tc.name         testanimatorOnframeStatic013
     * @tc.desic        test animator onCancel
     */
    it('testanimatorOnframe_static_013', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animatorOnframe testanimatorOnframe013 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let cancelBtn = await driver.findComponent(ON.id('Cancel'));
      await (cancelBtn?.click() as Promise<void>);
      console.info('[testanimatorOnframe013] cancelBtn click');
      await driver.delayMs(2000);

      let strJson5: string = inspector.getInspectorByKey('Test005');
      let typeParam = JSON.parseJsonElement(strJson5);

      console.info('[testanimatorOnframe013] strJson5: ' + typeParam.getElement('$attrs').getString('content'));
      expect(typeParam.getElement('$attrs').getString('content')).assertEqual('animator-Test005:1');
      console.info('testanimatorOnframe013 END');
      done();
    });
  })
}