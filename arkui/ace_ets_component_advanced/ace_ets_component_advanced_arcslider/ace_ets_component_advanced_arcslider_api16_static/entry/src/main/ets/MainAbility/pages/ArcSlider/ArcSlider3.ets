// import { ArcSlider, ArcSliderOptions, ArcSliderPosition, ArcSliderValueOptions, ArcSliderLayoutOptions, ArcSliderStyleOptions, ArcSliderValueOptionsConstructorOptions, ArcSliderLayoutOptionsConstructorOptions, ArcSliderStyleOptionsConstructorOptions, ArcSliderOptionsConstructorOptions } from '@ohos.arkui.advanced.ArcSlider'
import display from '@ohos.display';
import { Entry, ComponentV2, Scroll, Column, List, ListItem, Color, ColumnOptions, Stack, Button, Position } from '@ohos.arkui.component'
import { Local  } from '@ohos.arkui.stateManagement';
@Entry
@ComponentV2
struct ArcSlider3 {
  @Local isClicked: string = 'false';
  // x: number = (display.getDefaultDisplaySync().width > 500) ? px2vp(673):px2vp(416);
  // y: number = (display.getDefaultDisplaySync().width > 500) ? px2vp(402):px2vp(261);
  // valueOptionsConstructorOptions: ArcSliderValueOptionsConstructorOptions = {
  //   progress: 50,
  //   min: 5,
  //   max: 95
  // }
  //
  // layoutOptionsConstructorOptions: ArcSliderLayoutOptionsConstructorOptions = {
  //   reverse: true,
	//   position: ArcSliderPosition.RIGHT
  // }
  //
  // styleOptionsConstructorOptions: ArcSliderStyleOptionsConstructorOptions = {
  //   trackThickness: 16,
  //   activeTrackThickness: 36,
  //   trackColor: '#999999',
  //   selectedColor: '#00FF00',
  //   trackBlur: 20
  // }
  // valueOptions: ArcSliderValueOptions = new ArcSliderValueOptions(this.valueOptionsConstructorOptions)
  // layoutOptions: ArcSliderLayoutOptions = new ArcSliderLayoutOptions(this.layoutOptionsConstructorOptions)
  // styleOptions: ArcSliderStyleOptions = new ArcSliderStyleOptions(this.styleOptionsConstructorOptions)
  // arcSliderOptionsConstructorOptions: ArcSliderOptionsConstructorOptions = {
  //   valueOptions: this.valueOptions,
  //   layoutOptions: this.layoutOptions,
  //   styleOptions: this.styleOptions,
  //   digitalCrownSensitivity:CrownSensitivity.LOW,
  //   onTouch: (event: TouchEvent) => {
  //   },
  //   onChange: (progress: number) => {
  //   },
  //   onEnlarge: (isEnlarged: boolean) => {
  //   }
  // }
  // arcSliderOptions: ArcSliderOptions = new ArcSliderOptions(this.arcSliderOptionsConstructorOptions)

  build() {
      Column({ space: 5 } as ColumnOptions) {
        List({ space: 5, initialIndex: 0 }) {
          ListItem() {
            Stack() {
              Button(this.isClicked).key('buttonTest')//.position({x: this.x, y: this.y} as Position)
              .onClick(()=>{
                if(this.isClicked === 'false') {
                  this.isClicked = 'true';
                }else {
                  this.isClicked = 'false';
                }
              })
              // ArcSlider({ options: this.arcSliderOptions })
            }
          }.backgroundColor(Color.Black)
        }
      }
  }
}