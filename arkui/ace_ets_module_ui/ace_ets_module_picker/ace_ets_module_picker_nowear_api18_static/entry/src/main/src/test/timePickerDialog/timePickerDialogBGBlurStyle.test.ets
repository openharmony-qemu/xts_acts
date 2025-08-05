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

export default function TimePickerDialogBGBlurStyleTest() {
  describe('TimePickerDialogBGBlurStyleTest', () => {
    beforeAll(async () => {
      console.info("TextPickerDialogShadow beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.nowear.api18.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
      const routerInstance = AppStorage.get<Router>("router") as Router
      let options: router.RouterOptions = {
        url:'MainAbility/pages/timePickerDialog/timePickerDialogBGBlurStyle',
      }
      try {
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!("TimePickerDialogBGBlurStyle" == pages.name)) {
          routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TimePickerDialogBGBlurStyle page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TimePickerDialogBGBlurStyle after each called");
    });
    /**
     * @tc.number    TimePickerDialogBGBlurStyleTest_static_001
     * @tc.name      TimePickerDialogBGBlurStyleTest_static_001
     * @tc.desc      To test the TimePickerDialog backgroundBlurStyle BlurStyle.Thin
     * @tc.level:    Level 0
     */
    it('TimePickerDialogBGBlurStyleTest_static_001',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('ThinID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog =  tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.Thin');
      }
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /**
     * @tc.number    TimePickerDialogBGBlurStyleTest_static_002
     * @tc.name      TimePickerDialogBGBlurStyleTest_static_002
     * @tc.desc      To test the TimePickerDialog backgroundBlurStyle BlurStyle.Regular
     * @tc.level:    Level 0
     */
    it('TimePickerDialogBGBlurStyleTest_static_002',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('RegularID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog =  tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.Regular');
      }
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /**
     * @tc.number    TimePickerDialogBGBlurStyleTest_static_003
     * @tc.name      TimePickerDialogBGBlurStyleTest_static_003
     * @tc.desc      To test the TimePickerDialog backgroundBlurStyle BlurStyle.Thick
     * @tc.level:    Level 0
     */
    it('TimePickerDialogBGBlurStyleTest_static_003',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('ThickID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog =  tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.Thick');
      }
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /**
     * @tc.number    TimePickerDialogBGBlurStyleTest_static_004
     * @tc.name      TimePickerDialogBGBlurStyleTest_static_004
     * @tc.desc      To test the TimePickerDialog backgroundBlurStyle BlurStyle.BACKGROUND_THIN
     * @tc.level:    Level 0
     */
    it('TimePickerDialogBGBlurStyleTest_static_004',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('BACKGROUND_THIN_ID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog =  tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_THIN');
      }
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /**
     * @tc.number    TimePickerDialogBGBlurStyleTest_static_005
     * @tc.name      TimePickerDialogBGBlurStyleTest_static_005
     * @tc.desc      To test the TimePickerDialog backgroundBlurStyle BlurStyle.BACKGROUND_REGULAR
     * @tc.level:    Level 0
     */
    it('TimePickerDialogBGBlurStyleTest_static_005',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('BACKGROUND_REGULAR_ID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog =  tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_REGULAR');
      }
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /**
     * @tc.number    TimePickerDialogBGBlurStyleTest_static_006
     * @tc.name      TimePickerDialogBGBlurStyleTest_static_006
     * @tc.desc      To test the TimePickerDialog backgroundBlurStyle BlurStyle.BACKGROUND_THICK
     * @tc.level:    Level 0
     */
    it('TimePickerDialogBGBlurStyleTest_static_006',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('BACKGROUND_THICK_ID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog =  tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_THICK');
      }
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /**
     * @tc.number    TimePickerDialogBGBlurStyleTest_static_007
     * @tc.name      TimePickerDialogBGBlurStyleTest_static_007
     * @tc.desc      To test the TimePickerDialog backgroundBlurStyle
     * @tc.level:    Level 0
     */
    it('TimePickerDialogBGBlurStyleTest_static_007',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('BACKGROUND_ULTRA_THICK_ID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog =  tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_ULTRA_THICK');
      }
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /**
     * @tc.number    TimePickerDialogBGBlurStyleTest_static_008
     * @tc.name      TimePickerDialogBGBlurStyleTest_static_008
     * @tc.desc      To test the TimePickerDialog backgroundBlurStyle
     * @tc.level:    Level 0
     */
    it('TimePickerDialogBGBlurStyleTest_static_008',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('NONE_ID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog =  tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /**
     * @tc.number    TimePickerDialogBGBlurStyleTest_static_009
     * @tc.name      TimePickerDialogBGBlurStyleTest_static_009
     * @tc.desc      To test the TimePickerDialog backgroundBlurStyle
     * @tc.level:    Level 0
     */
    it('TimePickerDialogBGBlurStyleTest_static_009',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('COMPONENT_ULTRA_THIN_ID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog =  tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THIN');
      }
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /**
     * @tc.number    TimePickerDialogBGBlurStyleTest_static_0010
     * @tc.name      TimePickerDialogBGBlurStyleTest_static_0010
     * @tc.desc      To test the TimePickerDialog backgroundBlurStyle
     * @tc.level:    Level 0
     */
    it('TimePickerDialogBGBlurStyleTest_static_0010',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('COMPONENT_THIN_ID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog =  tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_THIN');
      }
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /**
     * @tc.number    TimePickerDialogBGBlurStyleTest_static_0011
     * @tc.name      TimePickerDialogBGBlurStyleTest_static_0011
     * @tc.desc      To test the TimePickerDialog backgroundBlurStyle
     * @tc.level:    Level 0
     */
    it('TimePickerDialogBGBlurStyleTest_static_0011',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('COMPONENT_REGULAR_ID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog =  tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_REGULAR');
      }
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /**
     * @tc.number    TimePickerDialogBGBlurStyleTest_static_0012
     * @tc.name      TimePickerDialogBGBlurStyleTest_static_0012
     * @tc.desc      To test the TimePickerDialog backgroundBlurStyle
     * @tc.level:    Level 0
     */
    it('TimePickerDialogBGBlurStyleTest_static_0012',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('COMPONENT_THICK_ID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog =  tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_THICK');
      }
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /**
     * @tc.number    TimePickerDialogBGBlurStyleTest_static_0013
     * @tc.name      TimePickerDialogBGBlurStyleTest_static_0013
     * @tc.desc      To test the TimePickerDialog backgroundBlurStyle
     * @tc.level:    Level 0
     */
    it('TimePickerDialogBGBlurStyleTest_static_0013',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('COMPONENT_ULTRA_THICK_ID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog =  tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      }
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /**
     * @tc.number    TimePickerDialogBGBlurStyleTest_static_0014
     * @tc.name      TimePickerDialogBGBlurStyleTest_static_0014
     * @tc.desc      To test the TimePickerDialog backgroundBlurStyle
     * @tc.level:    Level 0
     */
    it('TimePickerDialogBGBlurStyleTest_static_0014',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('nullID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog =  tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      }
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /**
     * @tc.number    TimePickerDialogBGBlurStyleTest_static_0015
     * @tc.name      TimePickerDialogBGBlurStyleTest_static_0015
     * @tc.desc      To test the TimePickerDialog backgroundBlurStyle
     * @tc.level:    Level 0
     */
    it('TimePickerDialogBGBlurStyleTest_static_0015',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('undefinedID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog =  tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      }
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /**
     * @tc.number    TimePickerDialogBGBlurStyleTest_static_0016
     * @tc.name      TimePickerDialogBGBlurStyleTest_static_0016
     * @tc.desc      To test the TimePickerDialog backgroundBlurStyle
     * @tc.level:    Level 0
     */
    it('TimePickerDialogBGBlurStyleTest_static_0016',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('100ID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog =  tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      }
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
    /**
     * @tc.number    TimePickerDialogBGBlurStyleTest_static_0017
     * @tc.name      TimePickerDialogBGBlurStyleTest_static_0017
     * @tc.desc      To test the TimePickerDialog backgroundBlurStyle
     * @tc.level:    Level 0
     */
    it('TimePickerDialogBGBlurStyleTest_static_0017',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('-100ID')) as Component;
      await button!.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog =  tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      }
      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      done();
    })
  })
}