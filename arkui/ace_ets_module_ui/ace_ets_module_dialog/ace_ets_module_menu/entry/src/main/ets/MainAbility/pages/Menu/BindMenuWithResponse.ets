/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

@Entry
@Component
struct BindMenuWithResponse {
  @State longPress: string = 'LONG_PRESS';
  @State rightClick: string = 'RIGHT_CLICK';
  @State arrayHit: string = 'init';

  private menuElements: MenuElement[] = [
    { value: 'ArrayItem1', action: () => { this.arrayHit = 'item1'; } },
    { value: 'ArrayItem2', action: () => { this.arrayHit = 'item2'; } },
  ];

  @Builder
  MenuBuilderWithParam(type: ResponseType) {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      Text('Current ResponseType = ' + (type === 0 ? 'RIGHT_CLICK' : 'LONG_PRESS'))
      Divider().height(10)
      if (type === ResponseType.LongPress) {
        Text('Item' + this.longPress)
          .fontSize(20)
          .width(200)
          .height(20)
          .textAlign(TextAlign.Center)
          .id('longTextId')
      }
      if (type === ResponseType.RightClick) {
        Text('Item' + this.rightClick)
          .fontSize(20)
          .width(200)
          .height(20)
          .textAlign(TextAlign.Center)
          .id('rightTextId')
      }
    }
  }

  build() {
    Column({ space: 12 }) {
      Button('BindContextMenu长按和右键点击触发菜单')
        .bindContextMenuWithResponse(this.MenuBuilderWithParam, {
          enableArrow: true,
        })
        .id('bindClickId')

      // API26 overload: MenuElement[]
      Button('bindContextMenuWithResponse Array')
        .id('bindArrayId')
        .bindContextMenuWithResponse(this.menuElements, {
          enableArrow: false,
        })

      // 异常入参：content null/undefined；options null/undefined
      Button('array_content_null')
        .id('bindArrayContentNullId')
        .bindContextMenuWithResponse(null)
      Button('array_content_undefined')
        .id('bindArrayContentUndefId')
        .bindContextMenuWithResponse(undefined)
      Button('array_options_null')
        .id('bindArrayOptionsNullId')
        .bindContextMenuWithResponse(this.menuElements, null)
      Button('array_options_undefined')
        .id('bindArrayOptionsUndefId')
        .bindContextMenuWithResponse(this.menuElements, undefined)

      Text(this.arrayHit).id('arrayHitText')
      Button('hide').id('hideId')
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#f0f0f0')
  }
}
