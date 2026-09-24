/*
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

@Entry
@Component
struct GameCtrollerCallBackDataPage {
  @State axisValue: string = '';
  private intervalNum: number = 0;

  aboutToAppear(): void {
    AppStorage.setOrCreate('absX', 0);
    AppStorage.setOrCreate('absY', 0);
    AppStorage.setOrCreate('absZ', 0);
    AppStorage.setOrCreate('absRz', 0);
    AppStorage.setOrCreate('absGas', 0);
    AppStorage.setOrCreate('absBrake', 0);
    AppStorage.setOrCreate('absHat0X', 0);
    AppStorage.setOrCreate('absHat0Y', 0);
  }

  onPageShow() {
    this.getUIContext().getFocusController().requestFocus('focesss');
    this.intervalNum = setInterval(() => {
      let x: number = AppStorage.get<number>('absX') ?? 0;
      if (x !== 0) {
        AppStorage.setOrCreate('axisReady', true);
      }
    }, 500);
  }

  onPageHide() {
    clearInterval(this.intervalNum);
    this.getUIContext().getFocusController().activate(false);
  }

  aboutToDisappear() {
    clearInterval(this.intervalNum);
    this.getUIContext().getFocusController().activate(false);
  }

  build() {
    Column() {
      Text('GameCtrollerCallBackData Ready')
        .fontSize(20)
        .fontColor(Color.Black)
        .margin({ top: 20 })

      Button('FocusAxisEvent')
        .id('focesss')
        .width('60%')
        .height('10%')
        .defaultFocus(true)
        .onFocusAxisEvent((event: FocusAxisEvent) => {
          let absX = event.axisMap.get(AxisModel.ABS_X);
          let absY = event.axisMap.get(AxisModel.ABS_Y);
          let absZ = event.axisMap.get(AxisModel.ABS_Z);
          let absRz = event.axisMap.get(AxisModel.ABS_RZ);
          let absGas = event.axisMap.get(AxisModel.ABS_GAS);
          let absBrake = event.axisMap.get(AxisModel.ABS_BRAKE);
          let absHat0X = event.axisMap.get(AxisModel.ABS_HAT0X);
          let absHat0Y = event.axisMap.get(AxisModel.ABS_HAT0Y);
          let absRx = event.axisMap.get(AxisModel.ABS_RX);
          let absRy = event.axisMap.get(AxisModel.ABS_RY);
          let absThrottle = event.axisMap.get(AxisModel.ABS_THROTTLE);
          let absRudder = event.axisMap.get(AxisModel.ABS_RUDDER);
          let absWheel = event.axisMap.get(AxisModel.ABS_WHEEL);
          let absHat1X = event.axisMap.get(AxisModel.ABS_HAT1X);
          let absHat1Y = event.axisMap.get(AxisModel.ABS_HAT1Y);
          let absHat2X = event.axisMap.get(AxisModel.ABS_HAT2X);
          let absHat2Y = event.axisMap.get(AxisModel.ABS_HAT2Y);
          let absHat3X = event.axisMap.get(AxisModel.ABS_HAT3X);
          let absHat3Y = event.axisMap.get(AxisModel.ABS_HAT3Y);
          this.axisValue = 'absX:' + absX + '\nabsY:' + absY + '\nabsZ:' + absZ + '\nabsRz:' + absRz +
            '\nabsRx:' + absRx + '\nabsRy:' + absRy +
            '\nabsGas:' + absGas + '\nabsBrake:' + absBrake +
            '\nabsThrottle:' + absThrottle + '\nabsRudder:' + absRudder + '\nabsWheel:' + absWheel +
            '\nabsHat0X:' + absHat0X + '\nabsHat0Y:' + absHat0Y +
            '\nabsHat1X:' + absHat1X + '\nabsHat1Y:' + absHat1Y +
            '\nabsHat2X:' + absHat2X + '\nabsHat2Y:' + absHat2Y +
            '\nabsHat3X:' + absHat3X + '\nabsHat3Y:' + absHat3Y;
          AppStorage.setOrCreate('absX', absX ?? 0);
          AppStorage.setOrCreate('absY', absY ?? 0);
          AppStorage.setOrCreate('absZ', absZ ?? 0);
          AppStorage.setOrCreate('absRz', absRz ?? 0);
          AppStorage.setOrCreate('absGas', absGas ?? 0);
          AppStorage.setOrCreate('absBrake', absBrake ?? 0);
          AppStorage.setOrCreate('absHat0X', absHat0X ?? 0);
          AppStorage.setOrCreate('absHat0Y', absHat0Y ?? 0);
        })

      Text(this.axisValue)
        .fontSize(12)
        .fontColor(Color.Black)
        .width('90%')
        .height('50%')
        .padding(5)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
    .justifyContent(FlexAlign.Center)
  }
}
