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

import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium'
import { UiComponent, UiDriver, Component, Driver, ON, BY } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function PictureDrawableDescriptorSetHdrCompositionTest() {
  describe('PictureDrawableDescriptorSetHdrCompositionTest', () => {
    beforeEach(async (done: Function) => {
      console.info('PictureDrawableDescriptorSetHdrCompositionTest beforeEach start');
      const options: router.RouterOptions = {
        url: 'MainAbility/pages/DrawableDescriptorRelease/PictureDrawableDescriptorSetHdrCompositionTest',
      }
      try {
        router.clear();
        const pages = router.getState();
        console.info('get PictureDrawableDescriptorSetHdrCompositionTest state success ' + JSON.stringify(pages));
        if (!pages.name.includes('PictureDrawableDescriptorSetHdrCompositionTest')) {
          const result = await router.replaceUrl(options);
          console.info('push PictureDrawableDescriptorSetHdrCompositionTest page success ' + JSON.stringify(result));
        }
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.error('push PictureDrawableDescriptorSetHdrCompositionTest page error:' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('PictureDrawableDescriptorSetHdrCompositionTest afterEach called');
    });

    /**
     * @tc.name   pictureDrawableDescriptorSetHdrCompositionNormal001
     * @tc.number SUB_ARKUI_PICTURE_DRAWABLE_DESCRIPTOR_SETHDRCOMPOSITION_PARAM_0010
     * @tc.desc   Test PictureDrawableDescriptor setHdrComposition with normal rect config. since 26.0.0
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level3
     */
    it('pictureDrawableDescriptorSetHdrCompositionNormal001', Level.LEVEL3, async (done: Function) => {
      console.info('[pictureDrawableDescriptorSetHdrCompositionNormal001] START');
      try {
        let driver = await Driver.create();
        let btnCreateDrawable = await driver.findComponent(ON.id('btnCreateDrawable'));
        await btnCreateDrawable.click();
        await CommonFunc.sleep(1000);

        let button = await driver.findComponent(ON.id('btnTest001'));
        await button.click();
        await CommonFunc.sleep(1000);
        
        let strJson = getInspectorByKey('txtTestResult001');
        console.info('[pictureDrawableDescriptorSetHdrCompositionNormal001] inspector: ' + strJson);
        let obj: ESObject = JSON.parse(strJson);
        let resultText: string = obj.$attrs.content;
        console.info('[pictureDrawableDescriptorSetHdrCompositionNormal001] result: ' + resultText);     
        expect(resultText).assertContain('FAIL');
        console.info('[pictureDrawableDescriptorSetHdrCompositionNormal001] END');
        done();
      } catch (error) {
        console.info('[pictureDrawableDescriptorSetHdrCompositionNormal001] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   pictureDrawableDescriptorSetHdrCompositionInvalidate001
     * @tc.number SUB_ARKUI_PICTURE_DRAWABLE_DESCRIPTOR_SETHDRCOMPOSITION_PARAM_0020
     * @tc.desc   Test PictureDrawableDescriptor setHdrComposition with invalidate to trigger rebuild. since 26.0.0
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level   Level3
     */
    it('pictureDrawableDescriptorSetHdrCompositionInvalidate001', Level.LEVEL3, async (done: Function) => {
      console.info('[pictureDrawableDescriptorSetHdrCompositionInvalidate001] START');
      try {
        let driver = await Driver.create();
        let btnCreateDrawable = await driver.findComponent(ON.id('btnCreateDrawable'));
        await btnCreateDrawable.click();
        await CommonFunc.sleep(1000);

        let button = await driver.findComponent(ON.id('btnTest002'));
        await button.click();
        await CommonFunc.sleep(1000);
        
        let strJson = getInspectorByKey('txtTestResult002');
        console.info('[pictureDrawableDescriptorSetHdrCompositionInvalidate001] inspector: ' + strJson);
        let obj: ESObject = JSON.parse(strJson);
        let resultText: string = obj.$attrs.content;
        console.info('[pictureDrawableDescriptorSetHdrCompositionInvalidate001] result: ' + resultText);  
        expect(resultText).assertContain('FAIL');
        console.info('[pictureDrawableDescriptorSetHdrCompositionInvalidate001] END');
        done();
      } catch (error) {
        console.info('[pictureDrawableDescriptorSetHdrCompositionInvalidate001] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   pictureDrawableDescriptorSetHdrCompositionZero001
     * @tc.number SUB_ARKUI_PICTURE_DRAWABLE_DESCRIPTOR_SETHDRCOMPOSITION_BOUNDARY_0010
     * @tc.desc   Test PictureDrawableDescriptor setHdrComposition with rect zero values. since 26.0.0
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level   Level3
     */
    it('pictureDrawableDescriptorSetHdrCompositionZero001', Level.LEVEL3, async (done: Function) => {
      console.info('[pictureDrawableDescriptorSetHdrCompositionZero001] START');
      try {
        let driver = await Driver.create();
        let btnCreateDrawable = await driver.findComponent(ON.id('btnCreateDrawable'));
        await btnCreateDrawable.click();
        await CommonFunc.sleep(1000);

        let button = await driver.findComponent(ON.id('btnTest003'));
        await button.click();
        await CommonFunc.sleep(1000);
        
        let strJson = getInspectorByKey('txtTestResult003');
        console.info('[pictureDrawableDescriptorSetHdrCompositionZero001] inspector: ' + strJson);
        let obj: ESObject = JSON.parse(strJson);
        let resultText: string = obj.$attrs.content;
        console.info('[pictureDrawableDescriptorSetHdrCompositionZero001] result: ' + resultText);
        expect(resultText).assertContain('FAIL');
        console.info('[pictureDrawableDescriptorSetHdrCompositionZero001] END');
        done();
      } catch (error) {
        console.info('[pictureDrawableDescriptorSetHdrCompositionZero001] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   pictureDrawableDescriptorSetHdrCompositionNegative001
     * @tc.number SUB_ARKUI_PICTURE_DRAWABLE_DESCRIPTOR_SETHDRCOMPOSITION_BOUNDARY_0020
     * @tc.desc   Test PictureDrawableDescriptor setHdrComposition with rect negative values. since 26.0.0
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level   Level3
     */
    it('pictureDrawableDescriptorSetHdrCompositionNegative001', Level.LEVEL3, async (done: Function) => {
      console.info('[pictureDrawableDescriptorSetHdrCompositionNegative001] START');
      try {
        let driver = await Driver.create();
        let btnCreateDrawable = await driver.findComponent(ON.id('btnCreateDrawable'));
        await btnCreateDrawable.click();
        await CommonFunc.sleep(1000);
        
        let button = await driver.findComponent(ON.id('btnTest004'));
        await button.click();
        await CommonFunc.sleep(1000);
        
        let strJson = getInspectorByKey('txtTestResult004');
        console.info('[pictureDrawableDescriptorSetHdrCompositionNegative001] inspector: ' + strJson);
        let obj: ESObject = JSON.parse(strJson);
        let resultText: string = obj.$attrs.content;
        console.info('[pictureDrawableDescriptorSetHdrCompositionNegative001] result: ' + resultText);
        expect(resultText).assertContain('FAIL');
        console.info('[pictureDrawableDescriptorSetHdrCompositionNegative001] END');
        done();
      } catch (error) {
        console.info('[pictureDrawableDescriptorSetHdrCompositionNegative001] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    })
  })
}