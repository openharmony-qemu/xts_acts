import { LengthMetrics } from '@kit.ArkUI'

@Entry
@Component
struct IgnoreLayoutSafeAreaNullUndefinedTest {
  @State value1: Array<LayoutSafeAreaType> | null | undefined = [LayoutSafeAreaType.SYSTEM]
  @State value2: Array<LayoutSafeAreaEdge> | null | undefined = [LayoutSafeAreaEdge.START, LayoutSafeAreaEdge.TOP]

  build() {
    Column() {
      Stack() {
        Row()
          .backgroundColor(Color.Yellow)
          .width(75)  // 固定宽度
          .height(75) // 固定高度
          .ignoreLayoutSafeArea(this.value1, this.value2)
          .id('IgnoreLayoutSafeAreaNullUndefinedTest_row')

        Row()
          .backgroundColor(Color.Pink)
          .width(75)
          .height(75)

      }
      .width(150)
      .height(150)
      .backgroundColor(Color.Gray)
      .align(Alignment.TopStart)  // 子组件相对于Stack容器左上对齐
      .safeAreaPadding(LengthMetrics.vp(10))  // 设置10vp安全区内边距（即组件级安全区）

      Row() {
        Button('value1:null').onClick((event: ClickEvent) => {
          this.value1 = null
        })
          .width('25%')
          .id('IgnoreLayoutSafeAreaNullUndefinedTest_null_1')
        Button('value1:undefined').onClick((event: ClickEvent) => {
          this.value1 = undefined
        })
          .width('25%')
          .id('IgnoreLayoutSafeAreaNullUndefinedTest_undefined_1')
        Button('value1:[]').onClick((event: ClickEvent) => {
          this.value1 = []
        })
          .width('25%')
          .id('IgnoreLayoutSafeAreaNullUndefinedTest_empty_1')
        Button('value1:SYSTEM').onClick((event: ClickEvent) => {
          this.value1 = [LayoutSafeAreaType.SYSTEM]
        })
          .width('25%')
          .id('IgnoreLayoutSafeAreaNullUndefinedTest_valid_1')
      }
      Row() {
        Button('value2:null').onClick((event: ClickEvent) => {
          this.value2 = null
        })
          .width('25%')
          .id('IgnoreLayoutSafeAreaNullUndefinedTest_null_2')
        Button('value2:undefined').onClick((event: ClickEvent) => {
          this.value2 = undefined
        })
          .width('25%')
          .id('IgnoreLayoutSafeAreaNullUndefinedTest_undefined_2')
        Button('value2:[]').onClick((event: ClickEvent) => {
          this.value2 = []
        })
          .width('25%')
          .id('IgnoreLayoutSafeAreaNullUndefinedTest_empty_2')
        Button('value2:SYSTEM').onClick((event: ClickEvent) => {
          this.value2 = [LayoutSafeAreaEdge.START, LayoutSafeAreaEdge.TOP]
        })
          .width('25%')
          .id('IgnoreLayoutSafeAreaNullUndefinedTest_valid_2')
      }
    }
    .width('100%')
  }
}