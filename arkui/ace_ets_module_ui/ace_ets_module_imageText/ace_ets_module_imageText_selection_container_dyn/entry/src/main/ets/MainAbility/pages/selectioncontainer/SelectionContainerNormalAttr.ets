/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
  SelectionContainer,
  SelectionContainerAttribute,
  SelectionContainerController,
  SelectionContainerTextJoinStyle
} from '@kit.ArkUI';

@Entry
@Component
struct SelectionContainerNormalAttr {
  private optionsController: SelectionContainerController = new SelectionContainerController();

  build() {
    Scroll() {
      Column({ space: 8 }) {
        // global SelectionContainer constructor without options
        SelectionContainer() {
          Column({ space: 4 }) {
            Text('Ctor text A').fontSize(16).copyOption(CopyOptions.InApp)
            Text('Ctor text B').fontSize(16).copyOption(CopyOptions.InApp)
          }
        }
        .id('sc_dyn_attr_ctor')
        .copyOption(CopyOptions.InApp)
        .width('100%')
        .border({ width: 1, color: '#DCDCDC' })
        .padding(8)

        // SelectionContainerOptions via controller (setSelectionContainerOptions coverage)
        SelectionContainer({ controller: this.optionsController }) {
          Text('Options controller').fontSize(16).copyOption(CopyOptions.InApp)
        }
        .id('sc_dyn_attr_options')
        .copyOption(CopyOptions.InApp)
        .width('100%')
        .border({ width: 1, color: '#DCDCDC' })
        .padding(8)

        SelectionContainer() {
          Text('textJoinStyle NEWLINE').fontSize(16).copyOption(CopyOptions.InApp)
        }
        .id('sc_dyn_attr_join_newline')
        .textJoinStyle(SelectionContainerTextJoinStyle.NEWLINE)
        .copyOption(CopyOptions.InApp)
        .width('100%')
        .border({ width: 1, color: '#DCDCDC' })
        .padding(8)

        SelectionContainer() {
          Text('textJoinStyle DIRECT').fontSize(16).copyOption(CopyOptions.InApp)
        }
        .id('sc_dyn_attr_join_direct')
        .textJoinStyle(SelectionContainerTextJoinStyle.DIRECT)
        .copyOption(CopyOptions.InApp)
        .width('100%')
        .border({ width: 1, color: '#DCDCDC' })
        .padding(8)

        SelectionContainer() {
          Text('copyOption InApp').fontSize(16).copyOption(CopyOptions.InApp)
        }
        .id('sc_dyn_attr_copy_inapp')
        .copyOption(CopyOptions.InApp)
        .width('100%')
        .border({ width: 1, color: '#DCDCDC' })
        .padding(8)

        SelectionContainer() {
          Text('copyOption LocalDevice').fontSize(16).copyOption(CopyOptions.InApp)
        }
        .id('sc_dyn_attr_copy_local')
        .copyOption(CopyOptions.LocalDevice)
        .width('100%')
        .border({ width: 1, color: '#DCDCDC' })
        .padding(8)

        SelectionContainer() {
          Text('caretColor Red').fontSize(16).copyOption(CopyOptions.InApp)
        }
        .id('sc_dyn_attr_caret_red')
        .caretColor(Color.Red)
        .copyOption(CopyOptions.InApp)
        .width('100%')
        .border({ width: 1, color: '#DCDCDC' })
        .padding(8)

        SelectionContainer() {
          Text('selectedBackgroundColor').fontSize(16).copyOption(CopyOptions.InApp)
        }
        .id('sc_dyn_attr_selected_bg')
        .selectedBackgroundColor('#33007DFF')
        .copyOption(CopyOptions.InApp)
        .width('100%')
        .border({ width: 1, color: '#DCDCDC' })
        .padding(8)

        SelectionContainer() {
          Text('enableHapticFeedback true').fontSize(16).copyOption(CopyOptions.InApp)
        }
        .id('sc_dyn_attr_haptic_true')
        .enableHapticFeedback(true)
        .copyOption(CopyOptions.InApp)
        .width('100%')
        .border({ width: 1, color: '#DCDCDC' })
        .padding(8)

        SelectionContainer() {
          Text('enableHapticFeedback false').fontSize(16).copyOption(CopyOptions.InApp)
        }
        .id('sc_dyn_attr_haptic_false')
        .enableHapticFeedback(false)
        .copyOption(CopyOptions.InApp)
        .width('100%')
        .border({ width: 1, color: '#DCDCDC' })
        .padding(8)
      }
      .width('100%')
      .padding(8)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
