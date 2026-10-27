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

@ObservedV2
class AnimItemInfo {
  @Trace public info: string;
  @Trace public color: string;
  public key: string;
  constructor(info: string, color: string) {
    this.info = info;
    this.color = color;
    this.key = info;
  }
}

@Entry
@ComponentV2
struct RepeatAllowReuseInAnimationNullUndefined {
  @Local dataArray: Array<AnimItemInfo> = [];

  aboutToAppear(): void {
    for (let i = 0; i < 5; i++) {
      this.dataArray.push(new AnimItemInfo(`Item ${i}`, '#FFFFFF'));
    }
  }

  build() {
    Column({ space: 2 }) {
      // 场景1：allowReuseInAnimation = false
      // 预期：不允许动画中复用子组件，保证动画效果正确
      Text('allowReuseInAnimation:false')
        .fontSize(10)
        .fontColor(Color.Gray)
        .height('3%')
      Grid() {
        Repeat(this.dataArray, { allowReuseInAnimation: false })
          .each((repeatItem: RepeatItem<AnimItemInfo>) => {
            GridItem() {
              Text(repeatItem.item.info)
                .id(`falseItem_${repeatItem.index}`)
                .fontSize(10)
            }
          })
          .key((item: AnimItemInfo, index: number) => item.key)
          .virtualScroll()
      }
      .columnsTemplate('1fr')
      .id('animReuseFalseGrid')
      .height('20%')
      .border({ width: 1 })

      // 场景2：allowReuseInAnimation = null
      // 预期：按默认值处理（Grid 默认 true），页面正常渲染不崩溃
      Text('allowReuseInAnimation:null')
        .fontSize(10)
        .fontColor(Color.Gray)
        .height('3%')
      Grid() {
        Repeat(this.dataArray, { allowReuseInAnimation: null })
          .each((repeatItem: RepeatItem<AnimItemInfo>) => {
            GridItem() {
              Text(repeatItem.item.info)
                .id(`nullItem_${repeatItem.index}`)
                .fontSize(10)
            }
          })
          .key((item: AnimItemInfo, index: number) => item.key)
          .virtualScroll()
      }
      .columnsTemplate('1fr')
      .id('animReuseNullGrid')
      .height('20%')
      .border({ width: 1 })

      // 场景3：allowReuseInAnimation = undefined
      // 预期：按默认值处理（Grid 默认 true），页面正常渲染不崩溃
      Text('allowReuseInAnimation:undefined')
        .fontSize(10)
        .fontColor(Color.Gray)
        .height('3%')
      Grid() {
        Repeat(this.dataArray, { allowReuseInAnimation: undefined })
          .each((repeatItem: RepeatItem<AnimItemInfo>) => {
            GridItem() {
              Text(repeatItem.item.info)
                .id(`undefinedItem_${repeatItem.index}`)
                .fontSize(10)
            }
          })
          .key((item: AnimItemInfo, index: number) => item.key)
          .virtualScroll()
      }
      .columnsTemplate('1fr')
      .id('animReuseUndefinedGrid')
      .height('20%')
      .border({ width: 1 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
  }
}
