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
import { vp2px } from '@ohos.arkui.component';
import { AttrsManager } from '../../../ets/MainAbility/common/AttrsManager';
import Utils, { BasePageConfig, PageConfig, TestValue } from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import { describe, expect, beforeAll } from '../../../../hypium/index';
import { AlignRuleOption, VerticalAlign, HorizontalAlign, AlignRuleParam, Color, $r } from '@ohos.arkui.component';
import { jsonx } from "std/core";
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import {UtilsTest} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
// class PageConfig {
//   testName: string = '';
//   pageName: string = '';
//   pageUrl: string = '';
//   parentBackGroundColor: Color = Color.White;
//   parentComponentKey: string = '';
// }
//
// class TestValues {
//   describe: string = '';
//   setValue: jsonx.JsonElement;
//   expectValue: jsonx.JsonElement;
// }

/**
 * Test of common attribute: padding
 */
export default function paddingTest() {
  //A list of components that support padding attributes is required.
  let supportView:Array<string> = new Array<string>(
    'AlphabetIndexer',
    'Button',
    'BlankRow',
    'BlankColumn',
    //    'Checkbox',
    //    'CheckboxGroup',
    'DataPanel',
    'DatePicker',
    'Divider',
    'Gauge',
    'Image',
    'ImageAnimator',
    'LoadingProgress',
    'Marquee',
    'Navigation',
    'NavRouter',
    'Progress',
    'QRCode',
    //    'Radio',
    'ScrollBar',
    'Rating',
    'Search',
    'Slider',
    'Text',
    'TextArea',
    'TextClock',
    'TextInput',
    'TextPicker',
    'TextTimer',
    'TimePicker',
    //    'Toggle',
    'Circle',
    'Ellipse',
    'Polyline',
    'Polygon',
    'Path',
    'Rect',
    'Shape',
    'Line',
    'Menu',
    'MenuItem',
    'MenuItemGroup'
  )

  //Called from the parent class when setting the background color.
  let parentBackGroundColor = Color.Yellow

  //Page related configuration, this parameter is required.
  let pageConfig: PageConfig = {
    testName: 'testPaddingBaseLength',
    pageName: 'PaddingBasePageLength',
    pageUrl: 'MainAbility/pages/padding/PaddingBasePageLength',
    parentBackGroundColor: parentBackGroundColor,
    parentComponentKey: 'parentComponentKey'
  }

  //The data type to be tested, this parameter is required.
  let testValues: TestValue[] = [{
    describe: 'SetNumber',
    setValue: {
      padding: 100,
    },
    expectValue: {
      padding: '100.00vp'
    }
  }, {
    describe: 'SetStringPx',
    setValue: {
      padding: '200px',
    },
    expectValue: {
      padding: '200.00px'
    }
  }, {
    describe: 'SetResource',
    setValue: {
      padding: $r('app.float.100vp'),
    },
    expectValue: {
      padding: '100.00vp'
    }
  }, {
    describe: 'SetStringPercent',
    setValue: {
      padding: '20%',
    },
    expectValue: {
      padding: '20.00%'
    }
  }] as TestValue[]

  /**
   * Create test suite.
   */
  describe('PaddingBaseLengthTest', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      //Modify the reference component properties.
      AttrsManager.change(data.caseTag, data.testValue.setValue);
      await Utils.sleep(1000);

      //Confirm that the padding attribute values have been successfully set.
      let viewObj: jsonx.JsonElement = Utils.getComponentByKey(data.pageConfig.componentKey);
      console.info('[' + data.caseTag + '] viewObj.$attrs.padding:' + viewObj.getElement('$attrs').getString('padding'));
      console.info('[' + data.caseTag + '] data.testValue.expectValue.padding:' + data.testValue.expectValue.padding);
      
      //Confirm that the size attribute values have been successfully set.
      expect(viewObj.getElement('$attrs').getString('padding')).assertEqual(data.testValue.expectValue.padding);
    })
  })
}