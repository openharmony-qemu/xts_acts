/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import Utils, { BasePageConfig, PageConfig, TestValue, RectValue, Attrs } from '../../../ets/MainAbility/common/Utils';
import CommonTest from '../common/CommonTest';
import { describe, expect, beforeAll  } from '../../../../hypium/index'
import {  ItemAlign, VerticalAlign, HorizontalAlign, MouseButton, MouseAction } from '@ohos.arkui.component'
import { AttrsManager } from '../../../ets/MainAbility/common/AttrsManager';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

function expectEvent(data: BasePageConfig, event: string) {
  let referenceComponent: Attrs = Utils.getComponentByKey(data.pageConfig.referenceComponentKey);
  if (isEnabledTrue(data)) {
    expect(referenceComponent.$attrs.content).assertContain(event);
  } else {
    expect(referenceComponent.$attrs.content).assertEqual('');
  }
}

function isEnabledTrue(data: BasePageConfig): boolean {
  return data.testValue.describe.indexOf('SetTrue') >= 0;
}

/**
 * Test of common attribute: enabled
 */
export default function enabledTest() {
  //A list of components that support the enabled attribute, which is required.
  let supportView: Array<string> = new Array<string>(
    'AlphabetIndexer',
    'Blank',
    'Button',
    'Checkbox',
    'CheckboxGroup',
    'DataPanel',
    'DatePicker',
    'Divider',
    'Gauge',
    'Image',
    //    'ImageAnimator',
    'LoadingProgress',
    'Marquee',
    //    'Menu',
    'MenuItem',
    //    'MenuItemGroup',
    //    'Navigation',
    'NavRouter',
    'ScrollBar',
    //    'RowSplit',
    'Row',
    'RelativeContainer',
    'Navigator',
    //    'ListItemGroup',
    'GridItem',
    //    'GridCol',
    //    'ColumnSplit',
    'TextTimer',
    'Stepper',
    'StepperItem',
    'Flex',
    //    'FlowItem',
    'Progress',
    'QRCode',
    'Radio',
    'Rating',
    //    'Search',
    'Select',
    'Slider',
    'Text',
    'TextArea',
    'TextClock',
    'TextInput',
    'TextPicker',
    'TimePicker',
    'Toggle',
    'Badge',
    'Column',
    'Counter',
    //    'GridRow',
    'Grid',
    'List',
    'ListItem',
    'Panel',
    'Refresh',
    'Scroll',
    //    'SideBarContainer',
    'Stack',
    //    'Swiper',
    'Tabs',
    //    'TabContent',
    'WaterFlow',
    'Circle',
    'Ellipse',
    'Line',
    'Polyline',
    'Polygon',
    'Path',
    'Rect',
    'Shape'
  )

  let exceptFocusViews: Array<string> = new Array<string>('Blank', 'DataPanel', 'Divider', 'Gauge',
    'LoadingProgress', 'Progress', 'Marquee', 'Navigation', 'NavRouter',
    'QRCode', 'ScrollBar', 'TextClock', 'TextTimer', 'Badge', 'Navigator',
    'Panel', 'Refresh', 'RelativeContainer', 'Circle', 'Ellipse', 'Line',
    'Polyline', 'Polygon', 'Path', 'Rect', 'Shape', 'WaterFlow')

  //Page related configuration, this parameter is required.
  let pageConfig: PageConfig = {
    testName: 'testEnabled',
    pageName: 'EnabledPage',
    pageUrl: 'MainAbility/pages/enabled/EnabledPage',
    referenceComponentKey: 'referenceComponentKey'
  }

  //The data type to be tested, this parameter is required.
  let testValues: TestValue[] = [{
    describe: 'SetTrueOnClick',
    setValue: true,
    expectValue: true
  }, {
    describe: 'SetTrueOnFocus',
    exceptView: exceptFocusViews,
    setValue: true,
    expectValue: true
  }, {
    describe: 'SetTrueOnBlur',
    exceptView: exceptFocusViews,
    setValue: true,
    expectValue: true
  }, {
    describe: 'SetTrueOnHover',
    setValue: true,
    expectValue: true
  }, {
    describe: 'SetTrueOnMouse',
    setValue: true,
    expectValue: true
  }, {
    describe: 'SetFalseOnClick',
    setValue: false,
    expectValue: false
  }, {
    describe: 'SetFalseOnFocus',
    exceptView: exceptFocusViews,
    setValue: false,
    expectValue: false
  }, {
    describe: 'SetFalseOnBlur',
    exceptView: exceptFocusViews,
    setValue: false,
    expectValue: false
  }, {
    describe: 'SetFalseOnHover',
    setValue: false,
    expectValue: false
  }/* ,{
    describe: 'SetFalseOnMouse',
    setValue: false,
    expectValue: false
  }*/]

  /**
   * Create test suite.
   */
  describe('EnabledTest', () => {
    beforeAll(() => {
      console.info("enabledTest beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig) => {
      if ('' != Utils.getComponentByKey(data.pageConfig.referenceComponentKey).$attrs.content) {
        console.info('[' + data.caseTag + '] reset status.');
        AttrsManager.change(data.caseTag, data.testValue.setValue);
        await Utils.sleep(1000);
      }

      if (data.testValue.describe.indexOf('OnClick') >= 0) {
        //Verify onClick
        console.info('[' + data.caseTag + '] verify onClick.');
        let clickResult = Utils.performClick(data.pageConfig.componentKey!);
        expect(clickResult).assertEqual(true);
        if ('Select' == data.pageConfig.targetView && isEnabledTrue(data)) {
          //After selecting, need to click again to close the dropdown box.
          await Utils.sleep(2000);
          expectEvent(data, 'onClick');
          Utils.performClick(data.pageConfig.componentKey!);
          await Utils.sleep(2000);
        } else {
          await Utils.sleep(1000);
          expectEvent(data, 'onClick');
        }
      } else if (data.testValue.describe.indexOf('OnFocus') >= 0) {
        //Verify onFocus
        console.info('[' + data.caseTag + '] verify onFocus.');
        let focusResult = Utils.requestFocus(data.pageConfig.referenceComponentKey!);
        expect(focusResult).assertEqual(true);
        await Utils.sleep(1000);
        focusResult = Utils.requestFocus(data.pageConfig.componentKey!);
        expect(focusResult).assertEqual(isEnabledTrue(data));
        await Utils.sleep(1000);
        expectEvent(data, 'onFocus');
      } else if (data.testValue.describe.indexOf('OnBlur') >= 0) {
        //Verify onBlur
        console.info('[' + data.caseTag + '] verify onBlur.');
        expect(Utils.requestFocus(data.pageConfig.referenceComponentKey!)).assertEqual(true);
        await Utils.sleep(1000);
        expect(Utils.requestFocus(data.pageConfig.componentKey!)).assertEqual(isEnabledTrue(data));
        await Utils.sleep(1000);
        expect(Utils.requestFocus(data.pageConfig.referenceComponentKey!)).assertEqual(true);
        await Utils.sleep(1000);
        expectEvent(data, 'onBlur');
      } else if (data.testValue.describe.indexOf('OnHover') >= 0) {
        //Verify onHover
        console.info('[' + data.caseTag + '] verify onHover.');
        let hoverResult = Utils.performMouseEvent(data.pageConfig.componentKey!
          , MouseButton.None, MouseAction.Hover);
        expect(hoverResult).assertEqual(true);
        await Utils.sleep(1000);
        expectEvent(data, 'onHover');
      } else if (data.testValue.describe.indexOf('OnMouse') >= 0) {
        //Verify onMouse
        console.info('[' + data.caseTag + '] verify onMouse.');
        let mouseResult = Utils.performMouseEvent(data.pageConfig.componentKey!
          , MouseButton.Left, MouseAction.Press);
        expect(mouseResult).assertEqual(true);
        await Utils.sleep(1000);
        expectEvent(data, 'onMouse');
      }

      //Verify enabled value.
      console.info('[' + data.caseTag + '] Verify enabled value.');
      expect(Utils.getComponentByKey(data.pageConfig.componentKey!).$attrs.enabled)
        .assertEqual(data.testValue.expectValue);
    })
  })

}