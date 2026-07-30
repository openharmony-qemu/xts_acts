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
struct ContextMenuByResponseType {
  @State lastAction: string = 'none';

  private menuItems(): MenuElement[] {
    return [
      {
        value: 'RespCopy',
        action: () => {
          this.lastAction = 'RespCopy';
        }
      },
      {
        value: 'RespPaste',
        action: () => {
          this.lastAction = 'RespPaste';
        }
      },
      {
        value: 'RespShare',
        action: () => {
          this.lastAction = 'RespShare';
        }
      }
    ];
  }

  @Builder
  customMenu() {
    Menu() {
      MenuItem({ content: 'CustomRespA' })
        .id('menu_resp_custom_a')
      MenuItem({ content: 'CustomRespB' })
        .id('menu_resp_custom_b')
    }
  }

  build() {
    Column({ space: 16 }) {
      Text('bindContextMenuByResponseType').fontSize(18).fontWeight(FontWeight.Bold)
      Text('last=' + this.lastAction).id('resp_last_action').fontSize(14)
      Button('LongPress MenuElement')
        .id('btn_resp_type_longpress')
        .width('80%')
        .bindContextMenuByResponseType(this.menuItems(), ResponseType.LongPress)
      Button('LongPress CustomBuilder')
        .id('btn_resp_type_custom')
        .width('80%')
        .bindContextMenuByResponseType(this.customMenu, ResponseType.LongPress)
      Button('LongPress with options')
        .id('btn_resp_type_options')
        .width('80%')
        .bindContextMenuByResponseType(this.menuItems(), ResponseType.LongPress, {
          placement: Placement.Bottom,
        })
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .justifyContent(FlexAlign.Center)
  }
}
