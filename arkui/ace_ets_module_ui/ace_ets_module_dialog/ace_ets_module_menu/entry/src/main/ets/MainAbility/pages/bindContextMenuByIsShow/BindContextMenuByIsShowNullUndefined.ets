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
struct BindContextMenuByIsShowNullUndefinedIndex {
  private iconStr: ResourceStr = $r('app.media.icon');
  private nullMenuContent: Array<MenuElement> | null = null;
  private undefMenuContent: Array<MenuElement> | undefined = undefined;

  @State isShowContentNull: boolean = false;
  @State isShowContentUndef: boolean = false;
  @State isShowOptionsNull: boolean = false;
  @State isShowOptionsUndef: boolean = false;

  @State txtContentNull: string = '';
  @State txtContentUndef: string = '';

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: '菜单选项1' }).id('BindContextMenuByIsShowNullUndefined_menuItem_01')
      MenuItem({ startIcon: this.iconStr, content: '菜单选项2' })
    }
    .key('BindContextMenuByIsShowNullUndefined_menu')
  }

  @Builder
  buildOptionsRow() {
    Row({ space: 8 }) {
      Button('options:null')
        .id('BindContextMenuByIsShowNullUndefined_btnOptionsNull_01')
        .layoutWeight(1)
        .onClick(() => { this.isShowOptionsNull = true; })
        .bindContextMenuByIsShow(this.isShowOptionsNull, this.MyMenu, null)
      Button('options:undef')
        .id('BindContextMenuByIsShowNullUndefined_btnOptionsUndefined_01')
        .layoutWeight(1)
        .onClick(() => { this.isShowOptionsUndef = true; })
        .bindContextMenuByIsShow(this.isShowOptionsUndef, this.MyMenu)
    }
    .width('100%')
    .height('10%')
  }

  @Builder
  buildContentNullRow() {
    Row({ space: 8 }) {
      Button('content:null')
        .id('BindContextMenuByIsShowNullUndefined_btnContentNull_01')
        .layoutWeight(1)
        .onClick(() => {
          try {
            this.isShowContentNull = true;
            this.txtContentNull = 'content:null:SUCCESS';
          } catch (err) {
            this.txtContentNull = 'content:null:FAILED';
          }
        })
        .bindContextMenuByIsShow(
          this.isShowContentNull,
          this.nullMenuContent as Array<MenuElement>,
          { onWillDisappear: () => { this.isShowContentNull = false; } }
        )
      Text(this.txtContentNull).id('BindContextMenuByIsShowNullUndefined_txtContentNull_01').fontSize(10)
    }
    .width('100%')
    .height('10%')
  }

  @Builder
  buildContentUndefRow() {
    Row({ space: 8 }) {
      Button('content:undef')
        .id('BindContextMenuByIsShowNullUndefined_btnContentUndefined_01')
        .layoutWeight(1)
        .onClick(() => {
          try {
            this.isShowContentUndef = true;
            this.txtContentUndef = 'content:undefined:SUCCESS';
          } catch (err) {
            this.txtContentUndef = 'content:undefined:FAILED';
          }
        })
        .bindContextMenuByIsShow(
          this.isShowContentUndef,
          this.undefMenuContent as Array<MenuElement>,
          { onWillDisappear: () => { this.isShowContentUndef = false; } }
        )
      Text(this.txtContentUndef).id('BindContextMenuByIsShowNullUndefined_txtContentUndefined_01').fontSize(10)
    }
    .width('100%')
    .height('10%')
  }

  build() {
    Column() {
      Text('bindContextMenuByIsShow null/undefined')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .height('8%')
      this.buildOptionsRow()
      this.buildContentNullRow()
      this.buildContentUndefRow()
    }
    .width('100%')
    .height('100%')
    .padding(12)
  }
}
