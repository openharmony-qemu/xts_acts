'use static';
/**
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

import { Entry, ComponentV2, $r, Column, Local, Scroll, FontWeight, Row } from '@kit.ArkUI';
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';
import {
  SubHeaderV2, SubHeaderV2Title, SubHeaderV2TitleOptions,
  SubHeaderV2OperationType, SubHeaderV2OperationItem, SubHeaderV2OperationItemOptions
} from '@ohos.arkui.advanced.SubHeaderV2';

/**
 * SubHeaderV2 EndIcon Test Page (Static)
 * 测试 SubHeaderV2 endIcon 属性（API 26.0.1）
 * 场景5: V2 primary+secondary + endIcon(图片)
 * 场景6: V2 primaryTitle + endIcon(SymbolGlyphModifier)
 * 场景7: V2 endIcon + operationItems 共存
 * V2列表型: icon + secondaryTitle + endIcon(图片)
 * 场景14: V2 RTL — endIcon 自动镜像
 */
@Entry
@ComponentV2
struct SubHeaderExample {
  @Local v2OperationItems: SubHeaderV2OperationItem[] = [
    new SubHeaderV2OperationItem({ content: '更多', action: () => {} } as SubHeaderV2OperationItemOptions),
  ];

  build() {
    Scroll() {
      Column() {
        // 场景5: V2 primary+secondary + endIcon(图片)
        SubHeaderV2({
          title: new SubHeaderV2Title({
            primaryTitle: '我的音乐',
            secondaryTitle: '128 首',
          } as SubHeaderV2TitleOptions),
          endIcon: $r('sys.media.ohos_ic_public_email'),
        })
          .id('subheaderv2_endicon_image')

        SubHeaderV2({
          title: new SubHeaderV2Title({
            primaryTitle: '我的音乐',
            secondaryTitle: '128 首',
          } as SubHeaderV2TitleOptions)
        })
          .id('subheaderv2_no_endicon_image')

        // 场景6: V2 primaryTitle + endIcon(SymbolGlyphModifier)
        SubHeaderV2({
          title: new SubHeaderV2Title({ primaryTitle: '已完成' } as SubHeaderV2TitleOptions),
          endIcon: new SymbolGlyphModifier($r('sys.symbol.checkmark_circle_fill'))
            .fontSize(16)
            .fontColor(['#007DFF'])
            .fontWeight(FontWeight.Medium),
        })
          .id('subheaderv2_endicon_symbol')

        SubHeaderV2({
          title: new SubHeaderV2Title({ primaryTitle: '已完成' } as SubHeaderV2TitleOptions),
        })
          .id('subheaderv2_no_endicon_symbol')

        // 场景7: V2 endIcon + operationItems(BUTTON) 共存
        SubHeaderV2({
          title: new SubHeaderV2Title({ primaryTitle: '设置' } as SubHeaderV2TitleOptions),
          endIcon: $r('sys.media.ohos_ic_public_email'),
          operationType: SubHeaderV2OperationType.BUTTON,
          operationItems: this.v2OperationItems,
        })
          .id('subheaderv2_endicon_operation')

        SubHeaderV2({
          title: new SubHeaderV2Title({ primaryTitle: '设置' } as SubHeaderV2TitleOptions),
          operationType: SubHeaderV2OperationType.BUTTON,
          operationItems: this.v2OperationItems,
        })
          .id('subheaderv2_no_endicon_operation')

        // V2 列表型: icon + secondaryTitle + endIcon(图片)
        SubHeaderV2({
          icon: $r('sys.media.ohos_ic_public_email'),
          title: new SubHeaderV2Title({ secondaryTitle: 'V2列表型标题' } as SubHeaderV2TitleOptions),
          endIcon: $r('sys.media.ohos_ic_public_email'),
        })
          .id('subheaderv2_endicon_list')

        SubHeaderV2({
          icon: $r('sys.media.ohos_ic_public_email'),
          title: new SubHeaderV2Title({ secondaryTitle: 'V2列表型标题' } as SubHeaderV2TitleOptions)
        })
          .id('subheaderv2_no_endicon_list')

        // 场景14: V2 RTL — endIcon 自动镜像
        Row() {
          Column() {
            SubHeaderV2({
              title: new SubHeaderV2Title({
                primaryTitle: $r('sys.string.image_generation_canvas_guide_complete'),
                secondaryTitle: $r('sys.string.image_generation_canvas_guide_complete'),
              } as SubHeaderV2TitleOptions),
              endIcon: $r('sys.media.ohos_ic_public_email'),
            })
              .id('subheaderv2_endicon_rtl')

            SubHeaderV2({
              title: new SubHeaderV2Title({
                primaryTitle: $r('sys.string.image_generation_canvas_guide_complete'),
                secondaryTitle: $r('sys.string.image_generation_canvas_guide_complete'),
              } as SubHeaderV2TitleOptions),
            })
              .id('subheaderv2_no_endicon_rtl')
          }
          .width('100%')
        }
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
  }
}
