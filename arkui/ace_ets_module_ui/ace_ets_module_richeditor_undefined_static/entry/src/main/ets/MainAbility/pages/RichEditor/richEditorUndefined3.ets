'use static'

import {
  Entry,
  Text,
  Column,
  ColumnOptions,
  Component,
  Button,
  ClickEvent,
  Color,
  Row,
  RichEditor,
  RichEditorController,
  CopyEvent,
  CutEvent,
  KeyboardAppearance,
  EnterKeyType,
  RichEditorOptions,
  TextRange,
  RichEditorTextSpanResult,
  CopyOptions,
  BarState,
  RichEditorDeleteValue,
  RichEditorInsertValue,
  Grid,
  ForEach,
  GridItem
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct Index {
  private controller: RichEditorController = new RichEditorController();
  @State isAboutToDelete: boolean = true;
  @State isAboutToIMEInput: boolean = true;
  @State isOnCut: boolean = true;
  @State isCustomKeyboard: boolean = true;
  @State cntAboutToDelete: int = 0;
  @State cntAboutToIMEInput: int = 0;
  @State cntCut: int = 0;
  @State message: string = 'hello';

  @Builder
  CustomKeyboardBuilderDefault() {
    Column() {
      Row() {
        Text(`Custom Key board`)
          .id('Text_CustomKeyboard2')
        Button('btnCustomKeyboard2')
          .id('Btn_CustomKeyboard2')
          .onClick((e: ClickEvent) => {
            this.message = 'CustomKeyboard'
          })
      }
      Grid() {
        ForEach(['1', '2', '3', '4', '5', '6', '7', '8', '9', '*', '0', '#'], (item: string) => {
          GridItem() {
            Button(item).width(110).onClick(() => {
              this.controller.addTextSpan(item + '', {
                offset: this.controller.getCaretOffset(),
                style:
                {
                  fontColor: Color.Orange,
                  fontSize: 30
                }
              })
            })
          }
        })
      }.maxCount(3).columnsGap(10).rowsGap(10).padding(5)
    }.backgroundColor(Color.Gray)
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      RichEditor({ controller: this.controller } as RichEditorOptions)
        .id('RichEditor_3')
        .onReady(() => {
          this.controller.addTextSpan('0123456789')
        }
        )
        .aboutToDelete(this.isAboutToDelete ? undefined : (value: RichEditorDeleteValue) => {
          this.cntAboutToDelete++;
          return true;
        })
        .aboutToIMEInput(this.isAboutToIMEInput ? undefined : (value: RichEditorInsertValue) => {
          this.cntAboutToIMEInput++;
          return true;
        })
        .onCut(this.isOnCut ? undefined : (event: CutEvent) => {
          this.cntCut++;
        })
        .customKeyboard(()=>{this.isCustomKeyboard ? undefined : this.CustomKeyboardBuilderDefault()})
      Row() {
        Text(`aboutToDelete:${this.cntAboutToDelete}`)
          .id('Text_AboutToDelete')
        Text(`aboutToIMEInput:${this.cntAboutToIMEInput}`)
          .id('Text_AboutToIMEInput')
        Text(`cut:${this.cntCut}`)
          .id('RichEditor_text_OnCut')
      }
      Row() {
        Text(this.message)
          .id('Text_CustomKeyboard')
      }
      Row() {
        Button('btnAboutToDelete : ' + this.isAboutToDelete)
          .id('Btn_AboutToDelete')
          .onClick((e: ClickEvent) => {
            this.isAboutToDelete = !this.isAboutToDelete
          })
        Button('btnAboutToIMEInput : ' + this.isAboutToIMEInput)
          .id('Btn_AboutToIMEInput')
          .onClick((e: ClickEvent) => {
            this.isAboutToIMEInput = !this.isAboutToIMEInput
          })
        Button('btnOnCut : ' + this.isOnCut)
          .id('RichEditor_btn_OnCut')
          .onClick((e: ClickEvent) => {
            this.isOnCut = !this.isOnCut
          })
      }
      Row() {
        Button('btnCustomKeyboard : ' + this.isCustomKeyboard)
          .id('Btn_CustomKeyboard')
          .onClick((e: ClickEvent) => {
            this.message = 'hello'
            this.isCustomKeyboard = !this.isCustomKeyboard
          })
      }
      Row() {
        Button('setCaretOffset')
          .id('RichEditor_setCaretOffset')
          .onClick((e: ClickEvent) => {
            this.controller.setCaretOffset(3);
          })
      }
    }

  }
}