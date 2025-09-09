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
  $r,
  $rawfile,
  AlphabetIndexer,
  ArrowPosition,
  Axis,
  BlurStyle,
  Button,
  CalendarAlign,
  CalendarPicker,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Curve,
  Date,
  EdgeEffect,
  Entry,
  Flex,
  FlexDirection,
  FontWeight,
  ForEach,
  ItemAlign,
  Margin,
  MenuAlignType,
  PickerTextStyle,
  PlaybackSpeed,
  Resource,
  Row,
  Select,
  Swiper,
  SwiperDisplayMode,
  Text,
  TextAlign,
  TextInputController,
  TextPicker,
  Video,
  Week
} from '@ohos.arkui.component';
import { AppStorage, Link, PropRef, State, } from '@ohos.arkui.stateManagement';


@Entry
@Component
struct TextPickerExample {
  build() {
    Column() {
      Button("change value").onClick((e: ClickEvent) => {

      }).key("changeButton")

      TextPicker({ range: ['peach1', 'peach2', 'peach3', 'peach4'] })
        .selectedIndex(3)
        .key('textPickerDefault1')

      TextPicker({ range: ['peach1', 'peach2', 'peach3', 'peach4'] })

        .key('textPicker')
    }
  }
}