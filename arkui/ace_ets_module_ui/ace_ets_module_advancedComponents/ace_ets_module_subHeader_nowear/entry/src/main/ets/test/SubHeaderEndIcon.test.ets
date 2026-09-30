/**
Copyright (c) 2026 Huawei Device Co., Ltd.
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import Utils from './Utils';

export default function subHeaderEndIcon() {
  describe('subHeaderEndIcon', () => {
    beforeEach(async (done: Function) => {
      console.info('subHeaderEndIcon beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/subHeaderEndIcon',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get subHeaderEndIcon state pages: ' + JSON.stringify(pages));
        if (!('SubHeaderEndIcon' == pages.name)) {
          console.info('get subHeaderEndIcon pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push subHeaderEndIcon page result successful');
        }
      } catch (err) {
        console.error('push subHeaderEndIcon page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('subHeaderEndIcon beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('subHeaderEndIcon after each called');
    })

    /**
     * @tc.number SUB_ARKUI_SUBHEADER_ENDICON_0100
     * @tc.name   subHeaderEndIcon_0100
     * @tc.desc   Test SubHeader icon + secondaryTitle + endIcon(image) — scenario 1
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('subHeaderEndIcon_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[subHeaderEndIcon_0100] START');
      let strJson: string = getInspectorByKey('subheader_endicon_image');
      expect(strJson !== '' && strJson !== null).assertTrue();
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[subHeaderEndIcon_0100] $type is: ' + obj.$type);
      expect(obj.$type).assertEqual('__Common__');
      expect(obj.$attrs.size !== undefined && obj.$attrs.size !== null).assertTrue();
      expect(obj.$attrs.visibility).assertEqual('Visibility.Visible');
      let driver = Driver.create();
      await driver.delayMs(500);
      let component = await driver.findComponent(ON.id('subheader_endicon_image'));
      expect(component !== null && component !== undefined).assertTrue();
      console.info('[subHeaderEndIcon_0100] END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_SUBHEADER_ENDICON_0200
     * @tc.name   subHeaderEndIcon_0200
     * @tc.desc   Test SubHeader secondaryTitle + endIcon(Symbol) + endIconSymbolOptions — scenario 4
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('subHeaderEndIcon_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[subHeaderEndIcon_0200] START');
      let strJson: string = getInspectorByKey('subheader_endicon_symbol');
      expect(strJson !== '' && strJson !== null).assertTrue();
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[subHeaderEndIcon_0200] $type is: ' + obj.$type);
      expect(obj.$type).assertEqual('__Common__');
      expect(obj.$attrs.size !== undefined && obj.$attrs.size !== null).assertTrue();
      expect(obj.$attrs.visibility).assertEqual('Visibility.Visible');
      let driver = Driver.create();
      await driver.delayMs(500);
      let component = await driver.findComponent(ON.id('subheader_endicon_symbol'));
      expect(component !== null && component !== undefined).assertTrue();
      console.info('[subHeaderEndIcon_0200] END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_SUBHEADER_ENDICON_0300
     * @tc.name   subHeaderEndIcon_0300
     * @tc.desc   Test SubHeader primaryTitle + endIcon(image) — scenario 2
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('subHeaderEndIcon_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[subHeaderEndIcon_0300] START');
      let strJson: string = getInspectorByKey('subheader_endicon_primary');
      expect(strJson !== '' && strJson !== null).assertTrue();
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[subHeaderEndIcon_0300] $type is: ' + obj.$type);
      expect(obj.$type).assertEqual('__Common__');
      expect(obj.$attrs.size !== undefined && obj.$attrs.size !== null).assertTrue();
      expect(obj.$attrs.visibility).assertEqual('Visibility.Visible');
      let driver = Driver.create();
      await driver.delayMs(500);
      let component = await driver.findComponent(ON.id('subheader_endicon_primary'));
      expect(component !== null && component !== undefined).assertTrue();
      console.info('[subHeaderEndIcon_0300] END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_SUBHEADER_ENDICON_0400
     * @tc.name   subHeaderEndIcon_0400
     * @tc.desc   Test SubHeader primaryTitle + secondaryTitle + endIcon(image) — scenario 3
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('subHeaderEndIcon_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[subHeaderEndIcon_0400] START');
      let strJson: string = getInspectorByKey('subheader_endicon_primary_secondary');
      expect(strJson !== '' && strJson !== null).assertTrue();
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[subHeaderEndIcon_0400] $type is: ' + obj.$type);
      expect(obj.$type).assertEqual('__Common__');
      expect(obj.$attrs.size !== undefined && obj.$attrs.size !== null).assertTrue();
      expect(obj.$attrs.visibility).assertEqual('Visibility.Visible');
      let driver = Driver.create();
      await driver.delayMs(500);
      let component = await driver.findComponent(ON.id('subheader_endicon_primary_secondary'));
      expect(component !== null && component !== undefined).assertTrue();
      console.info('[subHeaderEndIcon_0400] END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_SUBHEADER_ENDICON_0500
     * @tc.name   subHeaderEndIcon_0500
     * @tc.desc   Test SubHeader endIcon + operationItem coexist — scenario 7
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('subHeaderEndIcon_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[subHeaderEndIcon_0500] START');
      let strJson: string = getInspectorByKey('subheader_endicon_operation');
      expect(strJson !== '' && strJson !== null).assertTrue();
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[subHeaderEndIcon_0500] $type is: ' + obj.$type);
      expect(obj.$type).assertEqual('__Common__');
      expect(obj.$attrs.size !== undefined && obj.$attrs.size !== null).assertTrue();
      expect(obj.$attrs.visibility).assertEqual('Visibility.Visible');
      let driver = Driver.create();
      await driver.delayMs(500);
      let component = await driver.findComponent(ON.id('subheader_endicon_operation'));
      expect(component !== null && component !== undefined).assertTrue();
      console.info('[subHeaderEndIcon_0500] END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_SUBHEADER_ENDICON_0600
     * @tc.name   subHeaderEndIcon_0600
     * @tc.desc   Test SubHeader without endIcon — scenario 8, verify endIcon is undefined
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('subHeaderEndIcon_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[subHeaderEndIcon_0600] START');
      let strJson: string = getInspectorByKey('subheader_endicon_none');
      expect(strJson !== '' && strJson !== null).assertTrue();
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[subHeaderEndIcon_0600] $type is: ' + obj.$type);
      expect(obj.$type).assertEqual('__Common__');
      expect(obj.$attrs.size !== undefined && obj.$attrs.size !== null).assertTrue();
      expect(obj.$attrs.visibility).assertEqual('Visibility.Visible');
      let driver = Driver.create();
      await driver.delayMs(500);
      let component = await driver.findComponent(ON.id('subheader_endicon_none'));
      expect(component !== null && component !== undefined).assertTrue();
      console.info('[subHeaderEndIcon_0600] END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_SUBHEADER_ENDICON_0700
     * @tc.name   subHeaderEndIcon_0700
     * @tc.desc   Test SubHeader titleBuilder mode, endIcon not effective — scenario 9
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('subHeaderEndIcon_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[subHeaderEndIcon_0700] START');
      let strJson: string = getInspectorByKey('subheader_endicon_titlebuilder');
      expect(strJson !== '' && strJson !== null).assertTrue();
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[subHeaderEndIcon_0700] $type is: ' + obj.$type);
      expect(obj.$type).assertEqual('__Common__');
      expect(obj.$attrs.size !== undefined && obj.$attrs.size !== null).assertTrue();
      expect(obj.$attrs.visibility).assertEqual('Visibility.Visible');
      let driver = Driver.create();
      await driver.delayMs(500);
      let component = await driver.findComponent(ON.id('subheader_endicon_titlebuilder'));
      expect(component !== null && component !== undefined).assertTrue();
      console.info('[subHeaderEndIcon_0700] END');
      done();
    });

  })
}
