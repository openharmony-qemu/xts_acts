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

export default function TimePickerDialogBGColorTest() {
  describe('TimePickerDialogBGColorTest', () => {
    beforeAll(async () => {
      console.info("TextPickerDialogShadow beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.nowear.api18.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
      const routerInstance = AppStorage.get<Router>("router") as Router
      let options: router.RouterOptions = {
        url:'MainAbility/pages/timePickerDialog/timePickerDialogBGColor',
      }
      try {
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!("TimePickerDialogBGColor" == pages.name)) {
          routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TimePickerDialogBGColor page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TimePickerDialogBGColor after each called");
    });
    /* *
     * @tc.number: TimePickerDialogBGColorTest_static_001
     * @tc.name  : TimePickerDialogBGColorTest_static_001
     * @tc.desc  : To test the TimePickerDialog BackgroundColor Color.White
     * @tc.level : Level 0
     */
    it('TimePickerDialogBGColorTest_static_001',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('ColorWhiteID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog =  tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundColor: string = column.getElement('$attrs').getString('backgroundColor');
      expect(backgroundColor).assertEqual('#FFFFFFFF');
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /* *
     * @tc.number: TimePickerDialogBGColorTest_static_002
     * @tc.name  : TimePickerDialogBGColorTest_static_002
     * @tc.desc  : To test the TimePickerDialog BackgroundColor
     * @tc.level : Level 0
     */
    it('TimePickerDialogBGColorTest_static_002',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('rgb(255, 100, 255)ID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog =  tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundColor: string = column.getElement('$attrs').getString('backgroundColor');
      expect(backgroundColor).assertEqual('#FFFF64FF');
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /* *
     * @tc.number: TimePickerDialogBGColorTest_static_003
     * @tc.name  : TimePickerDialogBGColorTest_static_003
     * @tc.desc  : To test the TimePickerDialog BackgroundColor
     * @tc.level : Level 0
     */
    it('TimePickerDialogBGColorTest_static_003',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('0x008080ID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog =  tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundColor: string = column.getElement('$attrs').getString('backgroundColor');
      expect(backgroundColor).assertEqual('#FF008080');
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /* *
     * @tc.number: TimePickerDialogBGColorTest_static_004
     * @tc.name  : TimePickerDialogBGColorTest_static_004
     * @tc.desc  : To test the TimePickerDialog BackgroundColor
     * @tc.level : Level 0
     */
    it('TimePickerDialogBGColorTest_static_004',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('00FFFFID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog =  tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundColor: string = column.getElement('$attrs').getString('backgroundColor');
      expect(backgroundColor).assertEqual('#FF00FFFF');
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /* *
     * @tc.number: TimePickerDialogBGColorTest_static_005
     * @tc.name  : TimePickerDialogBGColorTest_static_005
     * @tc.desc  : To test the TimePickerDialog BackgroundColor
     * @tc.level : Level 0
     */
    it('TimePickerDialogBGColorTest_static_005',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('colorBlueID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog =  tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundColor: string = column.getElement('$attrs').getString('backgroundColor');
      expect(backgroundColor).assertEqual('#FF0000FF');
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /* *
     * @tc.number: TimePickerDialogBGColorTest_static_006
     * @tc.name  : TimePickerDialogBGColorTest_static_006
     * @tc.desc  : To test the TimePickerDialog BackgroundColor
     * @tc.level : Level 0
     */
    it('TimePickerDialogBGColorTest_static_006',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('nullID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog =  tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundColor: string = column.getElement('$attrs').getString('backgroundColor');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundColor).assertEqual('#FFFFFFFF');
      } else {
        expect(backgroundColor).assertEqual('#00FFFFFF');
      }
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /* *
     * @tc.number: TimePickerDialogBGColorTest_static_007
     * @tc.name  : TimePickerDialogBGColorTest_static_007
     * @tc.desc  : To test the TimePickerDialog BackgroundColor
     * @tc.level : Level 0
     */
    it('TimePickerDialogBGColorTest_static_007',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('undefinedID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog =  tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundColor: string = column.getElement('$attrs').getString('backgroundColor');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundColor).assertEqual('#FFFFFFFF');
      } else {
        expect(backgroundColor).assertEqual('#00FFFFFF');
      }
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /* *
     * @tc.number: TimePickerDialogBGColorTest_static_008
     * @tc.name  : TimePickerDialogBGColorTest_static_008
     * @tc.desc  : To test the TimePickerDialog BackgroundColor
     * @tc.level : Level 0
     */
    it('TimePickerDialogBGColorTest_static_008',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('xxxID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog =  tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundColor: string = column.getElement('$attrs').getString('backgroundColor');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundColor).assertEqual('#FFFFFFFF');
      } else {
        expect(backgroundColor).assertEqual('#00FFFFFF');
      }
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /* *
     * @tc.number: TimePickerDialogBGColorTest_static_009
     * @tc.name  : TimePickerDialogBGColorTest_static_009
     * @tc.desc  : To test the TimePickerDialog BackgroundColor
     * @tc.level : Level 0
     */
    it('TimePickerDialogBGColorTest_static_009',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('-100ID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog =  tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundColor: string = column.getElement('$attrs').getString('backgroundColor');
      expect(backgroundColor).assertEqual('#FFFFFF9C');
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
  })
}