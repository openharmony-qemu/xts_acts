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
@Entry
@Component
struct GridEditModeChange {
  @State arr: string[] = ['0', '1', '2', '3', '4', '5'];
  @State @Watch('onEditModeChanged') enableEditMode: boolean = false;
  @State selectedIndexes: number[] = [];

  onEditModeChanged() {
    console.info(`enableEditMode changed to: ${this.enableEditMode}`);
    if (!this.enableEditMode) {
      console.info('enableEditMode changed to false, clearing selectedIndexes');
      this.selectedIndexes = [];
    }
  }

  build() {
    Column({ space: 2 }) {
      Button('enableEditMode')
        .id('grid_enableEditMode_change')
        .onClick(()=>{
          this.enableEditMode = !this.enableEditMode
        })

      // onEditModeChange 设置为 true / false
      Grid() {
        ForEach(this.arr, (item: string) => {
          GridItem() {
            Text(item)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height('50%')
              .textAlign(TextAlign.Center)
          }
        }, (item: string) => item)
      }
      .id('grid_onEditModeChange')
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(5)
      .rowsGap(5)
      .enableEditMode(this.enableEditMode!!)
      .editModeOptions({useDefaultMultiSelectStyle: true})
      .onEditModeChange((data: boolean) => {
        console.info('grid onEditModeChange: ' + data)
        AppStorage.setOrCreate('grid_onEditModeChange', data)
      })
      .width('90%')
      .height('30%')
      .backgroundColor(0xFAEEE0)

      // onEditModeChange 设置为 undefined
      Grid() {
        ForEach(this.arr, (item: string) => {
          GridItem() {
            Text(item)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height('50%')
              .textAlign(TextAlign.Center)
          }
        }, (item: string) => item)
      }
      .id('grid_onEditModeChange_undefined')
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(5)
      .rowsGap(5)
      .enableEditMode(true)
      .editModeOptions({useDefaultMultiSelectStyle: true})
      .onEditModeChange(undefined)
      .width('90%')
      .height('20%')
      .backgroundColor(0xFAEEE0)

      // onEditModeChange 设置为 null
      Grid() {
        ForEach(this.arr, (item: string) => {
          GridItem() {
            Text(item)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height('50%')
              .textAlign(TextAlign.Center)
          }
        }, (item: string) => item)
      }
      .id('grid_onEditModeChange_null')
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(5)
      .rowsGap(5)
      .enableEditMode(true)
      .editModeOptions({useDefaultMultiSelectStyle: false})
      .onEditModeChange(null)
      .width('90%')
      .height('20%')
      .backgroundColor(0xFAEEE0)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}