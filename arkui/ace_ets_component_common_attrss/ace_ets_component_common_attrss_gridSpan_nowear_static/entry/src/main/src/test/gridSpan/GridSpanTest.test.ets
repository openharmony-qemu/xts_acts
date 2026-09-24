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


import { Color,$r} from '@ohos.arkui.component'
import Utils, {CurrentRatio, BasePageConfig, PageConfig, TestValue, RectValue,StrJsonObj } from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import { describe, expect } from '../../../../hypium/index';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage, StoragePropRef } from '@ohos.arkui.stateManagement';
interface Attrs{
  $attrs: number
}
export default function gridSpanTest() {
  let supportView:Array<string> = new Array <string>(
    'Select',
    'ColumnSplit',
    'FlowItem',
    'RowSplit',
    'SideBarContainer',
    'WaterFlow'
  )

  //Custom params.
  let parentWidth = 320;
  let parentHeight = 200;
  let gutter = 10;
  let columns = 3;
  let pageConfig: PageConfig = {
    testName: 'testGridSpan',
    pageName: 'GridSpanPage',
    pageUrl: 'MainAbility/pages/gridSpan/GridSpanPage',
    parentHeight: parentHeight,
    parentWidth: parentWidth,
    gutter: gutter,
    columns: columns
  }

  let testValues: TestValue[] = [{
    describe: 'SetNumber',
    setValue: 2,
    expectValue: {
      gridSpan: 2
    }
  }]

  describe('GridSpanTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      console.info('[' + data.caseTag + ']' + 'gridSpan is:' + data.viewObj?.getElement('$attrs').getString('span'));
      expect(data.viewObj?.getElement('$attrs').getString('span'))
        .assertEqual(data.testValue.expectValue.gridSpan.toString());
    });
  })
}