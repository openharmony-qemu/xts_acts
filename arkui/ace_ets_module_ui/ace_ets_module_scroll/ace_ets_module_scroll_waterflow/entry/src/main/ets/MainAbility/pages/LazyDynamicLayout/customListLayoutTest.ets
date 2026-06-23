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
import { LazyDynamicLayout, LazyDynamicLayoutAttribute } from '@kit.ArkUI';
import { MyDataSource } from '../data/MyDataSource';
import { LazyListLayout } from '../data/LazyListLayout';

// 自定义懒加载列表布局组件
@Component
struct MyLazyListLayout {
  // 间隔大小，使用@Watch监听变化，变化时触发onSpaceChange方法
  @Prop @Watch('onSpaceChange') space: number;
  arr: MyDataSource<string> = new MyDataSource<string>();
  private itemHeight: number = 30;
  // 懒加载布局算法实例，将高度转换为像素单位
  private lazyAlgorithm: LazyListLayout = new LazyListLayout(this.getUIContext().vp2px(this.itemHeight));

  // 间隔变化时更新布局算法中的间隔值
  onSpaceChange(): void {
    this.lazyAlgorithm.setSpace(this.getUIContext().vp2px(this.space));
  }

  aboutToAppear(): void {
    this.lazyAlgorithm.setSpace(this.getUIContext().vp2px(this.space));
  }

  build() {
    // 使用LazyDynamicLayout组件，传入懒加载布局算法
    LazyDynamicLayout(this.lazyAlgorithm) {
      LazyForEach(this.arr, (item: string) => {
        Text('lazy_'+item)
          .id('lazyDynamicLayout_' + item)
          .height(this.itemHeight)
          .width('100%')
          .borderRadius(8)
          .backgroundColor('#E0E0FF')
          .padding(10)
      })
    }
    // 监听可视区域内子组件索引变化
    .onVisibleIndexesChange((child: number[]) => {
      console.info(`onVisibleIndexesChange:start:${child}`);
    })
  }
}

// 定义分组数据接口
interface groupData {
  title: string;
  data: MyDataSource<string>;
}


@Entry
@Component
struct CustomListLayoutTest {
  @State groupArr: groupData[] = []; // 分组数据数组
  @State space: number = 5; // 列表项间隔大小

  aboutToAppear(): void {
    for (let i = 0; i < 2; i++) {
      let data = new MyDataSource<string>();
      for (let j = 0; j <= 6; j++) {
        data.pushData('item' + j.toString());
      }
      this.groupArr.push({ title: 'group' + i.toString(), data: data });
    }
  }

  build() {
    Column() {
      Button('Space:' + this.space.toString())
        .id('lazyDynamicLayout_space_btn')
        .onClick(() => {
          // 在5和10之间切换间隔大小，切换前后保持显示区域第一个子组件位置不变
          this.space = this.space === 5 ? 10 : 5;
        })
      List() {
        ForEach(this.groupArr, (item: groupData) => {
          ListItem() {
            Text(item.title).margin({ top: 20, bottom: 8 })
          }

          // 使用自定义懒加载布局组件
          MyLazyListLayout({ arr: item.data, space: this.space })
        })
      }
      .layoutWeight(1)
      .padding({ left: 12, right: 12 })
      .height('100%')
      .width('100%')
    }
    .height('60%')
    .width('100%')

  }
}