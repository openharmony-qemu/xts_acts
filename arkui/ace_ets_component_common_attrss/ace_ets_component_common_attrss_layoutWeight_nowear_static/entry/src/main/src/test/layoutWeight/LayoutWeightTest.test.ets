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
import { AppStorage, StoragePropRef } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function layoutWeightTest() {
  console.info("layoutWeightTest beforeAll start 11111");
  await UtilsTest.msSleep(4000)
  await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.layoutWeight.nowear.test.static", "EntryAbility")
  await UtilsTest.msSleep(4000)

  console.info("layoutWeightTest beforeAll start 222222222222222");
  let uiContext = AppStorage.get<UIContext>('uiContext')!
  console.info("layoutWeightTest beforeAll start 33333333333333");
  let supportView: Array<string> = new Array<string>(
    'Select',
    'ColumnSplit',
    'RowSplit',
    'SideBarContainer',
    'WaterFlow'
  )
  let childWidth = 100;
  let childHeight = 100;
  let parentWidth = 400;
  let parentHeight = 600;
  let pageConfig: PageConfig = {
    testName: 'testLayoutWeight',
    pageName: 'LayoutWeightPage',
    pageUrl: 'MainAbility/pages/layoutWeight/LayoutWeightPage',
    targetGroupView: 'targetGroupView',
    childWidth: childWidth,
    childHeight: childHeight,
    parentWidth: parentWidth,
    parentHeight: parentHeight
  }

  let testValues: TestValue[] = [{
    describe: 'SetNumber',
    setValue: {
      layoutWeight: 2
    },
    expectValue: {
      layoutWeight: 2,
      height: uiContext.vp2px(400)
    }
  }, {
    describe: 'SetNumberDecimal',
    setValue: {
      layoutWeight: 1.5
    },
    expectValue: {
      layoutWeight: 1.5,
      height: uiContext.vp2px(360)
    }
  }, {
    describe: 'SetString',
    setValue: {
      layoutWeight: '2'
    },
    expectValue: {
      layoutWeight: 2,
      height: uiContext.vp2px(400)
    }
  }]

  describe('LayoutWeightTest', () => {
    beforeAll(() => {
      console.info("layoutWeightTest beforeAll start");

    });
    CommonTest.initTest(pageConfig, supportView, testValues,async (data: BasePageConfig): Promise<void> => {
      let rect = Utils.getComponentRect(data.pageConfig.componentKey??'');
      //Component width and height calculation
      let height = rect.bottom - rect.top;
      let attrs = data.viewObj
      console.info('[' + data.caseTag + ']' + 'rect.bottom is:' + JSON.stringify(rect.bottom));
      console.info('[' + data.caseTag + ']' + 'rect.top is:' + JSON.stringify(rect.top));
      console.info('[' + data.caseTag + ']' + 'getComponentRect is height:' + JSON.stringify(height));
      console.info('[' + data.caseTag + ']' + 'layoutWeight is:' + attrs?.getElement('$attrs').getDouble('layoutWeight'));
      console.info('[' + data.caseTag + ']' + 'expectHeight is:' + data.testValue.expectValue.height);
      expect(attrs?.getElement('$attrs').getDouble('layoutWeight')).assertEqual(data.testValue.expectValue.layoutWeight);
      expect(Math.floor(Math.abs(height - (data.testValue.expectValue.height as number))) <= 1).assertTrue();
    });
  })
}