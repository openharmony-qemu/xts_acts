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
struct MenuItemSubMenuBuilder {
  @State isShow: boolean = false;
  @State lastAction: string = 'none';

  @Builder
  SubMenu() {
    Menu() {
      MenuItem({ content: 'SubCopy', labelInfo: 'Ctrl+C' })
        .id('submenu_copy')
        .onClick(() => {
          this.lastAction = 'SubCopy';
          this.isShow = false;
        })
      MenuItem({ content: 'SubPaste', labelInfo: 'Ctrl+V' })
        .id('submenu_paste')
        .onClick(() => {
          this.lastAction = 'SubPaste';
          this.isShow = false;
        })
    }
  }

  @Builder
  SubMenuAlt() {
    Menu() {
      MenuItem({ content: 'SubShare' })
        .id('submenu_share')
        .onClick(() => {
          this.lastAction = 'SubShare';
          this.isShow = false;
        })
    }
  }

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ content: 'PlainItem' })
        .id('menuitem_plain')
      MenuItem({ content: 'WithSubMenu' })
        .id('menuitem_with_submenu')
        .subMenuBuilder(this.SubMenu)
      MenuItem({ content: 'WithAltSubMenu' })
        .id('menuitem_with_alt_submenu')
        .subMenuBuilder(this.SubMenuAlt)
    }
  }

  build() {
    Column({ space: 16 }) {
      Text('MenuItem.subMenuBuilder').fontSize(18).fontWeight(FontWeight.Bold)
      Text('last=' + this.lastAction).id('submenu_last_action')
      Button('open menu with submenu')
        .id('btn_submenu_open')
        .width('80%')
        .onClick(() => {
          this.isShow = true;
        })
        .bindMenu(this.isShow, this.MyMenu, {
          onWillDisappear: () => {
            this.isShow = false;
          }
        })
      Button('close menu')
        .id('btn_submenu_close')
        .onClick(() => {
          this.isShow = false;
        })
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .justifyContent(FlexAlign.Center)
  }
}
