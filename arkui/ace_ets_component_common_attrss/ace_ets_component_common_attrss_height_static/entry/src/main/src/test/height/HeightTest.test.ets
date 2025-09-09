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
import { AttrsManager } from '../../../ets/MainAbility/common/AttrsManager';
import {Color,$r} from '@ohos.arkui.component'
import Utils, {CurrentRatio, BasePageConfig, PageConfig, TestValue, RectValue,SetValue,StrJsonObj } from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import { describe, expect,beforeAll } from '../../../../hypium/index';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
interface Attrs{
  $attrs: SetValue
}
/**
 * Test of common attribute: height
 */
export default function heightTest() {

  let supportView :Array<string>=new Array<string>( 'AlphabetIndexer',
    'Button',
    'BlankRow',
    'BlankColumn',
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
    'Navigation',
    'NavRouter',
    'Progress',
    'QRCode',
    'Radio',

    'Rating',
    'Search',
    'RichText',
    'Slider',
    'Text',

    'TextClock',

    'TextPicker',
    'TextTimer',
    'TimePicker',
    'Toggle',
    'Badge',
    'Column',

    'Flex',

    'Grid',
    'List',
    'ListItem',

    'Refresh',
    'Row',


    'Stack',
    'Swiper',

    'Circle',
    'Ellipse',
    'Polyline',
    'Polygon',
    'Path',
    'Rect',
    'Shape',
    'Line',


    'GridItem',
    'RelativeContainer',
    'Navigator',
    'Menu',
    'MenuItem',

    )



  let parentWidth = 300;
  let parentHeight = 300;

  let parentBackGroundColor = Color.Red
  let BackGroundColor = Color.Orange


  let pageConfig: PageConfig = {
    testName: 'testHeight',
    pageName: 'HeightPage',
    pageUrl: 'MainAbility/pages/height/HeightPage',
    parentHeight: parentHeight,
    parentWidth: parentWidth,
    parentBackGroundColor: parentBackGroundColor,
    parentComponentKey: 'parentComponentKey',
    BackGroundColor: BackGroundColor
  }


  let testValues: TestValue[] = [{
    describe: 'ExceedParent',
    setValue: {
      height: 550
    },
    expectValue: {
      heightCompare: '550.00vp',

    }
  },
    {
      describe: 'StringPercent',
      setValue: {
        height: '50%'
      },
      expectValue: {
        heightCompare: '50.00%',

      }
    }, {
      describe: 'Resource',
      setValue: {
        height: $r('app.float.200vp')
      },
      expectValue: {
        heightCompare: '200.00vp',

      }
    }, {
      describe: 'StringPx',
      setValue: {
        height: '300px'
      },
      expectValue: {
        heightCompare: '300.00px',
        height: 300
      }
    }]


  /**
   * Create test suite.
   */
  describe('HeightTest', () => {
    beforeAll(() => {

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {

      let rect = Utils.getComponentRect(data.pageConfig.componentKey??'');


      let rectParent = Utils.getComponentRect(data.pageConfig.parentComponentKey??'');
      let attrs = data.viewObj as Attrs

      let strJsonRectHeight = rect.bottom - rect.top;
      console.info('[' + data.caseTag + '] data.testValue.expectValue.height:' + data.testValue.expectValue.height);
      console.info('[' + data.caseTag + '] data.viewObj.$attrs.height:' + attrs?.$attrs.height);
      console.info('[' + data.caseTag + '] strJsonRectHeight is: ' + strJsonRectHeight);

      if (data.testValue.describe == 'ExceedParent') {

        expect(rectParent.top > rect.top || rectParent.bottom < rect.bottom)
          .assertEqual(data.testValue.expectValue.ExceedParent);
      }


      expect(attrs?.$attrs.height).assertEqual(data.testValue.expectValue.heightCompare);


      expect(Math.abs(strJsonRectHeight - (data.testValue.expectValue.height as number)) <= 1).assertTrue();
    })
  })
}