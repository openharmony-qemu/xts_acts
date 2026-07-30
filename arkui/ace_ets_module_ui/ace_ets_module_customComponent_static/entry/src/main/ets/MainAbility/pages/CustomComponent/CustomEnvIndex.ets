'use static';

import {
  Entry, ComponentV2, Column, CustomEnv, Text, CustomEnvKey, FlexAlign
} from '@kit.ArkUI';

const testKey = CustomEnvKey.create<string | number>();
const testKey1 = CustomEnvKey.create<number>();
const testKey2 = CustomEnvKey.create<boolean>();
const testKey3 = CustomEnvKey.create<undefined>();
const testKey4 = CustomEnvKey.create<null>();
const testKey5 = CustomEnvKey.create<number>();
const testKey6 = CustomEnvKey.create<number>();
const testKey7 = CustomEnvKey.create<TestEnum>();
const testKey8 = CustomEnvKey.create<customEnvObj>();
const testKey9 = CustomEnvKey.create<Array<string>>();
const testKey10 = CustomEnvKey.create<CustomEnvValue>();
const testKey11 = CustomEnvKey.create<string>();

enum TestEnum {
  Enum1 = 'enum1',
  Enum2 = 'enum2'
}

interface customEnvObj {
  aa: string
}

class CustomEnvValue {
  public id: number = 123
}

@Entry
@ComponentV2
struct Index1 {
  build() {
    Column() {
      Child()
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}

@ComponentV2
struct Child {
  @CustomEnv('testKey') customProp: string | number = 'This is default value' + 737;
  @CustomEnv('testKey1') customProp1: number = 0.5;
  @CustomEnv('testKey2') customProp2: boolean = true;
  @CustomEnv('testKey4') customProp4: null = null;
  @CustomEnv('testKey5') customProp5: number = 0;
  @CustomEnv('testKey6') customProp6: number = -1;
  @CustomEnv('testKey7') customProp7: TestEnum = TestEnum.Enum1;
  @CustomEnv('testKey8') customProp8: customEnvObj = { aa: 'object pass' };
  @CustomEnv('testKey9') customProp9: Array<string> = ['1', '2'];
  @CustomEnv('testKey10') customProp10: CustomEnvValue = new CustomEnvValue();
  @CustomEnv('testKey11') customProp11: string = 'This is default value';

  build() {
    Column() {
      Text('联合类型:' + this.customProp)
        .id('text0')
      Text('小数:' + this.customProp1)
        .id('text1')
      Text('布尔:' + this.customProp2)
        .id('text2')
      Text('null:' + this.customProp4)
        .id('text3')
      Text('零:' + this.customProp5)
        .id('text5')
      Text('负数:' + this.customProp6)
        .id('text6')
      Text('枚举:' + this.customProp7)
        .id('text7')
      Text('对象:' + this.customProp8.aa)
        .id('text8')
      Text('数组:' + this.customProp9)
        .id('text9')
      Text('类:' + this.customProp10.id)
        .id('text10')
      Text('字符串:' + this.customProp11)
        .id('text11')
    }.width('100%')
    .height('100%')
  }
}