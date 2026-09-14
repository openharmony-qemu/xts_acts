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
import {
  Entry,
  Component,
  Column,
  Scroll,
  TextInput,
  AttributeModifier,
  TextInputAttribute
} from '@ohos.arkui.component';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

class TextInputEnableSelectedDataDetectorModifier implements AttributeModifier<TextInputAttribute> {
  public enableSelectedDataDetectorValue: boolean | undefined;

  constructor(value: boolean | undefined) {
    this.enableSelectedDataDetectorValue = value;
  }

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.enableSelectedDataDetector(this.enableSelectedDataDetectorValue);
  }
}

@Entry
@Component
struct TextInputEnableSelectedDataDetector {
  modifierTrue: TextInputEnableSelectedDataDetectorModifier =
    new TextInputEnableSelectedDataDetectorModifier(true);
  modifierUndefined: TextInputEnableSelectedDataDetectorModifier =
    new TextInputEnableSelectedDataDetectorModifier(undefined);

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('TextInputEnableSelectedDataDetector error ' + error);
    }
  }

  build() {
    Scroll() {
      Column() {
        TextInput({ text: 'default' })
          .key('textinput_enableSelectedDataDetector_default')
          .height('5%')
          .width('100%')

        TextInput({ text: 'true' })
          .key('textinput_enableSelectedDataDetector_true')
          .height('5%')
          .width('100%')
          .enableSelectedDataDetector(true)

        TextInput({ text: 'false' })
          .key('textinput_enableSelectedDataDetector_false')
          .height('5%')
          .width('100%')
          .enableSelectedDataDetector(false)

        TextInput({ text: 'undefined' })
          .key('textinput_enableSelectedDataDetector_undefined')
          .height('5%')
          .width('100%')
          .enableSelectedDataDetector(undefined)

        TextInput({ text: 'modifier true' })
          .key('textinput_enableSelectedDataDetector_modifier_true')
          .height('5%')
          .width('100%')
          .attributeModifier(this.modifierTrue)

        TextInput({ text: 'modifier undefined' })
          .key('textinput_enableSelectedDataDetector_modifier_undefined')
          .height('5%')
          .width('100%')
          .attributeModifier(this.modifierUndefined)
      }
      .width('100%')
      .padding({ top: '2%', bottom: '2%', left: '2%', right: '2%' })
    }
    .width('100%')
    .height('100%')
  }
}
