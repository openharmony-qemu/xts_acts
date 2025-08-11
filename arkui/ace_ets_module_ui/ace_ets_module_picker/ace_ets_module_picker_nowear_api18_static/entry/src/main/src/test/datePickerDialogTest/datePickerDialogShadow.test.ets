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

export default function DatePickerDialogShadowTest() {
  describe('DatePickerDialogShadowTest', () => {

    beforeAll(async () => {
      console.info("EnableHapticFeedback beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.nowear.api18.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
      const routerInstance = AppStorage.get<Router>("router") as Router
      console.info('DatePickerDialogShadow beforeEach start');
      let options: router.RouterOptions = {
        url:'MainAbility/pages/datePickerDialog/datePickerDialogShadow',
      }
      try {
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!('datePickerDialogShadow' == pages.name)) {
          routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push DatePickerDialogShadow page error: ' + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('textAreaInputTest after each called');
    });
    /* *
      * @tc.number: DatePickerDialogShadowTest_001
      * @tc.name  : DatePickerDialogShadowTest_static_001
      * @tc.desc  : To test the DatePickerDialog shadow color: Color.Red
      * @tc.level : Level 0
      */
    it('DatePickerDialogShadowTest_static_001',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('shadowOptionID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let shadow: string = column.getElement('$attrs').getElement('shadow').getString('color');
      expect(shadow).assertEqual('#FFFF0000');
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /* *
     * @tc.number: DatePickerDialogShadowTest_002
     * @tc.name  : DatePickerDialogShadowTest_static_002
     * @tc.desc  : To test the DatePickerDialog shadow ShadowStyle.OUTER_DEFAULT_XS
     * @tc.level : Level 0
      */
    it('DatePickerDialogShadowTest_static_002',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('OUTER_DEFAULT_XS_ID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let shadow: string = column.getElement('$attrs').getString('shadow');
      expect(shadow).assertEqual('ShadowStyle.OuterDefaultXS');
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /* *
     * @tc.number: DatePickerDialogShadowTest_003
     * @tc.name  : DatePickerDialogShadowTest_static_003
     * @tc.desc  : To test the DatePickerDialog shadow ShadowStyle.OUTER_DEFAULT_SM
     * @tc.level : Level 0
     */
    it('DatePickerDialogShadowTest_static_003',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('OUTER_DEFAULT_SM_ID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let shadow: string = column.getElement('$attrs').getString('shadow');
      expect(shadow).assertEqual('ShadowStyle.OuterDefaultSM');
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /* *
     * @tc.number: DatePickerDialogShadowTest_004
     * @tc.name  : DatePickerDialogShadowTest_static_004
     * @tc.desc  : To test the DatePickerDialog shadow ShadowStyle.OUTER_DEFAULT_MD
     * @tc.level : Level 0
     */
    it('DatePickerDialogShadowTest_static_004',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('OUTER_DEFAULT_MD_ID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let shadow: string = column.getElement('$attrs').getString('shadow');
      expect(shadow).assertEqual('ShadowStyle.OuterDefaultMD');
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /* *
     * @tc.number: DatePickerDialogShadowTest_005
     * @tc.name  : DatePickerDialogShadowTest_static_005
     * @tc.desc  : To test the DatePickerDialog shadow ShadowStyle.OUTER_DEFAULT_LG
     * @tc.level : Level 0
     */
    it('DatePickerDialogShadowTest_static_005',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('OUTER_DEFAULT_LG_ID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let shadow: string = column.getElement('$attrs').getString('shadow');
      expect(shadow).assertEqual('ShadowStyle.OuterDefaultLG');
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /* *
     * @tc.number: DatePickerDialogShadowTest_006
     * @tc.name  : DatePickerDialogShadowTest_static_006
     * @tc.desc  : To test the DatePickerDialog shadow ShadowStyle.OUTER_FLOATING_SM
     * @tc.level : Level 0
     */
    it('DatePickerDialogShadowTest_static_006',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('OUTER_FLOATING_SM_ID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let shadow: string = column.getElement('$attrs').getString('shadow');
      expect(shadow).assertEqual('ShadowStyle.OuterFloatingSM');
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /* *
     * @tc.number: DatePickerDialogShadowTest_007
     * @tc.name  : DatePickerDialogShadowTest_static_007
     * @tc.desc  : To test the DatePickerDialog shadow ShadowStyle.OUTER_FLOATING_MD
     * @tc.level : Level 0
     */
    it('DatePickerDialogShadowTest_static_007',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('OUTER_FLOATING_MD_ID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let shadow: string = column.getElement('$attrs').getString('shadow');
      expect(shadow).assertEqual('ShadowStyle.OuterFloatingMD');
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
  })
}