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

import Utils, { BasePageConfig, PageConfig, TestValue, RectValue, SetValue, ResponseRegion } from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import { describe, expect } from '../../../../hypium/index';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AttrsManager } from '../../../ets/MainAbility/common/AttrsManager';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';


export default function onAppearTest() {

  //Component to be tested
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
    'Marquee',
    'Progress',
    'QRCode',
    'Radio',
    'Rating',
    'ScrollBar',
    'Search',
    'Slider',
    'Text',
    'TextArea',
    'TextClock',
    'TextInput',
    'TextPicker',
    'TimePicker',
    'Toggle',
    'Column',
    'Flex',
    'Grid',
    'GridItem',
    'List',
    'ListItem',
    'Refresh',
    'RelativeContainer',
    'Row',
    'Scroll',
    'Stack',
    'Swiper',
    'Tabs',
    'Circle',
    'Ellipse',
    'Line',
    'Polyline',
    'Polygon',
    'Path',
    'Rect',
    'Shape',
    'Counter'
  )

  //Custom params.
  let compareTextKey = 'compareTextKey';
  let targetWidth = 60;
  let targetHeight = 60;

  let pageConfig: PageConfig = {
    testName: 'testOnAppear',
    pageName: 'OnAppearPage',
    pageUrl: 'MainAbility/pages/onAppear/OnAppearPage',
    targetGroupView: 'targetGroupView',
    compareTextKey: compareTextKey,
    targetWidth: targetWidth,
    targetHeight: targetHeight
  }

  //Test content and expected results
  let testValues: TestValue[] = [{
    describe: '',
    expectValue: {
      changeAppear: 'onAppear'
    }
  }]

  describe('OnAppearTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async (data:BasePageConfig): Promise<void> => {
      //Get text content,check content is onAppear
      await Utils.sleep(500);
      let compareTextObj = Utils.getComponentByKey(data.pageConfig.compareTextKey);
      await Utils.sleep(500);
      console.info('compareTextObj.getElement($attrs).getString(content): ' +
      compareTextObj.getElement('$attrs').getString('content'));
      expect(compareTextObj.getElement('$attrs').getString('content'))
        .assertEqual(data.testValue.expectValue?.changeAppear);
    });
  })
}
