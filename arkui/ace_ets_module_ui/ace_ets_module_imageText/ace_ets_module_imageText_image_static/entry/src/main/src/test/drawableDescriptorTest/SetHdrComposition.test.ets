'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

const SLEEP_TIME_L: number = 1000;
const SLEEP_TIME_ASYNC: number = 3000;

export default function SetHdrCompositionTest() {
  describe('SetHdrCompositionTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("SetHdrCompositionTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.image.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("SetHdrCompositionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/drawableDescriptor/SetHdrComposition',
      }
      try {
        const routerInstance: Router = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get SetHdrComposition state pages:" + JSON.stringify(pages));
        if (!("SetHdrComposition" == pages.name)) {
          console.info("get SetHdrComposition pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(SLEEP_TIME_L);
        }
      } catch (err) {
        console.error("push SetHdrComposition page error:" + err);
      }
      console.info("SetHdrCompositionTest beforeEach end");
    });
    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME_L);
      console.info("SetHdrCompositionTest after each called");
    });

    /**
     * @tc.number   SUB_ARKUI_PICTUREDRAWABLEDESCRIPTOR_SETHDRCOMPOSITION_PARAM_STATIC_0100
     * @tc.name     pictureDrawableDescriptorSetHdrCompositionNormalParam_static_0100
     * @tc.desc     Test PictureDrawableDescriptor setHdrComposition with normal HdrCompositionConfig rect values
     * @tc.level    Level.LEVEL2
     */
    it('pictureDrawableDescriptorSetHdrCompositionNormalParam_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[pictureDrawableDescriptorSetHdrCompositionNormalParam_static_0100] START');
      const driver: Driver = Driver.create();
      const btnCreate: Driver.Component = await driver.findComponent(ON.id('btnCreateDrawable'));
      await (btnCreate?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_ASYNC);

      const button: Driver.Component = await driver.findComponent(ON.id('btnTest001'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_L);

      let strJson: string = inspector.getInspectorByKey('txtTestResult001');
      let obj: JSON.JsonElement = JSON.parseJsonElement(strJson);
      let resultText: string = obj.getElement('$attrs').getString('content');
      console.info('[pictureDrawableDescriptorSetHdrCompositionNormalParam_static_0100] result: ' + resultText);

      expect(resultText).assertContain('PASS');
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_PICTUREDRAWABLEDESCRIPTOR_SETHDRCOMPOSITION_PARAM_STATIC_0200
     * @tc.name     pictureDrawableDescriptorSetHdrCompositionWithInvalidate_static_0100
     * @tc.desc     Test PictureDrawableDescriptor setHdrComposition followed by invalidate to trigger redraw
     * @tc.level    Level.LEVEL2
     */
    it('pictureDrawableDescriptorSetHdrCompositionWithInvalidate_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[pictureDrawableDescriptorSetHdrCompositionWithInvalidate_static_0100] START');
      const driver: Driver = Driver.create();
      const btnCreate: Driver.Component = await driver.findComponent(ON.id('btnCreateDrawable'));
      await (btnCreate?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_ASYNC);

      const button: Driver.Component = await driver.findComponent(ON.id('btnTest002'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_L);

      let strJson: string = inspector.getInspectorByKey('txtTestResult002');
      let obj: JSON.JsonElement = JSON.parseJsonElement(strJson);
      let resultText: string = obj.getElement('$attrs').getString('content');
      console.info('[pictureDrawableDescriptorSetHdrCompositionWithInvalidate_static_0100] result: ' + resultText);

      expect(resultText).assertContain('PASS');
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_PICTUREDRAWABLEDESCRIPTOR_SETHDRCOMPOSITION_BOUNDARY_STATIC_0100
     * @tc.name     pictureDrawableDescriptorSetHdrCompositionZeroRect_static_0100
     * @tc.desc     Test PictureDrawableDescriptor setHdrComposition with rect having zero x, y, width, height values
     * @tc.level    Level.LEVEL2
     */
    it('pictureDrawableDescriptorSetHdrCompositionZeroRect_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[pictureDrawableDescriptorSetHdrCompositionZeroRect_static_0100] START');
      const driver: Driver = Driver.create();
      const btnCreate: Driver.Component = await driver.findComponent(ON.id('btnCreateDrawable'));
      await (btnCreate?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_ASYNC);

      const button: Driver.Component = await driver.findComponent(ON.id('btnTest003'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_L);

      let strJson: string = inspector.getInspectorByKey('txtTestResult003');
      let obj: JSON.JsonElement = JSON.parseJsonElement(strJson);
      let resultText: string = obj.getElement('$attrs').getString('content');
      console.info('[pictureDrawableDescriptorSetHdrCompositionZeroRect_static_0100] result: ' + resultText);

      expect(resultText).assertContain('PASS');
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_PICTUREDRAWABLEDESCRIPTOR_SETHDRCOMPOSITION_PARAM_STATIC_0300
     * @tc.name     pictureDrawableDescriptorSetHdrCompositionNegativeRect_static_0100
     * @tc.desc     Test PictureDrawableDescriptor setHdrComposition with rect having negative x, y, width, height values
     * @tc.level    Level.LEVEL2
     */
    it('pictureDrawableDescriptorSetHdrCompositionNegativeRect_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[pictureDrawableDescriptorSetHdrCompositionNegativeRect_static_0100] START');
      const driver: Driver = Driver.create();
      const btnCreate: Driver.Component = await driver.findComponent(ON.id('btnCreateDrawable'));
      await (btnCreate?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_ASYNC);

      const button: Driver.Component = await driver.findComponent(ON.id('btnTest004'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_L);

      let strJson: string = inspector.getInspectorByKey('txtTestResult004');
      let obj: JSON.JsonElement = JSON.parseJsonElement(strJson);
      let resultText: string = obj.getElement('$attrs').getString('content');
      console.info('[pictureDrawableDescriptorSetHdrCompositionNegativeRect_static_0100] result: ' + resultText);

      expect(resultText).assertContain('PASS');
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_PICTUREDRAWABLEDESCRIPTOR_SETHDRCOMPOSITION_AFTERRELEASE_STATIC_0100
     * @tc.name     pictureDrawableDescriptorSetHdrCompositionAfterRelease_static_0100
     * @tc.desc     Test PictureDrawableDescriptor setHdrComposition after release, verify no crash or error thrown
     * @tc.level    Level.LEVEL2
     */
    it('pictureDrawableDescriptorSetHdrCompositionAfterRelease_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[pictureDrawableDescriptorSetHdrCompositionAfterRelease_static_0100] START');
      const driver: Driver = Driver.create();
      const btnCreate: Driver.Component = await driver.findComponent(ON.id('btnCreateDrawable'));
      await (btnCreate?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_ASYNC);

      const button: Driver.Component = await driver.findComponent(ON.id('btnTest005'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_L);

      let strJson: string = inspector.getInspectorByKey('txtTestResult005');
      let obj: JSON.JsonElement = JSON.parseJsonElement(strJson);
      let resultText: string = obj.getElement('$attrs').getString('content');
      console.info('[pictureDrawableDescriptorSetHdrCompositionAfterRelease_static_0100] result: ' + resultText);

      expect(resultText).assertContain('PASS');
      done();
    })
  })
}
