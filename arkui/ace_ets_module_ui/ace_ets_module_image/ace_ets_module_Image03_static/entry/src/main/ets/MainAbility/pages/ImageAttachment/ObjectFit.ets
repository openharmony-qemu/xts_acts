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
  Margin,
  ClickEvent,
  Column,
  ColumnOptions,
  Row,
  Button,
  ColorFilter,
  DrawingColorFilter,
  ColorFilter,
  MutableStyledString,
  ImageFit,
  RichEditorStyledStringController,
  RichEditorStyledStringOptions,
  RichEditor,
  ImageAttachment,
  MutableStyledString,
  Text
} from '@ohos.arkui.component'
import {
  State,
} from '@ohos.arkui.stateManagement'
import { LengthMetrics } from '@ohos.arkui.node'
// import { drawing, common2D } from '@kit.ArkGraphics2D';
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D'
@Entry
@Component
struct ObjectFit1 {
  private ColorFilterMatrix: Array<Number> = new Array<Number>(0.239, 0, 0, 0, 0, 0, 0.616, 0, 0, 0, 0, 0, 0.706, 0, 0, 0, 0, 0, 1, 0);
  private color: common2D.Color = { alpha: 125, red: 125, green: 125, blue: 255 } as  common2D.Color;
  @State DrawingColorFilterFirst: ColorFilter | DrawingColorFilter | undefined = new ColorFilter(this.ColorFilterMatrix)
  @State mutableStyledString1: MutableStyledString = new MutableStyledString('');
  @State ImageFit: ImageFit = ImageFit.Auto
  @State objectFit: string = 'ObjectFit'
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = { controller: this.controller } as RichEditorStyledStringOptions;

  update(){
    this.controller.setStyledString(this.mutableStyledString1)
  }
  build() {
    Column({ space: 1 } as ColumnOptions) {
      RichEditor( this.options ).width('100%')
        .height('10%')
      Row() {
        Button("Contain:1").id('Set_ImageFit_Contain').height('5%').width('30%')
          .onClick((e:ClickEvent)=>{
            this.ImageFit = ImageFit.Contain
          })
        Button("Cover:2").id('Set_ImageFit_Cover').height('5%').width('30%')
          .onClick((e:ClickEvent)=>{
            this.ImageFit = ImageFit.Cover
          })
        Button("Fill:0").id('Set_ImageFit_Fill').height('5%').width('30%')
          .onClick((e:ClickEvent)=>{
            this.ImageFit = ImageFit.Fill
          })
      }
      Row() {
        Button("ScaleDown:6").id('Set_ImageFit_ScaleDown').height('5%').width('30%')
          .onClick((e:ClickEvent)=>{
            this.ImageFit = ImageFit.ScaleDown
          })
        Button("None:5").id('Set_ImageFit_None').height('5%').width('30%')
          .onClick((e:ClickEvent)=>{
            this.ImageFit = ImageFit.None
          })
        Button("TOP_START:7").id('Set_ImageFit_TOP_START').height('5%').width('30%')
          .onClick((e:ClickEvent)=>{
            this.ImageFit = ImageFit.TOP_START
          })
      }
      Row() {
        Button("TOP:8").id('Set_ImageFit_TOP').height('5%').width('30%')
          .onClick((e:ClickEvent)=>{
            this.ImageFit = ImageFit.TOP
          })
        Button("TOP_END:9").id('Set_ImageFit_TOP_END').height('5%').width('30%')
          .onClick((e:ClickEvent)=>{
            this.ImageFit = ImageFit.TOP_END
          })
        Button("START:10").id('Set_ImageFit_START').height('5%').width('30%')
          .onClick((e:ClickEvent)=>{
            this.ImageFit = ImageFit.START
          })
      }
      Row() {
        Button("CENTER:11").id('Set_ImageFit_CENTER').height('5%').width('30%')
          .onClick((e:ClickEvent)=>{
            this.ImageFit = ImageFit.CENTER
          })
        Button("END:12").id('Set_ImageFit_END').height('5%').width('30%')
          .onClick((e:ClickEvent)=>{
            this.ImageFit = ImageFit.END
          })
        Button("BOTTOM_START:13").id('Set_ImageFit_BOTTOM_START').height('5%').width('30%')
          .onClick((e:ClickEvent)=>{
            this.ImageFit = ImageFit.BOTTOM_START
          })
      }
      Row() {
        Button("BOTTOM:14").id('Set_ImageFit_BOTTOM').height('5%').width('30%')
          .onClick((e:ClickEvent)=>{
            this.ImageFit = ImageFit.BOTTOM
          })
        Button("BOTTOM_END:15").id('Set_ImageFit_BOTTOM_END').height('5%').width('30%')
          .onClick((e:ClickEvent)=>{
            this.ImageFit = ImageFit.BOTTOM_END
          })
      }
      Row() {
        Button('append resource').height('5%').id('set_ObjectFit_append')
          .onClick((e:ClickEvent)=>{
            // this.mutableStyledString1.appendStyledString(new MutableStyledString(new ImageAttachment({
            //   resourceValue: $r('app.media.icon'),
            //   size: { width: 50, height: '50px' },
            //   layoutStyle: { borderRadius: LengthMetrics.vp(10) },
            //   verticalAlign: ImageSpanAlignment.CENTER,
            //   objectFit: this.ImageFit,
            //   colorFilter: drawing.ColorFilter.createBlendModeColorFilter(this.color, drawing.BlendMode.DST_OVER)
            // })))
            this.update()
          })
        Button('getStyles').width('50%').height('5%').id('get_ObjectFit_styles')
          .onClick((e:ClickEvent) => {
            let imageArray = this.mutableStyledString1.getStyles(0,  this.mutableStyledString1.length)
            for (let i = 0; i < imageArray.length; ++i) {
              if (imageArray[i].styledKey === 300) {
                let attachment = imageArray[i].styledValue as ImageAttachment
                console.info('ImageAttachment value  ' + JSON.stringify(attachment.value))
                console.info('ImageAttachment size  ' + JSON.stringify(attachment.size))
                console.info('ImageAttachment verticalAlign  ' + JSON.stringify(attachment.verticalAlign))
                this.objectFit = '' + JSON.stringify(attachment.objectFit)
                console.info('ImageAttachment objectFit  ' + JSON.stringify(attachment.objectFit))
                console.info('ImageAttachment layoutStyle  ' + JSON.stringify(attachment.layoutStyle))
                if (attachment.colorFilter) {
                  this.DrawingColorFilterFirst = attachment.colorFilter
                  console.info('ImageAttachment colorFilter  ' + JSON.stringify(attachment.colorFilter))
                }
              }
            }
          }).height(35).padding(8).margin({top:10,right:10} as Margin)
      }
      Text(this.objectFit).id('get_ObjectFit').height('5%')
    }.width('100%')
  }
}