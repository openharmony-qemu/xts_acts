/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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
import { describe, beforeEach, it, expect, Level, beforeAll, beforeEach, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

export default function textPickerDialogDefaultTextStyleTest() {
  describe('textPickerDialogDefaultTextStyleTest', () => {

    beforeAll(() => {
      console.info("textPickerDialogDefaultTextStyleTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.nowear.api18.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPickerDialog/textPickerDialogDefaultTextStyle',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get textPickerDialogDefaultTextStyleTest state pages:' + JSON.stringify(pages));
        if (!('textPickerDialogDefaultTextStyle' == pages.name)) {
          console.info('get textPickerDialogDefaultTextStyleTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          await Utils.sleep(2500);
          // console.info('push textPickerDialogDefaultTextStyleTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push textPickerDialogDefaultTextStyleTest page error:' + err);
      }
      console.info('textPickerDialogDefaultTextStyleTest beforeEach end');
    });
    /* *
    * @tc.number: textPickerDialogDefaultTextStyleTest_static_001
    * @tc.name  : textPickerDialogDefaultTextStyleTest_static_001
    * @tc.desc  : To test the defaultTextStyle minFontSize:18 maxFontSize:28 TextOverflow.Ellipsis
    * @tc.level : Level 0
    */
    it('textPickerDialogDefaultTextStyleTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textPickerDialogDefaultTextStyleTest_static_001 START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn1')) as Component;
      await btn.click()
      await Utils.sleep(2000);

      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(1000);
      console.info('[textPickerDialogDefaultTextStyleTest_static_001] obj is: ' + JSON.stringify(obj));

      let textPicker = JSON.stringify(obj.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[0])
      console.info('[textPickerDialogDefaultTextStyleTest_static_001] obj is: ' + textPicker);
      console.info('[textPickerDialogDefaultTextStyleTest_static_001] obj is: ' + JSON.stringifyJsonElement(JSON.parseJsonElement(textPicker).getElement('$attrs').getElement('defaultTextStyle')));
      expect(JSON.parseJsonElement(textPicker).getElement('$attrs').getElement('defaultTextStyle').getString('minFontSize')).assertEqual('18.00fp');
      expect(JSON.parseJsonElement(textPicker).getElement('$attrs').getElement('defaultTextStyle').getString('maxFontSize')).assertEqual('28.00fp');
      expect(JSON.parseJsonElement(textPicker).getElement('$attrs').getElement('defaultTextStyle').getString('overflow')).assertEqual('TextOverflow.Ellipsis');
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      await Utils.sleep(1000);
      console.info('[textPickerDialogDefaultTextStyleTest_static_001] END');
      done();
    });

    /* *
    * @tc.number: textPickerDialogDefaultTextStyleTest_static_002
    * @tc.name  : textPickerDialogDefaultTextStyleTest_static_002
    * @tc.desc  : To test the defaultTextStyle minFontSize:28 maxFontSize:18 TextOverflow.Ellipsis
    * @tc.level : Level 0
    */
    it('textPickerDialogDefaultTextStyleTest_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textPickerDialogDefaultTextStyleTest_static_001 START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn2')) as Component;
      await btn.click()
      await Utils.sleep(2000);

      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(1000);
      console.info('[textPickerDialogDefaultTextStyleTest_static_002] obj is: ' + JSON.stringify(obj));

      let textPicker = JSON.stringify(obj.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[0])
      console.info('[textPickerDialogDefaultTextStyleTest_static_002] obj is: ' + textPicker);
      console.info('[textPickerDialogDefaultTextStyleTest_static_002] obj is: ' + JSON.stringifyJsonElement(JSON.parseJsonElement(textPicker).getElement('$attrs').getElement('defaultTextStyle')));
      expect(JSON.parseJsonElement(textPicker).getElement('$attrs').getElement('defaultTextStyle').getString('minFontSize')).assertEqual('28.00fp');
      expect(JSON.parseJsonElement(textPicker).getElement('$attrs').getElement('defaultTextStyle').getString('maxFontSize')).assertEqual('18.00fp');
      expect(JSON.parseJsonElement(textPicker).getElement('$attrs').getElement('defaultTextStyle').getString('overflow')).assertEqual('TextOverflow.Ellipsis');
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      await Utils.sleep(1000);
      console.info('[textPickerDialogDefaultTextStyleTest_static_002] END');
      done();
    });

    /* *
    * @tc.number: textPickerDialogDefaultTextStyleTest_static_003
    * @tc.name  : textPickerDialogDefaultTextStyleTest_static_003
    * @tc.desc  : To test the defaultTextStyle undefined
    * @tc.level : Level 0
    */
    it('textPickerDialogDefaultTextStyleTest_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textPickerDialogDefaultTextStyleTest_static_003 START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn3')) as Component;
      await btn.click()
      await Utils.sleep(2000);

      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(1000);
      console.info('[textPickerDialogDefaultTextStyleTest_static_003] obj is: ' + JSON.stringify(obj));

      let textPicker = JSON.stringify(obj.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[0])
      console.info('[textPickerDialogDefaultTextStyleTest_static_003] obj is: ' + textPicker);
      console.info('[textPickerDialogDefaultTextStyleTest_static_003] obj is: ' + JSON.stringifyJsonElement(JSON.parseJsonElement(textPicker).getElement('$attrs').getElement('defaultTextStyle')));
      expect(JSON.parseJsonElement(textPicker).getElement('$attrs').getElement('defaultTextStyle').getString('minFontSize')).assertEqual('0.00px');
      expect(JSON.parseJsonElement(textPicker).getElement('$attrs').getElement('defaultTextStyle').getString('maxFontSize')).assertEqual('0.00px');
      expect(JSON.parseJsonElement(textPicker).getElement('$attrs').getElement('defaultTextStyle').getString('overflow')).assertEqual('TextOverflow.Clip');
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      await Utils.sleep(1000);
      console.info('[textPickerDialogDefaultTextStyleTest_static_003] END');
      done();
    });

    /* *
    * @tc.number: textPickerDialogDefaultTextStyleTest_static_004
    * @tc.name  : textPickerDialogDefaultTextStyleTest_static_004
    * @tc.desc  : To test the defaultTextStyle null
    * @tc.level : Level 0
    */
    it('textPickerDialogDefaultTextStyleTest_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textPickerDialogDefaultTextStyleTest_static_004 START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn4')) as Component;
      await btn.click()
      await Utils.sleep(2000);

      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(1000);
      console.info('[textPickerDialogDefaultTextStyleTest_static_004] obj is: ' + JSON.stringify(obj));

      let textPicker = JSON.stringify(obj.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[0])
      console.info('[textPickerDialogDefaultTextStyleTest_static_004] obj is: ' + textPicker);
      console.info('[textPickerDialogDefaultTextStyleTest_static_004] obj is: ' + JSON.stringifyJsonElement(JSON.parseJsonElement(textPicker).getElement('$attrs').getElement('defaultTextStyle')));
      expect(JSON.parseJsonElement(textPicker).getElement('$attrs').getElement('defaultTextStyle').getString('minFontSize')).assertEqual('0.00px');
      expect(JSON.parseJsonElement(textPicker).getElement('$attrs').getElement('defaultTextStyle').getString('maxFontSize')).assertEqual('0.00px');
      expect(JSON.parseJsonElement(textPicker).getElement('$attrs').getElement('defaultTextStyle').getString('overflow')).assertEqual('TextOverflow.Clip');
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      await Utils.sleep(1000);
      console.info('[textPickerDialogDefaultTextStyleTest_static_004] END');
      done();
    });
  })
}