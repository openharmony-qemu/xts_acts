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

export default function GetMaskClipPathTest() {
  describe('GetMaskClipPathTest', () => {
    beforeEach(async (done: Function) => {
      console.info('GetMaskClipPathTest beforeEach start');
      const options: router.RouterOptions = {
        url: 'MainAbility/pages/DrawableDescriptorRelease/GetMaskClipPathTest',
      }
      try {
        router.clear();
        const pages = router.getState();
        console.info('get GetMaskClipPathTest state success ' + JSON.stringify(pages));
        if (!pages.name.includes('GetMaskClipPathTest')) {
          const result = await router.replaceUrl(options);
          console.info('push GetMaskClipPathTest page success ' + JSON.stringify(result));
        }
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.error('push GetMaskClipPathTest page error:' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('GetMaskClipPathTest afterEach called');
    });

    /**
     * @tc.name   getMaskClipPathReturnType_0100
     * @tc.number SUB_ARKUI_LAYERED_DRAWABLE_DESCRIPTOR_GET_MASK_CLIP_PATH_RETURN_0100
     * @tc.desc   Test LayeredDrawableDescriptor.getMaskClipPath returns value of type string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('getMaskClipPathReturnType_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[getMaskClipPathReturnType_0100] START');
      try {
        let driver = await Driver.create();
        let button = await driver.findComponent(ON.id('btnTest001'));
        await button.click();
        await CommonFunc.sleep(1000);

        let strJson = getInspectorByKey('txtTestResult001');
        console.info('[getMaskClipPathReturnType_0100] inspector: ' + strJson);
        let obj: ESObject = JSON.parse(strJson);
        let resultText: string = obj.$attrs.content;
        console.info('[getMaskClipPathReturnType_0100] result: ' + resultText);

        expect(resultText).assertContain('PASS');
        console.info('[getMaskClipPathReturnType_0100] END');
        done();
      } catch (error) {
        console.info('[getMaskClipPathReturnType_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   getMaskClipPathNotEmpty_0100
     * @tc.number SUB_ARKUI_LAYERED_DRAWABLE_DESCRIPTOR_GET_MASK_CLIP_PATH_RETURN_0200
     * @tc.desc   Test LayeredDrawableDescriptor.getMaskClipPath returns non-empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('getMaskClipPathNotEmpty_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[getMaskClipPathNotEmpty_0100] START');
      try {
        let driver = await Driver.create();
        let button = await driver.findComponent(ON.id('btnTest002'));
        await button.click();
        await CommonFunc.sleep(1000);

        let strJson = getInspectorByKey('txtTestResult002');
        console.info('[getMaskClipPathNotEmpty_0100] inspector: ' + strJson);
        let obj: ESObject = JSON.parse(strJson);
        let resultText: string = obj.$attrs.content;
        console.info('[getMaskClipPathNotEmpty_0100] result: ' + resultText);

        expect(resultText).assertContain('PASS');
        console.info('[getMaskClipPathNotEmpty_0100] END');
        done();
      } catch (error) {
        console.info('[getMaskClipPathNotEmpty_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   getMaskClipPathConsistency_0100
     * @tc.number SUB_ARKUI_LAYERED_DRAWABLE_DESCRIPTOR_GET_MASK_CLIP_PATH_RETURN_0300
     * @tc.desc   Test LayeredDrawableDescriptor.getMaskClipPath returns consistent value across multiple calls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('getMaskClipPathConsistency_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[getMaskClipPathConsistency_0100] START');
      try {
        let driver = await Driver.create();
        let button = await driver.findComponent(ON.id('btnTest003'));
        await button.click();
        await CommonFunc.sleep(1000);

        let strJson = getInspectorByKey('txtTestResult003');
        console.info('[getMaskClipPathConsistency_0100] inspector: ' + strJson);
        let obj: ESObject = JSON.parse(strJson);
        let resultText: string = obj.$attrs.content;
        console.info('[getMaskClipPathConsistency_0100] result: ' + resultText);

        expect(resultText).assertContain('PASS');
        console.info('[getMaskClipPathConsistency_0100] END');
        done();
      } catch (error) {
        console.info('[getMaskClipPathConsistency_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   getMaskClipPathValidFormat_0100
     * @tc.number SUB_ARKUI_LAYERED_DRAWABLE_DESCRIPTOR_GET_MASK_CLIP_PATH_RETURN_0400
     * @tc.desc   Test LayeredDrawableDescriptor.getMaskClipPath returns valid SVG path command format
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('getMaskClipPathValidFormat_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[getMaskClipPathValidFormat_0100] START');
      try {
        let driver = await Driver.create();
        let button = await driver.findComponent(ON.id('btnTest004'));
        await button.click();
        await CommonFunc.sleep(1000);

        let strJson = getInspectorByKey('txtTestResult004');
        console.info('[getMaskClipPathValidFormat_0100] inspector: ' + strJson);
        let obj: ESObject = JSON.parse(strJson);
        let resultText: string = obj.$attrs.content;
        console.info('[getMaskClipPathValidFormat_0100] result: ' + resultText);

        expect(resultText).assertContain('PASS');
        console.info('[getMaskClipPathValidFormat_0100] END');
        done();
      } catch (error) {
        console.info('[getMaskClipPathValidFormat_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   getMaskClipPathAppliedToPath_0100
     * @tc.number SUB_ARKUI_LAYERED_DRAWABLE_DESCRIPTOR_GET_MASK_CLIP_PATH_RETURN_0500
     * @tc.desc   Test LayeredDrawableDescriptor.getMaskClipPath return value can be used to construct Path object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('getMaskClipPathAppliedToPath_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[getMaskClipPathAppliedToPath_0100] START');
      try {
        let driver = await Driver.create();
        let button = await driver.findComponent(ON.id('btnTest005'));
        await button.click();
        await CommonFunc.sleep(1000);

        let strJson = getInspectorByKey('txtTestResult005');
        console.info('[getMaskClipPathAppliedToPath_0100] inspector: ' + strJson);
        let obj: ESObject = JSON.parse(strJson);
        let resultText: string = obj.$attrs.content;
        console.info('[getMaskClipPathAppliedToPath_0100] result: ' + resultText);

        expect(resultText).assertContain('PASS');
        console.info('[getMaskClipPathAppliedToPath_0100] END');
        done();
      } catch (error) {
        console.info('[getMaskClipPathAppliedToPath_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    })
  })
}
