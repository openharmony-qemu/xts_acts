'use static';
import {
  Builder,
  Stack,
  Entry,
  Component,
  Column,
  Row,
  Alignment,
  WaterFlow,
  Refresh,
  Button,
  List,
  RefreshStatus,
  ForEach,
  LazyForEach,
  ListItemAlign,
  ListItem,
  ScrollState,
  ListItemStyle,
  Text,
  Scroller,
  TextAlign,
  BarState,
  Scroll,
  EdgeEffect,
  Color,
  ListItemOptions,
  ClickEvent,
  PanGesture,
  FlexAlign,
  HorizontalAlign,
  ColumnOptions,
  Resource,
  $r,
  $$,
  EditModeOptions,
  WaterFlowAttribute,
  AttributeModifier,
  WaterFlowOptions,
  WaterFlowLayoutMode,
  FlowItem
} from '@ohos.arkui.component'
import { State, AppStorage, Local, Watch } from '@ohos.arkui.stateManagement'
import { LengthMetrics } from '@ohos.arkui.node'

@Entry
@Component
struct ListEditModeChangeExample {
  @State arr: string[] = ['0', '1', '2', '3', '4', '5'];
  @State  enableEditMode: boolean = false

  build() {
    Column({ space: 2 } as ColumnOptions) {
      Button('enableEditMode')
        .id('list_enableEditMode_change')
        .onClick(()=>{
          this.enableEditMode = !this.enableEditMode
        })

      // onEditModeChange 设置为 true / false
      List() {
        ForEach(this.arr, (item: string) => {
          ListItem() {
            Text(item)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height('50%')
              .textAlign(TextAlign.Center)
          }
        }, (item: string) => item)
      }
      .id('list_enableEditMode_true')
      .width('90%')
      .height('30%')
      .backgroundColor(0xFAEEE0)
      .enableEditMode(this.enableEditMode!!)
      .editModeOptions({useDefaultMultiSelectStyle: true, enableTwoFingerMultiSelect: undefined})
      .onEditModeChange((data: boolean) => {
        console.info('List onEditModeChange: ' + data)
        AppStorage.setOrCreate<boolean>('list_onEditModeChange', data)
      })

      // onEditModeChange 设置为 undefined
      List() {
        ForEach(this.arr, (item: string) => {
          ListItem() {
            Text(item)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height('50%')
              .textAlign(TextAlign.Center)
          }
        }, (item: string) => item)
      }
      .width('90%')
      .height('20%')
      .backgroundColor(0xFAEEE0)
      .enableEditMode(true)
      .editModeOptions({useDefaultMultiSelectStyle: true, enableTwoFingerMultiSelect: undefined})
      .onEditModeChange(undefined)
      .id('list_onEditModeChange_undefined')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
