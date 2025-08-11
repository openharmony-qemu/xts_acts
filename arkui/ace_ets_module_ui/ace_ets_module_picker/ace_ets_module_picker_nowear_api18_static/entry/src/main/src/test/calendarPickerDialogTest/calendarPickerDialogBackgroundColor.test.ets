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

export default function CalendarPickerDialogBGColorTest() {
  beforeAll(() => {
    console.info("CalendarPickerDialogBGColorTest beforeAll start");
    await UtilsTest.startAbility("com.arkui.ace.picker.nowear.api18.static", "EntryAbility")
    await UtilsTest.msSleep(4000)
  });

  describe('CalendarPickerDialogBGColorTest', () => {
    beforeAll(async () => {
      console.info('CalendarPickerDialogBGColorTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/calendarPickerDialog/calendarPickerDialogBGColor',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!('calendarPickerDialogBGColor' == pages.name)) {
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push CalendarPickerDialogBGColorTest page error: ' + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('CalendarPickerDialogBGColorTest after each called');
    });

    /* *
    * @tc.number: CalendarPickerDialogBGColorTest_001
    * @tc.name  : CalendarPickerDialogBGColorTest_static_001
    * @tc.desc  : To test the CalendarPickerDialog BackgroundColor Color.White
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBGColorTest_static_001',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('ColorWhiteID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundColor = column.getElement('$attrs').getString('backgroundColor');
      expect(backgroundColor).assertEqual('#FFFFFFFF');
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBGColorTest_002
    * @tc.name  : CalendarPickerDialogBGColorTest_static_002
    * @tc.desc  : To test the CalendarPickerDialog BackgroundColor 'rgb(255, 100, 255)'
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBGColorTest_static_002',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('rgb(255, 100, 255)ID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundColor = column.getElement('$attrs').getString('backgroundColor');
      expect(backgroundColor).assertEqual('#FFFF64FF');
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBGColorTest_003
    * @tc.name  : CalendarPickerDialogBGColorTest_static_003
    * @tc.desc  : To test the CalendarPickerDialog BackgroundColor 0x008080
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBGColorTest_static_003',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('0x008080ID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundColor = column.getElement('$attrs').getString('backgroundColor');
      expect(backgroundColor).assertEqual('#FF008080');
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBGColorTest_004
    * @tc.name  : CalendarPickerDialogBGColorTest_static_static_004
    * @tc.desc  : To test the CalendarPickerDialog BackgroundColor '#00FFFF'
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBGColorTest_static_004',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('00FFFFID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundColor = column.getElement('$attrs').getString('backgroundColor');
      expect(backgroundColor).assertEqual('#FF00FFFF');
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBGColorTest_005
    * @tc.name  : CalendarPickerDialogBGColorTest_static_005
    * @tc.desc  : To test the CalendarPickerDialog BackgroundColor $r('app.color.blue')
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBGColorTest_static_005',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('colorBlueID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundColor = column.getElement('$attrs').getString('backgroundColor');
      expect(backgroundColor).assertEqual('#FF0000FF');
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBGColorTest_006
    * @tc.name  : CalendarPickerDialogBGColorTest_static_006
    * @tc.desc  : To test the CalendarPickerDialog BackgroundColor null
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBGColorTest_static_006',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('nullID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundColor = column.getElement('$attrs').getString('backgroundColor');
      let uniRenderFlag = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundColor).assertEqual('#FFFFFFFF');
      } else {
        expect(backgroundColor).assertEqual('#00000000');
      }
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBGColorTest_007
    * @tc.name  : CalendarPickerDialogBGColorTest_static_007
    * @tc.desc  : To test the CalendarPickerDialog BackgroundColor undefined
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBGColorTest_static_007',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('undefinedID'))  as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundColor = column.getElement('$attrs').getString('backgroundColor');
      let uniRenderFlag = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundColor).assertEqual('#FFFFFFFF');
      } else {
        expect(backgroundColor).assertEqual('#00000000');
      }
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBGColorTest_008
    * @tc.name  : CalendarPickerDialogBGColorTest_static_008
    * @tc.desc  : To test the CalendarPickerDialog BackgroundColor 'XXX'
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBGColorTest_static_008',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('xxxID'))  as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundColor = column.getElement('$attrs').getString('backgroundColor');
      let uniRenderFlag = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundColor).assertEqual('#FFFFFFFF');
      } else {
        expect(backgroundColor).assertEqual('#00000000');
      }
      let btn1 = await driver.findComponent(ON.text('确定'))  as Component;
      await btn1!.click();
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBGColorTest_009
    * @tc.name  : CalendarPickerDialogBGColorTest_static_009
    * @tc.desc  : To test the CalendarPickerDialog BackgroundColor -5
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBGColorTest_static_009',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('-100ID'))  as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundColor = column.getElement('$attrs').getString('backgroundColor');
      expect(backgroundColor).assertEqual('#FFFFFF9C');
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
  })
}
