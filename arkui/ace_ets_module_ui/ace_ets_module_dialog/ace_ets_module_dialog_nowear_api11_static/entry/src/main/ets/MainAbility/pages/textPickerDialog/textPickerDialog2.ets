/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
  Column,
  Component,
  Button,
  ClickEvent,TimePickerDialog,TimePickerResult,
  Text,FlexDirection,ItemAlign,Divider,$r,$$,MenuItem,BlurStyleActivePolicy,AdaptiveColor,ThemeColorMode,MenuElement,
  Row,AlertDialogParamWithButtons,FlexOptions,ColumnOptions,RowOptions,Flex,Builder,MenuItemOptions,ResourceStr,Menu,BackgroundBlurStyleOptions,BlurStyle,
  Scroll,FontWeight,TextAlign,ForEach,ListItem,LocalizedBorderRadiuses,$$,SheetOptions,FlexAlign,CustomDialogController,TextInput,CustomDialogControllerOptions,
  ButtonType,Scroller,Color,Rectangle,ActionSheetOptions,ControlSize,DialogAlignment,TextInputController,Margin
} from '@ohos.arkui.component'
import {
  State,
  Link,
  Prop,
  Observed,
  ObjectLink,
} from '@ohos.arkui.stateManagement'
@Entry
@Component
struct TextPickerDialog22Example {
  @State select: number | Array<number> | Int = 1;
  private fruits: Array<string> = ['apple1', 'orange2', 'peach3', 'grape4'] as Array<string>;

  build() {
    Flex({
      direction: FlexDirection.Column, alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.Center
    }) {
      Button("TextPickerDialog").key('textPickerDialog').onClick(() : void => {
        // TextPickerDialog.show({
        //   range: this.fruits,
        //   selected: this.select,
        //   defaultPickerItemHeight: 20,
        //   onAccept: (value: TextPickerResult) => {
        //     console.info("TextPickerDialog:onAccept()" + JSON.stringify(value))
        //     this.select = value.index
        //   },
        //   onCancel: () => {
        //     console.info("TextPickerDialog:onCancel()")
        //   },
        //   onChange: (value: TextPickerResult) => {
        //     console.info("TextPickerDialog:onChange()" + JSON.stringify(value))
        //   }
        // })
      })
    }
  }
}