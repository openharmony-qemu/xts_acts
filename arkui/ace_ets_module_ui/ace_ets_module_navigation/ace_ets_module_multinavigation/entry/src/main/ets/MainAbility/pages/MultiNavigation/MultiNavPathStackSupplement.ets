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

import { MultiNavigation, MultiNavPathStack, SplitPolicy } from '@ohos.arkui.advanced.MultiNavigation';

@Entry
@Component
struct MultiNavPathStackSupplementPage {
  @Provide('multiStack') multiStack: MultiNavPathStack = new MultiNavPathStack();

  @Builder
  PageMap(name: string, param?: object) {
    if (name === 'PageA') {
      PageA()
    } else if (name === 'PageB') {
      PageB()
    }
  }

  aboutToAppear(): void {
    AppStorage.setOrCreate<MultiNavPathStack>('multiNavPathStack', this.multiStack);
  }

  build() {
    Column() {
      MultiNavigation({ navDestination: this.PageMap, multiStack: this.multiStack })
        .width('100%')
        .height('30%')

      Button('pushPath_HomePage')
        .id('btn_pushPath_HomePage')
        .onClick(() => {
          this.multiStack.pushPath({ name: 'PageA', param: 'paramA' }, false, SplitPolicy.HOME_PAGE);
        })
        .margin(5)

      Button('pushPath_DetailPage')
        .id('btn_pushPath_DetailPage')
        .onClick(() => {
          this.multiStack.pushPath({ name: 'PageB', param: 'paramB' }, false, SplitPolicy.DETAIL_PAGE);
        })
        .margin(5)

      Button('pushPath_FullPage')
        .id('btn_pushPath_FullPage')
        .onClick(() => {
          this.multiStack.pushPath({ name: 'PageA', param: 'paramA' }, false, SplitPolicy.FULL_PAGE);
        })
        .margin(5)

      Button('pushPathByName_HomePage')
        .id('btn_pushPathByName_HomePage')
        .onClick(() => {
          this.multiStack.pushPathByName('PageA', 'paramA', false, SplitPolicy.HOME_PAGE);
        })
        .margin(5)

      Button('pushPathByName_DetailPage')
        .id('btn_pushPathByName_DetailPage')
        .onClick(() => {
          this.multiStack.pushPathByName('PageB', 'paramB', false, SplitPolicy.DETAIL_PAGE);
        })
        .margin(5)

      Button('switchFullScreen')
        .id('btn_switchFullScreen')
        .onClick(() => {
          const result = this.multiStack.switchFullScreenState(true);
          AppStorage.setOrCreate('switchFullScreenResult', result);
        })
        .margin(5)

      Button('switchFullScreen_false')
        .id('btn_switchFullScreen_false')
        .onClick(() => {
          const result = this.multiStack.switchFullScreenState(false);
          AppStorage.setOrCreate('switchFullScreenResult', result);
        })
        .margin(5)

      Button('setHomeWidthRange')
        .id('btn_setHomeWidthRange')
        .onClick(() => {
          this.multiStack.setHomeWidthRange(30, 70);
        })
        .margin(5)

      Button('keepBottomPage_true')
        .id('btn_keepBottomPage_true')
        .onClick(() => {
          this.multiStack.keepBottomPage(true);
        })
        .margin(5)

      Button('keepBottomPage_false')
        .id('btn_keepBottomPage_false')
        .onClick(() => {
          this.multiStack.keepBottomPage(false);
        })
        .margin(5)

      Button('setPlaceholderPage')
        .id('btn_setPlaceholderPage')
        .onClick(() => {
          this.multiStack.setPlaceholderPage({ name: 'PageA', param: 'placeholder' });
        })
        .margin(5)

      Button('clear')
        .id('btn_clear')
        .onClick(() => {
          this.multiStack.clear(false);
        })
        .margin(5)
    }
    .width('100%')
    .height('100%')
  }
}

@Component
struct PageA {
  @Consume('multiStack') multiStack: MultiNavPathStack;

  build() {
    NavDestination() {
      Column() {
        Text('PageA')
          .fontSize(20)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .title('PageA')
  }
}

@Component
struct PageB {
  @Consume('multiStack') multiStack: MultiNavPathStack;

  build() {
    NavDestination() {
      Column() {
        Text('PageB')
          .fontSize(20)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .title('PageB')
  }
}
