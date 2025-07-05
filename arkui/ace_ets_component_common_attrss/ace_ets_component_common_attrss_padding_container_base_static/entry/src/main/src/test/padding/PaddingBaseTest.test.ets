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
import { AttrsManager, GrowValue } from '../../../ets/MainAbility/common/AttrsManager';
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
//   setValue?: Padding;
//   expectValue?: Padding;
// }
//
// class Padding {
//   padding: ESObject
// }


export default function paddingTest() {
  //A list of components that support padding attributes is required.
  let supportView: Array<string> = new Array<string>(
    'AlphabetIndexer',
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
    'Toggle',
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
    'MenuItemGroup')

  //Called from the parent class when setting the background color.
  let parentBackGroundColor = Color.Yellow

  //Page related configuration, this parameter is required.
  let pageConfig: PageConfig = {
    testName: 'testPaddingBase',
    pageName: 'PaddingBasePage',
    pageUrl: 'MainAbility/pages/padding/PaddingBasePage',
    parentBackGroundColor: parentBackGroundColor,
    parentComponentKey: 'parentComponentKey'
  }

  //The data type to be tested, this parameter is required.
  let testValues: TestValue[] = [
    {
      describe: 'SetPadding',
      setValue: {
        padding: {
          top: 200,
          right: 100,
          bottom: 100,
          left: 100
        }
      },
      expectValue: {
        padding: {
          top: '200.00vp', right: '100.00vp', bottom: '100.00vp', left: '100.00vp'
        }
      }
    }, {
    describe: 'SetPaddingTop',
    setValue: {
      padding: {
        top: 200
      }
    },
    expectValue: {
      padding: {
        top: '200.00vp'
      }
    }
  }, {
    describe: 'SetPaddingRight',
    setValue: {
      padding: {
        right: 200
      }
    },
    expectValue: {
      padding: {
        right: '200.00vp'
      }
    }
  }, {
    describe: 'SetPaddingBottom',
    setValue: {
      padding: {
        bottom: 200
      }
    },
    expectValue: {
      padding: {
        bottom: '200.00vp'
      }
    }
  }, {
    describe: 'SetPaddingLeft',
    setValue: {
      padding: {
        left: 200
      }
    },
    expectValue: {
      padding: {
        left: '200.00vp'
      }
    }
  }]

  /**
   * Create test suite.
   */
  describe('PaddingBaseTest', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.padding_container.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      //Modify the target component properties.
      AttrsManager.change(data.caseTag, {
        padding: {
          left: 0, right: 0, top: 0, bottom: 0
        }
      } as GrowValue);
      await Utils.sleep(1000);

      //Modify the target component properties.
      AttrsManager.change(data.caseTag, data.testValue.setValue);
      await Utils.sleep(1000);

      //Obtain dimensional information for target components.
      let viewObj: jsonx.JsonElement = Utils.getComponentByKey(data.pageConfig.componentKey);
      console.info('[' + data.caseTag + '] viewObj.$attrs.padding:' + viewObj.getElement('$attrs').getString('padding'));
      console.info('[' + data.caseTag + '] data.testValue.expectValue.padding:' + data.testValue.expectValue.padding);

      if (data.testValue.describe == 'SetPaddingTop') {
        //Verify the method of setting top separately.
        console.info('[' + data.caseTag + '] JSON.parse(viewObj.$attrs.padding).top:'
          + JSON.parseJsonElement(viewObj.getElement('$attrs').getString('padding')).getString('top'));
        expect(JSON.parseJsonElement(viewObj.getElement('$attrs').getString('padding')).getString('top')).assertEqual(data.testValue.expectValue.padding.top);
      } else if (data.testValue.describe == 'SetPaddingRight') {
        //Verify the method of setting right separately.
        console.info('[' + data.caseTag + '] JSON.parse(viewObj.$attrs.padding).right:'
          + JSON.parseJsonElement(viewObj.getElement('$attrs').getString('padding')).getString('right'));
        expect(JSON.parseJsonElement(viewObj.getElement('$attrs').getString('padding')).getString('right')).assertEqual(data.testValue.expectValue.padding.right);
      } else if (data.testValue.describe == 'SetPaddingBottom') {
        //Verify the method of setting bottom separately.
        console.info('[' + data.caseTag + '] JSON.parse(viewObj.$attrs.padding).bottom:'
          + JSON.parseJsonElement(viewObj.getElement('$attrs').getString('padding')).getString('bottom'));
        expect(JSON.parseJsonElement(viewObj.getElement('$attrs').getString('padding')).getString('bottom')).assertEqual(data.testValue.expectValue.padding.bottom);
      } else if (data.testValue.describe == 'SetPaddingLeft') {
        //Verify the method of setting left separately.
        console.info('[' + data.caseTag + '] JSON.parse(viewObj.$attrs.padding).left:'
          + JSON.parseJsonElement(viewObj.getElement('$attrs').getString('padding')).getString('left'));
        expect(JSON.parseJsonElement(viewObj.getElement('$attrs').getString('padding')).getString('left')).assertEqual(data.testValue.expectValue.padding.left);
      } else if (data.testValue.describe == 'SetPadding') {
        //Method for verifying the setting of padding.
        console.info('[' + data.caseTag + '] viewObj.$attrs.padding:' + viewObj.getElement('$attrs').getString('padding'));
        expect(viewObj.getElement('$attrs').getString('padding')).assertEqual(JSON.stringify(data.testValue.expectValue.padding));
      }
    })
  })
}
