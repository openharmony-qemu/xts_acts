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

export default function DrawableDescriptorReleaseTest() {
  describe('DrawableDescriptorReleaseTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("DrawableDescriptorReleaseTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.image.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("DrawableDescriptorReleaseTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/drawableDescriptor/DrawableDescriptorReleaseTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get DrawableDescriptorReleaseTest state pages:" + JSON.stringify(pages));
        if (!("DrawableDescriptorReleaseTest" == pages.name)) {
          console.info("get DrawableDescriptorReleaseTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(SLEEP_TIME_L);
        }
      } catch (err) {
        console.error("push DrawableDescriptorReleaseTest page error:" + err);
      }
      console.info("DrawableDescriptorReleaseTest beforeEach end");
    });
    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME_L);
      console.info("DrawableDescriptorReleaseTest after each called");
    });

    /**
     * @tc.number   SUB_ARKUI_DRAWABLEDESCRIPTOR_ISRELEASED_FALSE_STATIC_0100
     * @tc.name     drawableDescriptorIsReleasedFalse_static_0100
     * @tc.desc     Test DrawableDescriptor isReleased method returns false before release and true after release
     * @tc.level    Level.LEVEL2
     */
    it('drawableDescriptorIsReleasedFalse_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[drawableDescriptorIsReleasedFalse_static_0100] START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btnTest001'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_L);

      let strJson = inspector.getInspectorByKey('txtTestResult001');
      let obj = JSON.parseJsonElement(strJson);
      let resultText: string = obj.getElement('$attrs').getString('content');
      console.info('[drawableDescriptorIsReleasedFalse_static_0100] result: ' + resultText);

      expect(resultText).assertContain('PASS');
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_DRAWABLEDESCRIPTOR_GETPIXELMAP_AFTERRELEASE_STATIC_0100
     * @tc.name     drawableDescriptorGetPixelMapAfterRelease_static_0100
     * @tc.desc     Test DrawableDescriptor getPixelMap method throws error 111002 after release
     * @tc.level    Level.LEVEL2
     */
    it('drawableDescriptorGetPixelMapAfterRelease_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[drawableDescriptorGetPixelMapAfterRelease_static_0100] START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btnTest002'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_L);

      let strJson = inspector.getInspectorByKey('txtTestResult002');
      let obj = JSON.parseJsonElement(strJson);
      let resultText: string = obj.getElement('$attrs').getString('content');
      console.info('[drawableDescriptorGetPixelMapAfterRelease_static_0100] result: ' + resultText);

      expect(resultText).assertContain('PASS');
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_DRAWABLEDESCRIPTOR_RELEASETWICE_STATIC_0100
     * @tc.name     drawableDescriptorReleaseTwice_static_0100
     * @tc.desc     Test DrawableDescriptor release method twice does not crash
     * @tc.level    Level.LEVEL2
     */
    it('drawableDescriptorReleaseTwice_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[drawableDescriptorReleaseTwice_static_0100] START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btnTest003'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_L);

      let strJson = inspector.getInspectorByKey('txtTestResult003');
      let obj = JSON.parseJsonElement(strJson);
      let resultText: string = obj.getElement('$attrs').getString('content');
      console.info('[drawableDescriptorReleaseTwice_static_0100] result: ' + resultText);

      expect(resultText).assertContain('PASS');
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_LAYEREDDRAWABLEDESCRIPTOR_GETFOREGROUND_AFTERRELEASE_STATIC_0100
     * @tc.name     layeredDrawableDescriptorGetForegroundAfterRelease_static_0100
     * @tc.desc     Test LayeredDrawableDescriptor getForeground method throws error 111002 after release
     * @tc.level    Level.LEVEL2
     */
    it('layeredDrawableDescriptorGetForegroundAfterRelease_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[layeredDrawableDescriptorGetForegroundAfterRelease_static_0100] START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btnTest004'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_L);

      let strJson = inspector.getInspectorByKey('txtTestResult004');
      let obj = JSON.parseJsonElement(strJson);
      let resultText: string = obj.getElement('$attrs').getString('content');
      console.info('[layeredDrawableDescriptorGetForegroundAfterRelease_static_0100] result: ' + resultText);

      expect(resultText).assertContain('PASS');
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_LAYEREDDRAWABLEDESCRIPTOR_GETBACKGROUND_AFTERRELEASE_STATIC_0100
     * @tc.name     layeredDrawableDescriptorGetBackgroundAfterRelease_static_0100
     * @tc.desc     Test LayeredDrawableDescriptor getBackground method throws error 111002 after release
     * @tc.level    Level.LEVEL2
     */
    it('layeredDrawableDescriptorGetBackgroundAfterRelease_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[layeredDrawableDescriptorGetBackgroundAfterRelease_static_0100] START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btnTest005'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_L);

      let strJson = inspector.getInspectorByKey('txtTestResult005');
      let obj = JSON.parseJsonElement(strJson);
      let resultText: string = obj.getElement('$attrs').getString('content');
      console.info('[layeredDrawableDescriptorGetBackgroundAfterRelease_static_0100] result: ' + resultText);

      expect(resultText).assertContain('PASS');
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_LAYEREDDRAWABLEDESCRIPTOR_GETMASK_AFTERRELEASE_STATIC_0100
     * @tc.name     layeredDrawableDescriptorGetMaskAfterRelease_static_0100
     * @tc.desc     Test LayeredDrawableDescriptor getMask method throws error 111002 after release
     * @tc.level    Level.LEVEL2
     */
    it('layeredDrawableDescriptorGetMaskAfterRelease_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[layeredDrawableDescriptorGetMaskAfterRelease_static_0100] START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btnTest006'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_L);

      let strJson = inspector.getInspectorByKey('txtTestResult006');
      let obj = JSON.parseJsonElement(strJson);
      let resultText: string = obj.getElement('$attrs').getString('content');
      console.info('[layeredDrawableDescriptorGetMaskAfterRelease_static_0100] result: ' + resultText);

      expect(resultText).assertContain('PASS');
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_PIXELMAPDRAWABLEDESCRIPTOR_GETPIXELMAP_AFTERRELEASE_STATIC_0100
     * @tc.name     pixelMapDrawableDescriptorGetPixelMapAfterRelease_static_0100
     * @tc.desc     Test PixelMapDrawableDescriptor getPixelMap method throws error 111002 after release
     * @tc.level    Level.LEVEL2
     */
    it('pixelMapDrawableDescriptorGetPixelMapAfterRelease_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[pixelMapDrawableDescriptorGetPixelMapAfterRelease_static_0100] START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btnTest007'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_L);

      let strJson = inspector.getInspectorByKey('txtTestResult007');
      let obj = JSON.parseJsonElement(strJson);
      let resultText: string = obj.getElement('$attrs').getString('content');
      console.info('[pixelMapDrawableDescriptorGetPixelMapAfterRelease_static_0100] result: ' + resultText);

      expect(resultText).assertContain('PASS');
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_ANIMATEDDRAWABLEDESCRIPTOR_GETPIXELMAP_AFTERRELEASE_STATIC_0100
     * @tc.name     animatedDrawableDescriptorGetPixelMapAfterRelease_static_0100
     * @tc.desc     Test AnimatedDrawableDescriptor getPixelMap method throws error 111002 after release
     * @tc.level    Level.LEVEL2
     */
    it('animatedDrawableDescriptorGetPixelMapAfterRelease_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[animatedDrawableDescriptorGetPixelMapAfterRelease_static_0100] START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btnTest008'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_L);

      let strJson = inspector.getInspectorByKey('txtTestResult008');
      let obj = JSON.parseJsonElement(strJson);
      let resultText: string = obj.getElement('$attrs').getString('content');
      console.info('[animatedDrawableDescriptorGetPixelMapAfterRelease_static_0100] result: ' + resultText);

      expect(resultText).assertContain('PASS');
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_ANIMATEDDRAWABLEDESCRIPTOR_GETANIMATIONCONTROLLER_AFTERRELEASE_STATIC_0100
     * @tc.name     animatedDrawableDescriptorGetAnimationControllerAfterRelease_static_0100
     * @tc.desc     Test AnimatedDrawableDescriptor getAnimationController method returns undefined after release
     * @tc.level    Level.LEVEL2
     */
    it('animatedDrawableDescriptorGetAnimationControllerAfterRelease_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[animatedDrawableDescriptorGetAnimationControllerAfterRelease_static_0100] START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btnTest009'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_L);

      let strJson = inspector.getInspectorByKey('txtTestResult009');
      let obj = JSON.parseJsonElement(strJson);
      let resultText: string = obj.getElement('$attrs').getString('content');
      console.info('[animatedDrawableDescriptorGetAnimationControllerAfterRelease_static_0100] result: ' + resultText);

      expect(resultText).assertContain('PASS');
      expect(resultText).assertContain('undefined');
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_ANIMATEDDRAWABLEDESCRIPTOR_LOADSYNC_AFTERRELEASE_STATIC_0100
     * @tc.name     animatedDrawableDescriptorLoadSyncAfterRelease_static_0100
     * @tc.desc     Test AnimatedDrawableDescriptor loadSync method throws error 111002 after release
     * @tc.level    Level.LEVEL2
     */
    it('animatedDrawableDescriptorLoadSyncAfterRelease_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[animatedDrawableDescriptorLoadSyncAfterRelease_static_0100] START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btnTest010'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_L);

      let strJson = inspector.getInspectorByKey('txtTestResult010');
      let obj = JSON.parseJsonElement(strJson);
      let resultText: string = obj.getElement('$attrs').getString('content');
      console.info('[animatedDrawableDescriptorLoadSyncAfterRelease_static_0100] result: ' + resultText);

      expect(resultText).assertContain('PASS');
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_ANIMATEDDRAWABLEDESCRIPTOR_RELEASETWICE_STATIC_0100
     * @tc.name     animatedDrawableDescriptorReleaseTwice_static_0100
     * @tc.desc     Test AnimatedDrawableDescriptor release method twice does not crash
     * @tc.level    Level.LEVEL2
     */
    it('animatedDrawableDescriptorReleaseTwice_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[animatedDrawableDescriptorReleaseTwice_static_0100] START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btnTest012'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_L);

      let strJson = inspector.getInspectorByKey('txtTestResult012');
      let obj = JSON.parseJsonElement(strJson);
      let resultText: string = obj.getElement('$attrs').getString('content');
      console.info('[animatedDrawableDescriptorReleaseTwice_static_0100] result: ' + resultText);

      expect(resultText).assertContain('PASS');
      done();
    })
  })
}
