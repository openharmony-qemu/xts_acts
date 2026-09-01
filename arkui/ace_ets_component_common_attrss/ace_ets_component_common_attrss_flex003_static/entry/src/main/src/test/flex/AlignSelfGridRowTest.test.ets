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
import Utils, {
  BasePageConfig,
  PageConfig,
  TestValue,
  DefaultAlignItems,
} from '../../../ets/MainAbility/common/Utils';
import CommonTest from '../common/CommonTest';
import { describe, expect } from '../../../../hypium/index'
import { ItemAlign, VerticalAlign, HorizontalAlign } from '@ohos.arkui.component'
import { UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

const uiContext = AppStorage.get<UIContext>('uiContext')!;

export default function alignSelfGridRowTest() {

  let supportView = [
    'GridCol'
  ]

  let parentWidth = 400;
  let parentHeight = 400;

  let pageConfig: PageConfig = {
    testName: 'testAlignSelf',
    pageName: 'AlignSelfPage',
    pageUrl: 'MainAbility/pages/flex/AlignSelfPage',
    parentWidth: parentWidth,
    parentHeight: parentHeight,
    parentComponentKey: 'parentComponentKey'
  }

  let defaultAlignItems: DefaultAlignItems = {
    Row: VerticalAlign.Top,
    Column: HorizontalAlign.Start,
    Flex: ItemAlign.Start,
    GridRow: ItemAlign.Start
  }

  let testValues: TestValue[] = [{
    describe: 'SetAuto',
    setValue: {
      defaultAlignItems: defaultAlignItems,
      alignSelf: ItemAlign.Auto
    },
    expectValue: {
      expectAlignSelf: 'ItemAlign.Auto'
    }
  }, {
    describe: 'SetStart',
    setValue: {
      defaultAlignItems: {
        Row: VerticalAlign.Center,
        Column: HorizontalAlign.Center,
        Flex: ItemAlign.Center,
        GridRow: ItemAlign.Center
      },
      alignSelf: ItemAlign.Start
    },
    expectValue: {
      expectAlignSelf: 'ItemAlign.Start'
    }
  }, {
    describe: 'SetCenter',
    setValue: {
      defaultAlignItems: defaultAlignItems,
      alignSelf: ItemAlign.Center
    },
    expectValue: {
      expectAlignSelf: 'ItemAlign.Center'
    }
  }, {
    describe: 'SetEnd',
    setValue: {
      defaultAlignItems: defaultAlignItems,
      alignSelf: ItemAlign.End
    },
    expectValue: {
      expectAlignSelf: 'ItemAlign.End'
    }
  }, {
    describe: 'SetStretch',
    setValue: {
      defaultAlignItems: defaultAlignItems,
      alignSelf: ItemAlign.Stretch
    },
    expectValue: {
      expectAlignSelf: 'ItemAlign.Stretch'
    }
  }, {
    describe: 'SetBaseLine',
    setValue: {
      defaultAlignItems: defaultAlignItems,
      alignSelf: ItemAlign.Baseline
    },
    expectValue: {
      expectAlignSelf: 'ItemAlign.Baseline'
    }
  }]

  describe('AlignSelfGridRowTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {

      //Get component rect and parent component rect
      let parentRect = Utils.getComponentRect(data.pageConfig.parentComponentKey as string);
      let rect = Utils.getComponentRect(data.pageConfig.componentKey as string);
      AppStorage.setOrCreate<ItemAlign>('_alignSelf', data.testValue.setValue.alignSelf)
      //Get viewObj in order to judge attribute is set success
      let viewObj = Utils.getComponentByKey(data.pageConfig.componentKey as string);

      //Verify attribute
      expect(data.viewObj!.getElement('$attrs').getString('alignSelf')).assertEqual(data.testValue.expectValue.expectAlignSelf);

      //When set different value, judge the alignment is correct
      if (data.testValue.describe == 'SetAuto' || data.testValue.describe == 'SetStart') {
        //When alignSelf : ItemAlign.Auto or ItemAlign.Start
        expect(rect.top).assertEqual(parentRect.top);
        expect(rect.left).assertEqual(parentRect.left);
      } else if (data.testValue.describe == 'SetCenter') {
        //When alignSelf : ItemAlign.Center
        const rect = Utils.getComponentRect(data.pageConfig.componentKey)
        const parentRect = Utils.getComponentRect(data.pageConfig.parentComponentKey)
        let rectY = Utils.getRectVerticalCenterY(rect);
        console.info('[' + data.caseTag + '] rectY : '
          + rectY);

        let parentRectY = Utils.getRectVerticalCenterY(parentRect);
        console.info('[' + data.caseTag + '] parentRectY : '
          + parentRectY);

        expect(rectY).assertEqual(parentRectY);
      } else if (data.testValue.describe == 'SetEnd') {
        //When alignSelf : ItemAlign.End
        expect(rect.bottom).assertEqual(parentRect.bottom);
        expect(rect.left).assertEqual(parentRect.left);
      } else if (data.testValue.describe == 'SetStretch') {
        //When alignSelf : ItemAlign.Stretch
        expect(rect.bottom - rect.top).assertEqual(uiContext.vp2px(parentHeight));
      }
    })
  })
}