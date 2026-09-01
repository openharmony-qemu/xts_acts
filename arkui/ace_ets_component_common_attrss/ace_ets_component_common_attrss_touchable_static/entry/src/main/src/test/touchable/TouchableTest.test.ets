'use static';
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

import Utils, { BasePageConfig, PageConfig, TestValue, RectValue } from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import { describe, expect, beforeEach } from '../../../../hypium/index';
import { AlignRuleOption, VerticalAlign, HorizontalAlign, HitTestMode } from '@ohos.arkui.component';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';

/**
 * Test of common attribute: touchable
 */
export default function touchableTest() {
  //A list of components that support the touchable attribute, which is required.
  let supportView = [
    'AlphabetIndexer',
    'Button',
    'Blank',
    'Checkbox',
    'CheckboxGroup',
    'DataPanel',
    'DatePicker',
    'Divider',
    'Gauge',
    'Image',
    'ImageAnimator',
    'LoadingProgress',
    'Marquee',
    'Menu',
    'MenuItem',
    'MenuItemGroup',
    'Navigation',
    'NavRouter',
    'Progress',
    'QRCode',
    'Radio',
    'Rating',
    'ScrollBar',
    'Search',
    'Select',
    'Slider',
    'TabContent',
    'Text',
    'TextArea',
    'TextClock',
    'TextInput',
    'TextPicker',
    'TextTimer',
    'TimePicker',
    'Toggle',
    'Badge',
    'Column',
    'ColumnSplit',
    'Counter',
    'Flex',
    'FlowItem',
    'GridCol',
    'GridRow',
    'Grid',
    'GridItem',
    'List',
    'ListItem',
    'ListItemGroup',  //pass
    'Refresh',
    'RelativeContainer',
    'Row',
    'RowSplit',
    'Scroll',
    'SideBarContainer',
    'Stack',
    'Swiper',
    'Tabs',
    'Circle',
    'Ellipse',
    'Polyline',
    'Polygon',
    'Path',
    'Rect',
    'Shape',
    'Line',
    'WaterFlow'
  ]

  //Page related configuration, this parameter is required.
  let pageConfig: PageConfig = {
    testName: 'testTouchable',
    pageName: 'TouchablePage',
    pageUrl: 'MainAbility/pages/touchable/TouchablePage',
  }

  //The data type to be tested, this parameter is required.
  let testValues: TestValue[] = [{
    describe: 'SetDefault',
    setValue: HitTestMode.Default,
    expectValue: 'HitTestMode.Default'
  },{
    describe: 'SetBlock',
    setValue: HitTestMode.Block,
    expectValue: 'HitTestMode.Block'
  }]

  /**
   * Create test suite.
   */
  describe('TouchableTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues,  async (data: BasePageConfig): Promise<void> => {
      let strJson = inspector.getInspectorByKey(pageConfig.componentKey);
      await CommonFunc.sleep(2000);
      data.viewObj = JSON.parseJsonElement(strJson);
      console.info('[' + data.caseTag + ']' + 'touchable is:' + data.viewObj?.getElement("$attrs").getString('hitTestBehavior'));
      expect(data.viewObj?.getElement("$attrs").getString('hitTestBehavior'))
        .assertEqual(data.testValue.expectValue);
    })
  })
}