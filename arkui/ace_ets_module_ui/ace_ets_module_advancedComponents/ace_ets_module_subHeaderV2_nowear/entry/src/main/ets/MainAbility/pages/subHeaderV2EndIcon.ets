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
  SubHeaderV2,
  SubHeaderV2Title,
  SubHeaderV2OperationType,
  SubHeaderV2OperationItem,
  Prompt
} from '@kit.ArkUI';
import { SubHeaderV2TitleOptions, SubHeaderV2OperationItemOptions } from '@ohos.arkui.advanced.SubHeaderV2';
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';

@Entry
@ComponentV2
struct SubHeaderV2EndIconExample {
  @Local title: SubHeaderV2Title = new SubHeaderV2Title({ secondaryTitle: '二级标题' });
  @Local titlePrimary: SubHeaderV2Title = new SubHeaderV2Title({ primaryTitle: '我的音乐', secondaryTitle: '128 首' });
  @Local endIcon: ResourceStr = $r('app.media.startIcon');
  @Local endIconSymbol: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_lungs'));
  @Local v2OperationItems: SubHeaderV2OperationItem[] = [];

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
    this.v2OperationItems = [
      new SubHeaderV2OperationItem({
        content: '更多',
        action: () => {
          Prompt.showToast({ message: 'demo' });
        }
      } as SubHeaderV2OperationItemOptions),
    ];
  }

  build() {
    Column() {
      // 测试1: endIcon 设置为普通图片资源（Image）
      SubHeaderV2({
        icon: $r('app.media.startIcon'),
        endIcon: this.endIcon,
        title: this.title
      })
        .id('subheaderv2_endicon_image')

      // 测试2: endIcon 设置为 Symbol 图标
      SubHeaderV2({
        icon: $r('app.media.startIcon'),
        endIcon: this.endIconSymbol,
        title: this.title
      })
        .id('subheaderv2_endicon_symbol')

      // 测试3: endIcon 默认值（不设置 endIcon）
      SubHeaderV2({
        icon: $r('app.media.startIcon'),
        title: this.title
      })
        .id('subheaderv2_endicon_default')

      // 测试4: primaryTitle + secondaryTitle + endIcon(图片) — 场景5
      SubHeaderV2({
        endIcon: this.endIcon,
        title: this.titlePrimary
      })
        .id('subheaderv2_endicon_primary_secondary')

      // 测试5: endIcon + operationItems 共存
      SubHeaderV2({
        title: this.titlePrimary,
        endIcon: this.endIcon,
        operationType: SubHeaderV2OperationType.BUTTON,
        operationItems: this.v2OperationItems
      })
        .id('subheaderv2_endicon_operation')
    }
  }
}
