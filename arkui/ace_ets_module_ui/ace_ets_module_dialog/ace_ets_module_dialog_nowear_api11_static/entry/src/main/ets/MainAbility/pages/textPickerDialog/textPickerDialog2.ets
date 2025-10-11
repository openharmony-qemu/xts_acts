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
  $$,
  $r,
  ActionSheetOptions,
  AdaptiveColor,
  AlertDialogParamWithButtons,
  BackgroundBlurStyleOptions,
  BlurStyle,
  BlurStyleActivePolicy,
  Builder,
  Button,
  ButtonType,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  ControlSize,
  CustomDialogController,
  CustomDialogControllerOptions,
  DialogAlignment,
  Divider,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FlexOptions,
  FontWeight,
  ForEach,
  ItemAlign,
  ListItem,
  LocalizedBorderRadiuses,
  Margin,
  Menu,
  MenuElement,
  MenuItem,
  MenuItemOptions,
  Rectangle,
  ResourceStr,
  Row,
  RowOptions,
  Scroll,
  Scroller,
  SheetOptions,
  Text,
  TextAlign,
  TextInput,
  TextInputController,
  TextPickerResult,
  ThemeColorMode,
  TimePickerDialog,
  TimePickerResult
} from '@ohos.arkui.component'
import { Link, ObjectLink, Observed, PropRef, State, } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextPickerDialog22Example {
  @State select: int | int[] = 1;
  private fruits: string[] = ['apple1', 'orange2', 'peach3', 'grape4'] as string[];

  build() {
    Flex({
      direction: FlexDirection.Column, alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.Center
    }) {
      Button("TextPickerDialog").key('textPickerDialog').onClick((): void => {
        this.getUIContext().showTextPickerDialog({
          range: this.fruits,
          selected: this.select,
          defaultPickerItemHeight: 20,
          onAccept: (value: TextPickerResult) => {
            console.info("TextPickerDialog:onAccept()" + JSON.stringify(value))
            this.select = value.index
          },
          onCancel: () => {
            console.info("TextPickerDialog:onCancel()")
          },
          onChange: (value: TextPickerResult) => {
            console.info("TextPickerDialog:onChange()" + JSON.stringify(value))
          }
        })
      })
    }
  }
}