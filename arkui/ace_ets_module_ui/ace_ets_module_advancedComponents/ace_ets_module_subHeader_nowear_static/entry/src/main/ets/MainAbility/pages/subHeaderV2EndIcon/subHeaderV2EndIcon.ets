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
import { Entry, Component, Column, SymbolGlyphModifier, SymbolRenderingStrategy, Color } from '@ohos.arkui.component';
import {
  SubHeaderV2,
  SubHeaderV2Title,
  SubHeaderV2OperationType,
  SubHeaderV2OperationItem
} from '@ohos.arkui.advanced.SubHeaderV2';

/**
 * SubHeaderV2 EndIcon Test Page
 * 测试 SubHeaderV2 组件的 endIcon 属性（分类 2.1 基础属性）
 * endIcon 类型为 SubHeaderV2IconType (ResourceStr | SymbolGlyphModifier)
 * 起始版本：26.0.1
 */
@Entry
@Component
struct SubHeaderV2EndIcon {
  private title: SubHeaderV2Title = new SubHeaderV2Title({ secondaryTitle: '二级标题' });
  private titlePrimary: SubHeaderV2Title = new SubHeaderV2Title({ primaryTitle: '我的音乐', secondaryTitle: '128 首' });
  private endIconSymbol: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_lungs'));
  private v2OperationItems: SubHeaderV2OperationItem[] = [
    new SubHeaderV2OperationItem({ content: '更多', action: () => {} }),
  ];

  aboutToAppear(): void {
    this.title = new SubHeaderV2Title({
      secondaryTitle: '二级标题'
    });
    this.titlePrimary = new SubHeaderV2Title({
      primaryTitle: '我的音乐',
      secondaryTitle: '128 首'
    });
    this.endIconSymbol = new SymbolGlyphModifier($r('sys.symbol.ohos_lungs'))
      .renderingStrategy(SymbolRenderingStrategy.MULTIPLE_COLOR)
      .fontColor([Color.Blue, Color.Grey, Color.Green]);
  }

  build() {
    Column({ space: 20 }) {
      // 测试1: endIcon 设置为普通图片资源（Image）
      SubHeaderV2({
        icon: $r('sys.media.ohos_ic_public_email'),
        endIcon: $r('app.media.startIcon'),
        title: this.title
      })
        .id('subheaderv2_endicon_image')

      // 测试2: endIcon 设置为 Symbol 图标（SymbolGlyphModifier）
      SubHeaderV2({
        icon: $r('sys.media.ohos_ic_public_email'),
        endIcon: this.endIconSymbol,
        title: this.title
      })
        .id('subheaderv2_endicon_symbol')

      // 测试3: endIcon 不设置（默认 undefined）
      SubHeaderV2({
        icon: $r('sys.media.ohos_ic_public_email'),
        title: this.title
      })
        .id('subheaderv2_endicon_default')

      // 测试4: primaryTitle + secondaryTitle + endIcon(图片) — 场景5
      SubHeaderV2({
        endIcon: $r('app.media.startIcon'),
        title: this.titlePrimary
      })
        .id('subheaderv2_endicon_primary_secondary')

      // 测试5: endIcon + operationItems 共存
      SubHeaderV2({
        title: this.titlePrimary,
        endIcon: $r('app.media.startIcon'),
        operationType: SubHeaderV2OperationType.BUTTON,
        operationItems: this.v2OperationItems
      })
        .id('subheaderv2_endicon_operation')
    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
    .backgroundColor('#F5F5F5')
  }
}
