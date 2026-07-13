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

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '@ohos/hypium-binary/src/main/indexStatic';
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

export default function PixelMapDrawableDescriptorConstructorTest() {
  describe('PixelMapDrawableDescriptorConstructorTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("PixelMapDrawableDescriptorConstructorTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.image.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("PixelMapDrawableDescriptorConstructorTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/drawableDescriptor/PixelMapDrawableDescriptorConstructor',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get PixelMapDrawableDescriptorConstructor state pages:" + JSON.stringify(pages));
        if (!("PixelMapDrawableDescriptorConstructor" == pages.name)) {
          console.info("get PixelMapDrawableDescriptorConstructor pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(SLEEP_TIME_L);
        }
      } catch (err) {
        console.error("push PixelMapDrawableDescriptorConstructor page error:" + err);
      }
      console.info("PixelMapDrawableDescriptorConstructorTest beforeEach end");
    });
    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME_L);
      console.info("PixelMapDrawableDescriptorConstructorTest after each called");
    });

    /**
     * @tc.number   SUB_ARKUI_PIXELMAPDRAWABLEDESCRIPTOR_CONSTRUCTOR_PARAM_STATIC_0100
     * @tc.name     pixelMapDrawableDescriptorConstructorNoParam_static_0100
     * @tc.desc     Test PixelMapDrawableDescriptor constructor with no parameter, verify object created and isReleased returns false
     * @tc.level    Level.LEVEL2
     */
    it('pixelMapDrawableDescriptorConstructorNoParam_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[pixelMapDrawableDescriptorConstructorNoParam_static_0100] START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btnTest001'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_L);

      let strJson = inspector.getInspectorByKey('txtTestResult001');
      let obj = JSON.parseJsonElement(strJson);
      let resultText: string = obj.getElement('$attrs').getString('content');
      console.info('[pixelMapDrawableDescriptorConstructorNoParam_static_0100] result: ' + resultText);

      expect(resultText).assertContain('PASS');
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_PIXELMAPDRAWABLEDESCRIPTOR_CONSTRUCTOR_PARAM_STATIC_0200
     * @tc.name     pixelMapDrawableDescriptorConstructorWithPixelMap_static_0100
     * @tc.desc     Test PixelMapDrawableDescriptor constructor with PixelMap parameter, verify getPixelMap returns PixelMap with matching dimensions
     * @tc.level    Level.LEVEL2
     */
    it('pixelMapDrawableDescriptorConstructorWithPixelMap_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[pixelMapDrawableDescriptorConstructorWithPixelMap_static_0100] START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btnTest002'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_ASYNC);

      let strJson = inspector.getInspectorByKey('txtTestResult002');
      let obj = JSON.parseJsonElement(strJson);
      let resultText: string = obj.getElement('$attrs').getString('content');
      console.info('[pixelMapDrawableDescriptorConstructorWithPixelMap_static_0100] result: ' + resultText);

      expect(resultText).assertContain('PASS');
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_PIXELMAPDRAWABLEDESCRIPTOR_CONSTRUCTOR_PARAM_STATIC_0300
     * @tc.name     pixelMapDrawableDescriptorConstructorWithResource_static_0100
     * @tc.desc     Test PixelMapDrawableDescriptor constructor with Resource parameter, verify getPixelMap returns valid PixelMap
     * @tc.level    Level.LEVEL2
     */
    it('pixelMapDrawableDescriptorConstructorWithResource_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[pixelMapDrawableDescriptorConstructorWithResource_static_0100] START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btnTest003'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_ASYNC);

      let strJson = inspector.getInspectorByKey('txtTestResult003');
      let obj = JSON.parseJsonElement(strJson);
      let resultText: string = obj.getElement('$attrs').getString('content');
      console.info('[pixelMapDrawableDescriptorConstructorWithResource_static_0100] result: ' + resultText);

      expect(resultText).assertContain('PASS');
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_PIXELMAPDRAWABLEDESCRIPTOR_CONSTRUCTOR_PARAM_STATIC_0400
     * @tc.name     pixelMapDrawableDescriptorConstructorWithSandboxPath_static_0100
     * @tc.desc     Test PixelMapDrawableDescriptor constructor with sandbox path string parameter, verify getPixelMap returns valid PixelMap
     * @tc.level    Level.LEVEL2
     */
    it('pixelMapDrawableDescriptorConstructorWithSandboxPath_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[pixelMapDrawableDescriptorConstructorWithSandboxPath_static_0100] START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btnTest004'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_ASYNC);

      let strJson = inspector.getInspectorByKey('txtTestResult004');
      let obj = JSON.parseJsonElement(strJson);
      let resultText: string = obj.getElement('$attrs').getString('content');
      console.info('[pixelMapDrawableDescriptorConstructorWithSandboxPath_static_0100] result: ' + resultText);

      expect(resultText).assertContain('PASS');
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_PIXELMAPDRAWABLEDESCRIPTOR_CONSTRUCTOR_PARAM_STATIC_0500
     * @tc.name     pixelMapDrawableDescriptorConstructorWithBase64_static_0100
     * @tc.desc     Test PixelMapDrawableDescriptor constructor with Base64 string parameter, verify getPixelMap returns valid PixelMap
     * @tc.level    Level.LEVEL2
     */
    it('pixelMapDrawableDescriptorConstructorWithBase64_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[pixelMapDrawableDescriptorConstructorWithBase64_static_0100] START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btnTest005'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_ASYNC);

      let strJson = inspector.getInspectorByKey('txtTestResult005');
      let obj = JSON.parseJsonElement(strJson);
      let resultText: string = obj.getElement('$attrs').getString('content');
      console.info('[pixelMapDrawableDescriptorConstructorWithBase64_static_0100] result: ' + resultText);

      expect(resultText).assertContain('PASS');
      done();
    })
  })
}