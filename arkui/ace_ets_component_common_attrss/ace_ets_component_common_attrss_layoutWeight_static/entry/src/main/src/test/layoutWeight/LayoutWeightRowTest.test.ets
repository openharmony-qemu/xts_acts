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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
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
interface Attrs{
  $attrs: SetValue
}
export default function layoutWeightRowTest() {
  let supportView: Array<string> = new Array<string>(
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
    'Navigation',
    'NavRouter',
    'Progress',
    'QRCode',
    'Radio',
    'Rating',
    'RichText',
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
    //'Flex',
    'GridRow',
    'Grid',
    'List',
    'Navigator',
    'Panel',
    'Refresh',
    'RelativeContainer',
    'Row',
    'Scroll',
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
    'Line'
  )
  let childWidth = 100;
  let childHeight = 100;
  let parentWidth = 400;
  let parentHeight = 600;
  let pageConfig: PageConfig = {
    testName: 'testLayoutWeight',
    pageName: 'LayoutWeightPageRow',
    pageUrl: 'MainAbility/pages/layoutWeight/LayoutWeightPageRow',
    targetGroupView: 'targetGroupView',
    childWidth: childWidth,
    childHeight: childHeight,
    parentWidth: parentWidth,
    parentHeight: parentHeight
  }

  let testValues: TestValue[] = [{
    describe: 'InRow',
    setValue: {
      layoutWeight: 1
    },
    expectValue: {
      layoutWeight: 1,
      // width: vp2px(200)
      width: 200
    }
  }]

  describe('LayoutWeightRowTest', () => {
    beforeAll(() => {
      console.info("layoutWeightRowTest beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    CommonTest.initTest(pageConfig, supportView, testValues,async (data: BasePageConfig): Promise<void>=> {
      let rect = Utils.getComponentRect(data.pageConfig.componentKey??'');
      //Component width and height calculation
      let width = rect.right - rect.left;
      let attrs = data.viewObj as Attrs
      console.info('[' + data.caseTag + ']' + 'rect.right is:' + JSON.stringify(rect.right));
      console.info('[' + data.caseTag + ']' + 'rect.left is:' + JSON.stringify(rect.left));
      console.info('[' + data.caseTag + ']' + 'width is:' + JSON.stringify(width));
      console.info('[' + data.caseTag + ']' + 'layoutWeight is:' + attrs?.$attrs.layoutWeight);
      console.info('[' + data.caseTag + ']' + 'expectWidth is:' + data.testValue.expectValue.width);
      expect(attrs?.$attrs.layoutWeight).assertEqual(data.testValue.expectValue.layoutWeight);
      if (data.pageConfig.componentKey == 'TextInput') {
        expect(Math.floor(Math.abs(width - (data.testValue.expectValue.width as number))) <= 2).assertTrue();
      } else {
        expect(Math.floor(Math.abs(width - (data.testValue.expectValue.width as number))) <= 1).assertTrue();
      }
    });
  })
}