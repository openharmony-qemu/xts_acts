/*
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
  LengthMetrics,
  RowLayoutAlgorithm,
  DynamicLayout, DynamicLayoutAttribute} from '@kit.ArkUI';

@Entry
@ComponentV2
struct DynamicLayoutRow {
  @Local rowSpace: number = 0
  @Local rowAlignItems: VerticalAlign | undefined = VerticalAlign.Center
  @Local rowJustifyContent: FlexAlign | undefined= FlexAlign.Start
  @Local rowIsReverse: boolean | undefined | null = false;

  @Local dynamicLayoutSpace: number|null|undefined = 0
  @Local dynamicLayoutAlignItems: VerticalAlign |null| undefined = VerticalAlign.Center
  @Local dynamicLayoutJustifyContent: FlexAlign |null| undefined = FlexAlign.Start
  @Local dynamicLayoutIsReverse: boolean | undefined | null = false;

  public uiContext: UIContext | undefined = undefined;
  public rowAlignItemsArr: VerticalAlign [] = [VerticalAlign.Center, VerticalAlign.Top, VerticalAlign.Bottom]
  public rowAlignItemsIndex: number = 0
  public rowJustifyContentArr: FlexAlign[] = [FlexAlign.Start, FlexAlign.Center, FlexAlign.End, 
  FlexAlign.SpaceBetween, FlexAlign.SpaceAround, FlexAlign.SpaceEvenly]
  public rowJustifyContentIndex: number = 0
  public flag: boolean = false

  build() {
    Column({space:2}) {
      Row({space: 2}) {
        DynamicLayout(new RowLayoutAlgorithm({
          space: LengthMetrics.vp(this.dynamicLayoutSpace),
          alignItems: this.dynamicLayoutAlignItems,
          justifyContent: this.dynamicLayoutJustifyContent,
          isReverse: this.dynamicLayoutIsReverse})) {
          Row()
            .id('RowLayoutAlgorithm1')
            .backgroundColor(Color.Blue)
            .width(40)
            .height(25)
          Row()
            .id('RowLayoutAlgorithm2')
            .backgroundColor(Color.Red)
            .width(50)
            .height(25)
        }
        .id('DynamicLayoutRow')
        .backgroundColor(Color.Yellow)
        .width(150)
        .height(70)
      }

      Row() {
        Button(`Space++ ${this.rowSpace}`)
          .onClick(()=>{
            this.rowSpace += 2
            this.dynamicLayoutSpace = this.rowSpace
          })
          .id('RowLayoutAlgorithmSpace++')
          .width(90)
          .height(20)

        Button(`Space-- ${this.rowSpace}`)
          .onClick(()=>{
            this.rowSpace -= 2
            this.dynamicLayoutSpace = this.rowSpace
          })
          .id('RowLayoutAlgorithmSpace--')
          .width(90)
          .height(20)
      }
      Row(){
        Button(`AlignItems: ${JSON.stringify(this.rowAlignItems)}`)
          .onClick(()=>{
            this.rowAlignItemsIndex += 1
            if (this.rowAlignItemsIndex == 3) {
              this.rowAlignItemsIndex = 0
            }
            this.rowAlignItems = this.rowAlignItemsArr[this.rowAlignItemsIndex]
            this.dynamicLayoutAlignItems = this.rowAlignItemsArr[this.rowAlignItemsIndex]
          })
          .id('RowLayoutAlgorithmAlignItems')
          .width(90)
          .height(20)

        Button(`justifyContent ${JSON.stringify(this.rowJustifyContent)}`)
          .onClick(()=>{
            this.rowJustifyContentIndex += 1
            if (this.rowJustifyContentIndex == 6) {
              this.rowJustifyContentIndex = 0
            }
            this.rowJustifyContent= this.rowJustifyContentArr[this.rowJustifyContentIndex]
            this.dynamicLayoutJustifyContent = this.rowJustifyContent
          })
          .id('RowLayoutAlgorithmJustifyContent')
          .width(100)
          .height(20)
      }
      Row(){
        Button(`isReverse: ${JSON.stringify(this.rowIsReverse)}`)
          .onClick(()=>{
            this.rowIsReverse = !this.rowIsReverse
            this.dynamicLayoutIsReverse = this.rowIsReverse
          })
          .id('RowLayoutAlgorithmIsReverse')
          .width(100)
          .height(20)
        Button('get')
          .onClick(()=>{
            let strJson1 = getInspectorByKey('DynamicLayoutRow');
            console.info('hello1:'+JSON.parse(strJson1).$attrs.space);
            console.info('hello:'+JSON.parse(strJson1).$attrs.alignItems);
            console.info('hello1:'+JSON.parse(strJson1).$attrs.justifyContent);
          })
          .width(100)
          .height(20)
      }
      Row(){
        Button('null')
          .onClick(()=>{
            this.dynamicLayoutSpace = null
            this.dynamicLayoutAlignItems = null
            this.dynamicLayoutIsReverse = null
            this.dynamicLayoutJustifyContent = null
          })
          .id('RowLayoutAlgorithmNull')
          .width(80)
          .height(20)
        Button('undefined')
          .onClick(()=>{
            this.dynamicLayoutSpace = undefined
            this.dynamicLayoutAlignItems = undefined
            this.dynamicLayoutIsReverse = undefined
            this.dynamicLayoutJustifyContent = undefined
          })
          .id('RowLayoutAlgorithmUndefined')
          .width(80)
          .height(20)
      }

    }
    .width('100%')
    .width('100%')
  }
}