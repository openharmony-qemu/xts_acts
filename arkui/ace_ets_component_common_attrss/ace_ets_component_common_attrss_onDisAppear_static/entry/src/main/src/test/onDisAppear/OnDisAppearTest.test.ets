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


export default function onDisAppearTest() {

  let supportView: Array<string> = new Array<string>(
  'AlphabetIndexer',
   'Blank',
   'Button',
   'Checkbox',
   'CheckboxGroup',
   'DataPanel',
   'DatePicker',
   'Divider',
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
    'Counter',
    'Gauge',
  )

  //Custom params.
  let compareTextKey = 'compareTextKey'
  let targetWidth = 60;
  let targetHeight = 60;


  let pageConfig: PageConfig = {
    testName: 'testOnDisAppear',
    pageName: 'OnDisAppearPage',
    pageUrl: 'MainAbility/pages/onDisAppear/OnDisAppearPage',
    targetGroupView: 'targetGroupView',
    compareTextKey: compareTextKey,
    targetWidth: targetWidth,
    targetHeight: targetHeight
  }

  //Test content and expected results
  let testValues: TestValue[] = [{
    describe: '',
    setValue: {
      isShow: false
    },
    expectValue: {
      changeDisAppear: 'changeDisAppear'
    } as ResponseRegion
  }]

  describe('OnDisAppearTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async (data:BasePageConfig): Promise<void> => {
      //Set value
      // AttrsManager.change(data.caseTag, data.testValue.setValue);
      AppStorage.setOrCreate<boolean>('_isShow', data.testValue.setValue.isShow)
      await Utils.sleep(2000);
      //Get text content,check content is changeDisAppear
      let compareTextObj: jsonx.JsonElement = Utils.getComponentByKey(data.pageConfig.compareTextKey);
      console.info('compareTextObj.getElement($attrs).getString(content): ' + compareTextObj.getElement('$attrs').getString('content'));
      expect(compareTextObj.getElement('$attrs').getString('content')).assertEqual(data.testValue.expectValue?.changeDisAppear);
    });
  })
}