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
import { BusinessError } from '@ohos.base';
@Entry
@Component
struct spliceDeleteListMin {
  @State arr: number[] = []
  private scroller: ListScroller = new ListScroller()
  @State listChildrenSize: ChildrenMainSize = new ChildrenMainSize(20)
  @State resultSpliceDeleteNeg: string = 'splice_delete_neg';
  @State resultSpliceDeleteZero: string = 'splice_delete_zero';

  aboutToAppear() {
    for (let i = 0; i < 20; i++) {
      this.arr.push(i)
    }
  }

  build() {
    Column() {
      Text('spliceDeleteNegResult: ' + this.resultSpliceDeleteNeg)//no throw, treated as 0
        .id('splice_result_delete_neg')
        .margin({top:5})

      Button('splice(2,-1)')
        .id('splice_btn_delete_neg')
        .height('5%')
        .onClick(()=>{
          try {
            this.listChildrenSize.splice(2,-1)
            this.resultSpliceDeleteNeg = 'success'
          } catch (e) {
            this.resultSpliceDeleteNeg = (e as BusinessError).code + '';
          }
        })

      Text('spliceDeleteZeroResult: ' + this.resultSpliceDeleteZero)//no throw, 0 is valid
        .id('splice_result_delete_zero')
        .margin({top:5})

      Button('splice(2,0)')
        .id('splice_btn_delete_zero')
        .height('5%')
        .onClick(()=>{
          try {
            this.listChildrenSize.splice(2,0)
            this.resultSpliceDeleteZero = 'success'
          } catch (e) {
            this.resultSpliceDeleteZero = (e as BusinessError).code + '';
          }
        })

      List() {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height('20%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(20)
              .backgroundColor(0xF9CF93)
          }
        }, (item: number) => '' + item)
      }
      .id('splice_delete_list')
      .width('80%')
      .height('40%')
      .scrollBar(BarState.On)
      .backgroundColor(0xFAEEE0)
    }
    .width('100%')
    .height('100%')
  }
}
