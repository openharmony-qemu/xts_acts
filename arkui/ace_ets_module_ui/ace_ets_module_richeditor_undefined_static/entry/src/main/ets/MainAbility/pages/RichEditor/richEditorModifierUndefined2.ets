'use static'
import {
  Entry,
  Text,
  Column,
  Row,
  Scroll,
  Component,
  Color,
  Margin,
  Button,
  ClickEvent,
  RichEditorOptions,
  FlexAlign,
  ResourceColor,
  Curve,
  TextAlign,
  IDataSource,
  CopyEvent,
  DataChangeListener,
  RichEditor,
  RichEditorController,
  RichEditorSelection,
  EnterKeyType,
  SubmitEvent,
  RichEditorChangeValue,
  AttributeModifier,
  RichEditorAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
class MyPointModifier implements AttributeModifier<RichEditorAttribute> {
  message: string = "hello";
  isStopBackPress: boolean = true;
  isOnSelect: boolean = true;
  isOnSubmit: boolean = true;
  isPlaceholder: boolean = true;
  isOnPaste: boolean = true;
  isOnSelectionChange: boolean = false;
  isOnWillChange: boolean = false;
  SelectedBackgroundColorIndex: int = 0
  PlaceholderStyleIndex: int = 0
  start_message: string = 'Hello World';
  PlaceholderStyleList: Array<ResourceColor | undefined> =
    new Array<ResourceColor | undefined>(Color.Yellow, undefined)
  SelectedBackgroundColorList: Array<ResourceColor | undefined> =
    new Array<ResourceColor | undefined>(Color.Yellow, undefined)

  applyNormalAttribute(instance: RichEditorAttribute): void {
    instance
      .stopBackPress(this.isStopBackPress ? false : undefined)
      .onSelect(this.isOnSelect ? (value: RichEditorSelection) => {
        this.message = "onSelect"
      } : undefined)
      .onSubmit(this.isOnSubmit ? (enterKey: EnterKeyType, event: SubmitEvent) => {
        this.message = "onSubmit"
      } : undefined)
      .selectedBackgroundColor(this.SelectedBackgroundColorList[this.SelectedBackgroundColorIndex])
      .placeholder(this.start_message, { fontColor: this.PlaceholderStyleList[this.PlaceholderStyleIndex] })
      .onPaste(this.isOnPaste ? () => {
        this.message = "onPaste"
      } : undefined)
      .onSelectionChange(this.isOnSelectionChange ? () => {
        this.message = "onSelectionChange"
      } : undefined)
      .onWillChange(this.isOnWillChange ? (value: RichEditorChangeValue) => {
        this.message = "onWillChange";
        return true;
      } : undefined)
  }
}

@Entry
@Component
struct SoftKeyboardEnterTypeExample {
  @State modifier: MyPointModifier = new MyPointModifier()
  controller: RichEditorController = new RichEditorController();

  build() {
    Column() {
      RichEditor({ controller: this.controller } as RichEditorOptions)
        .id("RichEditorM_2")
        .onReady(() => {
          this.controller.addTextSpan("0123456789")
        })
        .attributeModifier(this.modifier)
        .height('20%')
        .border({ width: 1 })
        .borderColor(Color.Red)
        .width("100%")

      Text(this.modifier.message)
        .id("RichEditorM_text")
      Row() {
        Button("resetText")
          .id("RichEditorM_resetText")
          .onClick((e: ClickEvent) => {
            this.modifier.message = 'hello';
          })
        Button("setCaretOffset")
          .id("RichEditorM_setCaretOffset")
          .onClick((e: ClickEvent) => {
            this.controller.setCaretOffset(3);
          })
        Button("isStopBackPress: " + this.modifier.isStopBackPress)
          .id("RichEditorM_stopBackPress")
          .onClick((e: ClickEvent) => {
            this.modifier.isStopBackPress = !this.modifier.isStopBackPress
          })
      }

      Row() {
        Button("isOnSelect: " + this.modifier.isOnSelect)
          .id("RichEditorM_onSelect")
          .onClick((e: ClickEvent) => {
            this.modifier.isOnSelect = !this.modifier.isOnSelect
          })
        Button("isOnSubmit: " + this.modifier.isOnSubmit)
          .id("RichEditorM_onSubmit")
          .onClick((e: ClickEvent) => {
            this.modifier.isOnSubmit = !this.modifier.isOnSubmit
          })
        Button("isOnPaste: " + this.modifier.isOnPaste)
          .id("RichEditorM_onPaste")
          .onClick((e: ClickEvent) => {
            this.modifier.isOnPaste = !this.modifier.isOnPaste
          })
      }

      Row() {
        Button("isOnSelectionChange: " + this.modifier.isOnSelectionChange)
          .id("RichEditorM_onSelectionChange")
          .onClick((e: ClickEvent) => {
            this.modifier.isOnSelectionChange = !this.modifier.isOnSelectionChange
          })
        Button("isOnWillChange: " + this.modifier.isOnWillChange)
          .id("RichEditorM_onWillChange")
          .onClick((e: ClickEvent) => {
            this.modifier.isOnWillChange = !this.modifier.isOnWillChange
          })
      }

      Row() {
        Button('改变颜色' + this.modifier.SelectedBackgroundColorList[this.modifier.SelectedBackgroundColorIndex])
          .id("RichEditorM_selectedBackgroundColor")
          .onClick((e: ClickEvent) => {
            this.modifier.SelectedBackgroundColorIndex =
              (this.modifier.SelectedBackgroundColorIndex + 1) % this.modifier.SelectedBackgroundColorList.length;
          })
        Button('改变提示文本' + this.modifier.PlaceholderStyleList[this.modifier.PlaceholderStyleIndex])
          .id("RichEditorM_placeholder")
          .onClick((e: ClickEvent) => {
            this.modifier.PlaceholderStyleIndex = (this.modifier.PlaceholderStyleIndex + 1) % this.modifier.PlaceholderStyleList.length;
            this.modifier.isPlaceholder = !this.modifier.isPlaceholder;
          })
      }
    }.height("60%").justifyContent(FlexAlign.Center)
  }
}