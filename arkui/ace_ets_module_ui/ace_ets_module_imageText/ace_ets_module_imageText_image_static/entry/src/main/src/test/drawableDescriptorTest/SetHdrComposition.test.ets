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
 * distributed under the License is distributed on an "AS IS" BASIS,
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

const SLEEP_TIME_L = 1000;
const SLEEP_TIME_ASYNC = 3000;

export default function SetHdrCompositionTest() {
  describe('SetHdrCompositionTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("SetHdrCompositionTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.image.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("SetHdrCompositionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/drawableDescriptor/PictureDrawableDescriptorSetHdrComposition',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SetHdrCompositionTest state pages:" + JSON.stringify(pages));
        if (!("PictureDrawableDescriptorSetHdrComposition" == pages.name)) {
          console.info("get SetHdrCompositionTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(SLEEP_TIME_L);
        }
      } catch (err) {
        console.error("push SetHdrCompositionTest page error:" + err);
      }
      console.info("SetHdrCompositionTest beforeEach end");
    });
    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME_L);
      console.info("SetHdrCompositionTest after each called");
    });

    /**
     * @tc.number   SUB_ARKUI_PICTUREDRAWABLEDESCRIPTOR_SETHDRCOMPOSITION_PARAM_STATIC_0100
     * @tc.name     pictureDrawableDescriptorSetHdrCompositionNormalRect_static_0100
     * @tc.desc     Test PictureDrawableDescriptor setHdrComposition with normal positive rect values
     * @tc.level    Level.LEVEL2
     */
    it('pictureDrawableDescriptorSetHdrCompositionNormalRect_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[pictureDrawableDescriptorSetHdrCompositionNormalRect_static_0100] START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btnTest001'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_ASYNC);

      let strJson = inspector.getInspectorByKey('txtTestResult001');
      let obj = JSON.parseJsonElement(strJson);
      let resultText: string = obj.getElement('$attrs').getString('content');
      console.info('[pictureDrawableDescriptorSetHdrCompositionNormalRect_static_0100] result: ' + resultText);

      expect(resultText).assertContain('PASS');
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_PICTUREDRAWABLEDESCRIPTOR_SETHDRCOMPOSITION_BOUNDARY_STATIC_0100
     * @tc.name     pictureDrawableDescriptorSetHdrCompositionZeroRect_static_0100
     * @tc.desc     Test PictureDrawableDescriptor setHdrComposition with zero rect values (boundary)
     * @tc.level    Level.LEVEL2
     */
    it('pictureDrawableDescriptorSetHdrCompositionZeroRect_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[pictureDrawableDescriptorSetHdrCompositionZeroRect_static_0100] START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btnTest002'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_ASYNC);

      let strJson = inspector.getInspectorByKey('txtTestResult002');
      let obj = JSON.parseJsonElement(strJson);
      let resultText: string = obj.getElement('$attrs').getString('content');
      console.info('[pictureDrawableDescriptorSetHdrCompositionZeroRect_static_0100] result: ' + resultText);

      expect(resultText).assertContain('PASS');
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_PICTUREDRAWABLEDESCRIPTOR_SETHDRCOMPOSITION_BOUNDARY_STATIC_0200
     * @tc.name     pictureDrawableDescriptorSetHdrCompositionLargeRect_static_0100
     * @tc.desc     Test PictureDrawableDescriptor setHdrComposition with large rect values (boundary)
     * @tc.level    Level.LEVEL2
     */
    it('pictureDrawableDescriptorSetHdrCompositionLargeRect_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[pictureDrawableDescriptorSetHdrCompositionLargeRect_static_0100] START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btnTest003'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_ASYNC);

      let strJson = inspector.getInspectorByKey('txtTestResult003');
      let obj = JSON.parseJsonElement(strJson);
      let resultText: string = obj.getElement('$attrs').getString('content');
      console.info('[pictureDrawableDescriptorSetHdrCompositionLargeRect_static_0100] result: ' + resultText);

      expect(resultText).assertContain('PASS');
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_PICTUREDRAWABLEDESCRIPTOR_SETHDRCOMPOSITION_PARAM_STATIC_0200
     * @tc.name     pictureDrawableDescriptorSetHdrCompositionNegativeRect_static_0100
     * @tc.desc     Test PictureDrawableDescriptor setHdrComposition with negative rect values
     * @tc.level    Level.LEVEL2
     */
    it('pictureDrawableDescriptorSetHdrCompositionNegativeRect_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[pictureDrawableDescriptorSetHdrCompositionNegativeRect_static_0100] START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btnTest004'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_ASYNC);

      let strJson = inspector.getInspectorByKey('txtTestResult004');
      let obj = JSON.parseJsonElement(strJson);
      let resultText: string = obj.getElement('$attrs').getString('content');
      console.info('[pictureDrawableDescriptorSetHdrCompositionNegativeRect_static_0100] result: ' + resultText);

      expect(resultText).assertContain('PASS');
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_PICTUREDRAWABLEDESCRIPTOR_SETHDRCOMPOSITION_PARAM_STATIC_0300
     * @tc.name     pictureDrawableDescriptorSetHdrCompositionOverwrite_static_0100
     * @tc.desc     Test PictureDrawableDescriptor setHdrComposition called twice with different configs (overwrite)
     * @tc.level    Level.LEVEL2
     */
    it('pictureDrawableDescriptorSetHdrCompositionOverwrite_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[pictureDrawableDescriptorSetHdrCompositionOverwrite_static_0100] START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btnTest005'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_ASYNC);

      let strJson = inspector.getInspectorByKey('txtTestResult005');
      let obj = JSON.parseJsonElement(strJson);
      let resultText: string = obj.getElement('$attrs').getString('content');
      console.info('[pictureDrawableDescriptorSetHdrCompositionOverwrite_static_0100] result: ' + resultText);

      expect(resultText).assertContain('PASS');
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_PICTUREDRAWABLEDESCRIPTOR_SETHDRCOMPOSITION_ERROR_STATIC_0100
     * @tc.name     pictureDrawableDescriptorSetHdrCompositionAfterRelease_static_0100
     * @tc.desc     Test PictureDrawableDescriptor setHdrComposition throws error 111002 after release
     * @tc.level    Level.LEVEL2
     */
    it('pictureDrawableDescriptorSetHdrCompositionAfterRelease_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[pictureDrawableDescriptorSetHdrCompositionAfterRelease_static_0100] START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btnTest006'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_ASYNC);

      let strJson = inspector.getInspectorByKey('txtTestResult006');
      let obj = JSON.parseJsonElement(strJson);
      let resultText: string = obj.getElement('$attrs').getString('content');
      console.info('[pictureDrawableDescriptorSetHdrCompositionAfterRelease_static_0100] result: ' + resultText);

      expect(resultText).assertContain('PASS');
      done();
    })
  })
}