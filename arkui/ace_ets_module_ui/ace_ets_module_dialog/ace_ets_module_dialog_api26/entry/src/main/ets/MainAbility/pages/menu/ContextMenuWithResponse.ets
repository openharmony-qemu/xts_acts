/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct ContextMenuWithResponse {
  @State lastAction: string = 'none';
  @State lastResponse: string = 'none';

  private menuItems(): Array<MenuElement> {
    return [
      {
        value: 'WithCopy',
        action: () => {
          this.lastAction = 'WithCopy';
        }
      },
      {
        value: 'WithDelete',
        action: () => {
          this.lastAction = 'WithDelete';
        }
      }
    ];
  }

  @Builder
  responseAwareMenu(response: ResponseType) {
    Menu() {
      MenuItem({ content: response === ResponseType.LongPress ? 'LongPressItem' : 'OtherItem' })
        .id('menu_with_resp_item')
      MenuItem({ content: 'WithExtra' })
        .id('menu_with_resp_extra')
    }
  }

  build() {
    Column({ space: 16 }) {
      Text('bindContextMenuWithResponse').fontSize(18).fontWeight(FontWeight.Bold)
      Text('last=' + this.lastAction).id('with_resp_last_action')
      Button('WithResponse MenuElement')
        .id('btn_with_resp_elements')
        .width('80%')
        .bindContextMenuWithResponse(this.menuItems())
      Button('WithResponse CustomBuilderT')
        .id('btn_with_resp_builder')
        .width('80%')
        .bindContextMenuWithResponse(this.responseAwareMenu)
      Button('WithResponse options')
        .id('btn_with_resp_options')
        .width('80%')
        .bindContextMenuWithResponse(this.menuItems(), {
          placement: Placement.Top,
        })
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .justifyContent(FlexAlign.Center)
  }
}
