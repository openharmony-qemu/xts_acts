/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { describe, beforeEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';

export default function imageAttachmentResizableTest() {
  describe('imageAttachmentResizableTest', () => {
    let driver: Driver;

    beforeEach(async (done: Function) => {
      console.info('imageAttachmentResizableTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi26/ImageAttachmentResizable',
      };
      try {
        router.clear();
        let pages = router.getState();
        if (!('ImageAttachmentResizable' == pages.name)) {
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push ImageAttachmentResizable success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ImageAttachmentResizable page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterAll(async () => {
      AppStorage.delete('imageAttachment_resource_slice');
      AppStorage.delete('imageAttachment_resource_default');
      AppStorage.delete('imageAttachment_resource_null');
      AppStorage.delete('imageAttachment_resource_undefined');
      AppStorage.delete('imageAttachment_interface_slice');
      AppStorage.delete('imageAttachment_interface_default');
      AppStorage.delete('imageAttachment_interface_null');
      AppStorage.delete('imageAttachment_interface_undefined');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_IMAGEATTACHMENT_RESOURCE_RESIZABLE_SLICE_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_IMAGEATTACHMENT_RESOURCE_RESIZABLE_SLICE_0100
     * @tc.desc   Test ResourceImageAttachmentOptions/ImageAttachment.resizable with slice
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_IMAGEATTACHMENT_RESOURCE_RESIZABLE_SLICE_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_IMAGEATTACHMENT_RESOURCE_RESIZABLE_SLICE_0100] START');
      driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn_imageAttachment_resource_slice'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await CommonFunc.sleep(500);
      let value: string | undefined = AppStorage.get('imageAttachment_resource_slice');
      console.info('[resource slice] ' + value);
      expect(value).not().assertUndefined();
      expect(value !== 'undefined').assertTrue();
      expect(value !== 'default').assertTrue();
      expect(value !== 'no_pixelmap').assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_IMAGEATTACHMENT_RESOURCE_RESIZABLE_SLICE_0100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_IMAGEATTACHMENT_RESOURCE_RESIZABLE_NULL_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_IMAGEATTACHMENT_RESOURCE_RESIZABLE_NULL_0100
     * @tc.desc   Test ResourceImageAttachmentOptions.resizable null equals default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_IMAGEATTACHMENT_RESOURCE_RESIZABLE_NULL_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_IMAGEATTACHMENT_RESOURCE_RESIZABLE_NULL_0100] START');
      driver = Driver.create();
      let btnNull = await driver.findComponent(ON.id('btn_imageAttachment_resource_null'));
      expect(btnNull).not().assertUndefined();
      await btnNull.click();
      await CommonFunc.sleep(500);
      let btnDefault = await driver.findComponent(ON.id('btn_imageAttachment_resource_default'));
      expect(btnDefault).not().assertUndefined();
      await btnDefault.click();
      await CommonFunc.sleep(500);
      let nullVal: string | undefined = AppStorage.get('imageAttachment_resource_null');
      let defaultVal: string | undefined = AppStorage.get('imageAttachment_resource_default');
      expect(nullVal).assertEqual(defaultVal);
      console.info('[SUB_ARKUI_RICHEDITOR_IMAGEATTACHMENT_RESOURCE_RESIZABLE_NULL_0100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_IMAGEATTACHMENT_RESOURCE_RESIZABLE_UNDEFINED_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_IMAGEATTACHMENT_RESOURCE_RESIZABLE_UNDEFINED_0100
     * @tc.desc   Test ResourceImageAttachmentOptions.resizable undefined equals default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_IMAGEATTACHMENT_RESOURCE_RESIZABLE_UNDEFINED_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_IMAGEATTACHMENT_RESOURCE_RESIZABLE_UNDEFINED_0100] START');
      driver = Driver.create();
      let btnUndef = await driver.findComponent(ON.id('btn_imageAttachment_resource_undefined'));
      expect(btnUndef).not().assertUndefined();
      await btnUndef.click();
      await CommonFunc.sleep(500);
      let btnDefault = await driver.findComponent(ON.id('btn_imageAttachment_resource_default'));
      expect(btnDefault).not().assertUndefined();
      await btnDefault.click();
      await CommonFunc.sleep(500);
      let undefVal: string | undefined = AppStorage.get('imageAttachment_resource_undefined');
      let defaultVal: string | undefined = AppStorage.get('imageAttachment_resource_default');
      expect(undefVal).assertEqual(defaultVal);
      console.info('[SUB_ARKUI_RICHEDITOR_IMAGEATTACHMENT_RESOURCE_RESIZABLE_UNDEFINED_0100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_IMAGEATTACHMENT_INTERFACE_RESIZABLE_SLICE_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_IMAGEATTACHMENT_INTERFACE_RESIZABLE_SLICE_0100
     * @tc.desc   Test ImageAttachmentInterface/ImageAttachment.resizable with slice
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_IMAGEATTACHMENT_INTERFACE_RESIZABLE_SLICE_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_IMAGEATTACHMENT_INTERFACE_RESIZABLE_SLICE_0100] START');
      driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn_imageAttachment_interface_slice'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await CommonFunc.sleep(500);
      let value: string | undefined = AppStorage.get('imageAttachment_interface_slice');
      console.info('[interface slice] ' + value);
      expect(value).not().assertUndefined();
      expect(value !== 'undefined').assertTrue();
      expect(value !== 'default').assertTrue();
      expect(value !== 'no_pixelmap').assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_IMAGEATTACHMENT_INTERFACE_RESIZABLE_SLICE_0100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_IMAGEATTACHMENT_INTERFACE_RESIZABLE_NULL_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_IMAGEATTACHMENT_INTERFACE_RESIZABLE_NULL_0100
     * @tc.desc   Test ImageAttachmentInterface.resizable null equals default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_IMAGEATTACHMENT_INTERFACE_RESIZABLE_NULL_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_IMAGEATTACHMENT_INTERFACE_RESIZABLE_NULL_0100] START');
      driver = Driver.create();
      let btnNull = await driver.findComponent(ON.id('btn_imageAttachment_interface_null'));
      expect(btnNull).not().assertUndefined();
      await btnNull.click();
      await CommonFunc.sleep(500);
      let btnDefault = await driver.findComponent(ON.id('btn_imageAttachment_interface_default'));
      expect(btnDefault).not().assertUndefined();
      await btnDefault.click();
      await CommonFunc.sleep(500);
      let nullVal: string | undefined = AppStorage.get('imageAttachment_interface_null');
      let defaultVal: string | undefined = AppStorage.get('imageAttachment_interface_default');
      expect(nullVal).assertEqual(defaultVal);
      console.info('[SUB_ARKUI_RICHEDITOR_IMAGEATTACHMENT_INTERFACE_RESIZABLE_NULL_0100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_IMAGEATTACHMENT_INTERFACE_RESIZABLE_UNDEFINED_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_IMAGEATTACHMENT_INTERFACE_RESIZABLE_UNDEFINED_0100
     * @tc.desc   Test ImageAttachmentInterface.resizable undefined equals default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_IMAGEATTACHMENT_INTERFACE_RESIZABLE_UNDEFINED_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_IMAGEATTACHMENT_INTERFACE_RESIZABLE_UNDEFINED_0100] START');
      driver = Driver.create();
      let btnUndef = await driver.findComponent(ON.id('btn_imageAttachment_interface_undefined'));
      expect(btnUndef).not().assertUndefined();
      await btnUndef.click();
      await CommonFunc.sleep(500);
      let btnDefault = await driver.findComponent(ON.id('btn_imageAttachment_interface_default'));
      expect(btnDefault).not().assertUndefined();
      await btnDefault.click();
      await CommonFunc.sleep(500);
      let undefVal: string | undefined = AppStorage.get('imageAttachment_interface_undefined');
      let defaultVal: string | undefined = AppStorage.get('imageAttachment_interface_default');
      expect(undefVal).assertEqual(defaultVal);
      console.info('[SUB_ARKUI_RICHEDITOR_IMAGEATTACHMENT_INTERFACE_RESIZABLE_UNDEFINED_0100] END');
    });
  });
}
