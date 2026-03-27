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
  StackLayoutAlgorithm,
  DynamicLayout, DynamicLayoutAttribute} from '@kit.ArkUI';

@Entry
@ComponentV2
struct DynamicLayoutStack {
  @Local dynamicLayoutAlignContent: LocalizedAlignment |null| undefined = LocalizedAlignment.CENTER
  @Local stackLayoutAlignContent: LocalizedAlignment |null| undefined = LocalizedAlignment.CENTER
  public stackAlignContentArr: LocalizedAlignment[] = [LocalizedAlignment.CENTER,LocalizedAlignment.TOP_START,LocalizedAlignment.TOP,LocalizedAlignment.TOP_END,
  LocalizedAlignment.START,LocalizedAlignment.END,LocalizedAlignment.BOTTOM_START,LocalizedAlignment.BOTTOM,LocalizedAlignment.BOTTOM_END]
  public stackAlignContentIndex: number = 0

  build() {
    Column({space:2}) {
      Row({space: 2}) {
        DynamicLayout(new StackLayoutAlgorithm({
          alignContent: this.dynamicLayoutAlignContent,
        })) {
          Stack()
            .id('StackLayoutAlgorithm1')
            .backgroundColor(Color.Red)
            .width(50)
            .height(25)
        }
        .id('DynamicLayoutStack')
        .backgroundColor(Color.Yellow)
        .width(150)
        .height(70)
      }

      Row(){
        Button(`alignContent ${JSON.stringify(this.dynamicLayoutAlignContent)}`)
          .onClick(()=>{
            this.stackAlignContentIndex += 1
            if (this.stackAlignContentIndex == 9) {
              this.stackAlignContentIndex = 0
            }
            this.stackLayoutAlignContent= this.stackAlignContentArr[this.stackAlignContentIndex]
            this.dynamicLayoutAlignContent = this.stackLayoutAlignContent
          })
          .id('StackLayoutAlgorithmJAlignContent')
          .width(150)
          .height(20)
      }

      Row(){
        Button('get')
          .onClick(()=>{
            let strJson1 = getInspectorByKey('DynamicLayoutStack');
            console.info('hello1:'+JSON.parse(strJson1).$attrs.alignContent);

          })
          .width(80)
          .height(20)
      }
      Row(){
        Button('null')
          .onClick(()=>{
            this.dynamicLayoutAlignContent = null
          })
          .id('StackLayoutAlgorithmNull')
          .width(80)
          .height(20)
        Button('undefined')
          .onClick(()=>{
            this.dynamicLayoutAlignContent = undefined
          })
          .id('StackLayoutAlgorithmUndefined')
          .width(80)
          .height(20)
      }

    }
    .width('100%')
    .width('100%')
  }
}