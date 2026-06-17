'use static';
import { Entry, Text, Column, Component, Button, ClickEvent, Flex, FlexAlign, Padding, Margin, Row, Visibility, ColumnOptions, HorizontalAlign, AttributeModifier, ButtonAttribute, Color, ResourceColor, LoadingProgressAttribute, Scroll, Scroller, ContentModifier, FontWeight, Gauge, TextAlign, TextOverflow, ForEach, wrapBuilder, Circle, Builder, LoadingProgress, List, ListItem, WrappedBuilder, LoadingProgressConfiguration, QRCode } from '@ohos.arkui.component';
import { State, Observed } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog';
@Observed
export class MyEnableModifier implements AttributeModifier<LoadingProgressAttribute> {
  public change: boolean | undefined = true;

  public enableLoading_:boolean | undefined = false

  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    if (this.change) {
      instance.width(140).height(140)
        .enableLoading(this.enableLoading_)
        .layoutWeight(1)
    } else {
      instance.width(140).height(140)
        .enableLoading(undefined)
        .layoutWeight(1)
    }
  }
}

// xxx.ets
@Entry
@Component
struct QRCodeExample {
  @State modifier4: MyEnableModifier = new MyEnableModifier()

  aboutToAppear() {
    this.modifier4.change = true
  }
  build() {
    Column() {
      LoadingProgress()
        .attributeModifier(this.modifier4)
        .id('enableLoadingModifier')

      Button('Change').onClick(() => {
        this.modifier4.enableLoading_ = this.modifier4.enableLoading_ === undefined ? false : undefined;
      })
        .id('changeButton')
    }.width('100%')
  }
}
