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

export default function PixelMapDrawableDescriptorConstructorTest() {
  describe('PixelMapDrawableDescriptorConstructorTest', () => {
    beforeEach(async (done: Function) => {
      console.info('PixelMapDrawableDescriptorConstructorTest beforeEach start');
      const options: router.RouterOptions = {
        url: 'MainAbility/pages/DrawableDescriptorRelease/PixelMapDrawableDescriptorConstructorTest',
      }
      try {
        router.clear();
        const pages = router.getState();
        console.info('get PixelMapDrawableDescriptorConstructorTest state success ' + JSON.stringify(pages));
        if (!pages.name.includes('PixelMapDrawableDescriptorConstructorTest')) {
          const result = await router.replaceUrl(options);
          console.info('push PixelMapDrawableDescriptorConstructorTest page success ' + JSON.stringify(result));
        }
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.error('push PixelMapDrawableDescriptorConstructorTest page error:' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('PixelMapDrawableDescriptorConstructorTest afterEach called');
    });

    /**
     * @tc.name   pixelMapDrawableDescriptorConstructorPixelMap001
     * @tc.number SUB_ARKUI_PIXELMAP_DRAWABLEDESCRIPTOR_CONSTRUCTOR_PIXELMAP_0010
     * @tc.desc   Test PixelMapDrawableDescriptor constructor with PixelMap parameter. since 26.0.0
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level   Level3
     */
    it('pixelMapDrawableDescriptorConstructorPixelMap001', Level.LEVEL3, async (done: Function) => {
      console.info('[pixelMapDrawableDescriptorConstructorPixelMap001] START');
      try {
        let driver = await Driver.create();
        let button = await driver.findComponent(ON.id('btnTest001'));
        await button.click();
        await CommonFunc.sleep(1000);
        
        let strJson = getInspectorByKey('txtTestResult001');
        console.info('[pixelMapDrawableDescriptorConstructorPixelMap001] inspector: ' + strJson);
        let obj: ESObject = JSON.parse(strJson);
        let resultText: string = obj.$attrs.content
        console.info('[pixelMapDrawableDescriptorConstructorPixelMap001] result: ' + resultText);     
        expect(resultText).assertContain('PASS');
        console.info('[pixelMapDrawableDescriptorConstructorPixelMap001] END');
        done();
      } catch (error) {
        console.info('[pixelMapDrawableDescriptorConstructorPixelMap001] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   pixelMapDrawableDescriptorConstructorAppResource001
     * @tc.number SUB_ARKUI_PIXELMAP_DRAWABLEDESCRIPTOR_CONSTRUCTOR_APPRESOURCE_0010
     * @tc.desc   Test PixelMapDrawableDescriptor constructor with app resource $r parameter. since 26.0.0
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level   Level3
     */
    it('pixelMapDrawableDescriptorConstructorAppResource001', Level.LEVEL3, async (done: Function) => {
      console.info('[pixelMapDrawableDescriptorConstructorAppResource001] START');
      try {
        let driver = await Driver.create();
        let button = await driver.findComponent(ON.id('btnTest002'));
        await button.click();
        await CommonFunc.sleep(1000);
        
        let strJson = getInspectorByKey('txtTestResult002');
        console.info('[pixelMapDrawableDescriptorConstructorAppResource001] inspector: ' + strJson);
        let obj: ESObject = JSON.parse(strJson);
        let resultText: string = obj.$attrs.content
        console.info('[pixelMapDrawableDescriptorConstructorAppResource001] result: ' + resultText);       
        expect(resultText).assertContain('PASS');
        console.info('[pixelMapDrawableDescriptorConstructorAppResource001] END');
        done();
      } catch (error) {
        console.info('[pixelMapDrawableDescriptorConstructorAppResource001] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   pixelMapDrawableDescriptorConstructorSysResource001
     * @tc.number SUB_ARKUI_PIXELMAP_DRAWABLEDESCRIPTOR_CONSTRUCTOR_SYSRESOURCE_0010
     * @tc.desc   Test PixelMapDrawableDescriptor constructor with system resource $r parameter. since 26.0.0
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level   Level3
     */
    it('pixelMapDrawableDescriptorConstructorSysResource001', Level.LEVEL3, async (done: Function) => {
      console.info('[pixelMapDrawableDescriptorConstructorSysResource001] START');
      try {
        let driver = await Driver.create();
        let button = await driver.findComponent(ON.id('btnTest003'));
        await button.click();
        await CommonFunc.sleep(1000);
        
        let strJson = getInspectorByKey('txtTestResult003');
        console.info('[pixelMapDrawableDescriptorConstructorSysResource001] inspector: ' + strJson);
        let obj: ESObject = JSON.parse(strJson);
        let resultText: string = obj.$attrs.content
        console.info('[pixelMapDrawableDescriptorConstructorSysResource001] result: ' + resultText);
        expect(resultText).assertContain('PASS');
        console.info('[pixelMapDrawableDescriptorConstructorSysResource001] END');
        done();
      } catch (error) {
        console.info('[pixelMapDrawableDescriptorConstructorSysResource001] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   pixelMapDrawableDescriptorConstructorUndefined001
     * @tc.number SUB_ARKUI_PIXEL_MAP_DRAWABLE_DESCRIPTOR_CONSTRUCTOR_UNDEFINED_0010
     * @tc.desc   Test PixelMapDrawableDescriptor constructor with undefined parameter. since 26.0.0
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level   Level3
     */
    it('pixelMapDrawableDescriptorConstructorUndefined001', Level.LEVEL3, async (done: Function) => {
      console.info('[pixelMapDrawableDescriptorConstructorUndefined001] START');
      try {
        let driver = await Driver.create();
        let button = await driver.findComponent(ON.id('btnTest006'));
        await button.click();
        await CommonFunc.sleep(1000);
        
        let strJson = getInspectorByKey('txtTestResult006');
        console.info('[pixelMapDrawableDescriptorConstructorUndefined001] inspector: ' + strJson);
        let obj: ESObject = JSON.parse(strJson);
        let resultText: string = obj.$attrs.content
        console.info('[pixelMapDrawableDescriptorConstructorUndefined001] result: ' + resultText);
        expect(resultText).assertContain('PASS');
        console.info('[pixelMapDrawableDescriptorConstructorUndefined001] END');
        done();
      } catch (error) {
        console.info('[pixelMapDrawableDescriptorConstructorUndefined001] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    })
  })
}