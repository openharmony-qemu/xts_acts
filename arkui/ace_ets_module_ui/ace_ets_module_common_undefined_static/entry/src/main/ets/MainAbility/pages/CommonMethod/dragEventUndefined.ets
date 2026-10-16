'use static';
import {
  Entry,
  Component,
  Column,
  Button,
  Text,
  ColumnOptions,
  ClickEvent,
  Image,
  Row,
  TextAlign,
  Color,
  $r,
  DragEvent,
  HorizontalAlign
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct DropAnimationExample {
  @State isOnDragEndUndefined: boolean = true;
  @State isOnDragEnterUndefined: boolean = true;
  @State isOnDragLeaveUndefined: boolean = true;
  @State isOnDragMoveUndefined: boolean = true;
  @State isOnDropUndefined: boolean = true;
  @State message: string = 'Hello World';

  build() {
      Column() {
        Text(this.message)
          .id('Common_text')
          .height('5%')
        Column() {
          Image($r('app.media.startIcon'))
            .width(80)
            .height(80)
            .draggable(true)
            .id('Image1')
            .onDragEnd(this.isOnDragEndUndefined ? undefined : (dragEvent: DragEvent) => {
              this.message = 'onDragEnd';
              console.log(this.message)
            })
            .onDrop(this.isOnDropUndefined ? undefined : (dragEvent: DragEvent) => {
              this.message = 'onDrop';
              console.log(this.message)
            })
        }
        .width(150)
        .height(150)
        .id('Column1')
        Column() {
          Image($r('app.media.startIcon'))
            .width(80)
            .height(80)
            .draggable(true)
            .id('Image2')
            .onDragEnter(this.isOnDragEnterUndefined ? undefined : (dragEvent: DragEvent) => {
              this.message = 'onDragEnter';
              console.log(this.message)
            })
            .onDragLeave(this.isOnDragLeaveUndefined ? undefined : (dragEvent: DragEvent) => {
              this.message = 'onDragLeave';
              console.log(this.message)
            })
            .onDragMove(this.isOnDragMoveUndefined ? undefined : (dragEvent: DragEvent) => {
              this.message = 'onDragMove';
              console.log(this.message)
            })
            .onDrop((dragEvent: DragEvent) => {
              console.log('onDrop')
            })
        }
        .id('Column2')
        .width(150)
        .height('30%')

        Column() {
          Button('resetText')
            .id('Common_resetText')
            .height('10%')
            .onClick((e: ClickEvent) => {
              this.message = 'Hello World';
            })
          Button('isOnDragEndUndefined : ' + this.isOnDragEndUndefined)
            .onClick((e: ClickEvent) => {
              this.isOnDragEndUndefined = !this.isOnDragEndUndefined
            })
            .height('10%')
            .id('Common_OnDragEnd')
          Button('isOnDragEnterUndefined : ' + this.isOnDragEnterUndefined)
            .onClick((e: ClickEvent) => {
              this.isOnDragEnterUndefined = !this.isOnDragEnterUndefined
            })
            .height('10%')
            .id('Common_OnDragEnter')
          Button('isOnDragLeaveUndefined : ' + this.isOnDragLeaveUndefined)
            .onClick((e: ClickEvent) => {
              this.isOnDragLeaveUndefined = !this.isOnDragLeaveUndefined
            })
            .height('10%')
            .id('Common_OnDragLeave')
          Button('isOnDragMoveUndefined : ' + this.isOnDragMoveUndefined)
            .onClick((e: ClickEvent) => {
              this.isOnDragMoveUndefined = !this.isOnDragMoveUndefined
            })
            .height('10%')
            .id('Common_OnDragMove')
          Button('isOnDropUndefined : ' + this.isOnDropUndefined)
            .onClick((e: ClickEvent) => {
              this.isOnDropUndefined = !this.isOnDropUndefined
            })
            .height('10%')
            .id('Common_OnDrop')
        }.height('40%')
      }
      .alignItems(HorizontalAlign.Center)
      .width('80%')
      .height('100%')
  }
}