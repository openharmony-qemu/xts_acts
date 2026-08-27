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
import { Driver } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

const SLEEP_TIME = 1000;

export default function ImageAttributeModifierTest() {
  describe('ImageAttributeModifierTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("ImageAttributeModifierTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.image.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("ImageAttributeModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/image/ImageAttributeModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ImageAttributeModifierTest state pages:" + JSON.stringify(pages));
        if (!("ImageAttributeModifier" == pages.name)) {
          console.info("get ImageAttributeModifierTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(SLEEP_TIME);
        }
      } catch (err) {
        console.error("push ImageAttributeModifierTest page error:" + err);
      }
      console.info("ImageAttributeModifierTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(SLEEP_TIME);
      console.info("ImageAttributeModifierTest after each called");
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_ALT_0100
     * @tc.name   ImageAttributeModifierTest_static_0100
     * @tc.desc   Verify alt property set via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_0100 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_alt');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_0100] $type: ' + obj.getString('$type'));
        expect(obj.getString('$type')).assertContain('Image');
      } catch (err) {
        console.error('[static_0100] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_OBJECTFIT_0100
     * @tc.name   ImageAttributeModifierTest_static_0200
     * @tc.desc   Verify objectFit property set to ImageFit.Cover via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_0200 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_objectfit_cover');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_0200] objectFit: ' + obj.getElement('$attrs').getString('objectFit'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('objectFit')).assertContain('Cover');
      } catch (err) {
        console.error('[static_0200] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_OBJECTFIT_0200
     * @tc.name   ImageAttributeModifierTest_static_0300
     * @tc.desc   Verify objectFit property set to ImageFit.Contain via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_0300 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_objectfit_contain');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_0300] objectFit: ' + obj.getElement('$attrs').getString('objectFit'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('objectFit')).assertContain('Contain');
      } catch (err) {
        console.error('[static_0300] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_OBJECTREPEAT_0100
     * @tc.name   ImageAttributeModifierTest_static_0400
     * @tc.desc   Verify objectRepeat property set to ImageRepeat.NoRepeat via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_0400 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_objectrepeat_norepeat');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_0400] objectRepeat: ' + obj.getElement('$attrs').getString('objectRepeat'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('objectRepeat')).assertContain('NoRepeat');
      } catch (err) {
        console.error('[static_0400] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_OBJECTREPEAT_0200
     * @tc.name   ImageAttributeModifierTest_static_0500
     * @tc.desc   Verify objectRepeat property set to ImageRepeat.XY via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_0500 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_objectrepeat_xy');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_0500] objectRepeat: ' + obj.getElement('$attrs').getString('objectRepeat'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('objectRepeat')).assertContain('XY');
      } catch (err) {
        console.error('[static_0500] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_INTERPOLATION_0100
     * @tc.name   ImageAttributeModifierTest_static_0600
     * @tc.desc   Verify interpolation property set to ImageInterpolation.Low via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_0600 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_interpolation_low');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_0600] interpolation: ' + obj.getElement('$attrs').getString('interpolation'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('interpolation')).assertContain('Low');
      } catch (err) {
        console.error('[static_0600] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_INTERPOLATION_0200
     * @tc.name   ImageAttributeModifierTest_static_0700
     * @tc.desc   Verify interpolation property set to ImageInterpolation.High via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_0700 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_interpolation_high');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_0700] interpolation: ' + obj.getElement('$attrs').getString('interpolation'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('interpolation')).assertContain('High');
      } catch (err) {
        console.error('[static_0700] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_RENDERMODE_0100
     * @tc.name   ImageAttributeModifierTest_static_0800
     * @tc.desc   Verify renderMode property set to ImageRenderMode.Original via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_0800 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_rendermode_original');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_0800] renderMode: ' + obj.getElement('$attrs').getString('renderMode'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('renderMode')).assertContain('Original');
      } catch (err) {
        console.error('[static_0800] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_RENDERMODE_0200
     * @tc.name   ImageAttributeModifierTest_static_0900
     * @tc.desc   Verify renderMode property set to ImageRenderMode.Template via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_0900 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_rendermode_template');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_0900] renderMode: ' + obj.getElement('$attrs').getString('renderMode'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('renderMode')).assertContain('Template');
      } catch (err) {
        console.error('[static_0900] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_MATCHTEXTDIRECTION_0100
     * @tc.name   ImageAttributeModifierTest_static_1000
     * @tc.desc   Verify matchTextDirection property set to true via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_1000 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_matchtextdirection_true');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_1000] matchTextDirection: ' + obj.getElement('$attrs').getString('matchTextDirection'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('matchTextDirection')).assertContain('true');
      } catch (err) {
        console.error('[static_1000] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_MATCHTEXTDIRECTION_0200
     * @tc.name   ImageAttributeModifierTest_static_1100
     * @tc.desc   Verify matchTextDirection property set to false via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_1100 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_matchtextdirection_false');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_1100] matchTextDirection: ' + obj.getElement('$attrs').getString('matchTextDirection'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('matchTextDirection')).assertContain('false');
      } catch (err) {
        console.error('[static_1100] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_FITORIGINALSIZE_0100
     * @tc.name   ImageAttributeModifierTest_static_1200
     * @tc.desc   Verify fitOriginalSize property set to true via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_1200 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_fitoriginalsize_true');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_1200] fitOriginalSize: ' + obj.getElement('$attrs').getString('fitOriginalSize'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('fitOriginalSize')).assertContain('true');
      } catch (err) {
        console.error('[static_1200] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_FITORIGINALSIZE_0200
     * @tc.name   ImageAttributeModifierTest_static_1300
     * @tc.desc   Verify fitOriginalSize property set to false via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_1300 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_fitoriginalsize_false');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_1300] fitOriginalSize: ' + obj.getElement('$attrs').getString('fitOriginalSize'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('fitOriginalSize')).assertContain('false');
      } catch (err) {
        console.error('[static_1300] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_FILLCOLOR_0100
     * @tc.name   ImageAttributeModifierTest_static_1400
     * @tc.desc   Verify fillColor property set to Color.Red via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_1400 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_fillcolor_red');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_1400] fillColor: ' + obj.getElement('$attrs').getString('fillColor'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('fillColor')).assertContain('Red');
      } catch (err) {
        console.error('[static_1400] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_FILLCOLOR_0200
     * @tc.name   ImageAttributeModifierTest_static_1500
     * @tc.desc   Verify fillColor property set to Color.Blue via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_1500 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_fillcolor_blue');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_1500] fillColor: ' + obj.getElement('$attrs').getString('fillColor'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('fillColor')).assertContain('Blue');
      } catch (err) {
        console.error('[static_1500] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_AUTORESIZE_0100
     * @tc.name   ImageAttributeModifierTest_static_1600
     * @tc.desc   Verify autoResize property set to true via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_1600 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_autoresize_true');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_1600] autoResize: ' + obj.getElement('$attrs').getString('autoResize'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('autoResize')).assertContain('true');
      } catch (err) {
        console.error('[static_1600] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_AUTORESIZE_0200
     * @tc.name   ImageAttributeModifierTest_static_1700
     * @tc.desc   Verify autoResize property set to false via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_1700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_1700 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_autoresize_false');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_1700] autoResize: ' + obj.getElement('$attrs').getString('autoResize'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('autoResize')).assertContain('false');
      } catch (err) {
        console.error('[static_1700] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_SYNCLOAD_0100
     * @tc.name   ImageAttributeModifierTest_static_1800
     * @tc.desc   Verify syncLoad property set to true via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_1800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_1800 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_syncload_true');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_1800] syncLoad: ' + obj.getElement('$attrs').getString('syncLoad'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('syncLoad')).assertContain('true');
      } catch (err) {
        console.error('[static_1800] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_SYNCLOAD_0200
     * @tc.name   ImageAttributeModifierTest_static_1900
     * @tc.desc   Verify syncLoad property set to false via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_1900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_1900 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_syncload_false');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_1900] syncLoad: ' + obj.getElement('$attrs').getString('syncLoad'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('syncLoad')).assertContain('false');
      } catch (err) {
        console.error('[static_1900] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_COPYOPTION_0100
     * @tc.name   ImageAttributeModifierTest_static_2000
     * @tc.desc   Verify copyOption property set to CopyOptions.None via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_2000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_2000 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_copyoption_none');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_2000] copyOption: ' + obj.getElement('$attrs').getString('copyOption'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('copyOption')).assertContain('None');
      } catch (err) {
        console.error('[static_2000] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_COPYOPTION_0200
     * @tc.name   ImageAttributeModifierTest_static_2100
     * @tc.desc   Verify copyOption property set to CopyOptions.Local via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_2100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_2100 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_copyoption_local');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_2100] copyOption: ' + obj.getElement('$attrs').getString('copyOption'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('copyOption')).assertContain('Local');
      } catch (err) {
        console.error('[static_2100] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_DRAGGABLE_0100
     * @tc.name   ImageAttributeModifierTest_static_2200
     * @tc.desc   Verify draggable property set to true via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_2200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_2200 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_draggable_true');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_2200] draggable: ' + obj.getElement('$attrs').getString('draggable'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('draggable')).assertContain('true');
      } catch (err) {
        console.error('[static_2200] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_DRAGGABLE_0200
     * @tc.name   ImageAttributeModifierTest_static_2300
     * @tc.desc   Verify draggable property set to false via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_2300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_2300 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_draggable_false');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_2300] draggable: ' + obj.getElement('$attrs').getString('draggable'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('draggable')).assertContain('false');
      } catch (err) {
        console.error('[static_2300] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_ENABLEANALYZER_0100
     * @tc.name   ImageAttributeModifierTest_static_2400
     * @tc.desc   Verify enableAnalyzer property set to true via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_2400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_2400 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_enableanalyzer_true');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_2400] enableAnalyzer: ' + obj.getElement('$attrs').getString('enableAnalyzer'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('enableAnalyzer')).assertContain('true');
      } catch (err) {
        console.error('[static_2400] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_ENABLEANALYZER_0200
     * @tc.name   ImageAttributeModifierTest_static_2500
     * @tc.desc   Verify enableAnalyzer property set to false via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_2500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_2500 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_enableanalyzer_false');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_2500] enableAnalyzer: ' + obj.getElement('$attrs').getString('enableAnalyzer'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('enableAnalyzer')).assertContain('false');
      } catch (err) {
        console.error('[static_2500] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_PRIVACYSENSITIVE_0100
     * @tc.name   ImageAttributeModifierTest_static_2600
     * @tc.desc   Verify privacySensitive property set to true via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_2600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_2600 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_privacysensitive_true');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_2600] privacySensitive: ' + obj.getElement('$attrs').getString('privacySensitive'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('privacySensitive')).assertContain('true');
      } catch (err) {
        console.error('[static_2600] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_PRIVACYSENSITIVE_0200
     * @tc.name   ImageAttributeModifierTest_static_2700
     * @tc.desc   Verify privacySensitive property set to false via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_2700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_2700 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_privacysensitive_false');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_2700] privacySensitive: ' + obj.getElement('$attrs').getString('privacySensitive'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('privacySensitive')).assertContain('false');
      } catch (err) {
        console.error('[static_2700] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_DYNAMICRANGE_0100
     * @tc.name   ImageAttributeModifierTest_static_2800
     * @tc.desc   Verify dynamicRangeMode property set to DynamicRangeMode.STANDARD via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_2800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_2800 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_dynamicrange_standard');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_2800] dynamicRangeMode: ' + obj.getElement('$attrs').getString('dynamicRangeMode'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('dynamicRangeMode')).assertContain('STANDARD');
      } catch (err) {
        console.error('[static_2800] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_DYNAMICRANGE_0200
     * @tc.name   ImageAttributeModifierTest_static_2900
     * @tc.desc   Verify dynamicRangeMode property set to DynamicRangeMode.HIGH via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_2900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_2900 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_dynamicrange_high');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_2900] dynamicRangeMode: ' + obj.getElement('$attrs').getString('dynamicRangeMode'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('dynamicRangeMode')).assertContain('HIGH');
      } catch (err) {
        console.error('[static_2900] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_ORIENTATION_0100
     * @tc.name   ImageAttributeModifierTest_static_3000
     * @tc.desc   Verify orientation property set to ImageRotateOrientation.UP via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_3000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_3000 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_orientation_up');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_3000] orientation: ' + obj.getElement('$attrs').getString('orientation'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('orientation')).assertContain('UP');
      } catch (err) {
        console.error('[static_3000] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_ORIENTATION_0200
     * @tc.name   ImageAttributeModifierTest_static_3100
     * @tc.desc   Verify orientation property set to ImageRotateOrientation.LEFT via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_3100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_3100 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_orientation_left');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_3100] orientation: ' + obj.getElement('$attrs').getString('orientation'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('orientation')).assertContain('LEFT');
      } catch (err) {
        console.error('[static_3100] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_HDRBRIGHTNESS_0100
     * @tc.name   ImageAttributeModifierTest_static_3200
     * @tc.desc   Verify hdrBrightness property set to 0.5 via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_3200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_3200 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_hdrbrightness_05');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_3200] hdrBrightness: ' + obj.getElement('$attrs').getString('hdrBrightness'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('hdrBrightness')).assertContain('0.5');
      } catch (err) {
        console.error('[static_3200] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_HDRBRIGHTNESS_0200
     * @tc.name   ImageAttributeModifierTest_static_3300
     * @tc.desc   Verify hdrBrightness property set to 1.0 via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_3300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_3300 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_hdrbrightness_10');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_3300] hdrBrightness: ' + obj.getElement('$attrs').getString('hdrBrightness'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('hdrBrightness')).assertContain('1');
      } catch (err) {
        console.error('[static_3300] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_SUPPORTSVG2_0100
     * @tc.name   ImageAttributeModifierTest_static_3400
     * @tc.desc   Verify supportSvg2 property set to true via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_3400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_3400 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_supportsvg2_true');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_3400] supportSvg2: ' + obj.getElement('$attrs').getString('supportSvg2'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('supportSvg2')).assertContain('true');
      } catch (err) {
        console.error('[static_3400] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_SUPPORTSVG2_0200
     * @tc.name   ImageAttributeModifierTest_static_3500
     * @tc.desc   Verify supportSvg2 property set to false via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_3500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_3500 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_supportsvg2_false');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_3500] supportSvg2: ' + obj.getElement('$attrs').getString('supportSvg2'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('supportSvg2')).assertContain('false');
      } catch (err) {
        console.error('[static_3500] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_ANTIALIASED_0100
     * @tc.name   ImageAttributeModifierTest_static_3600
     * @tc.desc   Verify antialiased property set to true via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_3600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_3600 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_antialiased_true');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_3600] antialiased: ' + obj.getElement('$attrs').getString('antialiased'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('antialiased')).assertContain('true');
      } catch (err) {
        console.error('[static_3600] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_MODIFIER_ANTIALIASED_0200
     * @tc.name   ImageAttributeModifierTest_static_3700
     * @tc.desc   Verify antialiased property set to false via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAttributeModifierTest_static_3700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAttributeModifierTest_static_3700 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('img_modifier_antialiased_false');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_3700] antialiased: ' + obj.getElement('$attrs').getString('antialiased'));
        expect(obj.getString('$type')).assertContain('Image');
        expect(obj.getElement('$attrs').getString('antialiased')).assertContain('false');
      } catch (err) {
        console.error('[static_3700] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });
  })
}
