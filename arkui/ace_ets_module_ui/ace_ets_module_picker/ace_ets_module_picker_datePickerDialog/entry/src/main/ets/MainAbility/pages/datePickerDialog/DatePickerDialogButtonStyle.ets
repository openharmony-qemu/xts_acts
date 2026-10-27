/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
@Entry
@Component
struct DatePickerDialogButtonStylePage {
  private selectedDate: Date = new Date('2010-1-1')
  @State acceptButtonStyle_Text: string = '';
  @State DatePicker_Options: DatePickerDialogOptions = {
    start: new Date('2000-1-1'),
    end: new Date('2100-12-31'),
    selected: this.selectedDate,
    showTime: true,
    useMilitaryTime: false,
    disappearTextStyle: { color: Color.Pink, font: { size: '22fp', weight: FontWeight.Bold } },
    textStyle: { color: '#ff00ff00', font: { size: '18fp', weight: FontWeight.Normal } },
    selectedTextStyle: { color: '#ff182431', font: { size: '14fp', weight: FontWeight.Regular } },
    acceptButtonStyle: {
      type: ButtonType.Normal,
      style: ButtonStyleMode.NORMAL,
      role: ButtonRole.NORMAL,
      fontColor: Color.Red,
      fontSize: '26fp',
      fontWeight: FontWeight.Bolder,
      fontStyle: FontStyle.Normal,
      fontFamily: 'sans-serif',
      backgroundColor: '#80834511',
      borderRadius: 20
    },
    cancelButtonStyle: {
      type: ButtonType.Normal,
      style: ButtonStyleMode.NORMAL,
      role: ButtonRole.NORMAL,
      fontColor: Color.Blue,
      fontSize: '16fp',
      fontWeight: FontWeight.Normal,
      fontStyle: FontStyle.Italic,
      fontFamily: 'sans-serif',
      backgroundColor: '#50182431',
      borderRadius: 10
    },
  };

  build() {
    Column() {
      Text(this.acceptButtonStyle_Text)
        .id('acceptButtonStyle_Text')
        .margin(20)
      Button('DatePickerDialog')
        .margin(20)
        .onClick(() => {
          DatePickerDialog.show(this.DatePicker_Options)
          if (this.DatePicker_Options.acceptButtonStyle!.type == ButtonType.Normal) {
            this.acceptButtonStyle_Text = 'acceptButtonStyle_Text'
          }
        })
        .id('DateButtonStyle')
    }.width('100%').height('100%')
  }
}
