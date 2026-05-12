
import { Entry, Text, TextAttribute, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import hilog from '@ohos.hilog'

class DemoTypeNameClass {
  public static returnBool(): boolean { return true; }
  public static returnNumber(): number { return 1.0; }
  public static returnChar(): string { return 'a'; }
  public static boolParam(value: boolean): void {}
  public static numberParam(value: number): void {}
  public static charParam(value: string): void {}
}
let cls6 = Class.from<DemoTypeNameClass>();
console.info(`[Issue6] boolean return type: ${cls6.getStaticMethod('returnBool')!.getReturnType().getName()}`);
// 输出: "u1" (脑图预期 "bool")
console.info(`[Issue6] number return type: ${cls6.getStaticMethod('returnNumber')!.getReturnType().getName()}`);
// 输出: "f64" (脑图预期 "number")
console.info(`[Issue6] char return type: ${cls6.getStaticMethod('returnChar')!.getReturnType().getName()}`);
// 输出: "u16" (脑图预期 "u8")
console.info(`[Issue6] int param type: ${cls6.getStaticMethod('boolParam')!.getParameterType(0)!.getName()}`);


@Entry
@Component
struct MyStateSample {
  @State stateVar: string = 'state var';
  message: string = 'var';
  changeValue() {
    this.stateVar+='~'
  }
  build() {
    Column(undefined) {
      Text('Hello World').fontSize(20)
      Button(this.message).backgroundColor('#FFFF00FF')
        .onClick((e: ClickEvent) => {
          hilog.info(0x0000, 'testTag', 'On Click');
          this.changeValue();
        })
      Text(this.stateVar).fontSize(20)
      Child({stateVar: this.stateVar} as __Options_Child)
    }
  }
}

@Component
struct Child {
  @State stateVar: string = 'Child';
  build() {
    Text(this.stateVar).fontSize(50)
  }
}
