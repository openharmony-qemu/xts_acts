'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { Entry, Component, Column, Search } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import {
  AttributeModifier,
  SearchAttribute
} from '@kit.ArkUI';

class SearchEnableSelectedDataDetectorModifier implements AttributeModifier<SearchAttribute> {
  public enableValue: boolean | undefined;

  constructor(value: boolean | undefined) {
    this.enableValue = value;
  }

  applyNormalAttribute(instance: SearchAttribute): void {
    instance.enableSelectedDataDetector(this.enableValue);
  }
}

@Entry
@Component
struct SearchEnableSelectedDataDetector {
  modifierTrue: SearchEnableSelectedDataDetectorModifier =
    new SearchEnableSelectedDataDetectorModifier(true);
  modifierFalse: SearchEnableSelectedDataDetectorModifier =
    new SearchEnableSelectedDataDetectorModifier(false);

  build() {
    Column() {
      Search({ value: 'Search enableSelectedDataDetector true' })
        .id('search_enableSelectedDataDetector_true')
        .height('5%')
        .width('100%')
        .enableSelectedDataDetector(true)

      Search({ value: 'Search enableSelectedDataDetector false' })
        .id('search_enableSelectedDataDetector_false')
        .height('5%')
        .width('100%')
        .enableSelectedDataDetector(false)

      Search({ value: 'Search enableSelectedDataDetector undefined' })
        .id('search_enableSelectedDataDetector_undefined')
        .height('5%')
        .width('100%')
        .enableSelectedDataDetector(undefined)

      Search({ value: 'Search enableSelectedDataDetector default' })
        .id('search_enableSelectedDataDetector_default')
        .height('5%')
        .width('100%')

      Search({ value: 'Search enableSelectedDataDetector modifier true' })
        .id('search_enableSelectedDataDetector_modifier_true')
        .height('5%')
        .width('100%')
        .attributeModifier(this.modifierTrue)

      Search({ value: 'Search enableSelectedDataDetector modifier false' })
        .id('search_enableSelectedDataDetector_modifier_false')
        .height('5%')
        .width('100%')
        .attributeModifier(this.modifierFalse)
    }
    .width('100%')
    .height('100%')
    .padding(5)
    .backgroundColor('#F5F5F5')
  }
}
