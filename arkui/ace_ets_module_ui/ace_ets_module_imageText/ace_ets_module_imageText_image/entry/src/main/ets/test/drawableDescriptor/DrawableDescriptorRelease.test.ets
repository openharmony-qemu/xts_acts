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

import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium'
import { UiComponent, UiDriver, Component, Driver, ON, BY } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function DrawableDescriptorReleaseTest() {
  describe('DrawableDescriptorReleaseTest', () => {
    beforeEach(async (done: Function) => {
      console.info('DrawableDescriptorReleaseTest beforeEach start');
      const options: router.RouterOptions = {
        url: 'MainAbility/pages/DrawableDescriptorRelease/DrawableDescriptorReleaseTest',
      }
      try {
        router.clear();
        const pages = router.getState();
        console.info('get DrawableDescriptorReleaseTest state success ' + JSON.stringify(pages));
        if (!pages.name.includes('DrawableDescriptorReleaseTest')) {
          const result = await router.replaceUrl(options);
          console.info('push DrawableDescriptorReleaseTest page success ' + JSON.stringify(result));
        }
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.error('push DrawableDescriptorReleaseTest page error:' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('DrawableDescriptorReleaseTest afterEach called');
    });

    /**
     * @tc.name   drawableDescriptorIsReleasedFalse_0100
     * @tc.number SUB_ARKUI_DRAWABLE_DESCRIPTOR_IS_RELEASED_FALSE_0100
     * @tc.desc   Test DrawableDescriptor isReleased method returns false before release and true after release
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('drawableDescriptorIsReleasedFalse_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[drawableDescriptorIsReleasedFalse_0100] START');
      try {
        let driver = await Driver.create();
        let button = await driver.findComponent(ON.id('btnTest001'));
        await button.click();
        await CommonFunc.sleep(1000);
        
        let strJson = getInspectorByKey('txtTestResult001');
        console.info('[drawableDescriptorIsReleasedFalse_0100] inspector: ' + strJson);
        let obj: ESObject = JSON.parse(strJson);
        let resultText: string = obj.$attrs.content;
        console.info('[drawableDescriptorIsReleasedFalse_0100] result: ' + resultText);
        
        expect(resultText).assertContain('PASS');
        console.info('[drawableDescriptorIsReleasedFalse_0100] END');
        done();
      } catch (error) {
        console.info('[drawableDescriptorIsReleasedFalse_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   drawableDescriptorGetPixelMapAfterRelease_0100
     * @tc.number SUB_ARKUI_DRAWABLE_DESCRIPTOR_GET_PIXEL_MAP_AFTER_RELEASE_0100
     * @tc.desc   Test DrawableDescriptor getPixelMap method throws error 111002 after release
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('drawableDescriptorGetPixelMapAfterRelease_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[drawableDescriptorGetPixelMapAfterRelease_0100] START');
      try {
        await CommonFunc.sleep(1000);
        let driver = await Driver.create();
        let button = await driver.findComponent(ON.id('btnTest002'));
        await button.click();
        await CommonFunc.sleep(1000);
        
        let strJson = getInspectorByKey('txtTestResult002');
        console.info('[drawableDescriptorGetPixelMapAfterRelease_0100] inspector: ' + strJson);
        let obj: ESObject = JSON.parse(strJson);
        let resultText: string = obj.$attrs.content;
        console.info('[drawableDescriptorGetPixelMapAfterRelease_0100] result: ' + resultText);
        
        expect(resultText).assertContain('PASS');
        expect(resultText).assertContain('111002');
        console.info('[drawableDescriptorGetPixelMapAfterRelease_0100] END');
        done();
      } catch (error) {
        console.info('[drawableDescriptorGetPixelMapAfterRelease_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   drawableDescriptorReleaseTwice_0100
     * @tc.number SUB_ARKUI_DRAWABLE_DESCRIPTOR_RELEASE_TWICE_0100
     * @tc.desc   Test DrawableDescriptor release method twice does not crash
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('drawableDescriptorReleaseTwice_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[drawableDescriptorReleaseTwice_0100] START');
      try {
        await CommonFunc.sleep(1000);      
        let driver = await Driver.create();
        let button = await driver.findComponent(ON.id('btnTest003'));
        await button.click();
        await CommonFunc.sleep(1000);
        
        let strJson = getInspectorByKey('txtTestResult003');
        console.info('[drawableDescriptorReleaseTwice_0100] inspector: ' + strJson);
        let obj: ESObject = JSON.parse(strJson);
        let resultText: string = obj.$attrs.content;
        console.info('[drawableDescriptorReleaseTwice_0100] result: ' + resultText);
        
        expect(resultText).assertContain('PASS');
        console.info('[drawableDescriptorReleaseTwice_0100] END');
        done();
      } catch (error) {
        console.info('[drawableDescriptorReleaseTwice_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   layeredDrawableDescriptorGetForegroundAfterRelease_0100
     * @tc.number SUB_ARKUI_LAYERED_DRAWABLE_DESCRIPTOR_GET_FOREGROUND_AFTER_RELEASE_0100
     * @tc.desc   Test LayeredDrawableDescriptor getForeground method throws error 111002 after release
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('layeredDrawableDescriptorGetForegroundAfterRelease_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[layeredDrawableDescriptorGetForegroundAfterRelease_0100] START');
      try {
        await CommonFunc.sleep(1000);       
        let driver = await Driver.create();
        let button = await driver.findComponent(ON.id('btnTest004'));
        await button.click();
        await CommonFunc.sleep(1000);
        
        let strJson = getInspectorByKey('txtTestResult004');
        console.info('[layeredDrawableDescriptorGetForegroundAfterRelease_0100] inspector: ' + strJson);
        let obj: ESObject = JSON.parse(strJson);
        let resultText: string = obj.$attrs.content;
        console.info('[layeredDrawableDescriptorGetForegroundAfterRelease_0100] result: ' + resultText);
        
        expect(resultText).assertContain('PASS');
        expect(resultText).assertContain('111002');
        console.info('[layeredDrawableDescriptorGetForegroundAfterRelease_0100] END');
        done();
      } catch (error) {
        console.info('[layeredDrawableDescriptorGetForegroundAfterRelease_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   layeredDrawableDescriptorGetBackgroundAfterRelease_0100
     * @tc.number SUB_ARKUI_LAYERED_DRAWABLE_DESCRIPTOR_GET_BACKGROUND_AFTER_RELEASE_0100
     * @tc.desc   Test LayeredDrawableDescriptor getBackground method throws error 111002 after release
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('layeredDrawableDescriptorGetBackgroundAfterRelease_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[layeredDrawableDescriptorGetBackgroundAfterRelease_0100] START');
      try {
        await CommonFunc.sleep(1000);   
        let driver = await Driver.create();
        let button = await driver.findComponent(ON.id('btnTest005'));
        await button.click();
        await CommonFunc.sleep(1000);
        
        let strJson = getInspectorByKey('txtTestResult005');
        console.info('[layeredDrawableDescriptorGetBackgroundAfterRelease_0100] inspector: ' + strJson);
        let obj: ESObject = JSON.parse(strJson);
        let resultText: string = obj.$attrs.content;
        console.info('[layeredDrawableDescriptorGetBackgroundAfterRelease_0100] result: ' + resultText);
        
        expect(resultText).assertContain('PASS');
        expect(resultText).assertContain('111002');
        console.info('[layeredDrawableDescriptorGetBackgroundAfterRelease_0100] END');
        done();
      } catch (error) {
        console.info('[layeredDrawableDescriptorGetBackgroundAfterRelease_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   layeredDrawableDescriptorGetMaskAfterRelease_0100
     * @tc.number SUB_ARKUI_LAYERED_DRAWABLE_DESCRIPTOR_GET_MASK_AFTER_RELEASE_0100
     * @tc.desc   Test LayeredDrawableDescriptor getMask method throws error 111002 after release
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('layeredDrawableDescriptorGetMaskAfterRelease_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[layeredDrawableDescriptorGetMaskAfterRelease_0100] START');
      try {
        await CommonFunc.sleep(1000);        
        let driver = await Driver.create();
        let button = await driver.findComponent(ON.id('btnTest006'));
        await button.click();
        await CommonFunc.sleep(1000);
        
        let strJson = getInspectorByKey('txtTestResult006');
        console.info('[layeredDrawableDescriptorGetMaskAfterRelease_0100] inspector: ' + strJson);
        let obj: ESObject = JSON.parse(strJson);
        let resultText: string = obj.$attrs.content;
        console.info('[layeredDrawableDescriptorGetMaskAfterRelease_0100] result: ' + resultText);
        
        expect(resultText).assertContain('PASS');
        expect(resultText).assertContain('111002');
        console.info('[layeredDrawableDescriptorGetMaskAfterRelease_0100] END');
        done();
      } catch (error) {
        console.info('[layeredDrawableDescriptorGetMaskAfterRelease_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   pixelMapDrawableDescriptorGetPixelMapAfterRelease_0100
     * @tc.number SUB_ARKUI_PIXEL_MAP_DRAWABLE_DESCRIPTOR_GET_PIXEL_MAP_AFTER_RELEASE_0100
     * @tc.desc   Test PixelMapDrawableDescriptor getPixelMap method throws error 111002 after release
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('pixelMapDrawableDescriptorGetPixelMapAfterRelease_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[pixelMapDrawableDescriptorGetPixelMapAfterRelease_0100] START');
      try {
        await CommonFunc.sleep(1000);        
        let driver = await Driver.create();
        let button = await driver.findComponent(ON.id('btnTest007'));
        await button.click();
        await CommonFunc.sleep(1000);
        
        let strJson = getInspectorByKey('txtTestResult007');
        console.info('[pixelMapDrawableDescriptorGetPixelMapAfterRelease_0100] inspector: ' + strJson);
        let obj: ESObject = JSON.parse(strJson);
        let resultText: string = obj.$attrs.content;
        console.info('[pixelMapDrawableDescriptorGetPixelMapAfterRelease_0100] result: ' + resultText);
        
        expect(resultText).assertContain('PASS');
        expect(resultText).assertContain('111002');
        console.info('[pixelMapDrawableDescriptorGetPixelMapAfterRelease_0100] END');
        done();
      } catch (error) {
        console.info('[pixelMapDrawableDescriptorGetPixelMapAfterRelease_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   animatedDrawableDescriptorGetPixelMapAfterRelease_0100
     * @tc.number SUB_ARKUI_ANIMATED_DRAWABLE_DESCRIPTOR_GET_PIXEL_MAP_AFTER_RELEASE_0100
     * @tc.desc   Test AnimatedDrawableDescriptor getPixelMap method throws error 111002 after release
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('animatedDrawableDescriptorGetPixelMapAfterRelease_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[animatedDrawableDescriptorGetPixelMapAfterRelease_0100] START');
      try {
        await CommonFunc.sleep(1000);        
        let driver = await Driver.create();
        let button = await driver.findComponent(ON.id('btnTest008'));
        await button.click();
        await CommonFunc.sleep(1000);
        
        let strJson = getInspectorByKey('txtTestResult008');
        console.info('[animatedDrawableDescriptorGetPixelMapAfterRelease_0100] inspector: ' + strJson);
        let obj: ESObject = JSON.parse(strJson);
        let resultText: string = obj.$attrs.content;
        console.info('[animatedDrawableDescriptorGetPixelMapAfterRelease_0100] result: ' + resultText);
        
        expect(resultText).assertContain('PASS');
        expect(resultText).assertContain('111002');
        console.info('[animatedDrawableDescriptorGetPixelMapAfterRelease_0100] END');
        done();
      } catch (error) {
        console.info('[animatedDrawableDescriptorGetPixelMapAfterRelease_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   animatedDrawableDescriptorGetAnimationControllerAfterRelease_0100
     * @tc.number SUB_ARKUI_ANIMATED_DRAWABLE_DESCRIPTOR_GET_ANIMATION_CONTROLLER_AFTER_RELEASE_0100
     * @tc.desc   Test AnimatedDrawableDescriptor getAnimationController method returns undefined after release
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('animatedDrawableDescriptorGetAnimationControllerAfterRelease_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[animatedDrawableDescriptorGetAnimationControllerAfterRelease_0100] START');
      try {
        await CommonFunc.sleep(1000);       
        let driver = await Driver.create();
        let button = await driver.findComponent(ON.id('btnTest009'));
        await button.click();
        await CommonFunc.sleep(1000);
        
        let strJson = getInspectorByKey('txtTestResult009');
        console.info('[animatedDrawableDescriptorGetAnimationControllerAfterRelease_0100] inspector: ' + strJson);
        let obj: ESObject = JSON.parse(strJson);
        let resultText: string = obj.$attrs.content;
        console.info('[animatedDrawableDescriptorGetAnimationControllerAfterRelease_0100] result: ' + resultText);
        
        expect(resultText).assertContain('PASS');
        expect(resultText).assertContain('undefined');
        console.info('[animatedDrawableDescriptorGetAnimationControllerAfterRelease_0100] END');
        done();
      } catch (error) {
        console.info('[animatedDrawableDescriptorGetAnimationControllerAfterRelease_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   animatedDrawableDescriptorLoadSyncAfterRelease_0100
     * @tc.number SUB_ARKUI_ANIMATED_DRAWABLE_DESCRIPTOR_LOAD_SYNC_AFTER_RELEASE_0100
     * @tc.desc   Test AnimatedDrawableDescriptor loadSync method throws error 111002 after release
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('animatedDrawableDescriptorLoadSyncAfterRelease_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[animatedDrawableDescriptorLoadSyncAfterRelease_0100] START');
      try {
        await CommonFunc.sleep(1000);       
        let driver = await Driver.create();
        let button = await driver.findComponent(ON.id('btnTest010'));
        await button.click();
        await CommonFunc.sleep(1000);
        
        let strJson = getInspectorByKey('txtTestResult010');
        console.info('[animatedDrawableDescriptorLoadSyncAfterRelease_0100] inspector: ' + strJson);
        let obj: ESObject = JSON.parse(strJson);
        let resultText: string = obj.$attrs.content;
        console.info('[animatedDrawableDescriptorLoadSyncAfterRelease_0100] result: ' + resultText);
        
        expect(resultText).assertContain('PASS');
        expect(resultText).assertContain('111002');
        console.info('[animatedDrawableDescriptorLoadSyncAfterRelease_0100] END');
        done();
      } catch (error) {
        console.info('[animatedDrawableDescriptorLoadSyncAfterRelease_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   animatedDrawableDescriptorLoadAfterRelease_0100
     * @tc.number SUB_ARKUI_ANIMATED_DRAWABLE_DESCRIPTOR_LOAD_AFTER_RELEASE_0100
     * @tc.desc   Test AnimatedDrawableDescriptor load method throws error 111002 after release
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('animatedDrawableDescriptorLoadAfterRelease_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[animatedDrawableDescriptorLoadAfterRelease_0100] START');
      try {
        await CommonFunc.sleep(1000);        
        let driver = await Driver.create();
        let button = await driver.findComponent(ON.id('btnTest011'));
        await button.click();
        await CommonFunc.sleep(1000);
        
        let strJson = getInspectorByKey('txtTestResult011');
        console.info('[animatedDrawableDescriptorLoadAfterRelease_0100] inspector: ' + strJson);
        let obj: ESObject = JSON.parse(strJson);
        let resultText: string = obj.$attrs.content;
        console.info('[animatedDrawableDescriptorLoadAfterRelease_0100] result: ' + resultText);
        
        expect(resultText).assertContain('PASS');
        expect(resultText).assertContain('111002');
        console.info('[animatedDrawableDescriptorLoadAfterRelease_0100] END');
        done();
      } catch (error) {
        console.info('[animatedDrawableDescriptorLoadAfterRelease_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   animatedDrawableDescriptorReleaseTwice_0100
     * @tc.number SUB_ARKUI_ANIMATED_DRAWABLE_DESCRIPTOR_RELEASE_TWICE_0100
     * @tc.desc   Test AnimatedDrawableDescriptor release method twice does not crash
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('animatedDrawableDescriptorReleaseTwice_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[animatedDrawableDescriptorReleaseTwice_0100] START');
      try {
        await CommonFunc.sleep(1000);        
        let driver = await Driver.create();
        let button = await driver.findComponent(ON.id('btnTest012'));
        await button.click();
        await CommonFunc.sleep(1000);
        
        let strJson = getInspectorByKey('txtTestResult012');
        console.info('[animatedDrawableDescriptorReleaseTwice_0100] inspector: ' + strJson);
        let obj: ESObject = JSON.parse(strJson);
        let resultText: string = obj.$attrs.content;
        console.info('[animatedDrawableDescriptorReleaseTwice_0100] result: ' + resultText);
        
        expect(resultText).assertContain('PASS');
        console.info('[animatedDrawableDescriptorReleaseTwice_0100] END');
        done();
      } catch (error) {
        console.info('[animatedDrawableDescriptorReleaseTwice_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    })
  })
}