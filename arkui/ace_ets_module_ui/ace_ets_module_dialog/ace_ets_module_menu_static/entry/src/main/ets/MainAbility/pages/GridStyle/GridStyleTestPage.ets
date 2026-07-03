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

import {
  Entry, Component, Column, ColumnOptions, Row, RowOptions, Text, Button, Menu, MenuItem,
  ResponseType, $r, FontWeight, ContextMenuOptions, ClickEvent, MenuItemOptions,
  Builder, MenuGridPosition,
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

const startIcon = $r('app.media.startIcon');

@Builder
function buildGridMenu4(): void {
  Menu() {
    MenuItem({ startIcon: startIcon, content: '复制' } as MenuItemOptions)
    MenuItem({ startIcon: startIcon, content: '粘贴' } as MenuItemOptions)
    MenuItem({ startIcon: startIcon, content: '剪切' } as MenuItemOptions)
    MenuItem({ startIcon: startIcon, content: '删除' } as MenuItemOptions)
  }.width(150)
}

@Builder
function buildGridMenu8(): void {
  Menu() {
    MenuItem({ startIcon: startIcon, content: '复制' } as MenuItemOptions)
    MenuItem({ startIcon: startIcon, content: '粘贴' } as MenuItemOptions)
    MenuItem({ startIcon: startIcon, content: '剪切' } as MenuItemOptions)
    MenuItem({ startIcon: startIcon, content: '删除' } as MenuItemOptions)
    MenuItem({ startIcon: startIcon, content: '分享' } as MenuItemOptions)
    MenuItem({ startIcon: startIcon, content: '全选' } as MenuItemOptions)
    MenuItem({ startIcon: startIcon, content: '收藏' } as MenuItemOptions)
    MenuItem({ startIcon: startIcon, content: '搜索' } as MenuItemOptions)
  }.width(150)
}

@Entry
@Component
struct GridStyleTestPageIndex {
  @State resultText: string = 'Ready';

  aboutToAppear(): void {
    try {
      AppStorage.setOrCreate<Router>('router', this.getUIContext().getRouter());
    } catch (error) {
      console.error('GridStyleTestPage router init error: ' + error);
    }
  }

  build(): void {
    Column({ space: 10 } as ColumnOptions) {
      Text('gridStyle Test').fontSize(20).fontWeight(FontWeight.Bold).id('title_text')
      Text(this.resultText).fontSize(16).id('result_text')
      this.EnumRow()
      this.GridStyleButtons()
    }.width('100%').height('100%').padding(12)
  }

  @Builder
  EnumRow(): void {
    Row({ space: 10 } as RowOptions) {
      Button('MenuGridPosition.TOP=0').id('btn_enum_top')
        .onClick((event?: ClickEvent): void => {
          this.resultText = 'MenuGridPosition.TOP = ' + MenuGridPosition.TOP;
        })
      Button('MenuGridPosition.BOTTOM=1').id('btn_enum_bottom')
        .onClick((event?: ClickEvent): void => {
          this.resultText = 'MenuGridPosition.BOTTOM = ' + MenuGridPosition.BOTTOM;
        })
    }
  }

  @Builder
  GridStyleButtons(): void {
    Column({ space: 8 } as ColumnOptions) {
      this.GridStyleCountButtons()
      this.GridStylePositionButtons()
      this.GridStyleExtraButtons()
    }
  }

  @Builder
  GridStyleCountButtons(): void {
    Button('count=0').id('text_count_0')
      .bindContextMenu(buildGridMenu4, ResponseType.LongPress, { gridStyle: { count: 0 } } as ContextMenuOptions)
      .onClick((event?: ClickEvent): void => { this.resultText = 'count=0 (default 3)'; })
    Button('count=1').id('text_count_1')
      .bindContextMenu(buildGridMenu4, ResponseType.LongPress, { gridStyle: { count: 1 } } as ContextMenuOptions)
      .onClick((event?: ClickEvent): void => { this.resultText = 'count=1'; })
    Button('count=3').id('text_count_3')
      .bindContextMenu(buildGridMenu4, ResponseType.LongPress, { gridStyle: { count: 3 } } as ContextMenuOptions)
      .onClick((event?: ClickEvent): void => { this.resultText = 'count=3 (default)'; })
    Button('hSize=3').id('text_hsize_3')
      .bindContextMenu(buildGridMenu4, ResponseType.LongPress, {
        gridStyle: { horizontalSize: 3 },
      } as ContextMenuOptions)
      .onClick((event?: ClickEvent): void => { this.resultText = 'horizontalSize=3'; })
  }

  @Builder
  GridStylePositionButtons(): void {
    Button('position=TOP').id('text_pos_top')
      .bindContextMenu(buildGridMenu8, ResponseType.LongPress, {
        gridStyle: { count: 4, position: MenuGridPosition.TOP },
      } as ContextMenuOptions)
      .onClick((event?: ClickEvent): void => { this.resultText = 'position=TOP (grid above)'; })
    Button('position=BOTTOM').id('text_pos_bottom')
      .bindContextMenu(buildGridMenu8, ResponseType.LongPress, {
        gridStyle: { count: 4, position: MenuGridPosition.BOTTOM },
      } as ContextMenuOptions)
      .onClick((event?: ClickEvent): void => { this.resultText = 'position=BOTTOM (grid below)'; })
    Button('all params').id('text_all_params')
      .bindContextMenu(buildGridMenu8, ResponseType.LongPress, {
        gridStyle: { count: 4, horizontalSize: 3, position: MenuGridPosition.BOTTOM },
      } as ContextMenuOptions)
      .onClick((event?: ClickEvent): void => { this.resultText = 'count=4 hSize=3 pos=BOTTOM'; })
  }

  @Builder
  GridStyleExtraButtons(): void {
    Button('no gridStyle').id('text_no_grid')
      .bindContextMenu(buildGridMenu8, ResponseType.LongPress, {} as ContextMenuOptions)
      .onClick((event?: ClickEvent): void => { this.resultText = 'No gridStyle (default menu)'; })
    Button('bindMenu gridStyle').id('text_bindmenu_grid')
      .bindMenu(buildGridMenu4, { gridStyle: { count: 4, horizontalSize: 2 } })
      .onClick((event?: ClickEvent): void => { this.resultText = 'bindMenu triggered with gridStyle'; })
  }
}
