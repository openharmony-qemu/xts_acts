/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, expect, beforeAll } from '../../../../hypium/index';
import { AlignRuleOption, VerticalAlign, HorizontalAlign, AlignRuleParam } from '@ohos.arkui.component';
import { AttrsManager } from '../../../ets/MainAbility/common/AttrsManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
// class PageConfig {
//   testName: string = '';
//   pageName: string = '';
//   pageUrl: string = '';
// }
//
// class TestValues {
//   describe: string = '';
//   setValue: boolean = false;
//   expectValue: ESObject
// }

export default function stateStylesTest() {
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
    'Slider',
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
    'Counter',
    'Flex',
    'GridCol',
    'GridRow',
    'Grid',
    'GridItem',
    'List',
    'ListItem',
    'ListItemGroup',
    'Navigator',
    'Panel',
    'Refresh',
    'RelativeContainer',
    'Row',
    'Scroll',
    'Stack',
    'Swiper',
    'Tabs',
    'TabContent',
    'Circle',
    'Ellipse',
    'Polyline',
    'Polygon',
    'Path',
    'Rect',
    'Shape',
    'Line'
  ]

  let pageConfig: PageConfig = {
    testName: 'testStateStyles',
    pageName: 'StateStylesPage',
    pageUrl: 'MainAbility/pages/stateStyles/StateStylesPage'
  }

  let testValues: TestValue[] = [{
    describe: 'SetDisabled',
    setValue: false,
    expectValue: {
      disabledStyles: 2,
      normalStyles: 1
    }
  }]

  describe('StateStylesTest', () => {
    beforeAll(() => {
      console.info("AlignRulesTest beforeEach start");
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
          hilog.info(domain, tag, '%{public}s', 'onAbilityCreate end');
        },
      }, (err : BusinessError | null) : void => {
        if (err != null ) {
          hilog.info(domain, tag, '%{public}s', '-----'+ err.code);
        }
        hilog.info(domain, tag, '%{public}s', 'BusinessError  end');
      });
      await CommonFunc.sleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.arkui.component.common.attrs.test")
      await CommonFunc.sleep(2000)
    });
    CommonTest.initTest(pageConfig, supportView, testValues,  async (data: BasePageConfig): Promise<void> => {
      // //Obtain target component information before changes
      let targetBeforeObj = Utils.getComponentByKey(data.pageConfig.componentKey!);
      //
      // //Set value
      AttrsManager.change(data.caseTag, data.testValue.setValue);
      await Utils.sleep(1000);
      //
      // //Obtain target component information after changes
      let targetAfterObj = Utils.getComponentByKey(data.pageConfig.componentKey!);
      //
      // //Check results
      console.info('[' + data.caseTag + ']' + 'targetBeforeObj.$attrs.zIndex is:' + targetBeforeObj.getElement('$attrs').getString('zIndex'));
      expect(targetBeforeObj.getElement('$attrs').getString('zIndex')).assertEqual(data.testValue.expectValue.normalStyles);
      console.info('[' + data.caseTag + ']' + 'targetAfterObj.$attrs.zIndex is:' + targetAfterObj.getElement('$attrs').getString('zIndex'));
      expect(targetAfterObj.getElement('$attrs').getString('zIndex')).assertEqual(data.testValue.expectValue.disabledStyles);
    });
  })
}