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
struct GridEditModeOptions {
  @State arr: string[] = ['1', '2', '3', '4', '5', '6'];
  @State selectedCount: number = 0;

  build() {
    Scroll() {
      Column() {
        // 测试1: useDefaultMultiSelectStyle 设置为 true
        Grid() {
          ForEach(this.arr, (item: string) => {
            GridItem() {
              Text(item)
                .width('100%')
                .height('50%')
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .columnsTemplate('1fr 1fr 1fr')
        .columnsGap(5)
        .rowsGap(5)
        .width('90%')
        .height('10%')
        .backgroundColor(0xFAEEE0)
        .enableEditMode(true)
        .editModeOptions({ useDefaultMultiSelectStyle: true })
        .id('grid_useDefaultMultiSelectStyle_true')

        // 测试2: useDefaultMultiSelectStyle 设置为 false
        Grid() {
          ForEach(this.arr, (item: string) => {
            GridItem() {
              Text(item)
                .width('100%')
                .height('50%')
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .columnsTemplate('1fr 1fr 1fr')
        .columnsGap(5)
        .rowsGap(5)
        .width('90%')
        .height('10%')
        .backgroundColor(0xFAEEE0)
        .enableEditMode(true)
        .editModeOptions({ useDefaultMultiSelectStyle: false })
        .id('grid_useDefaultMultiSelectStyle_false')

        // 测试3: useDefaultMultiSelectStyle 设置为 undefined
        Grid() {
          ForEach(this.arr, (item: string) => {
            GridItem() {
              Text(item)
                .width('100%')
                .height('50%')
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .columnsTemplate('1fr 1fr 1fr')
        .columnsGap(5)
        .rowsGap(5)
        .width('90%')
        .height('10%')
        .backgroundColor(0xFAEEE0)
        .enableEditMode(true)
        .editModeOptions({ useDefaultMultiSelectStyle: undefined })
        .id('grid_useDefaultMultiSelectStyle_undefined')

        // 测试4: useDefaultMultiSelectStyle 设置为 null
        Grid() {
          ForEach(this.arr, (item: string) => {
            GridItem() {
              Text(item)
                .width('100%')
                .height('50%')
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .columnsTemplate('1fr 1fr 1fr')
        .columnsGap(5)
        .rowsGap(5)
        .width('90%')
        .height('10%')
        .backgroundColor(0xFAEEE0)
        .enableEditMode(true)
        .editModeOptions({ useDefaultMultiSelectStyle: null })
        .id('grid_useDefaultMultiSelectStyle_null')

        // 测试5: enableGatherSelectedItemsAnimation 设置为 true
        Grid() {
          ForEach(this.arr, (item: string) => {
            GridItem() {
              Text(item)
                .width('100%')
                .height('50%')
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .columnsTemplate('1fr 1fr 1fr')
        .columnsGap(5)
        .rowsGap(5)
        .width('90%')
        .height('10%')
        .backgroundColor(0xFAEEE0)
        .enableEditMode(true)
        .editModeOptions({ enableGatherSelectedItemsAnimation: true,
          onGetPreviewBadge: () => { return this.selectedCount; } })
        .id('grid_enableGatherSelectedItemsAnimation_true')

        // 测试6: enableGatherSelectedItemsAnimation 设置为 false
        Grid() {
          ForEach(this.arr, (item: string) => {
            GridItem() {
              Text(item)
                .width('100%')
                .height('50%')
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .columnsTemplate('1fr 1fr 1fr')
        .columnsGap(5)
        .rowsGap(5)
        .width('90%')
        .height('10%')
        .backgroundColor(0xFAEEE0)
        .enableEditMode(true)
        .editModeOptions({ enableGatherSelectedItemsAnimation: false,
          onGetPreviewBadge: () => { return this.selectedCount; } })
        .id('grid_enableGatherSelectedItemsAnimation_false')

        // 测试7: enableGatherSelectedItemsAnimation 设置为 undefined
        Grid() {
          ForEach(this.arr, (item: string) => {
            GridItem() {
              Text(item)
                .width('100%')
                .height('50%')
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .columnsTemplate('1fr 1fr 1fr')
        .columnsGap(5)
        .rowsGap(5)
        .width('90%')
        .height('10%')
        .backgroundColor(0xFAEEE0)
        .enableEditMode(true)
        .editModeOptions({ enableGatherSelectedItemsAnimation: undefined })
        .id('grid_enableGatherSelectedItemsAnimation_undefined')

        // 测试8: enableGatherSelectedItemsAnimation 设置为 null
        Grid() {
          ForEach(this.arr, (item: string) => {
            GridItem() {
              Text(item)
                .width('100%')
                .height('50%')
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .columnsTemplate('1fr 1fr 1fr')
        .columnsGap(5)
        .rowsGap(5)
        .width('90%')
        .height('10%')
        .backgroundColor(0xFAEEE0)
        .enableEditMode(true)
        .editModeOptions({ enableGatherSelectedItemsAnimation: null })
        .id('grid_enableGatherSelectedItemsAnimation_null')

        // 测试9: enableTwoFingerMultiSelect 设置为 true
        Grid() {
          ForEach(this.arr, (item: string) => {
            GridItem() {
              Text(item)
                .width('100%')
                .height('50%')
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .columnsTemplate('1fr 1fr 1fr')
        .columnsGap(5)
        .rowsGap(5)
        .width('90%')
        .height('10%')
        .backgroundColor(0xFAEEE0)
        .enableEditMode(true)
        .editModeOptions({ enableTwoFingerMultiSelect: true })
        .id('grid_enableTwoFingerMultiSelect_true')

        // 测试10: enableTwoFingerMultiSelect 设置为 false
        Grid() {
          ForEach(this.arr, (item: string) => {
            GridItem() {
              Text(item)
                .width('100%')
                .height('50%')
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .columnsTemplate('1fr 1fr 1fr')
        .columnsGap(5)
        .rowsGap(5)
        .width('90%')
        .height('10%')
        .backgroundColor(0xFAEEE0)
        .enableEditMode(true)
        .editModeOptions({ enableTwoFingerMultiSelect: false })
        .id('grid_enableTwoFingerMultiSelect_false')

        // 测试11: enableTwoFingerMultiSelect 设置为 undefined
        Grid() {
          ForEach(this.arr, (item: string) => {
            GridItem() {
              Text(item)
                .width('100%')
                .height('50%')
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .columnsTemplate('1fr 1fr 1fr')
        .columnsGap(5)
        .rowsGap(5)
        .width('90%')
        .height('10%')
        .backgroundColor(0xFAEEE0)
        .enableEditMode(true)
        .editModeOptions({ enableTwoFingerMultiSelect: undefined })
        .id('grid_enableTwoFingerMultiSelect_undefined')

        // 测试12: enableTwoFingerMultiSelect 设置为 null
        Grid() {
          ForEach(this.arr, (item: string) => {
            GridItem() {
              Text(item)
                .width('100%')
                .height('50%')
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .columnsTemplate('1fr 1fr 1fr')
        .columnsGap(5)
        .rowsGap(5)
        .width('90%')
        .height('10%')
        .backgroundColor(0xFAEEE0)
        .enableEditMode(true)
        .editModeOptions({ enableTwoFingerMultiSelect: null })
        .id('grid_enableTwoFingerMultiSelect_null')

        // 测试13: editModeOptions 整体参数设置为 null
        Grid() {
          ForEach(this.arr, (item: string) => {
            GridItem() {
              Text(item)
                .width('100%')
                .height('50%')
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .columnsTemplate('1fr 1fr 1fr')
        .columnsGap(5)
        .rowsGap(5)
        .width('90%')
        .height('10%')
        .backgroundColor(0xFAEEE0)
        .enableEditMode(true)
        .editModeOptions(null)
        .id('grid_editModeOptions_null')

        // 测试14: editModeOptions 整体参数设置为 undefined
        Grid() {
          ForEach(this.arr, (item: string) => {
            GridItem() {
              Text(item)
                .width('100%')
                .height('50%')
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .columnsTemplate('1fr 1fr 1fr')
        .columnsGap(5)
        .rowsGap(5)
        .width('90%')
        .height('10%')
        .backgroundColor(0xFAEEE0)
        .enableEditMode(true)
        .editModeOptions(undefined)
        .id('grid_editModeOptions_undefined')

        // 测试15: 多属性组合测试
        Grid() {
          ForEach(this.arr, (item: string) => {
            GridItem() {
              Text(item)
                .width('100%')
                .height('50%')
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .columnsTemplate('1fr 1fr 1fr')
        .columnsGap(5)
        .rowsGap(5)
        .width('90%')
        .height('10%')
        .backgroundColor(0xFAEEE0)
        .enableEditMode(true)
        .editModeOptions({
          useDefaultMultiSelectStyle: true,
          enableGatherSelectedItemsAnimation: true,
          enableTwoFingerMultiSelect: true,
          onGetPreviewBadge: () => { return this.selectedCount; }
        })
        .id('grid_editModeOptions_multiProperties')
      }
      .width('100%')
      .padding(5)
      .backgroundColor('#F5F5F5')
    }
    .height('100%')
    .width('100%')
  }
}