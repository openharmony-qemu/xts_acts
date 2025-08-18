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
 

import { PageHome } from './PageHome';
import { State, Provide, Consume, AppStorage,  } from '@ohos.arkui.stateManagement'
import { Entry, Component, Column, Button, ColumnOptions, ClickEvent, Text, Color, Builder, Scroll, Margin, Row, $r,} from '@ohos.arkui.component'
@Entry
@Component
struct MultiEntry {

  @Builder
  PageMap(name: string) {
    if (name === 'PageHome') {
      PageHome()
    } if (name === 'PageDetail') {
    }
  }

  aboutToAppear(): void {
  }

  onNavigationModeChangeCallback() {

  }

  onHomeShowOnTopCallback() {
    AppStorage.setOrCreate('onNavigationModeChangeCallbackValue', 1);
  }

  build() {
    Column() {
      Row() {
      }
      .width('100%')
    }
  }
}