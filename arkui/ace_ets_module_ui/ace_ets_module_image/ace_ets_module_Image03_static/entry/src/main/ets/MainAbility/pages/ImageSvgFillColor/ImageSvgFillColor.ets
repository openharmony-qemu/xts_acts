/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
  Entry,
  Component,
  ClickEvent,
  $r,
  Image,
  Button,
  ResourceColor,
  ColorContent,
  Color,
  Column,
  AttributeModifier,
  ImageAttribute,
  Padding,
  Flex,
  FlexWrap,
  FlexAlign,
  ForEach,
  Resource
} from '@ohos.arkui.component'
import {
  State,
  Observed,
  ObjectLink,
} from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
// import { ImageModifier } from '@kit.ArkUI'

let idIndex: number = 0

@Observed
class FillColorCategory {
  imageKey: string = ''
  buttonID: string =''
  image: string = ''
  colors: (ResourceColor |undefined|Color|Double|String|Resource|ColorContent)[] = [undefined]
  colorDesc: string[]=['']
  colorIndex: number
  alt: string | undefined

  constructor(image: string,
    colors: (ResourceColor |undefined|Color|Double|String|Resource|ColorContent)[],
    colorDesc: string[],
    colorIndex: number, alt: string | undefined) {
    idIndex += 1
    this.imageKey = 'svgFillColorImageKey' + idIndex
    this.buttonID = 'svgFillColorButton' + idIndex
    this.image = image
    this.colors = colors
    this.colorDesc = colorDesc
    this.colorIndex = colorIndex
    this.alt = alt
  }
}

@Component
struct Child {
  // 子组件Child的@ObjectLink的类型是Info
  @ObjectLink item: FillColorCategory;
  label: string = 'ViewChild';

  build() {
    Column() {
      Image($r(this.item.image))
        .width(20)
        .height(20)
        .fillColor(this.item.colors[this.item.colorIndex])
        .alt($r(this.item.alt!))
        .key(this.item.imageKey)
      Button('change')
        .id(this.item.buttonID)
        .onClick((e:ClickEvent) => {
          this.item.colorIndex += 1
          this.item.colorIndex = this.item.colorIndex % this.item.colors.length
          let strJson = inspector.getInspectorByKey(this.item.imageKey);
          // let obj = JSON.parseJsonElement(strJson);
          // console.info(this.item.buttonID + this.item.imageKey + 'fillColor is: ' + obj.getElement('$attrs').getElement('fillColor'));
        })
        .height('5%')
    }
  }
}

export let allCategories: FillColorCategory[] = [
  new FillColorCategory(
    'app.media.comment_area_like',
    [
      Color.Red,
      Color.Green,
      ColorContent.ORIGIN
    ] as  (ResourceColor |undefined|Color|Double|String|Resource|ColorContent)[],
    [
      '#FFFF0000', '#FF008000', '#FF000000'
    ] as string[],
    0, undefined),
  new FillColorCategory('app.media.comment_area_like', [
    0xffffff,
    0xffff0000,
    ColorContent.ORIGIN],
    ['#FFFFFFFF', '#FFFF0000', '#FF000000'],
    0, undefined),
  new FillColorCategory('app.media.comment_area_like', [
    '#ffffff',
    '#ff000000',
    'rgba(255, 100, 255, 0.5)',
    ColorContent.ORIGIN,],
    ['#FFFFFFFF', '#FF000000', '#80FF64FF', '#FF000000'],
    0, undefined),
  new FillColorCategory('app.media.comment_area_like', [
    undefined,
    undefined,
    ColorContent.ORIGIN,],
    ['#FF000000', '#FF000000', '#FF000000'],
    0, undefined),
  new FillColorCategory('app.media.comment_area_like', [
    'xxxx',
    ColorContent.ORIGIN],
    ['#FF000000', '#FF000000'],
    0, undefined),
  new FillColorCategory('app.media.feOffset_2', [
    0xffffff,
    ColorContent.ORIGIN,],
    ['#FFFFFFFF', '#FF000000'],
    0, undefined),
  new FillColorCategory('app.media.linearGradient_2', [
    '#ffffff',
    ColorContent.ORIGIN,],
    ['#FFFFFFFF', '#FF000000'],
    0, undefined),
  new FillColorCategory('', [
    '#ffffff',
    ColorContent.ORIGIN,],
    ['#FFFFFFFF', '#FF000000'],
    0, 'app.media.logo'),
] as FillColorCategory[]

// class MyImageModifier implements AttributeModifier<ImageAttribute> {
//   isDark: boolean = false
//
//   applyNormalAttribute(instance: ImageAttribute): void {
//     instance.width(20).height(20)
//     instance.key('modifierImage')
//     if (this.isDark) {
//       instance.fillColor(ColorContent.ORIGIN)
//     } else {
//       instance.fillColor(Color.Red)
//     }
//   }
// }

@Entry
@Component
struct ImageSVGFillColor {
  @State categories: FillColorCategory[] = allCategories
  // @State modifier: MyImageModifier = new MyImageModifier()

  build() {
    Column() {
      Flex({ wrap: FlexWrap.Wrap, alignContent: FlexAlign.Center }) {
        ForEach(this.categories, (item: FillColorCategory, index: number) => {
          Child({ item: item })
        })
      }
      .width('100%')
      .height('80%')

      Column() {
        Image($r('app.media.comment_area_like'))
          // .attributeModifier(this.modifier)
        Button('modifier')
          .id('modifierButton')
          .onClick((e:ClickEvent) => {
            // this.modifier.isDark = !this.modifier.isDark
            let strJson = inspector.getInspectorByKey('modifierImage');
            // let obj = JSON.parseJsonElement(strJson);
            // console.info('modifier fillColor is: ' + obj.getElement('$attrs').getElement('fillColor'));
          })
          .height('5%')
      }
    }
    .width('100%').padding({ right: 10, top: 10 } as Padding)
    .backgroundColor(Color.Gray)
    .height('100%')
  }
}
