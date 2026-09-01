'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {
  Entry,
  Component,
  $r,
  Column,
  Scroll,
  List,
  ListItem,
  Text,
  FontWeight,
  Color,
  ColumnOptions } from '@ohos.arkui.component';
import {
  GridObjectSortComponent, GridObjectSortComponentItem,
  GridObjectSortComponentOptions, GridObjectSortComponentType
} from '@ohos.arkui.advanced.GridObjectSortComponent';
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';
import { AppStorage, State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct gridObjectSortComponentTest {

  // 组件数据初始化。
  @State dataList: GridObjectSortComponentItem[] = [
    {
      id: 0,
      // 系统保存图片资源
      url: $r('sys.media.ohos_save_button_filled'),
      text: '下载',
      selected: true,
      order: 3
    } as GridObjectSortComponentItem,
    {
      id: 1,
      // 系统网络图片资源
      url: $r('sys.media.ohos_ic_public_web'),
      text: '网络',
      selected: true,
      order: 9
    } as GridObjectSortComponentItem,
    {
      id: 2,
      // 系统录像图片资源
      url: $r('sys.media.ohos_ic_public_video'),
      text: '视频',
      selected: false,
      order: 1
    } as GridObjectSortComponentItem,
    {
      id: 3,
      // 系统录制符号资源
      symbolStyle: new SymbolGlyphModifier($r('sys.symbol.record_circle')),
      text: '录制',
      selected: false,
      order: 4
    } as GridObjectSortComponentItem
  ]

  // 组件配置信息初始化。
  @State option: GridObjectSortComponentOptions = {
    type: GridObjectSortComponentType.IMAGE_TEXT,
    imageSize: 45,
    normalTitle: '菜单',
    editTitle: '编辑',
    showAreaTitle: '长按拖动排序',
    addAreaTitle: '点击添加'
  } as GridObjectSortComponentOptions;

  build() {
    Column() {
      GridObjectSortComponent({
        options: this.option,
        dataList: this.dataList,
        // 保存编辑排序的回调函数，返回编辑后的数据。
        onSave: (
          select: Array<GridObjectSortComponentItem>,
          unselect: Array<GridObjectSortComponentItem>
        ) => {
          console.log('GridObjectSortComponent select: ' + select + ', unselect: ' + unselect)
        },
        // 取消保存数据的回调。
        onCancel: () =>{
          console.log('GridObjectSortComponent onCancel')
        }
      })
    }
  }
}