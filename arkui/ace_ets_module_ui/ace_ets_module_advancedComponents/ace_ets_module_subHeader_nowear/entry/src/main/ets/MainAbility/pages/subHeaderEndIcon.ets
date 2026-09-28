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

import { SubHeader, OperationType, Prompt } from '@kit.ArkUI';

@Entry
@Component
struct SubHeaderEndIcon {
  @Builder
  customTitle() {
    Row() {
      Text('自定义标题').fontSize(16)
    }
  }

  build() {
    Column() {
      // 测试1: icon + secondaryTitle + endIcon(图片) — 场景1
      SubHeader({
        icon: $r('app.media.startIcon'),
        secondaryTitle: '二级标题',
        endIcon: $r('app.media.startIcon')
      })
        .id('subheader_endicon_image')

      // 测试2: icon + secondaryTitle + endIcon(Symbol) + endIconSymbolOptions — 场景4
      SubHeader({
        icon: $r('app.media.startIcon'),
        secondaryTitle: '二级标题',
        endIcon: $r('sys.symbol.ohos_lungs'),
        endIconSymbolOptions: {
          renderingStrategy: SymbolRenderingStrategy.MULTIPLE_COLOR,
          fontColor: [Color.Blue, Color.Grey, Color.Green]
        }
      })
        .id('subheader_endicon_symbol')

      // 测试3: primaryTitle + endIcon(图片) — 场景2
      SubHeader({
        primaryTitle: '我的文件',
        endIcon: $r('app.media.startIcon')
      })
        .id('subheader_endicon_primary')

      // 测试4: primaryTitle + secondaryTitle + endIcon(图片) — 场景3
      SubHeader({
        primaryTitle: '存储空间',
        secondaryTitle: '已使用 45.2 GB / 128 GB',
        endIcon: $r('app.media.startIcon')
      })
        .id('subheader_endicon_primary_secondary')

      // 测试5: endIcon + operationItem 共存 — 场景7
      SubHeader({
        primaryTitle: '设置',
        endIcon: $r('app.media.startIcon'),
        operationType: OperationType.BUTTON,
        operationItem: [{
          value: '操作',
          action: () => {
            Prompt.showToast({ message: 'demo' });
          }
        }]
      })
        .id('subheader_endicon_operation')

      // 测试6: 不设 endIcon — 场景8
      SubHeader({
        primaryTitle: '标题',
        secondaryTitle: '副标题'
      })
        .id('subheader_endicon_none')

      // 测试7: titleBuilder 模式下 endIcon 不生效 — 场景9
      SubHeader({
        titleBuilder: this.customTitle,
        endIcon: $r('app.media.startIcon')
      })
        .id('subheader_endicon_titlebuilder')
    }
  }
}
